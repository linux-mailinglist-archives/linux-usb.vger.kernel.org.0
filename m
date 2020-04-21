Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A38F1B1FEF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 09:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUHec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 03:34:32 -0400
Received: from mga01.intel.com ([192.55.52.88]:39875 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUHec (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Apr 2020 03:34:32 -0400
IronPort-SDR: /Wx4mvoDdI2jY/p1nOtVbmQ+Fn5EguJ2WwbqrOC0txNH6dYxffqdXcAlh6EV9Ibe80SgIXBWh7
 0Guy4IsD/iAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 00:34:30 -0700
IronPort-SDR: Lr+yTrxR1E36fswoScBH/HdzhsIQbiAya9hDs6NLI95JwsTkpv0YHhFGby1nJMph7oOuEDDzip
 2x65fkMQm4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; 
   d="scan'208";a="247104409"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2020 00:34:29 -0700
Subject: Re: [PROBLEM]: Infinite warm reset loops resulting in "Cannot enable.
 Maybe the USB cable is bad?" messages
To:     Matthew Ruffell <matthew.ruffell@canonical.com>,
        linux-usb@vger.kernel.org
Cc:     dann.frazier@canonical.com, heitor.de.siqueira@canonical.com,
        glogow@fbihome.de
References: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <7620fe19-cd6c-528d-2bc2-dd5a3be3973a@linux.intel.com>
Date:   Tue, 21 Apr 2020 10:37:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.4.2020 6.24, Matthew Ruffell wrote:
> Hi,
> 
> I am struggling to debug a regression, and it would be great if we could work
> this out together. I'm not very familiar with the USB subsystem, but I will try
> my best.
> 
> We have had a few reports from users where their USB devices are extremely slow,
> to the point where they are unusable. Their dmesg buffers are filled with:
> 
> [ 14.000130] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> [ 18.092123] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> [ 22.172116] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> [ 26.252116] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
> 
> This only seems to happen with specific hardware combinations. We did a git
> bisect, and determined that the below commit was the root cause:
> 
> commit 4fdc1790e6a9ef22399c6bc6e63b80f4609f3b7e
> Author: Jan-Marek Glogowski <glogow@fbihome.de>
> Date:   Fri Feb 1 13:52:31 2019 +0100
> Subject: usb: handle warm-reset port requests on hub resume
> 
> We had to revert this commit from the Ubuntu kernels for the time being, but we
> wish to re-apply it once we determine how to fix this regression.
> 
> The problem still exists on the latest 5.7-rc1 kernel, and if we revert the
> above commit, the problem vanishes.
> 
> Logs (from an affected system, it has a LOT of USB devices):
> 
> System Info:
> Ubuntu 18.04, 4.15.0-72-generic kernel.
> 
> lsusb:                                  https://paste.ubuntu.com/p/Syh2StCyyT/
> lsusb -t:                               https://paste.ubuntu.com/p/fG7DdXvh58/
> filtered dmesg, with usbcore.dyndbg=+p: https://paste.ubuntu.com/p/DyY9SJRcdv/
> filtered lspci:                         https://paste.ubuntu.com/p/Kr96PvRmH4/
> 
There are no USB3 devices enumerated.

Do any of the devices connected to the hub support USB 3 speeds (5Gbps or faster)?
If not, could you add one the hub hub?

> My commentary on the problem:
> 
> First the hubs come onto the scene:
> 
> USB 2:
> 
> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> usb usb1: Product: xHCI Host Controller
> hub 1-0:1.0: USB hub found
> 
> USB 3:
> 
> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
> xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
> usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
> usb usb2: Product: xHCI Host Controller
> hub 2-0:1.0: USB hub found 
> 
> Next, the USB 2 and 3 port peering happens. Let's only look at usb1-port2 and
> usb2-port2.
> 
> usb usb2-port2: peered to usb1-port2
> 
> The next interesting message is hub 1-0 reporting normal state, followed by 
> hub 2-0 reporting okay, then going into hub suspend.
> 
> hub 1-0:1.0: state 7 ports 16 chg 201c evt 0000
> hub 2-0:1.0: state 7 ports 10 chg 0000 evt 0000
> hub 2-0:1.0: hub_suspend
> usb usb2: bus auto-suspend, wakeup 1
> 
> A new USB device is found on port 2. It gets registered under usb 1-2 and not
> usb 2-2.
> 
> usb 1-2: new high-speed USB device number 2 using xhci_hcd
> 
> Following that, hub 2-0 resumes, noting a race event:
> 
> usb usb2: suspend raced with wakeup event
> usb usb2: usb auto-resume
> hub 2-0:1.0: hub_resume
> 
> Things keep on going with usb 1-2 though:
> 
> usb 1-2: New USB device found, idVendor=0424, idProduct=2807
> usb 1-2: Product: USB2807 Hub
> usb 1-2: Manufacturer: Microchip
> hub 1-2:1.0: USB hub found
> 
> Its a Microchip USB hub. It becomes hub 1-2. The next thing to happen is where
> the faults start coming in:
> 
> usb usb2-port2: do warm reset
> 
> A warm reset is issued to usb 2-2. But as we have previously gathered before,
> 2-2 is an "empty" port, peered to 1-2, and the device is under 1-2. This seems
> to be linked with the hub 2-0 suspend and auto-resume event.
> 
> This of course matches the text in the problematic commit message:
> 
>> This just happens, if its the only device on the root hub, the hub
>> therefore resumes and the HCDs status_urb isn't yet available.
>> If a warm-reset request is detected, this sets the hubs event_bits,
>> which will prevent any auto-suspend and allows the hubs workqueue
>> to warm-reset the port later in port_event.
> 
> At the moment, usb 1-2 is the only device on the hub 1-0 root hub. Or so I think
> anyway. I think I am reading correctly that hub 2-0 has no devices yet.
> 
> Anyway, the warm reset is tried again after the first timeout:
> 
> usb usb2-port2: not warm reset yet, waiting 50ms
> usb usb2-port2: not warm reset yet, waiting 200ms
> 
> While this is happening, usb 1-2 is trying to set up the new hub 1-2.
> 
> usb 1-2-port1: status 0101 change 0001
> usb 1-2-port2: status 0101 change 0001
> ...
> 
> A new warm reset is tried:
> 
> usb usb2-port2: not warm reset yet, waiting 200ms
> 
> hub 1-2 starts discovering new devices:
> 
> usb 1-2.1: New USB device found, idVendor=0403, idProduct=6011
> usb 1-2.1: Product: Quad RS232-HS
> usb 1-2.1: Manufacturer: FTDI
> 
> So things seem to be functioning normally at USB 2.0 speeds for usb 1-2. Back
> on the usb 2-2 front:
> 
> usb usb2-port2: not warm reset yet, waiting 200ms
> usb usb2-port2: not enabled, trying warm reset again...
> 
> From there on hub 1-2 keeps on discovering new devices and bringing them up,
> and usb 2-2 keeps trying to warm reset.
> 
> Looking at the problematic code: 
> 
> /* Make sure a warm-reset request is handled by port_event */
> if (type == HUB_RESUME &&
> hub_port_warm_reset_required(hub, port1, portstatus))
> set_bit(port1, hub->event_bits);
> 
> It almost feels like we are missing a check to see if the port in question is
> already in use in another bus. Or if the port is "empty".
> 

Unlike other devices USB 3 hubs will enumerate as both USB 2.0 and USB 3 devices. 

Looks like the USB 3 part of the hub is not working correctly.

My guess is that without the patch the USB 3 part of the hub is not working either. 
Patch probably helps hub driver discover there is a USB 3 device in a SS_INVALID link
state in the first place, and starts recovering it by warm resetting it.


> In any case, reverting this commit on a mainline 5.7-rc1 kernel fixes the problem.
> 
> We have obtained access to an affected machine, and we can gather any debug data
> that might be useful, or test any patches. Let me know what I can do, and I will
> promptly fetch output.


If it's an external hub can you try connecting some other USB 3 device first to a 
USB 3 roothub port, and then the hub to another USB 3 roothub port?

This way the USB 3 roothub (bus) should not be suspended when the USB 3 hub is connected.
Does that help, or change anything

Thanks
-Mathias

