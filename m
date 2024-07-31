Return-Path: <linux-usb+bounces-12749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8E943658
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 21:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66461F2726B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 19:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3FA12F5A5;
	Wed, 31 Jul 2024 19:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4ePyO7A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92F3E47B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453627; cv=none; b=lhFdx8mVB8db7319DrCRBIJIXplMeXADSBaeDImR2MF1ob/2sJ5IuWSil/A//Ik0kcUqBclNSkW6KPDRgspzTLGgWrp7z3VVPuOzj5Fgw0PWOdiWfwnl4kMaLg4g96tDcfw6x0o3rfzi8YL1kI1TxvHtMC1Tlt7OV9RhGiUKL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453627; c=relaxed/simple;
	bh=wtBcEX13/GQbkYjzbmX+WFOZsVhHGfZ3sV9S/c3J4dw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cJEJUZRwrU36y4/VrK6/1c1cvJLzLa5MHugw4VkwL4ZOMpo2lUrUUHRte+vHcz0R6VWs5fAyK3/Wz/YTAK4zF+j1MZ+bTuD4GUv9qb2r/YlX49tFGaDM/b6nIuZdsBmMgSEvfTrBkMYuQ7JA5UUSc4TSoeV1whNGauNB9NyfMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4ePyO7A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31F5DC4AF0B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453625;
	bh=wtBcEX13/GQbkYjzbmX+WFOZsVhHGfZ3sV9S/c3J4dw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B4ePyO7AzjhnGjdjaMe8sGwGxbdReIDYx7jHKD4it/VuqfuVFuj1ImyUWIsjD2+Ru
	 V7da+iNCJ6UCHpekMsJiD708AORNlDkwjuLoqfFRVJEWlmoV28joJsn9cZcJeqO3LX
	 2nd484Evq+KmyvRxMsbICsEEtdF2T+O7mmClMbBqicGz0idj2v8l7OxNlfJnzfgZ5S
	 v5sIstQ4AY/EeShfnNkQL0U8MFJmmHn1HtiRIIyunQhXi+IYDRnWg2xGGZSVO3X/dT
	 YsIvrNAmPC+LuVBZoAmzDMElfJUkNPKyRg8mXlXHf9Kcs4IyM2iiJIJsdxUfpqDiKr
	 srYPKSI58+H1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1908EC53B50; Wed, 31 Jul 2024 19:20:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 19:20:24 +0000
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
Message-ID: <bug-219111-208809-llxwBfA9FE@https.bugzilla.kernel.org/>
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

--- Comment #11 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306650
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306650&action=3Dedit
skip-2nd-reset patched on 6.9.11

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

