Return-Path: <linux-usb+bounces-26221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F648B12D0C
	for <lists+linux-usb@lfdr.de>; Sun, 27 Jul 2025 01:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD6C176528
	for <lists+linux-usb@lfdr.de>; Sat, 26 Jul 2025 23:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5E2264BE;
	Sat, 26 Jul 2025 23:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXJ+Jocu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE7259C
	for <linux-usb@vger.kernel.org>; Sat, 26 Jul 2025 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753571860; cv=none; b=tm44VFKA3F7ybz22dXMH+NPuDkDNV4w4ih9jgyAieRLqJ6UWwt1Ilu/bSq2ymmzpUbNpHjn4qPVp3wkjcyvRFJJeiuYMQCvQN+K3+9kOMepTxu4xsqjjavz6QBw1WKv+kz8z69U2jYuX50oGKo0WKLqXg0jpW5Wtfpg5ta8oBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753571860; c=relaxed/simple;
	bh=9LlZKehDUa2OkW1UGe88uwTdEOVf8tv983y6dCyfHi0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pf9CvDStAfSh5N27S8h0at6hm+rYVO6N3mtp023m8cmbO4SidvMGDgrBh22BzeSGC0wQsntohfxYpKeWTWV7p7a8LViFngxQiJzH/eUePUzEcSKYLsIKFOkF1yIMB52XYjOMAA7sKPmOlDoiThJKKhSPgg4M5shk1nd4OmHftIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXJ+Jocu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38A8C4CEF4
	for <linux-usb@vger.kernel.org>; Sat, 26 Jul 2025 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753571859;
	bh=9LlZKehDUa2OkW1UGe88uwTdEOVf8tv983y6dCyfHi0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KXJ+JocuaxcwcYk9nRNiUjaYRaE5tmm28cii1UZySRnNihbvmxvaQrKRmbJ5uhkPF
	 KNpxtoUx37vNxMM0vNMh0pZ8DeMAa0oOZEpumiWNAgEV8emZCEXHHQY3JGKJ+VqN9s
	 r26VCFX/Xu4ACpRCexbrInSD6PBtWPtTDqN7gDc7+9mFq4f+4BXSXmwm4/6kGjsXqz
	 swTGI+XJ0n41QhJBDuMO3EDnxyMCV38hMTIM6Wl5Tkhww2RpoZOpj1fNrDH3KeEyP0
	 4iC7+RaeunGHMHB5R7rCh9VBykuIMPZgxtFPSJikwTV2gkq3c73ziKwRMmwtsR0DM1
	 6GIrpVzlGSJ5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 96377C41614; Sat, 26 Jul 2025 23:17:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Sat, 26 Jul 2025 23:17:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-10eHOUrDAV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #13 from Ryan Walker (fewspotty@protonmail.com) ---
Is the issue resolved in the release candidate? I still get the issue.

On Mon, Jul 21, 2025 at 3:39 AM, <[bugzilla-daemon@kernel.org](mailto:On Mo=
n,
Jul 21, 2025 at 3:39 AM,  <<a href=3D)> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D220238
>
> --- Comment #11 from Oliver Neukum (oliver@neukum.org) ---
> The bug is marked resolved. Do you still get the issue with the latest
> kernel?
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

