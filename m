Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410BF433948
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 16:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhJSOyM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 10:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbhJSOyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 10:54:10 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F464C06161C
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 07:51:57 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id y67so20604069iof.10
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egauge.net; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=OXJhiqRSYLWZtNZ19Gbb9iRdt3R8179OLnUKyX2GIXQ=;
        b=s+Abt+xPXjbZy8kspm4FSTj+BTPHEPpRPeAVT8P0VUJupWIYHHyfnmmy6Xz+C6pOSJ
         Opc6byWy6zKtgQMi1jVK+xVh5YQsTe4kUajhJkyP+UTMglM1gtp4/sYAtFMEUdYR53k7
         wRrQ/GDzgUNjYiAqfaaAZJqxaZpxPTT6ZoKYnleFVU0hTDG+4uThlJd000TCSMPT+gO8
         kcyQ4cDYsiMl58v/hDIx81LhiQhY3wHZ7/FqeEOAvi3nqmTiFbcJMtfYZ+pSDrSCv0r0
         0QFhchdyXUPt9bdjht/FvM6gv22Z3Pvandl0FPzkMv7mZSUwkZu0ekYaC0i1reznR6aD
         n4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=OXJhiqRSYLWZtNZ19Gbb9iRdt3R8179OLnUKyX2GIXQ=;
        b=ZPxHzH4TbYgaw7KWbdkF5EgDgH6bCS8kOauT20iU9ad5G2vXqKkna3JfUN3kUThLHT
         6POMWMjiMLSIpIW+alR4jznFnps5J00GxIKPZAvjZEqW4xMJmsHFRxXzsMOEfG8gVb3E
         3Vuq5IpPJxKqiQ4sCNzr92neAs/WKWxpM2Tb5pgdvcm8xp8suBPiupSe8TPw1jcDkMKU
         KsSXyN/W/apnYegZ9nZ2DRQCgYIgnRTTUazvdnC/rWztCetFvA2d8b558xG8i9UZJaZo
         aXQ9cbtp0hjfK8LqFSZw/iXJxXqtZMBcvefQiS0YktAVByfQRIH9srg/UfnOoOypN+jA
         G3Fg==
X-Gm-Message-State: AOAM5311iL6lMbvGP4lCYHnlL7nJFYm9cqf9M1V+N0KXYAJHUy2a145j
        lDu2DEeFoDzvh7cIZR5ItLEj
X-Google-Smtp-Source: ABdhPJyy6oe43G16/QVFe/X+EioMp67KmM94WtKqYBpsyHRcPOslz1SblLvqJP5rEKyexAIzsj2HLw==
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr19830007iov.42.1634655116948;
        Tue, 19 Oct 2021 07:51:56 -0700 (PDT)
Received: from ?IPv6:2601:281:8300:4e0:2ba9:697d:eeec:13b? ([2601:281:8300:4e0:2ba9:697d:eeec:13b])
        by smtp.gmail.com with ESMTPSA id d4sm8833233ilv.3.2021.10.19.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:51:56 -0700 (PDT)
Message-ID: <d3712663b47dbc45cb678d2abd015b2ecd2fef7a.camel@egauge.net>
Subject: Re: [PATCH v2] usb: max-3421: Use driver data instead of
 maintaining a list of bound devices
From:   David Mosberger-Tang <davidm@egauge.net>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Date:   Tue, 19 Oct 2021 08:51:52 -0600
In-Reply-To: <20211018204028.2914597-1-u.kleine-koenig@pengutronix.de>
References: <20211018202835.txyjkm54ddwmwpsu@pengutronix.de>
         <20211018204028.2914597-1-u.kleine-koenig@pengutronix.de>
Organization: eGauge Systems LLC
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks fine to me.  I could only compile-test though since I don't have
this hardware any more.

    Ack-by: David Mosberger-Tang <davidm@egauge.net>

Thanks,

  --david

On Mon, 2021-10-18 at 22:40 +0200, Uwe Kleine-König wrote:
> Instead of maintaining a single-linked list of devices that must be
> searched linearly in .remove() just use spi_set_drvdata() to remember the
> link between the spi device and the driver struct. Then the global list
> and the next member can be dropped.
> 
> This simplifies the driver, reduces the memory footprint and the time to
> search the list. Also it makes obvious that there is always a corresponding
> driver struct for a given device in .remove(), so the error path for
> !max3421_hcd can be dropped, too.
> 
> As a side effect this fixes a data inconsistency when .probe() races with
> itself for a second max3421 device in manipulating max3421_hcd_list. A
> similar race is fixed in .remove(), too.
> 
> Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1:
> 
>  - don't drop "max3421_hcd = hcd_to_max3421(hcd);", noticed by the
>    kernel test robot. Greg helped interpreting the kernel test robot's
>    finding.
> 
> As before, this patch is only build tested.
> 
> Best regards
> Uwe
>  drivers/usb/host/max3421-hcd.c | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 59cc1bc7f12f..30de85a707fe 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -125,8 +125,6 @@ struct max3421_hcd {
>  
>  	struct task_struct *spi_thread;
>  
> -	struct max3421_hcd *next;
> -
>  	enum max3421_rh_state rh_state;
>  	/* lower 16 bits contain port status, upper 16 bits the change mask: */
>  	u32 port_status;
> @@ -174,8 +172,6 @@ struct max3421_ep {
>  	u8 retransmit;			/* packet needs retransmission */
>  };
>  
> -static struct max3421_hcd *max3421_hcd_list;
> -
>  #define MAX3421_FIFO_SIZE	64
>  
>  #define MAX3421_SPI_DIR_RD	0	/* read register from MAX3421 */
> @@ -1882,9 +1878,8 @@ max3421_probe(struct spi_device *spi)
>  	}
>  	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
>  	max3421_hcd = hcd_to_max3421(hcd);
> -	max3421_hcd->next = max3421_hcd_list;
> -	max3421_hcd_list = max3421_hcd;
>  	INIT_LIST_HEAD(&max3421_hcd->ep_list);
> +	spi_set_drvdata(spi, max3421_hcd);
>  
>  	max3421_hcd->tx = kmalloc(sizeof(*max3421_hcd->tx), GFP_KERNEL);
>  	if (!max3421_hcd->tx)
> @@ -1934,28 +1929,18 @@ max3421_probe(struct spi_device *spi)
>  static int
>  max3421_remove(struct spi_device *spi)
>  {
> -	struct max3421_hcd *max3421_hcd = NULL, **prev;
> -	struct usb_hcd *hcd = NULL;
> +	struct max3421_hcd *max3421_hcd;
> +	struct usb_hcd *hcd;
>  	unsigned long flags;
>  
> -	for (prev = &max3421_hcd_list; *prev; prev = &(*prev)->next) {
> -		max3421_hcd = *prev;
> -		hcd = max3421_to_hcd(max3421_hcd);
> -		if (hcd->self.controller == &spi->dev)
> -			break;
> -	}
> -	if (!max3421_hcd) {
> -		dev_err(&spi->dev, "no MAX3421 HCD found for SPI device %p\n",
> -			spi);
> -		return -ENODEV;
> -	}
> +	max3421_hcd = spi_get_drvdata(spi);
> +	hcd = max3421_to_hcd(max3421_hcd);
>  
>  	usb_remove_hcd(hcd);
>  
>  	spin_lock_irqsave(&max3421_hcd->lock, flags);
>  
>  	kthread_stop(max3421_hcd->spi_thread);
> -	*prev = max3421_hcd->next;
>  
>  	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
>  

