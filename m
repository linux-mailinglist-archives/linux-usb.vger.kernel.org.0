Return-Path: <linux-usb+bounces-33440-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH8SCDbulWlTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-33440-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 17:52:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AD157EAE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 17:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A8EC300B115
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 16:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BF9342518;
	Wed, 18 Feb 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd0bu4/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3830AACF
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433496; cv=none; b=MyfuF4XL6I2XmC1e0hKiqZ1+RXQdSEdhbAYBmblCOIHDO7rf0VA8XVGJb7WMWG4byHA2d6LVvEGLEXy2jNGKu57oLhnY/8PnJkRyhNCb9KilyafIQzi4kfIyZpfGv6qC6HOgw8QilMsV259P75mPL4MKMcrvl2FWKJp4bQCsF04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433496; c=relaxed/simple;
	bh=NbBW7ZvLgBC6IjRMKhIkBlZQkno9++aP1uieGhgffzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V2zokVLes45rb/dyESDf3jlK0RnKYDn4jjKDeK0+w5SDZzguA4+rBB6su8b5HXSWK0glgFlw4FOYcW+9ZM9NgbHb0V2EFpMxE1z/bHZLtumZ9VsDY4y4dSnvFSRZcXkLqDqzh3Rug1t+fjCeggKnjzgSww+a0lJGXVgvKiolfe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd0bu4/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED381C19422
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771433496;
	bh=NbBW7ZvLgBC6IjRMKhIkBlZQkno9++aP1uieGhgffzI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pd0bu4/MvfQ0NpVTv4W6qegIJaGKww+7UhATWfrO+W0suU5iimyXSB3cFIEq872ik
	 NDOIkessIM6lwTYuy69yGvNYxYKzYQFqfNbGlrSWfQ/FBrePMxcM6omYLwuqKgNCvh
	 9gYG1c9toVYCvjIuRwJfMQmSmaAE2vpskfZ1ZUQhr4yhKUxfi08C5wEQyDLfn0AC8H
	 DautCVmnRg0yU5ZsDF6FKItjzJDZ+qIgS1Ic/mHnuxeGcHZElbjc18wooB93FP6Alt
	 XUutOMYU1Z/fdMrv7h2Uzz50vEn0nsDapVBmkO3+125oA84BqaDIX4rl6TNRFJDJ2x
	 ugjKAF6V0CnEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3EAECAB780; Wed, 18 Feb 2026 16:51:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 18 Feb 2026 16:51:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220904-208809-wvNQguXgKh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33440-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 690AD157EAE
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

Thomas Jetzinger (thomas@jetzinger.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #15 from Thomas Jetzinger (thomas@jetzinger.com) ---
TLP blocks xhci_hcd from runtime PM by default, which caused my xHCI contro=
ller
to fail resume with "root hub lost power" errors.

I didn't realize TLP was the culprit, so I added xhci_hcd.quirks=3D0x80 to =
force
resets on resume. That fixed suspend/resume but broke hot-plug.

Proper fix:
- Remove xhci_hcd from TLP's RUNTIME_PM_DRIVER_DENYLIST in /etc/tlp.conf (if
installed)
- Remove xhci_hcd.quirks=3D0x80 from kernel command line (or never add it)

Both suspend/resume and hot-plug now work correctly. Other ThinkPad users w=
ith
TLP defaults might hit this same issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

