Return-Path: <linux-usb+bounces-33729-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO+bCEsWoGlifgQAu9opvQ
	(envelope-from <linux-usb+bounces-33729-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:45:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE341A3ADC
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35C74305E9CF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B72314B6D;
	Thu, 26 Feb 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haECMtEU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0280B313285
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098628; cv=none; b=LZFiDqmMWY1y+yTPOWiIS00xAHeKF0Pfswn0FkG3ucP5B+IjQ397WdZJRUqsiWuK3/sGxXfFitCz30uQy6U+CHVxWT5F51ZS+7XEVMrk9kRLb4zMlHAicIjB+Pleu3hGYLBpQUwIz18KnjfrC7resXJo3LHHy84u+14E6sMJkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098628; c=relaxed/simple;
	bh=/8SafiZz8leGgW38Q3ywJXV5pr/MJBrog4/E22r0B7U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X5g16UbImc4ZqtJwGVMXYKupiK3j3VYnZX6XD0Vr44K5ZkrxhDZLdelVqGxlHQqeqrv10LBsNZST6kls1XqTWETc0ekn08fD0Vcrum0QRg9Mcv3w1TIG11/vpcaJFz3nHxdwK3W0LZr922MzUAaPse9nB/z4f/yrJ0eLpVnLl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haECMtEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE731C19423
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098627;
	bh=/8SafiZz8leGgW38Q3ywJXV5pr/MJBrog4/E22r0B7U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=haECMtEUpOvCkmnZwLzvF+lhlzWbC2x5ujWKcJE8q96UUl79WYL8LVXe2CtoIxNU3
	 IzFyHfmToAaf2IbwOCD91t6aqLOYFkVYyZFqcihoU2dwlN9yw4ylGaS64f6Wz2n8DQ
	 b1I+FwyC/vL79B0ChQaVAHFYxFhl0w//Ph6CmtAFzxfriHuNiXuey18XH4KYY+Tkf5
	 SDCTtoZ78WjbFxclgBMOrhMotRGkVrmlOowKu5qS5XQSGxeSshfhFTWfWx03ZUAyDp
	 Z97zcgUta2EadoyqL6Wh69IXMiFdZpEipVrEYO3Z45fR9+6y78hwGc9UKIphU9RhJM
	 bn8nV4dIdY3YA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7BBFC41612; Thu, 26 Feb 2026 09:37:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 09:37:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-REZlSuazU8@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33729-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 9AE341A3ADC
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #11 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Thanks.
This looks like we aren't getting IRQs or there is some problem with the IRQ
handler.

In dmesg (grep 0000:c4:00.4) we have the following:

// resuming the host controller and some root hub port manipulation
[  +0.190938] xhci_hcd 0000:c4:00.4: Setting command ring address to 0xffff=
e001
[  +0.002557] xhci_hcd 0000:c4:00.4: xhci_resume: starting usb1 port pollin=
g.
[  +0.000192] xhci_hcd 0000:c4:00.4: xhci_hub_status_data: stopping usb2 po=
rt
polling
[  +0.002367] xhci_hcd 0000:c4:00.4: xhci_hub_status_data: stopping usb1 po=
rt
polling
[  +0.000194] xhci_hcd 0000:c4:00.4: Get port status 1-1 read: 0xe63, return
0x507
[  +0.000007] xhci_hcd 0000:c4:00.4: Get port status 1-1 read: 0xe63, return
0x507
[  +0.000005] xhci_hcd 0000:c4:00.4: clear USB_PORT_FEAT_SUSPEND
[  +0.000001] xhci_hcd 0000:c4:00.4: PORTSC 0e63
[  +0.000008] xhci_hcd 0000:c4:00.4: Set port 1-1 link state, portsc: 0xe63,
write 0x10fe1
[  +0.009957] xhci_hcd 0000:c4:00.4: Get port status 2-1 read: 0x2a0, return
0x2a0
[  +0.006769] xhci_hcd 0000:c4:00.4: Set port 1-1 link state, portsc: 0xfe3,
write 0x10e01
[  +0.013286] xhci_hcd 0000:c4:00.4: Get port status 1-1 read: 0x400e03, re=
turn
0x40503
[  +0.000040] xhci_hcd 0000:c4:00.4: clear port1 suspend/resume change, por=
tsc:
0xe03

// About 5 seconds later, a control URB is unlinked.
// This usually means timeout.
// It was probably an attempt to resume some USB device.
[  +4.026739] xhci_hcd 0000:c4:00.4: Cancel URB 000000003faffdb9, dev 1, ep
0x0, starting at offset 0xffff5960
[  +0.000065] xhci_hcd 0000:c4:00.4: // Ding dong!

// We try to stop this control EP, but no confirmation in 5 seconds.
[  +5.114893] xhci_hcd 0000:c4:00.4: Command timeout, USBSTS: 0x00000018 EI=
NT
PCD
[  +0.000015] xhci_hcd 0000:c4:00.4: xHCI host not responding to stop endpo=
int
command

The command ring shows a single command at 0xffffe000 as expected:

 0 0x00000000ffffe000: Stop Ring Command: slot 1 sp 0 ep 1 flags C

The event ring shows completion of a transfer at 0xffff5980, which is proba=
bly
the last TRB of the URB starting at 0xffff5960, and completion of a command=
 at
0xffffe000.

 0 0x00000000ffffd5f0: TRB 00000000ffff5980 status 'Success' len 0 slot 1 e=
p 1
type 'Transfer Event' flags e:C
 0 0x00000000ffffd600: TRB 00000000ffff5990 status 'Stopped - Length Invali=
d'
len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
 0 0x00000000ffffd610: TRB 00000000ffffe000 status 'Success' len 0 slot 1 e=
p 0
type 'Command Completion Event' flags e:C

So it seems that the HW performed the control transfer and then stopped the
endpoint as requested, but we never learned about it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

