Return-Path: <linux-usb+bounces-11316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C309082FE
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 06:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B048E1F23CBB
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 04:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF07145B0F;
	Fri, 14 Jun 2024 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjdwKz4I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563413A411
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718339679; cv=none; b=ScDpM5uHyOorNo+1ptcAQY177hA+bBRbckNEpMmI0PcXvudo/D+5Xr9dRsUFHdchzvuFUNS5mMCgCoUY3gkaexa36cFaqu48jQE33Kb8hi2Uuy+lkTUzpHjUM3OQXE19aTVR88KekxN4ifeOpcCznXfeit+b8/7haRgzgRvT20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718339679; c=relaxed/simple;
	bh=m2V+oQ+rFETEinJb+9hZUjxnRuGFMGJjmnjuuPb5Dmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QxKLlKWbaHNls5llQWwKblzkS2op4mrUXE8BLYRr6qZ3iTWmObbw/YT6urF6ENRK1HPxjon/1/M9+h0cb03K8apm4H/lo1UZmFnfnAsHi4Eun+W1+9Xs+lUjfKoq6tI7GMPRIFNwEbnomgHLn72rVtiUXsbA5NV8lESTxzlnQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjdwKz4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0888DC2BD10
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718339679;
	bh=m2V+oQ+rFETEinJb+9hZUjxnRuGFMGJjmnjuuPb5Dmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FjdwKz4IZMCtqK77c+NxepoGc4AZwEz00YTBDS4BfWhdn5aXUXczQLb36weHaJMfL
	 MPruPLI2z0tpFaCOg7gclL7WjeUde6jbOXudJGJg1yF8lwBULW3sKDk+XKC5aA3yak
	 KPYOLNvC8ys73Q1Cl1WQnTaSIjoMQ6S29vMJPHsN5/mnW1/HJnL+1+zBgEalzQo20H
	 diQ1B89jNldfw6k+GlEgm2KTXOTUjldpk1qfizJtDj/sJdji8GPFdAQ3phFvY7wMyF
	 nRs4XA+PfWlOUDBfplzg2McuDUg24FUOHNGI47wtWPlfWRbzodhFu51JVkCnL1qAP0
	 dkBkqJfx/UWfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5BB1C433E5; Fri, 14 Jun 2024 04:34:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 14 Jun 2024 04:34:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-UTGo8Jp2BW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #24 from Jarrard (jarrard@proton.me) ---
Sent a ticket away to AverMedia about this issue directing them here.=20

I hope they can provide a Firmware fix for this AM4/5 issue. That is assumi=
ng
its NOT a kernel bug as I understand it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

