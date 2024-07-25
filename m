Return-Path: <linux-usb+bounces-12412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A30B93BBF6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 07:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2361F1F21B2B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 05:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281D11C683;
	Thu, 25 Jul 2024 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CP+4rOCT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD625569
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 05:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721884020; cv=none; b=j479/hjmjcx14IlO7vMcXyS4Sz9ZgsyLwpYPXzxdSU60VMA8s+bzMmtzgyOrWQa4uirB0YlJ3fGg30HjLoYhuKYXdWXnHnwDdltZ1pcLm45dUFzTb4QNtUageATOseBzjcEmc2AF4St++ejfB1COcXnn5+pdvTzqrAEsp4wd25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721884020; c=relaxed/simple;
	bh=5/ieLNsgsVHfYPjWmiRRKS0ZYP+m5XEyngI+m97FK1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPyASMZWrlMPPqm6OOvoeXZJBrycNx94ZHLdsH98RAhi2LGqr2ZisoNzs/CdbiAEOLd1drNFtyuuUn2HP1+anaLDmSp78FyLoOJ2FPSKbcEGvKud9idDB+vsMZHiwBVt0TuInaKCEZIckHm2LBVoiQgLwX5M7Mz2P5bfOZDFbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CP+4rOCT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2F5C32786;
	Thu, 25 Jul 2024 05:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721884020;
	bh=5/ieLNsgsVHfYPjWmiRRKS0ZYP+m5XEyngI+m97FK1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP+4rOCT7B6o4z/o4f/mcA00PQJBPQV7vbntzvLsiJcQPtYk74IFo+JKYhFQkbVZG
	 bV+OyUCarWdrvoCW3enTDREX92fK03yjFUoCy+Ly18pqF3L4Zi0VXerocBJrFDnw5+
	 mxKJf0zaQdpRhDZ82LvshQQ+b1aPmdqiAINPs3Io=
Date: Thu, 25 Jul 2024 07:06:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	Cyril Brulebois <kibi@debian.org>
Subject: Re: [PATCH] xhci-pci: Make xhci-pci-renesas a proper modular driver
Message-ID: <2024072515-specks-gradient-6779@gregkh>
References: <ZqGeehVxETDl57eT@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqGeehVxETDl57eT@decadent.org.uk>

On Thu, Jul 25, 2024 at 02:38:18AM +0200, Ben Hutchings wrote:
> If CONFIG_USB_XHCI_PCI_RENESAS is enabled, xhci-pci conditionally
> calls into the xhci-pci-renesas module, which means both modules must
> be loaded to use any xHCI PCI controller.
> 
> The MODULE_FIRMWARE declaration in the base xhci-pci module causes
> initramfs-tools to check for and warn about missing firmware for the
> Renesas xHCI controllers, when any xHCI PCI controller is present.
> And because of the previous oddity, simply moving this declaration to
> xhci-pci-renesas wouldn't help.
> 
> To fix this, reverse the relationship between the modules:
> 
> - Remove the quirk for the Renesas xHCIs, and the driver_data
>   structure used only for them
> - In xhci-pci:
>   - Rename xhci_pci_probe() to xhci_pci_common_probe()
>   - Export xhci_pci_common_probe() and xhci_pci_remove()
>   - Use a new probe function that rejects the Renesas xHCIs and then
>     calls the common probe function
> - In xhci-pci-renesas:
>   - Stop exporting renesas_xhci_check_request_fw()
>   - Add a probe function that calls renesas_xhci_check_request_fw()
>     followed by xhci_pci_common_probe()
>   - Add and register a new pci_driver matching only the Renesas xHCIs
>     and using its own probe function, but with other operations the
>     same as in xhci-pci
> - Make CONFIG_USB_XHCI_PCI_RENESAS depend on CONFIG_USB_XHCI_PCI,
>   not the other way around
> 
> Finally, move the MODULE_FIRMWARE declaration to xhci-pci-renesas.

Thanks for doing this, this has long bugged me, and "simple" fixes
didn't seem to do it, but this looks nice.  I'll queue it up after -rc1
is out.

greg k-h

