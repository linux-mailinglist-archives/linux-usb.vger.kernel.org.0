Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1094D24B098
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 09:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHTH4F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 03:56:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:9761 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgHTH4E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 03:56:04 -0400
IronPort-SDR: Ti1O6pi2xnKisCXPah8H09oH2IWiPRS57N6TS9XoCLZ7FRBMg1P/QFUQBIbCkxqHCojik+oREU
 0GTg2K4qIFxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="152855754"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="152855754"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 00:56:00 -0700
IronPort-SDR: rtLfZBVICcfOQn4f0tiGnT12EeQCPphOc48MVm+Z+hFBaoJJtAQAYyvU5CxqOu2o98oSGUdVxA
 s65Go2woLUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="401072922"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 Aug 2020 00:55:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 20 Aug 2020 10:55:57 +0300
Date:   Thu, 20 Aug 2020 10:55:57 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: tcpm: Fix Fix source hard reset response
 for TDA 2.3.1.1 and TDA 2.3.1.2 failures
Message-ID: <20200820075557.GD3055713@kuha.fi.intel.com>
References: <20200817184601.1899929-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817184601.1899929-1-badhri@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 11:46:01AM -0700, Badhri Jagan Sridharan wrote:
> The patch addresses the compliance test failures while running  TDA
> 2.3.1.1 and  TDA 2.3.1.2 of the "PD Communications Engine USB PD
> Compliance MOI" test plan published in https://www.usb.org/usbc.
> For a product to be Type-C compliant, it's expected that these tests
> are run on usb.org certified Type-C compliance tester as mentioned in
> https://www.usb.org/usbc.
> 
> While the purpose of TDA 2.3.1.1 and  TDA 2.3.1.2 is to verify that
> the static and dynamic electrical capabilities of a Source meet the
> requirements for each PDO offered,  while doing so, the tests also
> monitor that the timing of the VBUS waveform versus the messages meets
> the requirements for Hard Reset defined in PROT-PROC-HR-TSTR as
> mentioned in step 11 of TDA.2.3.1.1 and step 15 of TDA.2.3.1.2.
> 
> TDB.2.2.13.1: PROT-PROC-HR-TSTR Procedure and Checks for Tester
> Originated Hard Reset
> Purpose: To perform the appropriate protocol checks relating to any
> circumstance in which the Hard Reset signal is sent by the Tester.
> 
> UUT is behaving as source:
> The Tester sends a Hard Reset signal.
> 1. Check VBUS stays within present valid voltage range for
> tPSHardReset min (25ms) after last bit of Hard Reset signal.
> [PROT_PROC_HR_TSTR_1]
> 2. Check that VBUS starts to fall below present valid voltage range by
> tPSHardReset max (35ms). [PROT_PROC_HR_TSTR_2]
> 3. Check that VBUS reaches vSafe0V within tSafe0v max (650 ms).
> [PROT_PROC_HR_TSTR_3]
> 4. Check that VBUS starts rising to vSafe5V after a delay of
> tSrcRecover (0.66s - 1s) from reaching vSafe0V. [PROT_PROC_HR_TSTR_4]
> 5. Check that VBUS reaches vSafe5V within tSrcTurnOn max (275ms) of
> rising above vSafe0v max (0.8V). [PROT_PROC_HR_TSTR_5] Power Delivery
> Compliance Plan 139 6. Check that Source Capabilities are finished
> sending within tFirstSourceCap max (250ms) of VBUS reaching vSafe5v
> min. [PROT_PROC_HR_TSTR_6].
> 
> This is in line with 7.1.5 Response to Hard Resets of the USB Power
> Delivery Specification Revision 3.0, Version 1.2,
> "Hard Reset Signaling indicates a communication failure has occurred
> and the Source Shall stop driving VCONN, Shall remove Rp from the
> VCONN pin and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The
> USB connection May reset during a Hard Reset since the VBUS voltage
> will be less than vSafe5V for an extended period of time. After
> establishing the vSafe0V voltage condition on VBUS, the Source Shall
> wait tSrcRecover before re-applying VCONN and restoring VBUS to
> vSafe5V. A Source Shall conform to the VCONN timing as specified in
> [USB Type-C 1.3]."
> 
> With the above guidelines from the spec in mind, TCPM does not turn
> off VCONN while entering SRC_HARD_RESET_VBUS_OFF. The patch makes TCPM
> turn off VCONN while entering SRC_HARD_RESET_VBUS_OFF and turn it back
> on while entering SRC_HARD_RESET_VBUS_ON along with vbus instead of
> having VCONN on through hardreset.
> 
> Also, the spec clearly states that "After establishing the vSafe0V
> voltage condition on VBUS",  the Source Shall wait tSrcRecover before
> re-applying VCONN and restoring VBUS to vSafe5V.
> TCPM does not conform to this requirement. If the TCPC driver calls
> tcpm_vbus_change with vbus off signal, TCPM right away enters
> SRC_HARD_RESET_VBUS_ON without waiting for tSrcRecover.
> For TCPC's which are buggy/does not call tcpm_vbus_change, TCPM
> assumes that the vsafe0v is instantaneous as TCPM only waits
> tSrcRecover instead of waiting for tSafe0v + tSrcRecover.
> This patch also fixes this behavior by making sure that TCPM waits for
> tSrcRecover before transitioning into SRC_HARD_RESET_VBUS_ON when
> tcpm_vbus_change is called by TCPC.
> When TCPC does not call tcpm_vbus_change, TCPM assumes the worst case
> i.e.  tSafe0v + tSrcRecover before transitioning into
> SRC_HARD_RESET_VBUS_ON.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since V1 (Guenter's suggestion):
> - Bound SRC_HARD_RESET_VBUS_ON to accommodate tcpc drivers which doesn't
>   update the vbus status.
> 
> Changes since V2:
> - Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Changes since V3:
> - Fixed compliance test numbers and updated commit description and made
>   in more elaborate to address Heikki's suggestion.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 3ef37202ee37..a48e3f90d196 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3372,13 +3372,31 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
>  		break;
>  	case SRC_HARD_RESET_VBUS_OFF:
> -		tcpm_set_vconn(port, true);
> +		/*
> +		 * 7.1.5 Response to Hard Resets
> +		 * Hard Reset Signaling indicates a communication failure has occurred and the
> +		 * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> +		 * drive VBUS to vSafe0V as shown in Figure 7-9.
> +		 */
> +		tcpm_set_vconn(port, false);
>  		tcpm_set_vbus(port, false);
>  		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
>  			       tcpm_data_role_for_source(port));
> -		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> +		/*
> +		 * If tcpc fails to notify vbus off, TCPM will wait for PD_T_SAFE_0V +
> +		 * PD_T_SRC_RECOVER before turning vbus back on.
> +		 * From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
> +		 * 4. Policy Engine waits tPSHardReset after sending Hard Reset Signaling and then
> +		 * tells the Device Policy Manager to instruct the power supply to perform a
> +		 * Hard Reset. The transition to vSafe0V Shall occur within tSafe0V (t2).
> +		 * 5. After tSrcRecover the Source applies power to VBUS in an attempt to
> +		 * re-establish communication with the Sink and resume USB Default Operation.
> +		 * The transition to vSafe5V Shall occur within tSrcTurnOn(t4).
> +		 */
> +		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SAFE_0V + PD_T_SRC_RECOVER);
>  		break;
>  	case SRC_HARD_RESET_VBUS_ON:
> +		tcpm_set_vconn(port, true);
>  		tcpm_set_vbus(port, true);
>  		port->tcpc->set_pd_rx(port->tcpc, true);
>  		tcpm_set_attached_state(port, true);
> @@ -3944,7 +3962,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
>  		tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
>  		break;
>  	case SRC_HARD_RESET_VBUS_OFF:
> -		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> +		/*
> +		 * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> +		 * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> +		 */
> +		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
>  		break;
>  	case HARD_RESET_SEND:
>  		break;
> -- 
> 2.28.0.236.gb10cc79966-goog

-- 
heikki
