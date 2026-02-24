Return-Path: <linux-usb+bounces-33639-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHfsKdB7nWmAQAQAu9opvQ
	(envelope-from <linux-usb+bounces-33639-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:22:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61D185415
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 386C830BB96F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0FA377556;
	Tue, 24 Feb 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUk+7uCx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B223B63E
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928375; cv=none; b=QdlejikzydkZZDv89M1yFaxd7KYyCvNyT6L+mKKOqjfPcOCYXisb6mJkKHRiyKdDuBEprOdl8n6xVuqw+J1uVmsP9mjVxK+EFCWVaJSBzQkkxvfA/GlmsWke9EhUG8vdGxV/HUFrfAcyx7ICdBjSdA/jswCLRwU6wA9RLhKc28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928375; c=relaxed/simple;
	bh=6LGpvOxc7fvhKYqGw9IrFZH48idVZlTaZrNp4/smXlk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sCyo3kfOgy2h/x1Fg3CePg1VhE6JpY0p9X6X6uofMM71ms67Fq1grms5nuUfpSTM3nasgcQCOJbfqokQZEut4I6jaSXJb+KrNdvuzajkXGWmBZz4jjyf9/ChfMdnhZtryJHJqCZy77TOSIfmrsxg49zdwXoVeec1sZUjeqUeo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUk+7uCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8662CC19424
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771928374;
	bh=6LGpvOxc7fvhKYqGw9IrFZH48idVZlTaZrNp4/smXlk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GUk+7uCxCwT+NurmnwT9Tof372QLLfGSt5ZpET3mLAd337XGIHOj0tjynWnWEfUk7
	 XD62MzWHZVCVUvEdBuIakAxP1v6xAgFkJKONjno/LjpU9nsX42bYt83ZbDxN9IdU3L
	 aAtisCdLyJRPT8QXIkb3z6YpoKeXhz/ZkixxGGv65UePv6MOVIqxFDsBlwR0XoVebA
	 WeQ+XrXSljVMY4ZZGytxDWJ5OClhZzszBUasuQ0hYAQb/WONK1MgwG8zT0yeb6Kgwi
	 Eqr2IMpxw5DBU2dK3lW2mg39eBVYQU8+bdkdMcEgdqV8JPMIMuv4FNDXm3j90gJdhL
	 +u/rnO8DAZdQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75C3CC41614; Tue, 24 Feb 2026 10:19:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 10:19:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-alpmPXtjo5@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33639-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A61D185415
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #21 from Paul Alesius (paul@unnservice.com) ---
(In reply to Micha=C5=82 Pecio from comment #20)
No, I have never seen "Controller not ready at resume -19", "PCI post-resume
error -19!", or "HC died; cleaning up" in my weeks of logs without the enti=
re
system freezing, after days of hammering the USB devices to diagnose the
freeze.

I ran a test holding one usbfs fd open on /dev/bus/usb/010/001 (`exec 3<
/dev/bus/usb/010/001`) while rapidly cycling power/control between 'auto' a=
nd
'on' on 0000:7a:00.4. After the initial resume triggered by opening the fd,
there were no further suspend/resume messages at all in netconsole (the dev=
ice
stayed powered on and the system remained stable with no further messages o=
ver
netconsole during hammering of control=3Don/auto with a 0.2s delay, with fu=
ll
dynamic debug enabled xhci_hcd +p, usbcore +p, pci +p, printk=3D8)

The "HC died" messages have only ever shown up in netconsole right at the
moment of a full system lockup, and only during tests that *repeatedly open=
 and
close* the usbfs root-hub file, and during the HC-dead cleanup path.

Let me know if you want me to test a patch or run any other specific test.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

