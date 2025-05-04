Return-Path: <linux-usb+bounces-23677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8DAA865E
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 14:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C20637AA217
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74D91C3BF7;
	Sun,  4 May 2025 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug3Mz7mZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AB19C546
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746362494; cv=none; b=Lv4dJ+Bd9rtNGIcgcxz89qn70zW7GbyP9k3pq1tzW6wbojZu8iPSpSPBwIquFdTUltGq67R2eySf3D1iv6Q6Wh4vnfSWvkCqZRS/37+41ipjnBbF61m5jxuJek/4O/vmd9WoYNg28Gu/T94aVkq0AajysRSIhBArhRJz1kET05w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746362494; c=relaxed/simple;
	bh=q6KppWz6oRXeZN9XR3KvDWDSwUOaESrPLyElP4if9ls=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IAx2B3VAC5AYdhyvhfkJXlDBoq4KdVfSLx5Esd+MFPIUwtlxSoyiBI8NsRdOH4Z0dp/UZBT2dhVOYNXsicRUgu0AVfLvOaCCJmbOWhkRyaeKrqL5i1KJbkaePMMg1zpDfcFTuPlCtl6Nysc/cDyCjvl9YC3ithxixf1J2Y+x3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug3Mz7mZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 989E4C4CEE7
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746362493;
	bh=q6KppWz6oRXeZN9XR3KvDWDSwUOaESrPLyElP4if9ls=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ug3Mz7mZAVSt6Gc/tldjET/kKhZmZv1ZoU6rp4AuZTIsoE81d6p+0K7vPx3eEnaHP
	 TrLcX8X0zCZ0i9LOjRgCK9TkIhplwqzvb7/E31vKlPfSFBOgSk1rVYHA+jZCI4T0z2
	 5aTSj/IEwT9sW63qk1nE9HwNR9gaQiHlLs7nLjcxUEAOirysusPF+5zEDFpmzr5GrX
	 95MMT4+dAJ+CVwQSFspUl3WOlpyihhyPOZCzuj9ae0E6Igl09/0AVwWpfgi4W8gTKF
	 2DAjsaSxF8RneC9JypnskBJLtQHTMNiyE7eyb7fsVFZ4zsGcnusCerIynEpOlVKJOA
	 SNRGX+s3mmYDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B3EBC41614; Sun,  4 May 2025 12:41:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 04 May 2025 12:41:33 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220069-208809-QzG51n9cPy@https.bugzilla.kernel.org/>
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

--- Comment #32 from Claudio Wunder (cwunder@gnome.org) ---
Created attachment 308082
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308082&action=3Dedit
Autopsy Result

A new crash happened, added the autopsy!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

