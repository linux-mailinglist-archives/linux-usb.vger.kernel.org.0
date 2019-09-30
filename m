Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C022DC1EE7
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 12:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730638AbfI3KbE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 06:31:04 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33246 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729415AbfI3KbE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 06:31:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id y127so6628129lfc.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2019 03:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=4DDWbNReBvgFhUjNUz4LW3KuSmkSJ9Df4wPhwJSiTng=;
        b=qg9OkLcoS04Il2cvv88Ge+j1gYhgKfjQSuTXHKftxGqJHNEWBBkzb8D2w4l6dwAGtk
         QIu59LhAQO5esTzO6j/+CDuNZYgp4x/5vGXYt9eGQ57ZxVxNcx841X1DWEfVtaCkYL7i
         iEynNkVIZ1ZDDEzIQBzc/NmkMyOjX2NdCePjSIGYzspppzoWvtPy6jqnHmrS+Wd3Bh1q
         H5TsFNV67MfC4Hcz4fmDGaOXhttvOgYqsbJTFGSQS9gGb3q4msq80ZASefBuMgvAFIrm
         3l2EzjbQJLxn6d3Qv3jB8sZzCLAdikgxqasQ17xuTP5Yii4Ko7e7XNI8FO7SZM+ZvUQo
         zQkw==
X-Gm-Message-State: APjAAAVHKyCuVjuOdB1VE9uP5/dbGD/ZyWHNJulQotyp0FT/aXfBkLRV
        E65eKF8lt3XObpDmiHzkphk=
X-Google-Smtp-Source: APXvYqwerg0bZ28VHlBPYA0b64av/3AI4A021TqAos7dWFAVCq4bPIMtVLQYNyZkUA4/0mfE5NWo6Q==
X-Received: by 2002:a19:f707:: with SMTP id z7mr3489586lfe.142.1569839462725;
        Mon, 30 Sep 2019 03:31:02 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id f6sm3116597lfl.78.2019.09.30.03.31.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 03:31:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iEsxP-0004AF-Ey; Mon, 30 Sep 2019 12:31:07 +0200
Date:   Mon, 30 Sep 2019 12:31:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Jim Lin <jilin@nvidia.com>, linux-usb@vger.kernel.org
Subject: NULL-deref in xhci_clear_tt_buffer_complete()
Message-ID: <20190930103107.GC13531@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

I hit this NULL-deref in xhci_clear_tt_buffer_complete() with usb-next
after an external HS hub with a connected FS device got into some weird
state this morning:

[   66.833702] usb 2-2.4: USB disconnect, device number 5
[   66.834756] usblcd 2-2.4:1.0: USB LCD #144 now disconnected

[   67.774259] usb 2-2.4: new full-speed USB device number 6 using xhci_hcd
[   67.855160] usb 2-2.4: unable to read config index 0 descriptor/start: -32
[   67.855306] usb 2-2.4: chopping to 0 config(s)
[   67.855401] usb 2-2.4: can't read configurations, error -32
[   67.856455] BUG: kernel NULL pointer dereference, address: 00000000000006d8
[   67.856554] #PF: supervisor read access in kernel mode
[   67.856635] #PF: error_code(0x0000) - not-present page
[   67.856712] PGD 0 P4D 0 
[   67.856760] Oops: 0000 [#1] SMP
[   67.856815] CPU: 2 PID: 97 Comm: kworker/2:2 Not tainted 5.3.0-rc7 #4
[   67.856904] Hardware name:  /D34010WYK, BIOS WYLPT10H.86A.0051.2019.0322.1320 03/22/2019
[   67.857017] Workqueue: events hub_tt_work
[   67.857089] RIP: 0010:xhci_clear_tt_buffer_complete+0x2b/0xb0
[   67.857173] Code: 57 41 56 41 55 49 89 f5 41 54 55 53 48 89 fb e8 db 94 fd ff 85 c0 75 07 48 8b 9b 58 03 00 00 49 8b 45 28 4c 8d a3 90 03 00 00 <8b> a8 d8 06 00 00 41 f6 45 03 03 75 60 45 0f b6 75 02 41 83 e6 0f
[   67.857404] RSP: 0018:ffffa6020029fde8 EFLAGS: 00010202
[   67.857482] RAX: 0000000000000000 RBX: ffff94cd55358000 RCX: 00000000000001f3
[   67.857577] RDX: 00000000000001f2 RSI: ffff94cd50db2850 RDI: ffff94cd55358000
[   67.857672] RBP: ffff94cd55372000 R08: 0000000000000000 R09: 0000000000000000
[   67.857767] R10: 0000000000000000 R11: 0000000000000000 R12: ffff94cd55358390
[   67.857860] R13: ffff94cd50db2850 R14: dead000000000122 R15: dead000000000100
[   67.857956] FS:  0000000000000000(0000) GS:ffff94cd57900000(0000) knlGS:0000000000000000
[   67.858060] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   67.858141] CR2: 00000000000006d8 CR3: 0000000213baa001 CR4: 00000000001606e0
[   67.858236] Call Trace:
[   67.858287]  hub_tt_work+0x154/0x190
[   67.858353]  process_one_work+0x2a0/0x600
[   67.858425]  worker_thread+0x34/0x3d0
[   67.858490]  ? process_one_work+0x600/0x600
[   67.858558]  kthread+0x118/0x130
[   67.858614]  ? kthread_create_on_node+0x60/0x60
[   67.858688]  ret_from_fork+0x3a/0x50
[   67.858753] Modules linked in: netconsole ftdi_sio x86_pkg_temp_thermal usbserial usblcd
[   67.858865] CR2: 00000000000006d8
[   67.858922] ---[ end trace 7fb6e59f68b07112 ]---

Address 00000000000006d8 is udev->slot_id (line 5203) so apparently

	udev = (struct usb_device *)ep->hcpriv;

can be NULL here.

While the hub/device was in this state, the bug appeared to be perfectly
reproducable and prevented the machine from booting. Disconnecting and
reconnecting the hub made the problem go away.

Also adding Jim Lin who introduced this code in commit ef513be0a905
("usb: xhci: Add Clear_TT_Buffer") in v5.2.

Johan
