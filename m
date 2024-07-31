Return-Path: <linux-usb+bounces-12688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0C94296F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 10:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6361F23735
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 08:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C3D4D108;
	Wed, 31 Jul 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wMQtgiPN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B0D1B95B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415518; cv=none; b=ryqhyBlfxdOCiZPIRx11fdhn4M0lWWAjn2ZcynoEqutkFQS/p7U+GpDjzZ/7A5qR4MjjwEscD4cX0uC6ejBkRvEsLZGNdaqP2W+ORq65BRFSLJ6tpsmIy5LWwjqVqatf2IoDkOJtmv6E9mDiWkyTlxsBkSJ/nSokI3G5K0AGpSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415518; c=relaxed/simple;
	bh=T0hgZzxcbycjDKArSUhUrQawZWOQS7uVUzRD35sHWog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ikw7NEs4Nf2U4BFXYyU68Oinxfwk2TyKUWhT3RO2+N2jXUiLeraXt5sg1mQgsANIBxVApY0Wci1RpPDjH+ysBJDLMGpRv3XL5svycJbRHrpTMEkYawd3TdL7vBlFTRgSgiI3cPP2oQS71FxVeHW12crgNcIYgqBpPNkv6L7muQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wMQtgiPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC33CC4AF09;
	Wed, 31 Jul 2024 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722415518;
	bh=T0hgZzxcbycjDKArSUhUrQawZWOQS7uVUzRD35sHWog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wMQtgiPNwxbQ6Slz2sxTBQwHHytdI1i3h+MBNR5Pm7esOlkP5ypmCLS0lSGZO5XKT
	 B4ZibOe/M/hwb5QwQzma7M47fVbGa+8e+ImpZzdv5Q84KceTeYbjN8FLwvph6B7P1p
	 hvtI34dYTfiR7BMycNTXuMX1EYGEDjcjJD2wXcP0=
Date: Wed, 31 Jul 2024 10:45:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	Cyril Brulebois <kibi@debian.org>
Subject: Re: [PATCH] xhci-pci: Make xhci-pci-renesas a proper modular driver
Message-ID: <2024073145-curdle-bronco-b9ca@gregkh>
References: <ZqGeehVxETDl57eT@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  drivers/usb/host/Kconfig            |  2 +-
>  drivers/usb/host/xhci-pci-renesas.c | 47 +++++++++++++++++++++---
>  drivers/usb/host/xhci-pci.c         | 57 ++++++++++-------------------
>  drivers/usb/host/xhci-pci.h         | 19 +---------
>  drivers/usb/host/xhci.h             |  2 +-
>  5 files changed, 64 insertions(+), 63 deletions(-)
> 

I get the following error when building:

drivers/usb/host/xhci-pci.c:646:5: error: no previous prototype for ‘xhci_pci_probe’ [-Werror=missing-prototypes]
  646 | int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
      |     ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Can you rebase against 6.11-rc1 and fix up and resend?

thanks,

greg k-h

