Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C0EBED41
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 10:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfIZITq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 04:19:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:5884 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbfIZITq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 04:19:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 01:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="191621553"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2019 01:19:44 -0700
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        David Laight <David.Laight@ACULAB.COM>,
        alex zheng <tc0721@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng@dji.com" <xiaowei.zheng@dji.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com>
 <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com>
 <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
 <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com>
 <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
 <87d0fny5in.fsf@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com>
Date:   Thu, 26 Sep 2019 11:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87d0fny5in.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.9.2019 8.45, Felipe Balbi wrote:
> 
> Hi,
> 
> David Laight <David.Laight@ACULAB.COM> writes:
>> From: Mathias Nyman
>>> Sent: 25 September 2019 15:48
>>>
>>> On 24.9.2019 17.45, alex zheng wrote:
>>>> Hi Mathias,
>> ...
>>> Logs show your transfer ring has four segments, but hardware fails to
>>> jump from the last segment back to first)
>>>
>>> Last TRB (LINK TRB) of each segment points to the next segment,
>>> last segments link trb points back to first segment.
>>>
>>> In your case:
>>> 0x1d117000 -> 0x1eb09000 -> 0x1eb0a000 -> 0x1dbda000 -> (back to 0x1d117000)
>>>
>>> For some reason your hardware doesn't treat the last TRB at the last segment
>>> as a LINK TRB, instead it just issues a transfer event for it, and continues to
>>> the next address instead of jumping back to first segment:
>>
>> That could be a cache coherency (or flushing (etc)) issue.

The Link TRB is written very early, right after the ring segment is allocated,
and before any other TRBs. 255 other TRBs were written and handled by hw
on this segment after this, so not very likely a flushing/cache coherency issue.

> 
> XHCI has a HW-configurable maximum number of segments in a ring. AFAICT,
> xhci driver doesn't take that into consideration today. Perhaps the HW
> in question doesn't like more than 3 segments.
> 
> Mathias, what was the register to check this? Do you remember?
> 

I only recall a limit for the event ring in the HSCPARAMS2 register(ERST MAX),
not for transfer rings.

Other things to look at would be

- check that Toggle Cycle bit is correct for last segments link TRB (incomplete logs)
- some old xHCI hardware needed the Chain bit set in link TRB for some isoc rings
- was ring recently expanded?, usually rings start with only two segments

Mathias
