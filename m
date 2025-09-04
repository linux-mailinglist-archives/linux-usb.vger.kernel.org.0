Return-Path: <linux-usb+bounces-27535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FDB431F3
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 08:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D14A91BC778C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 06:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A94D23D7C3;
	Thu,  4 Sep 2025 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e79JVmMg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A58BE5E
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756965911; cv=none; b=oOStWqcp7OXg5f+gDwXHKVQ0xYMv5XJYlVBvWwtpr++S8fMf8G3fdAsUqkM/mwGOw6rfDiPk11rMQH/CcBAi2CP2vkzRvOnsNMn0eFtxgfeCFkf0WDYFS+YZ//391R+/cZrO88l2W2yMd6OZxO8B2zrShHd18MijwbeHDq0UYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756965911; c=relaxed/simple;
	bh=aotdq2PUNTUiR7s2iE6rJm4XVJ/TWkZ3T9dnMaRmnMQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gc4pMtjL4sbLEK3viQWQhrOv5DYWR2NpZoJtKQBnsDM7DeTUGsmnLPpZIcAa2V+wI1b4DcqWJaxFy2z3q8g+9vt+njcXI29FIy9HgvOK9B8KwZdebp5c8xna+FZS7BZlCuaCumhPjz4Z0IR9Mj71uYHamFNQ6TCAoDImlANqPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e79JVmMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A015C4CEF1
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 06:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756965911;
	bh=aotdq2PUNTUiR7s2iE6rJm4XVJ/TWkZ3T9dnMaRmnMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e79JVmMgX8dghpeuieVwlryEhmGKueOvbWBim8btJQcYO0fmXsX6hhEBD9Vt2RpG5
	 U5k1jJDXrExB/hyeobiHpA/Y/v1vQghHC1iN8GxBSfQr9/iye/rlTxXE/aVPR/u90f
	 TpbcF8EhNsb3dO6ebgC0+Vi3fNH5EWeLKrX3LmI+i6W27usb/ghhUjYMGAufBjjj2z
	 MypEB5a36F0zAOpqznx2dYRdDkad5Y4SallICxHzcilWEKCt4Rp0AgduIORBdgGqPu
	 5L4VDwEReQ0F7mkspOQF1V59A70wJKHuM58juMz3sB9PigKTqYQ66dyhv2edxX+r3+
	 Qzm8Yb5ayJO0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 471C5C3279F; Thu,  4 Sep 2025 06:05:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 06:05:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-vJt9dQ3AHO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #39 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
OK, from Alan's comment it appears that the ativ9 disconnect is somehow too
problematic for the usb_persist code to handle. However, if this is so, it's
still not clear to me how allowing the disconnect propagate upward allows t=
he
device to reconnect with an incremented device ID. Maybe the delay will be
instructive. I will test that tomorrow.

Michal says that usb_persist may not consider the emb-qm77 overcurrent erro=
r to
be persist-eligible. That might be relatively easy to quirk around. Any
suggestions about where that might go?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

