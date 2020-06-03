Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265CA1EC70C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 04:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgFCCEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 22:04:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5841 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbgFCCEI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 22:04:08 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id EB42FD93C85153784A25;
        Wed,  3 Jun 2020 10:04:06 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.118) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 3 Jun 2020
 10:03:58 +0800
Subject: Re: [PATCH] USB: ehci: reopen solution for Synopsys HC bug
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
        <huangdaode@huawei.com>, <yisen.zhuang@huawei.com>
References: <1591096489-9586-1-git-send-email-liulongfang@huawei.com>
 <20200602140734.GA3284664@kroah.com>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <b435869d-381f-bcde-edb2-6545dc14c87f@huawei.com>
Date:   Wed, 3 Jun 2020 10:03:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200602140734.GA3284664@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2020/6/2 22:07, Greg KH wrote:
> On Tue, Jun 02, 2020 at 07:14:49PM +0800, Longfang Liu wrote:
>> A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
>> might cause the host controller not issuing ping.
>>
>> The detailed description and solution:
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=2f7ac6c199978d0a0e407a12534201aa675a6482
> That just points to an existing patch in the tree.  Why link to it here
> in another patch?  And that patch is from 2011?
>
> If you want to refer to an id already in the tree, you can do it like:
> 2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")

Yes,  It's necessary to add this reference.

I will change it in the next patch.

>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
>> Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/usb/host/ehci-pci.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
>> index 1a48ab1..7ff2cbd 100644
>> --- a/drivers/usb/host/ehci-pci.c
>> +++ b/drivers/usb/host/ehci-pci.c
>> @@ -216,6 +216,13 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>>  		ehci_info(ehci, "applying MosChip frame-index workaround\n");
>>  		ehci->frame_index_bug = 1;
>>  		break;
>> +	case PCI_VENDOR_ID_HUAWEI:
>> +		/* Synopsys HC bug */
>> +		if (pdev->device == 0xa239) {
>> +			ehci_info(ehci, "applying Synopsys HC workaround\n");
>> +			ehci->has_synopsys_hc_bug = 1;
>> +		}
>> +		break;
> Ah, you are adding another "broken" device to the tree, that makes more
> sense.  Can you reword the above description a bit?

Bug description:

After indicating an Interrupt on Async Advance, the software uses the doorbell

mechanism to delete the Next Link queue head of the last executed queue head.

At this time, the host controller still references the removed queue head(the queue head is NULL).

NULL reference causes the host controller to lose the USB device.


Solution:
After deleting the Next Link queue head, the software can write one of the valid

queue head addresses to the ASYNCLISTADDR register to allow

the host controller to get the valid queue head.

>
> thanks,
>
> greg k-h
>
> .

Thanks,

Longfang


