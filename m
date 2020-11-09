Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898FC2AB3AD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 10:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgKIJgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 04:36:10 -0500
Received: from smtp1.math.uni-bielefeld.de ([129.70.45.10]:57480 "EHLO
        smtp1.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgKIJgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 04:36:10 -0500
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 04:36:09 EST
Received: from [192.168.0.100] (pc19f5ca4.dip0.t-ipconnect.de [193.159.92.164])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (3072 bits) server-digest SHA256)
        (Client did not present a certificate)
        by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 601C66055B
        for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2020 10:28:52 +0100 (CET)
To:     linux-usb@vger.kernel.org
From:   Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [bugreport] JMicron JMS567 kills AMD Renoir xHCI
Message-ID: <5e1cc031-3615-75ae-8acc-1b63d8c7cfc6@math.uni-bielefeld.de>
Date:   Mon, 9 Nov 2020 10:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

I recently got a new notebook, a Dell G5 5505, mostly composed of AMD 
hardware. After the initial hiccups most things work smoothly now, until 
I tried to connect my backup drive (2TB HDD in a USB3 enclosure with 
JMicron bridge):
Nov  8 23:39:09 leena kernel: usb 1-2: new low-speed USB device number 2 
using xhci_hcd
Nov  8 23:39:19 leena kernel: xhci_hcd 0000:08:00.3: xHCI host not 
responding to stop endpoint command.
Nov  8 23:39:19 leena kernel: xhci_hcd 0000:08:00.3: USBSTS:
Nov  8 23:39:19 leena kernel: xhci_hcd 0000:08:00.3: xHCI host 
controller not responding, assume dead
Nov  8 23:39:19 leena kernel: xhci_hcd 0000:08:00.3: HC died; cleaning up
Nov  8 23:39:19 leena kernel: usb usb1-port2: couldn't allocate usb_device
Nov  8 23:39:19 leena kernel: usb usb2-port2: couldn't allocate usb_device

Sadly that's not a random hiccup, but reproducable. I did some research 
and some sources recommended to add iommu=pt, but not changes here. The 
BIOS of the G5 is kinda sparse, the only option looking relevant was 
"USB emulation", but toggling it also did not change anything.

I uploaded several logs:
kernel_g5.log (full kernel log from the G5)
lsusb_g5. log (lsusb log, JMicron not plugged in)
lspci_g5.log (lspci log)
lsusb_enclosure (lsusb excerpt for the JMicron, taken via a different 
system)

You can find the files here: 
https://gist.github.com/tobiasjakobi/84b6d58d5c387cfb4bbba87e7a589ca8

The "different system" is another AMD based one (desktop, AMD Athlon 
3000G, ASRock B450M-HDV R4.0). lspci says the following about the USB hw:
01:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series 
Chipset USB 3.1 XHCI Controller (rev 01)
09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raven2 USB 3.1

Anything I can do to help triage this problem?

With best wishes,
Tobias

