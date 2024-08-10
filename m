Return-Path: <linux-usb+bounces-13293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D494DC5A
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 12:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B432B281F2F
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697BD150996;
	Sat, 10 Aug 2024 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jghCBItp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554428DCB
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723286924; cv=none; b=dlkHYD63b/CxR5r6vtDFfBL7B6wEkC71vn75Mw83lEg7UyypHF/oGzHkRaCKKTUFtE3P9RuLMWIJVW9U6dzoHrZscxb4mr6jYX3HxBQpku7XhuS4hRzBAsIBcdAbyDiPmp/TQigDtohb7GT9Yp9kI97cdLopJAbziXv4wSgOYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723286924; c=relaxed/simple;
	bh=xSm6uNFxPjsK2z9plIVEfIsnjmcunerGvkq3FAl6vkY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwBGkPSO/h1qdlPO06cV6jF4/ur3rVbt/qiRWRnPV3qPECQHtW3kxCXPWIayACn4KRkQAFr2YrVQKS4NPLc9yxQPUTKa1A2NkXGM0FmgglxV4WKbj6qtoOb+BtfSkEIn+x7T4JgA1kFBwGZsvaDZ0bsqN36x+YdKh6SpzHZAFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jghCBItp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68FBBC4AF0B
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723286923;
	bh=xSm6uNFxPjsK2z9plIVEfIsnjmcunerGvkq3FAl6vkY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jghCBItpIC2Qq4uW5I1uHwdgBGN/XwYQYY5+qjc96ibsoYRniKm2P92KEoD02/uQI
	 9zN4My/+m/wLm2uoWJyIM+rkgO0zmWVYUHEtPRVSqFBL168VH5Gc/flIPfkBXgVZiM
	 bocagVL2/YqTIh6RKm0GsVVd8To/6AcrMLhjc+ekktcYBAj2TfBySl/4JYgzcvX9/f
	 R1bDv0HWO6UKSlLUeWJxv/jfKsjE/YF62WZmFBULyCq1TyrYDOAj1hUFprYf0nHNSq
	 oyYkUgWWDdzIIjdaseEX3ofLSDeH7tIECkp0vX4WpkWYuJPbecg9z5e8832sdiZkCA
	 YdSfuA5Yo0EMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5162EC53B7E; Sat, 10 Aug 2024 10:48:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 10:48:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-wO2bGXiJNe@https.bugzilla.kernel.org/>
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

--- Comment #50 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306707
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306707&action=3Dedit
Working patch with old_scheme_first set to N

So I did what you suggested and got this code that works. Turns out the dev=
ice
expects to be provided an adress before being requested a descriptor.

I don't know what to do about it though=E2=80=A6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

