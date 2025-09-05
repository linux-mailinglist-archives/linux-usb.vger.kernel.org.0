Return-Path: <linux-usb+bounces-27605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A23B4624A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 20:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66CDEB616A7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 18:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F133930597B;
	Fri,  5 Sep 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifH8w7YC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76929235BEE
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097055; cv=none; b=jQw1xEtJvS8YswRiHfUG3ARiCw4t6aIBZLnjOem1I/70nQEmXdv0JL6S11E3aB38r9sb+7xV7yLa8mhMf+qDjAnZTEduW7tRyIA0WLXdWUeKfPmEKsmnJh5EFuVXUTyFlcXNclD+AtFnY7NzH2xeVfZbrILQdLhbs7nSMuvzGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097055; c=relaxed/simple;
	bh=ybIuA+TlUqenYyaVFvO935VQHPT2aufjkF+fI3lOVZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ul+4OyRruc68MqultbOP7RnsA7S+nJyCdd3QvSA4ylejkLbrqnZ0ud3KepildRY1X+QTXOUyMyuZopwwKRVNA8TYVuSKItEQWKH00FWtrYXq+rNA6NKxU+7X0/KkPTiQW90+zvdE4U8Iedsk+y3zs8MU2qJQQUyeyn4hQ05qC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifH8w7YC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 535AFC4CEF4
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097055;
	bh=ybIuA+TlUqenYyaVFvO935VQHPT2aufjkF+fI3lOVZU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ifH8w7YCoGaXZbvegdH73ul0QcLw7CcczEKVdhjXV0oSCOsTFfLad7fvZpVx3mBAG
	 VdGt+CCNQoYC4tTCiZAdnzOq0abnkka3C0GEzAALLo01h/kCnZVWu6+Qo41ZoWZ8wE
	 S+ix+GzfHnDCtWPAuL1zMEEt0XkVzCS1DuYgnlIm/dfH1+QFvfoKGz65KF+dprK3ZD
	 wSh3c+x9QRYNLzXfemApCVLRp5QjSn2VJXC1t8LJoOkgo4Hb/Dh0h2BAUxOpk6y+RN
	 QdJLTFB0BpcynGKgdW/8qrJ4n9lM8EPjR59As85aQ3kzhzaLk13L/O5Gf48n/7rCMu
	 EE/yQoLSmTA9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49DA5C41613; Fri,  5 Sep 2025 18:30:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 05 Sep 2025 18:30:55 +0000
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
Message-ID: <bug-220491-208809-QoOweQGjV8@https.bugzilla.kernel.org/>
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

--- Comment #44 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Mathias, I tested your patch and with Alan's reset_resume_delay=3D0. Your p=
atch
eliminated all "...link inactive" messages in the log, however the initial
problem whereby reset is not always successful returned. As of now, it looks
like an inactive link causing reset failure or delay is not contributing to=
 the
problem that I initially reported.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

