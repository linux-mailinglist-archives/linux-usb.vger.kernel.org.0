Return-Path: <linux-usb+bounces-35979-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAaJCUxL0WmuHQcAu9opvQ
	(envelope-from <linux-usb+bounces-35979-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:33:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24F39BF71
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4528300CC29
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 17:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FE72BDC32;
	Sat,  4 Apr 2026 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mcm9RJt9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E435893
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323976; cv=none; b=S7dTlckyRzPeYRri4i45s4FHyTHxIsta/7WtfkClzZRAvDUz/QnvlByrnHihyxzs5aqJpDz58FHhLRm5h0uq4r9ru2BJfEmUwV8XZNHfEzVPfWrSYZJynNUU19iM1MIGpi9nqps3lXrCauTg883335/xitKi82ItIcdNhAPxvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323976; c=relaxed/simple;
	bh=NcnWzJ+OjTlGbJVoBaG0DjGmcixGyjVboRPZBPhDOlM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkod2zJ342c4UUAnrpRpaoKK1hjxqEeyONsgYOAoTtJqVfR1D+go/J/U/5lbxgyjQEt7hiDH9wIrdMmqU+Bnw9SePyY72Y2f69D1FaQqkT+oxgUHhZce8owKux6e6dluoCbTnc+VwX22kmG4keKt1oucu/K2Ee9dj9uyo1rCNXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mcm9RJt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C77C19421
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775323975;
	bh=NcnWzJ+OjTlGbJVoBaG0DjGmcixGyjVboRPZBPhDOlM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mcm9RJt9tIJFpjkxlEJTF+wL0ncIH24YpmD6dafSws1V+AyI+BSG6NgXLw/YWQ/0i
	 UhVNxfLD/rG1eJjptNdg5QUwcWOKD8JIA2vvRLEhjRP5umuQ0Utqt+dTttGTiq5kpK
	 0dmALDqeIhqSfK1LCiv7bsEM0+bFEB3BArdJ+dKMn2EPFe+Mk94KGyrmtqBlVrFECQ
	 GvRZKwrb6CET09uU8TGapRwm+d/+S4c5ptTJ0iBX59eCrhrsoD3u0fgTBz3rj+iHi5
	 lFUE8vNlYHCFvivZE4nYP5vHYrME6A/VtI39J3B/DXc8kdtRc6nCVnpf/4Wl50K1lx
	 8fBblPgTReSvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC0E2C41613; Sat,  4 Apr 2026 17:32:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 17:32:55 +0000
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
Message-ID: <bug-221318-208809-N3JAO9w3vE@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35979-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C24F39BF71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #2 from manauer.uel@gmail.com ---
Created attachment 309815
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309815&action=3Dedit
lsusb -tv with monitor connected via USB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

