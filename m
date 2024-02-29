Return-Path: <linux-usb+bounces-7294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912F86BE9A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B267F1F233B1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA20136135;
	Thu, 29 Feb 2024 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBnV8t1y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3355F36113
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171740; cv=none; b=lLOoo7Pbny/gMclTBZC88yIwxgJRpXE2/2Zxu26fNI3XsqDlxuEC0C5OdpGa1+HBhAf0luljFJS6A/BuN6EHSFMfwW8Fr6qfAnNPrS+EGRbGyv0My767FZOHM+DsWIysgk9b/cr5EYQYfgwbDWCUf3W9molVxPOrQ7N0QhudhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171740; c=relaxed/simple;
	bh=/WDIrbi9UaGugLP89ngP0iLI8fpFdSlnULMiJq8t/b4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3wr4c51/G3xcc5f1rbcXdJKasE1K5PIbd5gYi++h+7qssndlNs8RFw5Sxp/jFwgn/ySAVsIyYat8BAiCtE+QU2LQuCdtcC0yrB1kFQKCInslrdDv/9W2EBbrBrJVJ8DU1wqAd7+lUpHq5vASGrx5SH++HKnmD1VUFH6x+WrOvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBnV8t1y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81DCC43390
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171739;
	bh=/WDIrbi9UaGugLP89ngP0iLI8fpFdSlnULMiJq8t/b4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QBnV8t1yCuRSzyvZt5mFdpIBUpOHWr9LpQ3xVspA9363568Uoy3foOdnyk2ogY6sh
	 9LEDNGB78Aw+4cI4gw531+tjsWFyXB18skGrmKbWbfslKTBvqej4fzm/FB8EE9nR5B
	 jT21y1u3JtGxwpzsMcRCCamvntxDpVLhOFlqTBLtjx+BSOsJLqh7BDjeO4lqiaazPy
	 jgWFGp1qmlvQnagW8w+P+ni0rckAQOFAZZjZatULQscATffjnxUf3uWaDV/WkeZ957
	 7niaf75ibrqAVXir3tsnk5Hsl6sXcKii+Ch1TqrWhOK6wxJpcbaQ5mnrqX1A1FznLi
	 QDWI5nt+eNMGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8F7FC4332E; Thu, 29 Feb 2024 01:55:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 01:55:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218525-208809-SJ0093a1sZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #7 from kaukov.peter@pm.me ---
Created attachment 305925
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305925&action=3Dedit
RTX 4090 lspci log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

