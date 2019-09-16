Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F4FB3AD5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732937AbfIPM5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 08:57:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:33977 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727917AbfIPM5m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Sep 2019 08:57:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 05:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; 
   d="scan'208";a="185829756"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2019 05:57:40 -0700
Subject: Re: No SuperSpeedPlus on ASM2142
To:     =?UTF-8?Q?Lo=c3=afc_Yhuel?= <loic.yhuel@gmail.com>,
        linux-usb@vger.kernel.org
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com>
Date:   Mon, 16 Sep 2019 15:59:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.9.2019 5.41, Loïc Yhuel wrote:
> Hello,
> 
> I'm trying to get Gen 2 working on this controller.
> It drives 2 USB ports on the back panel of an ASUS Prime X399-A (latest BIOS).
> ASM2142 FW is 170308_70_02_00 (seen with ASM2142A_MPTool on Windows).
> On Windows 10 it uses the Microsoft xhci driver, and Gen 2 works.
> 
> On 5.3, I get :
> [    1.008270] xhci_hcd 0000:08:00.0: Host supports USB 3.0 SuperSpeed
> ...
> [    1.333145] usb 4-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> 
> lsusb shows 10 Gbps support in "SuperSpeedPlus USB Device Capability" for
> both the root hub and the device.
> 
> For the root hub, commit ddd57980 broke the detection, since
> xhci->usb3_rhub.min_rev is 0x1 instead of expected 0x10 (SBRN is 0x30).

So both places that indicate USB 3.1 support are not according to latest spec,
SBRN (Serial Bus Release Number) is 30 instead of 31, and supported protocol
capability minor revision is 0x1 instead of 0x10.


> Reverting it changes to "Host supports USB 3.1 Enhanced SuperSpeed", and the
> speed of the root hub is 10000 in sysfs.
> However, I only got the device detected as "SuperSpeedPlus Gen 2 USB" once,
> and the performance didn't increase, so even if the "speed" in sysfs was 10000,
> I think it didn't work. After a reboot, it reverted to being detected as Gen 1.

Most reliable way of checking the current actual port speed is reading protocol speed id
from the ports PORTSC register port-speed field.
Use debugfs: (with your correct pci address and port number)

cat  /sys/kernel/debug/usb/xhci/0000\:00\:15.0/ports/port13/portsc
Powered Connected Enabled Link:U0 PortSpeed:4 Change: Wake:

PortSpeed:4 is default for SS 5Gbps, Gen1x1
PortSpeed:5 is defaulf for SSP 10Gbps, Gen2x1

> 
> The device (JMS580 USB Gen 2 to SATA bridge, with an SSD) seems to have a
> performance issue on Gen 1 (doesn't depend on the controller or the OS), with
> about 280MB/s read (almost the same without UAS).
> But Gen 2 on Windows gives 510MB/s read, so even the only time Linux reported
> 10 Gbps speed, if it was working "hdparm -t" should have improved.
> 

I recall similar numbers in Linux, ~500-550Mb/s with a USB 3.1 to SATA adapter
and fast SSD. Reading with dd

> As a side note, the runtime power management doesn't seem to work either, but
> since it isn't the default configuration, unless this controller is
> used on laptops
> it probably doesn't matter.
> If the power/control of the PCIe device and its two root hubs are all set to
> "auto", it is suspended if there is no USB device, and doesn't wake up on plug.
> 

Is the xHCI controller id PCI D0 state even when runtime suspeded?
Some ACPI tables end up preventing D3 for runtime suspend, keeping controller in D0
and possibly preventing PME# wake signaling

-Mathias
