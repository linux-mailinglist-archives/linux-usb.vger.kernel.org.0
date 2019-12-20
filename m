Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79526127E5F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 15:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfLTOqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 09:46:32 -0500
Received: from mga09.intel.com ([134.134.136.24]:52800 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbfLTOqc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Dec 2019 09:46:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 06:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; 
   d="scan'208";a="299034692"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 20 Dec 2019 06:46:29 -0800
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL
 (resending as plain text ;)
To:     "Rene D. Obermueller" <cmdrrdo@gmail.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <0a9215c0-99b3-cf8f-381b-e4997e3f5cfe@linux.intel.com>
Date:   Fri, 20 Dec 2019 16:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.12.2019 15.50, Rene D. Obermueller wrote:
> Hello,
> 
> I'm trying to connect a USB audio device (DJ-Tech CTRL) to my laptop using a Linux 5.4.5 kernel (with Debian patches, but not for xhci), but that fails with the above error message. I've tried with a number of kernels before during the last 9 months with the same result, but didn't get round to actually collect the debug log and make a bug report yet.
> 
> The device worked on two different computers (one Windows 10, the other an older 4.x Linux kernel) that have USB2 ports.
> 
> I've attached dynamic debug output (module xhci_hcd =pflm) from a connection attempt. Is there any other info I should provide or any other tests (vanilla kernel, rc kernel or the like) I should perform?
> 

0x11 is Parameter error "Asserted by a command if a Context parameter is invalid."

adding xhci tracing will show more details.

mount -t debugfs none /sys/kernel/debug
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< plug in USB audio device, let it fail >
Send content of /sys/kernel/debug/tracing/trace

Your log shows it's related to the input context pointed to when
we issue a configure endpoint command:

[ 5063.518821] usb 3-2.3: New USB device found, idVendor=2485, idProduct=504f, bcdDevice= 2.54
[ 5063.518825] usb 3-2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 5063.518828] usb 3-2.3: Product: CTRL
[ 5063.518830] usb 3-2.3: Manufacturer: CTRL
[ 5063.518832] usb 3-2.3: SerialNumber: CTRL
[ 5063.519100] xhci_hcd:xhci_add_endpoint:1917: xhci_hcd 0000:05:00.4: add ep 0x1, slot id 9, new drop flags = 0x0, new add flags = 0x5
[ 5063.519113] xhci_hcd:xhci_add_endpoint:1917: xhci_hcd 0000:05:00.4: add ep 0x81, slot id 9, new drop flags = 0x0, new add flags = 0xd
[ 5063.519118] xhci_hcd:xhci_check_bandwidth:2878: xhci_hcd 0000:05:00.4: xhci_check_bandwidth called for udev 00000000f9c39172
[ 5063.519123] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // Ding dong!
[ 5063.519167] xhci_hcd 0000:05:00.4: ERROR: unexpected command completion code 0x11.

Could be any part of the input context.
(input control context, slot context, or one of the endpoint context).

xhci tracepoints will show the input control context and the slot context.
If those seem fine we might need to add a hack that just dumps everything, including all endpoint contexts

-Mathias
