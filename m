Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0E52F31C5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 14:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbhALNbR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 08:31:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:43716 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbhALNbR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 08:31:17 -0500
IronPort-SDR: /AR1I6y7nWZH3zuo65UXrOkscLwvTkntuumVqLbAJgcN5q63zPL1gS8xD9v+gGZS7DZw8GBi+O
 DoDi8x7H7G3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="178184442"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="178184442"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 05:29:29 -0800
IronPort-SDR: DH02kuw+vwJqLJqYdNX1Hy7XrrLydc2RgazqfUvf6R2ZsUR1HoLTiM4RfA4Q92vB6pDDkN7ia3
 MePa1jRNbvzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="464525715"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 12 Jan 2021 05:29:26 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Jan 2021 15:29:25 +0200
Date:   Tue, 12 Jan 2021 15:29:25 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Kyle Tso <kyletso@google.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        hdegoede@redhat.com, badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v5 1/3] usb: typec: tcpm: AMS and Collision Avoidance
Message-ID: <20210112132925.GC2020859@kuha.fi.intel.com>
References: <20210105163927.1376770-1-kyletso@google.com>
 <20210105163927.1376770-2-kyletso@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105163927.1376770-2-kyletso@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 06, 2021 at 12:39:25AM +0800, Kyle Tso wrote:
> This patch provides the implementation of Collision Avoidance introduced
> in PD3.0. The start of each Atomic Message Sequence (AMS) initiated by
> the port will be denied if the current AMS is not interruptible. The
> Source port will set the CC to SinkTxNG if it is going to initiate an
> AMS, and SinkTxOk otherwise. Meanwhile, any AMS initiated by a Sink port
> will be denied in TCPM if the port partner (Source) sets SinkTxNG except
> for HARD_RESET and SOFT_RESET.
> 
> Signed-off-by: Kyle Tso <kyletso@google.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>

So did you and Will develop this patch together?

Few nitpicks below.

> ---
> Changelog since v4:
>  - rebased to ToT
> 
>  drivers/usb/typec/tcpm/tcpm.c | 533 ++++++++++++++++++++++++++++++----
>  include/linux/usb/pd.h        |   1 +
>  include/linux/usb/tcpm.h      |   4 +
>  3 files changed, 479 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 22a85b396f69..9fb3ec176f42 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -76,6 +76,8 @@
>  	S(SNK_HARD_RESET_SINK_ON),		\
>  						\
>  	S(SOFT_RESET),				\
> +	S(SRC_SOFT_RESET_WAIT_SNK_TX),		\
> +	S(SNK_SOFT_RESET),			\
>  	S(SOFT_RESET_SEND),			\
>  						\
>  	S(DR_SWAP_ACCEPT),			\
> @@ -139,7 +141,45 @@
>  						\
>  	S(ERROR_RECOVERY),			\
>  	S(PORT_RESET),				\
> -	S(PORT_RESET_WAIT_OFF)
> +	S(PORT_RESET_WAIT_OFF),			\
> +						\
> +	S(AMS_START)
> +
> +#define FOREACH_AMS(S)				\
> +	S(NONE_AMS),				\
> +	S(POWER_NEGOTIATION),			\
> +	S(GOTOMIN),				\
> +	S(SOFT_RESET_AMS),			\
> +	S(HARD_RESET),				\
> +	S(CABLE_RESET),				\
> +	S(GET_SOURCE_CAPABILITIES),		\
> +	S(GET_SINK_CAPABILITIES),		\
> +	S(POWER_ROLE_SWAP),			\
> +	S(FAST_ROLE_SWAP),			\
> +	S(DATA_ROLE_SWAP),			\
> +	S(VCONN_SWAP),				\
> +	S(SOURCE_ALERT),			\
> +	S(GETTING_SOURCE_EXTENDED_CAPABILITIES),\
> +	S(GETTING_SOURCE_SINK_STATUS),		\
> +	S(GETTING_BATTERY_CAPABILITIES),	\
> +	S(GETTING_BATTERY_STATUS),		\
> +	S(GETTING_MANUFACTURER_INFORMATION),	\
> +	S(SECURITY),				\
> +	S(FIRMWARE_UPDATE),			\
> +	S(DISCOVER_IDENTITY),			\
> +	S(SOURCE_STARTUP_CABLE_PLUG_DISCOVER_IDENTITY),	\
> +	S(DISCOVER_SVIDS),			\
> +	S(DISCOVER_MODES),			\
> +	S(DFP_TO_UFP_ENTER_MODE),		\
> +	S(DFP_TO_UFP_EXIT_MODE),		\
> +	S(DFP_TO_CABLE_PLUG_ENTER_MODE),	\
> +	S(DFP_TO_CABLE_PLUG_EXIT_MODE),		\
> +	S(ATTENTION),				\
> +	S(BIST),				\
> +	S(UNSTRUCTURED_VDMS),			\
> +	S(STRUCTURED_VDMS),			\
> +	S(COUNTRY_INFO),			\
> +	S(COUNTRY_CODES)
>  
>  #define GENERATE_ENUM(e)	e
>  #define GENERATE_STRING(s)	#s
> @@ -152,6 +192,14 @@ static const char * const tcpm_states[] = {
>  	FOREACH_STATE(GENERATE_STRING)
>  };
>  
> +enum tcpm_ams {
> +	FOREACH_AMS(GENERATE_ENUM)
> +};
> +
> +static const char * const tcpm_ams_str[] = {
> +	FOREACH_AMS(GENERATE_STRING)
> +};
> +
>  enum vdm_states {
>  	VDM_STATE_ERR_BUSY = -3,
>  	VDM_STATE_ERR_SEND = -2,
> @@ -161,6 +209,7 @@ enum vdm_states {
>  	VDM_STATE_READY = 1,
>  	VDM_STATE_BUSY = 2,
>  	VDM_STATE_WAIT_RSP_BUSY = 3,
> +	VDM_STATE_SEND_MESSAGE = 4,
>  };
>  
>  enum pd_msg_request {
> @@ -381,6 +430,11 @@ struct tcpm_port {
>  	/* Sink caps have been queried */
>  	bool sink_cap_done;
>  
> +	/* Collision Avoidance and Atomic Message Sequence */
> +	enum tcpm_state upcoming_state;
> +	enum tcpm_ams ams;
> +	bool in_ams;
> +
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *dentry;
>  	struct mutex logbuffer_lock;	/* log buffer access lock */
> @@ -396,6 +450,12 @@ struct pd_rx_event {
>  	struct pd_message msg;
>  };
>  
> +static const char * const pd_rev[] = {
> +	[PD_REV10]		= "rev1",
> +	[PD_REV20]		= "rev2",
> +	[PD_REV30]		= "rev3",
> +};
> +
>  #define tcpm_cc_is_sink(cc) \
>  	((cc) == TYPEC_CC_RP_DEF || (cc) == TYPEC_CC_RP_1_5 || \
>  	 (cc) == TYPEC_CC_RP_3_0)
> @@ -440,6 +500,10 @@ struct pd_rx_event {
>  	((port)->typec_caps.data == TYPEC_PORT_DFP ? \
>  	TYPEC_HOST : TYPEC_DEVICE)
>  
> +#define tcpm_sink_tx_ok(port) \
> +	(tcpm_port_is_sink(port) && \
> +	((port)->cc1 == TYPEC_CC_RP_3_0 || (port)->cc2 == TYPEC_CC_RP_3_0))
> +
>  static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
>  {
>  	if (port->port_type == TYPEC_PORT_DRP) {
> @@ -666,6 +730,35 @@ static void tcpm_debugfs_exit(const struct tcpm_port *port) { }
>  
>  #endif
>  
> +static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
> +{
> +	tcpm_log(port, "cc:=%d", cc);
> +	port->cc_req = cc;
> +	port->tcpc->set_cc(port->tcpc, cc);
> +}
> +
> +static enum typec_cc_status tcpm_rp_cc(struct tcpm_port *port);

I think you should move the function here instead of adding the
prototype for it.

> +static int tcpm_ams_finish(struct tcpm_port *port)
> +{
> +	int ret = 0;
> +
> +	tcpm_log(port, "AMS %s finished", tcpm_ams_str[port->ams]);
> +
> +	if (port->pd_capable && port->pwr_role == TYPEC_SOURCE) {
> +		if (port->negotiated_rev >= PD_REV30)
> +			tcpm_set_cc(port, SINK_TX_OK);
> +		else
> +			tcpm_set_cc(port, SINK_TX_NG);
> +	} else if (port->pwr_role == TYPEC_SOURCE) {
> +		tcpm_set_cc(port, tcpm_rp_cc(port));
> +	}
> +
> +	port->in_ams = false;
> +	port->ams = NONE_AMS;
> +
> +	return ret;
> +}
> +
>  static int tcpm_pd_transmit(struct tcpm_port *port,
>  			    enum tcpm_transmit_type type,
>  			    const struct pd_message *msg)
> @@ -693,13 +786,30 @@ static int tcpm_pd_transmit(struct tcpm_port *port,
>  	switch (port->tx_status) {
>  	case TCPC_TX_SUCCESS:
>  		port->message_id = (port->message_id + 1) & PD_HEADER_ID_MASK;
> -		return 0;
> +		/*
> +		 * USB PD rev 2.0, 8.3.2.2.1:
> +		 * USB PD rev 3.0, 8.3.2.1.3:
> +		 * "... Note that every AMS is Interruptible until the first
> +		 * Message in the sequence has been successfully sent (GoodCRC
> +		 * Message received)."
> +		 */
> +		if (port->ams != NONE_AMS)
> +			port->in_ams = true;
> +		break;
>  	case TCPC_TX_DISCARDED:
> -		return -EAGAIN;
> +		ret = -EAGAIN;
> +		break;
>  	case TCPC_TX_FAILED:
>  	default:
> -		return -EIO;
> +		ret = -EIO;
> +		break;
>  	}
> +
> +	/* Some AMS don't expect responses. Finish them here. */
> +	if (port->ams == ATTENTION || port->ams == SOURCE_ALERT)
> +		tcpm_ams_finish(port);
> +
> +	return ret;
>  }
>  
>  void tcpm_pd_transmit_complete(struct tcpm_port *port,
> @@ -1000,16 +1110,17 @@ static void tcpm_set_state(struct tcpm_port *port, enum tcpm_state state,
>  			   unsigned int delay_ms)
>  {
>  	if (delay_ms) {
> -		tcpm_log(port, "pending state change %s -> %s @ %u ms",
> -			 tcpm_states[port->state], tcpm_states[state],
> -			 delay_ms);
> +		tcpm_log(port, "pending state change %s -> %s @ %u ms [%s %s]",
> +			 tcpm_states[port->state], tcpm_states[state], delay_ms,
> +			 pd_rev[port->negotiated_rev], tcpm_ams_str[port->ams]);
>  		port->delayed_state = state;
>  		mod_tcpm_delayed_work(port, delay_ms);
>  		port->delayed_runtime = ktime_add(ktime_get(), ms_to_ktime(delay_ms));
>  		port->delay_ms = delay_ms;
>  	} else {
> -		tcpm_log(port, "state change %s -> %s",
> -			 tcpm_states[port->state], tcpm_states[state]);
> +		tcpm_log(port, "state change %s -> %s [%s %s]",
> +			 tcpm_states[port->state], tcpm_states[state],
> +			 pd_rev[port->negotiated_rev], tcpm_ams_str[port->ams]);
>  		port->delayed_state = INVALID_STATE;
>  		port->prev_state = port->state;
>  		port->state = state;
> @@ -1031,10 +1142,11 @@ static void tcpm_set_state_cond(struct tcpm_port *port, enum tcpm_state state,
>  		tcpm_set_state(port, state, delay_ms);
>  	else
>  		tcpm_log(port,
> -			 "skipped %sstate change %s -> %s [%u ms], context state %s",
> +			 "skipped %sstate change %s -> %s [%u ms], context state %s [%s %s]",
>  			 delay_ms ? "delayed " : "",
>  			 tcpm_states[port->state], tcpm_states[state],
> -			 delay_ms, tcpm_states[port->enter_state]);
> +			 delay_ms, tcpm_states[port->enter_state],
> +			 pd_rev[port->negotiated_rev], tcpm_ams_str[port->ams]);
>  }
>  
>  static void tcpm_queue_message(struct tcpm_port *port,
> @@ -1044,6 +1156,149 @@ static void tcpm_queue_message(struct tcpm_port *port,
>  	mod_tcpm_delayed_work(port, 0);
>  }
>  
> +static bool tcpm_vdm_ams(struct tcpm_port *port)
> +{
> +	switch (port->ams) {
> +	case DISCOVER_IDENTITY:
> +	case SOURCE_STARTUP_CABLE_PLUG_DISCOVER_IDENTITY:
> +	case DISCOVER_SVIDS:
> +	case DISCOVER_MODES:
> +	case DFP_TO_UFP_ENTER_MODE:
> +	case DFP_TO_UFP_EXIT_MODE:
> +	case DFP_TO_CABLE_PLUG_ENTER_MODE:
> +	case DFP_TO_CABLE_PLUG_EXIT_MODE:
> +	case ATTENTION:
> +	case UNSTRUCTURED_VDMS:
> +	case STRUCTURED_VDMS:
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool tcpm_ams_interruptible(struct tcpm_port *port)
> +{
> +	switch (port->ams) {
> +	/* Interruptible AMS */
> +	case NONE_AMS:
> +	case SECURITY:
> +	case FIRMWARE_UPDATE:
> +	case DISCOVER_IDENTITY:
> +	case SOURCE_STARTUP_CABLE_PLUG_DISCOVER_IDENTITY:
> +	case DISCOVER_SVIDS:
> +	case DISCOVER_MODES:
> +	case DFP_TO_UFP_ENTER_MODE:
> +	case DFP_TO_UFP_EXIT_MODE:
> +	case DFP_TO_CABLE_PLUG_ENTER_MODE:
> +	case DFP_TO_CABLE_PLUG_EXIT_MODE:
> +	case UNSTRUCTURED_VDMS:
> +	case STRUCTURED_VDMS:
> +	case COUNTRY_INFO:
> +	case COUNTRY_CODES:
> +		break;
> +	/* Non-Interruptible AMS */
> +	default:
> +		if (port->in_ams)
> +			return false;
> +		break;
> +	}
> +
> +	return true;
> +}
> +
> +static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
> +{
> +	int ret = 0;
> +
> +	tcpm_log(port, "AMS %s start", tcpm_ams_str[ams]);
> +
> +	if (!tcpm_ams_interruptible(port) && ams != HARD_RESET) {
> +		port->upcoming_state = INVALID_STATE;
> +		tcpm_log(port, "AMS %s not interruptible, aborting",
> +			 tcpm_ams_str[port->ams]);
> +		return -EAGAIN;
> +	}
> +
> +	if (port->pwr_role == TYPEC_SOURCE) {
> +		enum typec_cc_status cc_req = port->cc_req;
> +
> +		port->ams = ams;
> +
> +		if (ams == HARD_RESET) {
> +			tcpm_set_cc(port, tcpm_rp_cc(port));
> +			tcpm_pd_transmit(port, TCPC_TX_HARD_RESET, NULL);
> +			tcpm_set_state(port, HARD_RESET_START, 0);
> +			return ret;
> +		} else if (ams == SOFT_RESET_AMS) {
> +			if (!port->explicit_contract) {
> +				port->upcoming_state = INVALID_STATE;
> +				tcpm_set_cc(port, tcpm_rp_cc(port));
> +				return ret;
> +			}
> +		} else if (tcpm_vdm_ams(port)) {
> +			/* tSinkTx is enforced in vdm_run_state_machine */
> +			if (port->negotiated_rev >= PD_REV30)
> +				tcpm_set_cc(port, SINK_TX_NG);
> +			return ret;
> +		}
> +
> +		if (port->negotiated_rev >= PD_REV30)
> +			tcpm_set_cc(port, SINK_TX_NG);
> +
> +		switch (port->state) {
> +		case SRC_READY:
> +		case SRC_STARTUP:
> +		case SRC_SOFT_RESET_WAIT_SNK_TX:
> +		case SOFT_RESET:
> +		case SOFT_RESET_SEND:
> +			if (port->negotiated_rev >= PD_REV30)
> +				tcpm_set_state(port, AMS_START,
> +					       cc_req == SINK_TX_OK ?
> +					       PD_T_SINK_TX : 0);
> +			else
> +				tcpm_set_state(port, AMS_START, 0);
> +			break;
> +		default:
> +			if (port->negotiated_rev >= PD_REV30)
> +				tcpm_set_state(port, SRC_READY,
> +					       cc_req == SINK_TX_OK ?
> +					       PD_T_SINK_TX : 0);
> +			else
> +				tcpm_set_state(port, SRC_READY, 0);
> +			break;
> +		}
> +	} else {
> +		if (port->negotiated_rev >= PD_REV30 &&
> +		    !tcpm_sink_tx_ok(port) &&
> +		    ams != SOFT_RESET_AMS &&
> +		    ams != HARD_RESET) {
> +			port->upcoming_state = INVALID_STATE;
> +			tcpm_log(port, "Sink TX No Go");
> +			return -EAGAIN;
> +		}
> +
> +		port->ams = ams;
> +
> +		if (ams == HARD_RESET) {
> +			tcpm_pd_transmit(port, TCPC_TX_HARD_RESET, NULL);
> +			tcpm_set_state(port, HARD_RESET_START, 0);
> +			return ret;
> +		} else if (tcpm_vdm_ams(port)) {
> +			return ret;
> +		}
> +
> +		if (port->state == SNK_READY ||
> +		    port->state == SNK_SOFT_RESET)
> +			tcpm_set_state(port, AMS_START, 0);
> +		else
> +			tcpm_set_state(port, SNK_READY, 0);
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * VDM/VDO handling functions
>   */
> @@ -1236,6 +1491,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  		if (IS_ERR_OR_NULL(port->partner))
>  			break;
>  
> +		tcpm_ams_finish(port);
> +
>  		switch (cmd) {
>  		case CMD_DISCOVER_IDENT:
>  			/* 6.4.4.3.1 */
> @@ -1286,6 +1543,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  		}
>  		break;
>  	case CMDT_RSP_NAK:
> +		tcpm_ams_finish(port);
>  		switch (cmd) {
>  		case CMD_ENTER_MODE:
>  			/* Back to USB Operation */
> @@ -1435,7 +1693,8 @@ static unsigned int vdm_ready_timeout(u32 vdm_hdr)
>  static void vdm_run_state_machine(struct tcpm_port *port)
>  {
>  	struct pd_message msg;
> -	int i, res;
> +	int i, res = 0;
> +	u32 vdo_hdr = port->vdo_data[0];
>  
>  	switch (port->vdm_state) {
>  	case VDM_STATE_READY:
> @@ -1452,26 +1711,47 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  		if (port->state != SRC_READY && port->state != SNK_READY)
>  			break;
>  
> -		/* Prepare and send VDM */
> -		memset(&msg, 0, sizeof(msg));
> -		msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
> -					  port->pwr_role,
> -					  port->data_role,
> -					  port->negotiated_rev,
> -					  port->message_id, port->vdo_count);
> -		for (i = 0; i < port->vdo_count; i++)
> -			msg.payload[i] = cpu_to_le32(port->vdo_data[i]);
> -		res = tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
> -		if (res < 0) {
> -			port->vdm_state = VDM_STATE_ERR_SEND;
> -		} else {
> -			unsigned long timeout;
> +		/* TODO: AMS operation for Unstructured VDM */
> +		if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMDT(vdo_hdr) == CMDT_INIT) {
> +			switch (PD_VDO_CMD(vdo_hdr)) {
> +			case CMD_DISCOVER_IDENT:
> +				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
> +				break;
> +			case CMD_DISCOVER_SVID:
> +				res = tcpm_ams_start(port, DISCOVER_SVIDS);
> +				break;
> +			case CMD_DISCOVER_MODES:
> +				res = tcpm_ams_start(port, DISCOVER_MODES);
> +				break;
> +			case CMD_ENTER_MODE:
> +				res = tcpm_ams_start(port,
> +						     DFP_TO_UFP_ENTER_MODE);

One line is enough:

				res = tcpm_ams_start(port, DFP_TO_UFP_ENTER_MODE);

> +				break;
> +			case CMD_EXIT_MODE:
> +				res = tcpm_ams_start(port,
> +						     DFP_TO_UFP_EXIT_MODE);

Ditto.

> +				break;
> +			case CMD_ATTENTION:
> +				res = tcpm_ams_start(port, ATTENTION);
> +				break;
> +			case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
> +				res = tcpm_ams_start(port, STRUCTURED_VDMS);
> +				break;
> +			default:
> +				res = -EOPNOTSUPP;
> +				break;
> +			}
>  
> -			port->vdm_retries = 0;
> -			port->vdm_state = VDM_STATE_BUSY;
> -			timeout = vdm_ready_timeout(port->vdo_data[0]);
> -			mod_vdm_delayed_work(port, timeout);
> +			if (res < 0)
> +				return;
>  		}
> +
> +		port->vdm_state = VDM_STATE_SEND_MESSAGE;
> +		mod_vdm_delayed_work(port, (port->negotiated_rev >= PD_REV30) &&
> +					   (port->pwr_role == TYPEC_SOURCE) &&
> +					   (PD_VDO_SVDM(vdo_hdr)) &&
> +					   (PD_VDO_CMDT(vdo_hdr) == CMDT_INIT) ?
> +					   PD_T_SINK_TX : 0);

I don't think you need all those brackets. This would look better, and
I bet it would make also scripts/checkpatch.pl happy:

                mod_vdm_delayed_work(port, (port->negotiated_rev >= PD_REV30 &&
                                            port->pwr_role == TYPEC_SOURCE &&
                                            PD_VDO_SVDM(vdo_hdr) &&
                                            PD_VDO_CMDT(vdo_hdr) == CMDT_INIT) ?
                                           PD_T_SINK_TX : 0);

>  		break;
>  	case VDM_STATE_WAIT_RSP_BUSY:
>  		port->vdo_data[0] = port->vdo_retry;
> @@ -1480,6 +1760,8 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  		break;
>  	case VDM_STATE_BUSY:
>  		port->vdm_state = VDM_STATE_ERR_TMOUT;
> +		if (port->ams != NONE_AMS)
> +			tcpm_ams_finish(port);
>  		break;
>  	case VDM_STATE_ERR_SEND:
>  		/*
> @@ -1492,6 +1774,29 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			tcpm_log(port, "VDM Tx error, retry");
>  			port->vdm_retries++;
>  			port->vdm_state = VDM_STATE_READY;
> +			tcpm_ams_finish(port);
> +		}
> +		break;
> +	case VDM_STATE_SEND_MESSAGE:
> +		/* Prepare and send VDM */
> +		memset(&msg, 0, sizeof(msg));
> +		msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
> +					  port->pwr_role,
> +					  port->data_role,
> +					  port->negotiated_rev,
> +					  port->message_id, port->vdo_count);
> +		for (i = 0; i < port->vdo_count; i++)
> +			msg.payload[i] = cpu_to_le32(port->vdo_data[i]);
> +		res = tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
> +		if (res < 0) {
> +			port->vdm_state = VDM_STATE_ERR_SEND;
> +		} else {
> +			unsigned long timeout;
> +
> +			port->vdm_retries = 0;
> +			port->vdm_state = VDM_STATE_BUSY;
> +			timeout = vdm_ready_timeout(vdo_hdr);
> +			mod_vdm_delayed_work(port, timeout);
>  		}
>  		break;
>  	default:
> @@ -1514,7 +1819,8 @@ static void vdm_state_machine_work(struct kthread_work *work)
>  		prev_state = port->vdm_state;
>  		vdm_run_state_machine(port);
>  	} while (port->vdm_state != prev_state &&
> -		 port->vdm_state != VDM_STATE_BUSY);
> +		 port->vdm_state != VDM_STATE_BUSY &&
> +		 port->vdm_state != VDM_STATE_SEND_MESSAGE);
>  
>  	mutex_unlock(&port->lock);
>  }
> @@ -1997,11 +2303,14 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		case SOFT_RESET_SEND:
>  			port->message_id = 0;
>  			port->rx_msgid = -1;
> -			if (port->pwr_role == TYPEC_SOURCE)
> -				next_state = SRC_SEND_CAPABILITIES;
> -			else
> -				next_state = SNK_WAIT_CAPABILITIES;
> -			tcpm_set_state(port, next_state, 0);
> +			if (port->ams == SOFT_RESET_AMS)
> +				tcpm_ams_finish(port);
> +			if (port->pwr_role == TYPEC_SOURCE) {
> +				port->upcoming_state = SRC_SEND_CAPABILITIES;
> +				tcpm_ams_start(port, POWER_NEGOTIATION);
> +			} else {
> +				tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
> +			}
>  			break;
>  		case DR_SWAP_SEND:
>  			tcpm_set_state(port, DR_SWAP_CHANGE_DR, 0);
> @@ -2776,13 +3085,6 @@ static bool tcpm_start_toggling(struct tcpm_port *port, enum typec_cc_status cc)
>  	return ret == 0;
>  }
>  
> -static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
> -{
> -	tcpm_log(port, "cc:=%d", cc);
> -	port->cc_req = cc;
> -	port->tcpc->set_cc(port->tcpc, cc);
> -}
> -
>  static int tcpm_init_vbus(struct tcpm_port *port)
>  {
>  	int ret;
> @@ -2912,6 +3214,8 @@ static void tcpm_reset_port(struct tcpm_port *port)
>  		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, false);
>  		tcpm_log_force(port, "Disable vbus discharge ret:%d", ret);
>  	}
> +	port->in_ams = false;
> +	port->ams = NONE_AMS;
>  	tcpm_unregister_altmodes(port);
>  	tcpm_typec_disconnect(port);
>  	port->attached = false;
> @@ -3090,6 +3394,7 @@ static void run_state_machine(struct tcpm_port *port)
>  	int ret;
>  	enum typec_pwr_opmode opmode;
>  	unsigned int msecs;
> +	enum tcpm_state upcoming_state;
>  
>  	port->enter_state = port->state;
>  	switch (port->state) {
> @@ -3190,7 +3495,12 @@ static void run_state_machine(struct tcpm_port *port)
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
>  		port->explicit_contract = false;
> -		tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
> +		/* SNK -> SRC POWER/FAST_ROLE_SWAP finished */
> +		if (port->ams == POWER_ROLE_SWAP ||
> +		    port->ams == FAST_ROLE_SWAP)
> +			tcpm_ams_finish(port);
> +		port->upcoming_state = SRC_SEND_CAPABILITIES;
> +		tcpm_ams_start(port, POWER_NEGOTIATION);
>  		break;
>  	case SRC_SEND_CAPABILITIES:
>  		port->caps_count++;
> @@ -3272,6 +3582,19 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_swap_complete(port, 0);
>  		tcpm_typec_connect(port);
>  
> +		if (port->ams != NONE_AMS)
> +			tcpm_ams_finish(port);
> +		/*
> +		 * If previous AMS is interrupted, switch to the upcoming
> +		 * state.
> +		 */
> +		upcoming_state = port->upcoming_state;
> +		if (port->upcoming_state != INVALID_STATE) {
> +			port->upcoming_state = INVALID_STATE;
> +			tcpm_set_state(port, upcoming_state, 0);
> +			break;
> +		}

I don't see the local upcoming_state variable is being used anywhere
outside of these conditions, so please set it inside the condition
block:

		if (port->upcoming_state != INVALID_STATE) {
		        upcoming_state = port->upcoming_state;
			port->upcoming_state = INVALID_STATE;
			tcpm_set_state(port, upcoming_state, 0);
			break;
		}

>  		tcpm_check_send_discover(port);
>  		/*
>  		 * 6.3.5
> @@ -3389,6 +3712,12 @@ static void run_state_machine(struct tcpm_port *port)
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
>  		port->explicit_contract = false;
> +
> +		if (port->ams == POWER_ROLE_SWAP ||
> +		    port->ams == FAST_ROLE_SWAP)
> +			/* SRC -> SNK POWER/FAST_ROLE_SWAP finished */
> +			tcpm_ams_finish(port);
> +
>  		tcpm_set_state(port, SNK_DISCOVERY, 0);
>  		break;
>  	case SNK_DISCOVERY:
> @@ -3437,7 +3766,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		 */
>  		if (port->vbus_never_low) {
>  			port->vbus_never_low = false;
> -			tcpm_set_state(port, SOFT_RESET_SEND,
> +			tcpm_set_state(port, SNK_SOFT_RESET,
>  				       PD_T_SINK_WAIT_CAP);
>  		} else {
>  			tcpm_set_state(port, hard_reset_state(port),
> @@ -3490,9 +3819,23 @@ static void run_state_machine(struct tcpm_port *port)
>  
>  		tcpm_swap_complete(port, 0);
>  		tcpm_typec_connect(port);
> -		tcpm_check_send_discover(port);
>  		mod_enable_frs_delayed_work(port, 0);
>  		tcpm_pps_complete(port, port->pps_status);
> +
> +		if (port->ams != NONE_AMS)
> +			tcpm_ams_finish(port);
> +		/*
> +		 * If previous AMS is interrupted, switch to the upcoming
> +		 * state.
> +		 */
> +		upcoming_state = port->upcoming_state;
> +		if (port->upcoming_state != INVALID_STATE) {
> +			port->upcoming_state = INVALID_STATE;
> +			tcpm_set_state(port, upcoming_state, 0);
> +			break;
> +		}

Same here.

> +		tcpm_check_send_discover(port);
>  		power_supply_changed(port->psy);
>  		break;
>  
> @@ -3513,8 +3856,14 @@ static void run_state_machine(struct tcpm_port *port)
>  
>  	/* Hard_Reset states */
>  	case HARD_RESET_SEND:
> -		tcpm_pd_transmit(port, TCPC_TX_HARD_RESET, NULL);
> -		tcpm_set_state(port, HARD_RESET_START, 0);
> +		if (port->ams != NONE_AMS)
> +			tcpm_ams_finish(port);
> +		/*
> +		 * State machine will be directed to HARD_RESET_START,
> +		 * thus set upcoming_state to INVALID_STATE.
> +		 */
> +		port->upcoming_state = INVALID_STATE;
> +		tcpm_ams_start(port, HARD_RESET);
>  		break;
>  	case HARD_RESET_START:
>  		port->sink_cap_done = false;
> @@ -3558,6 +3907,8 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SRC_HARD_RESET_VBUS_ON:
>  		tcpm_set_vconn(port, true);
>  		tcpm_set_vbus(port, true);
> +		if (port->ams == HARD_RESET)
> +			tcpm_ams_finish(port);
>  		port->tcpc->set_pd_rx(port->tcpc, true);
>  		tcpm_set_attached_state(port, true);
>  		tcpm_set_state(port, SRC_UNATTACHED, PD_T_PS_SOURCE_ON);
> @@ -3579,6 +3930,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_state(port, SNK_HARD_RESET_SINK_ON, PD_T_SAFE_0V);
>  		break;
>  	case SNK_HARD_RESET_WAIT_VBUS:
> +		if (port->ams == HARD_RESET)
> +			tcpm_ams_finish(port);
>  		/* Assume we're disconnected if VBUS doesn't come back. */
>  		tcpm_set_state(port, SNK_UNATTACHED,
>  			       PD_T_SRC_RECOVER_MAX + PD_T_SRC_TURN_ON);
> @@ -3606,6 +3959,8 @@ static void run_state_machine(struct tcpm_port *port)
>  					       5000);
>  			tcpm_set_charge(port, true);
>  		}
> +		if (port->ams == HARD_RESET)
> +			tcpm_ams_finish(port);
>  		tcpm_set_attached_state(port, true);
>  		tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, VSAFE5V);
>  		tcpm_set_state(port, SNK_STARTUP, 0);
> @@ -3616,10 +3971,19 @@ static void run_state_machine(struct tcpm_port *port)
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
> -		if (port->pwr_role == TYPEC_SOURCE)
> -			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
> -		else
> +		if (port->pwr_role == TYPEC_SOURCE) {
> +			port->upcoming_state = SRC_SEND_CAPABILITIES;
> +			tcpm_ams_start(port, POWER_NEGOTIATION);
> +		} else {
>  			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
> +		}
> +		break;
> +	case SRC_SOFT_RESET_WAIT_SNK_TX:
> +	case SNK_SOFT_RESET:
> +		if (port->ams != NONE_AMS)
> +			tcpm_ams_finish(port);
> +		port->upcoming_state = SOFT_RESET_SEND;
> +		tcpm_ams_start(port, SOFT_RESET_AMS);
>  		break;
>  	case SOFT_RESET_SEND:
>  		port->message_id = 0;
> @@ -3886,6 +4250,19 @@ static void run_state_machine(struct tcpm_port *port)
>  			       tcpm_default_state(port),
>  			       port->vbus_present ? PD_T_PS_SOURCE_OFF : 0);
>  		break;
> +
> +	/* AMS intermediate state */
> +	case AMS_START:
> +		if (port->upcoming_state == INVALID_STATE) {
> +			tcpm_set_state(port, port->pwr_role == TYPEC_SOURCE ?
> +				       SRC_READY : SNK_READY, 0);
> +			break;
> +		}
> +
> +		upcoming_state = port->upcoming_state;
> +		port->upcoming_state = INVALID_STATE;
> +		tcpm_set_state(port, upcoming_state, 0);
> +		break;
>  	default:
>  		WARN(1, "Unexpected port state %d\n", port->state);
>  		break;
> @@ -4313,6 +4690,8 @@ static void _tcpm_pd_hard_reset(struct tcpm_port *port)
>  	if (port->bist_request == BDO_MODE_TESTDATA && port->tcpc->set_bist_data)
>  		port->tcpc->set_bist_data(port->tcpc, false);
>  
> +	if (port->ams != NONE_AMS)
> +		port->ams = NONE_AMS;
>  	/*
>  	 * If we keep receiving hard reset requests, executing the hard reset
>  	 * must have failed. Revert to error recovery if that happens.
> @@ -4501,7 +4880,12 @@ static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
>  		port->non_pd_role_swap = true;
>  		tcpm_set_state(port, PORT_RESET, 0);
>  	} else {
> -		tcpm_set_state(port, DR_SWAP_SEND, 0);
> +		port->upcoming_state = DR_SWAP_SEND;
> +		ret = tcpm_ams_start(port, DATA_ROLE_SWAP);
> +		if (ret == -EAGAIN) {
> +			port->upcoming_state = INVALID_STATE;
> +			goto port_unlock;
> +		}
>  	}
>  
>  	port->swap_status = 0;
> @@ -4547,10 +4931,16 @@ static int tcpm_pr_set(struct typec_port *p, enum typec_role role)
>  		goto port_unlock;
>  	}
>  
> +	port->upcoming_state = PR_SWAP_SEND;
> +	ret = tcpm_ams_start(port, POWER_ROLE_SWAP);
> +	if (ret == -EAGAIN) {
> +		port->upcoming_state = INVALID_STATE;
> +		goto port_unlock;
> +	}
> +
>  	port->swap_status = 0;
>  	port->swap_pending = true;
>  	reinit_completion(&port->swap_complete);
> -	tcpm_set_state(port, PR_SWAP_SEND, 0);
>  	mutex_unlock(&port->lock);
>  
>  	if (!wait_for_completion_timeout(&port->swap_complete,
> @@ -4586,10 +4976,16 @@ static int tcpm_vconn_set(struct typec_port *p, enum typec_role role)
>  		goto port_unlock;
>  	}
>  
> +	port->upcoming_state = VCONN_SWAP_SEND;
> +	ret = tcpm_ams_start(port, VCONN_SWAP);
> +	if (ret == -EAGAIN) {
> +		port->upcoming_state = INVALID_STATE;
> +		goto port_unlock;
> +	}
> +
>  	port->swap_status = 0;
>  	port->swap_pending = true;
>  	reinit_completion(&port->swap_complete);
> -	tcpm_set_state(port, VCONN_SWAP_SEND, 0);
>  	mutex_unlock(&port->lock);
>  
>  	if (!wait_for_completion_timeout(&port->swap_complete,
> @@ -4654,6 +5050,13 @@ static int tcpm_pps_set_op_curr(struct tcpm_port *port, u16 op_curr)
>  		goto port_unlock;
>  	}
>  
> +	port->upcoming_state = SNK_NEGOTIATE_PPS_CAPABILITIES;
> +	ret = tcpm_ams_start(port, POWER_NEGOTIATION);
> +	if (ret == -EAGAIN) {
> +		port->upcoming_state = INVALID_STATE;
> +		goto port_unlock;
> +	}
> +
>  	/* Round down operating current to align with PPS valid steps */
>  	op_curr = op_curr - (op_curr % RDO_PROG_CURR_MA_STEP);
>  
> @@ -4661,7 +5064,6 @@ static int tcpm_pps_set_op_curr(struct tcpm_port *port, u16 op_curr)
>  	port->pps_data.op_curr = op_curr;
>  	port->pps_status = 0;
>  	port->pps_pending = true;
> -	tcpm_set_state(port, SNK_NEGOTIATE_PPS_CAPABILITIES, 0);
>  	mutex_unlock(&port->lock);
>  
>  	if (!wait_for_completion_timeout(&port->pps_complete,
> @@ -4710,6 +5112,13 @@ static int tcpm_pps_set_out_volt(struct tcpm_port *port, u16 out_volt)
>  		goto port_unlock;
>  	}
>  
> +	port->upcoming_state = SNK_NEGOTIATE_PPS_CAPABILITIES;
> +	ret = tcpm_ams_start(port, POWER_NEGOTIATION);
> +	if (ret == -EAGAIN) {
> +		port->upcoming_state = INVALID_STATE;
> +		goto port_unlock;
> +	}
> +
>  	/* Round down output voltage to align with PPS valid steps */
>  	out_volt = out_volt - (out_volt % RDO_PROG_VOLT_MV_STEP);
>  
> @@ -4717,7 +5126,6 @@ static int tcpm_pps_set_out_volt(struct tcpm_port *port, u16 out_volt)
>  	port->pps_data.out_volt = out_volt;
>  	port->pps_status = 0;
>  	port->pps_pending = true;
> -	tcpm_set_state(port, SNK_NEGOTIATE_PPS_CAPABILITIES, 0);
>  	mutex_unlock(&port->lock);
>  
>  	if (!wait_for_completion_timeout(&port->pps_complete,
> @@ -4757,6 +5165,16 @@ static int tcpm_pps_activate(struct tcpm_port *port, bool activate)
>  		goto port_unlock;
>  	}
>  
> +	if (activate)
> +		port->upcoming_state = SNK_NEGOTIATE_PPS_CAPABILITIES;
> +	else
> +		port->upcoming_state = SNK_NEGOTIATE_CAPABILITIES;
> +	ret = tcpm_ams_start(port, POWER_NEGOTIATION);
> +	if (ret == -EAGAIN) {
> +		port->upcoming_state = INVALID_STATE;
> +		goto port_unlock;
> +	}
> +
>  	reinit_completion(&port->pps_complete);
>  	port->pps_status = 0;
>  	port->pps_pending = true;
> @@ -4765,9 +5183,6 @@ static int tcpm_pps_activate(struct tcpm_port *port, bool activate)
>  	if (activate) {
>  		port->pps_data.out_volt = port->supply_voltage;
>  		port->pps_data.op_curr = port->current_limit;
> -		tcpm_set_state(port, SNK_NEGOTIATE_PPS_CAPABILITIES, 0);
> -	} else {
> -		tcpm_set_state(port, SNK_NEGOTIATE_CAPABILITIES, 0);
>  	}
>  	mutex_unlock(&port->lock);
>  
> diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> index bb9a782e1411..79599b90ba55 100644
> --- a/include/linux/usb/pd.h
> +++ b/include/linux/usb/pd.h
> @@ -479,6 +479,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
>  #define PD_T_NEWSRC		250	/* Maximum of 275ms */
>  #define PD_T_SWAP_SRC_START	20	/* Minimum of 20ms */
>  #define PD_T_BIST_CONT_MODE	50	/* 30 - 60 ms */
> +#define PD_T_SINK_TX		16	/* 16 - 20 ms */
>  
>  #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
>  #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index f4a18427f5c4..3af99f85e8b9 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -19,6 +19,10 @@ enum typec_cc_status {
>  	TYPEC_CC_RP_3_0,
>  };
>  
> +/* Collision Avoidance */
> +#define SINK_TX_NG	TYPEC_CC_RP_1_5
> +#define SINK_TX_OK	TYPEC_CC_RP_3_0
> +
>  enum typec_cc_polarity {
>  	TYPEC_POLARITY_CC1,
>  	TYPEC_POLARITY_CC2,
> -- 
> 2.29.2.729.g45daf8777d-goog

thanks,

-- 
heikki
