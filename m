Return-Path: <linux-usb+bounces-35985-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAl5JI180WkjKQcAu9opvQ
	(envelope-from <linux-usb+bounces-35985-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 23:03:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F839C77C
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 23:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E137300DE22
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 21:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C00303A0A;
	Sat,  4 Apr 2026 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekYl/voz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0C21638D
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336577; cv=none; b=W23MOi0oK58lLkwBu5ILMJEllzZrUbweSAZn9HXPwOiWKHaYZI1a7uBvXdg0BtsiHF2hLc6dP6bO2ogiAZOITHcuIjzmGWtTPh4hxdOPX9g88VVa92nBpmlQxGO20N+QiczNu/PEjC0rttvUGtSNKw95mHp84qQhjEOwAp9AWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336577; c=relaxed/simple;
	bh=O/VqSpIIHhMQ9xKh1Ydg/ebdoO44PE8qRLqsC0cPacE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hb4CdF5HmWdthySfkPCm3U0td7huTk4deMx+m8UTkafm8M+AwJp32yeknghKK00o+4iypCfA1EuJquOLYwfkP72JxKO98BQ+UjebDZz6ATRd7/oCNfG24qtSOs+xbVDrBTdZlOojQP7ljCJ0XfgQSnolXaPra25kx60bHVDB1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekYl/voz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A472C19421
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775336577;
	bh=O/VqSpIIHhMQ9xKh1Ydg/ebdoO44PE8qRLqsC0cPacE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ekYl/vozIQWzMoH0hWrZ6qbF+ft18VpZUvD3Czl8zde5YUTNRDzyq2/E9aVbE2C+0
	 R/CssXVdZpff4qQIfE7o7Q3Zw6BrNW7XSosGblT+Pp6P65YMzFlgEybSuPUSRdgFxd
	 yyohYmSwPazfqRxeqn1fJcm8xMLQG8nL4sccj75S2oIxVo6CY1tNv2MMEQaia6FRsj
	 yW+tpOj91eybH9Nz+2tJh7KbHFef1slkSyiCGgDs3F0/MpEixRgNY+bjmTR51dP94P
	 AvxD4R/0E53a8DJqDB8A5amo5QvjgHp0mU1jQQf+G6KeAxh063nRM4qv5tevxuXzlg
	 5v7gpFTi5S5dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AEBEC3279F; Sat,  4 Apr 2026 21:02:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 21:02:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-QHAXuAa2D5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35985-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD1F839C77C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to manauer.uel from comment #6)
> The Thunderbolt log contains two controllers: Intel (0000:00:14.0) and
> ASMedia (0000:0a:00.0). The Intel slot 2 ep 2 stalls that repeat every two
> seconds or so throughout the log are from a different device
Unrelated, though a little odd. Can you check what's making this noise?
cat /sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/name

> The ASMedia side is where things go wrong. During each enumeration attempt
> of the mouse (slot 3), ep 0 stalls repeatedly while the device is being
> configured. That part eventually completes and the mouse is recognized.
Same thing on the good bus. EP 0 stall is just some control request unsuppo=
rted
by the device. More interesting is interrupt endpoint 0x81 aka "ep 2".

But little happens here. The initial Stopped events on ep 2 and 4 are proba=
bly
xhci_endpoint_reset(), then EP 0 stalls twice more and then usbhid cancels =
some
URB from the interrupt endpoint.

Does this cancellation go away when you enable the udev rule or ALWAYS_POLL?
Maybe something goes wrong here.

Then there is nothing, which means that URBs are completing successfully or=
 not
at all (as the mouse doesn't work, probably the latter). At some point
disconnection and cancellation again, which proves that there was some URB =
on
the endpoint at the time.

> But then this appears:
> > xhci_hcd 0000:0a:00.0: Split transaction error for slot 3 ep 2
> > xhci_hcd 0000:0a:00.0: Hard-reset ep 2, slot 3
>=20
> Shortly after, the mouse disconnects:
> > usb 3-1.1: USB disconnect, device number 5
I/O errors aren't entirely uncommon when a device disconnects. Does it mean
that the device kept disconnecting by itself and it wasn't you doing it?

Do you have some other USB 2.0/3.0 hub you could put between the monitor and
the mouse? Does it make any difference?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

