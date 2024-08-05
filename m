Return-Path: <linux-usb+bounces-13109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E712947F1B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 18:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D131F22B85
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 16:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0932B15B13B;
	Mon,  5 Aug 2024 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZWp5/mI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860432E3E5
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874821; cv=none; b=qlb+R8c9BIUVkrnRBDuNVBlwBXUj9pTas0sYenct9buCInVeJsb1klddF9+WddTl1WltRRCqKit1XVs2I7vRT8juztnNlWJ6COG0J7GDzymRUAIpiZ+MxqVzZsEzxeZya59XGXP/uvtRl2kNATT2vnLjqA4CUDe04E1wWBaWqac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874821; c=relaxed/simple;
	bh=w6aYhbQ568w27eJa1L5tYkKIUsVKmBd25rgw3BgjZCM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QFAPhJs82armsefGhwF1lC7l2nE47H8gF8MvnXeDVKY88XEY2fHJEhL9NEQrKMRerU48Y5drVQ61zqYVOF11Yq/NukAi161S9kEpk2/hke1S7AdsW06WDKa7IOAIG6CH14wbjN4frmuQmGbQoY9UVTfF7MlhATU7A7YfrukQVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZWp5/mI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D2DDC4AF0B
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722874821;
	bh=w6aYhbQ568w27eJa1L5tYkKIUsVKmBd25rgw3BgjZCM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eZWp5/mIQqnM7OOtwl4DS/NlFje2w3nJ2dIy4SjDeEHkTAvKGReUgsZoxZQauGVA9
	 m680b2pkYYEb0wo4cXztVWMbiIzEez6OT6kQCmR+iKxsivSSekxiDaHvUa4Rim3L8L
	 fj8iBOzFMO3ac8EqmWfh21MEVfwsa5iEj3CdvHragZJ9tIiPayBA1L2PWJPvtAbElq
	 YEptQcFAIf2hqlKxBrgXPt6er64LpRa0UoVES8EHpM9yblSDK7qWArYZ9VQunafvV2
	 uuy0b79Lw0+f2tbLqscESG/VrdwJY087ORTbl9v01QTbXCFd4+s+vvTKbAmVeM00MU
	 7oYMI8Ny4jluA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06282C433E5; Mon,  5 Aug 2024 16:20:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Mon, 05 Aug 2024 16:20:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-DpIXAQb8At@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #25 from Alan Stern (stern@rowland.harvard.edu) ---
Did you do the Windows packet capture with the driver installed?  It does n=
ot
look like you did (because the capture log shows only 1 in/1 out), but that=
's
what I need to see.

I do not need a usbmon trace with old_scheme_first set to Y.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

