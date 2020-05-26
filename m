Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71E31D8F18
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 07:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgESFR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 01:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgESFRZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 01:17:25 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BC3C05BD09
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 22:17:25 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y198so4415372pfb.4
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 22:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wyZN/R6qpcX7fc4AdyQ10EM48vce1r3i4Gy4ZEWGZyo=;
        b=VG11DQ32nYPFoMQMwo0hmRhLveHx94x4UB3EV11E279byHVSl+SwEDY3t6lYUdIBqb
         tSqc0GtMXZszHzQ9mmVMShWmPSH/k97kXZotCai/uoBwW3dEtIvSJM+Op7EQrwWWnCtD
         Az9VmmRwkQGt+3ZS/vBB+5tKdzAJv497Qz80D8SxlcNJ4fHCdMHpPNBW6OfnlDqHAEQ8
         JttQ/5qUcjnoeDK9mN+e4lcqvIZHNTGicdEJeAV47NgwHIBmQKXmO9MaigTmZXPyKeSn
         xwkwD5YHHMVzTsXnEs74G8HAEDDqUlnKrT295laldHRhhVwBaxYPsF6MgvuM7jJ2cBDT
         B+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wyZN/R6qpcX7fc4AdyQ10EM48vce1r3i4Gy4ZEWGZyo=;
        b=mSrKJyLuNCOi3t4Y8onS+JrvGeNNTIQ/XdAe3F9ptcAi5NbW/OcHqNdPagwgRymgEu
         8UITnNg3wFANRQi7IlqXDran9M5cYbcUTK9iarCdsbcJKK23NV48p+M1HKB2HyADOXQ2
         uoF3DGzXmZJCPNJU4eNGKjFPlLqfkDz0XM7LKlysvXyGfr5Ue07Ig2LQ29zxDIMZ1fbA
         68nL5bmrlla0ycEe7HVtwU34D5drnAG90WnpmAqpq/kQlXPBWIBElNBG9EFGuAg58jE/
         3kYJd/PleCydS6D0nemyBH41SDJX2+kNZhUDGoQ2nj8r2fmDa5AyreVaZHQ5wxCzziKd
         4LDw==
X-Gm-Message-State: AOAM530Z0F5De5xd4E4cwZ/aPsc1NZVJ4OBPpVcu5oxjdxPeLIS9dxlw
        yxIoFUWriv99WqG+mAvu4yy7SA==
X-Google-Smtp-Source: ABdhPJxnR3xVyoVXFCEFVT/fGHPOoUzzPxhKZnInZ4LxZVIfny/f/6lMiBq0X4YT2pattoSJDrNXAg==
X-Received: by 2002:a63:e70b:: with SMTP id b11mr5062941pgi.88.1589865444874;
        Mon, 18 May 2020 22:17:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id gv4sm1027617pjb.6.2020.05.18.22.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 22:17:24 -0700 (PDT)
Date:   Mon, 18 May 2020 22:16:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] usb: xhci: fix USB_XHCI_PCI depends
Message-ID: <20200519051602.GY2165@builder.lan>
References: <20200519050622.994908-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519050622.994908-1-vkoul@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 18 May 22:06 PDT 2020, Vinod Koul wrote:

> The xhci-pci-renesas module exports symbols for xhci-pci to load the
> RAM/ROM on renesas xhci controllers. We had dependency which works
> when both the modules are builtin or modules.
> 
> But if xhci-pci is inbuilt and xhci-pci-renesas in module, we get below
> linker error:
> drivers/usb/host/xhci-pci.o: In function `xhci_pci_remove':
> drivers/usb/host/xhci-pci.c:411: undefined reference to `renesas_xhci_pci_exit'
> drivers/usb/host/xhci-pci.o: In function `xhci_pci_probe':
> drivers/usb/host/xhci-pci.c:345: undefined reference to `renesas_xhci_check_request_fw'
> 
> Fix this by adding USB_XHCI_PCI having depends on USB_XHCI_PCI_RENESAS
> || !USB_XHCI_PCI_RENESAS so that both can be either inbuilt or modules.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Fixes: a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with memory")
> Tested-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index b5c542d6a1c5..92783d175b3f 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
>  config USB_XHCI_PCI
>  	tristate
>  	depends on USB_PCI
> +	depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
>  	default y
>  
>  config USB_XHCI_PCI_RENESAS
>  	tristate "Support for additional Renesas xHCI controller with firwmare"
> -	depends on USB_XHCI_PCI
>  	---help---
>  	  Say 'Y' to enable the support for the Renesas xHCI controller with
>  	  firwmare. Make sure you have the firwmare for the device and
> -- 
> 2.25.4
> 
