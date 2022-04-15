Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13348502C2D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Apr 2022 16:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354717AbiDOO6K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Apr 2022 10:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348301AbiDOO6J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Apr 2022 10:58:09 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1690EA9
        for <linux-usb@vger.kernel.org>; Fri, 15 Apr 2022 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1650034537; x=1681570537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I5PXHQuW2dg/qyKJcHivk+5/0PcBMX8YPoZPsI2dfIM=;
  b=M3gjt9IO3zAon3d4DFRrpaSedxG13VsVV7IZm+n0hDgNu72I78Oq5KQm
   /3NsD0H92GncBBtv3LoSSdqnhWo5pJlVAwugSozZd6VS2hlxetva/Pjx7
   0Oo8C2eVohPsDhPv8UEwUTTxAJZyB82j/eeDN0wOeEKcTqSrz7X2jIPYY
   ZzoGYY9qpdjDmQijwKWedHn/Crgj54J8Ruyo1jjQx6dQGXa3gxb6KSEaV
   QT66cYDueSorkXsLB6FPtffFDfjkTo1ic2jgBkerx8yFfNpIDBqqAJIBL
   gVIFHmWjCLgOwFZH1LpFGUCS/O6Bp4BP97AFcsvoI/kPvvASh+Kt37j6M
   A==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; 
   d="scan'208";a="160228157"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Apr 2022 07:55:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 07:55:36 -0700
Received: from [10.12.72.151] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 15 Apr 2022 07:55:34 -0700
Message-ID: <4749e012-924e-0b40-4b7b-5ecb54856657@microchip.com>
Date:   Fri, 15 Apr 2022 16:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/6] usb: host: ehci-atmel: fix deferred probing
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Cristian Birsan <Cristian.Birsan@microchip.com>,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>
References: <20211210204634.8182-1-s.shtylyov@omp.ru>
 <20211210204634.8182-3-s.shtylyov@omp.ru>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20211210204634.8182-3-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/12/2021 at 21:46, Sergey Shtylyov wrote:
> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
> to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the error
> codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
> can safely ignore it...
> 
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks, best regards,
   Nicolas

> ---
> Changes in version 3:
> - corrected the "Fixes:" tag;
> - added Alan's ACK.
> 
> Changes in version 2:
> - removed the check for IRQ0, updated the patch description accordingly.
> 
>   drivers/usb/host/ehci-atmel.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 05d41fd65f25..bc3fdb588e6b 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -104,8 +104,8 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>          pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> 
>          irq = platform_get_irq(pdev, 0);
> -       if (irq <= 0) {
> -               retval = -ENODEV;
> +       if (irq < 0) {
> +               retval = irq;
>                  goto fail_create_hcd;
>          }
> 
> --
> 2.26.3
> 


-- 
Nicolas Ferre
