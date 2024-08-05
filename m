Return-Path: <linux-usb+bounces-13095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1774947C06
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 15:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81004281600
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FFD374FA;
	Mon,  5 Aug 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cN4eyi5g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CD23A6
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865273; cv=none; b=ou7jpDKxxiZzPCEkQhobFPcWJV8i2lk2jqA8gAi3F7dqMRPXyanqHSfCvsXgO2SROEefltBa9CO3MOfyi0p6LMvXgBtWxzmPByhF1w7IThRJyQBAQGXnSmhhrA/IUJfOhkYwcPxIwXMyuikarqK1KliUpX5Uv75QFNHcPZLN2dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865273; c=relaxed/simple;
	bh=1ffs452F8YL9CBpSvZH1gxiEWrgqPvcy2l/2/WPvcjQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GUvI7BrSiELrA/CUFQibVIpZiQSmpnivSZYfPaahK65QXxLxnWMMqwB6bboeFmqrbtYQALWASImVHYIVf4uvuTGBVl3dyCxfCwdnrEHhx28hIXkV9NUss6phM1G/giOEo5wmRrku/1rzFrWgIiGeySBRE8zkQN/GTctfAsS7w9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cN4eyi5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 773F8C32782
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722865272;
	bh=1ffs452F8YL9CBpSvZH1gxiEWrgqPvcy2l/2/WPvcjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cN4eyi5geS5B5L00/jz6+Dt6J6L/I82uViPfQEORfXJWM+1D6rstg3O86i9YijiVJ
	 eyVsoHoJr5QBFbEpqO8K4pL3LUAOJYAKoN2NP9FrYmEzkH9eC5wcFFvx31fgnVZxUb
	 bve3j4nzzcbralbRjqurGestXbxP++Th2Cpghf4hOG0O+qyCIMQ6slrpk/GbbGEJWO
	 7iUzU8wOtgziDbmjDfxE9lkm0FIYFZpokaVE4OZjLTmSfeuxbkbHCd8trM82DGTs9I
	 sTBaTifWXp0bGjkcdv16sCjf/71yKtL6+RURcZ4NAfbRyTTRSsdJH+TWe/IHeazXbE
	 pHbcz2sGlQ5Yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67044C433E5; Mon,  5 Aug 2024 13:41:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Mon, 05 Aug 2024 13:41:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-Zb9LtvgN02@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #20 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306667
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306667&action=3Dedit
USB traffic capture occuring when pluggin the Xone:23C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

