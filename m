Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06E43D6B7F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 03:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhG0Ak2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 20:40:28 -0400
Received: from pcug.org.au ([203.10.76.4]:39753 "EHLO pasta.tip.net.au"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232296AbhG0AkZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 20:40:25 -0400
X-Greylist: delayed 340 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Jul 2021 20:40:25 EDT
Received: from pasta.tip.net.au (pcug.org.au [203.10.76.4])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4GYf3h1lH5z9PwP
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 11:15:12 +1000 (AEST)
Received: from e4.eyal.emu.id.au (unknown [121.45.32.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4GYf3h1BvFz9PYd
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 11:15:12 +1000 (AEST)
To:     list linux-usb <linux-usb@vger.kernel.org>
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
Subject: usb port enumeration changed?
Message-ID: <261c3985-28bc-b203-59fa-ecb650f2b42d@eyal.emu.id.au>
Date:   Tue, 27 Jul 2021 11:15:11 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I know that device numbers change, but bus/port numbers are stable and reflect the physical layout
of the hubs and devices. I relied for years on these port numbers to identify specific (otherwise
identical) devices.

Searching the list (I am now subscribed) and the web did not yield an answer.

For example, I have two TEMPer temperature sensor devices attached. They are both plugged into
a 4-port USB3 hub. They are on ports 3 and 4. Port 2 is unused and port 1 has a bluetooth radio
attached. I also have 5 dvb usb tuners which stayed in their old positions.

Until now (fedora 34, last on 5.12.17-300.fc34.x86_64), I would see this:

$ lsusb
Bus 001 Device 013: ID 0c45:7401 Microdia TEMPer Temperature Sensor
Bus 001 Device 025: ID 0c45:7401 Microdia TEMPer Temperature Sensor

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 10000M
     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
         |__ Port 4: Dev 4, If 0, Class=Hub, Driver=hub/4p, 5000M
     |__ Port 5: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
     |__ Port 2: Dev 26, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 2: Dev 27, If 1, Class=Human Interface Device, Driver=usbhid, 12M
         |__ Port 2: Dev 27, If 0, Class=Human Interface Device, Driver=usbhid, 12M
     |__ Port 4: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 3: Dev 10, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 3: Dev 10, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 1: Dev 6, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 4: Dev 12, If 0, Class=Hub, Driver=hub/4p, 480M
             |__ Port 3: Dev 15, If 0, Class=Printer, Driver=usblp, 12M
             |__ Port 1: Dev 14, If 1, Class=Vendor Specific Class, Driver=, 480M
             |__ Port 1: Dev 14, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
             |__ Port 4: Dev 16, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
             |__ Port 4: Dev 16, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 2: Dev 8, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 2: Dev 8, If 1, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 1: Dev 20, If 0, Class=Wireless, Driver=btusb, 12M
         |__ Port 1: Dev 20, If 1, Class=Wireless, Driver=btusb, 12M
         |__ Port 3: Dev 25, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
         |__ Port 3: Dev 25, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
         |__ Port 4: Dev 13, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
         |__ Port 4: Dev 13, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
     |__ Port 6: Dev 19, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M

The TEMPer devices show on Bus 01 as was always:
     Port 5.Port 3    (Dev 11)
     Port 5.Port 4    (Dev 13)

After rebooting the newly installed kernel 5.13.4-200.fc34.x86_64 I get:

$ lsusb
Bus 001 Device 012: ID 0c45:7401 Microdia TEMPer Temperature Sensor
Bus 001 Device 003: ID 0c45:7401 Microdia TEMPer Temperature Sensor

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 10000M
     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
         |__ Port 4: Dev 4, If 0, Class=Hub, Driver=hub/4p, 5000M
     |__ Port 5: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 2: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid, 12M
         |__ Port 2: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
     |__ Port 3: Dev 3, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
     |__ Port 3: Dev 3, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
     |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 3: Dev 11, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 3: Dev 11, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 1: Dev 7, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 1: Dev 7, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 4: Dev 13, If 0, Class=Hub, Driver=hub/4p, 480M
             |__ Port 3: Dev 15, If 0, Class=Printer, Driver=usblp, 12M
             |__ Port 1: Dev 14, If 1, Class=Vendor Specific Class, Driver=, 480M
             |__ Port 1: Dev 14, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
             |__ Port 4: Dev 16, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
             |__ Port 4: Dev 16, If 1, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 2: Dev 9, If 0, Class=Vendor Specific Class, Driver=dvb_usb_rtl28xxu, 480M
         |__ Port 2: Dev 9, If 1, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 5: Dev 6, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 1: Dev 10, If 0, Class=Wireless, Driver=btusb, 12M
         |__ Port 1: Dev 10, If 1, Class=Wireless, Driver=btusb, 12M
         |__ Port 3: Dev 12, If 0, Class=Human Interface Device, Driver=, 1.5M            <<<<<
         |__ Port 3: Dev 12, If 1, Class=Human Interface Device, Driver=, 1.5M            <<<<<
     |__ Port 6: Dev 18, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M

One can see that the TEMPer devices are now showing on Bus 01 but in separate positions:
     Port 3           (Dev 3)  new position
     Port 5.Port 3    (Dev 12) old position

This, naturally, confuses my script that collects the data from these sensors (I use temper-poll).

Is this an intentional change?
If so then what is the way to stably disambiguate usb devices (there is no s/n available)?

If no change was expected then does this reflect a possible hwr problem here?

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)
