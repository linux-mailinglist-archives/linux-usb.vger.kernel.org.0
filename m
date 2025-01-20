Return-Path: <linux-usb+bounces-19539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FBA16F63
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 16:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC877A22BC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 15:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9791E8855;
	Mon, 20 Jan 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHo+yaBb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A861B4F02
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387621; cv=none; b=NAPfJOzxvyCmgweeqmgOy7MSN6RDXJljsPtlUTFOdLD5HrPz7kOiWal36hrP9gCck/DOkgRaQpUDM+5VbdKvxfNYUmyzNcVmSrl0ZlFspd2ldcjoY6mxiVJQcAw06c61pmrPj6PmxfKEys67sjhtpRDxhldzt5cL6gU3NJNZDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387621; c=relaxed/simple;
	bh=uzJv5AyVGynnMMjkwqeodfrQz41N08o5AcP8riUnMZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5Iu+EQm2EziQlbYV+3GQsisPC5S7mWgSfZxceEnVj+HSSq/nEmtDRtBaDX3am0XAKAwfMKqDhaUxiI3e5az9nid2RyL/NavjxvrUDuA0b7c4tI8ApiJE8Lspayl+A01mEm1GNSBeEzI8v1Ajo++n2IWPTnKAKMLUEXikZ+hlwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHo+yaBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78C21C4CEE3
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737387620;
	bh=uzJv5AyVGynnMMjkwqeodfrQz41N08o5AcP8riUnMZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RHo+yaBbbQ6FWsyZl6R6iXr45kQWe4VblPQialrgsbTyCqg22iNQn7iEsxK2NtjMo
	 c/9/FnbosucLKR4QCVbqRGYVls5kaPPe2iWHWRwll5PvKGSX47j6q7GNfKGAxnPjiM
	 mp72bcQdYEC8ykuYjU848eOY/MKwkVP/Aq0ifxuWXVmWOfYCZDPqrvtL+HBW2BY0Hr
	 uDo0j+5tehbXK3+yKI75O6lPle5JSyBBgA2Be2G5NxOc3R4mhksBgY66Q7CNOal9NF
	 BraknVw0ifJWLQ25gOWPyuxYTkvJun9/DFrsJKei78eIUX9H+Q3S4sPFm4Z8b8vKfg
	 TIAH3z9wtnCWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64AE1C41606; Mon, 20 Jan 2025 15:40:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Mon, 20 Jan 2025 15:40:20 +0000
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
Message-ID: <bug-219681-208809-3gQ1DT0mtn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Could you share both dynamic debug and trace of this case?
If possible remove as all extra usb devices before triggering this, as logs
gets clogged and hard to read.

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue, connect problematic device >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

I'll try to find reproduce this on our local Lunar Lake one I get my hands =
on
some failing devices, my current USB3 ethernet adapter unfortunately has a =
ASIX
chip, not Realtek.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

