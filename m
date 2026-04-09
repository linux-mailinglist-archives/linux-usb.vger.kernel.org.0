Return-Path: <linux-usb+bounces-36101-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGUdEGqL12k3PggAu9opvQ
	(envelope-from <linux-usb+bounces-36101-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:20:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3773C997A
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D85AE301584A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 11:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F24F3A5E9D;
	Thu,  9 Apr 2026 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYPVmnHR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E432D7817
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733606; cv=none; b=CQi8ZmsHpcFNR437LRscSXd7BqYl3uqfrRMzMWNcbpjxYJ+ztDzyVQqcGvdTQNvQVu6nbw2QH6xylCB4EPQx69FL/ubAYgRqAWdZv+QLdDoCkMRWwOFAgfo86xB2dX+GdRlC7t4r/ze0Ji7Sn7b7CYKqkVDoIJnHU0Qh67Ls+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733606; c=relaxed/simple;
	bh=+M6N4nKeOxpDQUnOtYxIPRLSMSqdy2fpKh+ihnGhkYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rgToEkMeux3q9jbhAaZQOBnAvOtYaT+YBX8x2azn0lS961bfaQZbmTd93bXx9H8Nh2KWroGDA3as6zlLrv5fBQ4WeZa2egFCyHNhxASXxsn4VFYF5Pf76gMSqrKb1dG0orUuMwh11+grFAff+oI5AEtGqSJOXB2bG5SxIXTU67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYPVmnHR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58AB5C4CEF7
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775733606;
	bh=+M6N4nKeOxpDQUnOtYxIPRLSMSqdy2fpKh+ihnGhkYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JYPVmnHRqOsQHq8LvrtasU9AT+5Eu/YX2Tjl604Qi3sq70oqS9jjG9BbDZR2gYiKk
	 B81QKOdPBHWOW/rdqFlSU2FBmxpK4YlhfJ+lighQLlopTCLB/vCOErjFblW19PeOED
	 sdE4YO/kpOqR92dqEEShUW67q2wiYRP52EHrtLaUAGKyG/y4G2jvy8tVUmcIDIBYIe
	 3LPkT9zHUMEPdfMnZl6bC23IFJA6xDbneoyeZhkO/bw5B4U6qkkbEGabxu09mB8TGW
	 dmNMian8KL6MPHPqbu3J8qsdtqn2AyzbZ2vqGBP9gt0eOe3+AGc1dA7NLLGYLxlYPi
	 nM3xaTiGTeIfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51845C41612; Thu,  9 Apr 2026 11:20:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221337] Regression: USB webcam (0bda:636e) fails to resume from
 suspend on 7.0.0-rc6
Date: Thu, 09 Apr 2026 11:20:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221337-208809-21THjzo7zC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221337-208809@https.bugzilla.kernel.org/>
References: <bug-221337-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-36101-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,leemhuis.info:email]
X-Rspamd-Queue-Id: 1A3773C997A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221337

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Could you bisect, as explained by
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html=
 ?
This most likely will be needed to find the people that can handle this and
verify that this is a upstream problem, too (as you afaics seem to be using=
 a
vendor kernel).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

