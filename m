Return-Path: <linux-usb+bounces-32396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC6D25299
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 16:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CD2F3026B75
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 15:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175AD3A7E07;
	Thu, 15 Jan 2026 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md89kCS9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D37A3A7E0C;
	Thu, 15 Jan 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489199; cv=none; b=niXCQZzjHfq0Y0T/Z9Q8kogVjgmepCDZYIdfB7Qt1CwO7a/QGj/AdbRGfMhKQVgBfpKvbY9t/se2ICC7SvuuQMdR6jOR9ecPsn8ZaKFKetoV8NpTzSmfpp1Z3b2lmBn8/LSz4NIZorDa7GKHAGmkvJXDEzteZ4emli1Ems9Jfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489199; c=relaxed/simple;
	bh=gXoI2O8+xVQi6gOwspTCtKXpFpyWlqwJWXjGm+1H+vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGxg/8ZQP/gNqoQTDQzasRu5sE2Sa60rD0Kla+/bL87NdN2dU7JYzhAQMLe3Robjb1njeQfK7HYHWJ5+sjd1T6N89Qin/ZtC+MzP4NVVFD3HTRsyAXHsTs9wHcAg1xV51HmS6tqIZe3GZJAUayXVt6tPJB9Z2ygazN3XquWCy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md89kCS9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768489193; x=1800025193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gXoI2O8+xVQi6gOwspTCtKXpFpyWlqwJWXjGm+1H+vY=;
  b=md89kCS9itS4Ewa3yB3EuuHEmLyVQjr2bMDBBdviqE0KfXozf41PqpF5
   +ugoHJqDFk3X8ojexYwdUw1/u+D+S2KNGRzq2Rhho0rn9a3ub8X7NkfU4
   jwoYkLBHaF+7kIHmueTmbsy0Z5Xbme5QgTiCZD5dGJ0WWKTiZg2OZkAJS
   NV8QqxqgKToqnAKRVITG8jLJwi4qogu5ywjdnpo+wlbWsnDkfHMqLWrsU
   BzhDT06OsKYvv68LyM3dUo0pe+fHvai58q7Vtu5LlaIKJ+Mut+f/r4LUk
   Z1kAXSSDCsFx5xXLNmW/I+t/rmSOM+zJDTETU+wsANvEiZAVcTJ6a5/TS
   w==;
X-CSE-ConnectionGUID: 2HZkldJXTqquJI6iKZFBlw==
X-CSE-MsgGUID: FSSk93kCRrOZ+WSaMt8HIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80906926"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80906926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:59:48 -0800
X-CSE-ConnectionGUID: hxNWxTP/S7uRZVcgJ6uYrw==
X-CSE-MsgGUID: Dh5X0pf8Tbu4FyqPzhj3wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="228047403"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO kuha) ([10.124.220.243])
  by fmviesa002.fm.intel.com with SMTP; 15 Jan 2026 06:59:41 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 15 Jan 2026 16:59:19 +0200
Date: Thu, 15 Jan 2026 16:59:19 +0200
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to
 activate altmodes
Message-ID: <aWkAx-QjfwQGJ6Eb@kuha>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-8-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130536.3068311-8-akuchynski@chromium.org>

Tue, Jan 13, 2026 at 01:05:35PM +0000, Andrei Kuchynski kirjoitti:
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
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index deb210c066cb5..4a6e23b55b10c 100644
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
> +					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;

Can't you just use that con->typec_cap.no_mode_control flag here?

Maybe also consider squashing that patch 3/8 into this one while at it.

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

thanks,

-- 
heikki

