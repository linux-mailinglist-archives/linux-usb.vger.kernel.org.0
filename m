Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23E41983E
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 08:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfEJGJL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 02:09:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:12353 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726914AbfEJGJL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 May 2019 02:09:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 23:09:10 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2019 23:09:08 -0700
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
 <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
 <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
 <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
 <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
 <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
 <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
 <4ab79c485f568cc081aa24f35b318bdafc0c4c06.camel@suse.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <df66c9dd-85b2-84fc-6543-a6eb031fc7fc@linux.intel.com>
Date:   Fri, 10 May 2019 09:11:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <4ab79c485f568cc081aa24f35b318bdafc0c4c06.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.5.2019 18.38, Nicolas Saenz Julienne wrote:
> Hi Mathias, thanks for spending the time debugging this :)
> 
> On Thu, 2019-05-09 at 18:10 +0300, Mathias Nyman wrote:
>> Got the logs off list, thanks
>>
>> The "Buffer" data in Control transfer Data stage look suspicious.
>>
>> First guess would be that in case URB has URB_NO_TRANSFER_DMA_MAP set then
>> data
>> will be mapped and urb->transfer_dma is already set.
>> The IDT patch uses urb->trabfer_dma as a temporary buffer, and copies the
>> urb->transfer_buffer there.
>> if transfer buffer is already dma mapped the urb->transfer_buffer can be
>> garbage,
>> (shouldn't, but it can be)
> 
> This could be it, I broadly checked and assumed everyone was playing nice with
> the transfer_dma pointer, but I guess I might have missed something.
> 
>> If that doesn't help, then it's possible DATA trbs in control transfer can't
>> use IDT at all. IDT is supported for Normal TRBs, which have a different trb
>> type than DATA trbs in control transfers.
>>
>> Also xhci specs 4.11.7 limit IDT usage:
>>
>> "If the IDT flag is set in one TRB of a TD, then it shall be the only Transfer
>>    TRB of the TD"
>>
>> A whole control transfer is one TD, and it already contains a SETUP transfer
>> TRB
>> which is using the IDT flag.
> 
> This one I'm not so sure as the standard defines a control transfer as a 2 or 3
> TD operation (see 4.11.2.2):
> 
> "The Control Transfer Ring may contain Setup Stage and Status Stage TDs, and
> optionally Data Stage TDs."

True, xhci driver treats a control transfer as one TD, but TRBs aren't chained so
from hw point of view they are separate TDs

> 
> Also, for what is worth, I spent some time testing that specific case on my
> intel laptop while preparing the patch.

And a closer look at the spec shows that both Normal and Data Stage TRB support
IDT. So this is not likely the cause.

-Mathias
