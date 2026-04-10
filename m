Return-Path: <linux-usb+bounces-36147-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHn5C25W2WmQoggAu9opvQ
	(envelope-from <linux-usb+bounces-36147-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 21:58:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BD3DC3CC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 21:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 426933030B9A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 19:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FF03806C4;
	Fri, 10 Apr 2026 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vC4TPkTt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45633128CF
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775850926; cv=none; b=mCOrue5CQuZYZR9wIvEhqrFDUGu61/uf0VP/GNaENJM4BmDp4SOwqeuU7C0X0AOaV/ce7U/o1ILwU0wa70BTeXQHzUq7WjqYS1RV9KQwhVPrDSKL5ACHLTeCGAvo5Mhbaf5CVtJmlQfjJgWq9SwiuautWrd/IW+lmm6AaP6Dyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775850926; c=relaxed/simple;
	bh=kAwDxm3pGMZBr0aDBcRnoQ6LGTd1IIxeeEnXjaIpGRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auoOi3Jn7Hq+B6QH+fcj2p0tF1PsAq0kptyTqq07BD6z1loyWHU/i758sKXIU2Ocac9FVNYR8BGC+41i33kPHjiGJz5GOyxBylLyiaElr4E8oHfjJ4q4RRClFZhXzBJpcacx/9AjoS/gV9OWuKt/oEAQBVn/ExjXoSdjM8Sj9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vC4TPkTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AFACC19424
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775850925;
	bh=kAwDxm3pGMZBr0aDBcRnoQ6LGTd1IIxeeEnXjaIpGRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vC4TPkTtg8o43OSysZ48l0xfpwkLsnmG2y+j/zQRvtMrMwkKpYQSqGS5k3UfNwDwP
	 qIYzhKd66xcdt8MsNlH4PHuIn3a1c3VskgLdpq7+7Dp8b/LaB4WqIRUK+ovtpHtSuj
	 DsfDlI9oxhANMqsIRbBZIqmXAEgTrVqJm/th6PzDYLTT4D7yPkO1QbTe52IrPEAyfq
	 6pjy1rEkgT0Nmb3xVUahoKhxRGzi70NDadJJFMnUW044ikSFGX+MqlRH4Wjtgubmxo
	 b4A4Vh1hmgnHgihd0VaeVGlyg1sHvW2t0R85YqWIVy94riTkNrStXWFvV9hEIcW+DA
	 78Tn/v8BNoXOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E66BC433E1; Fri, 10 Apr 2026 19:55:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Fri, 10 Apr 2026 19:55:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-OZNMsspgoE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36147-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C47BD3DC3CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #5 from DaisyTheFoxxo@proton.me ---
This is what i got

[  902.725085] sd 0:0:0:0: [sda] tag#29 uas_eh_abort_handler 0 uas-tag 1
inflight: CMD OUT
[  902.725113] sd 0:0:0:0: [sda] tag#29 CDB: Write(10) 2a 00 01 46 1c 98 00=
 00
08 00
[  902.725243] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 7
[  902.725446] sd 0:0:0:0: [sda] tag#28 uas_eh_abort_handler 0 uas-tag 20
inflight: CMD OUT
[  902.725461] sd 0:0:0:0: [sda] tag#28 CDB: Write(10) 2a 00 01 46 1c 80 00=
 00
10 00
[  902.725493] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 7
[  902.725583] sd 0:0:0:0: [sda] tag#27 uas_eh_abort_handler 0 uas-tag 19
inflight: CMD OUT
[  902.725589] sd 0:0:0:0: [sda] tag#27 CDB: Write(10) 2a 00 01 46 1c 18 00=
 00
08 00
[  902.725610] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 7
[  902.725679] sd 0:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 21
inflight: CMD OUT
[  902.725685] sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 01 46 1c b8 00 =
00
10 00
[  902.725706] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 7
[  909.893015] sd 0:0:0:0: [sda] tag#8 uas_eh_abort_handler 0 uas-tag 2
inflight: CMD IN
[  909.893033] sd 0:0:0:0: [sda] tag#8 CDB: Read(10) 28 00 00 32 00 a0 00 0=
0 20
00
[  909.893154] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 6
[  916.037097] sd 0:0:0:0: [sda] tag#9 uas_eh_abort_handler 0 uas-tag 3
inflight: CMD OUT
[  916.037127] sd 0:0:0:0: [sda] tag#9 CDB: Unmap/Read sub-channel 42 00 00=
 00
00 00 00 00 18 00
[  916.037256] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 7
[  916.048101] scsi host0: uas_eh_device_reset_handler start
[  916.048197] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 2 ep=
 1
[  916.048250] usb 2-1: cmd cmplt err -2
[  916.048385] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.048473] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.048558] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.048641] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.048721] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.048801] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot=
 2
ep 4
[  916.161702] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd
[  916.174700] scsi host0: uas_eh_device_reset_handler success

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

