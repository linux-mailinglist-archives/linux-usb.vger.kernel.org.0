Return-Path: <linux-usb+bounces-4350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24118189C8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 15:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045541F270E1
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 14:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615791BDF3;
	Tue, 19 Dec 2023 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUy3B9Pv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A191D522;
	Tue, 19 Dec 2023 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702995967; x=1734531967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/4skfNTCQjgmpCNOPOyadtgmn5n3hApSeAoB8mM08Q=;
  b=MUy3B9PvphVqUWoPNypt7TAfivvnknddinrVhtys/cJnibNX8MoAYGf5
   45irj2+lfN0v7/o0VNvsKJtFx5b9qravsVVqitAPTgvhk2TLJ/Qzb9ht/
   hsstlgYjc9GyHE7NerLX9Gf/0aN9JmbuUB5IOBc8uVSlDPM/zX6kMnHzX
   KxRqe5Qv/TV4zFFxBc0Ee6ZiGChoid3iTcjckaPFQCm12VlXxbvJwwPd+
   C9qsMndlgq0b4ysB5PahywQkhY4G59pOVbWdGufxr25AnP7fRyxoeajFp
   pNtK30R5H8O8eIFx6LcuZEq4Qbtj3sXGLPjN44VcgwM2N6I9m1lHXKVod
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2493783"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2493783"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="779495942"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="779495942"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga007.fm.intel.com with SMTP; 19 Dec 2023 06:26:03 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 19 Dec 2023 16:26:02 +0200
Date: Tue, 19 Dec 2023 16:26:02 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	badhri@google.com, bryan.odonoghue@linaro.org, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org
Subject: Re: [PATCH v2 08/12] usb: typec: tcpm: add discover identity support
 for SOP'
Message-ID: <ZYGn+kHAYt+OPbY/@kuha.fi.intel.com>
References: <20231214230850.379863-14-rdbabiera@google.com>
 <20231214230850.379863-22-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214230850.379863-22-rdbabiera@google.com>

On Thu, Dec 14, 2023 at 11:08:52PM +0000, RD Babiera wrote:
> Add data message handling and Discover Identity SVDM over SOP'
> 
> This patch contains the following changes:
>     1. pd_vdo
> Add VDO indices for active and passive cables, documentation to reflect
> expected number of objects depending on PD Revision, and macro to indicate
> port parter is data host capable.
>     2. tcpm
> Add typec_cable and typec_plug to tcpm_port to maintain cable and plug
> information. tcpm_port also adds send_discover_prime to indicate that
> Discover Identity should be sent out of the ready state.
> 
> tcpm_queue_vdm and tcpm_send_vdm now take the SOP* type when transmitting
> messages. tcpm_handle_vdm_request and tcpm_pd_svdm also use the SOP* type.
> tcpm_pd_svdm handles Discover Identity messages for SOP and SOP'. In the
> SOP case, the port uses tcpm_attempt_vconn_swap_discovery to determine if
> a Vconn swap is needed for cable communication. Otherwise, the port will
> send Discover Identity on SOP' if it can, or default to Discover SVIDs.
> 
> svdm_consume_identity_sop_prime consumes the result of Discover Identity
> on SOP'. It fills out cable identity and description, and it registers
> the cable. The SOP' plug is registered as well.
> 
> The VDM state machine is adjusted to construct messages based on the SOP*
> type. If a transmission error occurs after the max number of retries for
> Discover Identity over SOP', then the port will send Discover SVIDs over
> SOP.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since v1:
> * Moved typec_cable_set_svdm_version and typec_cable_get_svdm_version
>   symbols into independent patch.
> * Minor change to svdm_version handing for SOP' in tcpm_pd_svdm
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 388 +++++++++++++++++++++++++++++-----
>  include/linux/usb/pd_vdo.h    |   8 +-
>  2 files changed, 347 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c1e1fd6bd60d..5924e359e14d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -319,6 +319,12 @@ struct tcpm_port {
>  	struct typec_partner_desc partner_desc;
>  	struct typec_partner *partner;
>  
> +	struct usb_pd_identity cable_ident;
> +	struct typec_cable_desc cable_desc;
> +	struct typec_cable *cable;
> +	struct typec_plug_desc plug_prime_desc;
> +	struct typec_plug *plug_prime;
> +
>  	enum typec_cc_status cc_req;
>  	enum typec_cc_status src_rp;	/* work only if pd_supported == false */
>  
> @@ -496,6 +502,12 @@ struct tcpm_port {
>  	bool potential_contaminant;
>  
>  	/* SOP* Related Fields */
> +	/*
> +	 * Flag to determine if SOP' Discover Identity is available. The flag
> +	 * is set if Discover Identity on SOP' does not immediately follow
> +	 * Discover Identity on SOP.
> +	 */
> +	bool send_discover_prime;
>  	/*
>  	 * tx_sop_type determines which SOP* a message is being sent on.
>  	 * For messages that are queued and not sent immediately such as in
> @@ -1501,7 +1513,7 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
>   * VDM/VDO handling functions
>   */
>  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
> -			   const u32 *data, int cnt)
> +			   const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
>  {
>  	u32 vdo_hdr = port->vdo_data[0];
>  
> @@ -1509,7 +1521,10 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  
>  	/* If is sending discover_identity, handle received message first */
>  	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
> -		port->send_discover = true;
> +		if (tx_sop_type == TCPC_TX_SOP_PRIME)
> +			port->send_discover_prime = true;
> +		else
> +			port->send_discover = true;
>  		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
>  	} else {
>  		/* Make sure we are not still processing a previous VDM packet */
> @@ -1524,6 +1539,8 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	port->vdm_state = VDM_STATE_READY;
>  	port->vdm_sm_running = true;
>  
> +	port->tx_sop_type = tx_sop_type;
> +
>  	mod_vdm_delayed_work(port, 0);
>  }
>  
> @@ -1531,7 +1548,7 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>  				    const u32 *data, int cnt)
>  {
>  	mutex_lock(&port->lock);
> -	tcpm_queue_vdm(port, header, data, cnt);
> +	tcpm_queue_vdm(port, header, data, cnt, TCPC_TX_SOP);
>  	mutex_unlock(&port->lock);
>  }
>  
> @@ -1553,6 +1570,63 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  		 PD_PRODUCT_PID(product), product & 0xffff);
>  }
>  
> +static void svdm_consume_identity_sop_prime(struct tcpm_port *port, const u32 *p, int cnt)
> +{
> +	u32 idh = p[VDO_INDEX_IDH];
> +	u32 product = p[VDO_INDEX_PRODUCT];
> +	int svdm_version;
> +
> +	/*
> +	 * Attempt to consume identity only if cable currently is not set
> +	 */
> +	if (!IS_ERR_OR_NULL(port->cable))
> +		goto register_plug;
> +
> +	/* Reset cable identity */
> +	memset(&port->cable_ident, 0, sizeof(port->cable_ident));
> +
> +	/* Fill out id header, cert, product, cable VDO 1 */
> +	port->cable_ident.id_header = idh;
> +	port->cable_ident.cert_stat = p[VDO_INDEX_CSTAT];
> +	port->cable_ident.product = product;
> +	port->cable_ident.vdo[0] = p[VDO_INDEX_CABLE_1];
> +
> +	/* Fill out cable desc, infer svdm_version from pd revision */
> +	port->cable_desc.type = (enum typec_plug_type) (VDO_TYPEC_CABLE_TYPE(p[VDO_INDEX_CABLE_1]) +
> +							USB_PLUG_TYPE_A);
> +	port->cable_desc.active = PD_IDH_PTYPE(idh) == IDH_PTYPE_ACABLE ? 1 : 0;
> +	/* Log PD Revision and additional cable VDO from negotiated revision */
> +	switch (port->negotiated_rev_prime) {
> +	case PD_REV30:
> +		port->cable_desc.pd_revision = 0x0300;
> +		if (port->cable_desc.active)
> +			port->cable_ident.vdo[1] = p[VDO_INDEX_CABLE_2];
> +		break;
> +	case PD_REV20:
> +		port->cable_desc.pd_revision = 0x0200;
> +		break;
> +	default:
> +		port->cable_desc.pd_revision = 0x0200;
> +		break;
> +	}
> +	port->cable_desc.identity = &port->cable_ident;
> +	/* Register Cable, set identity and svdm_version */
> +	port->cable = typec_register_cable(port->typec_port, &port->cable_desc);
> +	if (IS_ERR_OR_NULL(port->cable))
> +		return;
> +	typec_cable_set_identity(port->cable);
> +	/* Get SVDM version */
> +	svdm_version = PD_VDO_SVDM_VER(p[VDO_INDEX_HDR]);
> +	typec_cable_set_svdm_version(port->cable, svdm_version);
> +
> +register_plug:
> +	if (IS_ERR_OR_NULL(port->plug_prime)) {
> +		port->plug_prime_desc.index = TYPEC_PLUG_SOP_P;
> +		port->plug_prime = typec_register_plug(port->cable,
> +						       &port->plug_prime_desc);
> +	}
> +}
> +
>  static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	struct pd_mode_data *pmdata = &port->mode_data;
> @@ -1647,6 +1721,7 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  }
>  
>  #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
> +#define supports_host(port)    PD_IDH_HOST_SUPP((port->partner_ident.id_header))
>  
>  /*
>   * Helper to determine whether the port is capable of SOP' communication at the
> @@ -1699,9 +1774,35 @@ static bool tcpm_can_communicate_sop_prime(struct tcpm_port *port)
>  	return false;
>  }
>  
> +static bool tcpm_attempt_vconn_swap_discovery(struct tcpm_port *port)
> +{
> +	if (!port->tcpc->attempt_vconn_swap_discovery)
> +		return false;
> +
> +	/* Port is already source, no need to perform swap */
> +	if (port->vconn_role == TYPEC_SOURCE)
> +		return false;
> +
> +	/*
> +	 * Partner needs to support Alternate Modes with modal support. If
> +	 * partner is also capable of being a USB Host, it could be a device
> +	 * that supports Alternate Modes as the DFP.
> +	 */
> +	if (!supports_modal(port) || supports_host(port))
> +		return false;
> +
> +	if ((port->negotiated_rev == PD_REV20 && port->data_role == TYPEC_HOST) ||
> +	    port->negotiated_rev == PD_REV30)
> +		return port->tcpc->attempt_vconn_swap_discovery(port->tcpc);
> +
> +	return false;
> +}
> +
>  static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  			const u32 *p, int cnt, u32 *response,
> -			enum adev_actions *adev_action)
> +			enum adev_actions *adev_action,
> +			enum tcpm_transmit_type rx_sop_type,
> +			enum tcpm_transmit_type *response_tx_sop_type)
>  {
>  	struct typec_port *typec = port->typec_port;
>  	struct typec_altmode *pdev;
> @@ -1711,6 +1812,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  	int cmd_type;
>  	int cmd;
>  	int i;
> +	int ret;
>  
>  	cmd_type = PD_VDO_CMDT(p[0]);
>  	cmd = PD_VDO_CMD(p[0]);
> @@ -1723,9 +1825,25 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>  				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>  
> -	svdm_version = typec_get_negotiated_svdm_version(typec);
> -	if (svdm_version < 0)
> -		return 0;
> +	switch (rx_sop_type) {
> +	case TCPC_TX_SOP_PRIME:
> +		if (!IS_ERR_OR_NULL(port->cable)) {
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			if (PD_VDO_SVDM_VER(p[0]) < svdm_version)
> +				typec_cable_set_svdm_version(port->cable, svdm_version);
> +		}
> +		break;
> +	case TCPC_TX_SOP:
> +		svdm_version = typec_get_negotiated_svdm_version(typec);
> +		if (svdm_version < 0)
> +			return 0;
> +		break;
> +	default:
> +		svdm_version = typec_get_negotiated_svdm_version(typec);
> +		if (svdm_version < 0)
> +			return 0;
> +		break;
> +	}
>  
>  	switch (cmd_type) {
>  	case CMDT_INIT:
> @@ -1795,22 +1913,89 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  			      (VDO_SVDM_VERS(typec_get_negotiated_svdm_version(typec)));
>  		break;
>  	case CMDT_RSP_ACK:
> -		/* silently drop message if we are not connected */
> -		if (IS_ERR_OR_NULL(port->partner))
> +		/*
> +		 * Silently drop message if we are not connected, but can process
> +		 * if SOP' Discover Identity prior to explicit contract.
> +		 */
> +		if (IS_ERR_OR_NULL(port->partner) &&
> +		    !(rx_sop_type == TCPC_TX_SOP_PRIME && cmd == CMD_DISCOVER_IDENT))
>  			break;
>  
>  		tcpm_ams_finish(port);
>  
>  		switch (cmd) {
> +		/*
> +		 * SVDM Command Flow for SOP and SOP':
> +		 * SOP		Discover Identity
> +		 * SOP'		Discover Identity
> +		 * SOP		Discover SVIDs
> +		 *		Discover Modes
> +		 *
> +		 * Perform Discover SOP' if the port can communicate with cable
> +		 * plug.
> +		 */
>  		case CMD_DISCOVER_IDENT:
> -			if (PD_VDO_SVDM_VER(p[0]) < svdm_version)
> -				typec_partner_set_svdm_version(port->partner,
> -							       PD_VDO_SVDM_VER(p[0]));
> -			/* 6.4.4.3.1 */
> -			svdm_consume_identity(port, p, cnt);
> -			response[0] = VDO(USB_SID_PD, 1, typec_get_negotiated_svdm_version(typec),
> -					  CMD_DISCOVER_SVID);
> -			rlen = 1;
> +			switch (rx_sop_type) {
> +			case TCPC_TX_SOP:
> +				if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
> +					typec_partner_set_svdm_version(port->partner,
> +								       PD_VDO_SVDM_VER(p[0]));
> +					/* If cable is discovered before partner, downgrade svdm */
> +					if (!IS_ERR_OR_NULL(port->cable) &&
> +					    (typec_get_cable_svdm_version(port->typec_port) >
> +					    svdm_version))
> +						typec_cable_set_svdm_version(port->cable,
> +									     svdm_version);
> +				}
> +				/* 6.4.4.3.1 */
> +				svdm_consume_identity(port, p, cnt);
> +				/* Attempt Vconn swap, delay SOP' discovery if necessary */
> +				if (tcpm_attempt_vconn_swap_discovery(port)) {
> +					port->send_discover_prime = true;
> +					port->upcoming_state = VCONN_SWAP_SEND;
> +					ret = tcpm_ams_start(port, VCONN_SWAP);
> +					if (!ret)
> +						return 0;
> +					port->upcoming_state = INVALID_STATE;
> +					port->send_discover_prime = false;
> +				}
> +
> +				/*
> +				 * Attempt Discover Identity on SOP' if the
> +				 * cable was not discovered previously, and use
> +				 * the SVDM version of the partner to probe.
> +				 */
> +				if (IS_ERR_OR_NULL(port->cable) &&
> +				    tcpm_can_communicate_sop_prime(port)) {
> +					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
> +					port->send_discover_prime = true;
> +					response[0] = VDO(USB_SID_PD, 1,
> +							  typec_get_negotiated_svdm_version(typec),
> +							  CMD_DISCOVER_IDENT);
> +					rlen = 1;
> +				} else {
> +					*response_tx_sop_type = TCPC_TX_SOP;
> +					response[0] = VDO(USB_SID_PD, 1,
> +							  typec_get_negotiated_svdm_version(typec),
> +							  CMD_DISCOVER_SVID);
> +					rlen = 1;
> +				}
> +				break;
> +			case TCPC_TX_SOP_PRIME:
> +				/*
> +				 * svdm_consume_identity_sop_prime will determine
> +				 * the svdm_version for the cable moving forward.
> +				 */
> +				svdm_consume_identity_sop_prime(port, p, cnt);
> +				*response_tx_sop_type = TCPC_TX_SOP;
> +				response[0] = VDO(USB_SID_PD, 1,
> +						  typec_get_negotiated_svdm_version(typec),
> +						  CMD_DISCOVER_SVID);
> +				rlen = 1;
> +				break;
> +			default:
> +				return 0;
> +			}
>  			break;
>  		case CMD_DISCOVER_SVID:
>  			/* 6.4.4.3.2 */
> @@ -1896,13 +2081,15 @@ static void tcpm_pd_handle_msg(struct tcpm_port *port,
>  			       enum tcpm_ams ams);
>  
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
> -				    const __le32 *payload, int cnt)
> +				    const __le32 *payload, int cnt,
> +				    enum tcpm_transmit_type rx_sop_type)
>  {
>  	enum adev_actions adev_action = ADEV_NONE;
>  	struct typec_altmode *adev;
>  	u32 p[PD_MAX_PAYLOAD];
>  	u32 response[8] = { };
>  	int i, rlen = 0;
> +	enum tcpm_transmit_type response_tx_sop_type = TCPC_TX_SOP;
>  
>  	for (i = 0; i < cnt; i++)
>  		p[i] = le32_to_cpu(payload[i]);
> @@ -1937,7 +2124,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		 *  - We will send NAK and the flag will be cleared in the state machine.
>  		 */
>  		port->vdm_sm_running = true;
> -		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
> +		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action,
> +				    rx_sop_type, &response_tx_sop_type);
>  	} else {
>  		if (port->negotiated_rev >= PD_REV30)
>  			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> @@ -2005,19 +2193,38 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	mutex_lock(&port->lock);
>  
>  	if (rlen > 0)
> -		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> +		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1, response_tx_sop_type);
>  	else
>  		port->vdm_sm_running = false;
>  }
>  
>  static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
> -			  const u32 *data, int count)
> +			  const u32 *data, int count, enum tcpm_transmit_type tx_sop_type)
>  {
> -	int svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> +	int svdm_version;
>  	u32 header;
>  
> -	if (svdm_version < 0)
> -		return;
> +	switch (tx_sop_type) {
> +	case TCPC_TX_SOP_PRIME:
> +		/*
> +		 * If the port partner is discovered, then the port partner's
> +		 * SVDM Version will be returned
> +		 */
> +		svdm_version = typec_get_cable_svdm_version(port->typec_port);
> +		if (svdm_version < 0)
> +			svdm_version = SVDM_VER_MAX;
> +		break;
> +	case TCPC_TX_SOP:
> +		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> +		if (svdm_version < 0)
> +			return;
> +		break;
> +	default:
> +		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> +		if (svdm_version < 0)
> +			return;
> +		break;
> +	}
>  
>  	if (WARN_ON(count > VDO_MAX_SIZE - 1))
>  		count = VDO_MAX_SIZE - 1;
> @@ -2026,7 +2233,7 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
>  	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
>  			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION),
>  			svdm_version, cmd);
> -	tcpm_queue_vdm(port, header, data, count);
> +	tcpm_queue_vdm(port, header, data, count, tx_sop_type);
>  }
>  
>  static unsigned int vdm_ready_timeout(u32 vdm_hdr)
> @@ -2060,6 +2267,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  	struct pd_message msg;
>  	int i, res = 0;
>  	u32 vdo_hdr = port->vdo_data[0];
> +	u32 response[8] = { };
>  
>  	switch (port->vdm_state) {
>  	case VDM_STATE_READY:
> @@ -2084,7 +2292,17 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			case CMD_DISCOVER_IDENT:
>  				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
>  				if (res == 0) {
> -					port->send_discover = false;
> +					switch (port->tx_sop_type) {
> +					case TCPC_TX_SOP_PRIME:
> +						port->send_discover_prime = false;
> +						break;
> +					case TCPC_TX_SOP:
> +						port->send_discover = false;
> +						break;
> +					default:
> +						port->send_discover = false;
> +						break;
> +					}
>  				} else if (res == -EAGAIN) {
>  					port->vdo_data[0] = 0;
>  					mod_send_discover_delayed_work(port,
> @@ -2153,19 +2371,49 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  				tcpm_ams_finish(port);
>  		} else {
>  			tcpm_ams_finish(port);
> +			if (port->tx_sop_type == TCPC_TX_SOP)
> +				break;
> +			/* Handle SOP' Transmission Errors */
> +			switch (PD_VDO_CMD(vdo_hdr)) {
> +			/*
> +			 * If Discover Identity fails on SOP', then resume
> +			 * discovery process on SOP only.
> +			 */
> +			case CMD_DISCOVER_IDENT:
> +				port->vdo_data[0] = 0;
> +				response[0] = VDO(USB_SID_PD, 1,
> +						  typec_get_negotiated_svdm_version(
> +									port->typec_port),
> +						  CMD_DISCOVER_SVID);
> +				tcpm_queue_vdm(port, response[0], &response[1],
> +					       0, TCPC_TX_SOP);
> +				break;
> +			default:
> +				break;
> +			}
>  		}
>  		break;
>  	case VDM_STATE_SEND_MESSAGE:
>  		/* Prepare and send VDM */
>  		memset(&msg, 0, sizeof(msg));
> -		msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
> -					  port->pwr_role,
> -					  port->data_role,
> -					  port->negotiated_rev,
> -					  port->message_id, port->vdo_count);
> +		if (port->tx_sop_type == TCPC_TX_SOP_PRIME) {
> +			msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
> +						  0,	/* Cable Plug Indicator for DFP/UFP */
> +						  0,	/* Reserved */
> +						  port->negotiated_rev_prime,
> +						  port->message_id_prime,
> +						  port->vdo_count);
> +		} else {
> +			msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
> +						  port->pwr_role,
> +						  port->data_role,
> +						  port->negotiated_rev,
> +						  port->message_id,
> +						  port->vdo_count);
> +		}
>  		for (i = 0; i < port->vdo_count; i++)
>  			msg.payload[i] = cpu_to_le32(port->vdo_data[i]);
> -		res = tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
> +		res = tcpm_pd_transmit(port, port->tx_sop_type, &msg);
>  		if (res < 0) {
>  			port->vdm_state = VDM_STATE_ERR_SEND;
>  		} else {
> @@ -2552,7 +2800,8 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
>  }
>  
>  static void tcpm_pd_data_request(struct tcpm_port *port,
> -				 const struct pd_message *msg)
> +				 const struct pd_message *msg,
> +				 enum tcpm_transmit_type rx_sop_type)
>  {
>  	enum pd_data_msg_type type = pd_header_type_le(msg->header);
>  	unsigned int cnt = pd_header_cnt_le(msg->header);
> @@ -2593,8 +2842,11 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
>  			break;
>  		}
>  
> -		if (rev < PD_MAX_REV)
> +		if (rev < PD_MAX_REV) {
>  			port->negotiated_rev = rev;
> +			if (port->negotiated_rev_prime > port->negotiated_rev)
> +				port->negotiated_rev_prime = port->negotiated_rev;
> +		}
>  
>  		if (port->pwr_role == TYPEC_SOURCE) {
>  			if (port->ams == GET_SOURCE_CAPABILITIES)
> @@ -2645,8 +2897,11 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
>  			break;
>  		}
>  
> -		if (rev < PD_MAX_REV)
> +		if (rev < PD_MAX_REV) {
>  			port->negotiated_rev = rev;
> +			if (port->negotiated_rev_prime > port->negotiated_rev)
> +				port->negotiated_rev_prime = port->negotiated_rev;
> +		}
>  
>  		if (port->pwr_role != TYPEC_SOURCE || cnt != 1) {
>  			tcpm_pd_handle_msg(port,
> @@ -2702,7 +2957,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
>  					   NONE_AMS);
>  		break;
>  	case PD_DATA_VENDOR_DEF:
> -		tcpm_handle_vdm_request(port, msg->payload, cnt);
> +		tcpm_handle_vdm_request(port, msg->payload, cnt, rx_sop_type);
>  		break;
>  	case PD_DATA_BIST:
>  		port->bist_request = le32_to_cpu(msg->payload[0]);
> @@ -3151,7 +3406,7 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
>  			if (le16_to_cpu(msg->header) & PD_HEADER_EXT_HDR)
>  				tcpm_pd_ext_msg_request(port, msg);
>  			else if (cnt)
> -				tcpm_pd_data_request(port, msg);
> +				tcpm_pd_data_request(port, msg, rx_sop_type);
>  			else
>  				tcpm_pd_ctrl_request(port, msg, rx_sop_type);
>  		}
> @@ -3808,6 +4063,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  
>  	port->attached = true;
>  	port->send_discover = true;
> +	port->send_discover_prime = false;
>  
>  	return 0;
>  
> @@ -3824,6 +4080,15 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  
>  static void tcpm_typec_disconnect(struct tcpm_port *port)
>  {
> +	/*
> +	 * Unregister plug/cable outside of port->connected because cable can
> +	 * be discovered before SRC_READY/SNK_READY states where port->connected
> +	 * is set.
> +	 */
> +	typec_unregister_plug(port->plug_prime);
> +	typec_unregister_cable(port->cable);
> +	port->plug_prime = NULL;
> +	port->cable = NULL;
>  	if (port->connected) {
>  		typec_partner_set_usb_power_delivery(port->partner, NULL);
>  		typec_unregister_partner(port->partner);
> @@ -3946,6 +4211,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>  
>  	port->attached = true;
>  	port->send_discover = true;
> +	port->send_discover_prime = false;
>  
>  	return 0;
>  }
> @@ -4307,14 +4573,23 @@ static void run_state_machine(struct tcpm_port *port)
>  		 * 6.4.4.3.1 Discover Identity
>  		 * "The Discover Identity Command Shall only be sent to SOP when there is an
>  		 * Explicit Contract."
> -		 * For now, this driver only supports SOP for DISCOVER_IDENTITY, thus using
> -		 * port->explicit_contract to decide whether to send the command.
> +		 *
> +		 * Discover Identity on SOP' should be discovered prior to the
> +		 * ready state, but if done after a Vconn Swap following Discover
> +		 * Identity on SOP then the discovery process can be run here
> +		 * as well.
>  		 */
>  		if (port->explicit_contract) {
> -			tcpm_set_initial_svdm_version(port);
> +			if (port->send_discover_prime) {
> +				port->tx_sop_type = TCPC_TX_SOP_PRIME;
> +			} else {
> +				port->tx_sop_type = TCPC_TX_SOP;
> +				tcpm_set_initial_svdm_version(port);
> +			}
>  			mod_send_discover_delayed_work(port, 0);
>  		} else {
>  			port->send_discover = false;
> +			port->send_discover_prime = false;
>  		}
>  
>  		/*
> @@ -4605,14 +4880,23 @@ static void run_state_machine(struct tcpm_port *port)
>  		 * 6.4.4.3.1 Discover Identity
>  		 * "The Discover Identity Command Shall only be sent to SOP when there is an
>  		 * Explicit Contract."
> -		 * For now, this driver only supports SOP for DISCOVER_IDENTITY, thus using
> -		 * port->explicit_contract.
> +		 *
> +		 * Discover Identity on SOP' should be discovered prior to the
> +		 * ready state, but if done after a Vconn Swap following Discover
> +		 * Identity on SOP then the discovery process can be run here
> +		 * as well.
>  		 */
>  		if (port->explicit_contract) {
> -			tcpm_set_initial_svdm_version(port);
> +			if (port->send_discover_prime) {
> +				port->tx_sop_type = TCPC_TX_SOP_PRIME;
> +			} else {
> +				port->tx_sop_type = TCPC_TX_SOP;
> +				tcpm_set_initial_svdm_version(port);
> +			}
>  			mod_send_discover_delayed_work(port, 0);
>  		} else {
>  			port->send_discover = false;
> +			port->send_discover_prime = false;
>  		}
>  
>  		power_supply_changed(port->psy);
> @@ -4653,6 +4937,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_unregister_altmodes(port);
>  		port->nr_sink_caps = 0;
>  		port->send_discover = true;
> +		port->send_discover_prime = false;
>  		if (port->pwr_role == TYPEC_SOURCE)
>  			tcpm_set_state(port, SRC_HARD_RESET_VBUS_OFF,
>  				       PD_T_PS_HARD_RESET);
> @@ -4799,20 +5084,25 @@ static void run_state_machine(struct tcpm_port *port)
>  	/* DR_Swap states */
>  	case DR_SWAP_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
> -		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20)
> +		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
>  			port->send_discover = true;
> +			port->send_discover_prime = false;
> +		}
>  		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
>  				    PD_T_SENDER_RESPONSE);
>  		break;
>  	case DR_SWAP_ACCEPT:
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
> -		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20)
> +		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
>  			port->send_discover = true;
> +			port->send_discover_prime = false;
> +		}
>  		tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
>  		break;
>  	case DR_SWAP_SEND_TIMEOUT:
>  		tcpm_swap_complete(port, -ETIMEDOUT);
>  		port->send_discover = false;
> +		port->send_discover_prime = false;
>  		tcpm_ams_finish(port);
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
> @@ -5794,7 +6084,8 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
>  		goto unlock;
>  
>  	/* Send when the state machine is idle */
> -	if (port->state != SNK_READY || port->vdm_sm_running || port->send_discover)
> +	if (port->state != SNK_READY || port->vdm_sm_running || port->send_discover ||
> +	    port->send_discover_prime)
>  		goto resched;
>  
>  	port->upcoming_state = GET_SINK_CAP;
> @@ -5817,11 +6108,12 @@ static void tcpm_send_discover_work(struct kthread_work *work)
>  
>  	mutex_lock(&port->lock);
>  	/* No need to send DISCOVER_IDENTITY anymore */
> -	if (!port->send_discover)
> +	if (!port->send_discover && !port->send_discover_prime)
>  		goto unlock;
>  
>  	if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
>  		port->send_discover = false;
> +		port->send_discover_prime = false;
>  		goto unlock;
>  	}
>  
> @@ -5831,7 +6123,7 @@ static void tcpm_send_discover_work(struct kthread_work *work)
>  		goto unlock;
>  	}
>  
> -	tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
> +	tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0, port->tx_sop_type);
>  
>  unlock:
>  	mutex_unlock(&port->lock);
> diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
> index 3a747938cdab..c09c5a12e273 100644
> --- a/include/linux/usb/pd_vdo.h
> +++ b/include/linux/usb/pd_vdo.h
> @@ -86,12 +86,15 @@
>   *
>   * Request is simply properly formatted SVDM header
>   *
> - * Response is 4 data objects:
> + * Response is 4 data objects for Power Delivery 2.0 and Passive Cables for
> + * Power Delivery 3.0. Active Cables in Power Delivery 3.0 have 5 data objects.
>   * [0] :: SVDM header
>   * [1] :: Identitiy header
>   * [2] :: Cert Stat VDO
>   * [3] :: (Product | Cable) VDO
> + * [4] :: Cable VDO 1
>   * [4] :: AMA VDO
> + * [5] :: Cable VDO 2
>   *
>   */
>  #define VDO_INDEX_HDR		0
> @@ -100,6 +103,8 @@
>  #define VDO_INDEX_CABLE		3
>  #define VDO_INDEX_PRODUCT	3
>  #define VDO_INDEX_AMA		4
> +#define VDO_INDEX_CABLE_1	4
> +#define VDO_INDEX_CABLE_2	5
>  
>  /*
>   * SVDM Identity Header
> @@ -150,6 +155,7 @@
>  #define PD_IDH_MODAL_SUPP(vdo)	((vdo) & (1 << 26))
>  #define PD_IDH_DFP_PTYPE(vdo)	(((vdo) >> 23) & 0x7)
>  #define PD_IDH_CONN_TYPE(vdo)	(((vdo) >> 21) & 0x3)
> +#define PD_IDH_HOST_SUPP(vdo)  ((vdo) & (1 << 31))
>  
>  /*
>   * Cert Stat VDO
> -- 
> 2.43.0.472.g3155946c3a-goog

-- 
heikki

