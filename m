Return-Path: <linux-usb+bounces-32545-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAfuI9O4b2kOMQAAu9opvQ
	(envelope-from <linux-usb+bounces-32545-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:18:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A134869E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1777967429
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 16:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF44543C066;
	Tue, 20 Jan 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dpb5MrS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A4244B69B
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924459; cv=none; b=MMRFkgKAYAlsrQQ2e3zm6DXRIeO3F4GCJnm5uQgDwfP+wlYooXva57kHY9ww87+V2rmXffm01Nly7cBQeGswcl83XjbFNACUhfo33sOswuiFdIo4LlzKjo6ztSnAZGt653DjRQ+1mPq7/Ouf7aYnOwqGZvcxcgDtiqtkQlseH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924459; c=relaxed/simple;
	bh=HbOaZ/CxBqXducpcE7eQg8fTQhGrdIrS5DpfxtVsINU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j3rRj/XUD/EzscCvK+Gm2usPaYMsHp6YixZavSgW5BPxSx6FQqPKId1KgvplYInHXua0akC6JqaIZKcHdWoKKsBnUnv+5XUedn/vtvCECeyvONqRUhnGHMQwj6yrg5e8ginSusMoicKP3gv0aYzGfV6Yc05DEpMYIB72rOZtVwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dpb5MrS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD5B8C19423
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924458;
	bh=HbOaZ/CxBqXducpcE7eQg8fTQhGrdIrS5DpfxtVsINU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dpb5MrS4j27WQVNmlq7GFBI2FCNlH8SguS8sqNyi8jISvsNpQY0cdQB2jfSCbIl1x
	 zWnq50VOrFNXvACRtHYTPCZuZEE4sGbuU3irq1Suwiqbxpc1FitrfHwp7rh05SE2xB
	 05ILMYx6+dH53Pr89VUZQ+QASFq8tX8T7y9HURknijqmIn3lKyzMFkg+o7Bl93rb4x
	 5WfoByz5J728ZUX4sH9tCuH7BAr0XewM1L6S+vYBV6/W4pKTclwKtx5+25Y3bNuwyc
	 mxXQDnXTWsIR73BM4rlw1BBTSfxRSbBn2n/rOsAVIwwEZuNu+3eS240IZhHL4rA3HD
	 QslNZg399mmVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D54B4C433E1; Tue, 20 Jan 2026 15:54:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Tue, 20 Jan 2026 15:54:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-hR3JZrlHgk@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32545-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 18A134869E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #11 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The usb device at 2-3 is set to U3 suspended state before the xhci host at
0000:00:0d.0 suspends to D3cold.=20

xHCI host controller is then reset and reinitialized during resume.
This should only be done during restore phase (resume from s4 hibernate) or=
 if
there an error in resume. Not in normal s2idle resume.=20
Logs don't show any error during resume.

This host controller reset may trigger a warm port reset on USB3 ports.
The device at 2-3 is probably unaware of the host controller reset, and
remains in suspended u3 state until a warm reset is suddenly issued.

Right after we get the host re-initialuzed and up and running we read the p=
ort
status registers, and see that port 2-3 is stuck with "reset asserted" bit =
set,
and remain this way.

First we should figure out why host is reset during resumed for a normal s2=
idle
suspend/resume.
If the host reset is needed theb we might need to work around this and try
disabling/power off ports before resetting the host in resume.

would it be possible for you to try some testpatches on this setup if I wri=
te
them?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

