Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E3B5E930
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfGCQd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:33:59 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50426 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGCQd7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 12:33:59 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992643AbfGCQd4oOvUC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 18:33:56 +0200
Date:   Wed, 3 Jul 2019 18:33:55 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] usb: gadget: u_serial: Fix and cleanup
Message-ID: <20190703163355.GA28579@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Following patchset makes console work (patch 1) for at AT91SAM9G20 board
connected to xhci_hcd and does some cleanup.
Tested with "console=ttyS0,115200n8 console=ttyGS0,115200n8" on kernel
command line and following inittab:
console::respawn:/sbin/getty -L 115200 ttyS0 vt100
console::respawn:/sbin/getty -L 115200 ttyGS0 vt100

There are issues remaining:

- first usb disconnect works while each next triggers WARN_ON in gs_close:
------------[ cut here ]------------
WARNING: CPU: 0 PID: 501 at drivers/usb/gadget/function/u_serial.c:706 gs_close+0x3c/0x1e4
Modules linked in:
CPU: 0 PID: 501 Comm: getty Not tainted 5.2.0-rc7 #44
Hardware name: Atmel AT91SAM9
[<c0107514>] (unwind_backtrace) from [<c01051c0>] (show_stack+0x10/0x18)
[<c01051c0>] (show_stack) from [<c05465a8>] (dump_stack+0x18/0x24)
[<c05465a8>] (dump_stack) from [<c010fa80>] (__warn+0xcc/0xe4)
[<c010fa80>] (__warn) from [<c010fad0>] (warn_slowpath_null+0x38/0x48)
[<c010fad0>] (warn_slowpath_null) from [<c03b6648>] (gs_close+0x3c/0x1e4)
[<c03b6648>] (gs_close) from [<c03036b0>] (tty_release+0x1d4/0x460)
[<c03036b0>] (tty_release) from [<c01ce464>] (__fput+0xe4/0x1b0)
[<c01ce464>] (__fput) from [<c0124e1c>] (task_work_run+0x8c/0xa8)
[<c0124e1c>] (task_work_run) from [<c011155c>] (do_exit+0x354/0x814)
[<c011155c>] (do_exit) from [<c0111a9c>] (do_group_exit+0x54/0xb8)
[<c0111a9c>] (do_group_exit) from [<c011a190>] (get_signal+0x18c/0x658)
[<c011a190>] (get_signal) from [<c0104bbc>] (do_work_pending+0xe0/0x44c)
[<c0104bbc>] (do_work_pending) from [<c0101068>] (slow_work_pending+0xc/0x20)
Exception stack(0xc3797fb0 to 0xc3797ff8)
7fa0:                                     00000000 beb87d0c 00000001 00000000
7fc0: 0009a150 00000000 00099c04 00000003 0009a198 0007e049 00099bd4 0009a1e4
7fe0: b6e3f000 beb87cd8 00018210 b6dbcc40 60000010 00000000
---[ end trace 70af570fde0de49b ]---

- init (both busybox' and systemd) waits for usb host to be plugged in,
otherwise boot is stuck and continues after host is connected.

Will investigate those two later, however comments and suggestions
to the following patches are appreciated.

Ladislav Michl (3):
  usb: gadget: u_serial: Fix console_req complete event race
  usb: gadget: u_serial: Remove console specific alloc/free req
    functions
  usb: gadget: u_serial: Use bool for req_busy

 drivers/usb/gadget/function/u_serial.c | 88 +++++++++-----------------
 1 file changed, 30 insertions(+), 58 deletions(-)

-- 
2.20.1

