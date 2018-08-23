#include "vdelayfb.h"


// Millisecond scale factor
static const double MILLIS = 0.001;


/**
 * VDelayFB implements a variable delay in the spirit of the existing vdelay opcode with the
 * addition of optional feedback allowing it to easily be used in both chorus and flanging
 * scenarios.
 *
 *
 */
struct VDelayFB : csnd::Plugin<1, 4> {

    csnd::AuxMem<MYFLT> m_delay;

    /** current buffer position */
    int32_t m_pos;

    /** Maximum delay samples */
    MYFLT m_maxdelay;

    /** Need samples per millisecond as imaxdel is specified in milliseconds */
    MYFLT m_samples_per_ms;

    /** Holds feedback sample to mix in to delay buffer */
    MYFLT m_feedback;

    int init() {

        m_pos = 0;

        m_samples_per_ms = csound->sr() * MILLIS;

        m_maxdelay = m_samples_per_ms * inargs[2];

        // Compute size of working buffer and round up
        //
        uint32_t n = (uint32_t) (m_maxdelay + 1);

        m_delay.allocate(csound, n);

        m_feedback = 0;
	
	

       

        return OK;
    }


    int aperf() {


        MYFLT *out = outargs(0);

        MYFLT *in = inargs(0);

        MYFLT *delay = inargs(1);

        MYFLT feedback_ratio = inargs[3];

        int32_t indx = m_pos;


        for (int32_t nn = offset; nn < nsmps; nn++) {

            m_delay[indx] = in[nn] + (m_feedback * feedback_ratio);

            MYFLT tap_pos = get_tap_position(delay[nn], indx);

            out[nn] = m_feedback = interpolate(tap_pos);

            // Advance pointer and wrap around if necessary
            indx = (indx == m_delay.len() - 1 ? 0 : indx + 1);
        }

        m_pos = indx; // keep track of where we are.

        return OK;
    }

    /**
     * Calculate the next delay tap position relative to the current
     * position.
     *
     * @param delay_value the current value of the variable delay signal
     * @param indx the current buffer position
     * @return the new delay tap position
     */
    MYFLT get_tap_position(const MYFLT delay_value, int32_t indx) const {

        MYFLT tap_pos = indx - (delay_value * m_samples_per_ms);

        // Make sure pointers are inside the buffer bounds
        while (tap_pos < 0.0) {
            tap_pos += m_maxdelay;
        }

        while (tap_pos >= m_maxdelay) {
            tap_pos -= m_maxdelay;
        }
        return tap_pos;
    }


    /**
     * Get the next output sample by performing a simple linear interpolation on
     * the delay buffer.
     *
     * @param tap_pos the index of the delay tap
     * @return the interpolated sample to be written out
     */
    MYFLT interpolate(MYFLT tap_pos) const {

        // Find next sample for interpolation
        MYFLT interpolation_value_pos = (tap_pos < m_maxdelay - 1) ? tap_pos + 1.0 : 0.0;

        auto _idx1 = (int32_t) tap_pos;
        auto _idx2 = (int32_t) interpolation_value_pos;

        // interpolate
        return m_delay[_idx1] + (tap_pos - _idx1) * (m_delay[_idx2] - m_delay[_idx1]);
    }
};


/**
 * Register the opcode with the <code>csound</code> engine.
 * @param csound engine instance
 */
void csnd::on_load(Csound *csound) {
    csnd::plugin<VDelayFB>(csound, "vdelayfb", "a", "aaik", thread::ia);
}
