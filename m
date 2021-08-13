Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6E93EB105
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 09:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239120AbhHMHCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 03:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:38258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238750AbhHMHCr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Aug 2021 03:02:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D739A60FC3;
        Fri, 13 Aug 2021 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628838141;
        bh=EZ5oL9f9fsacguOrff8LfPN51niPGoL6N661s5SKIMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XOKQ+cltR+1XFNfVZpcq7n6DwODkXjRL/XwhG1bj6xzSnCQ4HO+Okij+ArhnwpYyz
         c8g3DKCWzq7ZMmXaCyFpuQ7Ols8IQG9kJexn0S2UN0mfz8zjDwVUJYPR17IGTDuh3k
         L02rGlUskEC9IbBG1b08n7hcauxYnUspFqvp00l0=
Date:   Fri, 13 Aug 2021 09:02:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 8/9] usb: phy: tahvo: add IRQ check
Message-ID: <YRYY+0y3rZeRDLFA@kroah.com>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <71d33de9-ffee-705d-843a-dfc1b1c0bbc6@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d33de9-ffee-705d-843a-dfc1b1c0bbc6@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 09, 2021 at 11:52:05PM +0300, Sergey Shtylyov wrote:
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
> 
> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/usb/phy/phy-fsl-usb.c |    2 ++
>  1 file changed, 2 insertions(+)

This patch did not apply to my tree :(
