Return-Path: <linux-usb+bounces-18936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF249FF3D7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 12:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CE33A1ED2
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 11:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E8212C470;
	Wed,  1 Jan 2025 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWEIodfC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E3EACE
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735731216; cv=none; b=alqPO3gFi4yMd1IBk9eVbKhNj1UCQ+bKNSn0TsLXf657GpeVERv3DawDy2BT7VsY+VcMa3CA6DwyFTiSBdAAFSitx8ZrZIXujq1RGEc0sFm7lOsZDZqGoCVLvNRNtOxvz1h8KxpXrcqyqa3e1cirl42Xe20Iw1lGNfHCGqqS3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735731216; c=relaxed/simple;
	bh=rPdJkZhwQyFrjsxnBQZd7aUjqcBHIX/UmPS0y32/j20=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HFxhVkL+7ln+jLWZN+RdVKu5X3aMauTvfbSd1w4dg0GyLAPjVEjRJBCUMPxNl1BKlLKjCsedOjF3EOMZ+tBnPk4OVzP5r1BN6XghYv+wlZLzif5wx0yRnqNwYzYNmd8sekNRkB9QLpvLv36bjhBqAyzWPSVC9X1NwB9jdRxiqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWEIodfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDB45C4CEDC
	for <linux-usb@vger.kernel.org>; Wed,  1 Jan 2025 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735731216;
	bh=rPdJkZhwQyFrjsxnBQZd7aUjqcBHIX/UmPS0y32/j20=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KWEIodfCuJj1epjr+XZvCekBWt7D0mCrkmgn5TWO5/MkDEm++5RmjayxVCoGRo8GD
	 hUoBWU1IfoKB+cGTkU3a5jRIRQZQNICOUr5fLWgsG6nyqELiZZIgODVkT7Lcujf7eD
	 HzJ9WsiXfl38mI/SJyX59l23oivl69Iw9fGWd+AeTegjigzwYs9Ze7GQ2vXX3Y/9PX
	 SX7Qg+rTv2ewkjAtQgkrD5AkE+W72d3S8G7ecYu4SBgC9AeIv+wZQuWPHn+Wwcsgua
	 2mJx435s/wqQfFXf73jWYbQXJ7IywBFclogs7eEhaNzauKoqC39hHcOG9VkpSGiCrZ
	 ln2c0oUrmyQmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4A83C3279F; Wed,  1 Jan 2025 11:33:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error
Date: Wed, 01 Jan 2025 11:33:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-vYL2sGffti@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
A similar issue is being tracked here:

https://forum.ubuntu-it.org/viewtopic.php?t=3D656839

Please send your _first_ message to LKML and CC lucas.demarchi@intel.com and
ukaszb@chromium.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

