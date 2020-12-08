Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D99C2D3392
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 21:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgLHUWG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 15:22:06 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:59348 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727974AbgLHUVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 15:21:48 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 6F523176354
        for <linux-usb@vger.kernel.org>; Tue,  8 Dec 2020 12:31:58 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id miiLkEADth41lmiiMkG3xx; Tue, 08 Dec 2020 12:31:58 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=O5cXQi1W c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=1XWaLZrsAAAA:8
 a=_jlGtV7tAAAA:8 a=khyp7Ak2u8PIEQnDyBEA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3N1Flz6TgBkpfD+UwCLCVIxgPPeVVI2f0sg4gm1lpf4=; b=JlxpFsdLf+IPGtib4foFebDKnD
        CeOGa9YL3rGLi99sfp093+g6WGJxpWsIKr6AFAuu6T7ehgmkw67LPjm1G1H4YfUbDV9JOJAzNy+g7
        1pesHGS7004e6WTlkjFgRT3xP4o2DhP7vrVs7TOzPE2NUm7HFIq16K5OoCltg29kIOpUYbmsHMB9W
        on3m71IuG0Xxw+GIx+TI7BX6kjrInlFrIaO3+Z6uA42OHJdsvZMdNMRjU/DlW5O+tThyvwOlquCEv
        8I64OKpCNz29QIVVPCZFbny8gApOnCZLMZDqMcDcupB/9cgSC1QWGBlBgS2Zt9vWxX1FJHEOcUbMN
        zIPepJMw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40854 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kmiiL-001sxW-DS; Tue, 08 Dec 2020 19:31:57 +0000
Date:   Tue, 8 Dec 2020 11:31:56 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: tcpm: Introduce vsafe0v for vbus
Message-ID: <20201208193156.GA71189@roeck-us.net>
References: <20201202040840.663578-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201202040840.663578-1-badhri@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kmiiL-001sxW-DS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:40854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 01, 2020 at 08:08:38PM -0800, Badhri Jagan Sridharan wrote:
> TCPM at present lacks the notion of VSAFE0V. There
> are three vbus threshold levels that are critical to track:
> a. vSafe5V         - VBUS “5 volts” as defined by the USB
>                      PD specification.
> b. vSinkDisconnect - Threshold used for transition from
>                      Attached.SNK to Unattached.SNK.
> c. vSafe0V         - VBUS “0 volts” as defined by the USB
>                      PD specification.
> 
> Tracking vSafe0V is crucial for entry into Try.SNK and
> Attached.SRC and turning vbus back on by the source in
> response to hard reset.
> 
> From "4.5.2.2.8.2 Exiting from AttachWait.SRC State" section
> in the Type-C spec:
> 
> "The port shall transition to Attached.SRC when VBUS is at
> vSafe0V and the SRC.Rd state is detected on exactly one of
> the CC1 or CC2 pins for at least tCCDebounce."
> 
> "A DRP that strongly prefers the Sink role may optionally
> transition to Try.SNK instead of Attached.SRC when VBUS
> is at vSafe0V and the SRC.Rd state is detected on exactly
> one of the CC1 or CC2 pins for at least tCCDebounce."
> 
> From "7.1.5 Response to Hard Resets" section in the PD spec:
> 
> "After establishing the vSafe0V voltage condition on VBUS,
> the Source Shall wait tSrcRecover before re-applying VCONN
> and restoring VBUS to vSafe5V."
> 
> vbus_present in the TCPM code tracks vSafe5V(vbus_present is true)
> and vSinkDisconnect(vbus_present is false).
> 
> This change adds is_vbus_vsafe0v callback which when set makes
> TCPM query for vSafe0V voltage level when needed.
> 
> Since not all TCPC controllers might have the capability
> to report vSafe0V, TCPM assumes that vSafe0V is same as
> vSinkDisconnect when is_vbus_vsafe0v callback is not set.
> This allows TCPM to continue to support controllers which don't
> have the support for reporting vSafe0V.
> 
> Introducing vSafe0V helps fix the failure reported at
> "Step 15. CVS verifies PUT remains in AttachWait.SRC for 500ms"
> of "TD 4.7.2 Try. SNK DRP Connect DRP Test" of
> "Universal Serial Bus Type-C (USB Type-C) Functional Test
> Specification Chapters 4 and 5". Here the compliance tester
> intentionally maintains vbus at greater than vSafe0V and expects
> the Product under test to stay in AttachWait.SRC till vbus drops
> to vSafe0V.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v1:
> - Changed return type to bool instead of int for
>   is_vbus_vsafe0v as suggested by Guenter and updated
>   the documentation.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 63 +++++++++++++++++++++++++++++------
>  include/linux/usb/tcpm.h      |  7 ++++
>  2 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 3bbc1f10af49..4cd6e0196f94 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -258,7 +258,19 @@ struct tcpm_port {
>  	bool attached;
>  	bool connected;
>  	enum typec_port_type port_type;
> +
> +	/*
> +	 * Set to true when vbus is greater than VSAFE5V min.
> +	 * Set to false when vbus falls below vSinkDisconnect max threshold.
> +	 */
>  	bool vbus_present;
> +
> +	/*
> +	 * Set to true when vbus is less than VSAFE0V max.
> +	 * Set to false when vbus is greater than VSAFE0V max.
> +	 */
> +	bool vbus_vsafe0v;
> +
>  	bool vbus_never_low;
>  	bool vbus_source;
>  	bool vbus_charge;
> @@ -3094,7 +3106,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		else if (tcpm_port_is_audio(port))
>  			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
> -		else if (tcpm_port_is_source(port))
> +		else if (tcpm_port_is_source(port) && port->vbus_vsafe0v)
>  			tcpm_set_state(port,
>  				       tcpm_try_snk(port) ? SNK_TRY
>  							  : SRC_ATTACHED,
> @@ -4097,6 +4109,12 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
>  {
>  	tcpm_log_force(port, "VBUS on");
>  	port->vbus_present = true;
> +	/*
> +	 * When vbus_present is true i.e. Voltage at VBUS is greater than VSAFE5V implicitly
> +	 * states that vbus is not at VSAFE0V, hence clear the vbus_vsafe0v flag here.
> +	 */
> +	port->vbus_vsafe0v = false;
> +
>  	switch (port->state) {
>  	case SNK_TRANSITION_SINK_VBUS:
>  		port->explicit_contract = true;
> @@ -4186,16 +4204,8 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
>  	case SNK_HARD_RESET_SINK_OFF:
>  		tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
>  		break;
> -	case SRC_HARD_RESET_VBUS_OFF:
> -		/*
> -		 * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> -		 * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> -		 */
> -		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> -		break;
>  	case HARD_RESET_SEND:
>  		break;
> -
>  	case SNK_TRY:
>  		/* Do nothing, waiting for timeout */
>  		break;
> @@ -4266,6 +4276,28 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
>  	}
>  }
>  
> +static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
> +{
> +	tcpm_log_force(port, "VBUS VSAFE0V");
> +	port->vbus_vsafe0v = true;
> +	switch (port->state) {
> +	case SRC_HARD_RESET_VBUS_OFF:
> +		/*
> +		 * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> +		 * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> +		 */
> +		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> +		break;
> +	case SRC_ATTACH_WAIT:
> +		if (tcpm_port_is_source(port))
> +			tcpm_set_state(port, tcpm_try_snk(port) ? SNK_TRY : SRC_ATTACHED,
> +				       PD_T_CC_DEBOUNCE);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static void _tcpm_pd_hard_reset(struct tcpm_port *port)
>  {
>  	tcpm_log_force(port, "Received hard reset");
> @@ -4301,10 +4333,19 @@ static void tcpm_pd_event_handler(struct kthread_work *work)
>  			bool vbus;
>  
>  			vbus = port->tcpc->get_vbus(port->tcpc);
> -			if (vbus)
> +			if (vbus) {
>  				_tcpm_pd_vbus_on(port);
> -			else
> +			} else {
>  				_tcpm_pd_vbus_off(port);
> +				/*
> +				 * When TCPC does not support detecting vsafe0v voltage level,
> +				 * treat vbus absent as vsafe0v. Else invoke is_vbus_vsafe0v
> +				 * to see if vbus has discharge to VSAFE0V.
> +				 */
> +				if (!port->tcpc->is_vbus_vsafe0v ||
> +				    port->tcpc->is_vbus_vsafe0v(port->tcpc))
> +					_tcpm_pd_vbus_vsafe0v(port);
> +			}
>  		}
>  		if (events & TCPM_CC_EVENT) {
>  			enum typec_cc_status cc1, cc2;
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index e68aaa12886f..3e39874cfac4 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -98,6 +98,12 @@ enum tcpm_transmit_type {
>   *		will be turned on. requested_vbus_voltage is set to 0 when vbus
>   *		is going to disappear knowingly i.e. during PR_SWAP and
>   *		HARD_RESET etc.
> + * @is_vbus_vsafe0v:
> + *		Optional; TCPCI spec based TCPC implementations are expected to
> + *		detect VSAFE0V voltage level at vbus. When detection of VSAFE0V
> + *		is supported by TCPC, set this callback for TCPM to query
> + *		whether vbus is at VSAFE0V when needed.
> + *		Returns true when vbus is at VSAFE0V, false otherwise.
>   */
>  struct tcpc_dev {
>  	struct fwnode_handle *fwnode;
> @@ -128,6 +134,7 @@ struct tcpc_dev {
>  	int (*enable_auto_vbus_discharge)(struct tcpc_dev *dev, bool enable);
>  	int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
>  						 bool pps_active, u32 requested_vbus_voltage);
> +	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
>  };
>  
>  struct tcpm_port;
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 
