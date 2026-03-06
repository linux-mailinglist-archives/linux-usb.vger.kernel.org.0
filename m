Return-Path: <linux-usb+bounces-34151-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qClWD7O9qmlXWQEAu9opvQ
	(envelope-from <linux-usb+bounces-34151-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:42:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01321FC7A
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7B6B3114941
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 11:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D494836606A;
	Fri,  6 Mar 2026 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTrrUG0+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC331CA4A
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797228; cv=none; b=LgADm9wSIBSPwSf4JILlNHO56oi0wNjo5h3NKPmNRs1BWeOG77ETnpILEoIuf9OnVV9aWN3oJUdMoYzKs3Ar7r2mL+XtF34uJt2hYKuzKh6dWsyrqaD62fQRIq8CEnFiSUrh4w2isPcLjIJpudBB+tQel5BvcZbEjTUxydofYDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797228; c=relaxed/simple;
	bh=YYmHS0yiuxbrOHURRCrH/2X3gouaQWL22Nqtk/k0+Sc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOK/AM8ebZsEvrEdRhmB9zWubPiqeXF+zOgJu0n8aSSLv8fcOpsELAFvuiwlaFtm0LcvFDujJik2UXWBx6pgw2u8MYuAWpvUcVYgO+AI2H/f8juZv6IYXlb7LKu13959rEmBw6+UP28jbQ4kvRzwOFh7ztTjLf9rYY1yVCtnq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTrrUG0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A8AC2BCAF
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772797228;
	bh=YYmHS0yiuxbrOHURRCrH/2X3gouaQWL22Nqtk/k0+Sc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TTrrUG0+EhNVBRmmhkZ77tSfJKhOr7wtMKPI+tvDnWZ0Pp4bxGVJGbcHJRIyW/fmW
	 Kd/IlVGkBiDpJMwHsLE7s1Bq34NzNCx/fbLWZRlxzHkemW06w8ndiwq/fqI2mIiNDS
	 bi/pHf9ubHQwkh3cm0hfZyXsA3xSmvh1WLgqE78Yo8fZrcwJ9vKTmtQtsovo4LGsTz
	 xnDaMRb1BCccgVYcB6xTvKCJ1Vx/caStKEgLUBtV1anLovlM3fHqRpRGzhOcy/Jh6l
	 EcPmw+q8KnEJToZgrb/je5kFaTYnvJlJC9pWzN6Cawg3Fz4zlzNfNLN8kQ14Z701LK
	 Qp6XKk80Et/ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9B19C41614; Fri,  6 Mar 2026 11:40:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Fri, 06 Mar 2026 11:40:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-1TBo1h6mU0@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 9B01321FC7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34151-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #33 from Alexander F (superveridical@gmail.com) ---
Created attachment 309553
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309553&action=3Dedit
Z13 lspci -vvv

lspci-pre was made right after boot up, before resumes, lspci-after was made
after a 10 second resume on 4th attempt. The offending HC c4:00.4 seemingly
doesn't have changes to MSI/MSI-X capabilities section.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

