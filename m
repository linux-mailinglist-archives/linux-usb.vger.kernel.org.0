Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69306FC13F
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 10:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjEIIHV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 04:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbjEIIG5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 04:06:57 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E294C0C
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683619584; x=1715155584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ed4JBIrLOfKmXfPchPzEoM7R9Zm4X1gFj20bfW+dZn4=;
  b=XpUeW5mM4nQQDPWUdn2Kfd9LHieoXc6Q8mZXAS3ZksjQNcm3BPVknV3A
   QMHaELKfXy4kIPTUigbScX0p/jPCSYAf7fWHdmVJ9G515fCsFPE3gBg6Q
   mEXsJjbJROHnoa4B7BnGVOLBc1G3I/LyjHoaK0vqd655SwYl5MYDd2e22
   NrSyJipSZjoF5wWEefM6j9iZrRZyzgQNmJnRG/BQou6/KBPDg+3G2NNND
   HHBlUew25YFVPJLn/QakgslZTIBm9kfZZKLGEDf26UmVEQKjQ0SDUESsI
   KtOELkIEQPHexvEtmeGblacK/SsPdkWw2AGmPiOTttt4g5wrqsVSxWkxN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415399806"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="415399806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 01:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028722421"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="1028722421"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 09 May 2023 01:04:58 -0700
Message-ID: <c0f5794c-ac8d-f062-191b-3362ab628a0a@intel.com>
Date:   Tue, 9 May 2023 11:06:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] usb: xhci: Remove unused udev from xhci_log_ctx trace
 event
Content-Language: en-US
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
References: <20230323131315.21764-1-quic_ugoswami@quicinc.com>
 <6edd8939-062a-9548-893b-8f02598c2fec@linux.intel.com>
 <0ef1bd2c-6946-1fdd-4a9f-1c94790e81dc@quicinc.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <0ef1bd2c-6946-1fdd-4a9f-1c94790e81dc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.5.2023 8.10, Udipto Goswami wrote:
> 
> 
> On 3/23/23 7:45 PM, Mathias Nyman wrote:
>> On 23.3.2023 15.13, Udipto Goswami wrote:
>>> xhci_log_ctx event is not utilizing the extracted udev to
>>> print out anything, hence removing it.
>>>
>>> Fixes: 1d27fabec068 ("xhci: add xhci_address_ctx trace event")
>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>> ---
>>>   drivers/usb/host/xhci-trace.h | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
>>> index 4286dba5b157..7555c4ea7c4b 100644
>>> --- a/drivers/usb/host/xhci-trace.h
>>> +++ b/drivers/usb/host/xhci-trace.h
>>> @@ -80,20 +80,16 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
>>>           __field(dma_addr_t, ctx_dma)
>>>           __field(u8 *, ctx_va)
>>>           __field(unsigned, ctx_ep_num)
>>> -        __field(int, slot_id)
>>>           __dynamic_array(u32, ctx_data,
>>>               ((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
>>>               ((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
>>>       ),
>>>       TP_fast_assign(
>>> -        struct usb_device *udev;
>>> -        udev = to_usb_device(xhci_to_hcd(xhci)->self.controller);
>>
>> Looks like this was flawed from the beginning, forcing a device struct for a host controller into
>> a struct usb_device
> 
> Hi Mathias, Greg,
> 
> Seems like this patch isn't included in upstream.
> Please let me know what need to be done ? If a v2 is needed to push?
> 
> Thanks,
> -Udipto

Patch is sitting in my for-usb-next branch and will be sent forward with the other
patches soon

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-next

Thanks
Mathias


