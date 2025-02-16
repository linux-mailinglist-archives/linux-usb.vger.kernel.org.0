Return-Path: <linux-usb+bounces-20697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4EA377C2
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 22:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FA2188AB6F
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 21:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4C31A3178;
	Sun, 16 Feb 2025 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIk0btAx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BF1A23B5
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739740796; cv=none; b=WGjIxyoF8JoJ9UZudpIR10BeaQL+ChjUy5wuyoO6SMzzDFa8VKVa8hndBpCRwZ4BqlZRM3R/0v91EV9chBQ51Mws7N/Oa0qSG9jt9B/JI31uN3qbN9+37tI/koENMtrVneYGt4Hs3Oh3U6a1ZRZySfTMqfudXoqnjJwSnOSSRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739740796; c=relaxed/simple;
	bh=KinCTNLjjb1HKX1crvn8NU5UI6iy1DJCfVKyi+5agos=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Da5NwcPQ0a/1sLq5UPKMbZdGhXF+QUSlVfIn4RAfkLMK6vFu5cGSOoxt2hHl7TNNaLM5YQborTHS38WjpU55gA6vP9TqiWhlmZsWDtCx/uAhcnRw+ZiuPp4GcOHkBkHNxS/SF0fbxHUH5E7nnSlFoWXCcVy9czvRLgG/K0Ko5/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIk0btAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B0B1C4CEDD
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739740795;
	bh=KinCTNLjjb1HKX1crvn8NU5UI6iy1DJCfVKyi+5agos=;
	h=From:To:Subject:Date:From;
	b=TIk0btAx0QCnY5x1qKz8ZNhTrG4zyY7bZDs5OkRi7eCtlFRzEw7MeT4ltiX28sNcw
	 1oU5O9FGcOmVtuOz/IkPsSR/+E1bC3kyQWgtWGzoWu8+GDM7ASsCwsL3AXF1sPzmIA
	 QvrRJ5tvwFoGNsTSKTkvHMR5kU3ZaAXHVi7KuIGPR3he2bRpJDuSZoSqfY5+l4A95g
	 gdj0/6J/bg4QL3cXlEUfYB8Csi0UlHYL5vAtV/CnEFQOskNP3zdYGD6XyUKJH+ynZw
	 rT0FqD/DGrYQsRgEXxaj1uJhnZMPRhAUpOEGYS9UKF12mNuciBfHO3YzgQqV2mOsSs
	 kirykIMCJ8HRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A8FAC3279F; Sun, 16 Feb 2025 21:19:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219789] New: [regression] Moving Logitech mouse causes WINE to
 lag
Date: Sun, 16 Feb 2025 21:19:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: esteve.varela@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219789

            Bug ID: 219789
           Summary: [regression] Moving Logitech mouse causes WINE to lag
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: esteve.varela@gmail.com
        Regression: No

I have a Logitech G502 Lightspeed mouse, set to 1000Hz polling rate. When
moving the mouse, wine lags. This didn't use to happen, which feels like a
regression.

This issue started happening when upgrading from 6.6.67 to 6.12.7. Downgrad=
ing
causes it to work again, and for good measure I've tested an unpatched vers=
ion
of 6.13.2 with an exact copy of the 6.6.67 config (make olddefconfig && mak=
e).
All the results for 6.12.7 mentioned below have been re-verified with 6.13.=
2.

Since upgrading, moving the mouse around in any WINE application, including
games and other applications, will cause the application to become sluggish.
This happens exclusively with this mouse, as the laptop's touchpad and
trackpoint both function properly, as well as an old HP mouse that I had la=
ying
around. I haven't tested any other input devices beyond those listed here, =
all
the devices tested had a sub-300Hz refresh rate.

To rule out a WINE regression, I've tested different versions of WINE:
wine-staging-9.22, wine-staging-9.0 and wine-vanilla-9.0. Only when I boot =
the
6.6.67 kernel is it resolved.

I've read that high polling rates can cause WINE applications to lag[1][2].=
 As
such, I wondered if the mouse's polling rate had changed across kernel
versions. To verify this, I used the evhz tool[3] on both working and
non-working kernel versions. Both 6.6.67 and 6.12.7 reported around 1000Hz =
for
this mouse. Using libratbag/piper to configure the mouse for a lower polling
rate did make a difference, but I had to lower it to 250Hz, as 500Hz caused
(more minor, but still apparent) stutters. This seems unreasonably low, giv=
en
the reports on the issue are always about rates higher than 1000Hz.

How to reproduce:
- Connect LG G502 mouse to computer using either the wireless dongle or USB
cable
- Download BGB (https://bgb.bircd.org/bgbw64.zip)
- Run the demo game in WINE (wine bgb64.exe bgbtest.gb)
- Move the mouse around, notice how the animation starts stuttering

As an anecdote, when testing a directx input latency meter for windows link=
ed
on the arch wiki[4], I only occasionally get some 700-800Hz out of kernel
6.12.7, whereas with kernel 6.6.67, I easily get the 1000Hz. I assume this =
is
related to the stuttering as well.

[1]: https://bugs.winehq.org/show_bug.cgi?id=3D46976
[2]:
https://wiki.archlinux.org/title/Mouse_polling_rate#Polling_rate_resulting_=
in_lag_with_wine
[3]: https://git.sr.ht/~iank/evhz
[4]:
https://web.archive.org/web/20160327105037/http://razerblueprints.net/index=
.php/Download-document/18-DirectX-mouserate-checker.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

