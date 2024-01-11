Return-Path: <linux-usb+bounces-4942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 536AF82B44A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 18:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27281F21711
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 17:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5C6524D7;
	Thu, 11 Jan 2024 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyva8T6u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCCC524CE
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 17:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE045C43390
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704995002;
	bh=4hzpbs7Yj8kOAYhqkQkXJGoacgXxDzK74oiyIKnN3lM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pyva8T6uFiYA9MTUcHwyhY5E1mQJKVHONefw7PlLEuvlDvhOJ5Vj///lVO/kXw5zf
	 Q2EVrhBCrYbGQ8AZA93OsOZRLvAZcdRQbqEcmb390GDQHxGj4TbW0f/jUmsgfAPZ/n
	 EUbMcJcTmmnBxjnD9f/tO14vIVTxm8DKFAbgBIlLJzDgzqMIV7b+yyjhkz9VmUkeLp
	 lLN3TMIun8YS5eODtEcimUm3jLFXFLnNT+gmoL5G9V13Qx4FdvahQ7yXf4mZfiuLbx
	 yg6Pj93WI6AG0uKPkjhM+y9nHO6YOqHhp3q4ksEmaUKCFsF+8DFq8vGuvcW2OrlFzU
	 g1aQ7guLbNSmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6995C4332E; Thu, 11 Jan 2024 17:43:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 208177] Lenovo ThinkPad P52 USB connectivity issues
Date: Thu, 11 Jan 2024 17:43:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-208177-208809-0ZD1koOYjI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208177-208809@https.bugzilla.kernel.org/>
References: <bug-208177-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208177

nvaert1986 (nvaert1986@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #1 from nvaert1986 (nvaert1986@hotmail.com) ---
Resolved in a recent kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

