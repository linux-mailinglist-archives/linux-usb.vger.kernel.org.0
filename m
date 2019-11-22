Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3561E1075DD
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 17:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKVQeE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 11:34:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:50320 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfKVQeE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Nov 2019 11:34:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Nov 2019 08:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; 
   d="scan'208";a="201571255"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 22 Nov 2019 08:34:00 -0800
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
 <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
 <23a9798e-704f-3444-42e2-e583a6991950@linux.intel.com>
 <F6AF08A8-8532-4A58-AE33-C1B02CBDC993@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <3449c957-ce20-baa3-ca97-63aff9ffa898@linux.intel.com>
Date:   Fri, 22 Nov 2019 18:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <F6AF08A8-8532-4A58-AE33-C1B02CBDC993@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.11.2019 17.10, Kai-Heng Feng wrote:
> 
> 
>> On Nov 22, 2019, at 20:17, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> [snipped]
> 
>>
>> The event ring is already overwritten with new events when dumped.
>>
>> Could you apply the code below, it will dump both the endpoint transfer ring
>> and the event ring at the right moment:
> 
> The log is quite large so I pasted it here:
> https://pastebin.ubuntu.com/p/wWpS8ctNrb/
> 
> Kai-Heng

Thanks, ring dumps shows xHC hardware never wrote an event to the event ring for the TRB at 0x487a0fe0.

Event ring:
[   61.114263] xhci_hcd 0000:3f:00.0: 0x000000049803a5d0: TRB 0000000487a08fd0 status 'Short Packet' len 20416 slot 4 ep 3 type 'Transfer Event' flags e:c
   we got a short packet event for TRB at 0x487a08fd0, which is one TRB before
[   61.114269] xhci_hcd 0000:3f:00.0: 0x000000049803a5e0: TRB 0000000487a07a30 status 'Success' len 0 slot 4 ep 4 type 'Transfer Event' flags e:c
[   61.114275] xhci_hcd 0000:3f:00.0: 0x000000049803a5f0: TRB 0000000487a07a40 status 'Success' len 0 slot 4 ep 4 type 'Transfer Event' flags e:c
[   61.114281] xhci_hcd 0000:3f:00.0: 0x000000049803a600: TRB 0000000487a09000 status 'Short Packet' len 20416 slot 4 ep 3 type 'Transfer Event' flags e:c
   we got a short packet event for TRB at 487a09000, which is one TRB after,
   but no event for 0x487a0fe0

The TRB at 0x487a0fe0 in the endpoint ring looks fine:
[   61.118683] xhci_hcd 0000:3f:00.0: 0x0000000487a08fc0: Buffer 000000046eef0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
[   61.118689] xhci_hcd 0000:3f:00.0: 0x0000000487a08fd0: Buffer 000000048e740000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
[   61.118696] xhci_hcd 0000:3f:00.0: 0x0000000487a08fe0: Buffer 000000046ebe8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
[   61.118702] xhci_hcd 0000:3f:00.0: 0x0000000487a08ff0: LINK 0000000487a09000 intr 0 type 'Link' flags i:c:T:C

The TRB with missing event is similar to all the other Normal TRBs in the ring.
It has both interrupt on completion, and interrupt on short packet bits set.
Can't see any reason why an event wasn't generated.

It seems it's always the TRB just before the LINK TRB that is missing an event.
(address ends with 0xfe0).

Best guess is that this particular xHC (ASmedia) can't correctly generate events
for the TRB right before Link  TRB

-Mathias
