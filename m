Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC44D3EB101
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 09:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbhHMHCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 03:02:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238750AbhHMHB7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Aug 2021 03:01:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FAE660FC3;
        Fri, 13 Aug 2021 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628838093;
        bh=CTg2EPHvM+ayvKf8eiQ2Srcc9E01w9+NS0qvaJdghNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cSHjyywY79V2nI4r6SBzdFJBlzun5iGMkbL+ray+hmX0pSS0c406Qa+ixqNNcsAj9
         0IrFfDw4sg7x8SSLs2ZjLYxRq21FLySLVmSUel9CG/ClPGr152Q2opSczOIFk3sIOe
         7UJq7Ut4ahuGOmcTCRHjjxojbqzCYqSpedHSLClQ=
Date:   Fri, 13 Aug 2021 09:01:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 0/9] Stop calling devm_request_irq() with invalid IRQs
 in the USB drivers
Message-ID: <YRYYy8mddF2/9QpT@kroah.com>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <YRYYMu2kYxDKGGIV@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRYYMu2kYxDKGGIV@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 13, 2021 at 08:58:58AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 08, 2021 at 11:30:57PM +0300, Sergey Shtylyov wrote:
> > Here are 9 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
> > The affected drivers call platform_get_irq() but largely ignore its result --
> > they blithely pass the negative error codes to request_irq() (and its ilk)
> > which expects *unsinged* IRQ #s. Stop doing that by checking what exactly
> > platform_get_irq() returns.
> > 
> > [1/9] usb: dwc3: meson-g12a: add IRQ check
> > [2/9] usb: dwc3: qcom: add IRQ check
> > [3/61] usb: gadget: udc: at91: add IRQ check
> 
> 61?
> 
> > [4/9] usb: gadget: udc: s3c2410: add IRQ check
> > [5/9] usb: host: ohci-tmio: add IRQ check
> > [6/9] usb: misc: brcmstb-usb-pinmap: add IRQ check
> > [7/9] usb: phy: fsl-usb: add IRQ check
> > [8/9] usb: phy: tahvo: add IRQ check
> > [9/9] usb: phy: twl6030: add IRQ checks
> 
> 
> I only see 4 patches in this series, and the 4th, did not apply to my
> tree :(
> 
> Can you please fix this up and resend it correctly?

Ah, see your v2 now...
