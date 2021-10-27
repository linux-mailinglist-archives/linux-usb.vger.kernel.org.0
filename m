Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561B443C28F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 08:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbhJ0GLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 02:11:08 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:47692 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234586AbhJ0GLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 02:11:07 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1DTYw010020;
        Wed, 27 Oct 2021 08:08:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ucUdg+5qX5Of2zm9fkXdquQw9OVjEAuBITEA62EmTY4=;
 b=MefwfM1vNeOQDobAWX9kNEF3umIBmQEfq+sjlXAoB2NbOSigP7aN7R64PoTLVgvufXys
 6QUiJAB77L255VTVDnD238e+lvlRDhAvhRzo91j7JuJkZFTxsJy6IOmXnWeyjdUouY/m
 peGnZCC3j7VpWpFAuDZfjJUV+ZIT2ipLx42IoVHaeNuHzNjyMv0NJ2by7DKz8rC3juUh
 Lw0SM/0gKk6TPLq+SOlvVFPbnAfyNObR/8NpX5P8eukIqBrBg9zyD2Q0L+smXp+ZMr/r
 tVrpOXChj/w7kghUgLK7ZsyqNq50YaBI0uXGzJGM5t707w5d8JEle5UZTLETD0nbasPY 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bxvwws9jk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Oct 2021 08:08:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C49310002A;
        Wed, 27 Oct 2021 08:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94B98217B95;
        Wed, 27 Oct 2021 08:08:34 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 08:08:33 +0200
Subject: Re: [PATCH v2 17/22] usb: host: ohci-st: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-18-s.shtylyov@omp.ru>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <af4e4f56-8e70-dc1c-0b2f-f4ce401a5a9e@foss.st.com>
Date:   Wed, 27 Oct 2021 08:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026173943.6829-18-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
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
> Fixes: d115837259ad ("usb: host: ohci-st: Add OHCI driver support for ST STB devices")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes in version 2:
> - added Alan's ACK.
> 
>  drivers/usb/host/ohci-st.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
> index ac796ccd93ef..b9200071ce6c 100644
> --- a/drivers/usb/host/ohci-st.c
> +++ b/drivers/usb/host/ohci-st.c
> @@ -140,6 +140,8 @@ static int st_ohci_platform_probe(struct platform_device *dev)
>  	irq = platform_get_irq(dev, 0);
>  	if (irq < 0)
>  		return irq;
> +	if (!irq)
> +		return -EINVAL;
>  
>  	res_mem = platform_get_resource(dev, IORESOURCE_MEM, 0);
>  	if (!res_mem) {
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
