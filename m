Return-Path: <linux-usb+bounces-30066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 948AFC33055
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 22:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 618224E3364
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 21:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C920A2EF65A;
	Tue,  4 Nov 2025 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/XtWYYQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCED1A9F90
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291501; cv=none; b=JO4tpMt4g/xBbFDStnnqPRBzvviFriSojFjUAlEo4daaLkQu9QqNCqiUXCBpKXS8tQ6QNbtg/AI9rkG9Gz+efyn+YCcl81bD+93WZnQAO6yRK2y7pRpdH2dx4dOI9Im3deaIJ0LlGHJvRkMFhMQUK7HfVGPVbAxqHhRNPE/y3x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291501; c=relaxed/simple;
	bh=o1imnkXH7Vi+D29MCe4Ny5mWEWjE1rHMDMtGgmWQ6Ek=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LwOgRumzzd+/fGjsFJH/k+jDFabB6pXlFxGuIBX1SmOSiiTov7k5MfVeCi/zqdeySDnRVyFFLiyIqQPQex8PqIMVPbEnwft38fid7iNJAyDqqGOnNYeGJIfjEpvU2VMzDlaq83FnLYG8XgUzXpyQfW/tYcZRattS8Ltg6icflGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/XtWYYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18EC8C116B1
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762291501;
	bh=o1imnkXH7Vi+D29MCe4Ny5mWEWjE1rHMDMtGgmWQ6Ek=;
	h=From:To:Subject:Date:From;
	b=O/XtWYYQl3YHYq6ejR+hm/aYYrgDi0n4+QNl6x1Jlxt+Mx51igtSNi/bzZTT6NZOh
	 f7WxR/FqbkwY3csp+DuPEQPSaNSwQVl7by8GLCRHRrAyfDv8hzMfgrzp7z+gu3p/yK
	 UEtFi0sZd6CPuxK0p+ZZoeryWu4KiaSozPCX5HyFmCtpOjPKLTIw1j/9i+5MvacDzd
	 eK42aCeZg7ieOfgdHGgkWooVovq7LwFIxB0BsyPF4v6sTIa7O62B99dQ8WwNvNJz06
	 y3bH+yrS5GulHn4loj8KyjCKg+BTEeodbg6DtN5UGMmjeYLoNcNj32cgBsgvZB/+A1
	 dPQOmqRpwsO/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13C28C4160E; Tue,  4 Nov 2025 21:25:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] New: usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Date: Tue, 04 Nov 2025 21:25:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220748-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

            Bug ID: 220748
           Summary: usb: xhci_queue_isoc_tx_prepare ignore start_frame and
                    always assumes URB_ISO_ASAP is set
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nick83ola@gmail.com
        Regression: No

This commit implemented Isochronous transfer for the xHCI controllers and in
the first implementation always assumes URB_ISO_ASAP is set and ignores the
start_frame field.

"Always assume URB_ISO_ASAP is set, and never use urb->start_frame as input=
."

https://github.com/torvalds/linux/commit/04e51901dd44f40a5a385ced897f6bca87=
d5f40a

```
USB: xHCI: Isochronous transfer implementation
This patch implements isochronous urb enqueue and interrupt handler part.

When an isochronous urb is passed to xHCI driver, first check the transfer
ring to guarantee there is enough room for the whole urb. Then update the
start_frame and interval field of the urb. Always assume URB_ISO_ASAP
is set, and never use urb->start_frame as input.

```

On this line the scheduler always schedule as soon as possible

https://github.com/torvalds/linux/blob/17d85f33a83b84e7d36bc3356614ae06c90e=
7a08/drivers/usb/host/xhci-ring.c#L4332-L4333

        start_frame =3D readl(&xhci->run_regs->microframe_index);
        start_frame &=3D 0x3fff;

instead for example in drivers/usb/host/xhci-ring.c, function
xhci_queue_isoc_tx_prepare() the URB_ISO_ASAP flag is correctly used

https://github.com/torvalds/linux/blob/17d85f33a83b84e7d36bc3356614ae06c90e=
7a08/drivers/usb/host/ehci-sched.c#L1638-L1654


                /* URB_ISO_ASAP: make sure that start >=3D next */
                if (unlikely(start < next &&
                                (urb->transfer_flags & URB_ISO_ASAP)))
                        goto do_ASAP;


                /* Otherwise use start, if it's not in the past */
                if (likely(start >=3D now2))
                        goto use_start;

...

 use_start:
        /* Tried to schedule too far into the future? */
        if (unlikely(start + span - period >=3D mod + wrap)) {
                ehci_dbg(ehci, "request %p would overflow (%u+%u >=3D %u)\n=
",
                                urb, start, span - period, mod + wrap);
                status =3D -EFBIG;
                goto fail;
        }


        start +=3D base;
        stream->next_uframe =3D (start + skip) & (mod - 1);


        /* report high speed start in uframes; full speed, in frames */
        urb->start_frame =3D start & (mod - 1);
        if (!stream->highspeed)
                urb->start_frame >>=3D 3;
        return status;


This causes issues with devices that require a specific frame interval (like
professional audio interfaces, for example the Motu AVB line)

See also this thread on linuxmusicians.com

https://linuxmusicians.com/viewtopic.php?p=3D179979#p179979

Thanks,
Nicola Lunghi

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

