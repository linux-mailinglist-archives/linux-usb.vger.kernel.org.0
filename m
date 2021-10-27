Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E493D43C66C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 11:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240116AbhJ0J2V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 05:28:21 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:34456 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJ0J2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 05:28:21 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 8E5EB20ED992
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
Date:   Wed, 27 Oct 2021 12:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-21-s.shtylyov@omp.ru>
 <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.10.2021 12:18, Chunfeng Yun wrote:

>> If platform_get_irq() returns IRQ0 (considered invalid according to
>> Linus)
>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no
>> IRQ
>> at all. Deny IRQ0 right away, returning -EINVAL from the probe()
>> method...
>>
>> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host
>> controller")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>   drivers/usb/host/xhci-mtk.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
>> mtk.c
>> index c53f6f276d5c..d2dc8d9863ee 100644
>> --- a/drivers/usb/host/xhci-mtk.c
>> +++ b/drivers/usb/host/xhci-mtk.c
>> @@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   		return ret;
>>   
>>   	irq = platform_get_irq_byname_optional(pdev, "host");
>> -	if (irq < 0) {
>> +	if (irq <= 0) {
>>   		if (irq == -EPROBE_DEFER)
>>   			return irq;
>>   
>> @@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   		irq = platform_get_irq(pdev, 0);
>>   		if (irq < 0)
>>   			return irq;
>> +		if (!irq)
> it's "if (irq <= 0)"?

    No, if (irq == 0).

>> +			return -EINVAL;
>>   	}
>>   
>>   	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");

MBR, Sergey
