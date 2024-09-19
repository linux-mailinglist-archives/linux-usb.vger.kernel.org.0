Return-Path: <linux-usb+bounces-15233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73497C681
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 11:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBCA01F265B6
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5169319924F;
	Thu, 19 Sep 2024 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wPknFRU7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DBD1991C8
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736565; cv=none; b=XYw3i5Y4BIhHgGbbjpscw27QRGCXL1Bj8iEO+DexMYmaLM0glDU1TuOBbrmp20x4b4EQx0VzWqEWUHwictaNA+5DBwT3VltWT4viTIvVP2fTzS2PXZMW1EIIGaiBcHakLYgA/sIdOBWPn0iY6h+dTFXbDXN+QQ+eYk8tq/3tK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736565; c=relaxed/simple;
	bh=42ARHANxWmDGVMSG1fXmut+SY7Ub0Y8Bq0DfyR5Vljw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TydWNXY1FLEFWUzZ2cWlNMXxY4lwErR9NQNEDu9HsjzhtUBYld7po9hcZE8KCARJENUNXyXCKx6mQc1l/rJRAcsIai1vFbhK5OTIKQf9gziEdRM27bTKXRcwVZwf5LuOjhsyLOtNS7ltPpuv+Fzm/oqFx8cTDx4Wqsa6gcpe6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wPknFRU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1006FC4CEC6;
	Thu, 19 Sep 2024 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726736565;
	bh=42ARHANxWmDGVMSG1fXmut+SY7Ub0Y8Bq0DfyR5Vljw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wPknFRU7Y88W0iUaFMVu82lO5tKobhEo2KUkQRzHpXcXACtfsvhYkX/aQrdDufbly
	 OTWNPyU9k4YN+YxoDiWhtoqeaqjvmxId5WXWuHHzLPZpVyexFOrQV5U+F13CAKHJN/
	 LG5pY7HUuhOZsdKjyWaUTKXBBuwvAAqtCbmEknEY=
Date: Thu, 19 Sep 2024 10:09:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] Fix problem with xhci resume from suspend
Message-ID: <2024091926-volatile-cadet-1496@gregkh>
References: <20240918204427.17251-1-jose.alberto.reguero@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918204427.17251-1-jose.alberto.reguero@gmail.com>

On Wed, Sep 18, 2024 at 10:44:27PM +0200, Jose Alberto Reguero wrote:
> ---
>  drivers/usb/host/xhci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index dc1e345ab67e..8f075ab63f65 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -76,6 +76,7 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
>  
>  static const char hcd_name[] = "xhci_hcd";
> @@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>  		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> +		xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
>  		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
>  
> -- 
> 2.42.0
> 
> 

Yes, this worked to not be corrupted, thank you!  But my patch bot found
some other basic issues (no description or signed-off-by) so you will
need to send a version 2 of this to resolve those, thanks!

greg k-h

