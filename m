Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C767339B759
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 12:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhFDKwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 06:52:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229667AbhFDKwI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 06:52:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C11611CC;
        Fri,  4 Jun 2021 10:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622803822;
        bh=wBxHzdapbMAHKhiwDxATu1SofAyQ2eadxLMvhIlVc3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/q3Nbxnv7+BEYvEEnt4Uf9sbhvN20Ytzd9wQ/IJNfWciL+5d3E1aapNWz1FLvcCd
         rV6f87XNBpvYnae1tRzNee57LxKmzt6p8HWoXAm8UILk8iQC/h2Q0rWyVU7eTpVZ0H
         F1FtSIQwt46/E10IHiykciSPwL9Y90GfyTi1SW+Y=
Date:   Fri, 4 Jun 2021 12:50:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linyu Yuan <linyyuan@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, Linyu Yuan <linyyuan@codeaurora.com>
Subject: Re: [PATCH] usb: gadget: eem: fix wrong eem header operation
Message-ID: <YLoFayeoyqElpVSU@kroah.com>
References: <20210603150947.4627-1-linyyuan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603150947.4627-1-linyyuan@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 03, 2021 at 11:09:47PM +0800, Linyu Yuan wrote:
> From: Linyu Yuan <linyyuan@codeaurora.com>
> 
> when skb_clone() or skb_copy_expand() fail,

How can these calls fail?  If they do, what is the overall system
health?

> it should pull skb with lengh indicated by header,
> or not it will read network data and check it as header.
> 
> Signed-off-by: Linyu Yuan <linyyuan@codeaurora.com>
> ---
>  drivers/usb/gadget/function/f_eem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

What commit does this fix?  Should it go to stable kernels?  If so, how
far back?

And any reason you didn't use scripts/get_maintainer.pl for who to send
your patch to?

thanks,

greg k-h
