Return-Path: <linux-usb+bounces-19788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F4A1DB4D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 18:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A1A164FF4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772218A943;
	Mon, 27 Jan 2025 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lY/+E4R3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D000818A93C;
	Mon, 27 Jan 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998997; cv=none; b=Tkwfj7kcaMrmaZsjCmensULvWubx+C39lrLteEtzIvN1V6qcTEYNcZz8lBHVJ0MNC/9TYs4mvUs4on0nLZ00izEwj1ANbaB1vNcm+n2XIP7E5PvSX8l+1Pih+HX4dNlTqW/zNn30uA3j3oAnRSQwZ9rlgV5EHt2iuuM68q7UpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998997; c=relaxed/simple;
	bh=D/uzRckSG3FpY+pjYKUb1NfTl3HB/hs/iH6Dq/8rsXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9W9nTaqx83ohWUWrSKmbd3qaDATD33FzRmtBS3OWmezpojEW4Br0ph1BXOg7JgNOqzdxnlC6KDsnOcvD/34J8Ue3KxJM5+Vohc5wYqeNMBM1HQIaGCJNiWotxgY+i3VBOz01DfUH8Alf9sqhzMwJdSfO9L1e6OOHt/8Ik0uiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lY/+E4R3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCE4C4CED2;
	Mon, 27 Jan 2025 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737998995;
	bh=D/uzRckSG3FpY+pjYKUb1NfTl3HB/hs/iH6Dq/8rsXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lY/+E4R31wo6JSNSHOA3l2jFfqjhXUNdXwVZA8Ps75+3i2BPEdbm0afdXBCuHvbaN
	 iRRYFcAvJKwnhVr9ZYPDrZkH1K+ka0x6pmEscdBM3ZWoQuWUll5qxVXrLahqXfq8FA
	 sxJMoCB0de2IXM9W2ZBHoOpCFdBEN+CKmXZdsr9c=
Date: Mon, 27 Jan 2025 18:29:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Restore xhci_pci support for Renesas HCs
Message-ID: <2025012701-citrus-omission-89b3@gregkh>
References: <20250127151051.1a91bbe6@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127151051.1a91bbe6@foxbook>

On Mon, Jan 27, 2025 at 03:10:51PM +0100, Michal Pecio wrote:
> Some Renesas HCs require firmware upload to work, this is handled by the
> xhci_pci_renesas driver. Other variants of those chips load firmware from
> onboard flash and can work with xhci_pci alone.
> 
> A refactor merged in v6.12 broke the latter configuration and users are
> finding their hardware not working after upgrading and need to enable the
> firmware loader which isn't really necessary on their systems.

Why isn't it necessary?  Those chips want firmware to be uploaded, and
if the driver doesn't need it, it should be able to handle it if it is
not present.

> Let xhci_pci work with those chips as before when the firmware loader is
> disabled by kernel configuration.
> 
> Fixes: 25f51b76f90f ("xhci-pci: Make xhci-pci-renesas a proper modular driver")
> CC: stable@vger.kernel.org
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219616
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219726
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 5a5f0b2dba4d..3d08d6527b1d 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -657,17 +657,21 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  }
>  EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, "xhci");
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
>  static const struct pci_device_id pci_ids_reject[] = {
>  	/* handled by xhci-pci-renesas */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
>  	{ /* end: all zeroes */ }
>  };
> +#endif
>  
>  static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
>  	if (pci_match_id(pci_ids_reject, dev))
>  		return -ENODEV;
> +#endif

No, please don't put #ifdef in .c files if at all preventable.

If the firmware isn't there, then the driver should be fixed to keep on
working if it determines loading it is not needed.  This type of check
should not be needed in the xhci-pci.c file.

thanks,

greg k-h

