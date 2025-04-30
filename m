Return-Path: <linux-usb+bounces-23580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1DAA4C2D
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 15:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891FE1C037BC
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5704E25D540;
	Wed, 30 Apr 2025 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rihikRZr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F025D20F
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017806; cv=none; b=U+fGDNlQtarRWW9CAjcpAzy5Fkca5MBtoFFyRrIqzY7SMaa8eLpxWDhGnHkwQ4nDq89LbwA2ejjP84+/T9CNxL0vnI/HEz1OBucsMNSsVESf3OoYMycbUrW4rHnOJQ6is7//pM8RJLXCnn+NIsq4xqjPdzh1xNzqZ5Eo2PmkSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017806; c=relaxed/simple;
	bh=eL9LzPQ2vxYYRfAeLGekbZn6psd2W/5Oz0/l0y22sm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SNhsVK2jAhFs/Fc86EBoNc5yqvi6Wtftmcxa1OCKJSS3u3UF4IuN+prQY5mGt8c+I0sxeIvklFguLomkJUKZflvONLcGEFIfmEu7pZrRq+W5DtQPx91BIwUqETRWAXBBb2QBEsVVM03yeu5eIbOemN/0n7Lc4RBsS9ilxdWH5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rihikRZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47E14C4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746017806;
	bh=eL9LzPQ2vxYYRfAeLGekbZn6psd2W/5Oz0/l0y22sm0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rihikRZrtHEiCCWDlNxCnsLUNM3sxBcLkIXTBCvNaIMHdImCmFtEZspOxfYB3cYTc
	 CBO9FfeifCokewiQvUfVEUOtz/wnA+1YZXxu5OgMqGgjOWyUkPtSWDnJl8FWH80Uky
	 6GuPSCDf+2iLSWZ0n/n+mH7ZuoWoNEOI24CSLTa0Qtc5PEenbktjqQfFxpUEmhUdar
	 OCnZeCOd2e7P5IN3OSiTlJHieuI1ya5J+nTyhUcfGHxKicWPDVY7iRgOu+tbZyW6tr
	 thgXFS2EcExIKXJ92hNiHLucLABCUtFdLzasVOH96n+E2/MK5dol+uqVJzlRDfZoGC
	 Pq2QsMP77krZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3ABBEC41612; Wed, 30 Apr 2025 12:56:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220052] The usb/cdc-acm driver uses memory after it is freed
Date: Wed, 30 Apr 2025 12:56:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ben.maan@aimvalley.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220052-208809-jl7U1mNoGr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220052-208809@https.bugzilla.kernel.org/>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220052

--- Comment #3 from Ben (ben.maan@aimvalley.com) ---
One of our customers complained about a kernel panic that occurs now and th=
an
after disconnecting a usb-cable. However, most of the disconnects are witho=
ut a
panic. After some investigation the panic shows up between 1 and 100 discon=
nect
attempts. From the panic output can be seen that the acm_softint is one of =
the
last functions on the stack . This function is first calling a usb_kill_urb
that frees the urb memory but 2 lines further the allocated urb memory is s=
till
used in the acm_submit_read_urbs->acm_submit_read_urb.

Exchanging the 2 lines as indicated in the patch solves the problem complet=
ely
and the kernel panic is not seen anymore. This is proved by 7000 'virtual'
disconnects.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

