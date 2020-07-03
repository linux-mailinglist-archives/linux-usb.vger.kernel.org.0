Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD882134F9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGCH3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:29:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgGCH3Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:29:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F3FA206B6;
        Fri,  3 Jul 2020 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593761362;
        bh=36vX8+31jekQwNSkaL5bDvSdL6nJDW9DdRPSnhXj65g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bbma5O1DqLxj9ZMsfqFm2IhnpYAaaLTC0Sz2+s9BvQSVJiQKd0F8Llhd/bnSjxJqf
         +2Ss1Y+AuSaa3OEkYGpu1d7A941SE5ZLOUV1u6w2vIl4EB34Y/BF+BgIolOBvQODF/
         WmUKCRBlmK3T1Bd568NJAgQhKdnbBVptSf0xFHy0=
Date:   Fri, 3 Jul 2020 09:29:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH 11/30] usb: dwc2: gadget: Avoid pointless read of EP
 control register
Message-ID: <20200703072926.GA2322133@kroah.com>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
 <20200702144625.2533530-12-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200702144625.2533530-12-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 02, 2020 at 03:46:06PM +0100, Lee Jones wrote:
> Commit ec1f9d9f01384 ("usb: dwc2: gadget: parity fix in isochronous mode") moved
> these checks to dwc2_hsotg_change_ep_iso_parity() back in 2015.  The assigned
> value hasn't been read back since.  Let's remove the unnecessary H/W read.
> 
> Fixes the following W=1 warning:
> 
>  drivers/usb/dwc2/gadget.c: In function ‘dwc2_hsotg_epint’:
>  drivers/usb/dwc2/gadget.c:2981:6: warning: variable ‘ctrl’ set but not used [-Wunused-but-set-variable]
>  2981 | u32 ctrl;
>  | ^~~~
> 
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Cc: Ben Dooks <ben@simtec.co.uk>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/dwc2/gadget.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 116e6175c7a48..fa07e3fcb8841 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2975,10 +2975,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
>  	u32 epctl_reg = dir_in ? DIEPCTL(idx) : DOEPCTL(idx);
>  	u32 epsiz_reg = dir_in ? DIEPTSIZ(idx) : DOEPTSIZ(idx);
>  	u32 ints;
> -	u32 ctrl;
>  
>  	ints = dwc2_gadget_read_ep_interrupts(hsotg, idx, dir_in);
> -	ctrl = dwc2_readl(hsotg, epctl_reg);

As you know, lots of hardware requires reads to happen to do things, so
are you sure it is safe to remove this read call?

thanks,

greg k-h
