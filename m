Return-Path: <linux-usb+bounces-34629-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJrIARADsmmHHwAAu9opvQ
	(envelope-from <linux-usb+bounces-34629-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 01:04:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088926B860
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 01:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED09E301A9D9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D2B14A8B;
	Thu, 12 Mar 2026 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSBSULJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88341FB1
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773273866; cv=none; b=u7xONMU7C8DeZGDHVerE9GZP7S8rfyCty0ICauSO2rmBq1ujYAGaE0HAzZah8w23sw5R7koNyagvBhBpvkxTbUHiOsSvqP59Z45yxqee347dLUL7pEI7lD3xC0giSQA8Pla5wISfDVCyRYWnubR+OxBzDNMwJklaoJOM4sMFzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773273866; c=relaxed/simple;
	bh=VqyGnZwFwBY/k5i69dxNw+GjXOaGgCTGiefbyROfn/8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f67OPujp3fnJkOMGWxjkZOuex1i5QT+mTgpHIDoxvPbHfVrO19BT2ZBkNe78T9ONLFJmZMcUBRJQ/JaB/tTrp1M9WWvMRl40RFJE69VlA6fTS4tuKNxjDdx40GrpzchiMkZDZ9dj6lLCRTaMtYk7CSCV4gx+b2Pjz3ePPxnCwMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSBSULJW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BAF5C2BCB1
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773273866;
	bh=VqyGnZwFwBY/k5i69dxNw+GjXOaGgCTGiefbyROfn/8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uSBSULJW6sLbWbIkMv+xJEtkgdzIBbWakDmpq97LEJlXl81vTLMyX57ilQHZAAqMH
	 NFmRpEteYP0jMGiOomEyWeDRZrWXPe4oPAZ1EaQ4mCQnMpkXiQf1qZUA/6WfXNsdGd
	 9wg3eK4CYe+Llcin41cza+faEAaNHDeZQlrVrbgwRbAlRtnYOkSQSX0CrqK+Q5U00I
	 Avv3ExRHiskWAHNhkcYa2g9oMXmWL6s7j7iQYpxmW0qlE9Cz6TETCu2hFLPronIl5R
	 Jjp6KpsHYbegVeOLNn6ONxNipiY8jY+GRvL5SRYrmKubEbMTqSC6W70ocDU5dCDk0U
	 R11fEnQCyBs7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72A22C433E1; Thu, 12 Mar 2026 00:04:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Mar 2026 00:04:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-KSEHBxGoGI@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34629-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9088926B860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #36 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I isolated the issue to the firmware upgrade, downgraded the firmware to
> 20260110 version, and it became like it was before. I don't know whether =
it's
> a bug, firmware-kernel version compatibility discrepancy, potential
> brokenness of my device manifesting itself, or something else, but I have=
 to
> mention that I used `make localmodconfig` from a 6.19.3 system in order to
> avoid long build times (due to building all the modules) on the slow usb
> stick, and on the laptop in general.=20

There was a linux-firmware regression with amdxdna.  If you want to use that
firmware release then you can blacklist it to avoid it.  Otherwise the month
before or the one just tagged will work fine.

> What's weird/interesting is that when I tried to make sure that the issue=
 is
> reproducible after updates and encountered "didn't reach deepest state", I
> still managed to trigger the "HC died" issue -- I did it 2 times and both
> times it took around 30 tries, which is much less frequent than the usual
> state, where I need 3-7 tries. (klog-deepest-state file)

This is actually an interesting data point because it means that hardware s=
leep
has no bearing on this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

