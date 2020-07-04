Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17002146DF
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 17:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgGDPVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 11:21:47 -0400
Received: from smtp67.ord1d.emailsrvr.com ([184.106.54.67]:57504 "EHLO
        smtp67.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgGDPVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 11:21:47 -0400
X-Greylist: delayed 377 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 11:21:47 EDT
X-Auth-ID: halbert@halwitz.org
Received: by smtp9.relay.ord1d.emailsrvr.com (Authenticated sender: halbert-AT-halwitz.org) with ESMTPSA id 1E489C00B7
        for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2020 11:15:30 -0400 (EDT)
To:     Linux USB List <linux-usb@vger.kernel.org>
From:   Dan Halbert <halbert@halwitz.org>
Subject: Kernel crash during USB device enumeration or MSC mounting
Message-ID: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
Date:   Sat, 4 Jul 2020 11:15:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Classification-ID: d8795fb2-3552-4b42-b2ee-6161d687e8a0-1-1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi -- I was referred to this list by Kai-Heng Feng after filing an issue 
on the Ubuntu bug tracker here:

   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1871143.

Many further details are in that report, including "lsusb -v", "lspci 
-v", dmesg, and call trace output.

We are seeing kernel crashes from certain composite USB devices that 
present as MSC, CDC, HID, and MIDI. The devices are microcontroller 
boards running CircuitPython 
(https://github.com/adafruit/circuitpython), which uses the TinyUSB USB 
stack: https://github.com/hathach/tinyusb.

The board is commanded to forcibly reformat its MSC FAT12 filesystem and 
then reset. This causes a USB reset and re-enumeration, which can often 
(though not all the time) cause a kernel crash.

The crashes may be some kind of use-after-free bug in the kernel USB driver.

We have seen this or similar crashes caused by several different boards 
that use different microcontrollers. The hosts are x64, including Dell 
Intel-chipset desktops and an older Mac Mini running Linux (also Intel 
chipset).

The ports in use can be either USB2 or USB3. Sometimes interposing a 
USB2 hub helps.

The boards and underlying software are from Adafruit. I work for 
Adafruit on CircuitPython, and the maintainer of TinyUSB also works for 
Adafrui, so we can provide further help to track this down. We can 
provide Beagle 12 USB traces if that would be helpful.

I have reproduced these crashes using kernels as far back as 4.10 and up 
to 5.7, so it is a long-standing issue.

We're very happy to provide further information. See the Launchpad bug 
report for more details.

Dan
