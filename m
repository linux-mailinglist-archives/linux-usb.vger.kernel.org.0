Return-Path: <linux-usb+bounces-20961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86515A41598
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 07:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDD921891EC1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 06:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADE0207DFB;
	Mon, 24 Feb 2025 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vP1HajGV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF217D2
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740379463; cv=none; b=BQaA9FWh53pQr+mkoPhLZ0QDqYojmZp7BY1+XIkI4z+xRFnxykQKVaTJO95ytFag5rQfS3eUXal0mhyofU3jUfmDJlWyhnWs2gwwty78MkTsAvaBpwnKDECQy3b3mLWvJk8bRQRh/wNMj/wf84QTD8CVOGEcPylqCee+4KjFU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740379463; c=relaxed/simple;
	bh=oT6OFP1g8n4VddlQWKqH3Uo4C2HnuMGTOxCxXpHX5SA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m+AZoLrMT9OzI08t28eFIXXkf5UVxcGWLNlNbnfL5eAlsrPNsUYaeKs7XM8514x7KTjZB/jwxqPWfchz04aKt5D1HH476PkJXScZfiTrd4eEhKTJHRoszXgfEHQvB4ZX4xrTmjtMFptSoNjNRWWT7+vkhYYefFbmm9d0XsmjN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vP1HajGV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB1CAC4CEDD
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740379462;
	bh=oT6OFP1g8n4VddlQWKqH3Uo4C2HnuMGTOxCxXpHX5SA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vP1HajGV03EUQEg7zvX3BGauvbOfpM64NZT4gbjEZTV0C15fSwyX1KpzB+s/fqJp0
	 Of+AAHyJsHkNixnXk8UNtcYkub8BcVBWO3bPQ3n26iFJGTK6JG/4KiToMfJZ3YAL4P
	 C2y5lzUcj710ooyIIed0tuNaVwId16JajRQXbLAFLXpnhcgJ/vfG0zI4GjzW6Jn1U/
	 6nzETQgTETt/lhkDakbaz/RlyWQ1sPqi+QPy6MocmwgCQSGCSwMH39/eZBfavJCq6t
	 z+iOFqfnKV+Eqt7yq46ynQuJ3jYLFvrFPguCk4HhjKuDnSOtjqlircbcxKFdsYiODy
	 alVc4BhKAWgCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FEBCC41606; Mon, 24 Feb 2025 06:44:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Mon, 24 Feb 2025 06:44:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-Ew9vXw0fJ6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #13 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
That's an option yes but I would still like to understand what is going on.=
 In
order to support CLx (with ALPM) we are going to need to access the sideband
(and this applies to Windows too) before we setup DP tunnels and that might
happen pretty soon after we enumerated the router.

I'll look into the traces next and see if I can identify something. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

