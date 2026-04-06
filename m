Return-Path: <linux-usb+bounces-36007-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHBbAgcb02moeQcAu9opvQ
	(envelope-from <linux-usb+bounces-36007-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 04:31:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC93A127E
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 04:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97CDD300794C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 02:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953D32F5A12;
	Mon,  6 Apr 2026 02:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDoszJRM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC72D7BF
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 02:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775442689; cv=none; b=XSBflNzY3ViafRsdaA7CbRqBBzI1F7RvRXYtqKyVd5ryfX/MpkYidZof1rU+8HhAcuYrAhef6N5HD9vP6YmFPeVIc2+ynoXVnZyeoOs4hLEu9ROMy4MxpT2w6vNFazfmzCdRckU7kFbM8MVgBbCGgDX3iLmNZMLYPE/DCadUmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775442689; c=relaxed/simple;
	bh=cRwipC/exTFENiDmSit9d3TJ3H8n+RvBwYXT9cJP/u0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FCbjiN/a/Dki8L1ph11aJocinmvJex+J3MjQKhB8yPK/i/pTi2Dq4Rgao8fChMYjvdYy3K0wbCqg1nIR06og/rc0M2OUYAulAu01aTtzeUu/Jg08w9G6F1JWT2d6N4LBUrmkNpSuuNVAZ7gmHwS0uwaLj+pBd2apg/ZjpzsGCKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDoszJRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC4ECC116C6
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 02:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775442688;
	bh=cRwipC/exTFENiDmSit9d3TJ3H8n+RvBwYXT9cJP/u0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UDoszJRMsC9XWd686ueC+WaPPYwTSak0VUBrPb5wnU7LTnth4Vgd5VLfKUXkhJx6A
	 vy41p3A1FbfWkgL4y6zgi8BWb5dFtG1dW7Yk9UYOb39/kAu5CeGOz8xx8n2n4YHfYg
	 EJNST50xtYu4w39PeU0fwn7NN6mN2Li/Zdu2vA+hKNgn19bMQVKDy/cTzxqGulCsFR
	 XMRwTOR0OfdpSMUy1Ffyd2buwYXC+E1hU5gFi2jAyTRwEmRE8y6Pz6k5bWHC9P4gHD
	 pN18U7yKt6TtMVsOVu0F327drHZ/DFe4U94fH4IWNm4IGw4hrr0PPMNzA5+41IWt6F
	 XlCoyRJK3OwDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A936EC4160E; Mon,  6 Apr 2026 02:31:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 02:31:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221319-208809-8watC74938@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221319-208809@https.bugzilla.kernel.org/>
References: <bug-221319-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36007-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 81BC93A127E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Here's the message that I was looking for:

> [    1.657766] x86/amd: Previous system reset reason [0x08000800]: an
> uncorrected error caused a data fabric sync flood event

I suspect that there are some PCIe errors occurring either internal to the =
SoC
or (more likely) between the SoC and your new device.  These are causing a
flood of problems, and then the BIOS eventually triggers an internal watchd=
og
that reboots the system.

Try adding this to your kernel command line and we'll see if there is anyth=
ing
new from the PCI core about the issue:

> pcie_ports=3Dnative pcie_ecrc=3Don

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

