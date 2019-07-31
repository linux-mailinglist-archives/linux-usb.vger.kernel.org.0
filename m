Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6DB47C49F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfGaOQK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 10:16:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:55402 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfGaOQK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 31 Jul 2019 10:16:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jul 2019 07:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; 
   d="scan'208";a="323745705"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2019 07:16:08 -0700
Subject: Re: Oops in xhci_endpoint_reset
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Bob Gleitsmann <rjgleits@bellsouth.net>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
 <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
 <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com>
 <CAFqH_50B27aDDURHyoPvdreMUfbh=7cwwhN4AxKdaiZmp=vgdQ@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <febbec1d-c8e3-daef-6c90-5b1d3e8f06d6@linux.intel.com>
Date:   Wed, 31 Jul 2019 17:18:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_50B27aDDURHyoPvdreMUfbh=7cwwhN4AxKdaiZmp=vgdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31.7.2019 12.18, Enric Balletbo Serra wrote:
> Hi Mathias,
> 
> Thanks to look into this.
> 
> Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dt.,
> 30 de jul. 2019 a les 21:39:
>>
>> On 27.7.2019 23.43, Bob Gleitsmann wrote:
>>> OK, here's the result of the bisection:
>>>
>>> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
>>> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
>>> Author: Jim Lin <jilin@nvidia.com>
>>> Date:???? Mon Jun 3 18:53:44 2019 +0800
>>>
>>> ?????? usb: xhci: Add Clear_TT_Buffer
>>> ??????
>>> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
>>> ?????? processing for full-/low-speed endpoints connected via a TT, the host
>>> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
>>> ?????? that the buffer is not in the busy state".
>>> ??????
>>> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
>>> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
>>> ?????? request we may continue to get STALL with the folllowing requests,
>>> ?????? like Set_Interface.
>>> ??????
>>> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
>>> ?????? request to the hub of the device for the following Set_Interface
>>> ?????? requests to the device to get ACK successfully.
>>> ??????
>>> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
>>> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
>>> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
>>> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
>>> ??3 files changed, 52 insertions(+), 1 deletion(-)
>>>
>>>
>>
>> Thanks, a quick look doesn't immediately open up the cause to me.
>> Most likely an endpoint or struct usb_device got dropped and freed at suspend/resume,
>> but we probably have some old stale pointer still in a a TD or URB to it.
>>
>> could you apply the hack below, it should show more details about this issue.
>>
>> grep for "Mathias" after resume, if you find it we just prevented a crash.
>>
> 
> With the below patch the oops disappears and the reason is
> 
> root@debian:~# dmesg | grep "Mathias"
> [   67.747933] xhci-hcd xhci-hcd.8.auto: Mathias: No vdev for slot id 0
> 

Ok, thanks,
When we free the xhci virt_dev the udev->slot_is set to zero as well.
Looks like whole xHCI was reset are resume:
  
[ 2994.539409] usb usb8: root hub lost power or was reset
[ 2994.539411] usb usb9: root hub lost power or was reset

This means that xHC controller was reset and xhci driver re-allocated everything.

It makes sense to check that xhci virt_device exists in the endpoint reset callback.
This will fix the oops, but I'm still missing the big picture, how we ended up here.

Would it be possible for you to take traces and logs with the previous patch  that prevents
the oops, but shows the "Mathias: No vdev for slot id 0" message?

-Mathias
