Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8246643347A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 13:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbhJSLSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 07:18:01 -0400
Received: from mail.thorsis.com ([92.198.35.195]:58065 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhJSLSB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 07:18:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 654791C9D
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 13:15:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QgBjFMxf6Gkp for <linux-usb@vger.kernel.org>;
        Tue, 19 Oct 2021 13:15:47 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 31907F34; Tue, 19 Oct 2021 13:15:47 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Tue, 19 Oct 2021 13:15:37 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 11/22] usb: host: ohci-at91: deny IRQ0
Message-ID: <YW6o2dfHElc4yTvW@ada.ifak-system.com>
Mail-Followup-To: Sergey Shtylyov <s.shtylyov@omp.ru>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-12-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018183930.8448-12-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Sergey,

Am Mon, Oct 18, 2021 at 09:39:19PM +0300 schrieb Sergey Shtylyov:
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> 
> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  drivers/usb/host/ohci-nxp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 85878e8ad331..afb9c2fc85c3 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -215,6 +215,10 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  		ret = -ENXIO;
>  		goto fail_resource;
>  	}
> +	if (!irq) {
> +		ret = -EINVAL;
> +		goto fail_resource;
> +	}
>  
>  	ohci_nxp_start_hc();
>  	platform_set_drvdata(pdev, hcd);

Subject refers to at91 while content is about nxp.

Greets
Alex
