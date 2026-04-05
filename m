Return-Path: <linux-usb+bounces-35997-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM4jC5Dd0mmAbwcAu9opvQ
	(envelope-from <linux-usb+bounces-35997-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:09:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C94339FF30
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D497530075E0
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 22:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0785381AE1;
	Sun,  5 Apr 2026 22:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB5WRg/u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E41A262D
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775426955; cv=none; b=lCBKIlqeWq156SkuNjJiS3czz70WKD8qu6WEV9eahWXDw81HHjkEoWPQQwpRQVxzoeTxxsoNgVd39/FoGYxvpwgFQyDNWxWapcH447JNzsOlyahAX1SD1ymu0QELQ4hPqYNSpLdkzSKObvhlzS6r0yUZXG1Ale11TtEOvNIpJgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775426955; c=relaxed/simple;
	bh=fwPf8SnE2lP2YrWjt8rPwuwbLwW7VJ1lxSKhaoy9cbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oC8J93OQdxOf/4rvT9PWEMakkCt7j5pz99aqx4TjLxMJCGQe3O6i5IH5lC0Lase/nMFbDOx+LVe6foVYYZ6G46iZplAn4A0CXhooWrIga/1Jz2ccIvyQzGKShNcgSVTbWbydDYwi+vZchrUgcRpoA7NHW007dYRVyvv4ahU2Eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB5WRg/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2604C19425
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775426954;
	bh=fwPf8SnE2lP2YrWjt8rPwuwbLwW7VJ1lxSKhaoy9cbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sB5WRg/uMgvPgHs0+TQiXpjmObtFhEAZMD/0LS/5JA7UBrKWgbQUCnOeupdVPoRDK
	 ERTliwr0fMzneCJVBtVzucuBJXGeWlt7Fu4lrGqVBYiuXE0NHtgohTezggHtSQIS1U
	 iqYr+ZQ7susQ5/ToexM5gSAKlrMIPo8XcKpRiAdWCIixHGtf1d+TWV5CHnXu/r4Ys0
	 HKE/k5/Tbzrmd4zxmOvDr/4M8NBHzozivpFsUFk6agpCTGqCrqtRr+s7brSrL120u5
	 4DwniAsS7QYpicwB2O+4n6IC2MX6nKHV4j4NKs96ZLR0RqyKa6ldCk0zw7pkVYZNu4
	 FS826QIUzbjKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9AF0C41613; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sun, 05 Apr 2026 22:09:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-aUZmNxDOWL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35997-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 7C94339FF30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #8 from manauer.uel@gmail.com ---
Created attachment 309827
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309827&action=3Dedit
dmesg -W with connection through Thunderbolt 2 udev-rule on only

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

