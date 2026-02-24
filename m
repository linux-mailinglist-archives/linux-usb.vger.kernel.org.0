Return-Path: <linux-usb+bounces-33638-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIChMoR6nWmAQAQAu9opvQ
	(envelope-from <linux-usb+bounces-33638-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:16:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7E185319
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C098030668B6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35441377541;
	Tue, 24 Feb 2026 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGu/GK8V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05915377552;
	Tue, 24 Feb 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927914; cv=none; b=tfDT881EARUsFgrO/kI8ovmGHLvujVbg9fBh/pr3Omr+4e+PfRHgM1aXsh0aGU/ymk1DnuAVrSVU9QrWXLwf7cT3J43MOfaymdIpmExMr7op6IKLlCX/pHzqrfqcme1rBd5ck30SAuiTCZDYA+7aDBUV/Dl6JiJmYzUPQwhn5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927914; c=relaxed/simple;
	bh=3I/OICKr5u0Ksu4D/eKqihZ34EEk2ehgYFJgcqzvMCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCs89erRNzpf+sAohrUU06M+O6/bY3kfNsWrbzxn95qh3reTWBWCzyw0i8VZrVtGe/bNrR+4q1FU2pRNrLf+mSJO+xx5N4eyI4bh6Ki4jEUiz6KkT/g1FXnSwxkGfSHDhnCKoqSFA4KfV/CcnY1DHDEjRyr8eE3HdFvwVCFlfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGu/GK8V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771927910; x=1803463910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3I/OICKr5u0Ksu4D/eKqihZ34EEk2ehgYFJgcqzvMCY=;
  b=IGu/GK8VTE30tGe18+KvQJjtkPQTyh1m3h05FsQGjgPtC/VJTlse+mzY
   Iu6rE5eIeJOHG0LAAkP6LbSmEhIFeFZD7td/+lliLEM1YEIleZz3Vm24p
   Scr6JE+XH3ulsmhIX1iBlmhlrMoWsLvzn+Ig7wehkJ9dm8rC7eZUBaAaw
   CFClJTFdmEg2xdztavMAY8fe3huJ4RIE0X1imYHxZ3ITgw8MhPbrRgiMN
   4rK04jYy2w9PGYxygxMyPCke3U5Ulf56PKKIwYZ/ccKtkUdRGYSOUaRJE
   wk/3G2REfWk9unnkIk/qlDsvVTbVROiXzm5TQ6LKNLqdPVUBfKcR18BWD
   A==;
X-CSE-ConnectionGUID: /EI50obPQRS8PJpfz03acQ==
X-CSE-MsgGUID: 2D1RmfzDS/OtqzXO49zluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98399745"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="98399745"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:11:49 -0800
X-CSE-ConnectionGUID: xPPZs3/oQd622i8IkQ6prQ==
X-CSE-MsgGUID: zGTS8Te1T22oxEqACe6RHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214692938"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.187])
  by fmviesa008.fm.intel.com with SMTP; 24 Feb 2026 02:11:45 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 24 Feb 2026 12:11:10 +0200
Date: Tue, 24 Feb 2026 12:11:10 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>,
	RD Babiera <rdbabiera@google.com>
Subject: Re: [PATCH v2 2/2] usb: typec: tcpm: add support for Sink Cap
 Extended msg response
Message-ID: <aZ15PuYjYPN9Jtdo@kuha>
References: <20260223-skedb-v2-0-60675765bc7e@google.com>
 <20260223-skedb-v2-2-60675765bc7e@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-skedb-v2-2-60675765bc7e@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33638-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[skedb.pid:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 2DA7E185319
X-Rspamd-Action: no action

Mon, Feb 23, 2026 at 08:05:38PM +0000, Amit Sunil Dhamne via B4 Relay kirjoitti:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add support for responding to Sink Cap Extended msg request. To achieve
> this, include parsing support for DT properties related to Sink Cap
> Extended. The request for Sink Cap Ext is a control message while the
> response is an extended message (chunked). As the Sink Caps Extended
> Data Block size (24 Byte) is less than MaxExtendedMsgChunkLen (26 Byte),
> a single chunk is sufficient to complete this AMS.
> 
> Supporting sink cap extended messages while responding to a
> Get_Sink_Caps_Extended request when port is in Sink role is required in
> order to be compliant with at least USB PD Rev3.1 Ver1.8.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 253 +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/usb/pd.h        |  82 +++++++++++++-
>  2 files changed, 332 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index b7828160b81d31294a58aa10578e9d8b84f05ac1..bf32d33c606e2e51421034433b251e918f0571bf 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -12,6 +12,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/power_supply.h>
> @@ -188,7 +189,8 @@
>  	S(STRUCTURED_VDMS),			\
>  	S(COUNTRY_INFO),			\
>  	S(COUNTRY_CODES),			\
> -	S(REVISION_INFORMATION)
> +	S(REVISION_INFORMATION),		\
> +	S(GETTING_SINK_EXTENDED_CAPABILITIES)
>  
>  #define GENERATE_ENUM(e)	e
>  #define GENERATE_STRING(s)	#s
> @@ -229,6 +231,7 @@ enum pd_msg_request {
>  	PD_MSG_DATA_SINK_CAP,
>  	PD_MSG_DATA_SOURCE_CAP,
>  	PD_MSG_DATA_REV,
> +	PD_MSG_EXT_SINK_CAP_EXT
>  };
>  
>  enum adev_actions {
> @@ -337,6 +340,42 @@ struct pd_timings {
>  	u32 snk_bc12_cmpletion_time;
>  };
>  
> +/* Convert microwatt to watt */
> +#define UW_TO_W(pow)					((pow) / 1000000)
> +
> +/*
> + * struct pd_identifier - Contains info about PD identifiers
> + * @vid: Vendor ID (assigned by USB-IF)
> + * @pid: Product ID (assigned by manufacturer)
> + * @xid: Value assigned by USB-IF for product
> + */
> +struct pd_identifier {
> +	u16 vid;
> +	u16 pid;
> +	u32 xid;
> +};
> +
> +/*
> + * struct sink_caps_ext_data - Sink extended capability data
> + * @load_step: Indicates the load step slew rate. Value of 0 indicates 150mA/us
> + *             & 1 indicates 500 mA/us
> + * @load_char: Snk overload characteristics
> + * @compliance: Types of sources the sink has been tested & certified on
> + * @modes: Charging caps & power sources supported
> + * @spr_min_pdp: Sink Minimum PDP for SPR mode (in Watts)
> + * @spr_op_pdp: Sink Operational PDP for SPR mode (in Watts)
> + * @spr_max_pdp: Sink Maximum PDP for SPR mode (in Watts)
> + */
> +struct sink_caps_ext_data {
> +	u8 load_step;
> +	u16 load_char;
> +	u8 compliance;
> +	u8 modes;
> +	u8 spr_min_pdp;
> +	u8 spr_op_pdp;
> +	u8 spr_max_pdp;
> +};
> +
>  struct tcpm_port {
>  	struct device *dev;
>  
> @@ -585,6 +624,9 @@ struct tcpm_port {
>  
>  	/* Indicates maximum (revision, version) supported */
>  	struct pd_revision_info pd_rev;
> +
> +	struct pd_identifier pd_ident;
> +	struct sink_caps_ext_data sink_caps_ext;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *dentry;
>  	struct mutex logbuffer_lock;	/* log buffer access lock */
> @@ -1367,6 +1409,64 @@ static int tcpm_pd_send_sink_caps(struct tcpm_port *port)
>  	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
>  }
>  
> +static int tcpm_pd_send_sink_cap_ext(struct tcpm_port *port)
> +{
> +	u16 operating_snk_watt = port->operating_snk_mw / 1000;
> +	struct sink_caps_ext_data *data = &port->sink_caps_ext;
> +	struct pd_identifier *pd_ident = &port->pd_ident;
> +	struct sink_caps_ext_msg skedb = {0};
> +	struct pd_message msg;
> +	u8 data_obj_cnt;
> +
> +	if (!port->self_powered)
> +		data->spr_op_pdp = operating_snk_watt;
> +
> +	/*
> +	 * SPR Sink Minimum PDP indicates the minimum power required to operate
> +	 * a sink device in its lowest level of functionality without requiring
> +	 * power from the battery. We can use the operating_snk_watt value to
> +	 * populate it, as operating_snk_watt indicates device's min operating
> +	 * power.
> +	 */
> +	data->spr_min_pdp = operating_snk_watt;
> +
> +	if (data->spr_op_pdp < data->spr_min_pdp ||
> +	    data->spr_max_pdp < data->spr_op_pdp) {
> +		tcpm_log(port,
> +			 "Invalid PDP values, Min PDP:%u, Op PDP:%u, Max PDP:%u",
> +			 data->spr_min_pdp, data->spr_op_pdp, data->spr_max_pdp);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	memset(&msg, 0, sizeof(msg));
> +	skedb.vid = cpu_to_le16(pd_ident->vid);
> +	skedb.pid = cpu_to_le16(pd_ident->pid);
> +	skedb.xid = cpu_to_le32(pd_ident->xid);
> +	skedb.skedb_ver = SKEDB_VER_1_0;
> +	skedb.load_step = data->load_step;
> +	skedb.load_char = cpu_to_le16(data->load_char);
> +	skedb.compliance = data->compliance;
> +	skedb.modes = data->modes;
> +	skedb.spr_min_pdp = data->spr_min_pdp;
> +	skedb.spr_op_pdp = data->spr_op_pdp;
> +	skedb.spr_max_pdp = data->spr_max_pdp;
> +	memcpy(msg.ext_msg.data, &skedb, sizeof(skedb));
> +	msg.ext_msg.header = PD_EXT_HDR_LE(sizeof(skedb),
> +					   0, /* Denotes if request chunk */
> +					   0, /* Chunk Number */
> +					   1  /* Chunked */);
> +
> +	data_obj_cnt = count_chunked_data_objs(sizeof(skedb));
> +	msg.header = cpu_to_le16(PD_HEADER(PD_EXT_SINK_CAP_EXT,
> +					   port->pwr_role,
> +					   port->data_role,
> +					   port->negotiated_rev,
> +					   port->message_id,
> +					   data_obj_cnt,
> +					   1 /* Denotes if ext header */));
> +	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
> +}
> +
>  static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>  {
>  	if (delay_ms) {
> @@ -3655,6 +3755,19 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  					   PD_MSG_CTRL_NOT_SUPP,
>  					   NONE_AMS);
>  		break;
> +	case PD_CTRL_GET_SINK_CAP_EXT:
> +		/* This is an unsupported message if port type is SRC */
> +		if (port->negotiated_rev >= PD_REV30 &&
> +		    port->port_type != TYPEC_PORT_SRC)
> +			tcpm_pd_handle_msg(port, PD_MSG_EXT_SINK_CAP_EXT,
> +					   GETTING_SINK_EXTENDED_CAPABILITIES);
> +		else
> +			tcpm_pd_handle_msg(port,
> +					   port->negotiated_rev < PD_REV30 ?
> +					   PD_MSG_CTRL_REJECT :
> +					   PD_MSG_CTRL_NOT_SUPP,
> +					   NONE_AMS);
> +		break;
>  	default:
>  		tcpm_pd_handle_msg(port,
>  				   port->negotiated_rev < PD_REV30 ?
> @@ -3907,6 +4020,16 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
>  					 ret);
>  			tcpm_ams_finish(port);
>  			break;
> +		case PD_MSG_EXT_SINK_CAP_EXT:
> +			ret = tcpm_pd_send_sink_cap_ext(port);
> +			if (ret == -EOPNOTSUPP)
> +				tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP, TCPC_TX_SOP);
> +			else if (ret < 0)
> +				tcpm_log(port,
> +					 "Unable to transmit sink cap extended, ret=%d",
> +					 ret);
> +			tcpm_ams_finish(port);
> +			break;
>  		default:
>  			break;
>  		}
> @@ -7291,6 +7414,129 @@ static void tcpm_fw_get_timings(struct tcpm_port *port, struct fwnode_handle *fw
>  		port->timings.snk_bc12_cmpletion_time = val;
>  }
>  
> +static void tcpm_fw_get_pd_ident(struct tcpm_port *port)
> +{
> +	struct pd_identifier *pd_ident = &port->pd_ident;
> +	u32 *vdo;
> +
> +	/* First 3 vdo values contain info regarding USB PID, VID & XID */
> +	if (port->nr_snk_vdo >= 3)
> +		vdo = port->snk_vdo;
> +	else if (port->nr_snk_vdo_v1 >= 3)
> +		vdo = port->snk_vdo_v1;
> +	else
> +		return;
> +
> +	pd_ident->vid = PD_IDH_VID(vdo[0]);
> +	pd_ident->pid = PD_PRODUCT_PID(vdo[2]);
> +	pd_ident->xid = PD_CSTAT_XID(vdo[1]);
> +	tcpm_log(port, "vid:%#x pid:%#x xid:%#x",
> +		 pd_ident->vid, pd_ident->pid, pd_ident->xid);
> +}
> +
> +static void tcpm_parse_snk_pdos(struct tcpm_port *port)
> +{
> +	struct sink_caps_ext_data *caps = &port->sink_caps_ext;
> +	u32 max_mv, max_ma;
> +	u8 avs_tier1_pdp, avs_tier2_pdp;
> +	int i, pdo_itr;
> +	u32 *snk_pdos;
> +
> +	for (i = 0; i < port->pd_count; ++i) {
> +		snk_pdos = port->pd_list[i]->sink_desc.pdo;
> +		for (pdo_itr = 0; pdo_itr < PDO_MAX_OBJECTS && snk_pdos[pdo_itr];
> +		     ++pdo_itr) {
> +			u32 pdo = snk_pdos[pdo_itr];
> +			u8 curr_snk_pdp = 0;
> +
> +			switch (pdo_type(pdo)) {
> +			case PDO_TYPE_FIXED:
> +				max_mv = pdo_fixed_voltage(pdo);
> +				max_ma = pdo_fixed_current(pdo);
> +				curr_snk_pdp = UW_TO_W(max_mv * max_ma);
> +				break;
> +			case PDO_TYPE_BATT:
> +				curr_snk_pdp = UW_TO_W(pdo_max_power(pdo));
> +				break;
> +			case PDO_TYPE_VAR:
> +				max_mv = pdo_max_voltage(pdo);
> +				max_ma = pdo_max_current(pdo);
> +				curr_snk_pdp = UW_TO_W(max_mv * max_ma);
> +				break;
> +			case PDO_TYPE_APDO:
> +				if (pdo_apdo_type(pdo) == APDO_TYPE_PPS) {
> +					max_mv = pdo_pps_apdo_max_voltage(pdo);
> +					max_ma = pdo_pps_apdo_max_current(pdo);
> +					curr_snk_pdp = UW_TO_W(max_mv * max_ma);
> +					caps->modes |= SINK_MODE_PPS;
> +				} else if (pdo_apdo_type(pdo) ==
> +					   APDO_TYPE_SPR_AVS) {
> +					avs_tier1_pdp = UW_TO_W(SPR_AVS_TIER1_MAX_VOLT_MV
> +						* pdo_spr_avs_apdo_9v_to_15v_max_current_ma(pdo));
> +					avs_tier2_pdp = UW_TO_W(SPR_AVS_TIER2_MAX_VOLT_MV
> +						* pdo_spr_avs_apdo_15v_to_20v_max_current_ma(pdo));
> +					curr_snk_pdp = max(avs_tier1_pdp, avs_tier2_pdp);
> +					caps->modes |= SINK_MODE_AVS;
> +				}
> +				break;
> +			default:
> +				tcpm_log(port, "Invalid source PDO type, ignoring");
> +				continue;
> +			}
> +
> +			caps->spr_max_pdp = max(caps->spr_max_pdp,
> +						curr_snk_pdp);
> +		}
> +	}
> +}
> +
> +static void tcpm_fw_get_sink_caps_ext(struct tcpm_port *port,
> +				      struct fwnode_handle *fwnode)
> +{
> +	struct sink_caps_ext_data *caps = &port->sink_caps_ext;
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * Load step represents the change in current per usec that a given
> +	 * source can tolerate while maintaining Vbus within the vSrcValid
> +	 * range. For a sink this represents the "preferred" load-step value. It
> +	 * can only have 2 values (150 mA/usec or 500 mA/usec) with 150 mA/usec
> +	 * being the default.
> +	 */
> +	ret = fwnode_property_read_u32(fwnode, "sink-load-step", &val);
> +	if (!ret)
> +		caps->load_step = val == 500 ? 1 : 0;
> +
> +	fwnode_property_read_u16(fwnode, "sink-load-characteristics",
> +				 &caps->load_char);
> +	fwnode_property_read_u8(fwnode, "sink-compliance", &caps->compliance);
> +	caps->modes = SINK_MODE_VBUS;
> +
> +	/*
> +	 * As per "6.5.13.14" SPR Sink Operational PDP definition, for battery
> +	 * powered devices, this value will correspond to the PDP of the
> +	 * charging adapter either shipped or recommended for use with it. For
> +	 * batteryless sink devices SPR Operational PDP indicates the power
> +	 * required to operate all the device's functional modes. Hence, this
> +	 * value may be considered equal to port's operating_snk_mw. As
> +	 * operating_sink_mw can change as per the pd set used thus, OP PDP
> +	 * is determined when populating Sink Caps Extended Data Block.
> +	 */
> +	if (port->self_powered) {
> +		fwnode_property_read_u32(fwnode, "charging-adapter-pdp-milliwatt",
> +					 &val);
> +		caps->spr_op_pdp = (u8)(val / 1000);
> +		caps->modes |= SINK_MODE_BATT;
> +	}
> +
> +	tcpm_parse_snk_pdos(port);
> +	tcpm_log(port,
> +		 "load-step:%#x load-char:%#x compl:%#x op-pdp:%#x max-pdp:%#x",
> +		 caps->load_step, caps->load_char, caps->compliance,
> +		 caps->spr_op_pdp, caps->spr_max_pdp);
> +}
> +
>  static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle *fwnode)
>  {
>  	struct fwnode_handle *capabilities, *caps = NULL;
> @@ -7464,6 +7710,9 @@ static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle *fwnode
>  		}
>  	}
>  
> +	if (port->port_type != TYPEC_PORT_SRC)
> +		tcpm_fw_get_sink_caps_ext(port, fwnode);
> +
>  put_caps:
>  	if (caps != fwnode)
>  		fwnode_handle_put(caps);
> @@ -7506,6 +7755,8 @@ static int tcpm_fw_get_snk_vdos(struct tcpm_port *port, struct fwnode_handle *fw
>  			return ret;
>  	}
>  
> +	tcpm_fw_get_pd_ident(port);
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> index 6ccd1b2af993e60d2c68fcd3cef928858d9dd7e3..5a98983195cbb99735d7c5cf10cc43f69fd1b9bd 100644
> --- a/include/linux/usb/pd.h
> +++ b/include/linux/usb/pd.h
> @@ -34,7 +34,8 @@ enum pd_ctrl_msg_type {
>  	PD_CTRL_FR_SWAP = 19,
>  	PD_CTRL_GET_PPS_STATUS = 20,
>  	PD_CTRL_GET_COUNTRY_CODES = 21,
> -	/* 22-23 Reserved */
> +	PD_CTRL_GET_SINK_CAP_EXT = 22,
> +	/* 23 Reserved */
>  	PD_CTRL_GET_REVISION = 24,
>  	/* 25-31 Reserved */
>  };
> @@ -72,7 +73,8 @@ enum pd_ext_msg_type {
>  	PD_EXT_PPS_STATUS = 12,
>  	PD_EXT_COUNTRY_INFO = 13,
>  	PD_EXT_COUNTRY_CODES = 14,
> -	/* 15-31 Reserved */
> +	PD_EXT_SINK_CAP_EXT = 15,
> +	/* 16-31 Reserved */
>  };
>  
>  #define PD_REV10	0x0
> @@ -205,6 +207,72 @@ struct pd_message {
>  	};
>  } __packed;
>  
> +/*
> + * count_chunked_data_objs - Helper to calculate number of Data Objects on a 4
> + *   byte boundary.
> + * @size: Size of data block for extended message. Should *not* include extended
> + *   header size.
> + */
> +static inline u8 count_chunked_data_objs(u32 size)
> +{
> +	size += offsetof(struct pd_chunked_ext_message_data, data);
> +	return ((size / 4) + (size % 4 ? 1 : 0));
> +}
> +
> +/* Sink Caps Extended Data Block Version */
> +#define SKEDB_VER_1_0				1
> +
> +/* Sink Caps Extended Sink Modes */
> +#define SINK_MODE_PPS		BIT(0)
> +#define SINK_MODE_VBUS		BIT(1)
> +#define SINK_MODE_AC_SUPPLY	BIT(2)
> +#define SINK_MODE_BATT		BIT(3)
> +#define SINK_MODE_BATT_UL	BIT(4) /* Unlimited battery power supply */
> +#define SINK_MODE_AVS		BIT(5)
> +
> +/**
> + * struct sink_caps_ext_msg - Sink extended capability PD message
> + * @vid: Vendor ID
> + * @pid: Product ID
> + * @xid: Value assigned by USB-IF for product
> + * @fw: Firmware version
> + * @hw: Hardware version
> + * @skedb_ver: Sink Caps Extended Data Block (SKEDB) Version
> + * @load_step: Indicates the load step slew rate.
> + * @load_char: Sink overload characteristics
> + * @compliance: Types of sources the sink has been tested & certified on
> + * @touch_temp: Indicates the IEC standard to which the touch temperature
> + *              conforms to (if applicable).
> + * @batt_info: Indicates number batteries and hot swappable ports
> + * @modes: Charging caps & power sources supported
> + * @spr_min_pdp: Sink Minimum PDP for SPR mode
> + * @spr_op_pdp: Sink Operational PDP for SPR mode
> + * @spr_max_pdp: Sink Maximum PDP for SPR mode
> + * @epr_min_pdp: Sink Minimum PDP for EPR mode
> + * @epr_op_pdp: Sink Operational PDP for EPR mode
> + * @epr_max_pdp: Sink Maximum PDP for EPR mode
> + */
> +struct sink_caps_ext_msg {
> +	__le16 vid;
> +	__le16 pid;
> +	__le32 xid;
> +	u8 fw;
> +	u8 hw;
> +	u8 skedb_ver;
> +	u8 load_step;
> +	__le16 load_char;
> +	u8 compliance;
> +	u8 touch_temp;
> +	u8 batt_info;
> +	u8 modes;
> +	u8 spr_min_pdp;
> +	u8 spr_op_pdp;
> +	u8 spr_max_pdp;
> +	u8 epr_min_pdp;
> +	u8 epr_op_pdp;
> +	u8 epr_max_pdp;
> +} __packed;
> +
>  /* PDO: Power Data Object */
>  #define PDO_MAX_OBJECTS		7
>  
> @@ -329,6 +397,11 @@ enum pd_apdo_type {
>  #define PDO_SPR_AVS_APDO_9V_TO_15V_MAX_CURR	GENMASK(19, 10)	/* 10mA unit */
>  #define PDO_SPR_AVS_APDO_15V_TO_20V_MAX_CURR	GENMASK(9, 0)	/* 10mA unit */
>  
> +/* SPR AVS has two different current ranges 9V - 15V, 15V - 20V */
> +#define SPR_AVS_TIER1_MIN_VOLT_MV		9000
> +#define SPR_AVS_TIER1_MAX_VOLT_MV		15000
> +#define SPR_AVS_TIER2_MAX_VOLT_MV		20000
> +
>  static inline enum pd_pdo_type pdo_type(u32 pdo)
>  {
>  	return (pdo >> PDO_TYPE_SHIFT) & PDO_TYPE_MASK;
> @@ -339,6 +412,11 @@ static inline unsigned int pdo_fixed_voltage(u32 pdo)
>  	return ((pdo >> PDO_FIXED_VOLT_SHIFT) & PDO_VOLT_MASK) * 50;
>  }
>  
> +static inline unsigned int pdo_fixed_current(u32 pdo)
> +{
> +	return ((pdo >> PDO_FIXED_CURR_SHIFT) & PDO_CURR_MASK) * 10;
> +}
> +
>  static inline unsigned int pdo_min_voltage(u32 pdo)
>  {
>  	return ((pdo >> PDO_VAR_MIN_VOLT_SHIFT) & PDO_VOLT_MASK) * 50;
> 
> -- 
> 2.53.0.371.g1d285c8824-goog
> 

-- 
heikki

