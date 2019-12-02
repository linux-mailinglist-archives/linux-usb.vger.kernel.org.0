Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D7510E8D6
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 11:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfLBKa1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 05:30:27 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:41054
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727567AbfLBKa0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 05:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575282625;
        h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=T7tiXcPk+13Hn0v3yKw/4ZHpZXNaKh+VOtQu9qRy8fI=;
        b=BPGup07iWaX7SXpAGFnGSZL9CcLO5MxgVTYqLc45F2KxPh3y2Houl2hXMY27r1me
        JlDS8IaLlbkFVbx3HRgab8u77aTuTSBS/xc8fGzvji0g5rNZqmMrc51XuU+6TndbPWK
        GDk6r3QNH2C3YpPqyJw1KBiV5OsqD3jr0dkudGdY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575282625;
        h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=T7tiXcPk+13Hn0v3yKw/4ZHpZXNaKh+VOtQu9qRy8fI=;
        b=H0flUtbooSlohKm/QclEWAfEw2tz4df01ekcmePk6nOpqhFiySlHCihB7ZkMcE4G
        yOO/rInaxJX6l5ZRLPB8T3QvScHKetY94LR7hmNuGJfqmJsRkDI2NK0U/BL/AohI4QC
        /gqiTZ+5kDZEVMHEHEOzGLGmwrvwZcOmqJ07evcU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FA5AC2BB55
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: Do not process request if HWO is set for its
 TRB
To:     Felipe Balbi <balbi@kernel.org>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     jackp@codeaurora.org, mgautam@codeaurora.org
References: <1574946055-3788-1-git-send-email-sallenki@codeaurora.org>
 <1575270714-29994-1-git-send-email-sallenki@codeaurora.org>
 <87tv6jch61.fsf@gmail.com>
Message-ID: <0101016ec6294c21-99711286-dbda-4d62-b8c7-e9f28e99b261-000000@us-west-2.amazonses.com>
Date:   Mon, 2 Dec 2019 10:30:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87tv6jch61.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2019.12.02-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe Balbi,

Thanks for the reviewing the patch and for the comments.

On 12/2/2019 1:06 PM, Felipe Balbi wrote:
> Hi,
>
> Sriharsha Allenki<sallenki@codeaurora.org>  writes:
>
>> If the HWO bit is set for the TRB (or the first TRB if scatter-gather
>> is used) of a request, it implies that core is still processing it.
>> In that case do not reclaim that TRB and do not giveback the
>> request to the function driver, else it will result in a SMMU
>> translation fault when core tries to access the buffer
>> corresponding to this TRB.
> This is not entirely true. There are cases where driver *must* clear HWO
> bit manually and driver currently accounts for that. Care to explain

Based on my understanding I am trying to list down the two cases where
driver must clear HWO bit manually and how the patch would not regress 
these.

Additionally, I want to add that this patch is checking for req->trb 
(not the
TRB pointed by the *trb_dequeue*) which will be pointing to the first 
TRB in the
case of SG and in the case of linear it point to the TRB containing
the data (not theextra_trb or the trb to handle zero length packet).

*Case-1*:
We are in the middle of series of chained TRBs and we received a short
transfer along the way. Here is the code handling this case:

         /*
          * If we're in the middle of series of chained TRBs and we
          * receive a short transfer along the way, DWC3 will skip
          * through all TRBs including the last TRB in the chain (the
          * where CHN bit is zero. DWC3 will also avoid clearing HWO
          * bit and SW has to do it manually.
          *
          * We're going to do that here to avoid problems of HW trying
          * to use bogus TRBs for transfers.
          */
         if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
                 trb->ctrl &= ~DWC3_TRB_CTRL_HWO;


This case occurs only after the first TRB of the chain is processed, 
which we
arechecking in the patch. Although, this piece of code has been no-op
after introducingthe function "dwc3_gadget_ep_reclaim_trb_sg".This function
checks for the HWO and does notcall the 
"dwc3_gadget_ep_reclaim_completed_trb"
if it is set.Hence this condition mostly likely will never hit.

*Case-2*:
The second case is wherewe append the actual data buffer TRB with an 
extra_trb
for unaligned OUT transfer. Code handling this is:

         /*
          * If we're dealing with unaligned size OUT transfer, we will 
be left
          * with one TRB pending in the ring. We need to manually clear 
HWO bit
          * from that TRB.
          */

         if (req->needs_extra_trb && !(trb->ctrl & DWC3_TRB_CTRL_CHN)) {
                 trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
                 return 1;
         }

This also requires that the actual data buffer TRB should be processed 
and then
we areexpected to reclaim this extra_trb. If the TRB corresponding to the
actual data (req->trb)is not processed we are not expecting this 
extra_trb to be
reclaimed.


So, both these cases occurs and valid only if the first TRB/TRB 
containing the
dataof the request(req->trb) is processed.The proposed change is looking
for thecompletion of this TRB, soI don't think this change will regress the
above mentioned cases.
> what problem you actually found? Preferrably with tracepoint data
> showing the fault.
Test case here involves f_fs driver in AIO mode and we see ~8 TRBs in 
the queue
with HWO set and UPDATE_XFER done. In the failure case I see thatas part of
processingthe interrupt generated by the core for the completion of the 
first TRB,
the driver isgoing ahead and giving backthe requests of all theother 
queued TRBs,
whichinvolves removing the SMMU mapping of the buffers associated with 
the requests.
But these are still active and when core processesthese TRBs and their
correspondingun-mapped buffers, I see a translationfaultraised by the SMMU.

I hope I have answered your queries, please let me know if I am still 
missing something here.
>> Signed-off-by: Sriharsha Allenki<sallenki@codeaurora.org>
>> ---
>>   drivers/usb/dwc3/gadget.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index a9aba71..4a2c5fc 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2476,6 +2476,14 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>>   {
>>   	int ret;
>>   
>> +	/*
>> +	 * If the HWO is set, it implies the TRB is still being
>> +	 * processed by the core. Hence do not reclaim it until
>> +	 * it is processed by the core.
>> +	 */
>> +	if (req->trb->ctrl & DWC3_TRB_CTRL_HWO)
>> +		return 1;
> I'm pretty sure you're regressing a bunch of other cases here.
>
