Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23E3735F2
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 10:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhEEIB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 04:01:26 -0400
Received: from mga06.intel.com ([134.134.136.31]:55474 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231826AbhEEIB0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 04:01:26 -0400
IronPort-SDR: VALLZdcxvl04/douW26hnxDnNhZxVNy0Q5QUmZ3nT6FOtgZ2yAQqJqRStxQ9QE9Kd7UBHeFxXb
 QpmkfVNhicnw==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="259435669"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="259435669"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 01:00:29 -0700
IronPort-SDR: t3XuU22SbbiJF2ZmGPYIn2zsFme9c/wH6496Spw7LtJ1Vv7PutqGlIoadZu3zllLyP4yKKFaul
 j42DHAHIUe5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="621809284"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 05 May 2021 01:00:26 -0700
Subject: Re: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
To:     Felipe Balbi <balbi@kernel.org>,
        Sebastian von Ohr <vonohr@smaract.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
 <87eeenj56b.fsf@kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <eb106094-d322-e941-de47-b93fc6206d02@linux.intel.com>
Date:   Wed, 5 May 2021 11:02:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eeenj56b.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.5.2021 16.52, Felipe Balbi wrote:
> 
> Hi,
> 
> (before anything, thanks for actually following the steps for bug
> reporting. Much, much appreciated)
> 
> Sebastian von Ohr <vonohr@smaract.com> writes:
> 
>> I'm running an Intel Apollo Lake SoM (Celeron N3350E) which I want to use as 
>> a USB gadget with the functionFS gadget driver. I have created two bulk 
>> endpoints for sending and receiving data. The hardware and cabling is only USB 
>> 2.0 capable. In one test case the receive side of the SoM is slowed down 
>> deliberately (200ms sleep between reads) while the host PC tries to send as 
>> fast as possible. This setup leads to send timeouts on every second 
>> transmission on the host PC.
>>
>> I believe this is an issue with the USB 2.0 LPM feature, more specifically 
>> hardware LPM done by the host USB controller. I have tested different USB 
> 
> It's like the host is trying to go down to lower LPM states every 100ms:
> 
>      irq/13-dwc3-236     [000] d..1    71.363262: dwc3_event: event (00000401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1    71.363315: dwc3_event: event (00000401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1    71.363423: dwc3_event: event (00006084): ep1out: Transfer In Progress [0] (SIm)
> 
>> descriptors and the issue is gone when removing the USB_LPM_SUPPORT flag from 
>> the USB 2.0 extension descriptor (actually removing only USB_BESL_SUPPORT seems 
>> to suffice). Also the issue occurs only on some newer PCs and adding a hub 

xhci driver enables USB2 LPM only if hardware LPM is supported, driver itself won't do
any L0 -> L1 -> L0 transition. 
It only sets a L1 timeout (inactivirty timer) after  which host sends LPM token.

This can be adjusted on host side in sysfs  file "usb2_lpm_l1_timeout" for thid device.

> 
> it could be that LPM is disabled on older xHCI revisions. Mathias,
> anything you can add here?

xhci driver will only use USB2 LPM if the host supports Hardware LPM capability (HLC bit),
this was optional before xHCI 1.1. 


>> (doesn't matter if 2.0 or 3.0 capable) makes the issue go away. I can 
>> reproduce this issue with a Windows 10 (1909) host running an Intel B360 
>> chipset. I use libusb v1.0.24 with the WinUSB driver on the host side to send 
>> data on the bulk endpoint.

xhci driver in linux only enables USB2 LPM for devices directly conncted to root port.
> 
> could you share a dump of your descriptors? It could be that the wake-up
> latencies are incorrect which tricks the host into trying to go down to
> lower LPM states too frequently.
> 
>> See the attached dwc3 trace and registers. It was created using the current 
>> 5.12.1 kernel version. It shows multiple WakeUp [U0] events in short succession 
>> but never any event showing different link states than U0. The host is doing 8 
>> transmissions of 16 bytes to the device, but the device only receives 4 of 
>> these transmissions. The first transmissions always succeeds while the next one 
>> will timeout on the host. I believe this is because the device is currently not 
>> ready to receive new data. But instead of sending the data when the delay on 
>> the receive side is over the request never finishes and times out after 1 
>> second (or even longer when I increase the timeout value).
>>
>> Is the USB 2.0 LPM extension even supposed to work with the dwc3 controller? I 
> 
> yes, it should be supported :-)
> 
>> can work around this issue currently by downgrading the device to USB 2.0 only 
>> (setting bcdUSB to 0x0200). But I believe USB 3.0 capable device must support 
>> LPM, so this issue might come up again when having USB 3.0 capable hardware.
> 
> correct, LPM is mandatory for USB3.0+. From the traces, we don't see any
> errors, though. Everything looks fine.
> 
> Mathias, I have an old memory from my time at Intel when we discussed
> this very fact. I can't remember what was the conclusion, but is there
> anything the peripheral can do to tell the host to *not* enter U1/U2 so
> frequently? If my memory doesn't fail me, I don't think there is
> anything at all for the peripheral to do, right? Other than not
> supporting U1/U2, which means STALLing the relevat SetFeature
> requests. Do you know if that would still be a certifiable solution?

STALL response to LPM should cause xHCI to disable hardware LPM for this device.

Also NYET response should be visible to xhci driver (L1S) fields in PORTPMSC.
In theory we could try to check this and decide to increase L1 timeout if there are 
frequent NYETs, but there is no driver support for this

Note: xhci specs 4.23.5.1.1 also state:

In the case of a High-speed Bulk OUT Endpoint that has returned a NYEThandshake for
an OUT transaction and then the Hardware LPM mechanism transitions the link to the L1 state,
the xHC shall not initiate a L1 Exit (i.e. wake
up the link) to do a PING transaction. The device is expected to initiate an L1
exit (Remote Wake) when it is ready to accept data.

Does this device support L1 exit (remote wake)?

-Mathias 
