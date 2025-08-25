Return-Path: <linux-usb+bounces-27239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE8B33A97
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 11:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5A81880397
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 09:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CB0393DD1;
	Mon, 25 Aug 2025 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caW2CV6g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45A288524
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113411; cv=none; b=VbZQMgbzmKQSQvgFe9lYkLb9Tv+Pt2K4b9wWAUneJ8GF61eLt9WssmzIy5Ngc2cY8yjnHo1jzXAeuHXfMT3M1oJCDikrWypIqfNoIx5MAOaACFr2hKtq/nkOtWodeDjQ6bmlXnILZFGSwc/lqB5ncTgrs1q1aLcUvwaO2FrDZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113411; c=relaxed/simple;
	bh=e/EYgkAaHudtx4S52IuAit1IDb/no8qKbBRIEHpLmYU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U5pbbAx8XpFMTRrDacFlqNiN1WPMw9t+RGgWTNVYCyhO8JgnrSu9xPLNXWRMvBvW9FQEqHuGtO0DqvID0SeXJmHChQE+XhhcBdQvSLH9GitnYivbYKgkCdcMtED+qPOLP4nHzATvEP8bhTHeiZuUvt6X8s2aHr6K70uKEut/hrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caW2CV6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C964C4CEF1
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756113411;
	bh=e/EYgkAaHudtx4S52IuAit1IDb/no8qKbBRIEHpLmYU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=caW2CV6gU/K50f4n9KCVZrmDyMF48y7erjNBjqrGRU33ASfqMUYoXgfd4JIAmr++/
	 es0Y09OfjL2igK7LNfRgpEHA2iJFCeCXPvcXGjPWfehwSQY/2NGPbeideUCfHJ7+m5
	 wLSPOS4ZryJG4Z3Kn5de+wIZF8Q/vISq0ejUIB187G0Zw3XaNj+kodI9NwhKjmg3ox
	 22CYWh2r8KXoR6QV0F0pfZwncFNn4JtlkAAu4qWU8WeZ1eZvy7jAMknToMUyK55rYs
	 9MMmkdCbe60ek1DADbuAjP3C3iIw2oKN1bSY2a34D2KMELZXnVJ8AV4nmjjn+/M6zU
	 1Ek6OUhp6L6nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43579C41612; Mon, 25 Aug 2025 09:16:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Mon, 25 Aug 2025 09:16:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220460-208809-GPK0xaRaBo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #12 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
Created attachment 308546
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308546&action=3Dedit
Content of `/sys/kernel/debug/tracing/trace`, USB-C connector plugged both =
ways

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

