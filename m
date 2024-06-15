Return-Path: <linux-usb+bounces-11341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 639BA90959D
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 04:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9AF1F21AA5
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 02:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633DCE573;
	Sat, 15 Jun 2024 02:12:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EC312BE5D
	for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 02:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718417578; cv=none; b=FOWgRb4fzo8Uvf/de6HSoftt0dDv9NjUPjpJPT+Z1jpTfp4vZgtx3WNqnCeeNMgXCjIewl5xkz21z42fWAfiakCpnfXty3sTz13NJFEoH+5ae4jVP39OHmqsp/Ybh/g8h8F1t5e+BGytABnWP41iHWIZ5APyLwGIsEDHOV6rIqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718417578; c=relaxed/simple;
	bh=8jvg4P7j0AS2DCzxRo49o5VTq7VMAg+68jYRkjla9po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CECWp9YIxbYQ+HP8quIXKZp60F69sjLS8IcoQQ3DyvfMbnStz2K3lgvF1MkNw5JxRfzCzXRi2s0WxYiATR67UkFvd3Xji1pJ8Ca6Qp9JYdpjpIW4XUAVcNTR8YxKpeyMp8DiI4/FcAhMwHWpuoaHAABfFtqSG6GJradM23w/sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 317762 invoked by uid 1000); 14 Jun 2024 22:12:48 -0400
Date: Fri, 14 Jun 2024 22:12:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>

On Sat, Jun 15, 2024 at 12:31:12AM +0200, Andrey Konovalov wrote:
> Hi Alan,
> 
> I'm working on implementing a USB proxy that uses libusb on one side
> and Raw Gadget on the other. The idea is to pass all requests received
> from the host via Raw Gadget to the proxied device via libusb and
> report back the responses.
> 
> However, I've stumbled upon an issue with non-0-length control
> requests that get stalled by the proxied device.
> 
> To pass an OUT control request to the device via libusb I need to
> first retrieve the data for the request from the host. And with Raw
> Gadget I can do that via USB_RAW_IOCTL_EP0_READ, which internally
> calls usb_ep_queue, waits for its completion, and copies the data to
> userspace.
> 
> But the problem is that once I retrieve the data, the request is
> automatically acked. Thus, if the proxied device stalls the request,
> it's already too late to stall it via Raw Gadget.
> 
> AFAIU, GadgetFS works the same way.
> 
> Is there a way to work around this? If this requires a change is Raw
> Gadget, that is fine. But I'm wondering if this is possible to do at
> all with the USB Gadget API: AFAIU, we have to either stall or
> retrieve the data; we cannot do both.

Yeah, this is a known weakness of the Gadget API.  There's no way to do 
it at present.

> If this is indeed impossible, perhaps you know if there's a way to
> directly use usbfs to separately submit the control request header to
> the proxied device to figure out if it wants to stall? And only then
> retrieve the data from the host via Raw Gadget if the device doesn't
> stall.

usbfs allows the user to send a complete transfer, not a partial one 
(i.e., just the SETUP transaction).  Besides, it's not possible for a 
device to stall a SETUP packet -- the USB-2.0 spec requires devices to 
respond to SETUP with ACK every time (section 8.5.3) -- so this approach 
won't solve the problem anyway. And even if it did, you'd still have to 
handle the situation where the proxy device accepts the SETUP packet and 
the data but then stalls during the Status stage of the transfer.

There has been a patch posted to support UDC drivers that don't 
automatically acknowledge non-zero-length control-OUT transfers.  But 
the patch hasn't been merged, and even if it were, all the existing UDC 
drivers would still need to be updated.

Sorry, but the kernel just doesn't provide any way to do this.

Alan Stern

