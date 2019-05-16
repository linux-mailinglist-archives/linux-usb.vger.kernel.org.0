Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09354209B9
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 16:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfEPObr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 10:31:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:46288 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfEPObr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 10:31:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 May 2019 07:31:46 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 16 May 2019 07:31:45 -0700
Subject: Re: Kernel crash with FTDI FT232R on AMD boards.
To:     Johan Hovold <johan@kernel.org>,
        "StarostaCZ@gmail.com" <starostacz@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
 <20190516135612.GA28564@localhost>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <0d499fe2-80df-cd6d-17a2-7725df240ee8@linux.intel.com>
Date:   Thu, 16 May 2019 17:34:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190516135612.GA28564@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.5.2019 16.56, Johan Hovold wrote:
> On Thu, May 16, 2019 at 03:35:42PM +0200, StarostaCZ@gmail.com wrote:
>> Hello,
>> when I try to read EEPROM memory from FT232R chip (USB to serial
>> converter), system crash after a seconds.
> 
> You should mention that you're using libusb and the vendor's ftdi
> library. Specifically, the kernels ftdi_sio driver is not involved.
> 
>> 1) Configuration
>> ASUS PRIME A320M-K, latest bios version 4801, default settings.
>> Ubuntu server 19.04 with kernel 5.1.1-050101-generic:
>> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1.1/
>>
>> 2) lsusboutput
>> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 003 Device 002: ID 04f3:0103 Elan Microelectronics Corp. ActiveJet
>> K-2024 Multimedia Keyboard
>> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 001 Device 002: ID 0403:6001 Future Technology Devices
>> International, Ltd FT232 Serial (UART) IC
>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>
>> 3) kern.log with IOMMU disabled
>> https://paste.ee/p/nuCPp
> 
> Good that you were able to rule out the iommu, but you forgot to CC the
> xhci maintainer (added Mathias again).
> 
> It could be good idea to include a link to thread with your initial
> report as well:
> 
> 	https://lkml.kernel.org/r/04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com
> 
>> 4) Notes
>> - problem is, when FT232R is connected to USB2.0 port, when is connected
>> to USB3 port, this works fine
>> - another test - same hardware, Debian 9.8 with kernel 4.19 - system
>> crash too
>>
>> -- starosta
> 
> Including only the obviously relevant part of your log below.
> 
>> May 16 15:06:45 test-ubnt kernel: [    0.000000] Linux version 5.1.1-050101-generic (kernel@kathleen) (gcc version 8.3.0 (Ubuntu 8.3.0-12ubuntu1)) #201905110631 SMP Sat May 11 06:33:50 UTC 2019
> 
> ...
> 
>> May 16 15:07:03 test-ubnt kernel: [   30.042564] usbserial: USB Serial deregistering driver FTDI USB Serial Device
>> May 16 15:07:03 test-ubnt kernel: [   30.042759] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now disconnected from ttyUSB0
>> May 16 15:07:03 test-ubnt kernel: [   30.042792] usbcore: deregistering interface driver ftdi_sio
>> May 16 15:07:03 test-ubnt kernel: [   30.042842] ftdi_sio 1-9:1.0: device disconnected
>> May 16 15:07:54 test-ubnt kernel: [   81.751630] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.

logs and traces from xhci could tell more details about what is going on,
This line indicates a URB cancellation issues.

To get xhci traces and logs please do:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< read EEPROM using the usb serial converter >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

-Mathias
