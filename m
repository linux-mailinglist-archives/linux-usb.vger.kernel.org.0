Return-Path: <linux-usb+bounces-27189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E8B3194B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 15:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ADF61D21B4D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183F22FE58E;
	Fri, 22 Aug 2025 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3u3ck+Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BE28BABA
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868814; cv=none; b=AqsiLCHuTfw8Ox7uv/nqPJ42o7+pg2J9CTZShLKJwWjofPFj9NsMXS0CZR7qTjyrxg0MmYC14QzlPPYnDrVyI+vwO+t2cY/pfxFUm/NariFx0ENEq8S6caoMJ2aQGysULEH1JTbzLZO3IAk5wGXkNN00IQjnQm/APBHlN/9x2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868814; c=relaxed/simple;
	bh=ahKFSZ467FbpikHdfcFrVKQP4HcgaJlW4Rm5FwhJjfg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrtf7cKRbNfNFsh0qVlehQW6Fej3Q9VhRS7EvByBDQ8/w8xetGqLM8+gXp/Zp9cboZtYg4ASoMQbqSZBM/qkVcmU88wOpE3k7/f/xRxAAyMLQcr951TT7ta4L0qUehYuMJJcgIxzF1mpj/Xq5M5CwGbuuHObYahIW8LSW/HOb4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3u3ck+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 702BDC116C6
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868814;
	bh=ahKFSZ467FbpikHdfcFrVKQP4HcgaJlW4Rm5FwhJjfg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s3u3ck+QnAHlKyusQlPKDEhmlrSeMV/r3fDpF3s9UHQAz11KeG4hgRrmXuMCUQ+3X
	 Ad8Gk7Kd6mogHPMomsKe7qZy4qC4u3CRX3WTyI//UIu8+ui17Vh4hekSFyXr/Z3F4e
	 BlYK7sy5vSffuHVN7t1nj8j/AwyrLsyyTcvFyf7HAr/yJYJxjTBv6fS60vzfD2p0mZ
	 G9zpqHuxzn7M/JegcBI4KsWLpjeg73cILPKkgyibu8CGKSdt3129UIjyKxys9qyzeo
	 ULAYCGjfiBVfkM4Anp0PMYMxJRmzGmXfEf7BKKemVZ4J/H0FjM5zbBRc0EFPvLMY3s
	 5DnYSolm3oE/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62C4EC4160E; Fri, 22 Aug 2025 13:20:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Fri, 22 Aug 2025 13:20:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220460-208809-aSb0o5Zsyz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #10 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
Created attachment 308537
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308537&action=3Dedit
Content of `/sys/kernel/debug/tracing/trace` with LMP plugged first into le=
ft
port with errors, and then to other left port without errors

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

