Return-Path: <linux-usb+bounces-26965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F176B29BC7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 10:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097FD18A7FE7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 08:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D72F39AD;
	Mon, 18 Aug 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx8R2r/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FE288505
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504828; cv=none; b=SPA35A2qvGFGfCddojyFKZs6LgNclMPA8qfkIoRGylZ3c+KJ8MhYhBRS8aHhw7u4FGcTgzf+dqNigMdqJ5UinAlzXT2ZpbMiiduEzrfvRuwCZcjFvLKOJLQICdoSJQqe7C1iflbsHq0ZNtaOfCh9BLa+jaPlGlFmIr/HZ02avn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504828; c=relaxed/simple;
	bh=CTBzZZ66Te0zR5Hm4qTvpCaEqoTx9FpLeXjJysqRyuE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NvEhQOccfRXEvbNpWA43XQN9MZk1m23IdoAu91SCaO4vKaJQkEP0BJn8l3t7YCppQsSUFRRHA1hxeUtajYExB65FWTlJe02ySAvIaiwDk9TOIaNA1pVtWbnUUNB4fppoQjRDcKnNtpqQdfS0c9icKOLUlME08ISdb6sx6N56fVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gx8R2r/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D468C4CEED
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755504827;
	bh=CTBzZZ66Te0zR5Hm4qTvpCaEqoTx9FpLeXjJysqRyuE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gx8R2r/m99RlXU6iPrFqQggRFE23UsQl+KHEmg0cJbBD4pj24CSrvx/mcPOmVTV2D
	 bj74duWUNtHSwFTGiNSQaiszOsSNBRVA9KFP/RrR5NKG1b2sLqUyX6hkfyKQpNvOn+
	 QFD93XXFt/HDn2d2dP6QJKqASWDVrY+Yikoc/THUu3jyl24maZMBDOr2tX9MoC4yUp
	 CfvhqZ0Yg1V36bitbIfjrfV0YB80gfBHZFsewH1SNilOoHB9wTo3RjpyCBcHarLKz6
	 At9Q2icyrXGwk3tBOhkmmng0rUQ0DppQ2gTkQ7d/fXsjIbbLTn99wGm9kdrracdSdR
	 IBSrxDbri1MKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F461C41616; Mon, 18 Aug 2025 08:13:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Mon, 18 Aug 2025 08:13:47 +0000
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
Message-ID: <bug-220460-208809-zZqMR6lMjA@https.bugzilla.kernel.org/>
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

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 308513
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308513&action=3Dedit
Content of `/sys/kernel/debug/tracing/trace`

The bugzilla.kernel.org admins fixed the issue, so I attach it here, and
invalidate the URL from the last comment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

