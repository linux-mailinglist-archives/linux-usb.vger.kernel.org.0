Return-Path: <linux-usb+bounces-14625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8D96B09C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC6881F25769
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 05:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D3B83CD2;
	Wed,  4 Sep 2024 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gI72ZSwi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624815B1E0
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725428553; cv=none; b=KNpm4zDExJFkq96EwFmYwsJJ/jEax2MqTA4EvTjxyCwSC6gA/cTdsSCJEo7P36Wfii3LmFkaXf/C3lufhWOc9actUT4ZPOpvXVmnn77z/IjiMRIP3cmZFXHIctpHkSaMTi0n9xDDwv/WTdiBpglSiSus5Qt7m7fXYrLqZpEUTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725428553; c=relaxed/simple;
	bh=SB5/d2fpyA/4SkDospA9TNshZ1chhJCyMDIJdbtf6y4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AFCialE4q6ZfNnjPz3WSBq0B6i67YS7JWGNbsXayCKnc8cCa/vEHLEqPeDsjCW++mCjrbN3ALZOu4/ywMoADu8mPMgG1NxtzaeiLFYgX8g4KwrYYhqVBE6ETKobDUQ7gqgwqjrcSEs998v7+tr+pAOwMFDeVZZ5TWayAh+idm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gI72ZSwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 005E2C4CEC8
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 05:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725428552;
	bh=SB5/d2fpyA/4SkDospA9TNshZ1chhJCyMDIJdbtf6y4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gI72ZSwiESOS8+Ti0o1jw5ygCQmEmLoyAYaOMPG1MyonaCzj53vw2mX3x4ge3DVGU
	 CTOpTzBqxE7z82KEvtagftJq1wj0/1d62RXQGzHE/2vGZXwbBtdNZFJ3ebX9Ectd+/
	 Sgg16h/Nlh5qR18xO6GaT3ySWZ2pa767B714MDhtmOV7ZNxBPbovfE+MS1WyjKAKQt
	 eMduYy92NjVIWsl0yjalY/yFsKccHtIa2l57lw9rESKBUgs6JC4s/QrhYeaozHGxBS
	 R9QRV7b0SDh3LUpDIyWbv3/S3825h/pp3IAGISbdZ36qBNIQhl4+WCc1pQoej8378e
	 eU6jMx5cSfJaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E92D4C53BC7; Wed,  4 Sep 2024 05:42:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 04 Sep 2024 05:42:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-1piPYiMwXJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #29 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
For the record, that seems to be commit 7af6c720417f (iommu/vt-d: Fix incor=
rect
domain ID in context flush helper) [1]. No idea, why neither this bug report
URL nor Markus is mentioned in the patch.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D7af6c720417f21f015f46baa33e182f349ddc93b

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

