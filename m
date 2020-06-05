Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DDF1EF011
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 05:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgFEDou (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 23:44:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42476 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgFEDou (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jun 2020 23:44:50 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 7A992299E88422F68107;
        Fri,  5 Jun 2020 11:44:47 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.118) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 5 Jun 2020
 11:44:38 +0800
Subject: Re: [PATCH v2] USB: ehci: reopen solution for Synopsys HC bug
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <kong.kongxinwei@hisilicon.com>, <huangdaode@huawei.com>,
        <yisen.zhuang@huawei.com>
References: <1591236678-36009-1-git-send-email-liulongfang@huawei.com>
 <20200604142608.GB26797@rowland.harvard.edu>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <3feae50c-3398-69ab-fa95-b0320e7ed865@huawei.com>
Date:   Fri, 5 Jun 2020 11:44:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200604142608.GB26797@rowland.harvard.edu>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/6/4 22:26, Alan Stern Wrote:
> On Thu, Jun 04, 2020 at 10:11:18AM +0800, Longfang Liu wrote:
>> A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
>> might cause the host controller not issuing ping.
>>
>> Bug description:
>> After indicating an Interrupt on Async Advance, the software uses the
>> doorbell mechanism to delete the Next Link queue head of the last
>> executed queue head. At this time, the host controller still references
>> the removed queue head(the queue head is NULL). NULL reference causes
>> the host controller to lose the USB device.
>>
>> Solution:
>> After deleting the Next Link queue head, the software can write one of the
>> valid queue head addresses to the ASYNCLISTADDR register to allow
>> the host controller to get the valid queue head.
>>
>> There are detailed instructions and solutions in this patch:
>> commit 2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")
>>
>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> This is a very bad patch description.  Do you understand why?  Because 
> it doesn't describe what the patch actually does!
>
> The description talks about the original bug -- what it was and how it 
> was fixed.  But this patch doesn't contain the bug fix.  Instead, all 
> this patch does is set a quirk flag for the Huawei Kunpeng920.  The 
> patch description should explain why the quirk flag needs to be set; it 
> doesn't have to explain the original bug.
>
> Alan Stern

Solution:
After deleting the Next Link queue head, when has_synopsys_hc_bug set
to 1£¬the software can write one of the valid queue head addresses to
the ASYNCLISTADDR register to allow the host controller to get
the valid queue head. in order to solve that problem, this patch set
the flag for Huawei Kunpeng920

Thanks.
Longfang

>> ---
>>
>> Changes in V2:
>> - updated comment message
>>
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
>>  	}
>>  
>>  	/* optional debug port, normally in the first BAR */
>> -- 
>> 2.8.1
>>
> .
>

