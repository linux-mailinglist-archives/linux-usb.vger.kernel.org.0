Return-Path: <linux-usb+bounces-2903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD697EC784
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 16:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E39C1C20B70
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA603BB27;
	Wed, 15 Nov 2023 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuxKxtnH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F342FE2A
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 15:38:32 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB38A1A3
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 07:38:29 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5afbdbf3a19so78966547b3.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700062709; x=1700667509; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrqmeQ1b3jWvPwiKhEDKttHMvlM+GcVpLzujKePYQsk=;
        b=CuxKxtnH4kzYw+M0xHyaxgP5+GGYXJ70eWVH8/FRkTEnTsxVm22mn6BbJP9uUi03lY
         0tAwykSybKQkXS90Wv/4gw0D4VBWZ/e9Ka9Wc9cG9q7jF7d/q79P4Y2gZ2nl/m2dZpbi
         VK+ROHI9Za+s/gCknoD7RxhFNCR957NT1tlARx9LTG8Y9ROPFo0NXLggv++9mTpPg/1i
         jlkWFnlgKKWCFFjjGmxu6z79kJpvOkEWm2Rc31aB5VyCe0E6M+ThHd+muRI5k+j4ThYG
         zOd7zCSNhrHCMIielG9tp4KAMxKWW3z3z7aO+t6wPig1gOFM4cZsVrccaTidEy3jpI42
         LbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062709; x=1700667509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrqmeQ1b3jWvPwiKhEDKttHMvlM+GcVpLzujKePYQsk=;
        b=uB2RRS3vNHQtL04LWWNS2ZWF5Bj8FGg0aocffenuS1xg5YVA/J+3BlOK2NEJslAt6k
         ZYcH4J8UJt2OSvyPkDSsP280MVpbzPg6f7PBk+1PE5BgEMF+WnnU7JeHC46TQPUI3QCB
         K4TAulaJaoUqfG9OwWLkfMS8R3Qsk8l63Ksc9ihLsLAgogawUT8B/O8nXkKicbQDXusw
         fXeVvVEZyTeE/i5dQyFno+6JqATgtvrAeK92AJgSDjFtBu2t1MZOQ4gTkW2MoU74H+AE
         NY9tO8BuFTGxTEuLuo69u+vyVoYaIrKaeTPzLMhILQXYMDeEjkrQEGhx7Khk48RPHmeZ
         RVpg==
X-Gm-Message-State: AOJu0YzC4iz70EHdMhlKr0NH5rudj3pCelx7LsuhsHhUGiygCtjCXhEi
	uiOwf8pE92Xi6mm9ggOQnfg/nFWJERRXg8yAD6cQ+g==
X-Google-Smtp-Source: AGHT+IHle69HGMM73axSbTrxTEchdRM11aGWeB2nuHgAcv5unqlb5d7O8Uri7BhbV0Cqu/PwgfL+Pytmev0WUwA2OgM=
X-Received: by 2002:a0d:e855:0:b0:5a7:f002:4fe4 with SMTP id
 r82-20020a0de855000000b005a7f0024fe4mr14385322ywe.23.1700062709022; Wed, 15
 Nov 2023 07:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Nov 2023 16:37:52 +0100
Message-ID: <CAPDyKFrZdHseZ6udjNSdOG7hwK82G1wT30j39A1KwKBAaY_cMg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide, spi: Get rid of SPI_MASTER_HALF_DUPLEX
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-spi@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Nov 2023 at 12:15, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The SPI_MASTER_HALF_DUPLEX is the legacy name of a definition
> for a half duplex flag. Since all others had been replaced with
> the respective SPI_CONTROLLER prefix get rid of the last one
> as well. There is no functional change intended.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

> ---
>  drivers/input/rmi4/rmi_spi.c             | 2 +-
>  drivers/mmc/host/mmc_spi.c               | 2 +-
>  drivers/net/ethernet/micrel/ks8851_spi.c | 4 ++--
>  drivers/usb/gadget/udc/max3420_udc.c     | 2 +-
>  include/linux/spi/spi.h                  | 2 --
>  5 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
> index 852aeb0b2c07..07c866f42296 100644
> --- a/drivers/input/rmi4/rmi_spi.c
> +++ b/drivers/input/rmi4/rmi_spi.c
> @@ -375,7 +375,7 @@ static int rmi_spi_probe(struct spi_device *spi)
>         struct rmi_device_platform_data *spi_pdata = spi->dev.platform_data;
>         int error;
>
> -       if (spi->master->flags & SPI_MASTER_HALF_DUPLEX)
> +       if (spi->master->flags & SPI_CONTROLLER_HALF_DUPLEX)
>                 return -EINVAL;
>
>         rmi_spi = devm_kzalloc(&spi->dev, sizeof(struct rmi_spi_xport),
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index cc333ad67cac..b0cccef4cfbf 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -1322,7 +1322,7 @@ static int mmc_spi_probe(struct spi_device *spi)
>         /* We rely on full duplex transfers, mostly to reduce
>          * per-transfer overheads (by making fewer transfers).
>          */
> -       if (spi->master->flags & SPI_MASTER_HALF_DUPLEX)
> +       if (spi->master->flags & SPI_CONTROLLER_HALF_DUPLEX)
>                 return -EINVAL;
>
>         /* MMC and SD specs only seem to care that sampling is on the
> diff --git a/drivers/net/ethernet/micrel/ks8851_spi.c b/drivers/net/ethernet/micrel/ks8851_spi.c
> index 70bc7253454f..7c41623dac90 100644
> --- a/drivers/net/ethernet/micrel/ks8851_spi.c
> +++ b/drivers/net/ethernet/micrel/ks8851_spi.c
> @@ -156,7 +156,7 @@ static void ks8851_rdreg(struct ks8851_net *ks, unsigned int op,
>
>         txb[0] = cpu_to_le16(op | KS_SPIOP_RD);
>
> -       if (kss->spidev->master->flags & SPI_MASTER_HALF_DUPLEX) {
> +       if (kss->spidev->master->flags & SPI_CONTROLLER_HALF_DUPLEX) {
>                 msg = &kss->spi_msg2;
>                 xfer = kss->spi_xfer2;
>
> @@ -180,7 +180,7 @@ static void ks8851_rdreg(struct ks8851_net *ks, unsigned int op,
>         ret = spi_sync(kss->spidev, msg);
>         if (ret < 0)
>                 netdev_err(ks->netdev, "read: spi_sync() failed\n");
> -       else if (kss->spidev->master->flags & SPI_MASTER_HALF_DUPLEX)
> +       else if (kss->spidev->master->flags & SPI_CONTROLLER_HALF_DUPLEX)
>                 memcpy(rxb, trx, rxl);
>         else
>                 memcpy(rxb, trx + 2, rxl);
> diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
> index 2d57786d3db7..89e8cf2a2a7d 100644
> --- a/drivers/usb/gadget/udc/max3420_udc.c
> +++ b/drivers/usb/gadget/udc/max3420_udc.c
> @@ -1201,7 +1201,7 @@ static int max3420_probe(struct spi_device *spi)
>         int err, irq;
>         u8 reg[8];
>
> -       if (spi->master->flags & SPI_MASTER_HALF_DUPLEX) {
> +       if (spi->master->flags & SPI_CONTROLLER_HALF_DUPLEX) {
>                 dev_err(&spi->dev, "UDC needs full duplex to work\n");
>                 return -EINVAL;
>         }
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 255a0562aea5..7b4baff63c5c 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -1638,8 +1638,6 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
>  /* Compatibility layer */
>  #define spi_master                     spi_controller
>
> -#define SPI_MASTER_HALF_DUPLEX         SPI_CONTROLLER_HALF_DUPLEX
> -
>  #define spi_master_get_devdata(_ctlr)  spi_controller_get_devdata(_ctlr)
>  #define spi_master_set_devdata(_ctlr, _data)   \
>         spi_controller_set_devdata(_ctlr, _data)
> --
> 2.43.0.rc1.1.gbec44491f096
>

