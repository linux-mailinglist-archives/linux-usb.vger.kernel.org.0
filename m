Return-Path: <linux-usb+bounces-28898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14668BB90A3
	for <lists+linux-usb@lfdr.de>; Sat, 04 Oct 2025 19:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75303BDE67
	for <lists+linux-usb@lfdr.de>; Sat,  4 Oct 2025 17:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E43285061;
	Sat,  4 Oct 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/A3XIc9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2616132F
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759599737; cv=none; b=ApKFqTY3pv6ie8gXBI1lTmgC8bgd3aQr/KzHT1F9fklCdgcu0zr0oBFhKsHGCofVRgYyTm34o1+/Z59yhDcJm+odFTUYCWGNcjBPSCw38f6/dHsED1QQ+3hiTngp7XQ8c2kLUkIFB8K7DbpOVtC7rpxaZRpMgVo0TRSmZ0/vqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759599737; c=relaxed/simple;
	bh=nwXeq0n5wd9sCU3MiT1CH5d8csiIpjk/8C8WFULpycU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ShcQEcnCyRuPCgCkyLvoUSCwqhdacXUqCIYskGbY311iFOYnACcVBKubTTEYyjCKGoIT2TtqKZhuY1d5aSls2TDCGD/UKcPU7qfgRUFpsnWR3OZHQU2AHgk6+wH/9C89I6KU+f1UK0XYWfdDRBlh+189wgEF4UWO3Zc+UCpvf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/A3XIc9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 612BFC4CEF1
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759599736;
	bh=nwXeq0n5wd9sCU3MiT1CH5d8csiIpjk/8C8WFULpycU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l/A3XIc9Ng9MVZzq9xKgh/xNAJWtXvwHuYAmSv3WudRIXrS9b9YNicCBAvIU591Yk
	 CB4q54+kZjPAPqr5RjYJ+RiUitIUbkGFK1G+PGzrpX4yDCgM85kOr5ehCI9OnS7HNN
	 Yz4bzJNkSn9Wd/pvzVVSst/wbZ8sikQPEyfcfLZZ2uKG9etxRL4MnoBsTCk+rw+cel
	 ZLlUhCMvlvjGKZuBpCW2xNMNh+mKwlyNQ6prg5lpJrZjvbDXZ2geq2qbYK7iyNhrlE
	 /N/q1Fd0UHDWgy1ckZPjonUyDw+Y1q8g3q7EjjUFbW+UBOiGauX7SK+7k56KQg3z2w
	 vOm6mzs7mDe/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A0ECC433E1; Sat,  4 Oct 2025 17:42:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220628] USB disconnection after mounting file system
Date: Sat, 04 Oct 2025 17:42:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220628-208809-2i6VGGht3C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220628-208809@https.bugzilla.kernel.org/>
References: <bug-220628-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220628

--- Comment #1 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 308751
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308751&action=3Dedit
usbmon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

