Return-Path: <linux-usb+bounces-33365-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOheOHnpkGkOdwEAu9opvQ
	(envelope-from <linux-usb+bounces-33365-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 22:30:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983113D865
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 22:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36B5430593DE
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 21:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A9F28507B;
	Sat, 14 Feb 2026 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRlEJIn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729CB26F29C
	for <linux-usb@vger.kernel.org>; Sat, 14 Feb 2026 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771104477; cv=none; b=cJh/wwewfATTyHkB46NTrLeqxe2hSId2cSQPEvXGl7WNINMhgxKdjrOOe714wg3Rib/wcNUnRp6skwDDlu0zk+RyZUPhWgWhcs6gAwjC0O1ZTeb495dwRprJAy12kgqgjORwRaf5SgRMg9NCfHSaKby5RJcbsQyuPqKMcr7viGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771104477; c=relaxed/simple;
	bh=4G6BQKOtZIF6cbYarZxFWX1d954VHP+fPZz6IpbXBwc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DPbB3jFP2nFWOK6/o4PAeCKHd+DFDeJDM1SMMcvKHhEZ9pj3Gcs1dGOrJR57SvRcFnlJy5DwsQ/fCJ9dtQ5+HOuupqrruu2MsowRkQMQyhDTY+UeRF40KFKz5mIhqhVidMl02abVx+PwWmoi0jGtrpDE1Eg3ig54aTgFH5CTM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRlEJIn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5825EC2BC86
	for <linux-usb@vger.kernel.org>; Sat, 14 Feb 2026 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104477;
	bh=4G6BQKOtZIF6cbYarZxFWX1d954VHP+fPZz6IpbXBwc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JRlEJIn9oD/TnJW2zGfzjadCabnOchnofvygV5jorktORMGg5mVGRMOl+UZkTGQ/g
	 Z4++UFPAQ+xYL0odqTYKP3WPi+m5ysXpMq3HCoyPot4/HbR2IVpj3bWtV68GHdMf/r
	 fLhnO0NfsOcxAnpIYK51RXWmzeft0C6iqvmsknm3JMVKQ6ex9Km6bvEmiLyYTVp3RM
	 iwEhhiCKFmxwRxsLE02KsCwG/nuxMMi+goOt9Sb1ZuhwxiBFznpNprAJVd/Z2iD8wY
	 nL8qsuQeyqUDc/mc95yb/ssXq7GfhyJfSUE6zSAO809inp0gOfivRDRHQz+1x6JZLM
	 wdXelt58rwj9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E637C53BC7; Sat, 14 Feb 2026 21:27:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sat, 14 Feb 2026 21:27:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sharms@snowfoundry.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220027-208809-a3AalWJKSZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,snowfoundry.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33365-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 8983113D865
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

Steve Harms (sharms@snowfoundry.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sharms@snowfoundry.com

--- Comment #14 from Steve Harms (sharms@snowfoundry.com) ---
This has been solved by multiple patches including
https://lore.kernel.org/linux-usb/20251207012059.7899-1-johannes.bruederl@g=
mail.com/
(this thread) and
https://lore.kernel.org/linux-usb/2026020536-bullseye-smugly-4361@gregkh/T/=
#mf7393976d02d49cbfdb9ff5c46f030dfc0f7a6c7

So technically you can make a kernel yourself and it would work, but neithe=
r of
these have been merged as I think there is confusion about how the cards wo=
rk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

