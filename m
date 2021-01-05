Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375D72EB56A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 23:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbhAEWe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 17:34:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:11786 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbhAEWe5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 17:34:57 -0500
IronPort-SDR: rfILpRk73/CMNd0S32wSqz9fXWgiN1X6i2eyC221Lov3roQJ6BePpLOGoIlqx5rlsLD5PBtB/E
 OqpWLQfvpY1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164261395"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="164261395"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 14:33:11 -0800
IronPort-SDR: eJaP4It3bVAlLQHnFv3HFPRd8cRLVXhQ7dtvua+M6Y8zlPlpgIhdruKtb4CgG+YTr5dVdKm+1e
 b0Xwewb9bSBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
   d="scan'208";a="343309734"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2021 14:33:09 -0800
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
 <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
 <X/M3nxyjiIN/R4MC@kroah.com>
 <2b63edec-f32c-ba80-0be4-53e894272395@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <a9217abb-7923-6a9a-0fed-a81480336730@linux.intel.com>
Date:   Wed, 6 Jan 2021 00:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b63edec-f32c-ba80-0be4-53e894272395@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5.1.2021 11.30, Tejas Joglekar wrote:
> Hi Mathias,
> On 1/4/2021 9:13 PM, Greg Kroah-Hartman wrote:
>> On Mon, Jan 04, 2021 at 09:32:13AM +0000, Tejas Joglekar wrote:
>>> Hi Greg,
>>> On 1/4/2021 1:55 PM, Greg Kroah-Hartman wrote:
>>>> On Mon, Jan 04, 2021 at 01:38:43PM +0530, Tejas Joglekar wrote:
>>>>> This commit adds the platform device data to setup
>>>>> the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
>>>>> which are PCI devices does not use OF to create platform device
>>>>> but create xhci-plat platform device at runtime. So
>>>>> this patch allows parent device to supply the quirk
>>>>> through platform data.
>>>>>
>>>>> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
>>>>> ---
>>>>>  drivers/usb/dwc3/host.c | 10 ++++++++++
>>>>>  1 file changed, 10 insertions(+)
>>>> What changed from previous versions?
>>> Resent the patch as it was missed for review by Felipe and I saw your mail
>>>
>>> to resend the patch if not reviewed. Other two patches from series are
>>>
>>> picked up by Mathias, this one is remaining for review.
>> Ah, how was I supposed to guess that?  :)
>>
>>>>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
>>>>> index e195176580de..0434bc8cec12 100644
>>>>> --- a/drivers/usb/dwc3/host.c
>>>>> +++ b/drivers/usb/dwc3/host.c
>>>>> @@ -11,6 +11,11 @@
>>>>>  #include <linux/platform_device.h>
>>>>>  
>>>>>  #include "core.h"
>>>>> +#include "../host/xhci-plat.h"
>>>> That feels really wrong.  Are you sure about that?
>>> To use the struct xhci_plat_priv this was included, can you suggest alternative?
>> If that is the "normal" way to do this with the xhci driver, ok, but I
>> would like to get an ack from Mathias for this before taking it.
>>
> Can you please review this patch which is including the xhci-plat header?  Let me
> 
> know if anything should be modified. Ack if this patch looks ok so Greg can
> 
> take it.
> 

This doesn't look right. 

dwc3 shouldn't need to know about xhci platform private structures,
besides, this patch now adds the quirk to all xhci platform devices created by dwc3.

I haven't touched dwc3 at all, but I'd guess you probably need to add a new entry to
the dwc3_pci_id_table[] in dwc3-pci.c, add a device property, and then look for that
property in xhci-plat.c, and set the quirk. 

-Mathias
