Return-Path: <linux-usb+bounces-20244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B9DA2A9B6
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 14:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C549188A7E5
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030C11624D3;
	Thu,  6 Feb 2025 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmGZ5c4A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791ED1624C3
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848137; cv=none; b=RAwVNKE7GBpSuvMBSzXOjdcQf/O5pIY3P/U6CVuWJhPtDz4N/H8DPh0fFjP0YSrPOunZsjuw6Avpp2V0WZlFNejdB4FjHlz8pOEUNyyNlXHS6CDvAqL6e6MvBfWLmlLlu4Hj7+QRKunD6lU6xw+I62eqcoWoawk8xFN0W5pFnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848137; c=relaxed/simple;
	bh=uEhMVkwAJOWwOXx1ffdM+NlxfWfjTYjMB2Gj0M2Py0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sby3uGLWKpllISS4v6V7XnSJ6Re2OaBFi0chAlVee9vgQjAs/xVovWI/E4yDjo7ViwsTZB39SGC1AtQWaAIVonDl6wEGQU4DoHUMyZWMvKYOv1sbW0QRN8to2W0zKNpz8nlYljWAStbvYDatiUkditrcJnswv5LZnUE1rc5Y0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmGZ5c4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F6BC4CEDD
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848135;
	bh=uEhMVkwAJOWwOXx1ffdM+NlxfWfjTYjMB2Gj0M2Py0A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VmGZ5c4AN6ijihBl3GAFJAVKU7AAk//9EAM8/CAoSY/5KfBc3rKGs9DXjgi4aFhwd
	 pXTW4+x7oRNV7aFUJyMlibfIIAiz2niSsQakuraV8sCNZD8b2GBekBVxbF3zkkP+oL
	 Pd/gGYVEHrdAcFQal+bY4Pp724KcWSy8ldyiqKJxGAmhBb31xqt6r+vfdt2ALwxxci
	 8fwoYzzxvN8ZQvmtxmBztxglU1Ig2EOIdS639r8HT+WcVK2iUrzSASYd0+MxnUMKRJ
	 ZV8N6ybPcAjqGEhzPh7gh+CQQZcyc49iGLbSmB2mHORG5XYfToG7w50yqm6kon1bTx
	 qeCnfOw9boP2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1934C3279F; Thu,  6 Feb 2025 13:22:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Thu, 06 Feb 2025 13:22:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-HiGh3bxVOf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #13 from Fedor Pchelkin (pchelkin@ispras.ru) ---
Any success with that ..?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

