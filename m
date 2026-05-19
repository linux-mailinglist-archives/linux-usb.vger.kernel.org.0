Return-Path: <linux-usb+bounces-37668-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOlmKCEtDGq0XwUAu9opvQ
	(envelope-from <linux-usb+bounces-37668-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:28:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2157B45D
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C7BA30C16EB
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFB838838F;
	Tue, 19 May 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjEFKy4L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC63F0740
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182068; cv=none; b=UbDIhb4G5+LiT5jpJD9q4utTnm4IUf8iDN94LN95Y8eLJSdQ+oJO4Evlluts6iW6Y+SWURRbEy0B49h1zmA6FXMYB4jN/CREBFLBk1sr1BfRRn5TYN14OD918ma9wjnBnM+bBstEcRfvnlqmR2c8Y103phTogKI2278Z2cYGE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182068; c=relaxed/simple;
	bh=L8sc6E9xyapZCazBMP7klCQkllhyq0Y38suBvDd5WGw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rXEsEu9Oscva9DzslPvV0YVTH6gXeAa6hmcz8QCWz9H5/l/OtBxcN9hFNyk7BDopCfg/DT4yW2KubnVRORo5cV5xA6VAh8W+0ABsDtH9G5j2IQCLDkhHKoZOmQbjvILN3vwRrm1Twuujc6LaZyNBCq9TFxfuFwpXH45D+kxeXjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjEFKy4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49609C2BCFA
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182068;
	bh=L8sc6E9xyapZCazBMP7klCQkllhyq0Y38suBvDd5WGw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HjEFKy4L3kbvBhdovdBuWP3Z/SCKmcJqHilquJJ9g9b+TrHP9f8Q9HDO4MJkiLO9q
	 FbhTbESFi2KkremxNaA9kpxIwVQPy1MHYuBLO6NepE4GuP+R3KmvpH7Zpa9/Dq/6Sw
	 Vq21K6jcxx89Hio2cZlS23SmtWtEA2n2nmNcC1ea2CdLdEcRVLj55tqNsxeUKQifLd
	 xVYsyriQAGnP5xL6kViUobNSSQA6PtkKysg4rWP9W6UNeMG4AOFTuTailkQnDDVHki
	 wVprFHsKbYaeH3I+PoUeIcxpQG1zDEDzJpIxba9OMfNFJ4UKX8wmR0uOWm8W6jnX9E
	 r9ioCzC0YXd+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F589C53BC5; Tue, 19 May 2026 09:14:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 19 May 2026 09:14:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jase_harley@protonmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-Tr6gg0LyLH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-37668-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 36B2157B45D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

jase_harley@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jase_harley@protonmail.com

--- Comment #43 from jase_harley@protonmail.com ---
I can reproduce a very similar issue on a Lenovo ThinkPad T14 Gen 6 AMD / R=
yzen
AI 7 PRO 350.

I do not currently have access to the device, so this is from notes/memory
rather than freshly collected logs.

Hardware:
- Lenovo ThinkPad T14 Gen 6 AMD
- CPU: AMD Ryzen AI 7 PRO 350
- BIOS: 1.13
- Internal camera: Chicony USB camera 04f2:b840

Distributions/kernels where observed:
- Ubuntu 24.04 LTS
- Ubuntu 26.04
- Fedora 43
- Fedora 44
- Kernel range observed: approximately 6.17.0 through 7.0.8

Symptoms:
- Internal Chicony USB camera 04f2:b840 disappears after suspend/resume.
- /dev/video* disappears when the failure occurs.
- Logs have shown USB resume failure / PM resume errors.
- The visible symptom is the webcam disappearing, but the failure appears t=
o be
at the AMD xHCI / USB controller layer rather than a camera-specific issue.
- The machine has also had hard freezes/lockups around power-management eve=
nts.

Workaround observations:
- Unbind/rebind of the affected xHCI controller can restore the camera.
- Forcing the AMD USB/xHCI PCI controllers to power/control=3Don before sus=
pend
appears to have prevented the hard freezes so far.
- However, power/control=3Don has not fully prevented the internal webcam f=
rom
disappearing after resume.

Affected controllers seen on this machine include:
- 0000:c4:00.4
- 0000:c6:00.0
- 0000:c6:00.3
- 0000:c6:00.4

This may suggest two related behaviours:
1. runtime PM / autosuspend seems involved in the more severe freeze/lockup
behaviour;
2. the remaining webcam disappearance may still match this bug=E2=80=99s su=
spected xHCI
resume / interrupt / MSI-X issue.

I have not yet tested xhci_hcd.quirks=3D0x40. I can provide logs and test
xhci_hcd.quirks=3D0x40 if that would help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

