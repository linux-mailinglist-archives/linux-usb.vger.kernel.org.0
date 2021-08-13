Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394873EB0FE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 09:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbhHMG72 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 02:59:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:37596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238750AbhHMG71 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Aug 2021 02:59:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF8E260234;
        Fri, 13 Aug 2021 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628837941;
        bh=Md1QRqCc5XWxJ6HUmeEzU9C3ojyON2p2ryi0eBrhkx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ie+uHl0RmsCtVquMA+8EzqDoyqldaX8BjPKRbNTztGK2VQxBlM54xlW5Ql9A2u8Nf
         acZH18tC1LY2Z2GovrmKdB+JnzMWWJRQ67kk/RFUUNXC49MUiiBfzrQkRJ6y9YmUOv
         udyu5WDfZX2oH6gsdgc5rP+5IlogEgpVKKdpmhdw=
Date:   Fri, 13 Aug 2021 08:58:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 0/9] Stop calling devm_request_irq() with invalid IRQs
 in the USB drivers
Message-ID: <YRYYMu2kYxDKGGIV@kroah.com>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 08, 2021 at 11:30:57PM +0300, Sergey Shtylyov wrote:
> Here are 9 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
> The affected drivers call platform_get_irq() but largely ignore its result --
> they blithely pass the negative error codes to request_irq() (and its ilk)
> which expects *unsinged* IRQ #s. Stop doing that by checking what exactly
> platform_get_irq() returns.
> 
> [1/9] usb: dwc3: meson-g12a: add IRQ check
> [2/9] usb: dwc3: qcom: add IRQ check
> [3/61] usb: gadget: udc: at91: add IRQ check

61?

> [4/9] usb: gadget: udc: s3c2410: add IRQ check
> [5/9] usb: host: ohci-tmio: add IRQ check
> [6/9] usb: misc: brcmstb-usb-pinmap: add IRQ check
> [7/9] usb: phy: fsl-usb: add IRQ check
> [8/9] usb: phy: tahvo: add IRQ check
> [9/9] usb: phy: twl6030: add IRQ checks


I only see 4 patches in this series, and the 4th, did not apply to my
tree :(

Can you please fix this up and resend it correctly?

thanks,

greg k-h
