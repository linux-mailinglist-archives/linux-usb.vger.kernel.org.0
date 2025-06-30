Return-Path: <linux-usb+bounces-25277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90605AED867
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 11:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBA118992CC
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 09:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625B523F27B;
	Mon, 30 Jun 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N84h07n7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE0A2110
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275066; cv=none; b=fmMEX6LtAvMvhwmW0OODumVVyMQkdV9ZS7mPH4fOagBJTNmgmz0GnNyjGkyx1EX/QyRQeWvO7hcZy0wNcmBXq7WdIfMdxM8YUNCc9QSdjyrTT9mEwaYxY1LL/PQR7C7NVdmo/aWdOyd1K1WHujGchuZ4VXfBfAXLxysXowkJ+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275066; c=relaxed/simple;
	bh=GUcxQQI0ASEwSQ2BwL7l+NOhV50WtQQaIUiUSsa9nOc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cbMCUszJZ8Hq3TLJMzTzAzHyrA2ZreCYRnW8g0zwqLF2vNuTtr01bLbmKaLUbtunyFwHd29ELtatbSDKuNe716ISl/+a+uJ7qsCmRq0cXBushg4AtwP504n4uaAr69dMktGrjZZmU1L3s7MmgVtBvLl5MOHCxKAMWCyLg8nfBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N84h07n7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54E1BC4CEEB
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751275066;
	bh=GUcxQQI0ASEwSQ2BwL7l+NOhV50WtQQaIUiUSsa9nOc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N84h07n7wXH5ce8KEK2MS2+VTD7WVStrWRPUtQoJBEkhxSQM3+0IhiIJa1cSPsDGt
	 BMrUrHN1VWVLMQu3Z6fpYEqfb394nrHZQMDw/ZqVlsgoAJrHsQ3+Xoh4rhr4Kd9DZC
	 dg4yiJLOsTJW0ybiInMZABPZSY+r7O7+LGQqpG29BuQ2DYbm2Hiu3zYe7IoQaJ+Jvz
	 qPiCZROyGH6JcOELw4g+/UPk4UlqoBVNK8bJuPKFwg+NgR9fZxY+tojgUc5qb6JMFL
	 77YVzTz51r0pvGcqheiHcWn5+wpv+3k1jhS4Xcb6gXiFtzVxGcSRCbaMxsQZjJtbaA
	 qplYvNPdzsnsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40E2FC3279F; Mon, 30 Jun 2025 09:17:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 09:17:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-eGzkxyY5Jm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #17 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I also had a look at this LLM generated "report" and I can't see how the
alleged issues are supposed to be real.

1. Replacing wmb() with dma_wmb() possibly makes sense, though on x86 wmb()=
 is
stronger than dma_wmb() so it can't be the cause of your problem. Other PCI
drivers made such change for performance rather than correctness.

2. I'm not familiar with xhci->mutex use so no comment, but the alleged
deadlock probably doesn't exist as there is no asynchronous completion call=
back
here.

3. Pedantry with no functional impact.

4. The driver will abort a hanging command and signal the completion.

5. We immediately return so we don't go to the out label. No bug.

6. mutex !=3D spinlock. No bug.

7. I see no bug. No static analyzer was run so that part is made up.

8. Doesn't matter if the value is zero.

9. No arithmetic is done on this variable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

