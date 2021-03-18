Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DE033FD1B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 03:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhCRCOi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 22:14:38 -0400
Received: from m12-18.163.com ([220.181.12.18]:54118 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhCRCOY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Mar 2021 22:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=fO2CC
        29OQ2AzUbG/fhU4RDHggHeUsLS021mcRAJG7po=; b=El0s8TN4KA+eQpIjTRUeL
        aNCfzcCUDTUD4F0FvfTsOZ1ozWBq8J342+bvcl2Dgm53Ygx5Nc4RP6zlRe+be2ZT
        eXCarr9yyjNgmXxgkuPWaajPOOlEPI5ocbMt1hv3TQJpT6ntJDedsnegtviv8p9u
        9/R2xGJREZz5AH5l/zb4HA=
Received: from localhost (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowABXUe95t1Jgb4qGZQ--.52911S2;
        Thu, 18 Mar 2021 10:14:18 +0800 (CST)
Date:   Thu, 18 Mar 2021 10:14:30 +0800
From:   jiangzhipeng <jzp0409@163.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "edison.jiang" <jiangzhipeng@yulong.com>
Subject: Re: [PATCH] usb: acpi: Fix shifting 31 bits
Message-ID: <20210318100635.000024c6@163.com>
In-Reply-To: <YFIXVojHb3LmCOTb@kroah.com>
References: <20210317142513.1340-1-jzp0409@163.com>
 <YFIXVojHb3LmCOTb@kroah.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: EsCowABXUe95t1Jgb4qGZQ--.52911S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyrJF4xtFW8JF45Xr48Xrb_yoW8Xr4UpF
        ZrKFWjyFWDGFWxua47t3Z8WFy5W397ZFy09ryIq34DXFy7Xw10qFWUtr4rWan5Zr1rGayj
        qF47Wa1rWFWrCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbL0OUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: hm2sikiqz6il2tof0z/1tbiNxpZhlWBjx-e8AAAsY
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 17 Mar 2021 15:51:02 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Mar 17, 2021 at 10:25:13PM +0800, jzp0409 wrote:
> > From: "edison.jiang" <jiangzhipeng@yulong.com>
> > 
> > Fix undefined behaviour in the usb apci driver by using 'BIT'
> > marcro.  
> 
> What is undefined about it?
> 
> > 
> > Signed-off-by: edison.jiang <jiangzhipeng@yulong.com>  
> 
> This name is not a valid signed-off-by name (I doubt you sign
> documents with a ".", right?) and it does not match the "From:" name
> either, so something needs to be fixed before this patch could be
> accepted.
> 
> > ---
> >  drivers/usb/core/usb-acpi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/usb-acpi.c
> > b/drivers/usb/core/usb-acpi.c index 50b2fc7..3e467a8 100644
> > --- a/drivers/usb/core/usb-acpi.c
> > +++ b/drivers/usb/core/usb-acpi.c
> > @@ -122,7 +122,7 @@ static enum usb_port_connect_type
> > usb_acpi_get_connect_type(acpi_handle handle,
> >   * Private to usb-acpi, all the core needs to know is that
> >   * port_dev->location is non-zero when it has been set by the
> > firmware. */
> > -#define USB_ACPI_LOCATION_VALID (1 << 31)
> > +#define USB_ACPI_LOCATION_VALID BIT(31)  
> 
> I do not understand what this is trying to fix, please be more
> specific.
> 
> thanks,
> 
> greg k-h

cppcheck error:
linux/drivers/usb/core/usb-acpi.c:191]: (error) Shifting signed 32-bit
value by 31 bits is undefined behaviour

