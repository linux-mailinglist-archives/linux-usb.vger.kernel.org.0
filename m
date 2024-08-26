Return-Path: <linux-usb+bounces-14133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362C95F96B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 21:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCFC01F22BC1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 19:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD6A1917E0;
	Mon, 26 Aug 2024 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfvDqEGe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E90198E9B
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699259; cv=none; b=sd7Im/Kvg6HRLnd64OQg8w6qny2HCDbEjuaR+Z32+0UzXfVtFN1UhYB7aCQkhgPZMVBxs5KB8nlEGRvwFtKCpzTOXNnXOCegGX5W3P0RnBSVc/OyU/1GlZvttRs1gCqTa8P4IZf1Oe8JALELHx9Nqs6J8RkuvhLDs3DLsAI0QUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699259; c=relaxed/simple;
	bh=Hu12M1fk9N+Y7Ec08aAID5Xt3iLXqHb7BwokUm3G5xY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dWrpzF7OGOzZe3XIghGkQ3ggkz7IwxlhA+VE3PK5Agkr5d1Nmtz7YNek+Au3GDcH9czRbXryx9mWUTpF6fi36IZMC2/8d6RONRpvH2zXEmYKrmJk3/O+Y18xs494l/Btkgbq2iFZMJDvxiKYJIzMqL7hvBAtrrepOx/7jc7J5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfvDqEGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E05C6C8B7A2
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724699258;
	bh=Hu12M1fk9N+Y7Ec08aAID5Xt3iLXqHb7BwokUm3G5xY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XfvDqEGe4Jo39QX85Gtzzxtdq//Skm/AAcgzLmsjRpwv6kKVPn2HqPDitHZ7jSVgH
	 HHfWjxN+L/3Ntfqmi6zBa+9E7GH3yp9SWXOKIHMWmC4sWDE/UP2CEdJkOunL8znvVR
	 sfnnoqreZk0WFlB+Tf7xGG0Jh5sZ+PKc8N1G/YZ+9KZp+MTU9bla4UigTUtpzpQKnn
	 54eoroPxrSEjnQjYbXWwAq2l2TUH8XKT0GjWSb5PKffUkDN7+xeNQ8Lb/XBxT87Js1
	 jZfAR8T0zrySOThkf63zYxpAu6GgTzZSlA4/kISTCCeunmwKYuteK88ZmhQh+Ilh4J
	 gpprPZkvIxAsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB83BC53B73; Mon, 26 Aug 2024 19:07:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 19:07:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-0ZNsqNoz0D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #7 from Adam Williamson (adamw@happyassassin.net) ---
Created attachment 306783
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306783&action=3Dedit
journal from a 6.11 rc5 boot where the bug does happen

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

