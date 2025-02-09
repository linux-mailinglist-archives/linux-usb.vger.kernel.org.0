Return-Path: <linux-usb+bounces-20365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD276A2E04F
	for <lists+linux-usb@lfdr.de>; Sun,  9 Feb 2025 20:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE95164A9E
	for <lists+linux-usb@lfdr.de>; Sun,  9 Feb 2025 19:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60491E0E0D;
	Sun,  9 Feb 2025 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG4m80pC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49052136A
	for <linux-usb@vger.kernel.org>; Sun,  9 Feb 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739130648; cv=none; b=lfY6P7yKBxtCK3KJoLkkxC3n8o0A71G4OXRROLsW0UjOQqQkbSlFNNUrsOJjqz7ZeyIz8HCDDMKkLrN7/XGt2T5HdkAxhOahsQQ7p4zsSDJDyKb4tUr2upvIeb7yYviZYjNhviVc8wqOb/twG0pz+E3qkUADQlLvP0RgWm/EvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739130648; c=relaxed/simple;
	bh=RXr6zCnbRXuQqDCobbsy5uQyF9u9kysDQ8NLjy+SNSA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ri00xX9DjP70SOBXYiisWx0h0hH8sSAvrqTLE9t3wMg0FUcjdFqqA9RU1YsJXAXpQIZyS7K9KnbsVFGxrkJRvcYOvcG6cz7XnyxSdeBnRSAew86dN0+nvUWO51+cIRmDwAGnhGdQKwvc9l7hY9qjmnP0YhUNgaPmMJm4Ljt0yds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG4m80pC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFD30C4AF09
	for <linux-usb@vger.kernel.org>; Sun,  9 Feb 2025 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739130647;
	bh=RXr6zCnbRXuQqDCobbsy5uQyF9u9kysDQ8NLjy+SNSA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IG4m80pCKFR7Wimq3KkUISh9wCN4TrXDkm6XVw5ijAtV9c3ABWWxIxzsSgOEJLa8l
	 M5wnwBfkfxzBicKySLhiP8neuKUqRj6Hl/OQ+jBPZcPEIN0/9VlnPJzsvyghDWRLr9
	 s1rpX9Jhm4Bbb9gCdKgbli5wNFBS/leDuMFYhS8Hehdy4fikW6dy5GkcPK2+ITi/g6
	 0jS7xBz6BBvWhZMASOwbFQd8ufhLsbT5YX8Vqc/wgUu6NzBzikcNUjl/MwXej4y+24
	 s/vAkB6TbSBllyBKdfsyS8mogp07rycRUxpw7YdEryR0TYh02X5y0SKlSy6oi6oz8T
	 45djBmL4PpgRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A60E1C41614; Sun,  9 Feb 2025 19:50:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Sun, 09 Feb 2025 19:50:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-UqfnuDaQRZ@https.bugzilla.kernel.org/>
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

--- Comment #7 from Thomas (lyz27@yahoo.com) ---
Tried the shorter timeout patch and verified it was running with uname -v. =
 The
issue still persisted.  Shortened USB4_PORT_SB_TIMEOUT to 200 it is still
disconnecting.=20=20

Are there other values I should try or logs I can get?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

