Return-Path: <linux-usb+bounces-24361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E1AC687C
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 13:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EEAB1BA2461
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 11:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A27B2836B5;
	Wed, 28 May 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/cIcxMo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEC280A5F
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432445; cv=none; b=L5EiNQo5zEepBYivVHPaX3GHIo/wyaIv/RjxUW6G2sPCHZqHgK9X8X1pI0VVzYStPzZSXGCoTwHPUHt2QT0fakqlyolN9+Rim6ZjKflKraB2V8UqFE0rW5pXuaetk430al58CoPxqF0C4WjzAG8hVAhmgw1Gc2sItRgB+0qtj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432445; c=relaxed/simple;
	bh=VjNvD5PecTqcSgP2J9jF3WlrdKr0cnXcIc+5XwDqfbw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qAcSNSt7GDjJKzoeigN+LSGSS7U18TnX6L4eQZCYgmaF/cE8CERhs4ZLoChM/T79fVHcVF8YqcZbB0Ee4YlVbQVLUAUC4eJtTdyDP/zJhN5Q37te2x4OPiwfPp8/GHUwr00ZgClkr5hbGQ1qNtILA+FyeJH5hclkl/1D0qiAVGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/cIcxMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 813F3C4CEEB
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748432443;
	bh=VjNvD5PecTqcSgP2J9jF3WlrdKr0cnXcIc+5XwDqfbw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l/cIcxMo0uSA2VrJXKFyouJg6CUaZjcO5CNH1B94IuJsyHfQmnH9fPifAApAVaHz/
	 A8q+Q0Jxwq8DvH+a+PdHQVg6ZMdBWh86E74fm5ePgpHv7i0/aBvrAB8g9a+tDq0BcX
	 boYfoYQzl2OAzjIyaahlw4WLAm3YEciJcvbpbSGxkx9yylFVzpzn+ZByvcPIbGfTCb
	 f8KvBPQNhxW2/BYVPL/t9tk4TenKnWQS8z+om2WAf3i690Gf4aKJr3xmDYBN7cT0HW
	 5myonEbuad9bLr+LpmXDhzOiNPzN3yc1nfvgsFYb3o4txsIdYsX7+CsqU3U3WODymS
	 DPzLupY11zaww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75DDEC4160E; Wed, 28 May 2025 11:40:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220166] The g_webcam UVC gadget driver fails to enumerate
 properly on Windows 11, returning USB\DEVICE_DESCRIPTOR_FAILURE in Device
 Manager, while other USB gadgets (g_serial, g_mass_storage) work correctly on
 the same hardware and Windows version. This represent
Date: Wed, 28 May 2025 11:40:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: v4l-dvb
X-Bugzilla-Component: v4l-core
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: v4l-dvb_v4l-core@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-220166-208809-koNgpTXYY2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220166-208809@https.bugzilla.kernel.org/>
References: <bug-220166-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220166

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |v4l-core
           Assignee|drivers_usb@kernel-bugs.ker |v4l-dvb_v4l-core@kernel-bug
                   |nel.org                     |s.osdl.org
            Product|Drivers                     |v4l-dvb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

