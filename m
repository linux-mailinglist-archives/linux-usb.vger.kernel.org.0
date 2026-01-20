Return-Path: <linux-usb+bounces-32542-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Eg1LjHRb2mgMQAAu9opvQ
	(envelope-from <linux-usb+bounces-32542-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:02:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBAF49F38
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B7919E1BF6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BAA47ECF3;
	Tue, 20 Jan 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrEzvK1v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE33B47AF5B;
	Tue, 20 Jan 2026 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922824; cv=none; b=I5sEy4RkLCQh5xpoSy+I3l9ch6I8hCQQHicPjk/AOegm0eiGB3iac4MRHCXm8Z9/4HFedXsCT6AwZqj61dQKFtZEagtn4+aevyGy54QV1BqhhmQ5uxkW3pq58ebPZJv0AJtzUJ60fmrveitRy4nIl/qAcWfTZwj2MX8K1fP+k+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922824; c=relaxed/simple;
	bh=24Rc7Or2QUmqH3Y2AHPk7kggixU1F0TgcNYxQXqqqhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTTbR9qnplYTUu6uLJARSZ/bQFddyXM7i5vpZ2NHN5O3ZC+OFb7f8DBhhjC/ztFdyMdaBWO1M+X7dQioqC9Z6uzvrSJnaobfyJXk2Yqij4f2bAeLKy+BAbojbxhPiYP6FeWjRo71FtOl67UsQZOYEc2+koHYRzmlz3scgYy8k08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrEzvK1v; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922823; x=1800458823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=24Rc7Or2QUmqH3Y2AHPk7kggixU1F0TgcNYxQXqqqhw=;
  b=OrEzvK1vVqu/3LIqcOMYzdi3AdHCV+pTHQOKWpLZ5uBloa70qWi7Ypjz
   abaQx407p0U623IFboJyt2UZbI98ZdBVhSvi2Pm7qojo2c1Tcd8OAm0Rs
   aRH24ucy1jQqht3Ks1CzOxqjQYN9PSLExfZqlNcqPFPTv6V/DcOziAm8r
   oIJaDFlou+LQ5OJUnd2tCE0TnNgB5/kzWHHc8pDM8zwhAJZ9TXP1Aui9a
   /g4+sD+nneQrWEar0aAJprGkMhtEI3J1EUj1dfNkMeLF9gaMMS0bWnLX1
   nViHdBLDTS275BuDxFPdkQAO08Oaae836glI2LeZoe4eBydiR4CiOQ7UR
   g==;
X-CSE-ConnectionGUID: WZosOut6QcyUtwS5Uqm16g==
X-CSE-MsgGUID: zFT3L41+TTaEw/woXhnsLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70188880"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70188880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:27:03 -0800
X-CSE-ConnectionGUID: IY6BQjtLRemgtJnmMF2AHA==
X-CSE-MsgGUID: 28ncCFC9Sfa8wWj+OsNIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210292600"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.217])
  by orviesa003.jf.intel.com with SMTP; 20 Jan 2026 07:26:57 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 20 Jan 2026 17:26:32 +0200
Date: Tue, 20 Jan 2026 17:26:32 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v5 6/7] usb: typec: ucsi: Support mode selection to
 activate altmodes
Message-ID: <aW-eqEYa8a1Y1aZb@kuha>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
 <20260119131824.2529334-7-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119131824.2529334-7-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32542-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 6BBAF49F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Jan 19, 2026 at 01:18:23PM +0000, Andrei Kuchynski kirjoitti:
> If the ucsi port driver supports modes selection, it should implement
> `add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. With
> these operations the driver can manage the mode selection process.
> Once partner altmodes are registered, `add_partner_altmodes` is called to
> start the mode selection. When the partner is unregistered,
> `remove_partner_altmodes` is supposed to stop any ongoing processes and
> clean up the resources.
> 
> `typec_altmode_state_update` informes mode selection about the current mode
> of the Type-C connector.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V5:
> - Use the no_mode_control field instead of
>   con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
> - Squash previous V4 patches 3/8 and 7/8 into a single patch
> 
>  drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index a7b388dc7fa0f..251990475faa7 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  {
>  	const struct typec_altmode *altmode = NULL;
>  	u64 command;
> +	u16 svid = 0;
>  	int ret;
>  	u8 cur;
>  	int i;
> @@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  	for (i = 0; con->partner_altmode[i]; i++)
>  		typec_altmode_update_active(con->partner_altmode[i],
>  					    con->partner_altmode[i] == altmode);
> +
> +	if (altmode)
> +		svid = altmode->svid;
> +	typec_altmode_state_update(con->partner, svid, 0);
>  }
>  
>  static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
> @@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  			desc.vdo = alt[j].mid;
>  			desc.svid = alt[j].svid;
>  			desc.roles = TYPEC_PORT_DRD;
> +			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
> +					!con->typec_cap.no_mode_control;
>  
>  			ret = ucsi_register_altmode(con, &desc, recipient);
>  			if (ret)
> @@ -831,6 +838,8 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
>  	if (con->partner_altmode[0]) {
>  		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
>  		typec_partner_set_num_altmodes(con->partner, num_partner_am);
> +		if (con->ucsi->ops->add_partner_altmodes)
> +			con->ucsi->ops->add_partner_altmodes(con);
>  		ucsi_altmode_update_active(con);
>  		return 0;
>  	} else {
> @@ -1119,6 +1128,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
>  		return;
>  
>  	typec_set_mode(con->port, TYPEC_STATE_SAFE);
> +	if (con->ucsi->ops->remove_partner_altmodes)
> +		con->ucsi->ops->remove_partner_altmodes(con);
>  
>  	typec_partner_set_usb_power_delivery(con->partner, NULL);
>  	ucsi_unregister_partner_pdos(con);
> @@ -1659,6 +1670,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  
>  	cap->driver_data = con;
>  	cap->ops = &ucsi_ops;
> +	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
>  
>  	if (ucsi->version >= UCSI_VERSION_2_0)
>  		con->typec_cap.orientation_aware = true;
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 410389ef173ab..4797b4aa1e35b 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -70,6 +70,8 @@ struct dentry;
>   * @update_altmodes: Squashes duplicate DP altmodes
>   * @update_connector: Update connector capabilities before registering
>   * @connector_status: Updates connector status, called holding connector lock
> + * @add_partner_altmodes: Start mode selection
> + * @remove_partner_altmodes: Clean mode selection
>   *
>   * Read and write routines for UCSI interface. @sync_write must wait for the
>   * Command Completion Event from the PPM before returning, and @async_write must
> @@ -88,6 +90,8 @@ struct ucsi_operations {
>  				struct ucsi_altmode *updated);
>  	void (*update_connector)(struct ucsi_connector *con);
>  	void (*connector_status)(struct ucsi_connector *con);
> +	void (*add_partner_altmodes)(struct ucsi_connector *con);
> +	void (*remove_partner_altmodes)(struct ucsi_connector *con);
>  };
>  
>  struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
> -- 
> 2.52.0.457.g6b5491de43-goog

-- 
heikki

