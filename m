Return-Path: <linux-usb+bounces-21106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14DA46E89
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 23:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C0E188B4D1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 22:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010D725D8F0;
	Wed, 26 Feb 2025 22:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldVYF/nL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28025D8E6
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608901; cv=none; b=KBVbVpWEU+aEg5xQSZmuyHdFDeVeFSr5R9KMjnlZoLRD6A+AaSBol+lC/s1szr40XF6R713FZkQ1QHKPfuCMkBjMc4FI9reUJ4MIJDaYB3/Zw8Rm57zZ8BkUKhF1IYFc7r8vrC4U6+9oQ2MAeD9LBJq20ZMINw9njm3nq8y4RTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608901; c=relaxed/simple;
	bh=PczaervxjuwhOCoMW6awI6F3BggzexHKyAXKt/mq1VU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErKQm6RqRrkUOzEBsU3f0ECbrBceeGytvpIv4WjG03C2fyZcjT2W65Y6dJJ6PmGMZKFUSF6gJ7Hhsl6iIUpNtO8W5FQcPQpO6C2wpl0FeaQwyF354Yfjopx9wOZumEYE65X1jo6I0C7z/THier/OHNWxkSTR1iUAVVZA+zgueho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldVYF/nL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06747C4CED6
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608901;
	bh=PczaervxjuwhOCoMW6awI6F3BggzexHKyAXKt/mq1VU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ldVYF/nLfbBwq4O2+oraL/YRw8faKehfTkQlTJoTqviZNDOXYUznnpW8IQgO491IP
	 jvJA3gapyAjsOXAHp4XPBpBUD21krp2UbJcMHeR97nfVNJ46ovIq0Q95FCehSbliuk
	 wYJScMQBwnOoOscJOh3txKF6rPSZ+y+1RgDYIeVJ9Tt33Xqa/Mji7ROQh0+SdWzLZw
	 SjHChJIKaXfVGqRVTGxOPRmnCVhK3RBne73J0QgVl6iN+SI24lSzn+dhZEqDpz3KU/
	 2DPZ85EMJdlNCMBlrMvayiGOzhSJ7CAz2jktlHhIV/LDLL+pM3ArSlxeFgXQVK7MOu
	 3u95Lmt2EA+RA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE911C3279F; Wed, 26 Feb 2025 22:28:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Wed, 26 Feb 2025 22:28:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-KygN2xbvXt@https.bugzilla.kernel.org/>
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

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
I'm utterly confused as to why the kernel decided to "xHCI host not respond=
ing
to stop endpoint command".

I didn't do anything at the time. Wasn't even using the mouse.

Something funky is going on with 6.13.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

