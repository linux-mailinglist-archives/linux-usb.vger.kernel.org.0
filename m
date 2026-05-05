Return-Path: <linux-usb+bounces-36978-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bb7DOEl+mlIKQMAu9opvQ
	(envelope-from <linux-usb+bounces-36978-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 19:16:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C554D1EBD
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 19:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F81F3046E98
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 17:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DEB492523;
	Tue,  5 May 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds4Ox3VY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2681C3A7859
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001225; cv=none; b=JvGIZjoS3UX4fS76BMxbCf8f6gQRDoULz4OHZJ0zcsC1rj5zC3lbG3bZ+qKgF1CgYWsqQ+DmK5zvzn8k1PBPYjwUF6MQ2GhgvnV6ZjmLgdRUcDV7E3+iWAax38V7AXlF1k0APiTwCr9RtpUJP7e0K2i9FXDHQGP8oS9q0AupoWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001225; c=relaxed/simple;
	bh=dwQ79vdodWb6TT9M1PHd8/yE5nZIIezaDfivC3A4x+8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SNJdHq9sTMpHfMn+qi0xa/JoBYGlYm/SLlUyIcOFLj55TN/XIfQ+9FbWS8CjiN9d9eNOmVkcx3Ua/rwiucieV8I+GDDOus/EAMMB57fLQS+vPxFGxWevZmNZg0rJUEBT7OE6JdEGzm6O1hBxJSutffGmTXtNjliSlFf6e+NNNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds4Ox3VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09142C2BCF7
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778001225;
	bh=dwQ79vdodWb6TT9M1PHd8/yE5nZIIezaDfivC3A4x+8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ds4Ox3VY2WgNeqQp6yBHf8ORoGHPkwDDpjPWCBzVCQmxm8JqkrqEF8R8uwTAkDUK/
	 AuChxDTQuGehh/u545eMH9+NSlmJNQEef5c0kBJ2SmQnkYyOiEjGnN15gqKs8ggp6d
	 mSe8ga3jVYN/9JbefwJSfPyja4e4P52rt0lzztEw0ABUPpZcqSUHgC8dax+tqCfdWR
	 s4ybQXdXVHpeL7XzggJ7WSaHf6R2e/otLnavANzAKiWzSXqJ/oQXcenj5A6Qs7tyRO
	 M6Sz1Oe/vTPvgsxCRYmgULy3jXAWQ2hLa4ve8DU87WCzPnljKbfnQahly64oBBYI57
	 ohE5AS58J957w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01EA6C41613; Tue,  5 May 2026 17:13:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Tue, 05 May 2026 17:13:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-95x1rD4M1d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 82C554D1EBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36978-lists,linux-usb=lfdr.de];
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #25 from Nicola Lunghi (nick83ola@gmail.com) ---
Subject: [PATCH 0/2] ALSA: usb-audio: stream restart on isochronous gap for
MOTU AVB devices

---

MOTU AVB devices (USB ID 0x07fd:0x0005, including the 1248, 624, 8A, 8M,
16A and UltraLite AVB) cannot recover from a gap in the isochronous OUT
stream. Once a service interval is missed, the device's internal channel
demultiplexer loses synchronization and subsequent audio is routed to the
wrong output channels. The device remains in this state until the alternate
setting is toggled: set to 0, wait, then re-enable it.

This behaviour was confirmed by Dylan Robinson from MOTU in bugzilla
comment #20: "once a transfer is sent in a service interval (zero-length
or otherwise), there must be a transfer in every subsequent service
interval. If, for any reason, a service interval is missed, the alternate
setting must be toggled back to zero and then re-enabled, and the stream
restarted."

This series introduces QUIRK_FLAG_STREAM_RESTART_ON_GAP for devices with
this requirement. The snd-usb-audio driver already receives -EXDEV on
isochronous descriptors when xhci-hcd misses a service interval, providing
a reliable gap indication regardless of controller type. When the flag is
set, retire_playback_urb() checks for this condition and schedules a
workqueue item to perform the altsetting reset and signal an XRUN to
userspace. Normal ALSA recovery then calls snd_pcm_prepare(), which
executes the interface reset via snd_usb_endpoint_prepare() before
restarting URB submission.

Patch 1 adds a small helper in endpoint.c to encapsulate marking an
endpoint for a full interface reset, needed because struct snd_usb_iface_ref
is not visible outside that translation unit.

Patch 2 implements the gap detection and recovery mechanism, and registers
the quirk for USB ID 0x07fd:0x0005.

This series complements a separate xHCI patch series that addresses the
root causes of isochronous scheduling gaps on CFC-capable controllers.
That series reduces the frequency of gaps; this series handles recovery
when they do occur.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

