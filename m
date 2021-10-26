Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EBA43BCA7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 23:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239669AbhJZVv7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 17:51:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239689AbhJZVvc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 17:51:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AF6DE60F9B
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 21:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635284946;
        bh=3fDvsZVle8Iym1sFCUpUu5P7YuBubHc87FOkMl7rFSA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kiHWLXO0Q/obYEgUeEeijqHiiCCudsjHbeL1bDR4UoSjVV6PxOVWka4JbAl9CxPqJ
         nVWd/bIM4sDbtetWHMEnEZ9ee51MsPhDfsEDrz3cY2W2XjYEaVRpG1H3DUuhPR+cDY
         7HeF+o+Ki3RPgmlyGL8DmPMsQU6jN/yueUgxhKJ3uofigGIQx1jB5hf9IieXQShEGm
         rSzHMOqsyc5KH5NDhcg52kfgDn1OxRf8hKD+lQd8V7hlpxXqL1d8LgwOdsliTDuxZA
         qRPA9dLojKdh7ArxcImSOmJhjYYHJzD4xHxxANdeMoQ2CRaCnu3zOlbBU4UJ0WgIAR
         nxL0OBFAxRXmQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9F5F460FE3; Tue, 26 Oct 2021 21:49:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Tue, 26 Oct 2021 21:49:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-FKmMCc1yRI@https.bugzilla.kernel.org/>
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

--- Comment #12 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
Sorry for the late reply, Outlook sometimes put emails in "Other" for some
reason.
I just reverted that machine back to the 5.3.6 kernel.
Now IRQ 16  has:
16: IO-APIC   16-fasteoi   ehci_hcd:usb1, uhci_hcd:usb3, hpilo, rt_pcclk
"uhci_hcd:usb3" does not appear with the 5.11+ kernels (with or without
rt_pcclk), maybe the issue is with uhci_hcd.
Timer card works fine in this config.
Thanks
Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Monday, October 25, 2021 8:20 AM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7Cfabcab1a2f274f35635c08d997ba2068%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637707647925383291%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DwW=
0oHnSHrC19%2F3uz37f5R%2FuyUpfpNIl38tY%2BJ0rnBbA%3D&amp;reserved=3D0

--- Comment #11 from Johan Hovold (johan@kernel.org) --- [ Adding back bugz=
illa
and linux-usb on CC. ]

On Fri, Oct 22, 2021 at 07:43:04PM +0000, Arnold, Scott C. (JSC-CD13)[SGT, =
INC]
wrote:
> I added the WARN_ON_ONCE(!irqs_disabled()); at the beginning of=20
> ehci-irq before the lock and did not notice anything.

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

So this happens also for another EHCI bus IRQ. Is this IRQ also shared with
something?

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
> There is one usb device " Bus 001 Device 003: ID 14dd:1007 Raritan=20
> Computer, Inc.  D2CIM-VUSB KVM connector" and it has disappeared=20
> (i.e.not working)

Thanks for confirming.

> This does not occur without the irqsave/restore in the ehci-hcd.

Now why would simply saving the interrupt state in ehci_irq() prevent these
spurious IRQs? There's something fishy going on alright.

> My timercard driver is not loaded. This is with a 5.14.13 kernel.

Are you able to reproduce this on a machine without the timer card present =
at
all?

> Lsusb -s1:
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 003=20
> Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub Bus 001 Device=20
> 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> Lsb -s2 and -s3 are blank.

Looks like you forgot the colon in "lsusb -s1:" so this lists the devices w=
ith
number 1 instead of the devices connected to bus 1.

> On another identical machine (almost has 92 cores instead of 72)=20
> running
> 5.3.6 kernel:
> Lsusb -s1:
>=20
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 003=20
> Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub Bus 001 Device=20
> 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> Lsusb -s2:
> Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching=20
> Hub Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate=20
> Matching Hub
>=20
> Lsusb -s3:
>=20
> Bus 002 Device 003: ID 0424:2660 Microchip Technology, Inc. (formerly=20
> SMSC) Hub Bus 001 Device 003: ID 14dd:1007 Raritan Computer, Inc.=20
> D2CIM-VUSB KVM connector

Ok, but there is a device connected to bus 1 as you also mentioned above.

On Fri, Oct 22, 2021 at 09:38:28PM +0000, Arnold, Scott C. (JSC-CD13)[SGT, =
INC]
wrote:
> Just as another datapoint I put the ehci-hcd.c file from the 5.3.6=20
> kernel into the 5.14.13 kernel.
> No more "nobody cared" messages but neither timer card or USB is=20
> working now.

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

It would be good if we could rule out the timer card being involved in this
(e.g. since the driver is out of tree).

Johan

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
