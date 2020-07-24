Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2BA22C40C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 13:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgGXLIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 07:08:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:29463 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgGXLId (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jul 2020 07:08:33 -0400
IronPort-SDR: UhjL0cOPrqx2H7BxtleeoMxjgxSQOZ4xlEWYhfkchkWw5Azwk+jZoUvnwFi5csA4FKRP5zYuqV
 pwg6SsdbI8NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="130252173"
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; 
   d="scan'208";a="130252173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2020 04:08:32 -0700
IronPort-SDR: O/Sn6MSBhSbmI3UNtCJHEfgapdG+phMl/4bip57D+AZ0/CtLdaWYRwuhxBNPfWItJCYdzW6apk
 pZVB3SWHamiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; 
   d="scan'208";a="327297226"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2020 04:08:31 -0700
Subject: Re: [PATCH 00/27] xhci features for usb-next
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
 <20200723150411.GA2529859@kroah.com>
 <be21534d-df11-c957-43eb-e64a05a45404@linux.intel.com>
 <20200724070643.GH3880088@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <f8e1a53e-6095-3a7c-977e-b3a7ec7f0bca@linux.intel.com>
Date:   Fri, 24 Jul 2020 14:11:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200724070643.GH3880088@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.7.2020 10.06, Greg KH wrote:
> On Thu, Jul 23, 2020 at 09:47:14PM +0300, Mathias Nyman wrote:
>> On 23.7.2020 18.04, Greg KH wrote:
>>> On Thu, Jul 23, 2020 at 05:45:03PM +0300, Mathias Nyman wrote:
>>>> Hi Greg
>>>>
>>>> This series for usb-next is almost completely about decoupling and
>>>> cleaning up relations between xhci, xhci debug capability (DbC),
>>>> and the DbC tty support.
>>>>
>>>> Real motivation behind this is to later turn DbC into a proper device
>>>> allowing us to bind different drivers to it, like dbctty.
>>>
>>> I don't really understand why you want to do that, but ok :)
>>
>> Well to be fair loading different drivers for DbC isn't the only motivation.
>>
>> Just using the Linux device model solves issues we are currently seeing 
>> when using DbC on systems with several xHCI controllers. The original DbC 
>> implementation didn't take this into account. 
> 
> I thought when that was first merged no one cared :)
> 
> Nice to see that fixed here.
> 
>> And as a bigger picture DbC is just one extended capability. 
>> xHC controller provides a list of support extended capabilities, each one
>> with an ID and often a mmio region (inside xhci mmio range).
>> We don't handle these consistently in the xhci driver, for example
>> the role switch capability is currently turned into a platform device
>> while the DbC capability support is squashed all into the xhci driver.
>>
>> Long term idea here would be to create a extended capability bus where each
>> capability is a device, (child of xhci device) and drivers for these match
>> based on the capability ID.
> 
> Odd, but ok.

Suggestions and other approaches are welcome.

> 
>>> What is that going to help with?
>>
>> The option to load other drivers for the DbC capability will help other
>> developers to write "standard" Linux drivers that provide different interfaces
>> than TTY to send data over DbC.
>>
>> I don't fully understand these TTY limitations myself, but there is a strong push
>> to implement this, and the task to provide the infrastructure for this landed
>> on my table.
> 
> What other interface is asked for?  And yes, I would push back, what is
> wrong with TTY here?  It should be the most "low overhead" interface
> that works with common userspace tools that we have.

I've been asking the same questions about the TTY limitations.

Currently there's a driver providing a character device in development.
The developers are aware that they need to clarify and justify the need for a
new interface to get the driver upstream. My concerns and suggestions are noted.

As I don't understand these TTY limitations I'll have to let people publishing the
driver do this part. I expect that the driver will clarify things.

Anyway, I rather support them and work on providing the infrastructure needed 
to write such a driver, and give them the opportunity to implement whatever is needed.

Thanks
Mathias
