Return-Path: <linux-usb+bounces-13814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564795A4EB
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 20:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02AAD1F23C16
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 18:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5286A1B3B14;
	Wed, 21 Aug 2024 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDRC01bz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22B16DC15
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724266461; cv=none; b=N+B61tdlS4y9RtTpTM1KLo/W95gRjx6yrCP6wjEeId0yvjOTHBrVzPmANzzC0xJQL+lHZ28Q23C4Uirv5v8I/Hx6youlOBqyZ9/vmnyFAkL9AM93Xii+OF6Yta51oxznsARDf7YUA2Yi854b9kDEZji3VXL+7iyrfIY0V1+miVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724266461; c=relaxed/simple;
	bh=AL+CJfW1oFMDmMuubCyhtaHR+FbzRG9wFNCpQzmWVmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5ocMmYS7q0ZNqe7gdecCokBRisgyqBxyUZtM2wh+WaCDmvNVpZ1m+ExDH21l6JeGahFKPNApONwLRFzg/OH4MBCnOQ8WfTNk4F3aXTcUTnwP/66F/bGd0rg4ILyYUb5CviY6VG2gb3ThzRMLKuc51+E3EytXHG1jMiVcASsCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDRC01bz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E2ACC4AF10
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724266461;
	bh=AL+CJfW1oFMDmMuubCyhtaHR+FbzRG9wFNCpQzmWVmE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IDRC01bzqWkl+Q2aNeXSHPCv1PivzZuydCzbUFITnD71aQh3ErO4A8NpyK53769yU
	 ukkcJ8MaDF4jc63GHP4AXLc50B/fK5faVX4aENI9rACGLs51d4nI3pI42s363pDVVd
	 RASNOi/pQFAkh66pegYMK86JhU4BbtKkEf5dat4psOKmqkhBdU+Aa9ZJno5+Wp2YTf
	 lMl8xKXB1SWyDlc9eJHvPvDo3XiIEt90pZkNdyIppv4Uy9k1o10uti2eatN/ty50pv
	 5zPWdvQZfswwtvQoAXTBk3CULUqL9L36/bW3CtRAiz6I1TQ108yof82AelW1erNVzl
	 y1c9jqHQRoJzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56D2BC53B73; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 12-b020nr - Charging over USB-C not
 working
Date: Wed, 21 Aug 2024 18:54:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-217511-208809-HtHRlWMVGh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-208809@https.bugzilla.kernel.org/>
References: <bug-217511-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Platform_x86
           Assignee|drivers_usb@kernel-bugs.ker |drivers_platform_x86@kernel
                   |nel.org                     |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

