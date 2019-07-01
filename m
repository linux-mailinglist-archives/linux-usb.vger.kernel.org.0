Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 190374996F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 08:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfFRGxL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 02:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:57264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfFRGxK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 02:53:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6608220823;
        Tue, 18 Jun 2019 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560840789;
        bh=sHkSN5TVuO/486QufCPLIKrTVH7p4MDl4TUt6ztrYjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pm2yIsYLMhS0Sb9XMFKshOkQbTVCXQrJoMDgAB0RtpqqnVzQmLImzUKkqwtUJaCzK
         uPKQ3uoL+93JInEQPRGrF/IbosuFnHtUnaVNqBlFq2Zlvqcna45QRc++x71MwAiLRm
         7czFzhT6nXhcCluAAjcVydybDH0g3sAKGVGqpzQQ=
Date:   Tue, 18 Jun 2019 08:53:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
        ebiggers@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] wusb: switch to cbcmac transform
Message-ID: <20190618065307.GA15206@kroah.com>
References: <20190617081848.23614-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617081848.23614-1-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 17, 2019 at 10:18:48AM +0200, Ard Biesheuvel wrote:
> The wusb code takes a very peculiar approach at implementing CBC-MAC,
> by using plain CBC into a scratch buffer, and taking the output IV
> as the MAC.
> 
> We can clean up this code substantially by switching to the cbcmac
> shash, as exposed by the CCM template. To ensure that the module is
> loaded on demand, add the cbcmac template name as a module alias.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
> v4: - update Kconfig dependencies accordingly (and fix whitespace)
> v3: - add missing #include to fix build error spotted by kbuild test robot
> v2: - use finup()/digest() where possible, and process b0+b1 using a single
>       call to update()
>     - make 'stv_hsmic_hs' static const and remove comment regarding GCC 4.1
> 
> NOTE: I don't have any hardware to test this, but the built-in selftest
>       still passes.
> 
>  crypto/ccm.c                  |   1 +
>  drivers/usb/wusbcore/Kconfig  |   8 +-
>  drivers/usb/wusbcore/crypto.c | 169 +++++---------------
>  3 files changed, 48 insertions(+), 130 deletions(-)

I've queued this up in the usb-next tree now, thanks.

greg k-h
