Return-Path: <linux-usb+bounces-12650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A218941F50
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 20:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F13281FE1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 18:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6944618A6AE;
	Tue, 30 Jul 2024 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5pnObif"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F61A76CA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722363293; cv=none; b=qBwPbmOeRUsXV69pcyy2pV/AU6MvCdL3O9y0ClkSZF1u6ae9pnvIwz9VxvHVVasqJS2tAA1kK69qf+xqpHQ3i23w2J/K+6IJJ64NjaMjQ320q9IXT8xEILYhouCHgyfTV0BjlIogFEY7pS/sVpoQJlbTJQUPM4kBQA+AFxfbxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722363293; c=relaxed/simple;
	bh=+K6BcY+fp9n71TI4HMGsH3H1vXN1G8xnPG2dP0Uu4fM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hqg7OzNUxx7QekxLnCxsZ5ssrZfNgd6ByRVzSG0IYqOvvFb7FY8tdJeh3mhzbTfGB+8jQdEIB9MFIQZMh8zwIDihCIYhUcNZ6x1PQKdLwTuvxWRUlATmrkvqRsALprYlXT5FzNDMtlJsX69hYf/H7CAtDTFwqeIl4Z6dtbP4aLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5pnObif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64862C4AF0C
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722363292;
	bh=+K6BcY+fp9n71TI4HMGsH3H1vXN1G8xnPG2dP0Uu4fM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q5pnObifIUomRjjL5LwKtd/gKbMyJymyXUOGke6fjE6b+m9q/O1YWSepr5On4ESyD
	 yFW/+1xcwgcp7/GLesH6UNW1VQDAlX58Nu4O8llMoaBx2WwULmAG7vwuqikLn+Gw4C
	 onAcMp7hfvHdRfQbjyJnyUEO+oFpPcSHgrSVH8HqIcYruBAy6IqXPoy8UZ+r0m3Dbr
	 4IUlh8WrgAdy4nYZJwIpKLLISrIggEkt/JrCtTpEXxoNlstwb/33nDZV/pJ3rLiteG
	 /QF9LMk7nkjyR4Ihpi/oTJgonmiFXqla+EUM6hmWMw+EXhwUlPaRIltqIItOZCBpqS
	 x3WwV2AzcdPCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B340C53B50; Tue, 30 Jul 2024 18:14:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 30 Jul 2024 18:14:52 +0000
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
Message-ID: <bug-219111-208809-EYYmqiTkKr@https.bugzilla.kernel.org/>
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

--- Comment #3 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306641
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306641&action=3Dedit
lsusb -v -d 22f0:0008~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

