Return-Path: <linux-usb+bounces-33139-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBshBlP0hWnHIgQAu9opvQ
	(envelope-from <linux-usb+bounces-33139-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:01:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A089FE938
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C31C3001F98
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 14:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD073B8BB2;
	Fri,  6 Feb 2026 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjqQVzmt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB96234966;
	Fri,  6 Feb 2026 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770386509; cv=none; b=jxOqR/q7992Q4/7gUvufDz2ZFKC+pTqPkSqf7K7P0SEiEvirh6c9ayUgD+u7BlZoFNVZgvlOy3Jalg8MG6Y4CMLfnE5zynOo+RCiv91gxfHIp4ctkGPpws8G0VFRt6vfp/D5/oQEEFwckdWeXla6J5DlvK6vVVYNw5FjUl9gst4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770386509; c=relaxed/simple;
	bh=5wT6Sv6unda2mx00OW8tvWnHKE0evlayRLD2xPx49uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBK4b4XNclrnuPgtqo+AhCnpy/CpnEvsiex+gtOeiNoCBXgLrt8mnPDC1oDTLeEOQfZrXJAhBvCBWBToI2QWEnxXOZAldg7Ir01Admo0yfiwkFEW2ulH0Za6RsMAMpteRcyawszdnG5ssD3CFByecNELr0BTK5JM2fKImeSeBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjqQVzmt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770386510; x=1801922510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wT6Sv6unda2mx00OW8tvWnHKE0evlayRLD2xPx49uw=;
  b=PjqQVzmtdcS08bN38GHHDfXhcI1w34OXFG8XUhipHqpE7U65nEjJ656z
   ntIayR4sA07c4NiCJ4PP3byTPdw3byyqC42ZdRQvpkimkwC1SPvr3wtg1
   jI16tc7fHHfbJrodYyK9vwEUZ+Z+PGtYiI/mCQcwarLSbSGrKNAzFSH9m
   2BrvsoIT9l9xotcyG0Af4W9ImUvxJ2DywBgzGr3YtTlmqwFRZHTbT2af/
   P9FKQm0tcnsgnX1+CkA6t695jdWE1E2QmVOkyd9KnI5QhQxsY0rdB8DCc
   OGUUQcbdIaJB/SaptwhkWHaORlddQs7lNQnAlDMlZS5+AxQiRdNwNlSS9
   g==;
X-CSE-ConnectionGUID: 4edF+/1OQ3mne98oao3Z6A==
X-CSE-MsgGUID: JHqliPOPTsyWdpIDNmG4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71493368"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71493368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 06:01:49 -0800
X-CSE-ConnectionGUID: uCwQLjXcTRq2oEUoQfCOzg==
X-CSE-MsgGUID: p4K9KkDKRlKSDj6FpZSN9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215051437"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.222.151])
  by orviesa003.jf.intel.com with SMTP; 06 Feb 2026 06:01:44 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 06 Feb 2026 16:01:14 +0200
Date: Fri, 6 Feb 2026 16:01:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Fedor Pchelkin <boddah8794@gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Add Thunderbolt alternate mode
 support
Message-ID: <aYX0KojDuGwM7Qjk@kuha>
References: <20260206115754.828954-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206115754.828954-1-akuchynski@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33139-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,chromium.org,vger.kernel.org,linuxfoundation.org,oss.qualcomm.com,intel.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 2A089FE938
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 11:57:54AM +0000, Andrei Kuchynski wrote:
> Introduce support for Thunderbolt (TBT) alternate mode to the UCSI driver.
> This allows the driver to manage the entry and exit of TBT altmode by
> providing the necessary typec_altmode_ops.
> 
> ucsi_altmode_update_active() is invoked when the Connector Partner Changed
> bit is set in the GET_CONNECTOR_STATUS data. This ensures that the
> alternate mode's active state is synchronized with the current mode the
> connector is operating in.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V2:
> - Update copyright year to 2026.
> - Explicitly include all required headers.
> - No functional changes compared to V1.
> 
>  drivers/usb/typec/ucsi/Makefile      |   4 +
>  drivers/usb/typec/ucsi/thunderbolt.c | 212 +++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c        |  18 ++-
>  drivers/usb/typec/ucsi/ucsi.h        |  20 +++
>  4 files changed, 249 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c
> 
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index dbc571763eff6..c7e38bf01350d 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -17,6 +17,10 @@ ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
>  	typec_ucsi-y			+= displayport.o
>  endif
>  
> +ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
> +	typec_ucsi-y			+= thunderbolt.o
> +endif
> +
>  obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
>  obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
> diff --git a/drivers/usb/typec/ucsi/thunderbolt.c b/drivers/usb/typec/ucsi/thunderbolt.c
> new file mode 100644
> index 0000000000000..434d3d8ea5b6e
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/thunderbolt.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI Thunderbolt Alternate Mode Support
> + *
> + * Copyright 2026 Google LLC
> + */
> +
> +#include <linux/usb/typec_tbt.h>
> +#include <linux/usb/pd_vdo.h>
> +#include <linux/err.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device/devres.h>
> +#include <linux/gfp_types.h>
> +#include <linux/types.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/workqueue.h>
> +
> +#include "ucsi.h"
> +
> +/**
> + * struct ucsi_tbt - Thunderbolt Alternate Mode private data structure
> + * @con: Pointer to UCSI connector structure
> + * @alt: Pointer to typec altmode structure
> + * @work: Work structure
> + * @cam: An offset into the list of alternate modes supported by the PPM
> + * @header: VDO header
> + */
> +struct ucsi_tbt {
> +	struct ucsi_connector *con;
> +	struct typec_altmode *alt;
> +	struct work_struct work;
> +	int cam;
> +	u32 header;
> +};
> +
> +static void ucsi_thunderbolt_work(struct work_struct *work)
> +{
> +	struct ucsi_tbt *tbt = container_of(work, struct ucsi_tbt, work);
> +
> +	if (typec_altmode_vdm(tbt->alt, tbt->header, NULL, 0))
> +		dev_err(&tbt->alt->dev, "VDM 0x%x failed\n", tbt->header);
> +
> +	tbt->header = 0;
> +}
> +
> +static int ucsi_thunderbolt_set_altmode(struct ucsi_tbt *tbt,
> +					bool enter, u32 vdo)
> +{
> +	int svdm_version;
> +	int cmd;
> +	int ret;
> +	u64 command = UCSI_SET_NEW_CAM |
> +		      UCSI_CONNECTOR_NUMBER(tbt->con->num) |
> +		      UCSI_SET_NEW_CAM_SET_AM(tbt->cam) |
> +		      ((u64)vdo << 32);
> +
> +	if (enter)
> +		command |= (1 << 23);
> +
> +	ret = ucsi_send_command(tbt->con->ucsi, command, NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	svdm_version = typec_altmode_get_svdm_version(tbt->alt);
> +	if (svdm_version < 0)
> +		return svdm_version;
> +
> +	if (enter)
> +		cmd = CMD_ENTER_MODE;
> +	else
> +		cmd = CMD_EXIT_MODE;
> +	tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
> +	tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
> +	tbt->header |= VDO_CMDT(CMDT_RSP_ACK);
> +
> +	schedule_work(&tbt->work);
> +
> +	return 0;
> +}
> +
> +static int ucsi_thunderbolt_enter(struct typec_altmode *alt, u32 *vdo)
> +{
> +	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
> +	struct ucsi_connector *con = tbt->con;
> +	u64 command;
> +	u8 cur = 0;
> +	int ret;
> +
> +	if (!ucsi_con_mutex_lock(con))
> +		return -ENOTCONN;
> +
> +	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
> +	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
> +	if (ret < 0) {
> +		if (con->ucsi->version > 0x0100)
> +			goto err_unlock;
> +		cur = 0xff;
> +	}
> +
> +	if (cur != 0xff) {
> +		if (cur >= UCSI_MAX_ALTMODES || con->port_altmode[cur] != alt)
> +			ret = -EBUSY;
> +		else
> +			ret = 0;
> +		goto err_unlock;
> +	}
> +
> +	ret = ucsi_thunderbolt_set_altmode(tbt, true, *vdo);
> +	ucsi_altmode_update_active(tbt->con);
> +
> +err_unlock:
> +	ucsi_con_mutex_unlock(con);
> +
> +	return ret;
> +}
> +
> +static int ucsi_thunderbolt_exit(struct typec_altmode *alt)
> +{
> +	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
> +	int ret;
> +
> +	if (!ucsi_con_mutex_lock(tbt->con))
> +		return -ENOTCONN;
> +
> +	ret = ucsi_thunderbolt_set_altmode(tbt, false, 0);
> +
> +	ucsi_con_mutex_unlock(tbt->con);
> +
> +	return ret;
> +}
> +
> +static int ucsi_thunderbolt_vdm(struct typec_altmode *alt,
> +				u32 header, const u32 *data, int count)
> +{
> +	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
> +	int cmd_type = PD_VDO_CMDT(header);
> +	int cmd = PD_VDO_CMD(header);
> +	int svdm_version;
> +
> +	if (!ucsi_con_mutex_lock(tbt->con))
> +		return -ENOTCONN;
> +
> +	svdm_version = typec_altmode_get_svdm_version(alt);
> +	if (svdm_version < 0) {
> +		ucsi_con_mutex_unlock(tbt->con);
> +		return svdm_version;
> +	}
> +
> +	switch (cmd_type) {
> +	case CMDT_INIT:
> +		if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +			svdm_version = PD_VDO_SVDM_VER(header);
> +			typec_partner_set_svdm_version(tbt->con->partner, svdm_version);
> +		}
> +		tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
> +		tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
> +		tbt->header |= VDO_CMDT(CMDT_RSP_ACK);
> +
> +		schedule_work(&tbt->work);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ucsi_con_mutex_unlock(tbt->con);
> +
> +	return 0;
> +}
> +
> +static const struct typec_altmode_ops ucsi_thunderbolt_ops = {
> +	.enter = ucsi_thunderbolt_enter,
> +	.exit = ucsi_thunderbolt_exit,
> +	.vdm = ucsi_thunderbolt_vdm,
> +};
> +
> +struct typec_altmode *ucsi_register_thunderbolt(struct ucsi_connector *con,
> +						bool override, int offset,
> +						struct typec_altmode_desc *desc)
> +{
> +	struct typec_altmode *alt;
> +	struct ucsi_tbt *tbt;
> +
> +	alt = typec_port_register_altmode(con->port, desc);
> +	if (IS_ERR(alt) || !override)
> +		return alt;
> +
> +	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
> +	if (!tbt) {
> +		typec_unregister_altmode(alt);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	tbt->cam = offset;
> +	tbt->con = con;
> +	tbt->alt = alt;
> +	INIT_WORK(&tbt->work, ucsi_thunderbolt_work);
> +	typec_altmode_set_drvdata(alt, tbt);
> +	typec_altmode_set_ops(alt, &ucsi_thunderbolt_ops);
> +
> +	return alt;
> +}
> +
> +void ucsi_thunderbolt_remove_partner(struct typec_altmode *alt)
> +{
> +	struct ucsi_tbt *tbt;
> +
> +	if (alt) {
> +		tbt = typec_altmode_get_drvdata(alt);
> +		if (tbt)
> +			cancel_work_sync(&tbt->work);
> +	}
> +}
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 251990475faa7..91b6c71dd7396 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
>  
>  #include "ucsi.h"
>  #include "trace.h"
> @@ -417,6 +418,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>  				alt = ucsi_register_displayport(con, override,
>  								i, desc);
>  			break;
> +		case USB_TYPEC_TBT_SID:
> +			alt = ucsi_register_thunderbolt(con, override, i, desc);
> +			break;
>  		default:
>  			alt = typec_port_register_altmode(con->port, desc);
>  			break;
> @@ -647,12 +651,15 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
>  	}
>  
>  	while (adev[i]) {
> -		if (recipient == UCSI_RECIPIENT_SOP &&
> -		    (adev[i]->svid == USB_TYPEC_DP_SID ||
> -			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> -			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
> +		if (recipient == UCSI_RECIPIENT_SOP) {
>  			pdev = typec_altmode_get_partner(adev[i]);
> -			ucsi_displayport_remove_partner((void *)pdev);
> +
> +			if (adev[i]->svid == USB_TYPEC_DP_SID ||
> +			    (adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> +			     adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))
> +				ucsi_displayport_remove_partner((void *)pdev);
> +			else if (adev[i]->svid == USB_TYPEC_TBT_SID)
> +				ucsi_thunderbolt_remove_partner((void *)pdev);
>  		}
>  		typec_unregister_altmode(adev[i]);
>  		adev[i++] = NULL;
> @@ -1318,6 +1325,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  
>  	if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
>  		ucsi_partner_change(con);
> +		ucsi_altmode_update_active(con);
>  
>  		/* Complete pending data role swap */
>  		if (!completion_done(&con->complete))
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 4797b4aa1e35b..43a0d01ade8ff 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -600,6 +600,26 @@ static inline void
>  ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
>  #endif /* CONFIG_TYPEC_DP_ALTMODE */
>  
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +ucsi_register_thunderbolt(struct ucsi_connector *con,
> +			  bool override, int offset,
> +			  struct typec_altmode_desc *desc);
> +
> +void ucsi_thunderbolt_remove_partner(struct typec_altmode *adev);
> +#else
> +static inline struct typec_altmode *
> +ucsi_register_thunderbolt(struct ucsi_connector *con,
> +			  bool override, int offset,
> +			  struct typec_altmode_desc *desc)
> +{
> +	return typec_port_register_altmode(con->port, desc);
> +}
> +
> +static inline void
> +ucsi_thunderbolt_remove_partner(struct typec_altmode *adev) { }
> +#endif /* CONFIG_TYPEC_TBT_ALTMODE */
> +
>  #ifdef CONFIG_DEBUG_FS
>  void ucsi_debugfs_init(void);
>  void ucsi_debugfs_exit(void);
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog

-- 
heikki

