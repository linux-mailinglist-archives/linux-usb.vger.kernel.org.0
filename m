Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBE23AE697
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jun 2021 11:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhFUJ5x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 05:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFUJ5x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Jun 2021 05:57:53 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB60C061574
        for <linux-usb@vger.kernel.org>; Mon, 21 Jun 2021 02:55:39 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso1367479pjv.4
        for <linux-usb@vger.kernel.org>; Mon, 21 Jun 2021 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQ7NskhnbXklWViZEL8XyKzeNwIivhwrrHIjXsYBvM8=;
        b=GHOD4SnlvcUuuelDbyvF2cnVuT1ZMR9MANNY5zATXwfkhN6SdjPQ4nhi7idTDKXFk1
         BsGCLAM6YBaLt6vYEkPTtTSPY4QF3+UnasKrEApfu4TOydymJE1rIUHTNMrA7XZaMCPq
         kIgg7Oe9AfYugeX6VcLci74Dg4QZyUw0flXY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQ7NskhnbXklWViZEL8XyKzeNwIivhwrrHIjXsYBvM8=;
        b=HkPucNCE+Z6TUvMIUX1mbl8OyqMb6VGrM9W7WWiIGHX2lXlzVHUNSAWAvyE/MhKDfw
         oxP1Ijd7RueFgdoc+taegZRtzpAnVhgUtDSIgY7Nobi0Z8p4V5FgU5ynX+k4Tz1U74BQ
         U2Bzl0OD9jNZLhpjxL4CThMJ0fmpYmJ04MMOSRK/VFT+XenkGzmupwrFibcP7R9FIsB8
         zO+mdRETK3hV3XTmQWLlAL25WMfoixG/8HEt977pHtuIwXWn9t+LWJ6z94Te82c5X5tl
         rHkKqFzI7mxkK2IJV92ZCty7ZaW/1LSphhnPfyU5XvCbWDPzky9nbN8er616qyWtqYgR
         6bpw==
X-Gm-Message-State: AOAM532eFCipX+kdbhhTwoOThF3pPnCWOklOFTRpHRkxyiEn7N8ZcPg3
        qe2D0AOJQZeG912Rq15c2CbiN/ZvTP0c74taWfdZwA==
X-Google-Smtp-Source: ABdhPJwpCYU0pVWO0m1hybvqrz+OywD+LMB7vqll6xsrBZkjwSgF7nIZy+9sx/OUFkHC5P5D94qJZl9RxwRRQYxwwXk=
X-Received: by 2002:a17:90a:5408:: with SMTP id z8mr37361124pjh.144.1624269338658;
 Mon, 21 Jun 2021 02:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <1623995165-25759-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1623995165-25759-1-git-send-email-chunfeng.yun@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Mon, 21 Jun 2021 17:55:27 +0800
Message-ID: <CAATdQgB32Fx-cOc2Uz4mQPE=iVm=6uYjJ7yqeW+Oo888kbQd2Q@mail.gmail.com>
Subject: Re: [PATCH v2] usb: xhci-mtk: allow multiple Start-Split in a microframe
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tianping Fang <tianping.fang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 18, 2021 at 1:46 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> This patch is used to relax bandwidth schedule by allowing multiple
> Start-Split in the same microframe.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v2: fix build warning unused-but-set-variable
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 18 ------------------
>  drivers/usb/host/xhci-mtk.h     |  2 --
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index c07411d9b16f..cffcaf4dfa9f 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -470,11 +470,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>
>  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  {
> -       struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 extra_cs_count;
>         u32 start_ss, last_ss;
>         u32 start_cs, last_cs;
> -       int i;
>
>         if (!sch_ep->sch_tt)
>                 return 0;
> @@ -491,10 +489,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>                 if (!(start_ss == 7 || last_ss < 6))
>                         return -ESCH_SS_Y6;
>
> -               for (i = 0; i < sch_ep->cs_count; i++)
> -                       if (test_bit(offset + i, tt->ss_bit_map))
> -                               return -ESCH_SS_OVERLAP;
> -
>         } else {
>                 u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>
> @@ -521,9 +515,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>                 if (cs_count > 7)
>                         cs_count = 7; /* HW limit */
>
> -               if (test_bit(offset, tt->ss_bit_map))
> -                       return -ESCH_SS_OVERLAP;
> -
>                 sch_ep->cs_count = cs_count;
>                 /* one for ss, the other for idle */
>                 sch_ep->num_budget_microframes = cs_count + 2;
> @@ -544,11 +535,9 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>         u32 base, num_esit;
>         int bw_updated;
> -       int bits;
>         int i, j;
>
>         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> -       bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
>
>         if (used)
>                 bw_updated = sch_ep->bw_cost_per_microframe;
> @@ -558,13 +547,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>         for (i = 0; i < num_esit; i++) {
>                 base = sch_ep->offset + i * sch_ep->esit;
>
> -               for (j = 0; j < bits; j++) {
> -                       if (used)
> -                               set_bit(base + j, tt->ss_bit_map);
> -                       else
> -                               clear_bit(base + j, tt->ss_bit_map);
> -               }
> -
>                 for (j = 0; j < sch_ep->cs_count; j++)
>                         tt->fs_bus_bw[base + j] += bw_updated;
>         }
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index cd3a37bb73e6..390cb5a86082 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -24,12 +24,10 @@
>  #define XHCI_MTK_MAX_ESIT      64
>
>  /**
> - * @ss_bit_map: used to avoid start split microframes overlay
>   * @fs_bus_bw: array to keep track of bandwidth already used for FS
>   * @ep_list: Endpoints using this TT
>   */
>  struct mu3h_sch_tt {
> -       DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
>         u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
>         struct list_head ep_list;
>  };
> --
> 2.18.0
>
