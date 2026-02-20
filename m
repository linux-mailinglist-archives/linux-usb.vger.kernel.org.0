Return-Path: <linux-usb+bounces-33506-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLvOMdspmGlqBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33506-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:31:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8B16643D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C36830897B3
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FA832142E;
	Fri, 20 Feb 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sza5gOK4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30734320A22
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579685; cv=none; b=f+dd7T74VpwoMuzBD0CytaMC24J09jDxT5iGexS7Rb1NiCf7r2mUCZIXVtkKB6RljYOVNyeXp4wo+JAZzlhL36NqJBK8ZLxnC4ludNpxF05a0RyAJ9IUn4GSvyoDSwot28ByMx5tajTqO3xO04BHdDzucBGqq83xlaK4EpsrGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579685; c=relaxed/simple;
	bh=/rDmq7tG0akQRH2SICcpdQIx0pvBz104jDkb3Be5rU8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ri6xPXyxFDLvTmM7P1zaUG1EFVTDMsRG1XhTIspJ2lrWpkcFjv6ksWPr/y/pkomd+U7Jfj7nH3alEe9NoiUPkm/T0SUFO04P3J35g3h40EmCG0GWi3ScI6LDADxTAB5qLdR31Stdbdu2FS+m7ok4lLrRmzt+qa00wRqFHr8mHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sza5gOK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 128D5C19424
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579685;
	bh=/rDmq7tG0akQRH2SICcpdQIx0pvBz104jDkb3Be5rU8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sza5gOK4r7bKpcKPdjsLl0GJVxm/rwUNFUr0sP0FEdDA+El/L1L6hGZJE8Y8934G/
	 IS/JvbL8Ju1iISID6PWzCC0EtSHO1GUE/51hpaDZBX102XMQwHS1AbyRmCwdxrj6iH
	 VrgKQgLyxuc3lyCLT5EgU+HwWG1sa3E4+67mCRQ2lJOmkzq7ZNbNAM2pL6EEZPTyM6
	 97Tx/Jl2y2w2s7lUbtTzxekUyvh/jBJdXiUbOrbSPnzGvz3BOu+Jw69Gb9gvoaVD7l
	 FJ1ey+Dj8HPY9USiKLQRerHF6KQL9ASllxIGqF6rYK7mF6KViz1PTCGvfgTNJkzVKU
	 DbvoHLhqtkOtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B0BEC433E1; Fri, 20 Feb 2026 09:28:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:28:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-PyUKmI9a3I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33506-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DE8B16643D
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Paul Alesius from comment #3)
> I just tried with "dmesg -W" (follow mode so it prints messages directly)
> and it didn't print anything before the system freeze, and there's nothing
> in the logs, reflecting the experience of the others in the ADB bug repor=
t.
That's a waste of time, if the system locks up completely or panics then yo=
ur
dmesg will never get a chance to run again and print anything. Neither will
Xorg or wayland.

This needs a serial cable or netconsole (never tried it myself but AFAIK pe=
ople
use it for panics too) or DRM_PANIC or something like that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

