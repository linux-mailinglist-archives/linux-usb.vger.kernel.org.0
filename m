Return-Path: <linux-usb+bounces-8011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EFF87D5EB
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 22:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED90282D19
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 21:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D14B45972;
	Fri, 15 Mar 2024 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozvSAthk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89DD51D
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710536572; cv=none; b=BvrxcfRf8bwu05e+xJhcDJUXFaXIauYVpZcn6EoZvh+vNv0lrXUrkwY/RM9qwoTohxSHA3EQGwCEz5/J0b5SDBLBCIH3er3LyXfkV2p8ztJKzpGH6/d1TEh2Yhq7uHfEvhF6GxIOQawC5hOpdt6qzyB08HWDU5+VLHG4bdBQ7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710536572; c=relaxed/simple;
	bh=g8RWJd1oNrfPUmAHcCaBJ1ZW7c+uRqf5D4R4iKlqLig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wum7wC5YIa70WKdLBlvLLkWRBePTznWGfN7JkTEP6M62dx1jL2noZ/olVM4j7GjHP5eh9JWB79G72O26dO4wxW6ELoSVRTta5Jc6qJHM8cAy5TWfL9LmZrmHNNEFjtvUFnZqtBG4wukB7ex1rR+XgxnK4RPMgiSr+BkWDYGJXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozvSAthk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80CC1C433C7
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 21:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710536571;
	bh=g8RWJd1oNrfPUmAHcCaBJ1ZW7c+uRqf5D4R4iKlqLig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ozvSAthkeHUEBW/aWYfHtPP4hTJHTfrsi5jTD6+TtUx0HZTBf+fu+TIIGgDACKRvl
	 ruVLfssULOwuoUgLgbJ0yGLuubO3ZiNjAR1YVTC4Xqr01O5Qkbt6OZ7DVuZahHTYgD
	 yImTozWY1zQTtSESXZ9KWrImpxR68LSVUA0Gn/2fCN9SKKSVdSQKSfTIpzZ3UIcIr1
	 Hb5AIkEREIZIF9Cd3mcbUIKKYyrxbS9l/QvS4FyaBvkaXVzWLcLm2PW6zADdTBC2k2
	 U/5+i5OeOmL3u/h1+dfe6G3eHoVd0UccikTQGn+GqJv+hnM80NfM04P8xY99gWL6ps
	 Ug1ubhOJS60Nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B928C4332E; Fri, 15 Mar 2024 21:02:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Fri, 15 Mar 2024 21:02:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: corngood@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218546-208809-CJEdtRTHnJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

David McFarland (corngood@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |corngood@gmail.com

--- Comment #6 from David McFarland (corngood@gmail.com) ---
I'm getting the same symbol on a Dell 7430, but I don't see the xhci_hcd er=
rors
you listed.  I used dynamic debug 'module xhci_hcd +pflm'.

It started occurring with:

0c4cae1bc00d PM: hibernate: Avoid missing wakeup events during hibernation

However that's presumably just exposing the underlying problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

