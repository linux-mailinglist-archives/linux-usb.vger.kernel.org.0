Return-Path: <linux-usb+bounces-19215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09AA0A829
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 11:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67EA13A02F5
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 10:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06F3190068;
	Sun, 12 Jan 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad5nCmc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD042556E
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675854; cv=none; b=L8ODhgZI/2Ifp+nE9UmUixRAD9sH54cX1TTlP90YV4gaIFyZDTTuYTawJ3ouZrjL/w/AjmDBgd8yR2ctEDdlr0c+rU+ymAvFWGP2+ES2xaMof+RBUY1uOq/Mo6FjomHlD3nt0nLY4aFE9/MuIegDet6sJ6bXUwEFonXXNvxPr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675854; c=relaxed/simple;
	bh=ePvywre+cePw1b4MpYM4IZHfG67+Xj4b/anAYEHgRJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hltf+QcEcegF0m9KEl/BND5vmiWw1h4+39+3aKQzXYAGQFBZAPdlj9Or2cpTXsTA20wwH7OS1O3Ge3dnPv/VHS6dfgPA9bLOOhwHzYV6zifMdhIAGBeesr1xbfUlUmiLIpiUUkr0S/Nk5anlwA3smB7OGLKQAA/Wibijt+tj5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad5nCmc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D230CC4CEDF
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736675853;
	bh=ePvywre+cePw1b4MpYM4IZHfG67+Xj4b/anAYEHgRJg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ad5nCmc0+ECJI787YE0ISn5uRMCMoKOEtx1YptXmxezvZD+k04uu/JdZn3gXH0E+T
	 velmP3MaKul0Qas9u9ziDslPXwKidXif+/dLvklGGdcWwiwflMaEGbDVMxNhSozfxi
	 kFYAnhXRXmo5Dp/nqzaXUQYZ4FJPRaoMU5c0bCkvebdSSuP0fqHNhxAYMjObTm543g
	 p/aNSE5+ZcTYALHIa+iXf3JXD/ekMT1dHIz6m/5RiVIDx1yKH8macuHLlRxEds+BEJ
	 SYGyFNbASX730hdY940bKRK7sXSoNkQJKTThQRxbctVFb+hI8jRLy5o8KytePchtH+
	 yBTgmvnV1yEYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8EB0C3279E; Sun, 12 Jan 2025 09:57:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] Noname webcam used to work, but not anymore.
Date: Sun, 12 Jan 2025 09:57:33 +0000
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
Message-ID: <bug-219683-208809-fslseJNz3m@https.bugzilla.kernel.org/>
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

--- Comment #1 from Pierre Juhen (pierre.juhen@orange.fr) ---
/dev/video[0-1] don't appear.=20

The webcam is not linked to uvcvideo (whih is modprobed, anyhow).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

