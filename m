Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77814F449
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 23:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgAaWJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 17:09:28 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38583 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgAaWJ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 17:09:28 -0500
Received: by mail-pg1-f196.google.com with SMTP id a33so4217813pgm.5
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k/cguSbdjfoUpsjktbp/rdoz4/zZPT5tyDc0hffYMeM=;
        b=iH1aMcvKe6Py+AIXOQPxXnP/pneIRY2qvysuFuxn67+s9bLJMsoD9OkCUJ0oXTme41
         bQ90iLPW+mn08vpCOpPcP8vnC3Ko3pwPMTG/xUP8/tLRy9MhfPDOW3Og+H2TYkqSiAoq
         12F28dLM9T+Fysg0/UauEHaIJkNA6gPu7cRWEqxb3Wt9dz0QD+a6Le3OMMQFWE1AWK7+
         TBMeW2p2KryvlUF8NglgTZxGQK4HRZ3pWxDSgdzfXraFpEgHluR+HFSx4qzuhct3puW6
         waLNosPUIC39DR+80VyzGGnjK1weMspDfWKuTsW/QlSs0W/MQ+ubAlvk1ohr7s855tFh
         dl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=k/cguSbdjfoUpsjktbp/rdoz4/zZPT5tyDc0hffYMeM=;
        b=Fpj4udpkyUwZahrOobofak0tViPd/S631u2vX1UIjSR2vrEtMZ9QIxuqYs/SV+HG0I
         Owq7cy/aN3nAAWmtBqcVxt0HMBFC+gooySo/SFHQhsGJe3d8nuMhXjAZ47cYK5Op1VVr
         iKIFyfVrIIPgAdaydki+DrYBEWuv7bohH761tESvjRJn6Uu1h4krXNoo0ZmL7kUKTle9
         iaZCEqpI21sCooV7RRXk8tr6/jctyWBB3TVHugttJM7YC3W8q8VoTyC/tLIF0YhKOiDG
         DD1nDFm17fEOrRZ9GRttG7xZXKd1jWFT6Sdwg3WDaiIBOqNoTPXphkDFy29MzqBsLqkn
         ok4Q==
X-Gm-Message-State: APjAAAV2K1d6dHmRL8FT46KtxullvaMXdnh+fcQLv0/RZvhhV3+8jvBD
        mmBCIQrkeQeBO7mfz6RM4P8=
X-Google-Smtp-Source: APXvYqwPKsofFvf/q/X/WrwWcSWinBk5PG0TUvrg0jljOXX6wQza93SbCXsEkGHApCGq4fnDREOUcg==
X-Received: by 2002:a63:dc0a:: with SMTP id s10mr12917218pgg.235.1580508567277;
        Fri, 31 Jan 2020 14:09:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z26sm11803487pfa.90.2020.01.31.14.09.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 14:09:26 -0800 (PST)
Date:   Fri, 31 Jan 2020 14:09:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>,
        Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>,
        John Youn <John.Youn@synopsys.com>,
        Sevak Arakelyan <sevaka@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200131220925.GA26896@roeck-us.net>
References: <20191105032922.GA3041@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105032922.GA3041@tungsten>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On Tue, Nov 05, 2019 at 12:29:22PM +0900, Boris ARZUR wrote:
> Channel halt can happen with BULK endpoints when the
> cpu is under high load. Treating it as an error leads
> to a null-pointer dereference in dwc2_free_dma_aligned_buffer().
> 

good find, and good analysis. We stated to see this problem as well in the
latest ChromeOS kernel.

I am still trying understand what exactly happens. To do that, I'll need to
be able to reproduce the problem. Maybe you can help me. How do you tether
your phone through USB ?

Thanks,
Guenter

> Signed-off-by: Boris Arzur <boris@konbu.org>
> ---
>  drivers/usb/dwc2/hcd_intr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>                                  * A periodic transfer halted with no other
> --
> 2.23.0
> 
> diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
> index a052d39b4375..697fed530aeb 100644
> --- a/drivers/usb/dwc2/hcd_intr.c
> +++ b/drivers/usb/dwc2/hcd_intr.c
> @@ -1944,7 +1944,8 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg
> *hsotg,
>                          */
>                         dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
>                 } else {
> -                       if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
> +                       if (chan->ep_type == USB_ENDPOINT_XFER_BULK ||
> +                           chan->ep_type == USB_ENDPOINT_XFER_INT ||
>                             chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
>                                 /*
