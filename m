Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9D61C7F81
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 02:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgEGA7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 20:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgEGA7w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 20:59:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A6EC061A0F
        for <linux-usb@vger.kernel.org>; Wed,  6 May 2020 17:59:52 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k8so3104502ejv.3
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2020 17:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=wJAwvdzh760/j8FDqtYdEOZCkTmxBsXrQCiItZz8dbg=;
        b=Az/99oNdz7zT7pdT5mhvSy+l+zyYkAQDLVNNzd5qFDr9v2/Ws3kSUlIburR+vqG+ZY
         fxiRof/yb9YTmIMEuW1h4M3CT4/sJvJZ3q7JPsqo3Thf+omnQLeyTr6ZxBMKSMVNQKg+
         LuBwCIGCsj2tcTZv05xT6ug6T2wUqnp5tJ7rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=wJAwvdzh760/j8FDqtYdEOZCkTmxBsXrQCiItZz8dbg=;
        b=X7l12IluFBJpxqx7nTTjvrGv162FbX3XwQWn2QxdySEu0BSqROWlsVST6h2E6hf3ch
         kXCAQcmopTkvYK0/WmJZFqznH796aY+Bxxxnaoe2N604+GiaIxTssJKY0fVy0JynTj+q
         SUyHTmfXpDfuIdQlC0Nm29AWeTQlSRDA7R5RFbMP3UXtZhV1QjAMZjJfSRQknLm8xv2D
         w1nQDzDxCFa1YfvsuZwd4Fp/ztS4b2peApDOuBNHF3Uq11U8SXiLAzPvFDbeH9gbEI+O
         0kKOmHwOpygLh9w7WB7Zj9O0aOtKYNiGDZ3cLI2/DSXX6KYsaKZREi3ZzrAnMVGd+oim
         BKzA==
X-Gm-Message-State: AGi0PubYMYm9NJjIi0wCuLpsGaAwsu3XEJhIvYSgKCXudyxHMdneMCOo
        THcrrRqpOl6LVuFHQ7isK8odx+oTwDY=
X-Google-Smtp-Source: APiQypL9KYkn4R1Ezp7MPYGQ5CJ92adL8ZBl4rHUZ4dSgyb3F19LXvnEcDYvDNDKygTHfK1BHlbbog==
X-Received: by 2002:a17:906:4714:: with SMTP id y20mr10220952ejq.5.1588813186442;
        Wed, 06 May 2020 17:59:46 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id z13sm409826eju.49.2020.05.06.17.59.45
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 17:59:45 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id x1so3090577ejd.8
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2020 17:59:45 -0700 (PDT)
X-Received: by 2002:a17:907:435d:: with SMTP id oc21mt9001372ejb.100.1588813185492;
 Wed, 06 May 2020 17:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200507005647.172515-1-gavinli@thegavinli.com>
In-Reply-To: <20200507005647.172515-1-gavinli@thegavinli.com>
From:   Gavin Li <gavinli@thegavinli.com>
Date:   Wed, 6 May 2020 17:59:34 -0700
X-Gmail-Original-Message-ID: <CA+GxvY5=EA+fnjoHOzwyy-LsP=7mi+1JQo6qbPiRRHSB0Rr++w@mail.gmail.com>
Message-ID: <CA+GxvY5=EA+fnjoHOzwyy-LsP=7mi+1JQo6qbPiRRHSB0Rr++w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: devio: fix mmap() on non-coherent DMA architectures
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Resubmitting this patch from a few months ago now that the "x86/PAT:
... map pfn RAM range req uncached-minus" warning mentioned earlier
seems to have been fixed.


On Wed, May 6, 2020 at 5:57 PM <gavinli@thegavinli.com> wrote:
>
> From: Gavin Li <gavinli@thegavinli.com>
>
> On architectures that are not (or are optionally) DMA coherent,
> dma_alloc_coherent() returns an address into the vmalloc space,
> and calling virt_to_phys() on this address returns an unusable
> physical address.
>
> This patch replaces the raw remap_pfn_range() call with a call to
> dmap_mmap_coherent(), which takes care of the differences between
> coherent and non-coherent code paths.
>
> Tested on an arm64 rk3399 board.
> ---
>  drivers/usb/core/devio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 6833c918abce..9d0043dd8e64 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -250,11 +250,10 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>         usbm->vma_use_count = 1;
>         INIT_LIST_HEAD(&usbm->memlist);
>
> -       if (remap_pfn_range(vma, vma->vm_start,
> -                       virt_to_phys(usbm->mem) >> PAGE_SHIFT,
> -                       size, vma->vm_page_prot) < 0) {
> +       ret = dma_mmap_coherent(ps->dev->bus->sysdev, vma, mem, dma_handle, size);
> +       if (ret) {
>                 dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> -               return -EAGAIN;
> +               return ret;
>         }
>
>         vma->vm_flags |= VM_IO;
> --
> 2.26.2
>
