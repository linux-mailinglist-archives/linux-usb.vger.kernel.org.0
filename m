Return-Path: <linux-usb+bounces-33404-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKGoKLdUlGl3CgIAu9opvQ
	(envelope-from <linux-usb+bounces-33404-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 12:44:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A714B87B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 12:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E2D300D320
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F09334C3E;
	Tue, 17 Feb 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+t/8/s3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281852848BA
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328692; cv=none; b=XOZiibpW0lc5mAi55MUL6HjVWzdVEnN9XXeMUTpqvIShJcoL42CuhBo8ubx+n6F9hTDIz4//cC/WW/YdBrCeJRyK/x2EOB2zOs+7ncXMCOLp96oTxvG0JJa5kP8Z5m6pLVV54dlf2yxwN38ywXENS6YWc+ig0dSqHrp88ky6mrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328692; c=relaxed/simple;
	bh=uuTaIXFTPu2/qzZuUs/jF/6wWEG131Z0iBFEDrNbk5c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tho0xKajNRG3u/eYsGUmBFU5ZpXaoJ96/FSZP7AOTif46wEEsYLyyOMGtOtKfj5d4E8PRKrIRAsdZ/gCttYN1mX4oTLoB4ahhimNsXdCSi3K/YUbD4q7vg8zbrrZnUHwXPsytznT+N9IfHOQKqjf5cqCM8D5LaLza7GGKfi7urU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+t/8/s3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5529C19423
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328691;
	bh=uuTaIXFTPu2/qzZuUs/jF/6wWEG131Z0iBFEDrNbk5c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L+t/8/s3P4y5trGmcHvLAT4oiQMd2vYyLT3chFfYn+P6Ii4cesII8ms0wRH9ZXyDe
	 wfzGg8LIav2TUXy6uEt76fomT5qC5MDgpcVdQBRD5HjuQTOttnh4uKnYw/YOGKafJY
	 cGyOQhWHKUsnbFctWbiCrP7k8lU3Qux0pfD58ifI0B5Dfw66yhWPiRxKiecfH7KZrl
	 0c3/inR6vYDgqVAyfJkibTwp417/tnNQQLEOhhXTpq+qXyybiZbQc1BBKLk8VOhrqI
	 fjIJy4536Wruzt3mwR7n5kuISh0nfzyJiVEELmof108v7v9qkFgv77wJGGlqvX+VEr
	 261hw4j8hy5QA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5D7CC41612; Tue, 17 Feb 2026 11:44:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Tue, 17 Feb 2026 11:44:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220904-208809-EkqfWodzIe@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_FROM(0.00)[bounces-33404-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 160A714B87B
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #14 from Thomas Jetzinger (thomas@jetzinger.com) ---
Created attachment 309395
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309395&action=3Dedit
Removed xhci_hcd.quirks=3D0x80 from kernel command line as suggested.

Suspend/resume now works correctly:

  PM: suspend entry (s2idle)
  xhci_hcd 0000:00:0d.0: xhci_suspend: stopping usb1 port polling.
  xhci_hcd 0000:00:14.0: xhci_suspend: stopping usb3 port polling.
  xhci_hcd 0000:00:0d.0: xhci_resume: starting usb1 port polling.
  xhci_hcd 0000:00:14.0: xhci_resume: starting usb3 port polling.
  r8152-cfgselector 2-3.1: usb resume
  r8152-cfgselector 2-3.1: finish resume
  r8152 2-3.1:1.0 enp0s13f0u3u1: carrier on
  PM: suspend exit

No "root hub lost power" messages. Ethernet recovers at SuperSpeed.
Full dmesg with xhci_hcd and usbcore debug attached.

Thanks for identifying the root cause.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

