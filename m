Return-Path: <linux-usb+bounces-15927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5CF996B1E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 14:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0D1BB25236
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373481991C6;
	Wed,  9 Oct 2024 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPYEJDDt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FC194C6B
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478456; cv=none; b=d2oMqNBjNFjGc5N0PTKP0n4CtILXGPv2bxAleldkd9lAihtJ5euSHVtF8LzYRwC8TGgdlLULVDMeVts2wycOL8oHMeSMl5gNV2jhF42byR3sFB53auuq4zU7+/EnaYmSXy+khEP+vlKSDDb/QY0XPq+vZWICgRCxrzs3hhgBAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478456; c=relaxed/simple;
	bh=XvYoU/Op0wxRoEhqCltyRmTK7/NvXWjwkz256pDtWIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BzL926hxqSxBO9kpwJNe6W6kTz2ZAnZJfcWgSXdny6fUYytgcaXfVWpG1yd3AGrPUbfVVog0jD8DQrLHiF0j9vl+Fwv0C8ySFUic25fdmp5nuI9D/mJzjASf+th8VNqAQaaXWdIxOeRKVOWL5w5+E9iRMvePmJPL+ZtjsTUh4aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPYEJDDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4375CC4CEC5
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728478456;
	bh=XvYoU/Op0wxRoEhqCltyRmTK7/NvXWjwkz256pDtWIk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oPYEJDDtxXypb9NsEOH2DVNHLCiGcXjP/Qg5QICU0LBLMp7SaSk93vtzJQABq2jO/
	 H/XsxOEh3TATD+YnfgMqwYGyweJ67WnMvJQLLnwS5eMCHTgviiPkcR8oux6/B+CdPa
	 Qknsnsoet5PlOtSwoZWVxNcnZKSCY42vTwANmHlDuqZzJCQ8firajqVXW3+MR4/XFs
	 Zv0ZWThwXpK4FiRnz4ayzdX0q98vm2XQyOygip08Elbrr+r93M8DSP/ys1baU22Iku
	 ddgmS/5tmD8ZZxh+7JtPP2wDOYKWRshPoByigJNDyOBzZy21tjrNLrGXwb3F95/SLL
	 IN1SSs/qKKvzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D3AEC53BBF; Wed,  9 Oct 2024 12:54:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 12:54:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-Qc39n2EOls@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #14 from Tomas Mudrunka (harviecz@gmail.com) ---
Also weird thing is that when i do following:

echo s > /proc/sysrq-trigger
echo u > /proc/sysrq-trigger
echo o > /proc/sysrq-trigger

i see message printed by watchdog driver .shutdown callback. which means
devices are shut down after all... unless there is some special case that o=
nly
shuts down watchdog drivers during sysrq poweroff...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

