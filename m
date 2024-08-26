Return-Path: <linux-usb+bounces-14105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247B95EF9A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 13:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51E81F23C1B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 11:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF02152160;
	Mon, 26 Aug 2024 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1RsLY06"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4FB66C
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724671052; cv=none; b=aIDlkrljvCq4UFruTiL5KHrQaUEPHHjhdLvwZtUmZly/NlGybHErMspfEJA8cS4J3JYDXHW1vBj18thawFPiHKz3ifB0Z9Abv8N+Wo1o+ZZpzKvaLreEKJjy+keWFgRycir585g+FAtkEMn7AY2lFI6BiDIBLgKdhh2VwQVpQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724671052; c=relaxed/simple;
	bh=9eVi4ecVpVK13q+tN1LTz91NaHCOHduGiwe+K3AkIIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEh07rsCubrZvXpuqJaVZ62jRkHZQlUEjbuIaDTYLP6sGXCqKlE96HwKstxq+nq5TXNCtJz96y5gN6ObFQXYzpV2nEv8WdD1AUMP/MniN+peCnltdocBqPZ/uqP8cZq2QsKuM0fr87wkeXjfryYG6cEXvfoWD4CC0SLGZk4msnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1RsLY06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 325F1C51402
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724671052;
	bh=9eVi4ecVpVK13q+tN1LTz91NaHCOHduGiwe+K3AkIIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O1RsLY06Dc6V3urN5NqxdSB669BXBRMn7kM6cFNimcDZn1hknteY2EcwfVUir6LY6
	 Sfl4SLzSRp50eMeVHOp/4SyUHVebOTcPtVvCKLX40n8rObHUFetNp9RyOlILJAR/wF
	 x4Dx73qv1zYiP/zr9fm0Lg4xhWITnIKb7uABxCUp3HDseUaX/PqInTzRi0To+AXYEI
	 f290cMsAkEhtZZjrPTJoCSnLA1WnyobpDSW+34Dp0jp1XKmTnTLinmjaQ0M6ZRt9pp
	 392VDCPtDX7SZexw7NM+K8/j808bN17HozQ55/DKvpfrozQPImgoafh8VGbApYqnne
	 LTACL0WPWN7WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E6CBC53B73; Mon, 26 Aug 2024 11:17:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 11:17:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-RJqOMzoIct@https.bugzilla.kernel.org/>
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

--- Comment #3 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306779
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306779&action=3Dedit
kernel log 6.11.0-0.rc0.20240716gitd67978318827.2.fc41.x86_64

On Fedora kernel 6.11.0-0.rc0.20240716gitd67978318827.2.fc41.x86_64 USB is
still working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

