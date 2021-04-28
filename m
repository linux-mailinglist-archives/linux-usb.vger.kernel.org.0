Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6E336D84E
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 15:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239634AbhD1NbE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 09:31:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:25008 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230007AbhD1NbD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 09:31:03 -0400
IronPort-SDR: u8DuYW/nnDU48kNbrNM++MVNAdmcSMmdQFyecjHnzlR671MNjWSlalnesyttSaZrWgtEqY3g7w
 re9Vpj8JR4Tw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="217457274"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="217457274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 06:30:16 -0700
IronPort-SDR: 3smugMgHfETUSe6Mlk8bWyTyfoSSNbedSQVveM+9dzygUgOsjB/p+HNzn0VdR1uXTx97F3bqar
 0MYhhcj4VYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="619311159"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2021 06:30:14 -0700
Subject: Re: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
 <07196754c6de290bb46cc235ce6e96c5df304150.1618014279.git.Thinh.Nguyen@synopsys.com>
 <845ec8a0-43f2-a28e-5edc-d7a47ccabdf5@linux.intel.com>
 <b5c8bfc8-20cf-fad1-f053-971cb98348ad@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <aa64a81c-8e60-f933-5d17-f511e47507f7@linux.intel.com>
Date:   Wed, 28 Apr 2021 16:32:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5c8bfc8-20cf-fad1-f053-971cb98348ad@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.4.2021 1.30, Thinh Nguyen wrote:
>> On 10.4.2021 3.47, Thinh Nguyen wrote:
>>> If there is a device with active enhanced super-speed (eSS) isoc IN
>>> endpoint(s) behind one or more eSS hubs, DWC_usb31 (v1.90a and prior)
>>> host controller will not detect the device disconnection until no more
>>> isoc URB is submitted. If there's a device disconnection, internally
>>> the wait for tHostTransactionTimeout (USB 3.2 spec 8.13) blocks the
>>> other endpoints from being scheduled. So, it blocks the interrupt
>>> endpoint of the eSS hub indicating the port change status.
>>>
>>> This can be an issue for applications that continuously submitting isoc
>>> URBs to the xHCI. To work around this, stop processing new URBs after 3
>>> consecutive isoc transaction errors. If new isoc transfers are queued
>>> after the device is disconnected, the host will respond with USB
>>> transaction error. After 3 consecutive USB transaction errors, the
>>> driver can wait a period of time (at least 2 * largest periodic interval
>>> of the topology) without ringing isoc endpoint doorbell to detect the
>>> port change status. If there is no disconnection detected, ring the
>>> endpoint doorbell to resume isoc transfers.
>>
>> Is that enough? many Isoc URBs queue 16 - 32 Isoc TRBs per URB.
>> And drivers like UVC queue several URBs in advance.
> 
> That's fine as long as the driver stops ringing more doorbell for a
> certain period of time creating a gap that's enough to get the
> notification from the interrupt endpoint. We tested with 128 isoc URBs
> and was able to detect a disconnect after this delay.

Ok, if not ringing the endpoint is enough then that is better than
stopping the whole endpoint. 

>>> This workaround tracks the max eSS periodic interval every time there's
>>> an endpoint added or dropped, which happens when there's bandwidth
>>> check. So, scan the topology and update the xhci->max_ess_interval
>>> whenever there's a bandwidth check. Introduced a new flag
>>> VDEV_DISCONN_CHECK_PENDING to prevent ringing the doorbell while waiting
>>> for a disconnection status. After 2 * max_ess_interval time and no
>>> disconnection detected, a delayed work will ring the doorbell to resume
>>> the active isoc transfers.
>>
>> Sounds very elaborate for a vendor specific disconnect workaround.
>> Isn't there a simpler way?
>>
>> Maybe stop all isoc in endpoints if one them has 3 consecutive transaction error,
>> wait for 2x hub interrupt interval time, and then restart the endpoints if there is
>> no disconnect?
> 
> We can also do this (but without stop + restart the endpoints). It just
> creates a slightly larger gap that may be more noticeable to the user if
> there's no actual disconnection.

Ok, if blocking the doorbell is enough then it sounds better.

How about that max interval tracking, is it necessary?
It will block the doorbell from 250us up to several seconds.
Is there some reasonable single value that can be used instead?

>>
>> There is bigger concern with this series, it scatters a lot of vendor specific code 
>> around the generic xhci driver. It's not very clear afterwards what code is part of the
>> workaround and what is generic code.
>>
>> We just got a lot of the Mediatek code moved to xhci-mtk*, maybe its time to add xhci-snps.c
>> instead of using the generic platform driver with tons of workarounds and quirks.
>>
> 
> Thanks for the reviews. I need to look into how this can be done. May
> need your suggestion as not every scenarios can be overridden
> easily/cleanly.

true, no easy overrides for this transfer error / doorbell blocking workaround.
Needs a bit of work

-Mathias
