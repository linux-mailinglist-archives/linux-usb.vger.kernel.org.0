Return-Path: <linux-usb+bounces-23239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AAA93C8E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 20:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91B2E7A313E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126C92206A2;
	Fri, 18 Apr 2025 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yr1QB0YD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E376433C4
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999616; cv=none; b=fIo+/yzBXVrBbrHBWqtBgy+2cpywrG0+8IDjRUbXbf09g7nZ0KS8h3ksFHJ+B/3PweQeHeL2L3QtTKm6ms6diesFTlM3DTrcG39F4w4/qeZdfuSCGCplvr51jL9BLnfOsTpFhTF2f/sNI4vH6VsuujSHjc+Ez5DX7GxILHyKYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999616; c=relaxed/simple;
	bh=odDyQjiKi78ABhDlbso1k7KKYsf9e7r0dBVJMXk3qjU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kSQSWWtKzCqboGmLvWfiAh6CoWc/wtmoBIeEPzsKjA/l3Q7yFeIwFprV1LLv5xvpp1OAunxE+3v17uYY5MKPqudkqdV9HCPQ07NzPp/0QJ7C/3YDyQs+DzPHV1o5f79QnprIxV7vb3eBXOv5Y1pYhh3C0EUAL85XcXfvEuuI5yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr1QB0YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A05EC4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744999615;
	bh=odDyQjiKi78ABhDlbso1k7KKYsf9e7r0dBVJMXk3qjU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yr1QB0YDLWRD8BLNEzZKbIAqtEqDTN+/228iasihRmjniWMcvzCKQlohF196rD0HS
	 omz9KtpEyCNi7RDpKEBKsaNg3bzV+gPFN90/+S7zXKQw17qrFBOX74jxJLOwB3xsf3
	 bTVViyUmP8L6wPqRTHDujaUe1R40jRsNvATMwGURlvriuzgbkAPiiLayisiSYz/GiP
	 cWbSvjR8cTnphxy3eMNaw9Iz023JIWN9v/B2G1kXVuJp3zgPO+1pN4BOe7AjGumNuc
	 sfDozVv715oGhsqpZj4kCGuRuBJVEMLa2eoV8O1F5d2I3KWV/b8b3uh6rFzgx2hgT5
	 t860PnA6wMa6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E61A7C41612; Fri, 18 Apr 2025 18:06:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 18:06:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-TkXrIBBPyy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #21 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307993
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307993&action=3Dedit
6.14.2 with realloc=3Doff, good keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

