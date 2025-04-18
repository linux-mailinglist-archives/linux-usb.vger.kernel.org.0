Return-Path: <linux-usb+bounces-23222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B760A937F2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 15:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F141B65353
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 13:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87E7274FF8;
	Fri, 18 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCx5KiLH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DFE555
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983078; cv=none; b=T0N1W1Z+0i0yOimqdcvYjFjzjuXrbV4/2I/FiZT3KX0fxH9FDewR+cfsiHy2bMHrWzuLyEfZ7yau9YOHiPRV1JP9//oABQvV+GgzYBam3zSQ72nrwP6y5qSbq9jz+hp0xoT3plIaf9QbfNlJLaP3ZhRdaSeWGmFxs7muMjPuhKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983078; c=relaxed/simple;
	bh=mMUDgns7YocRkYVG/0WAKxn9jwB0fO6UW8CMWIn55no=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AVzz+Dyw0K9979T750YL1GjnqgxDwiY4RQCaJH+C+6vliLdYOLxsXJQxWaEyHFuJoUwqvIOzmjKWWly3EWoYTiblSf2FTD0HVGhMN/xRS8PbCK0PI7GlcVIazlugq1y30/k765qZERcdD46ANk5gLRehn3zz4mxRJ/oxLOGG7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCx5KiLH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBEB6C4CEE2
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744983077;
	bh=mMUDgns7YocRkYVG/0WAKxn9jwB0fO6UW8CMWIn55no=;
	h=From:To:Subject:Date:From;
	b=HCx5KiLH0prSO5Hyl7Ohr2CogZrycZrFZAyH+zduZj4blrIUibtToXgmGkRzRGGO8
	 +IXaPKuLB/b+8hmQAK4W2dtRC3CaaIHv/u+jAn8dGPEQEOXLZ+MjyfA6VV2WtitNjL
	 p9PqNDxcQ6VsDPMjisxK6PioGbzvS6Mk5cbEyAqUnzcs1Ar+67RD8UiUktjJnuYcLs
	 Z4O/uZLWCMWFZTyCuKYGr3Os/gqAOgVFzSYOuCM8XYIlIDQqIfFe9TwT8H3ZCd+A0e
	 OYK0/171LJh67qlWa+CUcwwaJfBGQ9YsCuqazC2wmM2hVndJk6MoCKSOv7SWyRlJQq
	 tG71B4yBiPcBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E738C4160E; Fri, 18 Apr 2025 13:31:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220033] New: xhci: Compliance Issue - avg_trb_len not set for
 EP0 during Address Device Command
Date: Fri, 18 Apr 2025 13:31:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: jay.chen@siemens.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220033-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220033

            Bug ID: 220033
           Summary: xhci: Compliance Issue - avg_trb_len not set for EP0
                    during Address Device Command
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jay.chen@siemens.com
        Regression: No

[Summary]:

During device enumeration, while processing the Address Device Command, the
xHCI driver (xhci-hcd) leaves the Average TRB Length (avg_trb_len) field for
Control Endpoint 0 (EP0) set to 0 in the Input Context.

According to the xHCI 1.2 Specification (Section 6.2.3.1, p.454), the Avera=
ge
TRB Length must be greater than 0, and software shall set it to 8 for Contr=
ol
Endpoints.

Some xHCI hardware vendors may validate the Input Context at Address Device
time and reject contexts with invalid values, potentially causing device
enumeration issues.

While xhci_endpoint_init() later sets avg_trb_len correctly, setting it ear=
lier
in xhci_setup_addressable_virt_dev() would improve compliance and robustnes=
s.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Description]:

Observed in kernel 6.15-rc2 (self-built vanilla, no taint).

Using KGDB during Address Device Command handling, the Input Context was
dumped, showing EP0 avg_trb_len field remained 0.

Stack Trace during capture:
    queue_trb -> queue_command -> xhci_queue_address_device ->
xhci_setup_device -> xhci_address_device

Memory dump of Input Context (kgdb):

(logical Input Context memory)
>>> x/96bx 0x11BF40000
0x11bf40000:    Cannot access memory at address 0x11bf40000

(physical Input Context memory
>>> p/x page_offset_base
$1 =3D 0xffff888000000000
>>> x/96bx 0xFFFF88811BF40000

(Input Control Context)
0xffff88811bf40000:     0x00    0x00    0x00    0x00    0x03    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40008:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40010:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40018:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00

Slot
0xffff88811bf40020:     0x00    0x00    0x40    0x08    0x00    0x00    0x0=
1=20=20=20
0x00
0xffff88811bf40028:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40030:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40038:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00

EP Context0 (Control EP)
0xffff88811bf40040:     0x00    0x00    0x00    0x00    0x26    0x00    0x0=
0=20=20=20
0x02
0xffff88811bf40048:     0x01    0x10    0xf4    0x1b    0x01    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40050:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00
0xffff88811bf40058:     0x00    0x00    0x00    0x00    0x00    0x00    0x0=
0=20=20=20
0x00

EP State =3D 0

CErr =3D 3 ("Software should set CErr to =E2=80=983=E2=80=99 for normal ope=
rations. The values of
=E2=80=981=E2=80=99 or =E2=80=982=E2=80=99 should be avoided during normal =
operation because they will reduce
transfer reliability. The value of =E2=80=980=E2=80=99 is typically only us=
ed for test or
debug.")
EP Type =3D 4 (Control Bidirectional)
Max Packet Size =3D 512

DCS =3D 1
TR Dequeue Pointer =3D 0x11BF41000

**** Average TRB Length =3D 0 ****

SPEC xHCI_1_2_201905:
(p.453, "This field represents the average Length of the TRBs executed by t=
his
endpoint. The value of this field shall be greater than =E2=80=980=E2=80=99"
(p.454, "Note: Software shall set Average TRB Length to =E2=80=988=E2=80=99=
 for control
endpoints."
(p.454, 6.2.3.1 Address Device Command Usage: "The Input Endpoint 0 Context=
 is
considered =E2=80=9Cvalid=E2=80=9D ...... if: ... 6) all other fields are w=
ithin the valid
range of values"


---
Tested environment:
- Platform: QEMU Standard PC (Q35 + ICH9)
- Host Controller: QEMU XHCI Host Controller
- Device: QEMU USB Hard Drive (SuperSpeed 5Gbps)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

