Return-Path: <linux-usb+bounces-33915-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMRiBmn4pmmgawAAu9opvQ
	(envelope-from <linux-usb+bounces-33915-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:04:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638E1F1FBE
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C6DF3128F78
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 14:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EA43D5651;
	Tue,  3 Mar 2026 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMff7k/2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311B73C276D
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549768; cv=none; b=bcHuBlI3U1a6KeFs1G1NfJcOXA3fFePKlMUqASzv0iyTVXt0y+1FfQvgUHEFS2wqwTN4zPyjGdBmgwypc3HR6PzUmbjBJ48DFW7s/TrKwsmUxs0kxdr7TrXf0YvTqPln8bPzrJ/FccHzogRItfsP/TMrV0vaiJZF+SmYcwGaFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549768; c=relaxed/simple;
	bh=6tcgibjX2+3jGlcB3REJfdAE0VoiqGiX8rG7EVxXCtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MS/HiDv8Hk5t58H9VEwvTz2XbjbXoePrfcEjfFWfzJwnXxMvl/DVpxb83jCNIsOQ4W/XeVIJ6OfkwoI+QrhLmheb1H+9dMEcQT3eNVFU+Da0jGHzPqBkcoBmG7UrJlkH8R/qkKFqRWsS54/8w4hrn0+f5Gv5sAkNoohKgIfc4GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMff7k/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E38EFC2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549767;
	bh=6tcgibjX2+3jGlcB3REJfdAE0VoiqGiX8rG7EVxXCtc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NMff7k/2rSn9t5Qql/L9vYkXNQmMC/Vh5E281di+Otl50U4XnKRZLx9ypwhxgOEVt
	 es431aOng6vAgv7a+5MRHFpp9O5fDzHVDUGrHsY1uO02RurUo2LAaioEyPC8hnaef7
	 9EEW7ohb8lTX7zffq8aJ3kqKKUBOWpMRgTMv/QA+lk6QHU7fxoUYgySp3Jl94topc2
	 9aLR6UanHIJffpqOTCOdgNNnoSikR9SpbqOZzyn49tm441balfJ+4RAmS+cRoiJISC
	 g5CAW0WTmCJbTT6LO+TMP9P/rhU1b4DhA62DyBDwrvRglykyfggC8/enhNUIIuytSL
	 9saMln2PrEMQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DBAF1C433E1; Tue,  3 Mar 2026 14:56:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:56:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-m3m2f5fRG1@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 6638E1F1FBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33915-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #23 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309526
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309526&action=3Dedit
comment16-dmesg02.gz

I'm fascinated with diagnosing the xHC USBSTS with the EINT bit set, using =
the
instructions in comment #5. I'm zeroing in on that. Maybe the issues with
resume taking 10 seconds in comment #19 can be considered separately in a
different bug?

My kernel has hand-applied patches I backported from
https://github.com/mkopec/linux/tree/hdmi_frl to 6.17.7 (ROCm 6.4 is still =
10%
faster than newer ROCm versions). I also applied the Mediatek driver patche=
s in
https://zbowling.github.io/mt7925/.

Anyway, I took a few interesting captures:

Cap1: used power button to resume. Can anyone else confirm this is a
workaround? The bug did not appear for this attempt.

* For some reason, debugfs files were all 0 in size?

Cap2: used space bar on keyboard to resume. Bug appeared.

* For some reason, debugfs files were all 0 in size?


# free
               total        used        free      shared  buff/cache=20=20
available
Mem:        32636908     4008008    27282920       35664     1764500=20=20=
=20
28628900
Swap:              0           0           0

# (this shows 32GB free because the BIOS setting is iGPU =3D custom, iGPU m=
emory
=3D 96GB)
# echo "module xhci_hcd +p" >/proc/dynamic_debug/control
# systemctl suspend
# (wait 2 minutes, press power button to resume, no bug)
# tar czf cap01.tgz /sys/kernel/debug/usb/xhci/0000\:c2\:00.4
# dmesg | gzip > dmesg01.gz
# systelctl shutdown

# (press power button, wait for system to boot)
# echo "module xhci_hcd +p" >/proc/dynamic_debug/control
# systemctl suspend
# (wait 2 minutes, press spacebar, get this in dmesg)
[  243.002269] xhci_hcd 0000:c2:00.4: xHCI host controller not responding,
assume dead
# (unplug usb hub from c2:00.4 and plug it into c4:00.0, keyboard and mouse
alive again)
# tar czf cap02.tgz /sys/kernel/debug/usb/xhci/0000\:c2\:00.4
# dmesg | gzip > dmesg02.gz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

