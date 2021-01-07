Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABDC2ECC16
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 09:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbhAGI5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 03:57:13 -0500
Received: from mga02.intel.com ([134.134.136.20]:25818 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbhAGI5M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 03:57:12 -0500
IronPort-SDR: xpxillJlTshgGYdsBQ2cTAzC+x/+4FzPFEhusNqR529Aamzqd9HhYUjZIfOLbayu/OigxqUGp2
 zZnu+MRGNPQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="164467934"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="164467934"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 00:55:25 -0800
IronPort-SDR: gVtQqJMvk69qx9b9eXeADQ/FQWVvaK6Tq0udYYneyCmCC1oGdvHbonmHC/Nd39l5Ir8zo6Ovrq
 kd8YhErC/TcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="343832987"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2021 00:55:24 -0800
Subject: Re: xhci problem -> general protection fault
To:     Ross Zwisler <zwisler@google.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
 <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
 <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
 <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
 <X8+22DeNDn1A7X+N@google.com>
 <068b49cd-4afa-7adb-572b-634b1728744d@linux.intel.com>
 <X9EdVbO08Y8Ohih5@google.com>
 <f75d6e13-d1f7-0282-f93d-be4693e82e29@linux.intel.com>
 <CAGRrVHyJcMCAEHMzRFbaD7ibZZd1oDbYWzmz-j+=1U5esR8gOw@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <52b0d136-3fcc-ad7f-8e53-140c077489be@linux.intel.com>
Date:   Thu, 7 Jan 2021 10:57:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGRrVHyJcMCAEHMzRFbaD7ibZZd1oDbYWzmz-j+=1U5esR8gOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6.1.2021 20.52, Ross Zwisler wrote:
> On Wed, Dec 30, 2020 at 5:31 AM Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> <>
>> I was able to reproduce the issue with two USB devices on a different system.
>>
>> I saw that the new incorrect dequeue pointer sometimes had the higher 32 bits
>> incorrect while the lower bits were correct.
>> So this looks like a memory access order issue.
>>
>> The command TRB is 16 bytes. The xhci driver writes it in four 4 byte chunks.
>> Even if the driver writes the chunk that sets the cycle bit last, handing the TRB
>> over to the controller, it appears that the actual write order can be different.
>> The controller ends up reading a command TRB with updated cycle bit but old bogus
>> values in the "new dequeue pointer" field.
>>
>> Adding a write memory barrier before writing the cycle bit solved the issue in my case.
>>
>> Whole patch series is updated, added write memory barrier, and rebased on 5.10.
>> It can be found force-updated in the same rewrite_halt_stop_handling branch:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git rewrite_halt_stop_handling
>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=rewrite_halt_stop_handling
>>
>> Does this work for you?
> 
> Yes, it does!!  I verified that I'm able to reproduce the issue in less than
> 10 seconds with this commit which is the HEAD~1 of your series:
> 
> a7d053d207121 xhci: handle halting transfer event properly after endpoint stop and halt raced.
> 
> With this commit (the final commit in your series, adding a single patch): 
> 
> 96887d191a88c xhci: make sure TRB is fully written before giving it to the controller
> 
> I ran cleanly for over 20 minutes and haven't been able to reproduce the
> issue.  It looks like the wmb() added in that patch makes all the difference!
> 
> Thank you for the fix, and you can add this tag to the series:
> 
> Tested-by: Ross Zwisler <zwisler@google.com>
> 

Great, thanks for testing.

I think it makes sense to cherry pick that one-liner wmb() patch first to 5.11 and stable,
then add rest of the rewrite later.

-Mathias
