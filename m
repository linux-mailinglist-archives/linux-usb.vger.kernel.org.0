Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACAD10CA6A
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 15:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfK1Oe1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 09:34:27 -0500
Received: from mga07.intel.com ([134.134.136.100]:49269 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfK1Oe1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Nov 2019 09:34:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 06:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; 
   d="scan'208";a="292395690"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 28 Nov 2019 06:34:25 -0800
Subject: Re: [PATCH] xhci: enable XHCI_TRUST_TX_LENGTH quirk for ThunderX2
 builtin hosts
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191127153015.58171-1-ardb@kernel.org>
 <b9f82108-edd8-d701-4a4f-f5d0e918d863@linux.intel.com>
 <CAKv+Gu8Rgmn9EywOOY6niKwN40v8sNLDZq3eHapB7pUo_-JHtA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <39ad3449-cea4-d823-6b3a-9c7d7be7595d@linux.intel.com>
Date:   Thu, 28 Nov 2019 16:36:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8Rgmn9EywOOY6niKwN40v8sNLDZq3eHapB7pUo_-JHtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.11.2019 18.16, Ard Biesheuvel wrote:
> On Wed, 27 Nov 2019 at 16:56, Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 27.11.2019 17.30, Ard Biesheuvel wrote:
>>> When using a USB webcam on a ThunderX2 workstation, the kernel log
>>> gets flooded with messages like
>>>
>>>     xhci_hcd 0000:00:0f.0:
>>>     WARN Successful completion on short TX for slot 7 ep 2: needs XHCI_TRUST_TX_LENGTH quirk?
>>>
>>> Enabling the quirk manually makes the issue go away, so let's enable
>>> it unconditionally for this hardware.
>>>
>>
>> This issue starts to be common for many vendors, many report successful
>> completions after a initial short transfer in a TD
>>
>> Does the patch below help in your case? It worked for a Renesas controller
>> with similar issues. It's a more generic solution.
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 9ebaa8e132a9..d23f7408c81f 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2381,7 +2381,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>           case COMP_SUCCESS:
>>                   if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
>>                           break;
>> -               if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
>> +               if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
>> +                   ep_ring->last_td_was_short)
>>                           trb_comp_code = COMP_SHORT_PACKET;
>>                   else
>>                           xhci_warn_ratelimited(xhci,
> 
> Yes, that works too. If you roll that into a patch
> 
> Tested-by: Ard Biesheuvel <ardb@kernel.org>
> 
> and please consider cc'ing stable as well.
> 

Will do, thanks

-Mathias
