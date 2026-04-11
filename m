Return-Path: <linux-usb+bounces-36159-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGo8OrJG2mkrzggAu9opvQ
	(envelope-from <linux-usb+bounces-36159-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 15:03:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F53E00B9
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 15:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A629D3027CDD
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 13:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9EE21C16A;
	Sat, 11 Apr 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQBe28LL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD27214813
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912618; cv=none; b=pOZ1xwt3NGTvvpQO8c6osvityU8Zt1jwryYKjPfRlNR9im3zxKX/TEFt3nqGM5+/4w9yzbav2WNEjKNkXLVRyuhbcWqi2suoGh2/FJ+EjLImVo0h9MrSjM897pBZxMaSasjS++2DaWyUbB5PhKdE/lKDpsh6AD2kNh3i9G9rUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912618; c=relaxed/simple;
	bh=5CYKuCsSiuv1mgUyGTCWvO4Y5akQsJI5yffBif8XJPk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z8kK5Z75eEtAqfXEVHmD9Tu/4m+tI3jRE8NgBmAF/wt0GH8LHJzzdyO1VObcNYXzHvHnz6gi980lR91ZIgbYdYOpEzgads8HHg1AoWDPxXqLzQaYtvplwtyxzD1re44/iMOvXWMdYRhNrmytt/SdfAYhCMF4XkjA/kBPjuORh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQBe28LL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20902C4CEF7
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775912618;
	bh=5CYKuCsSiuv1mgUyGTCWvO4Y5akQsJI5yffBif8XJPk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KQBe28LLUILFd+TLLj6wMrVX7oG9F32mbgKLyJJeXIYAWVQF3oxrGfh5el4nJkGav
	 3pA5sr9EqDdkJelSVSekFylfQOWe4VPXrbNKI8DlnuffDyp84No988M4Y7rWh+IqRS
	 wGDDPyv+GhTLM4eXcM7c4anL7ihR01MTTkEVkGWOTU0LPrdZLgaBpF/a92iCaWgW/M
	 4lM0qJyEAgPRVSaUglczP09SSOq5EOzITsO4HUyPONSqxhIK9Z9eTJhloj0k0w0cxs
	 pvcUSbX3ynjQXmLMPG+P5ESaqCPOT9WEcSZpKHLwVWhi04KbamXSwfGQzGqtsTxYv4
	 ahKG0upFz+zOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1214DC4160E; Sat, 11 Apr 2026 13:03:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sat, 11 Apr 2026 13:03:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-K3hriMvrw7@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-36159-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 7B2F53E00B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #6 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
This shows UAS driver unlinking URBs related to timed out commands as they =
are
being aborted, but I wondered if anything unusual happens 30 seconds prior,
when the device stops executing SCSI commands and makes them time out.

IOW, was there anything related to uas or xhci before this snippet begins?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

