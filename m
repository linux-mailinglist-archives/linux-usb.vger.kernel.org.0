Return-Path: <linux-usb+bounces-7233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C986B080
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 14:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1223A1C22FB6
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 13:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844DA14DFC4;
	Wed, 28 Feb 2024 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBBqSMG6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C414D426
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127509; cv=none; b=NPg/b3eCwBQlxxVOpce2Rbu+ltQpKgiq0V5qiuJYTnmj74c1RgyVhSIIhlUuhJ8/DdmeSjBSI8vwdaIHgsmndq4LXRwphL4pL+cQQSdErruc/7URzt/Xjtxgqg9TYSkgaQG+OBsslnAOSVl88HsplzgS/zuZAu+GKhdCdAOEknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127509; c=relaxed/simple;
	bh=z2QhPRBArIeVox5Hwm2QADRutYYTiY3rhrfwtnQef48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bv9kAac56WiyN4OE6yZEUCih+WzqGOpsyU3P+DaqELnl7YPpmSqYVZnwPGVzxyj+8fiwACtb631jN6qinTN5EzRBSkO5HnaioQ50nvrir7voPlXsVNk1iIi25yCDDjKuig11EVHOz0AH4jvIOpoD9xRaPSOnpBO66eL3M8YnKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBBqSMG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 844EFC43390
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709127508;
	bh=z2QhPRBArIeVox5Hwm2QADRutYYTiY3rhrfwtnQef48=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gBBqSMG6+UNfAhiwL1jYFEAfv+Hvy84v/RWhSysGiJh2S2KkJVxutNMaQ+0v4xmpQ
	 pA+4JT9BVdy+lMc3TUaGNfqQAq771voeW4bjikw7SUCwX2IsFgvc+j7xoKbNg6Yul9
	 aqqeRkpgsJhwVnhPt11rdMdjQPQ0h67a0in65ngOJIlHcwb+z+M9V5YXAOS3KM3TYr
	 ZAN+pylmalqaHC3FrgpzwoihZBRqz7h7NM7K2t2W2G9CP4Sok+ooNx/eRvrW5vB5Yz
	 XqbudD4ATuSyQBElOXmqM51uzh6Fi0MkBmeDq9A4ahAi8ty1sVZ3HUzolZK3uop4mt
	 HZilUOsHblHjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 595AAC53BCD; Wed, 28 Feb 2024 13:38:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Wed, 28 Feb 2024 13:38:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218490-208809-vCRDmnkkNL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

