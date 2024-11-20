Return-Path: <linux-usb+bounces-17739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0989D3957
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 12:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF35F281D20
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 11:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB9C1A0711;
	Wed, 20 Nov 2024 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpakLSG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502FA19F461
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101609; cv=none; b=TrpHi6cctQx6paR8jq9q5w9f4CCCtLgh2opQI/SRSr6mUEy8bTjjarV+IG0yGW68na/Bq4tR/wzVrdY0ZC1xYfh2YY/xLUj5TTjFzs5NmpSmXfF0AdHj2bfBBlJLkHRv2r3LotjhutL7NSaZo3wF0nN4zKeUVvhmqrxdZvNwnbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101609; c=relaxed/simple;
	bh=WK7LUDYk0ktBvrzmwC6g3ElNSp5LcnP3ZDHG3ZDYMLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oumzEJ8YdZp4siIwTO8Fz20NQCPieUL9Kmhd5D9BNYAAxK35A5uU+GWEXk9ydsJljk2pnrDDo/7scbERCc+EhW5LkonVUb3rH6C8OOpPCQLYygb8XdlE7wGzCRahqljdFoiv05l9kN77zBnX9xuxGZjjs2S8+PdwmL5Bhf+KKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpakLSG+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732101608; x=1763637608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WK7LUDYk0ktBvrzmwC6g3ElNSp5LcnP3ZDHG3ZDYMLA=;
  b=hpakLSG+YuOLF9MfI0UEfL+sJMTZzbplWhrEG/hP1CF7a3GXSX3grPoM
   mv0F6RBbz35BtuBAhcUa+DZEP9nXN3yJ4Cyk4oJnbCmPJ++h5ZrcBOQ8s
   BvxPRkDPtWLhGy1wTLeHrvOTdMkDpebtCwyPntWhHdaxB/rT2nq0UZYBg
   S4LJe/WAfJQsHpJ8jO9b1PA6jwm3tO92hfL+/WW6cbDN8jDXhdbeiHo+p
   OPuPUxj/HMkO21J+G0wjoBkVjQ0TtlzRCoDAdbT1ZOEpUvjz6LP45uxKe
   mugkqmRtUwisv6VhyL62EjSyc7g3HDi+QJeIbRH7bFuTB3U1P0nRzb0Tl
   g==;
X-CSE-ConnectionGUID: qepSNFWYRiKiBYMjJX2eIA==
X-CSE-MsgGUID: NEf4WjFDTNGuLt2EPpzxxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31523528"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="31523528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:20:08 -0800
X-CSE-ConnectionGUID: r06Kk9QQSue0FZsSKRqx1Q==
X-CSE-MsgGUID: 0otTONDaR1qxIqJgJUjrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89834954"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.210])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:20:06 -0800
Date: Wed, 20 Nov 2024 12:19:57 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: amilsananak <amilsananak@gmail.com>
Cc: gregkh@linuxfoundation.org, mailing-list-name@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] add a device in uvc_driver
Message-ID: <jnbogrvahgnoegglrrht4keb5kaizkrlg6k3lg2bzexejfstd6@nybu5q4g3ewq>
References: <20241120051328.7613-1-amilsananak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120051328.7613-1-amilsananak@gmail.com>

Hi amilsananak,

add the necessary information in the commit message.

Look at this example, which is also adding support for a webcam

commit 53c264544dfce30f7741a2b1e78f90d046e5d8ff
    media: uvcvideo: Add support for Apple T2-attached FaceTime HD Camera

    Adds the requisite device id to support detection of the Apple FaceTime
    HD webcam exposed over the T2 BCE VHCI interface.

look at the git log to see more examples
$ git log drivers/media/usb/uvc/uvc_driver.c

On Wed, Nov 20, 2024 at 10:43:27AM +0530, amilsananak wrote:
> From: amilsanan <amilsananak@gmail.com>
> 
> Signed-off-by: amilsanan <amilsananak@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..1a3229ab6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2441,6 +2441,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
>  		.uvc_version = 0x010a,
>  	  } },

I think you should add a comment containing the name of the camera model you
want to add support for. Look at other examples in uvc_ids[]

e.g. look at this comment for a camera also from Quanta

	/* Quanta USB2.0 HD UVC Webcam */

> +	  { .match_flags 	= USB_DEVICE_ID_MATCH_DEVICE
> +			| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor = 0x0408,
> +	  .idProduct = 0x4033,
> +	  .bInterfaceClass = USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass = 1,
> +	  .bInterfaceProtocol =	UVC_PC_PROTOCOL_15,
> +	  .driver_info = (kernel_ulong_t) &(const struct uvc_device_info ) 
> +		{.uvc_version = 0x010a, } },
>  	/* LogiLink Wireless Webcam */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> -- 
> 2.43.0
> 

--
Kind Regards
Mehdi Djait

