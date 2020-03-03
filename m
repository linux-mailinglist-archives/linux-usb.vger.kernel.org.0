Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60930177969
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 15:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgCCOpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 09:45:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:31131 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbgCCOpg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Mar 2020 09:45:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 06:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="228933073"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2020 06:45:33 -0800
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
 <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
 <7d042091-66b5-c245-73c8-f4491ea037c3@synopsys.com>
 <85616a55-6f83-bd9d-b225-fa0ebe2d5862@linux.intel.com>
 <f304b12f-2e64-a1b2-5638-d4e71c30aeb0@synopsys.com>
 <d485b110-2a81-e5db-6e76-c65c498550f3@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <37e8bc7b-4dd4-704c-ab1d-933a56534213@linux.intel.com>
Date:   Tue, 3 Mar 2020 16:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d485b110-2a81-e5db-6e76-c65c498550f3@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.3.2020 12.24, Tejas Joglekar wrote:
> Hi,
> On 2/14/2020 2:06 PM, Tejas Joglekar wrote:
>> Hi,
>> On 2/12/2020 8:34 PM, Mathias Nyman wrote:
>>> On 7.2.2020 19.17, Tejas Joglekar wrote:
>>>> Hi,
>>>> Thanks for the review comments.
>>>> On 1/3/2020 10:14 PM, Mathias Nyman wrote:
>>>>> On 20.12.2019 15.39, Tejas Joglekar wrote:
>>>>>> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
>>>>>> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
>>>>>> for HS. The controller loads and updates the TRB cache from the transfer
>>>>>> ring in system memory whenever the driver issues a start transfer or
>>>>>> update transfer command.
>>>>>>
>>>>>> For chained TRBs, the Synopsys xHC requires that the total amount of
>>>>>> bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
>>>>>> MPS. Or the chain ends within the TRB cache (with a last TRB).
>>>>>>
>>>>>> If this requirement is not met, the controller will not be able to send
>>>>>> or receive a packet and it will hang causing a driver timeout and error.
>>>>>>
>>>>>> This can be a problem if a class driver queues SG requests with many
>>>>>> small-buffer entries. The XHCI driver will create a chained TRB for each
>>>>>> entry which may trigger this issue.
>>>>>>
>>>>>> This patch adds logic to the XHCI driver to detect and prevent this from
>>>>>> happening.
>>>>>>
>>>>>> For every (TRB_CACHE_SIZE - 2) TRBs, we check the total buffer size of
>>>>>> the TRBs and if the chain continues and we don't make up at least 1 MPS,
>>>>>> we create a bounce buffer to consolidate up to the next (4 * MPS) TRBs
>>>>>> into the last TRB.
>>>>>>
>>>>>> We check at (TRB_CACHE_SIZE - 2) because it is possible that there would
>>>>>> be a link and/or event data TRB that take up to 2 of the cache entries.
>>>>>> And we consolidate the next (4 * MPS) to improve performance.
>>>>>>
>>>>>> We discovered this issue with devices on other platforms but have not
>>>>>> yet come across any device that triggers this on Linux. But it could be
>>>>>> a real problem now or in the future. All it takes is N number of small
>>>>>> chained TRBs. And other instances of the Synopsys IP may have smaller
>>>>>> values for the TRB_CACHE_SIZE which would exacerbate the problem.
>>>>>>
>>>>>> We verified this patch using our internal driver and testing framework.
>>>>>
>>>>>
>>>> I understand that in a first look it looks a complex solution, but you can suggest
>>>> the modifications/changes which would be required to make the patch more readable.
>>>> I have tried to keep the implementation similar to bounce buffer implementation 
>>>> only with addition of bounce buffer list. For the spinlock case, you can take a 
>>>> call if it is required or not.
>>>
>>> In your case you know the need for a bounce buffer much earlier than in the
>>> existing TD fragment case.
>>>
>>> Have you looked into the struct hc_driver map_urb_for_dma() and
>>> unmap_urb_for_dma() hooks? In those you could detect the need for a bounce
>>> buffer, allocate it, and bluntly copy entire scattergather buffer to the 
>>> bounce buffer. It should be fairly small anyway.
>>>
>> I will look into it, and get back to you. Thanks for the suggestion.
>>  
> I looked into it and I have a question related to approach you have suggested.
> I can detect need for the bounce buffer in map_urb_for_dma() function and can allocate bounce
> buffer and bluntly copy it, but when the SG list is having data over few MB's, I think 
> my bounce buffer allocation might fail, over a period. Do you think it is possible?

Doesn't sound very likely, the sg would need to have more than 16 entries of which the
total length of consecutive 16 entries is less than 1024 bytes, and then the following
entries should be large enough to fail memory allocation. 
(for HS the total legth < 512 for 8 entries, and rest huge)  

And no real world device has yet even triggered the first condition of having 16 (8)
sg entries with total length less than max packet size.

> 
> So to avoid that, I thought of having a list of such bounce buffers held with the URB and 
> then I can break the SG list with some fixed data length (e.g 16KB or 32 KB's) bounce buffers
> and copy the SG into that bounce buffer list.
> 
> Another option is to create a bounce sg, based on detection of bounce buffer requirement, 
> where the small size SG's are combined to create a new SG list which can satisfy the 
> TRB cache requirement for the SNPS controller.
> 
> What do you suggest? Which is the best way to go about solving the problem?

As this is extremely rare (never reported in a real use case) 
I'd keep this as simple as possible. Allocate one bounce buffer when needed, and copy all.
If memory allocation fails (unlikely) print a warning, then we immediately know what to fix.

We are talking about sizes where 16 sg entries have in total 1024 bytes of data.

ehci-tegra.c does something related to what you want. It replaces
urb->transfer_buffer with a dma aligned bounce buffer. 

-Mathias
