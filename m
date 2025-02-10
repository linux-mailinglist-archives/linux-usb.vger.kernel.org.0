Return-Path: <linux-usb+bounces-20373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8DA2E573
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 08:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F788162892
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 07:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F691B87E4;
	Mon, 10 Feb 2025 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNi3A6KY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C81B86E9
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172647; cv=none; b=HxHkxc9rsWe3Hd6N8MMkS3rF2gQh3BjocP6G4YZBq8zLKMejtyxnQ1cabYkK3ObsSLm71WbVgv3Ftf9XjPqEHLYKP9f80AJL075hm9C30JqH8NL9vS6iBqO8vbxxeQ1fWH5wn2QfP3srg2+u2UL6beL5jw23rZ5Velp9gTTii/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172647; c=relaxed/simple;
	bh=GQC18gx9NthHO6SI7/RSBYfzE2hm6cVCmEBSq4AkrJw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XVfXOWNzVDKV9OYf4i+qKP8nOFVPESZbSY2Rv2qaars+VYVNK7bwdubkt9HX7jUXoUKrNRkKpEzcR+SoTmNXfmitGb7fVdRvSLVIMyUnJcFVU2kcrBZdzYkxSGnPPB8xZ0bVsqBqPUImR+NtaV6iSxKnRcoNkjkWJe08j0QJcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNi3A6KY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68CE8C4CEE5
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739172646;
	bh=GQC18gx9NthHO6SI7/RSBYfzE2hm6cVCmEBSq4AkrJw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YNi3A6KYZJsNcJE8S579iCIIRGYTE0lGTmjdgSgkge8nAkWvyHQ9sDN9r26chB4fB
	 Qv4p1kX+GrfKFFTIKl9XAvuNgCFgsnMGbNKLc8Kg5zyi3GntcVjVnLqXbg/uzSGN0b
	 8oIZWQ1Jj00QRGLBj8AajSJo8Havad5IsA+Y5GVKxS+7goJvbykOcOkdIG3vnJPLD4
	 GefzEcv8rAPgUeiqvRgJ0bm08sEkCRT3jUnPszdZ96ALufYnBtbWimT9FLDVZWHrW9
	 RxKpWxUk/Tphuz6PwSKCXGk8cJaUURiZjjfOLLpkC294oDb4X8YZqVHDuO5YLQ686K
	 vqkvfhTp9ngTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C259C41606; Mon, 10 Feb 2025 07:30:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Mon, 10 Feb 2025 07:30:46 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-kaqxDbEdyD@https.bugzilla.kernel.org/>
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

--- Comment #8 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 307605
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307605&action=3Dedit
Skip retimer scanning

Can you try this one instead of the previous one? This completely disables
sideband accesses done by the driver. If this makes difference then we need=
 to
look into the access patterns whether there is something we need to change =
in
order to make the Pluggable device happy.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

