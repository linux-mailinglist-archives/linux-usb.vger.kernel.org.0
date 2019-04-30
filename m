Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5215BF0A1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 08:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfD3GjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 02:39:06 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:52034 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbfD3GjF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 02:39:05 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 050F9C011B;
        Tue, 30 Apr 2019 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556606343; bh=CQqJooDmIEy1WbgWYtMWSi8JNuqq27Vax4fBR/O3DUk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JnOpm7XtdRo99cnvwDUWwSzHI2ZNs/sNv2s6pDtqcJppx+L9EWriXwCyV2vRZbthd
         ohP8zyScC73AjZHLpIueTG5WeOUYsOo50rjGkH7hLTQ3jTo33dEZTAgRhXjfyxizLF
         F0Wyl/2HJstczpSXN1Kwo+oIBAIYzMklhf7UkG72EsYLYg3UsIj9mESXwgYowPAIhk
         mIVrm2tPjV7H+JdVf7r/zg6oJwFhHsGB8Qli8rqFmXMN8zRO7nn3jVJ8FV6KbEChIM
         PPq+dQQtYUwMSAeApVshtxB53xcHXV7gIe5yMcM24/GPJ3+THHSiNM7HXKAbzp9ZHy
         xTxVaiJCuQ/9Q==
Received: from [10.116.70.206] (hminas-7480.internal.synopsys.com [10.116.70.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id ACE30A0091;
        Tue, 30 Apr 2019 06:39:02 +0000 (UTC)
Subject: Re: [PATCH] usb: gadget: dwc2: fix zlp handling
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <410670D7E743164D87FA6160E7907A56013A7FDFE7@am04wembxa.internal.synopsys.com>
 <20190401105045.6527-1-andrzej.p@collabora.com>
 <410670D7E743164D87FA6160E7907A56013A7FE140@am04wembxa.internal.synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Message-ID: <15944aa5-8784-c6ae-8c0d-ec6efb2e0150@synopsys.com>
Date:   Tue, 30 Apr 2019 10:39:00 +0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <410670D7E743164D87FA6160E7907A56013A7FE140@am04wembxa.internal.synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On 4/1/2019 3:33 PM, Minas Harutyunyan wrote:
> On 4/1/2019 2:51 PM, Andrzej Pietrasiewicz wrote:
>> The patch 10209abe87f5ebfd482a00323f5236d6094d0865
>> usb: dwc2: gadget: Add scatter-gather mode
>>
>> avoided a NULL pointer dereference (hs_ep->req == NULL) by
>> calling dwc2_gadget_fill_nonisoc_xfer_dma_one() directly instead of through
>> the dwc2_gadget_config_nonisoc_xfer_ddma() wrapper, which unconditionally
>> dereferenced the said pointer.
>>
>> However, this was based on an incorrect assumption that in the context of
>> dwc2_hsotg_program_zlp() the pointer is always NULL, which is not the case.
>> The result were SB CV MSC tests failing starting from Test Case 6.
>>
>> Instead, this patch reverts to calling the wrapper and adds a check for
>> the pointer being NULL inside the wrapper.
>>
>> Fixes: 10209abe87f5 (usb: dwc2: gadget: Add scatter-gather mode)
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> 
>> ---
>>    drivers/usb/dwc2/gadget.c | 20 ++++++++++++--------
>>    1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index 6812a8a3a98b..e76b2e040b4c 100644
>> --- a/drivers/usb/dwc2/gadget.c
>> +++ b/drivers/usb/dwc2/gadget.c
>> @@ -835,19 +835,22 @@ static void dwc2_gadget_fill_nonisoc_xfer_ddma_one(struct dwc2_hsotg_ep *hs_ep,
>>     * with corresponding information based on transfer data.
>>     */
>>    static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
>> -						 struct usb_request *ureq,
>> -						 unsigned int offset,
>> +						 dma_addr_t dma_buff,
>>    						 unsigned int len)
>>    {
>> +	struct usb_request *ureq = NULL;
>>    	struct dwc2_dma_desc *desc = hs_ep->desc_list;
>>    	struct scatterlist *sg;
>>    	int i;
>>    	u8 desc_count = 0;
>>    
>> +	if (hs_ep->req)
>> +		ureq = &hs_ep->req->req;
>> +
>>    	/* non-DMA sg buffer */
>> -	if (!ureq->num_sgs) {
>> +	if (!ureq || !ureq->num_sgs) {
>>    		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &desc,
>> -			ureq->dma + offset, len, true);
>> +			dma_buff, len, true);
>>    		return;
>>    	}
>>    
>> @@ -1135,7 +1138,7 @@ static void dwc2_hsotg_start_req(struct dwc2_hsotg *hsotg,
>>    			offset = ureq->actual;
>>    
>>    		/* Fill DDMA chain entries */
>> -		dwc2_gadget_config_nonisoc_xfer_ddma(hs_ep, ureq, offset,
>> +		dwc2_gadget_config_nonisoc_xfer_ddma(hs_ep, ureq->dma + offset,
>>    						     length);
>>    
>>    		/* write descriptor chain address to control register */
>> @@ -2028,12 +2031,13 @@ static void dwc2_hsotg_program_zlp(struct dwc2_hsotg *hsotg,
>>    		dev_dbg(hsotg->dev, "Receiving zero-length packet on ep%d\n",
>>    			index);
>>    	if (using_desc_dma(hsotg)) {
>> +		/* Not specific buffer needed for ep0 ZLP */
>> +		dma_addr_t dma = hs_ep->desc_list_dma;
>> +
>>    		if (!index)
>>    			dwc2_gadget_set_ep0_desc_chain(hsotg, hs_ep);
>>    
>> -		/* Not specific buffer needed for ep0 ZLP */
>> -		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &hs_ep->desc_list,
>> -			hs_ep->desc_list_dma, 0, true);
>> +		dwc2_gadget_config_nonisoc_xfer_ddma(hs_ep, dma, 0);
>>    	} else {
>>    		dwc2_writel(hsotg, DXEPTSIZ_MC(1) | DXEPTSIZ_PKTCNT(1) |
>>    			    DXEPTSIZ_XFERSIZE(0),
>>
> 
> 

This patch is fix for "usb: dwc2: gadget: Add scatter-gather mode" patch 
to allow pass USB CV.
Could you please merge to your testing/next this patch also.

Thanks,
Minas
