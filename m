Return-Path: <linux-usb+bounces-30679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BABC6D81B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 09:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23B514F7301
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D54C32570C;
	Wed, 19 Nov 2025 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI2mEMGi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6C2BDC35;
	Wed, 19 Nov 2025 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541595; cv=none; b=jkA7MDUHSYxjAQviMcRXW3x6Fg7zfTH9rnGPF5wxKYhYEadWdJq47XakTuZw7TPVpHkurLx9gJjIBVTgxrxUTvUYNOHqJbHKahFoYjtasX8j602DyTatCe8L35nA0lFwyzQg0tSHo5jLc0hsDM0HOMakt0LcJmNrGLlpb8n+2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541595; c=relaxed/simple;
	bh=vOVYw0I7VAWDaqc+0q3jyHaewV/Lx6ANwiFwQvewnWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSkcTkX0qMXGKR9t1cCeGYhI0SnbWro3DXXRxi3VuD3bsTFTQ31k3QWuOLUGABZpSk3I0RGL1/+p0azeirl3j7e9QhRaoZcbXyuBUX7RfCCKvroxYGqR7syNGEcAjQP5BXIVvX3wotMigG2vI0AK1fTxrAfsaFxHFIzwg8c5Wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI2mEMGi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763541593; x=1795077593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vOVYw0I7VAWDaqc+0q3jyHaewV/Lx6ANwiFwQvewnWs=;
  b=PI2mEMGiGtFBwxKCkcJCOQJDEtQPj6Q1cSGf+REzso3G6IjaYvCD32V6
   f7JHtOJ+oJ0yAMl6d/Y3k/UTfz9x6LkeOXnyNgaHeauDBlS58qglBmtP0
   /ewzIOvRAsKl1SZCrIAoCRuTKfLnI111sU3V/gSzRvqObLVC7BykawdSX
   IJi4cfD7YpqSWa88iCXY2L2C0VEEIuUaz0NO0IO6t5IPD+TlV3zvXFCXn
   NpOvqcdLxxXf0ahq6VY1fNWPNM5Xt8/rcx5b19S9IX7q5l5NwM3tEtf57
   Twp0cxF30cQFdXL8jyO6XwK2Uez89MfgAvH5xrFp0v1NF5TBv0P7XmSCn
   g==;
X-CSE-ConnectionGUID: wp37ijyvTVOaumsblCiuLA==
X-CSE-MsgGUID: s4QYhJmHQsSMAa3mSCWOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76184945"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76184945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:39:51 -0800
X-CSE-ConnectionGUID: I7zuanLbR3qix+I/MICJIg==
X-CSE-MsgGUID: VRx912MrSgqUrcgfmSN8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196125555"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.82])
  by orviesa005.jf.intel.com with SMTP; 19 Nov 2025 00:39:49 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 19 Nov 2025 10:39:45 +0200
Date: Wed, 19 Nov 2025 10:39:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Monitor connector change before
 getting connector status
Message-ID: <aR2BYQSfOZjV-PuX@kuha>
References: <20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org>

On Mon, Nov 17, 2025 at 05:31:43PM +0800, Hsin-Te Yuan wrote:
> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Enable the notification for connector change before getting the
> connector status to ensure the status is synced.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39b0271667e80816270274b8dd3008..07290cd85b618b22cb989151079707dbe9f578a7 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1565,7 +1565,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	struct typec_capability *cap = &con->typec_cap;
>  	enum typec_accessory *accessory = cap->accessory;
>  	enum usb_role u_role = USB_ROLE_NONE;
> -	u64 command;
> +	u64 command, ntfy;
>  	char *name;
>  	int ret;
>  
> @@ -1659,6 +1659,15 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  		goto out;
>  	}
>  
> +	/* Enable the notification for connector change before getting the connector status */
> +	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR | UCSI_ENABLE_NTFY_CONNECTOR_CHANGE;
> +	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> +	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	if (ret < 0) {
> +		dev_warn(ucsi->dev, "con%d: failed to enable the notification for connector change\n",
> +			 con->num);
> +	}

You can't do this repeatedly with every port that is registered. That
will lead into other problems.

I think the proper way to fix this is to first register all the ports
(and their alt modes) without checking the status, then enable the
notification, and finally check the status for every port separately.

So separate the status checking part at the end of
ucsi_register_port() into a new function, and then call it for every
port right after all notications are enabled in ucsi_init().

thanks,

-- 
heikki

