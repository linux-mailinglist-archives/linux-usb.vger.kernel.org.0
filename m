Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45783B02CF
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 13:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFVLcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 07:32:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:47770 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhFVLci (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Jun 2021 07:32:38 -0400
IronPort-SDR: h5XcCLnA6NSvWhYBMEY9hEOe9fg5svqnhcnTYInNdvKw74W61i6JdWGz1jgmKJx6HOkWd9Mp20
 2HW45Nq5VzOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206854671"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="206854671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 04:30:22 -0700
IronPort-SDR: m0VB52B1v0jsSkWwMrEhQWoQrC/wGNcsk5VluKZ1BYQy2YxJlsnsTEBzdiK6F2VWfYRuAcREZ8
 k+ruRVhb5bEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="452581073"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 22 Jun 2021 04:30:19 -0700
Subject: Re: [PATCH 21/24] usb: host: xhci: Move array of structs from the
 stack onto the heap
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-22-lee.jones@linaro.org>
 <8551978f-27b0-767e-f92b-e96ab3064b33@gmail.com>
 <20210526144451.GB543307@dell>
 <ad5d3a04-c065-675e-c53f-5d48b6367c89@gmail.com>
 <20210526152835.GE543307@dell>
 <23bb1fc5-acff-74a6-c67a-11b0e0d85011@linux.intel.com>
 <20210601092513.GC543307@dell> <YNG/3pqMNYEHgcP3@dell>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <1130731f-9c1d-7d6a-7aa7-d83d4292e0cb@linux.intel.com>
Date:   Tue, 22 Jun 2021 14:32:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YNG/3pqMNYEHgcP3@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.6.2021 13.47, Lee Jones wrote:
> On Tue, 01 Jun 2021, Lee Jones wrote:
> 
>> On Thu, 27 May 2021, Mathias Nyman wrote:
>>
>>> On 26.5.2021 18.28, Lee Jones wrote:
>>>> On Wed, 26 May 2021, Sergei Shtylyov wrote:
>>>>
>>>>> On 5/26/21 5:44 PM, Lee Jones wrote:
>>>>>
>>>>> [...]
>>>>>>>> Fixes the following W=1 kernel build warning(s):
>>>>>>>>
>>>>>>>>  drivers/usb/host/xhci.c: In function ‘xhci_reserve_bandwidth’:
>>>>>>>>  drivers/usb/host/xhci.c:2859:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>>>>>>>
>>>>>>>> Cc: Mathias Nyman <mathias.nyman@intel.com>
>>>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>>> Cc: linux-usb@vger.kernel.org
>>>>>>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>>>>>>> ---
>>>>>>>>  drivers/usb/host/xhci.c | 8 +++++++-
>>>>>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>>>>>>> index ac2a7d4288883..40ce4b4eb12ad 100644
>>>>>>>> --- a/drivers/usb/host/xhci.c
>>>>>>>> +++ b/drivers/usb/host/xhci.c
>>>>>>> [...]
>>>>>>>> @@ -2788,6 +2788,10 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>>>>>>>>  		return -ENOMEM;
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>> +	ep_bw_info = kzalloc(sizeof(*ep_bw_info) * 31, GFP_KERNEL);
>>>
>>> GFP_KERNEL might not be suitable for all cases.
>>>
>>> xhci_reserve_bandwidth() is called from xhci_configure_endpoint(), which again
>>> is called from a lot of places.
>>> For example from xhci_update_hub_device() which can be called with GFP_NOIO mem_flags.
>>
>> What do you suggest as an alternative?
> 
> Just working on rectifying this now.
> 
> Which Get Free Page flag do you suggest here please?
> 

xhci_reserve_bandwidth() is called with spin lock held, so probably GFP_ATOMIC

But that whole function would need more attention.
It's always consuming  31 * sizeof(*ep_bw_info) bytes to store fallback values.
Normal use case is that just one, or a couple endpoints are changing, and we know which ones do.

-Mathias


just one enpoint changing. 


