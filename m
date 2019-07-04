Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E74C5FE5A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 00:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfGDWKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 18:10:43 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:58126 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfGDWKm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 18:10:42 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23994220AbfGDWKkLwbw0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 00:10:40 +0200
Date:   Fri, 5 Jul 2019 00:10:36 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/3] usb: gadget: u_serial: Fix and cleanup
Message-ID: <20190704221036.GA4652@lenoch>
References: <20190703163355.GA28579@lenoch>
 <20190704163256.GA7834@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704163256.GA7834@lenoch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 04, 2019 at 06:32:56PM +0200, Ladislav Michl wrote:
> On Wed, Jul 03, 2019 at 06:33:55PM +0200, Ladislav Michl wrote:
> > Following patchset makes console work (patch 1) for at AT91SAM9G20 board
> > connected to xhci_hcd and does some cleanup.
> > Tested with "console=ttyS0,115200n8 console=ttyGS0,115200n8" on kernel
> > command line and following inittab:
> > console::respawn:/sbin/getty -L 115200 ttyS0 vt100
> > console::respawn:/sbin/getty -L 115200 ttyGS0 vt100
> > 
> > There are issues remaining:
> > 
> > - first usb disconnect works while each next triggers WARN_ON in gs_close:
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 501 at drivers/usb/gadget/function/u_serial.c:706 gs_close+0x3c/0x1e4
> > Modules linked in:
> > CPU: 0 PID: 501 Comm: getty Not tainted 5.2.0-rc7 #44
> > Hardware name: Atmel AT91SAM9
> > [<c0107514>] (unwind_backtrace) from [<c01051c0>] (show_stack+0x10/0x18)
> > [<c01051c0>] (show_stack) from [<c05465a8>] (dump_stack+0x18/0x24)
> > [<c05465a8>] (dump_stack) from [<c010fa80>] (__warn+0xcc/0xe4)
> > [<c010fa80>] (__warn) from [<c010fad0>] (warn_slowpath_null+0x38/0x48)
> > [<c010fad0>] (warn_slowpath_null) from [<c03b6648>] (gs_close+0x3c/0x1e4)
> > [<c03b6648>] (gs_close) from [<c03036b0>] (tty_release+0x1d4/0x460)
> > [<c03036b0>] (tty_release) from [<c01ce464>] (__fput+0xe4/0x1b0)
> > [<c01ce464>] (__fput) from [<c0124e1c>] (task_work_run+0x8c/0xa8)
> > [<c0124e1c>] (task_work_run) from [<c011155c>] (do_exit+0x354/0x814)
> > [<c011155c>] (do_exit) from [<c0111a9c>] (do_group_exit+0x54/0xb8)
> > [<c0111a9c>] (do_group_exit) from [<c011a190>] (get_signal+0x18c/0x658)
> > [<c011a190>] (get_signal) from [<c0104bbc>] (do_work_pending+0xe0/0x44c)
> > [<c0104bbc>] (do_work_pending) from [<c0101068>] (slow_work_pending+0xc/0x20)
> > Exception stack(0xc3797fb0 to 0xc3797ff8)
> > 7fa0:                                     00000000 beb87d0c 00000001 00000000
> > 7fc0: 0009a150 00000000 00099c04 00000003 0009a198 0007e049 00099bd4 0009a1e4
> > 7fe0: b6e3f000 beb87cd8 00018210 b6dbcc40 60000010 00000000
> > ---[ end trace 70af570fde0de49b ]---
> 
> This one is explained in drivers/tty/serial/ip22zilog.c line 751 (see also
> __tty_hangup) And it also explains why patch 2 in this serie is actually wrong.
> Will send v2.

As an naive approach I tried following:

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 130613751723..4551005a9d23 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -701,6 +704,9 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 
 	spin_lock_irq(&port->port_lock);
 
+	if (test_bit(TTY_HUPPING, &tty->flags))
+		goto exit;
+
 	if (port->port.count != 1) {
 		if (port->port.count == 0)
 			WARN_ON(1);

However this way port->port.count never drops back to zero. Any ideas?
