Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892A33E3DBC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 03:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhHIBlP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Aug 2021 21:41:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232670AbhHIBlO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 8 Aug 2021 21:41:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2699E60F55;
        Mon,  9 Aug 2021 01:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628473255;
        bh=dnGNCCOmearMkItuv0dm0s+JftW9veurdfMUloFu60k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gcJkgEQUccInA+78RLDge+IkuV/TF8kZwbj+wWALYo2Ylowftkc0wwbUT3Gfifpxg
         OuOs3jF1jUskxuIFSEX8o5e4rfMjPkJLwHr+jPUloGjOUUqZh1vjJUM5qVzjbNrgWn
         NhRPo1nqqP/EYbGw+vbqpr0FbVwikhv1Ra+QbLG5nw77qAeBdNfj3oVbu2vsg0maqz
         IOJ90ltLD0WEI9hYrrjyxKBn7QMHpx0xPK0yiBCUXreQO6Duf99VezMnYACy4VEKKs
         0o045wc29NEx9GMGUIKmGClJq1EPxGRQoha1Yjhl+Sri2fdzQrMjH2v+spCkLI2Fy0
         VH39DxnK+1ZPw==
Date:   Mon, 9 Aug 2021 09:40:51 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Jeaho Hwang <jhhwang@rtst.co.kr>
Cc:     linux-usb@vger.kernel.org,
        =?utf-8?B?67OA66y06rSRKEJ5ZW9uIE1vbyBLd2FuZykv7J6Q64+Z7ZmU7JewKUF1dG9t?=
         =?utf-8?B?YXRpb24gUGxhdGZvcm3sl7DqtaztjIA=?= 
        <mkbyeon@lselectric.co.kr>, Linux team <team-linux@rtst.co.kr>
Subject: Re: Chipidea USB device goes infinite loop due to interrupt while
 hw_ep_prime
Message-ID: <20210809014051.GA7179@nchen>
References: <CAJk_X9hBB_edByfEvueSyWgKjpYGZbS2rPLPCSpRrPr+icFz_Q@mail.gmail.com>
 <20210804013252.GA16420@nchen>
 <CAJk_X9gZ_dmQKeYJjkPZAQqdg==X=7s=XHtCg5cuu06z8Hd-GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJk_X9gZ_dmQKeYJjkPZAQqdg==X=7s=XHtCg5cuu06z8Hd-GQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-08-04 12:11:31, Jeaho Hwang wrote:
> Thanks for the answer Peter. I still have two questions.
> 
> 1) There's a busy loop in hw_ep_prime to wait for endpoint priming. Is
> it safe without timeout?
> 
>  192 static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
>  193 {
>  194     int n = hw_ep_bit(num, dir);
>  195
>  196     /* Synchronize before ep prime */
>  197     wmb();
>  198
>  199     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>  200         return -EAGAIN;
>  201
>  202     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
>  203
>  204     while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
>  205         cpu_relax();
>  206     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>  207         return -EAGAIN;
>  208
>  209     /* status shoult be tested according with manual but it doesn't work */
>  210     return 0;
>  211 }

You could add loop-timeout for it. Without timeout, it may lead issue,
I am not so sure.

> 
> 2) We experienced an infinite loop in hw_ep_set_halt, which is called
> at isr_tr_complete_handler due to an error encountered that we
> reported in the previous mail. It seems that hw_write to set halt
> fails. Is it related to the interruption while hw_ep_prime is running?
> If we make a timeout for the loop and error return, are there any
> considerations for the caller functions?
> 
>  223 static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
>  224 {
>  225     if (value != 0 && value != 1)
>  226         return -EINVAL;
>  227
>  228     do {
>  229         enum ci_hw_regs reg = OP_ENDPTCTRL + num;
>  230         u32 mask_xs = (dir == TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RXS;
>  231         u32 mask_xr = (dir == TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RXR;
>  232
>  233         /* data toggle - reserved for EP0 but it's in ESS */
>  234         hw_write(ci, reg, mask_xs|mask_xr,
>  235               value ? mask_xs : mask_xr);
>  236     } while (value != hw_ep_get_halt(ci, num, dir));
>  237
>  238     return 0;
>  239 }

If the error occurs for set halt, I think the transfer may stop, and it may
can't be recovered unless re-plug the cable. To not affect the whole system,
it is better to add loop-time mechanism.

-- 

Thanks,
Peter Chen

