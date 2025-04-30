Return-Path: <linux-usb+bounces-23588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED7AA5511
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 21:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 425F09C1778
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0042750E4;
	Wed, 30 Apr 2025 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5jjWwba"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5E1C8FB5
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042869; cv=none; b=RBMtl9uodyQFaXtmEe51FdJAh20Tt1F6rQJOmsxC2N2eNjz124nZrn3G6Z2pSc1KACbWRCVqqSOID5J3fqYJvsRlrkAyXgu0AgxUEgNRatoeN05Q9l6WUqvFEx0su4A7reP44HDzwO16/LsdaFsAwFWcWzcOeDtFUJO0ZHSTxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042869; c=relaxed/simple;
	bh=dv+EqwhIzaKqIfmsHfaD0axYnXNPsXTEIZ/EVCUAPKk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2ISVsaBF7h+uHHmlrmLZQhYtCISDIs55AYa9aWM8qu458HUYuS1uSp26ng2U4M66KVIYiEQXftwg7cW1h81ibSSeweV2Cqe0sxEPTspQD/0gbt+nUiWtB+XY/rKVq6pEWtXckA3K8T8+iXrpcxfP9bCY05HIwFyRuruPqzTV4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5jjWwba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B0FAC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746042868;
	bh=dv+EqwhIzaKqIfmsHfaD0axYnXNPsXTEIZ/EVCUAPKk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X5jjWwbaejw87kL++K/Xi58W9U/emwjZLUV9X2GoDhoAfWa7fpNIdKh6cXrFukc3b
	 uhxl+SdOuWBB9gsKjYXP+tEgLhwkfna8qq5h0bJMmDXNYJMY70nk5wppvJ29D1NLIa
	 mmC7MjPiZEwuEfaLlDEP6OCXWnF7QvXpHYb5D8wi13+zsixkBC2znWOkGgB95wAVua
	 8seRxEBL9cprV/ZVIb+BdnnV1P0+dz/lNPxChEAp+TAIv05o4lUxWxIMXYJDrSdBlO
	 L7wLJEqaUD6g1s8szaTUHEmf3u5F4fmNVamM4tHMOm9pyow8FasT/QEZbM5zo/KPE5
	 R0UpL/OxOfg4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D85DC433E1; Wed, 30 Apr 2025 19:54:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Wed, 30 Apr 2025 19:54:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-J0eupO6q2L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #6 from Niko (nrkowalski@gmail.com) ---
Its been awhile since I've built a Kernel but I'm sure I can do it, I am
familiar with C.

I can also do a packet capture with Wireshark. I'm not really familiar with=
 how
USB communication works, but can share the captures.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

