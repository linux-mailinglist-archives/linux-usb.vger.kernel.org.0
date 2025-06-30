Return-Path: <linux-usb+bounces-25327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633AAEE765
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 21:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4092F3E0A2D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 19:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B81628BAA9;
	Mon, 30 Jun 2025 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNFXXDuZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879685227
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311335; cv=none; b=HhofZ73e2u261hax7Q3Eqq0qu9YQEOGznLKUvirISWeM/rTa6Kac3Yiq2Fzq3PEaykxFaCaXqfOoBqmvYTMdDRAKuPG4HUYFlESEerx3P2FJJyoYaQvgFvU4k2ol9v+q8gieCV4s9Pp+gTK66bHNCCSuSXVop1KucUpUMCRvBJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311335; c=relaxed/simple;
	bh=HJkLXzn0nZ1ZfG+qT7JNeClEc9q7CmjWyDdKYc/My5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kMy9GNKa9z5/glAPwZgsUhejRV1/DRslJRAqhdgeZW06X3hUkZyyA0Vo4th1qa7xnDg/M4JCsZZ9WxkC2Cin8FBd0NTkHOxgptNDfGQaR6t3PYD1NzVXG4eA2qJA8sY6t+xyF+oSpyQ1cb/DMsXLj5zZtvvR4KHWxadc5K5O+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNFXXDuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BD58C4CEE3
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751311335;
	bh=HJkLXzn0nZ1ZfG+qT7JNeClEc9q7CmjWyDdKYc/My5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oNFXXDuZIlypQJ69uXHYHpfO/bTYIQGxAJ+EQLzgM3H3rks9/u1aLu8chlToHeNN2
	 RsRydJhheN0hFImbW97TjlI7lms1IE/IRTDJFxiKJHMJ5690uc44+ASMUxLrzgGQfB
	 u955l2C5jXS7HUh3TVUst3SvyhS21ccYwGjTNdZwQpr4RcycicpdxIHDfa2KIcXs6t
	 ZEaXYZg3pD6n61W/3YRq82z1YswgoAdPWoSly22q3bbPnFK4DtHxgf6s5GC026FEZ7
	 BoFzV1B6Zy/hQvHK38Cni/V8TZhBcnI0oD7Z4VBCKA6fhD9dJHrqRg7KJeYpQgepL2
	 K7yd0vZaHuU4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3871C433E1; Mon, 30 Jun 2025 19:22:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 19:22:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-kg6uI9mgrC@https.bugzilla.kernel.org/>
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

--- Comment #22 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308335
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308335&action=3Dedit
Trace - Second Attempt

I am sorry, I had missed the "use the mouse" part. I hope the second attemp=
t of
getting the traces are more helpful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

