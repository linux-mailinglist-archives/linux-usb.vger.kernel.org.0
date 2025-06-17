Return-Path: <linux-usb+bounces-24821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45873ADC1C6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 07:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63828166B5E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 05:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6C728A704;
	Tue, 17 Jun 2025 05:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2CLcp4C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CC23B60F
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138366; cv=none; b=al0iA/ytlBn3TqFKf8W8uuJEAsQ/rDV3XzQBpdTBCAaNeZXYXBwZDupoJp1i5Scx03f1YfLmt3SB8p5yBpYCbAlU3EJZC/vi59M2qzu16rryty9Ckf+196F8k8hskpt/v2ftIIl38Vo/ggMgoj1/141l59TxURFGqUNSNbH1o/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138366; c=relaxed/simple;
	bh=hIYDLfpZQy7eGZslnJxo/gCo2uflJg9buKkSu6AtM1I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OkF0i6m2IZYlOR3iZ7E/6q5x7AnT9GpFSm3pbXITwOZSLNZsKBGbwkw5e5Gukbn4LDZksToMkFRjaRrlRoYvjuHBWgqcJEaWBbvH20sNZDWcxqYoD2ZJvubB1CvFeGb0UcUfAyaKakhq0dbIEjJm+xI8AMyZ/YShkCpMvXXITgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2CLcp4C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDEA6C4CEE3
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750138365;
	bh=hIYDLfpZQy7eGZslnJxo/gCo2uflJg9buKkSu6AtM1I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A2CLcp4C+vOBzoPxn+JSOkJD9aCFbHjNWdglknbz/gC/N3bpP95+tE+HMdtbJeGFT
	 LcMPNpyBcKaS3mIjPe1OJ4LPE09P/BsihMZJwRul1jy12iKe7WGqkrPn2s+pAXITN3
	 yE4xoKpoR8DNXgqn7vJXdj/jPYD/pHdtzXaqSprIjs3EiA+vg7oOCWrMQyuoo2Hjst
	 3O19ETYOF8LbjIzxRyjyvCv4kGRwfH5+OM4Y9YXGUEncThcUMHIzx4+f9XZr/RqIx8
	 48qbHiIoJ9eLZWeQH3FHDm7JThXG+Ix8v85mLJsGmI8TSe7PfynQruOl7SOZyw16aM
	 92xyML0c1wWRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF3ABC41612; Tue, 17 Jun 2025 05:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Tue, 17 Jun 2025 05:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-D4kYIZzvVJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #1 from Ryan Walker (fewspotty@protonmail.com) ---
After tinkering I found I don't have to reboot, I just have to keep unplugg=
ing
and replugging the mic and after an average of 10 plugs it will work. It sh=
ould
just work every time it's plugged in.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

