Return-Path: <linux-usb+bounces-8551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618F890515
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 17:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C401C2FA1E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5683813118A;
	Thu, 28 Mar 2024 16:22:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0DC632D792
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711642949; cv=none; b=K+18CBdLhKQpaJSTqNAKAlt44nO3qP/p87Y169pHUcWj/+57VuQPP23PJQEBpfpukVIVyWNRitCDiP79UxaiH+WyUeA3kv72hUAyweR8hCmk95E6aEal2+xWMxli4xpav/E5gzt4ipbyfB9E/r1LqNqAWVs1dTuLJfNPDklO0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711642949; c=relaxed/simple;
	bh=Nw0bVx9i/ZSLBYCdhm2vc1WYtKDjiF5WwIlenYYoXwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDFmiWL7kaTOSzYDAqg3ZRkpBNpxDtvQST8cp9i9QUZTKTMaUFho7jm3sPmGp9Xs3R2fGuN2VFouMFyUVSbJhBCYDqTU2ZG7Mcn9NejejgAyUwYnVYq6eVxYEKdnTrcdXMajXKdb06vkdKYv8aGiQosRNq56bJ0ol8kSCDZTzrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 964609 invoked by uid 1000); 28 Mar 2024 12:22:25 -0400
Date: Thu, 28 Mar 2024 12:22:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Cui Alan <AlanCui4080@outlook.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "kexybiscuit@outlook.com" <kexybiscuit@outlook.com>
Subject: Re: way to notice user when a device connected to a inappropriate
 port
Message-ID: <99f2535f-69fa-49a5-8f79-e63956e17045@rowland.harvard.edu>
References: <OS3P286MB2213E43C0914C45196A29293AD3B2@OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3P286MB2213E43C0914C45196A29293AD3B2@OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM>

On Thu, Mar 28, 2024 at 03:20:10AM +0000, Cui Alan wrote:
> If we can query the capability of the root hub among the whole system, to indicate if kernel should
> notice userspace that the device is pluged into a inappropriate port. When a port with higher speed and/or more capabilities the 
> device required is available. eg a dp display device on a normal typec even usb 2.0 only, or a superspeed device on a usb 2.0 port.
> (Windows DID that)
> 
> Also some non-standard device only provide a usb superspeed without usb 2.0 even the specifaction says
> 
> > 11.3 USB 3.2 Device Support for USB 2.0
> >USB 3.2 device certification requirements require support for USB 2.0 for all user attached devices.
> 
> I looked up the USB BOS descriptor and found that the field describing the device's speed capabilities is one-hot coded.
> So also the device can put a billboard or BOS on usb2.0 to indicate it cannot run on such a port.
> 
> struct _SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR
> { 
>     BYTE bLength;          
>     BYTE bDescriptorType;  
>     BYTE bDevCapabilityType;  // ONE HOT BIT CODING!
>     BYTE bmAttributes;
>     WORD wSpeedsSupported;
>     BYTE bFunctionalitySupport;
>     BYTE bU1DevExitLat;
>     WORD wU2DevExitLat;
> }SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR
> 
> I search the kernel source, but nothing shows that kernel trying to notice user or even a pr_info when situations above happened.

There is a message that gets logged when a high-speed-capable device is 
plugged into a USB-1.1 port, but no message when a SuperSpeed-only 
device is plugged into a USB-2 port.

Would you like to write a patch that produces such a message?

Alan Stern

