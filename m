Return-Path: <linux-usb+bounces-9651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEF8AEB31
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 17:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09FC0B20FAD
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 15:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A2813C66C;
	Tue, 23 Apr 2024 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEm9baDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442C17BA8
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713886434; cv=none; b=bm/9oGAXekvvF2lADiFSSjSGhSeX29UFhBQDDmTOJDsd9wc3Hc+LFcFn6q7FbofmZzpqBs49Q9/J6okeENYbb8a3/kYUkxl5uyIBcNuENwTe2bowH3+/3TFZnF4MRRo238tJLwgDSn8yqtSfGqz0UpKJln2B5ghdIDwmw4AjCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713886434; c=relaxed/simple;
	bh=hfBDw0f1Mz3bHEZwi0NxGwvCFqtCiR054TtfUaiDCVQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LFdTjOse6aCRVllC2aUu2CGOztxT2oIfOUYfdMC1Kfyy3UkQ3ZhaAg4z33nj2a8EubZiP4Rt3OAkEaDMQ5//IUJiX1WJGHodmM49PFTxLbNCcQv+m3rk9lfXcYPihVny8Hk+WQRAnDLpy5ZDSYVUHFpZUKknaYnLMPmjQdzLKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEm9baDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FCE8C116B1
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713886434;
	bh=hfBDw0f1Mz3bHEZwi0NxGwvCFqtCiR054TtfUaiDCVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OEm9baDJa4MhAaSnRpLRxifr5s9ItQruwCGfR0XuH1hMVeczGInYor9gLaz8muwGt
	 PHxkP4l2PI+SwebV43NQt7dUMnDUP1mMXs5l9HwYKSNRPEFmoI6Brw6uCl2XD7ln4s
	 V6Fc2TE7YEe5KAJnQpXvWQ+MAI6+TZMAJNqQL+fY15RNHNkyyO8Ci5v+hki7Dwqp8t
	 HnOwn+WZ2+LaQ1KNvnbDLgwNf4XvrA73alnrldM/pJJ4gaTGCDLntyEC5L+EfWqqVY
	 3XJEnY9nz3dt9nxqnGGdb9dnH5yD3/C/k5fsBoVTJBwWj/wJYPcdNghdU8k1zAZ3lS
	 OewNGxJCY9CIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5BF61C433E3; Tue, 23 Apr 2024 15:33:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218762] USB string order in dmesg
Date: Tue, 23 Apr 2024 15:33:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218762-208809-xckha7Hhy1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218762-208809@https.bugzilla.kernel.org/>
References: <bug-218762-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218762

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

