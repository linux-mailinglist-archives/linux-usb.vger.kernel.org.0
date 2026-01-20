Return-Path: <linux-usb+bounces-32543-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOcuJj3Ob2mgMQAAu9opvQ
	(envelope-from <linux-usb+bounces-32543-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:49:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFF49C90
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36681769631
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 15:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1094B46AEE9;
	Tue, 20 Jan 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJC8QaUV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1746AEDA;
	Tue, 20 Jan 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922893; cv=none; b=cfuUv7c1wBs8EtDOaJej2p0bWpTZZ/OSC94UiLNLYUAZax4YLisIOKjm2NZhI8Vso8CaHrwub5qppKEQSlMMdtK0ezkA3XSPTfcqYc+Xy5s7WBfPvqPszS8g77GYwoSj0SnRQt4HWCHmAIwnkBHE0kHIXon+T2HvpvRo+mE0F4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922893; c=relaxed/simple;
	bh=KRGpNUuVMK7dsHhd41JZl39FJgjszvw/CUsCK2tvM1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE0ulDrOPFuwCM2Z8FnNScbFJhfySd/KpQ/nJ05YjY+CeZLDgqsaqtDSokm4pQipt9Qtm6nH+xCcnKBDMuo11idtuDOiVfjB0iMlb1aNNaLJ/fmx7eqf2Uap/zlNKSaLra6YdjSiGpODWJ9hNbgkrDm8wFxTkQMxt7kHhNjuV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJC8QaUV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922892; x=1800458892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KRGpNUuVMK7dsHhd41JZl39FJgjszvw/CUsCK2tvM1U=;
  b=nJC8QaUVSCIt3RNCz181Al/LRSLLqnDTgY5Golao/c/HuPG5lAge8bfV
   mtrTY+kCpCUE1WRLkPWCb9UEDa9b/52MLbOT6tYsYLq34ofOt1Lzh0ZHt
   le1RQR+hKKq4/t5NCC4qJjjaQNGGldPEt4j11jhA3DoGteBZ8QwidyWgB
   8eK8mZxELAhE1ySR08MywUzzHuMhBu/DRgMQTZC0p1e7FugUxiFi+Nxxf
   hFuzVfuL9A1bKuLFJT6rCFs6OwzNRO0+bfj/B9YxDIDRQEpwWru+Ercj9
   faPuiEOxVTOxDVQ/R7a01fRPQZp141BvpApnCogg/MuYS8Z5iHr9PgyQA
   Q==;
X-CSE-ConnectionGUID: yd81jaBjRqiEybeyZ/kNuQ==
X-CSE-MsgGUID: qOla6Fn5S3+S3nm9N6oe5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70298499"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70298499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:28:10 -0800
X-CSE-ConnectionGUID: RYXyC9fpSB+4V3p/QcnGsQ==
X-CSE-MsgGUID: g2kaM+7iQ6W5qFugORj24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206406431"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.217])
  by fmviesa008.fm.intel.com with SMTP; 20 Jan 2026 07:28:03 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 20 Jan 2026 17:27:39 +0200
Date: Tue, 20 Jan 2026 17:27:39 +0200
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
Subject: Re: [PATCH v5 7/7] usb: typec: ucsi: Enforce mode selection for
 cros_ec_ucsi
Message-ID: <aW-e6_yEl6ON-5mk@kuha>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
 <20260119131824.2529334-8-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119131824.2529334-8-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32543-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,chromium.org:email]
X-Rspamd-Queue-Id: 6BDFF49C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Jan 19, 2026 at 01:18:24PM +0000, Andrei Kuchynski kirjoitti:
> The mode selection sequence is initiated by the driver after all partner
> alternate modes have been successfully registered.
> When a partner is disconnected, the driver also stops the mode selection
> process and releases resources via `typec_mode_selection_delete`.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V5:
> - Use the no_mode_control field instead of
>   con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
> 
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index eed2a7d0ebc63..6bca2dce211cd 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/wait.h>
> +#include <linux/usb/typec_altmode.h>
>  
>  #include "ucsi.h"
>  
> @@ -33,6 +34,11 @@
>  /* Number of times to attempt recovery from a write timeout before giving up. */
>  #define WRITE_TMO_CTR_MAX	5
>  
> +/* Delay between mode entry/exit attempts, ms */
> +static const unsigned int mode_selection_delay = 1000;
> +/* Timeout for a mode entry attempt, ms */
> +static const unsigned int mode_selection_timeout = 4000;
> +
>  struct cros_ucsi_data {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> @@ -134,6 +140,20 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
>  	return ret;
>  }
>  
> +static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
> +{
> +	if (!con->typec_cap.no_mode_control)
> +		typec_mode_selection_start(con->partner,
> +					   mode_selection_delay,
> +					   mode_selection_timeout);
> +}
> +
> +static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
> +{
> +	if (!con->typec_cap.no_mode_control)
> +		typec_mode_selection_delete(con->partner);
> +}
> +
>  static const struct ucsi_operations cros_ucsi_ops = {
>  	.read_version = cros_ucsi_read_version,
>  	.read_cci = cros_ucsi_read_cci,
> @@ -141,6 +161,8 @@ static const struct ucsi_operations cros_ucsi_ops = {
>  	.read_message_in = cros_ucsi_read_message_in,
>  	.async_control = cros_ucsi_async_control,
>  	.sync_control = cros_ucsi_sync_control,
> +	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
> +	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
>  };
>  
>  static void cros_ucsi_work(struct work_struct *work)
> -- 
> 2.52.0.457.g6b5491de43-goog

-- 
heikki

