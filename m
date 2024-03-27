Return-Path: <linux-usb+bounces-8474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845288E619
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6A81C2CCE7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 14:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0394A52F7C;
	Wed, 27 Mar 2024 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IQcAXXmf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD04139598
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711544690; cv=none; b=bpmvpjakw0hoWQl/emKjCqSd4oEVJ1he+z7wtoQ89tYPGG/Spv1461v6AXL2rBxMNA03XmfRujmiPxqd6kqhQugT5Pcsr2ThlrrIhiBwyAxDulL5CMT8CYca3saO655IQ3y3cuYmAK7yB6k2Ar5lv+sSAY9/7eXgJMAXs5InTZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711544690; c=relaxed/simple;
	bh=tCq28mQKgvu2SO1WIAcaFRAAc9KNpOpNYNcl455qvk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r16ISHBnEN8e2Cah1a7gK2lQsVbi0rl41/PD54geYVFb7We8NfRKnMXkEfTzDpGBcs6vVBVSb0VTkm70HBWzPU3ET+E6A4zTRyWBsNKgt+eWgl/eaWohv+VvMj4mgj9guUhdas6x3DSGrhdOuoXW3Kub+UQ29vWuabiHNpbTR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IQcAXXmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84200C433C7;
	Wed, 27 Mar 2024 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711544689;
	bh=tCq28mQKgvu2SO1WIAcaFRAAc9KNpOpNYNcl455qvk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQcAXXmfsKizSakPQOQAfqDJHWjRjzydD1VeyRpDOIVLM6PVG3rjs5E+9aukW1+gU
	 MnL7qREIenc6qtrZxNkbO9+G5+Bos2o5Cqv1lZEHs7i/hgwzBNxisnMBmAVkzIgxs8
	 sJdF1lIAcR68KpCj/NxPD94A6F0ZGq8MYHR3QvXc=
Date: Wed, 27 Mar 2024 14:04:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Martijn Braam <martijn@brixit.nl>
Cc: linux-usb@vger.kernel.org
Subject: Re: Using a composite device with kernel drivers and libusb at the
 same time
Message-ID: <2024032752-disarray-bully-40ad@gregkh>
References: <00c4fd45-dc9f-4197-952e-c7c322b6370c@brixit.nl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c4fd45-dc9f-4197-952e-c7c322b6370c@brixit.nl>

On Wed, Mar 27, 2024 at 12:33:51PM +0100, Martijn Braam wrote:
> I hope this is an acceptable place to ask this question. I've spend a bit of
> time reverse-engineering the USB protocol for a subset of Blackmagic Design
> video mixers and I have made a userspace implementation to make these
> devices usable in Linux with libusb. This is working great but the roadblock
> I have that I can't find a reasonable solution for is that these devices
> also expose an UVC webcam.
> 
> While my control software is active it's not possible to use the UVC webcam
> functionality of the device because with libusb I have to detach the kernel
> from the interfaces to make my userspace access work. As far as I can find
> documented online there's no way to have half a composite device handled by
> kernel drivers and half with userspace drivers in Linux. It seems to me the
> only solution is to make a kernel driver to bind to the control interface
> and have that kernel driver pass-through to userspace somehow with a custom
> protocol? If that is the case would such a driver even be supported in
> Linux?

Why not just make a kernel driver for the interfaces that are not uvc?
We would accept that given that you can not control a device from usbfs
and a driver at the same time as you have pointed out.

thanks,

greg k-h

