Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41846C2195
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 15:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfI3NOP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 09:14:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:1884 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfI3NOP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Sep 2019 09:14:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 06:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; 
   d="scan'208";a="194176526"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2019 06:14:12 -0700
Subject: Re: NULL-deref in xhci_clear_tt_buffer_complete()
To:     Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Jim Lin <jilin@nvidia.com>, linux-usb@vger.kernel.org
References: <20190930103107.GC13531@localhost>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <6ee7120a-c46c-3e69-4902-bc028a917e90@linux.intel.com>
Date:   Mon, 30 Sep 2019 16:16:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930103107.GC13531@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.9.2019 13.31, Johan Hovold wrote:
> Hi Mathias,
> 
> I hit this NULL-deref in xhci_clear_tt_buffer_complete() with usb-next
> after an external HS hub with a connected FS device got into some weird
> state this morning:
> 
> [   66.833702] usb 2-2.4: USB disconnect, device number 5
> [   66.834756] usblcd 2-2.4:1.0: USB LCD #144 now disconnected
> 
> [   67.774259] usb 2-2.4: new full-speed USB device number 6 using xhci_hcd
> [   67.855160] usb 2-2.4: unable to read config index 0 descriptor/start: -32
> [   67.855306] usb 2-2.4: chopping to 0 config(s)
> [   67.855401] usb 2-2.4: can't read configurations, error -32
> [   67.856455] BUG: kernel NULL pointer dereference, address: 00000000000006d8
> [   67.856554] #PF: supervisor read access in kernel mode
> [   67.856635] #PF: error_code(0x0000) - not-present page
> [   67.856712] PGD 0 P4D 0
> [   67.856760] Oops: 0000 [#1] SMP
> [   67.856815] CPU: 2 PID: 97 Comm: kworker/2:2 Not tainted 5.3.0-rc7 #4
> [   67.856904] Hardware name:  /D34010WYK, BIOS WYLPT10H.86A.0051.2019.0322.1320 03/22/2019
> [   67.857017] Workqueue: events hub_tt_work
> [   67.857089] RIP: 0010:xhci_clear_tt_buffer_complete+0x2b/0xb0
> [   67.857173] Code: 57 41 56 41 55 49 89 f5 41 54 55 53 48 89 fb e8 db 94 fd ff 85 c0 75 07 48 8b 9b 58 03 00 00 49 8b 45 28 4c 8d a3 90 03 00 00 <8b> a8 d8 06 00 00 41 f6 45 03 03 75 60 45 0f b6 75 02 41 83 e6 0f
> [   67.857404] RSP: 0018:ffffa6020029fde8 EFLAGS: 00010202
> [   67.857482] RAX: 0000000000000000 RBX: ffff94cd55358000 RCX: 00000000000001f3
> [   67.857577] RDX: 00000000000001f2 RSI: ffff94cd50db2850 RDI: ffff94cd55358000
> [   67.857672] RBP: ffff94cd55372000 R08: 0000000000000000 R09: 0000000000000000
> [   67.857767] R10: 0000000000000000 R11: 0000000000000000 R12: ffff94cd55358390
> [   67.857860] R13: ffff94cd50db2850 R14: dead000000000122 R15: dead000000000100
> [   67.857956] FS:  0000000000000000(0000) GS:ffff94cd57900000(0000) knlGS:0000000000000000
> [   67.858060] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   67.858141] CR2: 00000000000006d8 CR3: 0000000213baa001 CR4: 00000000001606e0
> [   67.858236] Call Trace:
> [   67.858287]  hub_tt_work+0x154/0x190
> [   67.858353]  process_one_work+0x2a0/0x600
> [   67.858425]  worker_thread+0x34/0x3d0
> [   67.858490]  ? process_one_work+0x600/0x600
> [   67.858558]  kthread+0x118/0x130
> [   67.858614]  ? kthread_create_on_node+0x60/0x60
> [   67.858688]  ret_from_fork+0x3a/0x50
> [   67.858753] Modules linked in: netconsole ftdi_sio x86_pkg_temp_thermal usbserial usblcd
> [   67.858865] CR2: 00000000000006d8
> [   67.858922] ---[ end trace 7fb6e59f68b07112 ]---
> 
> Address 00000000000006d8 is udev->slot_id (line 5203) so apparently
>> 	udev = (struct usb_device *)ep->hcpriv;
> 
> can be NULL here.
> 

Ah, Thanks, I see.
Endpoint halts during enumeration while reading the configuration descriptor.
xhci will reset the endpoint and call usb_hub_clear_tt_buffer(), which sets
ep->hcpriv = udev, and schedules hub_tt_work() before it returns -EPIPE (-32)

As reading the configuration descriptor fails usb core will retry the enumeration,
but if frees the udev and reallocates a new one for each retry.
By the time hub_tt_work() runs, the old, freed udev which is set in ep->hcpriv
is already freed and NULL.
  
I'll dig a bit more to see if anything else is needed than just checking if
ep->hcpriv is NULL

-Mathias
