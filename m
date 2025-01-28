Return-Path: <linux-usb+bounces-19803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9BA205C3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 09:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E103A4775
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 08:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690E51DDC22;
	Tue, 28 Jan 2025 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOIDu07K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2BD166F1A;
	Tue, 28 Jan 2025 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738052201; cv=none; b=pzhRCtGr1S2nEmV0ok3xthPXfONg+x3/v3jXmjh3fxeLkIqyM7vqGjrtt5I7ZCkmEVdxK+pAnxGGsqzphww5CDnwV4wlZTzPBfvQoONqKH4VZimcESTxt/8M/boNuB3m0Nvu/JEkJCKaUTB4jCZJ28HAwu7hpuAIZh1Gi4l6ZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738052201; c=relaxed/simple;
	bh=biXE6kYpN7WDQCByWoEvKb4QHsKCHVMEIky1l2Ef7Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rach73SDFSRIHhceBfRxKam3IoBKSXgL1gdeRaiT3JRL14M9Cd34Yd/lxF4BFbOp6e66kJH5h/Zf+6F0LXD4bVm9RD2tSlIKNO6hk/9dSdgbO6OTE1QZGo8u9V0354Qo2YipIp4HV/WIFpE5y/CcjOY/g/7lCH4uusCI4KXOjB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOIDu07K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738052200; x=1769588200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=biXE6kYpN7WDQCByWoEvKb4QHsKCHVMEIky1l2Ef7Uw=;
  b=ZOIDu07KC/DiqJNR391p9/41aDg1x7mdf8tD9yIMP7IvaeiCdyK/h58L
   cZK0KNXDp1WcPZbVVd+1AzIKMaEDzrb8MqyBLqdNsizOC7mcP5g0ID2PB
   T9WMmzYR2x8A0W2jV4cLJGSPNYbo7B8ubo6kYFjLv5Pelgwo8ShrO3pSv
   B77AmxAGqITlsovUz6k6r/09go8wikOTXCjmMrmBibERr+RQtTUfqF0l9
   Fx6AjoAnabkgjLOPRcyRTlDQyy/TgY81CaDpWlKBXCk/qExM3GGco2RfS
   HALNFOsqfSkB9hwjbRyRfsigH9Is5dxV0At0mWlqei7GeNv8AH0QIjY3O
   g==;
X-CSE-ConnectionGUID: bdHc0agiR3uItNrgN8lc0Q==
X-CSE-MsgGUID: dUg9OVykRseUrdwxjifw8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63886943"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="63886943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:16:39 -0800
X-CSE-ConnectionGUID: 2wNAp8f2RZ+vEFOX8/xaZA==
X-CSE-MsgGUID: XTuXnrleQX+AAdyuS5azkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109121945"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa007.jf.intel.com with SMTP; 28 Jan 2025 00:16:36 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jan 2025 10:16:35 +0200
Date: Tue, 28 Jan 2025 10:16:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: gregkh@linuxfoundation.org, abhishekpandit@chromium.org,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: Re: [PATCH 2/2] usb: typec: thunderbolt: Remove IS_ERR check for plug
Message-ID: <Z5iSYrw_7kIGA0Ae@kuha.fi.intel.com>
References: <Z5PstnlA52Z1F2SU@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5PstnlA52Z1F2SU@google.com>

On Fri, Jan 24, 2025 at 07:40:38PM +0000, Benson Leung wrote:
> Fixes these Smatch static checker warnings:
> drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' is not an error pointer
> 
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index 94e47d30e598..6eadf7835f8f 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -351,10 +351,10 @@ static bool tbt_ready(struct typec_altmode *alt)
>  	 */
>  	for (int i = 0; i < TYPEC_PLUG_SOP_PP + 1; i++) {
>  		plug = typec_altmode_get_plug(tbt->alt, i);
> -		if (IS_ERR(plug))
> +		if (!plug)
>  			continue;
>  
> -		if (!plug || plug->svid != USB_TYPEC_TBT_SID)
> +		if (plug->svid != USB_TYPEC_TBT_SID)
>  			break;
>  
>  		plug->desc = "Thunderbolt3";
> -- 
> 2.48.1.262.g85cc9f2d1e-goog

-- 
heikki

