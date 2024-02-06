Return-Path: <linux-usb+bounces-5953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30184B84B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 15:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16AA2B2E47D
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94ED131E44;
	Tue,  6 Feb 2024 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sxbH7t7t"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB418C31
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707230828; cv=none; b=bJpyiahjrFmSnWn8Mr0GMp+nyT3uIMtiVBlc0ief/aEBshD7gXF8WaoeVYjTyMMvFkhe1RXw24Ma26VPlx5m/lCvyI4Kdfv57Qx+PBIcexMdXIPfEvD+p76t5nSxlQX/TdRxHmbZalUIekxk5iGJiX3CaW92RDLTISkQfOA+Ir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707230828; c=relaxed/simple;
	bh=vX3om3jrEXiFTf2EW+l1CdjKG0c3i3TZ2FNfPqKLIaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBo4Jmd+D22ZjkwSpv0LCIAxgvvk96A3lY9h9IkNwFD2JcF+BzStBjnAY9BOAQRbxY5Et5MtNDAXnsAeKOMnhH4zeK5l9iU+LU01V1ECoe2XYZlwFul7sM7RXnUJ3rNwZVhPhdvuc2nSIbwosaZ1vELHRWaZcoiFa0hp/gGYnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sxbH7t7t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C065C433C7;
	Tue,  6 Feb 2024 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707230827;
	bh=vX3om3jrEXiFTf2EW+l1CdjKG0c3i3TZ2FNfPqKLIaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxbH7t7tN/O4EEM3ODXQVeNnoI6qjpJsiGp0zGXhbKm1lrSpKajDC+UocwkngU/WX
	 iMdbWh1r05f9h4OnChUP78q3ApbU339wDQogEMzNSed1Ucy9pMHw0DPpYksOT1XBzr
	 64yrHiRg0TbadXymXxDpfyHEUMy8TCX/x5zNN2Co=
Date: Tue, 6 Feb 2024 14:47:04 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	heikki.krogerus@linux.intel.com
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
Message-ID: <2024020641-relation-embattled-1fb5@gregkh>
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>

On Tue, Feb 06, 2024 at 02:56:23PM +0200, Niklas Neronin wrote:
> This patch introduces the USB Billboard Driver. Its purpose is to display,
> via debugfs, basic information about connected Billboard devices.

Very cool, I was wondering if/when someone was going to write a kernel
driver for this type of hardware.

But why debugfs?  Normally that is locked down for root-access-only by
the system (rightfully so), why is this information restricted?

And why is this a kernel driver at all?  Why can't you just do this in
userspace and add support to 'lsusb' for it?

> USB-C devices that support Alternate Modes (AUMs), such as DisplayPort
> and HDMI, can expose a simple USB 2 billboard device that describes the
> Alternate Modes the USB-C device supports. This enables users to see
> which Alternate Modes are supported by the USB-C device, even if the
> host system doesn't support them. All USB-C hosts support USB 2 devices.
> 
> The AUM information is communicated through a 'Billboard Capability
> Descriptor' and one or more 'Billboard AUM Capability Descriptors'. The
> values described in the aforementioned descriptors are exposed by this
> driver via debugfs
> 
> The driver will create a "billboards" directory within
> '/sys/kernel/debug/usb'. Each connected billboard device will have a
> corresponding file added to this "billboards" directory.
> 
> Example:
> 
> $ cat /sys/kernel/debug/usb/billboards/1-1:1.0
> Billboard:
> iAddtionalInfoURL               USB-C ADAPTOR
> bNumberOfAlternateOrUSB4Modes   1
> bPreferredAlternateOrUSB4Modes  0
> VCONNPower                      1W
> bvdVersion                      v1.21
> bAdditionalFailureInfo          0
> bReserved                       0
> 
> AUM-00:
> bwAlternateModesVdo             0x405
> bmConfigured                    AUM configuration not attempted or exited
> wSVID                           0xff01
> bAlternateOrUSB4Mode            0x0
> iAlternateOrUSB4ModeString      Generic

Looks like lsusb output, so again, why is this needed in the kernel and
only accessable by root users?

> 
> Link: https://www.usb.org/document-library/billboard-device-class-spec-revision-122-and-adopters-agreement
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

I'm not going to actually review this patch, as you didn't follow the
rules that all Intel kernel developers need to follow, sorry.  Please
work with your Linux kernel team to do this correctly, otherwise I have
can't do anything with it even if I did want to merge it :(

thanks,

greg k-h

