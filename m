Return-Path: <linux-usb+bounces-23844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CEAB2844
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 14:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49403B6D01
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A7F256C8F;
	Sun, 11 May 2025 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1f2S00j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827041DDC11
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746968005; cv=none; b=aQ6+Zm1Z1VU74G5/RzFIsN07rDiEiy/VMFkiXn3TqWVL//wVeDMcewfxq3SyWyBHMsIDiL605q9KZEWYv9hgTf+VadQK6BRMHRBiPrsuj3GhUbng4r7nRRy6UWQhEkjOBlL9zNPFwbyv1xD5hYl0CoSqi0FbYQbD8+Rb1wAjDRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746968005; c=relaxed/simple;
	bh=jID9zZHSm4OthbTgmaEHL+7tfARTjw/FY0Imdk8bSTw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sh5wYY3fTgfpOXLnDPodP5jfHKhUG4RSgAEVT0vl8VHFKl0A2z6Snsd0sxilZs/pe5V870NWzHJ3P0IMR95/GQDu+fsAwJCxhaWtbXqrKcz0uTTiEMcaXKG2eYCMzmRrwrxqd168X/A/+CayIo7aLXibKDq0DHXqt91ITJHeabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1f2S00j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC101C4CEE9
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746968004;
	bh=jID9zZHSm4OthbTgmaEHL+7tfARTjw/FY0Imdk8bSTw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a1f2S00jRn4eGz4XCMcHfhQw4xlm31wtKBs2hMVfdn8k04d3+lZ3RA7fYL3wYb6G5
	 7WJiFolHpT11gexa+BV8zh8SjRzmO+zKeMA/yDntaWBG6yy2YoHZFXclYOhibYq3EW
	 cm5wHgIv0nYPM9GN068m1CeeQgsAHoDd07J2x2oVGu+vWucKNYT6tol1IeenWebUyl
	 VJe7tPPy1b81rhULY5HZgC44+QpvetIw9z+NdlmTtmjUz9PmDmdjnp8yd6yVTDWuy5
	 CrO5QHqdAQxzxNbL7fHYLjVUNGxwTfRMeZ3+utwOLqw+5dHQepi6nSsxUDybDiVn1t
	 BC6TuuM4ANzDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD5A9C41612; Sun, 11 May 2025 12:53:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 11 May 2025 12:53:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-oJMMxpGNm4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #49 from Claudio Wunder (cwunder@gnome.org) ---
Hmm, I assume I'd need to build Kernel from source or? I'm not sure I can
change (easily and without possibly breaking other things) the kernel from =
the
distro I use.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

