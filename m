Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3B53F86C4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 13:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242147AbhHZLzF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 07:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242361AbhHZLzD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Aug 2021 07:55:03 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74667C061757
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 04:54:16 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id fz10so2068416pjb.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GF9cA6HWm73PdcnhQrBWb0JMD23t4eWrYuwcNebBzhg=;
        b=BOLP6Ete/5M3jts/uWuAymRzOu8DrhtLuaCJjWI6HJPL7OVKD5Sswq0Ir/Ml8zxiWp
         sRpiHOy5vrltsG0dygRRhglM4AN+Tp8c5s0LpKJOFDYjOpRpq3jZK8SgY5u5aNdP+sUk
         kPoAzc+OBpyviSNC3b3vRX0ZXey/cvs089ptA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GF9cA6HWm73PdcnhQrBWb0JMD23t4eWrYuwcNebBzhg=;
        b=jxq9JQM05DV3LX5VzSJJS3DioaWPLIDJQvpCwCevP5ELssGtgCYJTk1Ac9qDPCB5jf
         qbTXN3wLEGyTQTWEJJKvFZJBqTn5ftjbADeVcfiIduqCUZ4ur6cqQspBiMPHP1d2K7iE
         5RvqcFhu8PVUBM2rVtCu27rycNerLHad241dD1j/h0eNGahm4MdSpcBHrx4XV85jeoSl
         LOiyRMh7Ian6OxNX1dSBYZH6EB+bldiOdS6HJPSRSVoYKQEYtOWsVgRv4gxSLRRaaHz0
         R4j2ssg/1GZBOauM+Y2bpj6tX3t4p0iiWmnZ8MgP7xM0bagoF8DUso1xP0YX/4/BAoyh
         hw+A==
X-Gm-Message-State: AOAM533G6TBTpHTZFgYBdmSdPvht8WzPX2sYBN9MWilLwxp+bY7Y7GYJ
        RO8TisySNktOX0jh2TniDrf69CeCoWH7XsFD2xsqEw==
X-Google-Smtp-Source: ABdhPJyPJt6SUmiZLSQD+XbEIBZ8IKTak4j4QZ8Oj8fxfMRxk7v8EqBMuHWZ5SQ/bfQzG0hm7oZTmwF44/dS0Jgya64=
X-Received: by 2002:a17:903:32ce:b0:138:7c09:1178 with SMTP id
 i14-20020a17090332ce00b001387c091178mr3215013plr.60.1629978855791; Thu, 26
 Aug 2021 04:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com> <20210826025144.51992-3-chunfeng.yun@mediatek.com>
In-Reply-To: <20210826025144.51992-3-chunfeng.yun@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Thu, 26 Aug 2021 19:54:04 +0800
Message-ID: <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
Subject: Re: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by bw_budget_table
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Yaqii wu <yaqii.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chunfeng,

On Thu, Aug 26, 2021 at 10:52 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use @bw_budget_table[] to update fs bus bandwidth due to
> not all microframes consume @bw_cost_per_microframe, see
> setup_sch_info().
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch, move from another series
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index cffcaf4dfa9f..83abd28269ca 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>                  * Compared with hs bus, no matter what ep type,
>                  * the hub will always delay one uframe to send data
>                  */
> -               for (j = 0; j < sch_ep->cs_count; j++) {
> -                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> +                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];

I'm worrying about this case with two endpoints,
* EP1OUT: isochronous, maxpacket=192: bw_budget_table[] = { 188, 188, 0, ... }
* EP2IN: interrupt, maxpacket=64: bw_budget_table[] = { 0, 0, 64, 64, ... }
(Is this correct bw_budget_table contents for those eps?)

I'm not sure if it's okay for those two endpoints to be allocated
on the same u-frame slot.
Can you please check if this is okay for xhci-mtk?
(I feel like I already asked the same questions many times.)


>                         if (tmp > FS_PAYLOAD_MAX)
>                                 return -ESCH_BW_OVERFLOW;
>                 }
> @@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>  {
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 base, num_esit;
> -       int bw_updated;
>         int i, j;
>
>         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
>
> -       if (used)
> -               bw_updated = sch_ep->bw_cost_per_microframe;
> -       else
> -               bw_updated = -sch_ep->bw_cost_per_microframe;
> -
>         for (i = 0; i < num_esit; i++) {
>                 base = sch_ep->offset + i * sch_ep->esit;
>
> -               for (j = 0; j < sch_ep->cs_count; j++)
> -                       tt->fs_bus_bw[base + j] += bw_updated;
> +               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> +                       if (used)
> +                               tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
> +                       else
> +                               tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
>         }
>
>         if (used)
> --
> 2.18.0
>
