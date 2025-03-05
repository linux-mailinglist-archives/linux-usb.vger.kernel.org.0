Return-Path: <linux-usb+bounces-21403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F13A53E85
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 00:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE56918898B5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 23:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6325D2063D6;
	Wed,  5 Mar 2025 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEvuC/bU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144C2E3397
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741217603; cv=none; b=r118JK8BymEhTpuZ7YhjiMFEIbYyKpXnhu/n2mfrEYeQm2+XnN4ZgqyddkMVs8W/0Nj8I9L2GqB+wTnF5O4DsSSGaiwgAqORx8n+2f28Jsqd/WRma0v2deEy02FUnI91SmuVoPkbiLKQsyOkeSuzY9RdWB4Ld5Z0KTBB+tZ3XBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741217603; c=relaxed/simple;
	bh=bzFj1buZ/Em9ktzqdmM04LYSiWhFlw24t31BgzzMm9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OG+lZuVNP95EEJwXz97vns2b6OnIrAbav8TYg5zOtTMqRTnD71AieqgFLGP7ggUJpjSezM/pXhneAZL2dQ6sp/mi6Pvhoh8q1XC9W2NdGRF14BJCoLwgeaxnuUjOl9LMqlai/2/j+XHucwLgi2sLa9oliCG+RyDBzrFMYk+Ra7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEvuC/bU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FD27C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741217602;
	bh=bzFj1buZ/Em9ktzqdmM04LYSiWhFlw24t31BgzzMm9U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GEvuC/bUQHpa63GnzOS9nU4jbtDNn+mskyvi8XWrV0Jbku8K/u+GTR08bKSbWah4a
	 lcU1FGp/gGAyBGEOQfRaael4DblTT6xMfYeDoY9/r7cAk1DJsWcMv9ywWjndJVcPRP
	 sEXLDQaF+GpIvrdOFMNqYbhKjs4aT9yL2dcBGXM1iKuVT5VNxICbH73e1KLV7IelMn
	 6xPmELJPZw+mD6J0NkLUdL3M74Dh89oDXlCwWWsMogM4/u+ktNOXyBgyv2iuFrBmIi
	 aW0VURGhtf0B5PCPdGZtVQksgQJ+IJ0dYew4GxFIXykb8lHNlBK0MVri41dPgfN5sX
	 158ii1BtHDJvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51643C41614; Wed,  5 Mar 2025 23:33:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 23:33:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-wsczxFMTGE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #26 from Thomas (lyz27@yahoo.com) ---
Created attachment 307773
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307773&action=3Dedit
0001-thunderbolt-Scan with display attached that was undetected

Tried the most recent patch.  This is a longer dmesg as devices were tried =
as
well.  It was a bit odd as the network didn't seem to be detected initially=
 and
then, after unplugging and plugging in the dock, it did work.  Monitors plu=
gged
into the dock would report as not identified and, after plugging them in and
being identified, they did not have video output.  Not sure how much of thi=
s is
due to the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

