Return-Path: <linux-usb+bounces-7288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9886BE7E
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC3B81C21FDC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216193613E;
	Thu, 29 Feb 2024 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiMn6JKI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB22E64F
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171437; cv=none; b=QbFtNAWhDGlCpjGssN405ezmTckk/GJ3/mDJmgaAcLhxYoA7cnsgiqtNIMNgxuxADth9iCxeIdAbCnFpeH8mTMFyu6ZNkPzjEv1zNkWr9TxHkou3zq0DJiiUqlSLY7LQe3NdfveRIFTlw9v3ztmF3N7mgP3STRF+3A8GHYlBlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171437; c=relaxed/simple;
	bh=mYNv/vd4vYfKk6jCsj+6AbVocLCpjeZ/UvUsIrwxaBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gCeJ4mHxFtXZCzdZFZQ9fBCz/MJQ02nDnoF4exwfzjRmTQsXIVN3g55wL98nD9KC3C1A0yxhXG1RFGG4sihJNt3mbqCHz/EaYgG341AISFiyulobu4L0Ciq2Pkg0Njat0U3oNMM4N5oeoas4Gq1ZxsE4HnlX8detCL3iLoSAzeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiMn6JKI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341CFC433F1
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171437;
	bh=mYNv/vd4vYfKk6jCsj+6AbVocLCpjeZ/UvUsIrwxaBc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oiMn6JKIO1ir4p3d/QRvTvLxxY4eQwqhZYYPSOJ+mQ//lZzbRGc7SkpgT9kpQ17ho
	 35eEPFfXrZJ+dsAikkfIQigll+JicUPLtsQfO5ipLdjHMcJtsCKQSxylH9HSPF55Yh
	 t1YEJYL0+NqjsxaFuKEoQNUpC4hc6h51O4BnEV+5sg9AqnMyBNmITWKYXZTavHsyn4
	 wpd3+Pku/U3CPcOAm7TdGHTiEa1An3dRKlgT8BxkGinw3z8WQq3XaTGy0L3pyRzs54
	 jIx3kykLXZmTAmvzOIlS/ZpY2vMsOSUz+IzCWYJn6071C/UKcJrrv+LWknx/rw3xdU
	 lzwxyscM9TUTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 12F91C53BCD; Thu, 29 Feb 2024 01:50:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 01:50:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218525-208809-M2uSLpBHQX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #5 from kaukov.peter@pm.me ---
Created attachment 305923
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305923&action=3Dedit
RTX 4090 Unigine Linux Benchmark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

