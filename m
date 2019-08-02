Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAEF7F5E3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 13:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392327AbfHBLU7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 07:20:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:33590 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392325AbfHBLU7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Aug 2019 07:20:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Aug 2019 04:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; 
   d="scan'208";a="324547560"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 02 Aug 2019 04:20:56 -0700
Subject: Re: Oops in xhci_endpoint_reset
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Bob Gleitsmann <rjgleits@bellsouth.net>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
 <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
 <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com>
 <CAFqH_50B27aDDURHyoPvdreMUfbh=7cwwhN4AxKdaiZmp=vgdQ@mail.gmail.com>
 <febbec1d-c8e3-daef-6c90-5b1d3e8f06d6@linux.intel.com>
 <CAFqH_53pKrXisvmV6i3LG37M7rdAGjEHy3EyhMC=1P7cE9EEvg@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <083ba630-0c06-9a7d-1943-1fa41a24301c@linux.intel.com>
Date:   Fri, 2 Aug 2019 14:22:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_53pKrXisvmV6i3LG37M7rdAGjEHy3EyhMC=1P7cE9EEvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31.7.2019 19.31, Enric Balletbo Serra wrote:
> Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dc.,
> 31 de jul. 2019 a les 16:16:
>>
>> On 31.7.2019 12.18, Enric Balletbo Serra wrote:
>>> Hi Mathias,
>>>
>>> Thanks to look into this.
>>>
>>> Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dt.,
>>> 30 de jul. 2019 a les 21:39:
>>>>
>>>> On 27.7.2019 23.43, Bob Gleitsmann wrote:
>>>>> OK, here's the result of the bisection:
>>>>>
>>>>> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
>>>>> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
>>>>> Author: Jim Lin <jilin@nvidia.com>
>>>>> Date:???? Mon Jun 3 18:53:44 2019 +0800
>>>>>
>>>>> ?????? usb: xhci: Add Clear_TT_Buffer
>>>>> ??????
>>>>> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
>>>>> ?????? processing for full-/low-speed endpoints connected via a TT, the host
>>>>> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
>>>>> ?????? that the buffer is not in the busy state".
>>>>> ??????
>>>>> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
>>>>> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
>>>>> ?????? request we may continue to get STALL with the folllowing requests,
>>>>> ?????? like Set_Interface.
>>>>> ??????
>>>>> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
>>>>> ?????? request to the hub of the device for the following Set_Interface
>>>>> ?????? requests to the device to get ACK successfully.
>>>>> ??????
>>>>> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
>>>>> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>
>>>>> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
>>>>> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
>>>>> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
>>>>> ??3 files changed, 52 insertions(+), 1 deletion(-)
>>>>>
>>>>>
>>>>
>>>> Thanks, a quick look doesn't immediately open up the cause to me.
>>>> Most likely an endpoint or struct usb_device got dropped and freed at suspend/resume,
>>>> but we probably have some old stale pointer still in a a TD or URB to it.
>>>>
>>>> could you apply the hack below, it should show more details about this issue.
>>>>
>>>> grep for "Mathias" after resume, if you find it we just prevented a crash.
>>>>
>>>
>>> With the below patch the oops disappears and the reason is
>>>
>>> root@debian:~# dmesg | grep "Mathias"
>>> [   67.747933] xhci-hcd xhci-hcd.8.auto: Mathias: No vdev for slot id 0
>>>
>>
>> Ok, thanks,
>> When we free the xhci virt_dev the udev->slot_is set to zero as well.
>> Looks like whole xHCI was reset are resume:
>>
>> [ 2994.539409] usb usb8: root hub lost power or was reset
>> [ 2994.539411] usb usb9: root hub lost power or was reset
>>
>> This means that xHC controller was reset and xhci driver re-allocated everything.
>>
>> It makes sense to check that xhci virt_device exists in the endpoint reset callback.
>> This will fix the oops, but I'm still missing the big picture, how we ended up here.
>>
>> Would it be possible for you to take traces and logs with the previous patch  that prevents
>> the oops, but shows the "Mathias: No vdev for slot id 0" message?
>>
> 
> Sure, here is:
> 
> dmesg: https://paste.debian.net/1093737/
> traces: https://drive.google.com/open?id=1So-_zsu8ROtMH08hYVKIAZfr_51QLUPD
> 

Thanks, now I understand what is happening.

xhci host driver doesn't do anything in xhci_endpoint_reset() unless the hcpriv pointer
in struct usb_host_endpoint points to a usb device:

static void xhci_endpoint_reset(struct usb_hcd *hcd, struct usb_host_endpoint *host_ep)
{       ...
         if (!host_ep->hcpriv)
                 return;
         udev = (struct usb_device *) host_ep->hcpriv;

host_ep->hcpriv is set in xhci_add_endpoint() when allocating xhci parts of the endpoint.
But the default control endpoint ep0 is never added, its allocated by default together
with the xhci slot, so host_ep->hcpriv for ep0 is always NULL, or, was until
commit "usb: xhci: Add Clear_TT_Buffer" changed that.

ep0 is special, and usb core will reset it before resetting the device.

usb_reset_and_verify_device()
{       ...
         /* ep0 maxpacket size may change; let the HCD know about it.
          * Other endpoints will be handled by re-enumeration. */
         usb_ep0_reinit(udev);
         ret = hub_port_init(parent_hub, udev, port1, i);

If xhci is reset at resume,  all xhci slots are released, and slot_id in struct usb_device
are are set to 0. At device reset the xhci driver notices slot_id doesn't point
to a valid xhci slot, so a new slot is enabled and allocated.

Other endpoints than ep0 are always reset after after the device is reset, and by then there
is a valid xhci slot in place, so that's why this never triggered before.

So this is triggered if there is a full speed or low speed device behind a high speed hub that
stalled, which would set host_ep->hcpriv (patch usb: xhci: Add Clear_TT_Buffer),
followed by a resume that requires xhci host reset, losing all slots,
making host_ep->hcpric->slot_id == 0

So to fixing this by checking slot_id and udev are valid in xhci_endpoint_reset() should be ok,
but after that a better look at how we use host_ep->hcpriv wouldn't hurt

-Mathias
