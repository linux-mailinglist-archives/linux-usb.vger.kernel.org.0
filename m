Return-Path: <linux-usb+bounces-36295-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA+FJJgx4mkZ3QAAu9opvQ
	(envelope-from <linux-usb+bounces-36295-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 15:11:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C466241B760
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 15:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128C43050A04
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 13:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513D6396D0A;
	Fri, 17 Apr 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1x4c8nO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E238E5C5
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431332; cv=none; b=C1BaJzHZsYM+qthw4Ub2JOmN+99FbNRvaq3MH7VQXwkZM3Yf37BySZID4iHlosgpvyTZWMU39qr6b7SUEmnUf1Axe9LbMOB9AUFAb6ess7yMtaP5/U1tzGlKURkfesKb7V2nUoitUkiWM6GM5+Y6nERZoaZYNjyLK0gRrF8XYyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431332; c=relaxed/simple;
	bh=kcEKA/q1YysToLjqFOPaavPA7E8ALgSowIncvoBN1gY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IB288xJl1hHRUZ00HrJKD0o3VjGBlwJ31uj1dR5rCzmvKdUGSK7PUEK8hP6GupDI3aXpnGDvjEZijn/74heIK5Ds7Ho5ruFTeDlzcJfjBmRCtgjEfeF3mXby9NATmlSHb1fJl4/UfqHa7RVAzoyDuZAldZRguN9xR7dj/r0dSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1x4c8nO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71D04C19425
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431332;
	bh=kcEKA/q1YysToLjqFOPaavPA7E8ALgSowIncvoBN1gY=;
	h=From:To:Subject:Date:From;
	b=j1x4c8nODg9mtFjFYNWIm8XNsRGcRmpcUru2MdbF2FBlM6+2XjCTv3B0eecaBsF2L
	 JDDfia1TIJ5mbg9cSqCgJPdKujhSpLpLLN9/2rlDZKRfnRxzV6WRQrIU2Y1VfmVmBB
	 dlox2iJRdvBEs3bDtMlRCdJz0tHiuWa3Q0Ic4JxasoqauqwmW9XtZqXen8RhayMtN6
	 ezlHPXMZN/wcdqs8g5wH87+u4c8SeY8b8C0jk0C9UmqTIefO0q+XWCbOwxLBH8+kQr
	 MWNeCH4go6ivwLZD9abPlofqbvDKn2JwR01MLCfHPwTfS6h5s1Rp8bgKeVSgso1bbN
	 95J3xP6BlH0VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65330C433E1; Fri, 17 Apr 2026 13:08:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221379] New: xhci_hcd: USB ports intermittently disabled with
 "EMI?" on Intel Alder Lake-S PCH (Z690) with Genesys Logic hubs
Date: Fri, 17 Apr 2026 13:08:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ingo@da-is.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221379-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36295-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[da-is.de:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: C466241B760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221379

            Bug ID: 221379
           Summary: xhci_hcd: USB ports intermittently disabled with
                    "EMI?" on Intel Alder Lake-S PCH (Z690) with Genesys
                    Logic hubs
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ingo@da-is.de
        Regression: No

USB devices connected to the Intel Alder Lake-S PCH xHCI controller
intermittently disconnect with the kernel message usb X-Y-portZ: disabled by
hub (EMI?), re-enabling... followed by device reconnect. The issue occurs a=
fter
periods of inactivity (approximately 5 minutes) and affects multiple USB
devices regardless of which physical port is used.
The problem is specific to Linux =E2=80=93 the same hardware configuration =
works
without any issues under Windows 11, ruling out a hardware defect.
Kernel version: 6.19.12-200.fc43.x86_64
Distribution: Fedora 43
Hardware:

Mainboard: Gigabyte Technology Co., Ltd. Z690 UD DDR4
CPU: Intel Core i9-14900KF
USB Controller: Intel Corporation Alder Lake-S PCH USB 3.2 Gen 2x2 xHCI
Controller (rev 11), PCI ID 0000:00:14.0
xHCI quirks: 0x0000000200009810

Affected devices (connected via Genesys Logic hubs):

Thrustmaster TWCS Throttle (044f:b687)
Logitech PRO X RAPID keyboard (046d:c35b)
Elgato Stream Deck MK.2 (0fd9:0080)

Not affected: Devices connected to Renesas uPD720201 USB 3.0 Host Controller
(08:00.0) work without any issues.
Steps to reproduce:

Connect USB devices via Genesys Logic hubs (05e3:0608 or 05e3:0610) to the
Intel Alder Lake-S PCH xHCI controller
Leave system idle for approximately 5 minutes
Return to system =E2=80=93 USB devices disconnect and reconnect

Expected behavior: USB devices remain stable during and after idle periods.
Actual behavior:
usb X-Y-portZ: disabled by hub (EMI?), re-enabling...
usb X-Y.Z: USB disconnect, device number N
usb X-Y.Z: new full-speed USB device number M using xhci_hcd
Workaround: Moving affected devices to a Renesas uPD720201 PCIe USB control=
ler
resolves the issue completely.
Additional notes:

Problem occurs with both onboard Genesys Logic hubs and external Genesys Lo=
gic
hubs
Problem also occurred with a separate PCIe USB card (different controller) =
when
Genesys Logic hubs were involved
All software-based fixes attempted (USB autosuspend disabled, PCI power
management disabled, C-states checked) had no effect
Windows 11 on the same hardware shows no USB instability

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

