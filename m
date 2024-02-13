Return-Path: <linux-usb+bounces-6311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2783852992
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 08:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103291C2285C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 07:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F185171BF;
	Tue, 13 Feb 2024 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faP+YWhZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE214F7A
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707808116; cv=none; b=FD7L/tRVo6+4bmK/e0lklhLc6yN5lZCOL9TCAqu+wO3pBKRVdkBQaGHzH9d6g9pP4eEON/VCjMRTfa6kTt7mH6HjnCk5FghaI18bhpfG71+lqLP2vtq/BiXIVzCvGjKGQzc964ULSKD30LNOH3opLSRdxmvm//ZIGCcEE+3XqIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707808116; c=relaxed/simple;
	bh=cHcpa3RDjQoRNyrCyvieqWZf84BIkhOg8Eea4s59OC8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iphdElfokdmFkofAKrTv14NW2VG8wJ90dQwBvG1+DJmQXwgcU3PP7/qvTmWUaDD6wWKXq7z5Bz1UuJG2xxX1OL+SxkAa3z19Y0srcbEtMFNEglbI+bDQk/k51nbid3Qne9utZrMxcXU94v/sjhnUWJAesfZyAkW95QdZh3GamDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faP+YWhZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01AD2C43330
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707808116;
	bh=cHcpa3RDjQoRNyrCyvieqWZf84BIkhOg8Eea4s59OC8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=faP+YWhZUg1kwmHBq2n5kMfowtbV4JUebTW/fF9vJnuVLTUka1WfLk/kSAOIzb9Z/
	 Un11s1OMpIBJI8nqoqwuLQV8H8KCi9mBKy/lP4jfov8mI0z9Vz357Ne+nUPLsLPyeh
	 1iQuutcRi/rqw53cxSFScV+727xe7JXUKChY4Pr/D95LVqNC4veGhEw5DEJ1WttLz5
	 e3/NXAYM2PRlOm99u2jaFfNHaTSuGKSFpYbKDh6fsWqHrk6kJm0LLK6M+oqvRxm6UK
	 YXi8SgKaQJcuo2Hc//aGX1sYe4pFVUN2mpikK3NJ2uoJxCYEPfE8viWDQvU4uOB77V
	 wOr7SUYKT5TSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7141C53BD1; Tue, 13 Feb 2024 07:08:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Tue, 13 Feb 2024 07:08:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-OsfHN85YUB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #47 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Hi Rustam,

Can you open a new bugzilla about your issue where you describe the exact s=
teps
you do, the results you get vs. expectation and attach full dmesg (with
thunderbolt.dyndbg=3D+p in the kernel command line)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

