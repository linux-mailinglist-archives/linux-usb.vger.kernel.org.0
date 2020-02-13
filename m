Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26C215BEC9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 13:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgBMM5A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 07:57:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:46044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729557AbgBMM5A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 07:57:00 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87ACE2168B;
        Thu, 13 Feb 2020 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581598619;
        bh=hR6bwzbgQ4PVp+wweLDY51C8dgqXKoNzqDDCI8q8+qU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A2L+zQ25Xq+c9Nvo0PBn6EELnbeuVsw/b/+OMFKz1Wk4GWZZAfEkwaBlWEIebjoRe
         6t8bYSewpR/qIpxVGbq2UkYKE12suzS4+TygWxlKYaMRhJoFJL6hgB1usAzz8T8I8I
         zpM4LspbmWWMFq7dRInZmUu7AgjKvyuMPcyPAIhs=
Date:   Thu, 13 Feb 2020 04:56:59 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Timur Tabi <timur@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: fhci-hcd: annotate PIPE_CONTROL switch case
 with fallthrough
Message-ID: <20200213125659.GB3325929@kroah.com>
References: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 09:54:00AM +0100, Rasmus Villemoes wrote:
> After this was made buildable for something other than PPC32, kbuild
> starts warning
> 
> drivers/usb/host/fhci-hcd.c:398:8: warning: this statement may fall
> through [-Wimplicit-fallthrough=]
> 
> I don't know this code, but from the construction (initializing size
> with 0 and explicitly using "size +=" in the PIPE_BULK case) I assume
> that fallthrough is indeed intended.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 5a35435ef4e6 (soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE)
> Fixes: a035d552a93b (Makefile: Globally enable fall-through warning)
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> 
> Two different Fixes: Obviously my 5a35435ef4e6 is the one that started
> making kbuild complain, but that's just because apparently kbuild
> doesn't cover a PPC32+USB_FHCI_HCD .config. Note for -stable folks,
> just in case 5.3.y is still maintained somewhere: a035d552a93b
> appeared in 5.3, but the #define fallthrough that I'm using here
> wasn't introduced until 5.4 (294f69e662d15). So either ignore this,
> make it /* fallthrough */, or backport 294f69e662d15 to 5.3.y as well.
> 
>  drivers/usb/host/fhci-hcd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
> index 04733876c9c6..a8e1048278d0 100644
> --- a/drivers/usb/host/fhci-hcd.c
> +++ b/drivers/usb/host/fhci-hcd.c
> @@ -396,6 +396,7 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
>  	case PIPE_CONTROL:
>  		/* 1 td fro setup,1 for ack */
>  		size = 2;
> +		fallthrough;

We have an attribute for that?

Shouldn't this be /* fall through */ instead?

Gustavo, what's the best practice here, I count only a few
"fallthrough;" instances in the kernel, although one is in our coding
style document, and thousands of the /* */ version.

thanks,

greg k-h
