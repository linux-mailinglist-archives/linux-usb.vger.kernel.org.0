Return-Path: <linux-usb+bounces-7040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E88669F8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F62428236B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 06:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF26D1BC41;
	Mon, 26 Feb 2024 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OzMnqHJ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB02C95
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708928351; cv=none; b=ONanbWudTf14wqWXiqzP8Qu42SLz+VBhXD4l7CvPYpMoVuiR+z4bjxcgUkfgj7JTwqyo+83P9u6JQxGKBsHnJCjO60HV15lPfBkVmYuOTiiYUwKLJoiARBpXXZvMrylZRl6ai3eNvO+WYFoaqN6c3RYS85u8Wl7oACYSEqcTb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708928351; c=relaxed/simple;
	bh=lwIiGtRod3lgs9Sj0LRMPNJeY/RRRS1TjRRis2VLKg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/H6OqMnp/MAgsXxog4Iq9MBgXDI8iNWz4tntFDgje8cd1x/8k9RBg2RZKmPo7Bl87MN4PAICsaq/DcYI1t+HFMDYORqbeLP8z8+wjCExIZO3oVncn7MF/hAHEBISLps9P19h0sxv3jvo15ASSOBoiGmHrIYuojaY51dq2gKYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OzMnqHJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9446EC433F1;
	Mon, 26 Feb 2024 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708928350;
	bh=lwIiGtRod3lgs9Sj0LRMPNJeY/RRRS1TjRRis2VLKg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzMnqHJ0W+xxl16t99wsIdyIyYRtIWJyefTaWSA4GZrbUajMiPeKy9zwPtRQFwOTv
	 HGjP0de6hC43D+Qr1RauaUXlrZlFBQH/IzpmOEo8qfo27FYpxemrHZcD3fJQXUTac7
	 aMyLgjs1Ucds8M3h5gEnx1fy1nNdqwf+1KjjtwIw=
Date: Mon, 26 Feb 2024 07:19:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] Bluetooth: btusb: Use right timeout macro to receive
 control message
Message-ID: <2024022601-amniotic-perfectly-f767@gregkh>
References: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>
 <2024022341-rice-worry-c99b@gregkh>
 <bce66ef7-efb7-4bbe-9d84-d363f046963f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bce66ef7-efb7-4bbe-9d84-d363f046963f@quicinc.com>

On Mon, Feb 26, 2024 at 02:01:12PM +0800, quic_zijuhu wrote:
> On 2/23/2024 7:33 PM, Greg KH wrote:
> > On Fri, Feb 23, 2024 at 06:00:16PM +0800, Zijun Hu wrote:
> >> USB driver defines macro @USB_CTRL_SET_TIMEOUT for sending control message
> >> and @USB_CTRL_GET_TIMEOUT for receiving, but sierra_get_swoc_info() wrongly
> >> uses @USB_CTRL_SET_TIMEOUT as argument of usb_control_msg() to receive
> >> control message, fixed by using @USB_CTRL_GET_TIMEOUT to receive message.
> > 
> > You do realize they are both the same value, right?  Why don't we just
> > change it to USB_CTRL_TIMEOUT so that people don't think changing this
> > matters?
> > 
> 1)
> will optimize this change title if this change is worthy after code review

It's wrong as-is so we can't take it anyway, so yes, please fix.

> 2)
> yes, i noticed both macros have the same value and carefully read below code block.
> 
> include/linux/usb.h:
> /*
>  * timeouts, in milliseconds, used for sending/receiving control messages
>  * they typically complete within a few frames (msec) after they're issued
>  * USB identifies 5 second timeouts, maybe more in a few cases, and a few
>  * slow devices (like some MGE Ellipse UPSes) actually push that limit.
>  */
> #define USB_CTRL_GET_TIMEOUT	5000
> #define USB_CTRL_SET_TIMEOUT	5000

And so your changelog comments are wrong.

> 3)
> these two macros are introduced at the same time by Linus Torvalds with commit 1da177e4c3f4 ("Linux-2.6.12-rc2")
> below is my points why it is better to keep current two macros than unifying both to one USB_CTRL_TIMEOUT
> 
>  point A)
>  we can't confirm that sending always have the same timeout as receiving for various devices, it is easy to adjust individual
>  macro value if sending potentially does not have the same value as receiving in future.

As it has been a few decades without needing this change, I think it's
safe to make now.

>  point B)
>  current two macros defined by usb.h has been used by many usb drivers, there are more drivers need to be corrected if macro NAME are changed.

That is fine, there is no issue with changing all uses in the kernel
tree, right?

thanks,

greg k-h

