Return-Path: <linux-usb+bounces-36506-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKyWC8IW72kQ6AAAu9opvQ
	(envelope-from <linux-usb+bounces-36506-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:56:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978546EA9B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 954A5300459B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2029D3976B8;
	Mon, 27 Apr 2026 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNt8WYbh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F79370D7B
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276606; cv=none; b=bMf4zuPq1fMmBgzjtC6s0VhAu3piCbhRZ9/6kyTHBkIyB0Ix7ntfCHxohEIjBv/kJ65FMuq8FqIMs4CJNiU4G6h0f+vzNzCJSKEAOFGAaCggNtfIv2vddaiNZgpiEMFtbiGzGhCBVO+YeV47sfXEIenF36i4xsx/VdR075zcJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276606; c=relaxed/simple;
	bh=3peVlMOX6E1hdO83VEoecPe7wXXHV7CCSWdCwAvtCqg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tI16sb2Z2nkeOE+Yqt23wJyPBnrB26psn484fwxJFo4DdBjHh0ANhWQuqsyNh/NwshJDA/lGxrurzeWrzVbzxWRWVqCPZov/z00xNPrOeTFakr6uY6eqSBheo5CdZGX0qHnY5m8xBgVT76NvlzHC+yoBtwC7riKg5xL+Ua1lZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNt8WYbh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C190C2BCB6
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777276606;
	bh=3peVlMOX6E1hdO83VEoecPe7wXXHV7CCSWdCwAvtCqg=;
	h=From:To:Subject:Date:From;
	b=oNt8WYbhmc1h7oYS1EQhp0txTj8clwvBdAdV2gib+mgvN+tWaUxSK+aoSPOxR1q8k
	 4HHRFCVQ1jlsCc+VywODyTCHuhVD3Ll0pcIhGSsnuoBLbymJXOaLgjtvAtIsip/b3r
	 eAJfNE3vdIB2SG8mUotCpmkfuZBgWpXw3S7DCu/kLUaOTY4gXSvKyKm2mtrSsYe3ST
	 Kih9fjQhvTN0kAK4bMcNpK3rdpvdj53tAH85JSlDpeBN0jyhw84iekxbLFTrh1AVmV
	 bZmYWyek0TVyAekIp5L5StAmuZHZpqNwUmLyZWmTqcx3lMilYUTBTbtHsZkHA4NlNu
	 BbTUE3zaSzSBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B345C4160E; Mon, 27 Apr 2026 07:56:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221424] New: USB auto disconnection
Date: Mon, 27 Apr 2026 07:56:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221424-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 9978546EA9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36506-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amazon.co.uk:url,ik.me:email]

https://bugzilla.kernel.org/show_bug.cgi?id=3D221424

            Bug ID: 221424
           Summary: USB auto disconnection
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pierretom+12@ik.me
        Regression: No

Created attachment 309967
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309967&action=3Dedit
Part of dmesg

USB auto disconnection

On a HD dock station USB 3.0, a few moments after powering on, it disconnec=
ts
automatically without reason and then reconnects.
I have this dock since 6.16.9, I tried with the mainline repo as there are =
lot
of USB updates, the result is the same.

These are the tests I did, but the same thing happens:
- Other USB 3.0 ports.
- Another hard disk.
- Another motherboard.
- Disable Udisks2.
- Test all usbcore.xxxx and quirks options.
- Mainline repo.

Does not happen with:
- USB 2.0 ports (No disconnections observed so far).
- Another HD dock station.

Device info:
https://www.amazon.co.uk/POSUGEAR-External-Docking-Station-Support-Black/dp=
/B0FNR4N6PM
I am able to test patches if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

