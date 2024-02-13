Return-Path: <linux-usb+bounces-6368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9C8538E0
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B56283148
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC0E6027B;
	Tue, 13 Feb 2024 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X81mGoIx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB115FF0C
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846388; cv=none; b=Frn46A14jB63PQdY9Nwt9FYlP7mka0HiBi9ZOt0ySbtO8NSs+C3g/yQoWd7GN3NLnE4bWFP8n62HaNYpF+QY3dNSI5vKePmpieakN9C6pPNneu7g+vV/Bxxyzbbh+2Jxq69UGlPDEPC6x7gSPQwg0Fdc1K9ts1c8oaTc/F9JjjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846388; c=relaxed/simple;
	bh=0Yka7WT57+Ji1eUPPuOIE3/p6FMy8v+Af+rCaLbuggM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qGA9rZig7RWxc99+RVbLK4obDLmZnewitfJLT7cMjunAMa0H1SFC/wwaCcrW4vpclHMKPw3ssnSHjuCOI0hv1Lr12/BnL7z2tmg3X4RG4FZxjjdlDUOZPJyF8JgzoVqA7h9HxE9nFYche7tD0Gxa3yScHlNUx5j6v9TP+pCYi9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X81mGoIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7B63C433A6
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846387;
	bh=0Yka7WT57+Ji1eUPPuOIE3/p6FMy8v+Af+rCaLbuggM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X81mGoIxg/59CRiIyLATmzSZx1jpZNlVmiOLofot9Z3OQ1OeuiurtlaN/VSFRR9LL
	 jJ52Zes5cPoh7SGeLxNuztprzKdJD5EnR9odoa9PqJjFZ6EFdUEf/LPv+iqB2G9lBK
	 6XfS5gLMsuT6hI1ZzDa8iqcXg+IJUK+9IGSbkME4iYUNVvI5w0oT7Rme3A3kVK+7jJ
	 6SDYgYCzDHk+FqfrBOBEpm+y3cHeIU4EMvKCOXef207UwTl4whI+297FOJcCuNQ6ne
	 jDOlik1CVPSv+8Tbm/W9kwTwLX4TOfphWJuDKrAkFyOA/xoiF3r+oNE1G+BjZ7QdlZ
	 707b8fh+y2mlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3B1CC4332E; Tue, 13 Feb 2024 17:46:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 17:46:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218490-208809-coTj6caDRc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218487 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

