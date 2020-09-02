Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A8A25A239
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 02:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgIBAVN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 20:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBAVM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 20:21:12 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81812C061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 17:21:10 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c10so3183060edk.6
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 17:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pu8iDLueDjR7Ro+XMRPiNDPf1kXJy7PgcvGYBn919WI=;
        b=SE1eNjBw6TWO0IBbei8HlOOxfQ98CUQXmOYxgz609Fbyrr/KxBO4QKcnKr8TFbUOGJ
         BkAED+F+Jeg7LTPEJUOmDePdtlIXIEUiMegO6c4RxsOZtWXJgw4Crz5/Ck0T/X3nk1W2
         ++FXGRusApCwRtKXMiB8fXCLRn3SUDB9b86joNk4hHzT7K2URDVVe45wcrLdlpRqhN2k
         QxTFeyr/9TITW7sKeYPb44HCLH95qzwK7YUNCCzB6RgjHQiSeVATcmYJpckyj6vqpmdX
         YUSUP/pkmxtCo3T7ZP1YDR12NAKFoGelJeGhg6YuaUu+LWOOm6gnbcOOifyRilJO2Lfc
         wqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pu8iDLueDjR7Ro+XMRPiNDPf1kXJy7PgcvGYBn919WI=;
        b=JTNH0lvwuYH6VjHIMpz3cJCquoTZPq2o+uxQs+RrrMRsWX6Pq83RYHl/p4p/UW/Gs7
         L3+Uu/TdYBu3n0GrWcr4JrdMmhMPCd3xjxDqDNx1mZ7Khe6ZlW2Td4XGJd8sNJjApYqU
         PGLd+T0z6wUCJmjlev/E1nt7Cl5N4+2cMHI5ssM12ezuoc2YbkB0vy9m1L7jimb5pHbH
         5ITq9fBL+UQaAqzuRTNay6r+3f2dag9XUX2Inq6jLxXDCFIZJboQMffFs1qASt0mcL/B
         U11d8uYkU8Xx4FAGca1I27KhQDXy9OiHLCnywIGgp2qLFi3VjffVnZAoUltjcUf8JQ9S
         ZhUQ==
X-Gm-Message-State: AOAM531pxRnK40LJtbMG0g/CF7qS0L86kdat2uiM3fC1sy8Cycfvjt07
        Xp1ZhUuTu/FkbiSbFJPyfAaD7LbyKWjaBGo1cbwuh2bl
X-Google-Smtp-Source: ABdhPJyrboGaVMxff1fGsDIXxv1C/Uf9KisJhFDHN5y0DLkONxXMJ5FYgbiLFlAr6trTZEfabTP3MELNiO0+02STyzA=
X-Received: by 2002:aa7:d458:: with SMTP id q24mr4212342edr.23.1599006068660;
 Tue, 01 Sep 2020 17:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200901145535.GC587030@rowland.harvard.edu> <20200902000937.2204-1-tom.ty89@gmail.com>
 <20200902000937.2204-2-tom.ty89@gmail.com>
In-Reply-To: <20200902000937.2204-2-tom.ty89@gmail.com>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Wed, 2 Sep 2020 08:20:57 +0800
Message-ID: <CAGnHSEm5vCigY25grWg5Xbk=MOFMwCWpnW=+tRJp-FzA4ONVCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb-storage: always set hw_max_sectors in
 slave_configure to avoid inappropriate clamping
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I split it into two patches:
1. bump hw_max_sectors to 2048 for SS UAS drives and do the clamping
for all UAS drives
2. make sure there's a "fallback" hw_max_sectors "change" so that the
clamping on the SCSI side is invalidated.

If anyone can help fix the dma_dev, the second one can be omitted
(better make the clamping on the USB side to use shost->dev->dma_dev
though).

On Wed, 2 Sep 2020 at 08:09, Tom Yan <tom.ty89@gmail.com> wrote:
>
> When the scsi request queue is initialized/allocated, the scsi driver clamps
> hw_max_sectors against the dma max mapping size of sdev->host->dma_dev. The
> device is currently inappriorate to use for USB drives.
>
> Therefore, always (re)set hw_max_sectors in the usb drivers to invalidate the
> clamping.
>
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
>  drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
>  drivers/usb/storage/uas.c      |  2 ++
>  2 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index e5a971b83e3f..1f60d777a7e8 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
>                  * better throughput on most devices.
>                  */
>                 blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> +       } else {
> +               /*
> +                * Some devices are known to choke with anything larger. It seems like
> +                * the problem stems from the fact that original IDE controllers had
> +                * only an 8-bit register to hold the number of sectors in one transfer
> +                * and even those couldn't handle a full 256 sectors.
> +                *
> +                * Because we want to make sure we interoperate with as many devices as
> +                * possible, we will maintain a 240 sector transfer size limit for USB
> +                * Mass Storage devices.
> +                *
> +                * Tests show that other operating have similar limits with Microsoft
> +                * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> +                * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> +                * and 2048 for USB3 devices.
> +                */
> +               blk_queue_max_hw_sectors(sdev->request_queue, 240);
>         }
>
>         /*
> @@ -626,26 +643,6 @@ static const struct scsi_host_template usb_stor_host_template = {
>         /* lots of sg segments can be handled */
>         .sg_tablesize =                 SG_MAX_SEGMENTS,
>
> -
> -       /*
> -        * Limit the total size of a transfer to 120 KB.
> -        *
> -        * Some devices are known to choke with anything larger. It seems like
> -        * the problem stems from the fact that original IDE controllers had
> -        * only an 8-bit register to hold the number of sectors in one transfer
> -        * and even those couldn't handle a full 256 sectors.
> -        *
> -        * Because we want to make sure we interoperate with as many devices as
> -        * possible, we will maintain a 240 sector transfer size limit for USB
> -        * Mass Storage devices.
> -        *
> -        * Tests show that other operating have similar limits with Microsoft
> -        * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> -        * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> -        * and 2048 for USB3 devices.
> -        */
> -       .max_sectors =                  240,
> -
>         /* emulated HBA */
>         .emulated =                     1,
>
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 813c49914b9a..592e1358822e 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -843,6 +843,8 @@ static int uas_slave_configure(struct scsi_device *sdev)
>                 blk_queue_max_hw_sectors(sdev->request_queue, 240);
>         else if (us->pusb_dev->speed >= USB_SPEED_SUPER)
>                 blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> +       else
> +               blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
>
>         blk_queue_max_hw_sectors(sdev->request_queue,
>                 min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> --
> 2.28.0
>
