Return-Path: <linux-usb+bounces-19221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A2A0A9DD
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 14:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D91166925
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171C31B6CF9;
	Sun, 12 Jan 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB4i1eDO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E201DFCB
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736690142; cv=none; b=iLiLRWVvQ9si843Es8PidqbvRVyx3JViHSxsZWr0jDHp+Wk+Oc8SVdjEHxWT9RIegoNO1bjRHNsTmVX3llWbm3zMZkykL04E68Lk6ZT1Wkyej3ttq3h9pTFjA6Strgyon0gqTRA32oDxuAz5TQbBtUu1JePYv55FYAlgSv7KprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736690142; c=relaxed/simple;
	bh=MlOOpBrCdaGRIOZzK5Q7vOZOp7wofk1o+MmI0LJM1+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qdAMYfBvhuRQRtvq2Uidbp2OtECYuAmMxYfCjz8YNS52EQHnQYrM2bBQTeyNwwtp+a5UdXTwYgScCIrmzttbQ3NRBiyH4RbF6OuF6NluYUutYJ86znk/mInw2rxGIhSHuUsGREop33SEY7T1QOnxaiLuqy17OUce1u+6ajltYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB4i1eDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 207DEC4CEDF
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736690141;
	bh=MlOOpBrCdaGRIOZzK5Q7vOZOp7wofk1o+MmI0LJM1+c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HB4i1eDOa7ruaaRppdzCZCykESwRzWTS9y8bdgN0PyXqjufC7NXDBRY8eYMhxrb/t
	 3SogNVrXNiNEzLkX0gRBo0LSKDmPnByc6/lOYdpsauf+RR2SF9svca/mrU2RY4smfE
	 8I2td9rICfpiZZihb80NeOkB+epmbAAV2Oe2uth/RoEo+/Tgjk0QevxHWkqRDRhEAM
	 ygaZIOy2vNg8wD5Hz7hq9GrYhCtDYVQYZA3seqNUNS+Lgh09K3tAjgY7ZqAo3/OKdK
	 TBQRSaVagIrsB6xr3yddGNpgyDnKC8okw3r9vnJp/XGO1hvyLbSkEHnvgILhsPe5X+
	 HUJIY6MYdCLeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10542C3279E; Sun, 12 Jan 2025 13:55:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] Noname webcam used to work, but not anymore.
Date: Sun, 12 Jan 2025 13:55:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pierre.juhen@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219683-208809-YM43ZzhCtP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219683-208809@https.bugzilla.kernel.org/>
References: <bug-219683-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219683

--- Comment #4 from Pierre Juhen (pierre.juhen@orange.fr) ---
Test shoud be limited to BFunction Class =3D 14 for Video.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

