Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29BE43975A
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 15:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhJYNWL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 09:22:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230109AbhJYNWJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 09:22:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BC93360F46
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635167987;
        bh=z1H2oy2ZXAFwQv0n4d//V228wZi87VdIL/fDa+6PRgs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pDG4KwrZhvJJU7E8sna9Sn1LWZyQVS3SsGkp8TkUaRYQ18sj+rlQLszuo9pIOsIMh
         jRJwsX6I+ItE1l0QsaqZZwwcIPyMSdfW9yDcusZ8Jk+br8XT1fZ7xitKmetHcFnVWB
         +X46ITgl9kSx2t3vc5CKKwhxemeuhz4b1eyp0TzdKo+jVbIabhGhTUgMn8SxdF95yJ
         nxQH+H8cZ07BCkGPpM09ksoKtBdaSbM6muhyMXdgC7wYUyW/c4COLZqj7gPnQJ1RhP
         3lGYRCVN96VWfyCVY5ziNSUiI0SUCrMw4GO1aYgOEDU2+QWQCiySCh3FjW0mB5pk6Z
         xJLyGMUa7JESQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B2CD4610CA; Mon, 25 Oct 2021 13:19:47 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Mon, 25 Oct 2021 13:19:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-mtZb3hRIOi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #11 from Johan Hovold (johan@kernel.org) ---
[ Adding back bugzilla and linux-usb on CC. ]

On Fri, Oct 22, 2021 at 07:43:04PM +0000, Arnold, Scott C. (JSC-CD13)[SGT, =
INC]
wrote:
> I added the WARN_ON_ONCE(!irqs_disabled()); at the beginning of ehci-irq
> before the lock and did not notice anything.

Ok, so interrupts are already disabled as they should be.

> However after looking at the logs I discovered:
>=20
> [    5.189043] irq 16: nobody cared (try booting with the "irqpoll" optio=
n)
> [    5.189112] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.14.13_OBCS_1 #4
> [    5.189180] Hardware name: HP ProLiant DL580 Gen9/ProLiant DL580 Gen9,
> BIOS U17
> 01/22/2018
> [    5.189261] Call Trace:
> [    5.189324]  <IRQ>
> [    5.189381]  ? dump_stack_lvl+0x33/0x42
> [    5.189445]  ? __report_bad_irq+0x32/0xac
> [    5.189505]  ? note_interrupt.cold.11+0xa/0x63
> [    5.189562]  ? handle_irq_event_percpu+0x65/0x70
> [    5.189623]  ? handle_irq_event+0x32/0x50
> [    5.189681]  ? handle_fasteoi_irq+0xa1/0x160
> [    5.189740]  ? __common_interrupt+0x3c/0xa0
> [    5.189798]  ? common_interrupt+0x7a/0xa0
> [    5.189859]  </IRQ>
> [    5.189913]  ? asm_common_interrupt+0x1b/0x40
> [    5.189973]  ? mwait_idle+0x50/0x70
> [    5.190031]  ? default_idle+0x10/0x10
> [    5.190088]  ? default_idle_call+0x1f/0x30
> [    5.190147]  ? do_idle+0x1df/0x1f0
> [    5.190207]  ? cpu_startup_entry+0x14/0x20
> [    5.190267]  ? start_kernel+0x616/0x63d
> [    5.190328]  ? secondary_startup_64_no_verify+0xb0/0xbb
> [    5.190388] handlers:
> [    5.190442] [<00000000da7aaaea>] usb_hcd_irq
> [    5.190504] Disabling IRQ #16
>=20
> [    5.201827] irq 23: nobody cared (try booting with the "irqpoll" optio=
n)
> [    5.201885] CPU: 1 PID: 8 Comm: kworker/u145:0 Not tainted 5.14.13_OBC=
S_1
> #4
> [    5.201942] Hardware name: HP ProLiant DL580 Gen9/ProLiant DL580 Gen9,
> BIOS U17
> 01/22/2018
> [    5.202010] Workqueue: events_unbound async_run_entry_fn
> [    5.202069] Call Trace:
> [    5.202119]  <IRQ>
> [    5.202168]  ? dump_stack_lvl+0x33/0x42
> [    5.202223]  ? __report_bad_irq+0x32/0xac
> [    5.202277]  ? note_interrupt.cold.11+0xa/0x63
> [    5.202332]  ? handle_irq_event_percpu+0x65/0x70
> [    5.202386]  ? handle_irq_event+0x32/0x50
> [    5.202441]  ? handle_fasteoi_irq+0xa1/0x160
> [    5.202495]  ? __common_interrupt+0x3c/0xa0
> [    5.202548]  ? common_interrupt+0x7a/0xa0
> [    5.202603]  </IRQ>
> [    5.202652]  ? asm_common_interrupt+0x1b/0x40
> [    5.202707]  ? inflate_fast+0x118/0x5e0
> [    5.202764]  ? zlib_inflate+0x3d1/0x1770
> [    5.202817]  ? do_copy+0xed/0x109
> [    5.202869]  ? write_buffer+0x22/0x32
> [    5.202921]  ? initrd_load+0x268/0x268
> [    5.202975]  ? write_buffer+0x32/0x32
> [    5.203026]  ? __gunzip+0x244/0x310
> [    5.203083]  ? decompress_method+0x3c/0x3c
> [    5.203137]  ? initrd_load+0x268/0x268
> [    5.203190]  ? gunzip+0xe/0x11
> [    5.203243]  ? initrd_load+0x268/0x268
> [    5.203296]  ? unpack_to_rootfs+0x14f/0x285
> [    5.203349]  ? initrd_load+0x268/0x268
> [    5.203402]  ? do_populate_rootfs+0x6c/0x160
> [    5.203455]  ? async_run_entry_fn+0x1b/0xa0
> [    5.203508]  ? process_one_work+0x1d1/0x330
> [    5.203563]  ? worker_thread+0x28/0x3d0
> [    5.203615]  ? mod_delayed_work_on+0x90/0x90
> [    5.203668]  ? kthread+0x120/0x150
> [    5.203720]  ? set_kthread_struct+0x30/0x30
> [    5.203773]  ? ret_from_fork+0x22/0x30
> [    5.203826] handlers:
> [    5.203875] [<00000000da7aaaea>] usb_hcd_irq
> [    5.203930] Disabling IRQ #23

So this happens also for another EHCI bus IRQ. Is this IRQ also shared
with something?

> [   62.407444] irq 16: nobody cared (try booting with the "irqpoll" optio=
n)
> [   62.407474] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.14.13_OBCS_1 #4
> [   62.407499] Hardware name: HP ProLiant DL580 Gen9/ProLiant DL580 Gen9,
> BIOS U17
> 01/22/2018
> [   62.407527] Call Trace:
> [   62.407538]  <IRQ>
> [   62.407547]  ? dump_stack_lvl+0x33/0x42
> [   62.407569]  ? __report_bad_irq+0x32/0xac
> [   62.407588]  ? note_interrupt.cold.11+0xa/0x63
> [   62.407606]  ? handle_irq_event_percpu+0x65/0x70
> [   62.407626]  ? handle_irq_event+0x32/0x50
> [   62.407642]  ? handle_fasteoi_irq+0xa1/0x160
> [   62.408250]  ? __common_interrupt+0x3c/0xa0
> [   62.408820]  ? common_interrupt+0x7a/0xa0
> [   62.409386]  </IRQ>
> [   62.409934]  ? asm_common_interrupt+0x1b/0x40
> [   62.410483]  ? mwait_idle+0x50/0x70
> [   62.411026]  ? default_idle+0x10/0x10
> [   62.411565]  ? default_idle_call+0x1f/0x30
> [   62.412102]  ? do_idle+0x1df/0x1f0
> [   62.412634]  ? cpu_startup_entry+0x14/0x20
> [   62.413164]  ? start_kernel+0x616/0x63d
> [   62.413694]  ? secondary_startup_64_no_verify+0xb0/0xbb
> [   62.414218] handlers:
> [   62.414734] [<00000000da7aaaea>] usb_hcd_irq
> [   62.415257] [<000000008857253d>] ilo_isr [hpilo]
> [   62.415775] Disabling IRQ #16
>=20
> There is one usb device " Bus 001 Device 003: ID 14dd:1007 Raritan
> Computer, Inc.  D2CIM-VUSB KVM connector" and it has disappeared
> (i.e.not working)

Thanks for confirming.

> This does not occur without the irqsave/restore in the ehci-hcd.

Now why would simply saving the interrupt state in ehci_irq() prevent
these spurious IRQs? There's something fishy going on alright.

> My timercard driver is not loaded. This is with a 5.14.13 kernel.

Are you able to reproduce this on a machine without the timer card
present at all?

> Lsusb -s1:
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> Lsb -s2 and -s3 are blank.

Looks like you forgot the colon in "lsusb -s1:" so this lists the
devices with number 1 instead of the devices connected to bus 1.

> On another identical machine (almost has 92 cores instead of 72) running
> 5.3.6 kernel:
> Lsusb -s1:
>=20
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> Lsusb -s2:
> Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
> Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
>=20
> Lsusb -s3:
>=20
> Bus 002 Device 003: ID 0424:2660 Microchip Technology, Inc. (formerly SMS=
C)
> Hub
> Bus 001 Device 003: ID 14dd:1007 Raritan Computer, Inc. D2CIM-VUSB KVM
> connector

Ok, but there is a device connected to bus 1 as you also mentioned
above.

On Fri, Oct 22, 2021 at 09:38:28PM +0000, Arnold, Scott C. (JSC-CD13)[SGT, =
INC]
wrote:
> Just as another datapoint I put the ehci-hcd.c file from the 5.3.6
> kernel into the 5.14.13 kernel.
> No more "nobody cared" messages but neither timer card or USB is working
> now.

Yeah, that probably not going to work.

> [    6.798509] usb 2-1: new high-speed USB device number 4 using ehci-pci
> [    6.798586] usb 1-1: new high-speed USB device number 4 using ehci-pci
> [    7.238498] usb 1-1: device not accepting address 4, error -32
> [    7.238562] usb 2-1: device not accepting address 4, error -32
> [    7.388499] usb 1-1: new high-speed USB device number 5 using ehci-pci
> [    7.388561] usb 2-1: new high-speed USB device number 5 using ehci-pci
> [    7.828496] usb 1-1: device not accepting address 5, error -32
> [    7.828557] usb 2-1: device not accepting address 5, error -32
> [    7.828618] usb usb1-port1: unable to enumerate USB device
> [    7.828678] usb usb2-port1: unable to enumerate USB device
>=20
> /proc/interrupts for IRQ 16 is stuck at 50.
>=20
> Some combination of these two may solve problem.

It would be good if we could rule out the timer card being involved in
this (e.g. since the driver is out of tree).

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
