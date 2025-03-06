Return-Path: <linux-usb+bounces-21423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA59A548DB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 12:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B0B07A5BB9
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 11:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B098204879;
	Thu,  6 Mar 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpgdWYUe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849971FF1A2
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259717; cv=none; b=R72cnnihM5GueKqBGq/HhaMekia9hwHgHCdMUq6MLLlscVnrXQ2r/YSs1JRjmHZGaFVgxgEikO9MhRJIFbVpnkhMjRE08Z8OttKXcY5AXQgppmWJvESqRL+EAWTkgdKfXkCmrfHHkWByM0RNgjf2lFjSwNC0ED98Io2kgIrBk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259717; c=relaxed/simple;
	bh=wKGJXw7TV93rD51PexWZjiOm4mcjqpTcfymQFYrvYgY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hvkHsEWt4A5ZXPJeqF26Pq5s1e/4KvK3xnWVGK6UDj0zvQKCbdPphoI08392CcqpFLAgb233p7aJp4tdIAWsTli/vEFiXtJg84kyKAwUWD7Q2g1NfQdFyOO5KtOhsRrm9v4X00n2UYAMbDoaN5AgW4RQSlTeO7+8rqIhvsPxh1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpgdWYUe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF116C4CEE2
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741259716;
	bh=wKGJXw7TV93rD51PexWZjiOm4mcjqpTcfymQFYrvYgY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VpgdWYUe6E7g6OVoH5W1i3KCe3BkgG8qirz/cKIDfbjyQju/H6orRwJJ35OMhtVtx
	 IPVN/twDovamnUkBVNw/wcvHIEEscXbZP2SrPNSDDxi7npfOCtLq7Haarotq5D+89O
	 E2xD6ERRCTT/s+S08Ja43Tn/yV0hc2cq0gElvnR5nb1kwCjfReNjnQWo8//t2kNc4E
	 2jkyT/hGR92DcP6P002YPYrb7+s/Qr95Xbixr2e4dKWcJNvlmf+Qv7sEqG/hGWfbLM
	 DhVV9s5LrOQp4WQISkqa1HD8aysL0xNmM09ys0yBvrQstXP36su/jPxBKP6//3lLY5
	 rg/hQyonyrV8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7000C3279F; Thu,  6 Mar 2025 11:15:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 06 Mar 2025 11:15:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: bugzilla@academo.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219824-208809-7sxfpJSLm6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

bugzilla@academo.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@academo.me

--- Comment #15 from bugzilla@academo.me ---
I found this issue happening this after resuming from sleep. Downgrading to
Kernel 6.12.9 (6.12.9-arch1-1) removed the issue completely. The error mess=
age
was the same.

I am not much knowledgeable in reporting or helping with kernel issues but =
if
you give me instructions of what I can do to maybe test a patch and report =
back
I can help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

