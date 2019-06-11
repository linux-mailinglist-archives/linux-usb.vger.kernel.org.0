Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682113C575
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 09:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404519AbfFKHyf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 03:54:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:32610 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403815AbfFKHyf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Jun 2019 03:54:35 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jun 2019 00:54:34 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 11 Jun 2019 00:54:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Jun 2019 10:54:31 +0300
Date:   Tue, 11 Jun 2019 10:54:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190611075431.GB7918@kuha.fi.intel.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Vladimir,

On Sun, Jun 02, 2019 at 09:24:43PM +1000, Vladimir Yerilov wrote:
> Good day,
> 
> There's a problem with ucsi starting from 5.2-rc1 (maybe earlier
> versions of 5.2 are affected too).
> Recently I've tried these versions of rc3 (commits), all have this issue:
> 3ab4436f688c2d2f221793953cd05435ca84261c (05/31)
> 3ea3091f1bd8586125848c62be295910e9802af0
> cd6c84d8f0cdc911df435bb075ba22ce3c605b07 (rc2)
> 
> These are lines from journal logs (more in the attachment):
> Jun 01 16:17:27 kernel: BUG: kernel NULL pointer dereference, address:
> 0000000000000368
> Jun 01 16:17:27 kernel: #PF: supervisor read access in kernel mode
> Jun 01 16:17:27 kernel: #PF: error_code(0x0000) - not-present page
> Jun 01 16:17:27 kernel: Oops: 0000 [#1] PREEMPT SMP PTI
> Jun 01 16:17:27 kernel: CPU: 7 PID: 252 Comm: kworker/7:2 Tainted: G
>   U     OE     5.2.0-1-MANJARO #1
> Jun 01 16:17:27 kernel: Hardware name: Timi TM1701/TM1701, BIOS
> XMAKB5R0P0906 10/23/2018
> Jun 01 16:17:27 kernel: Workqueue: events_long ucsi_init [typec_ucsi]
> Jun 01 16:17:27 kernel: RIP: 0010:typec_altmode_get_partner+0x5/0x20 [typec]
> Jun 01 16:17:27 kernel: Code: 85 c0 74 08 e9 3c 8a 78 e2 31 c0 c3 b8
> a1 ff ff ff c3 b8 ed ff ff ff c3 66 66 2e 0f 1f 84 00 00 00 00 00 66
> 90 0f 1f 44 00 00 <48> 8b 87 68 03 00 00 48 83 c0 08 c3 66 66 2e 0f 1f
> 84 00 00 00 00
> Jun 01 16:17:27 kernel: RSP: 0018:ffffa67542123e00 EFLAGS: 00010293
> Jun 01 16:17:27 kernel: RAX: 0000000000000000 RBX: ffff8e9485a56800
> RCX: 0000000000000000
> Jun 01 16:17:27 kernel: RDX: 0000000000000000 RSI: 0000000000000246
> RDI: 0000000000000000
> Jun 01 16:17:27 kernel: RBP: 0000000000000000 R08: ffff8e949ebdbdc0
> R09: 0000000000000000
> Jun 01 16:17:27 kernel: R10: 0000000000000000 R11: 0000000000000000
> R12: 0000000000000000
> Jun 01 16:17:27 kernel: R13: ffff8e9499237540 R14: ffff8e9485a56ac0
> R15: ffff8e9485a56800
> Jun 01 16:17:27 kernel: FS:  0000000000000000(0000)
> GS:ffff8e949ebc0000(0000) knlGS:0000000000000000
> Jun 01 16:17:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Jun 01 16:17:27 kernel: CR2: 0000000000000368 CR3: 00000001c8a0a003
> CR4: 00000000003606e0
> Jun 01 16:17:27 kernel: Call Trace:
> Jun 01 16:17:27 kernel:  ucsi_altmode_update_active+0x85/0x100 [typec_ucsi]
> Jun 01 16:17:27 kernel:  ucsi_init+0x398/0x590 [typec_ucsi]
> Jun 01 16:17:27 kernel:  process_one_work+0x1eb/0x410
> Jun 01 16:17:27 kernel:  worker_thread+0x2d/0x3d0
> Jun 01 16:17:27 kernel:  ? process_one_work+0x410/0x410
> Jun 01 16:17:27 kernel:  kthread+0x112/0x130
> Jun 01 16:17:27 kernel:  ? kthread_park+0x80/0x80
> Jun 01 16:17:27 kernel:  ret_from_fork+0x35/0x40

The firmware is reporting that an alt mode which does not exist is
active? What do you have connected to the USB Type-C connectors on the
machine when that happens?

Can you use the machine normally when nothing is connected to the USB
Type-C connectors, and does the issue happen always when you plug in
some specific device?

Is it possible to send complete dmesg output after that happened?

thanks,

-- 
heikki
