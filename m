Return-Path: <linux-usb+bounces-23600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12602AA5B85
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 09:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A617F1BC3581
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 07:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD48B270EAC;
	Thu,  1 May 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loqu3Qkw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5661726F463
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746085539; cv=none; b=pDcQOzKJKNwNP6pJYL3B0YrRW+P1JUiOxFMhbje/iU8qTJBI8yS3ZCS7nZ052rzs+gJrnrwPa3L0Ia02TuWk7dnC9DXSPNuBu2YvFLuoGaocN3k+nHQLiLHkR1uG0pK50fYT1gFhN5fAyhBopU8q0T5Io4hiKxLWaOqWXD9cHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746085539; c=relaxed/simple;
	bh=mFvKwBhK4F31cQ49fiFpEJmre3Tp5/yHUJqPMw72Poc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkLVYhiuOWVWSUkMq0FXZPvH8vPX+pl7m9awPLWWUhhQ9ZpYFok79Q7iWunJJPmhNWHpSy5xhDnm6UdUNtmvSn+Yb1C+FXmBbP6aLg9uHfZjXSZ9BVHXAAi9urbKK0mVrZB0YzY/bnxn/hcipG/7feKvsILMc28drx5/A5vtOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loqu3Qkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6C3EC4CEE9
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746085538;
	bh=mFvKwBhK4F31cQ49fiFpEJmre3Tp5/yHUJqPMw72Poc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=loqu3QkwDHkOa1+ch6zgZ5e4JdNpQ0r3IzZ2xmc1h4ME37PLEsY1AGCn4vX6pLW/A
	 nrkY2L11LtpyiKVxEF3e40aV0OTW4Tq+sF2jlTcrW6rlJmSF4KjhPgLwuL2011Oyss
	 HwFPaWEibfNl92rzseGCoAQOVLEOQnSgjXy3nCoQzQEHQBEvJEJhDU2orFxcQFRhwh
	 sdRY0BdKq2zz0iED3iPfi1MBLF0LP2lLYP0FPfZNKBkHCqhEIgQgmaAycNWMmfn460
	 2VN/d5o9QOloVcpExmmz6fKWOUj8DxrNgC1l1JtZgIfL7bLaPrtym4n8jmpFvZLVYl
	 JjU9A7bcJrLow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BBBD8C433E1; Thu,  1 May 2025 07:45:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 01 May 2025 07:45:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-HmqpmNynAL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #13 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #11)
> OOC, X670E is my chipset, I assume it is indeed part of the buggy club. I
> could change my motherboard, something like X870E (Assuming the 800 series
> by ASMedia does not have the same issue); Just to rule out the "this is
> probably the chipset" culprit.
That's an assumption ;)

A simpler thing is to try different USB ports (rear or front panel) and see=
 if
any are connected to different (probably in-CPU) controllers. Or get a PCIe
card, those with Renesas uPD720201/uPD720202 chips are reliable, though 5Gb=
ps
only.

Your problem seems to be HW specific, because others generally stopped
complaining after 6.13.7. I have heard about one more case of "Abort failed=
 to
stop command ring: -110" and suggested filing a bug here, but the reporter
never did.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

