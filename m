Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9CD375FF6
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 07:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbhEGF6n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 01:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234440AbhEGF6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 01:58:42 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FD9C061761
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 22:57:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id b15so6881064pfl.4
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 22:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xrz5+3GFYvXTTEFmRyRgbnwk+6PmqwXhUOpJVtDTI84=;
        b=jt0Tde1dwZoZFOE+qPK2XzOFYS+AHQUtpd/6eEe+5SePwB9ebQby/YjYGjrNkNWKvp
         j2wCRu7mqUekT4mt4iUIYb1A/d089ZLrx2ihJ/m4RoGN6m5uUG7YjGcVjobplh+0ukH3
         E5Kzt/HZGsEQRHeCUSh82n9zz1jwLfjL7cyU7Gt3xi6B2oLLTl2uVxnrKvIbEySs8HpL
         nAANFCjT7Nvs0S6hCVetUjOB14nDFiQ6j+IObQVBnmIinY7HYm4n5FvMJsxFxi7vkg4w
         sTTTgaIZXoT+NIzdQeQNrPxNHjIQY7rKhFjbFM7RJLiBht6MVblC2RttcgKRS7QBjy70
         pDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xrz5+3GFYvXTTEFmRyRgbnwk+6PmqwXhUOpJVtDTI84=;
        b=EUhlQ+xeFlBk2FQuS9wylt6CfgcBcLw6rVHT81RW6nI74O0wnHo13I5JXWJHRUxXX8
         K0TFBkszxeuJDnKkyHrcZHUVvf35wrxnT9Ez+j4vIa4cC6L3qpHIztsPI/3q90Cz4HIW
         01LOrvrtxvFmEpPvM7PcbxVtPzJcRHsv2q66NrS/Q1EsWFgSGQLNxfWnC6sRc3fEghDX
         qTyhw5eKNyvL074kIZPlUbk/TebWHYFXgn7eqHeL5CLrTE5/d609161lRkpNg/fEoZ74
         Gc8CZH6htokRpFlE2DLH+ZNtJF7KtNwQVk+eI7opKiY52tKZBrWb9S19YssVusjm7sF0
         qK6w==
X-Gm-Message-State: AOAM532elcZGgdjuB9H8qPnKUDn2ZcrFUibsZidysbtzY2Ta75hNdATr
        NChaGaky8NImOk9zCQ0WzsWj2T7ecZo=
X-Google-Smtp-Source: ABdhPJzI+CX7j/uNupS0QBAXI0kskYrzWi9sM16B9X3fd4CH3wwqw34AM9CpsfPrqaXjzl5N/8W7sw==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr8120329pgm.81.1620367061816;
        Thu, 06 May 2021 22:57:41 -0700 (PDT)
Received: from user ([2001:4490:4409:2c26:38dc:7b11:ac4b:4ec7])
        by smtp.gmail.com with ESMTPSA id c134sm3705858pfb.135.2021.05.06.22.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 22:57:41 -0700 (PDT)
Date:   Fri, 7 May 2021 11:27:35 +0530
From:   SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     saurav.girepunje@gmail.com
Subject: Re: [PATCH 1/2] usb: musb: remove unused function argument
Message-ID: <20210507055735.GA7789@user>
References: <cover.1620361861.git.saurav.girepunje@gmail.com>
 <390d572be063d615b6aa34dfbd019472795c7659.1620361861.git.saurav.girepunje@gmail.com>
 <PH0PR04MB73174B65B1619C64549E34049E579@PH0PR04MB7317.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR04MB73174B65B1619C64549E34049E579@PH0PR04MB7317.namprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 07, 2021 at 04:54:33AM +0000, SAURAV GIREPUNJE wrote:
>
>
> ________________________________
> From: Saurav Girepunje <saurav.girepunje@gmail.com>
> Sent: Friday, May 7, 2021 10:11 AM
> To: saurav.girepunje@hotmail.com <saurav.girepunje@hotmail.com>
> Cc: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
> Subject: [PATCH 1/2] usb: musb: remove unused function argument
>
> Remove unused function argument from musb_tx_dma_set_mode_cppi_tusb()
> in musb_host.c
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/usb/musb/musb_host.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 8b7d22a0c0fb..978d822af2c5 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -602,12 +602,8 @@ static void musb_tx_dma_set_mode_mentor(struct dma_controller *dma,
>          musb_writew(epio, MUSB_TXCSR, csr);
>  }
>
> -static void musb_tx_dma_set_mode_cppi_tusb(struct dma_controller *dma,
> -                                          struct musb_hw_ep *hw_ep,
> -                                          struct musb_qh *qh,
> +static void musb_tx_dma_set_mode_cppi_tusb(struct musb_hw_ep *hw_ep,
>                                             struct urb *urb,
> -                                          u32 offset,
> -                                          u32 *length,
>                                             u8 *mode)
>  {
>          struct dma_channel *channel = hw_ep->tx_channel;
> @@ -633,8 +629,7 @@ static bool musb_tx_dma_program(struct dma_controller *dma,
>                  musb_tx_dma_set_mode_mentor(dma, hw_ep, qh, urb, offset,
>                                              &length, &mode);
>          else if (is_cppi_enabled(hw_ep->musb) || tusb_dma_omap(hw_ep->musb))
> -               musb_tx_dma_set_mode_cppi_tusb(dma, hw_ep, qh, urb, offset,
> -                                              &length, &mode);
> +               musb_tx_dma_set_mode_cppi_tusb(hw_ep, urb, &mode);
>          else
>                  return false;
>
> --
> 2.25.1
>

Please ignore this mail.

