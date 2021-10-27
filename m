Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5304C43C28E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 08:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238343AbhJ0GKm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 02:10:42 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58382 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234677AbhJ0GKl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 02:10:41 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QIJfIV012180;
        Wed, 27 Oct 2021 08:08:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/wV2e8lSXWQWPZUBJCEzjcXTxiyEhhddxo1eDJB6NsU=;
 b=58mFciptu5Kckjs288sYn7rKb1/fRGD6JTzjuWF6XOarnAx4Bfr6N1wvG1OYpqiaRJwc
 WU2NiZVs4eGEAKpuXf3pLkTe5olELObLCXmjmXIl2PTcuH0KDUUoIa78QXmjJRewTWXQ
 a+ObxJDZCIlc82/NwaAS5jaW4Dmmi8VY/hul8g1rfjalEteaoGHQ6uOZipkpLsepDHRV
 8tJIQBeHX3CfqzhbHWpOKPLzcFG8blyhZ1dgm1RCjfWU7DZ9reSeHMNpkOO3InGKCSuG
 Im044dOJPY8kzHcv9tPik1BAO83CxUJ54Gn2Lpt4rLFZh7/oTDNOMbbvQNOWtb1DwCnN dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bxputjecf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Oct 2021 08:08:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9DC0D10002A;
        Wed, 27 Oct 2021 08:08:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F39D217B94;
        Wed, 27 Oct 2021 08:08:02 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 08:08:01 +0200
Subject: Re: [PATCH v2 07/22] usb: host: ehci-st: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-8-s.shtylyov@omp.ru>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <327c5d82-5944-97d1-b6f7-d43d38cde029@foss.st.com>
Date:   Wed, 27 Oct 2021 08:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026173943.6829-8-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_01,2021-10-26_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sergey

On 10/26/21 7:39 PM, Sergey Shtylyov wrote:
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> 
> Fixes: e47c5a0906f9 ("usb: host: ehci-st: Add EHCI support for ST STB devices")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes in version 2:
> - added Alan's ACK.
> 
>  drivers/usb/host/ehci-st.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
> index f74433aac948..5f53c313f943 100644
> --- a/drivers/usb/host/ehci-st.c
> +++ b/drivers/usb/host/ehci-st.c
> @@ -160,6 +160,8 @@ static int st_ehci_platform_probe(struct platform_device *dev)
>  	irq = platform_get_irq(dev, 0);
>  	if (irq < 0)
>  		return irq;
> +	if (!irq)
> +		return -EINVAL;
>  	res_mem = platform_get_resource(dev, IORESOURCE_MEM, 0);
>  	if (!res_mem) {
>  		dev_err(&dev->dev, "no memory resource provided");
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
