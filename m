Return-Path: <linux-usb+bounces-26085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96538B0DC7A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 16:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9887A168049
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 13:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D53D28C2C4;
	Tue, 22 Jul 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJv1oJXx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055BA28B507
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192758; cv=none; b=Jd3YZFnHBRR8D+aMpre4muLzdWS4BGOd+Bh/Y4R8RsbLbPFC22HtnPUsOXd2gOxg+uiTTlK2h/+J+4u7D7/O0XAwgSNPPs4cKsvcZQHzb4HvN57J3Pwuo3lLoztAtdNb+vxHPjoNObS8j6kP9IeaO0EBiPmHvFOvKDL9HJ/66H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192758; c=relaxed/simple;
	bh=FLPRRZQgpa4sT5HHB9k3LSHDloLAc749/+W2t1Xabfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m82o1r4C+9Daq3B6sXUkZ6stq7nZH69MzFS+qbZA6aEjSGy/Muho0KYa6iEJKq1qGJsc5+zWSxCivtqW6tvIo9dWfVYXZTaNhLTHnw5FSEVm67XXdBCWmLf0yjIIWvHqRDnbnLPdEb6pLLfWua8qblAzv6BWpogt0wk6HY2lZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJv1oJXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81237C4CEF5
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753192755;
	bh=FLPRRZQgpa4sT5HHB9k3LSHDloLAc749/+W2t1Xabfw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gJv1oJXxwSvuwPOtT/Rm/gZogvn8XmLUyJMJO+PxwaZg8fRiz6/8TEzczycJGAnj+
	 I0gwwuMaH7AfSL+76ylGr6IsrlhCxidv9ElsceWrGD2RabZKq3P1kHHvKOt/2QVYzf
	 oyUQBR8dOWm44K6mr55CAduk9iJbc02zL9rmYBk6I4HdOaDHNT5htpUANphp8s7FdP
	 Od+ecKmLcKl7f7LfYWz4RrF5rYUkxOEo5IR7BYuP/+G8yVq7sysHHKg5Ga8CkBprt8
	 UMD93SlXNvUp8o7QAvv0ZJlQvWtMVVnvIwUAlhiG938Fi6vF8I1t8utKT7ctpvR4dc
	 0uC7RBA3z+vfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72E90C3279F; Tue, 22 Jul 2025 13:59:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220307] USB cannot submit urb disconnecting sound card
Date: Tue, 22 Jul 2025 13:59:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220307-208809-ccL0AMEePk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220307-208809@https.bugzilla.kernel.org/>
References: <bug-220307-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220307

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #2 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Any chance you could take xhci traces of this, with additional xhci dynamic
debug added.
It should show in detail every TRB queued to the ring, and each event for i=
t.

Steps:
mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

The trace grows fast, so please try to copy it as soon as possible
after issue is reproduced.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

