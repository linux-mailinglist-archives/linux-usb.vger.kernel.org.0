Return-Path: <linux-usb+bounces-5639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B20888426C5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 695EE1F28D8E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 14:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6B66DD02;
	Tue, 30 Jan 2024 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKzXVhDh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104836DCF4
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624398; cv=none; b=XfDhsa/WdygULqXQPx1E2UmhV5CtrGwXNxmEcthKt+1A8FCPqa9ehj4BecVpRrdVUPUT00f0U6StyMYw1+jfaNtK6LkaVTIdR2Iph3gq5G0510I4/dEaet5z8JmeP56uG49PMnZaSXtot4qNErXqya7KIj3rgeegzDxjjBQ0yEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624398; c=relaxed/simple;
	bh=Q1SI42N7k3N4aqUjhfGqW7TbGrF1oka+Zww77frpYlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTN9Mc+svMhbEEhC5duKjoCPuQ7b3WPdcNGwUPjA/iIQKfibV78Zbvq7pycKpj01h7ZeXwYbbx2FagntiaUQOMYmbeGGO/1z5u2hFwAyhs//3oYbDR1brBT1nRnWYasfG+JmmKM1ktaHyX9mIHz3YdFvfqoOj2Jt/8kjt3soMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKzXVhDh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706624398; x=1738160398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q1SI42N7k3N4aqUjhfGqW7TbGrF1oka+Zww77frpYlI=;
  b=EKzXVhDh+g2d3jInZ7LQ70yR+zBgvyWl+zGDcwQCw3PcHieGzWx7Du+g
   qqyCNoYQlErgm376x238Ful9Cz0NSllhQPSSJs+362itt5OjGlK5SZZLK
   IHu3484vpCGlR6D1DRXmXqGxZKjfb7s5auyQNTwMBC4WDGn6hhuwZBFD1
   WOCbbD0kcgJ2s2uNoclxiFpgBY/q9XsVHgfBEdlEXCseMSv/B2qKvfHBB
   onFVhV/hntLn0jd+W+E7+PowHOoyuUSY/QOvb9M1MM2NMoea7FtL3nizo
   VZAX7uAROqplxbMTONRVPjU74xl72nb8CgxbxfWBpaXtF+SMoRWJmcPid
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21809917"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="21809917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 06:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931464231"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="931464231"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 30 Jan 2024 06:19:53 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 30 Jan 2024 16:19:52 +0200
Date: Tue, 30 Jan 2024 16:19:52 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, benjamin.tissoires@redhat.com,
	hdegoede@redhat.com, ivan.orlov0322@gmail.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3 2/2] usb: roles: don't get/set_role() when
 usb_role_switch is unregistered
Message-ID: <ZbkFiIbF5MFciTO8@kuha.fi.intel.com>
References: <20240129093739.2371530-1-xu.yang_2@nxp.com>
 <20240129093739.2371530-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129093739.2371530-2-xu.yang_2@nxp.com>

On Mon, Jan 29, 2024 at 05:37:39PM +0800, Xu Yang wrote:
> There is a possibility that usb_role_switch device is unregistered before
> the user put usb_role_switch. In this case, the user may still want to
> get/set_role() since the user can't sense the changes of usb_role_switch.
> 
> This will add a flag to show if usb_role_switch is already registered and
> avoid unwanted behaviors.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - new patch during test patch 1
>  - add registered flag
> Changes in v3:
>  - add fix tag and stable list
> ---
>  drivers/usb/roles/class.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 2bad038fb9ad..70165dd86b5d 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -23,6 +23,7 @@ struct usb_role_switch {
>  	struct mutex lock; /* device lock*/
>  	struct module *module; /* the module this device depends on */
>  	enum usb_role role;
> +	bool registered;
>  
>  	/* From descriptor */
>  	struct device *usb2_port;
> @@ -49,6 +50,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> +	if (!sw->registered)
> +		return -EOPNOTSUPP;
> +
>  	mutex_lock(&sw->lock);
>  
>  	ret = sw->set(sw, role);
> @@ -74,7 +78,7 @@ enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
>  {
>  	enum usb_role role;
>  
> -	if (IS_ERR_OR_NULL(sw))
> +	if (IS_ERR_OR_NULL(sw) || !sw->registered)
>  		return USB_ROLE_NONE;
>  
>  	mutex_lock(&sw->lock);
> @@ -357,6 +361,8 @@ usb_role_switch_register(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> +	sw->registered = true;
> +
>  	/* TODO: Symlinks for the host port and the device controller. */
>  
>  	return sw;
> @@ -371,8 +377,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
>   */
>  void usb_role_switch_unregister(struct usb_role_switch *sw)
>  {
> -	if (!IS_ERR_OR_NULL(sw))
> +	if (!IS_ERR_OR_NULL(sw)) {
> +		sw->registered = false;
>  		device_unregister(&sw->dev);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_unregister);
>  
> -- 
> 2.34.1

-- 
heikki

