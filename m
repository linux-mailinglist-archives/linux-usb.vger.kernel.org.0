Return-Path: <linux-usb+bounces-10668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 861288D35B1
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 13:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C07A1F2292E
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 11:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D617F39A;
	Wed, 29 May 2024 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdMHfQIr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B213DDB1
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982750; cv=none; b=frV3eE3P/BmLK0L96YWpEWtHE9IYkZz2s8uxa1b1fyGs0aCUjYFvRPYDD5VQmV5VmVF2sT9kYq54NVlbEAugV5/F7/cL8ei0M16Te3VO2b/PI8PwoEiuQViifUPTTDZr7FJQDTLVkthioaNfGKhYdJW/uceWUplYtNJE9x9iYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982750; c=relaxed/simple;
	bh=34C+m2g8Mn4y3dlEfYT2R58ObhMl7EXzBMaw61A0Bso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XvJG8EusVAGRSpuYSoqQuepU0vgr6Y2tjY6LPsNS3DK8ogJ4FDR5bcOGl0hKSyhSpoMO64wmJtUtOqH21vPtYAaaEUdhIipfWgkrfcglN5OxbDRJ0EdLGkmmRGiBNqVQPsfkLPhEav7FXmFUTPmKvX1d+Pi9ZeRFjbzCoLnmL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdMHfQIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E274C2BD10
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716982749;
	bh=34C+m2g8Mn4y3dlEfYT2R58ObhMl7EXzBMaw61A0Bso=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bdMHfQIrYGL+fCEncBs+nC2/BAOC/SBxoW7Wv4EV+INPIFajoggdjjxcFwN3FrPN1
	 zudH5Im1pe0sA4eEHXIGyMeajI490HSwrnasc/v2RP2INElR9D3HaZW6H8KtlkC/pa
	 jNY9oeWI5B8JLS7m/buAXykufdXHv419Ov7UkC3RJc578t3VFKxuXvGWbJEWTsfkEA
	 aTX0a/aRl8GdwJUFYcZX7cXl4WeOykL8B/psAdfPnUPGhoNDLCJmu2ClhplpRJNHq/
	 Aphg4oQxwosN3bua9FY/Yn62L/L8JqO52MmJsiWxHWwgDhBYEY3GqSvQ9HbZ/yb9MN
	 /09FMJaiKFFwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1818FC53B73; Wed, 29 May 2024 11:39:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 11:39:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218890-208809-iZO1vKI5NU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #7 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 306366
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306366&action=3Dedit
trace_2024-05-29_13:25:37

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

