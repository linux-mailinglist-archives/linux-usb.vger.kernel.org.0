Return-Path: <linux-usb+bounces-33438-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKD/CjLSlWlEVAIAu9opvQ
	(envelope-from <linux-usb+bounces-33438-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 15:52:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF81572F8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 15:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 757983019448
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 14:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BCD33D6FA;
	Wed, 18 Feb 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn53/ZVX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396B30FF10
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426349; cv=none; b=WUC2ZVyyb2ueGkkH1Oz6A5Jyfxyx0lzIyTfxTZ4Ubo5Lx8hM28GEtTWhhlVxDu/DRgoEfDEr/CO644ka9bRsWEdCMMMqWXswttO5r3C1hxeTtweuG4oAek7B9EZuoqNGgILiGFm79+IUeddUZmo2BL/BlTjNnCMy8a+U9pLn104=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426349; c=relaxed/simple;
	bh=c1LV/Bg2X+WTEpggqAbuaiwuLdBz5bn7ENb+BdO/L8Y=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ORcQV1QMQuxVcCBfjwVskDQmq7x3+xg+VyiRLeBAcpNquE1iHmWU+ZExd+MQwW+Si2wUfieJu4HoLZPp1g5eLgnMmSRCW7K21s1pYaYz4GPDAAnAHlBVJw7HddVfJYZTuK4cad5OE9jqSWmWy3RYDaC2V5ibjVvsd0JK0iBriqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn53/ZVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEE6EC116D0
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771426348;
	bh=c1LV/Bg2X+WTEpggqAbuaiwuLdBz5bn7ENb+BdO/L8Y=;
	h=From:To:Subject:Date:From;
	b=Rn53/ZVX+0AlrIlP2wHIyDf6l7IbSeGBMwAM1V66lJhhcPXd//uDAH4JIDNKzFtop
	 rWDSj2THVX0wpuRAi8YEvXldpgsWMwQn/tXlPMQhwALvMAmMZUhMMm8pUO5/HO1Esh
	 c8MmNH+Tn1DmOuFu0ZeBul3fD7ktArcgima+h5XGBCQM0vo2FdY5ZiZ4OHTXC38EXA
	 9o5Xf9v4AEilc71MKjsdJbQe6A2Jjw0Dd9PmdcpfG8Rm6GwnGoAjddwtuS3JK731Ub
	 DzFgTuaxhUMJHi0gpxo0rQxDTCbXngTtBqTqHkBTlkQ5eNgO6rV75B6kgnexJdxJHc
	 cjo4QAaZ5t33A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD762C3279F; Wed, 18 Feb 2026 14:52:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] New: xhci_hcd: System lockup under CPU load during
 rapid usbfs polling of SuperSpeed root hubs on AMD Ryzen platforms
Date: Wed, 18 Feb 2026 14:52:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-221103-208809@https.bugzilla.kernel.org/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,unnservice.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33438-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: AFEF81572F8
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

            Bug ID: 221103
           Summary: xhci_hcd: System lockup under CPU load during rapid
                    usbfs polling of SuperSpeed root hubs on AMD Ryzen
                    platforms
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.12 - 6.19, (and mainline)
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: paul@unnservice.com
        Regression: No

Created attachment 309401
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309401&action=3Dedit
Test program that polls USB nodes and triggers the system freeze

On multiple AMD Ryzen 7000/9000-series systems (X670E/X870 motherboards with
recent AGESA firmware) rapidly polling xHCI device nodes via usbfs can caus=
e a
complete system freeze.

Reproduction:
1. Compile/run the attached usb_poll.c
2. Create CPU load (stress-ng --cpu 0 works reliably)
3. On affected machines the system freezes within a few minutes without any=
 log

The trigger on my system is consistently one of the SuperSpeed (USB 3.x 10
Gbps) xHCI root hubs (1d6b:0003). I cannot confirm if other affected users
freeze on exactly the same device node, but all reports point to the same c=
lass
bug polling xHCI.

Kernels affected:
6.12 - 6.18 (LTS + mainline) on openSUSE Tumbleweed, Manjaro, Ubuntu, Gento=
o,
Bazzite, Fedora, etc.

I can provide any additional diagnostics needed:
- Full lsusb -t -v and lsusb -vvv
- lspci -vvv

My MB and CPU, others in the ADB bug report have different AMD systems:
- Motherboard: Asus ProArt X870-E CREATOR
- CPU: AMD Ryzen 9 9950X

Originally exposed by ADB=E2=80=99s USB backend (platform-tools =E2=89=A5 3=
6.0.2):
https://issuetracker.google.com/issues/472398009 (full discussion with many
affected users)

Tests:

test: Poll all USB devices
method: usb_poll.c
iterations: 600
result: SYSTEM FREEZE opening Bus 010 Device 001: ID 1d6b:0003 Linux Founda=
tion
3.0 root hub

test: Skip all root hubs (Device 001 on all busses)
method: usb_poll.c
iterations: 2400
result: SUCCESS

test: Only root hubs
method: usb_poll.c
iterations: 159
result: SYSTEM FREEZE opening Bus 010 Device 001: ID 1d6b:0003 Linux Founda=
tion
3.0 root hub

test: All devices except Bus 010 Device 001
method: usb_poll.c
iterations: 1900
result: SUCCESS

test: Only the specific xHCI root hub
method: usb_poll.c
iterations: 209
result: SYSTEM FREEZE

test: Only the specific xHCI root hub
method: while true; do sudo lsusb -v -s 010:001 >/dev/null; sleep 0.1; done
iterations: 2400
result: SUCCESS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

