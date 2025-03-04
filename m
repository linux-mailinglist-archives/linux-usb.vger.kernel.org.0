Return-Path: <linux-usb+bounces-21320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F4A4D6E8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE2A316CF80
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 08:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F108F190468;
	Tue,  4 Mar 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DM4NWKkj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2118A6A9
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077968; cv=none; b=T3D1bCd7q72vm/mQua26BACgclEosspFF+4/3lMCQ0I2rE461S0AabG+08/YyXqqPvtjfv9Ye3Ea/eMzMUdy7C8imz/6ux2C+C6DgpAK0/LP71iMq60TvQCuRtBwWWkhMBNb9pHxKao4TSmfzgg1H3vrwh43I5MtX+3DgYCBREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077968; c=relaxed/simple;
	bh=i9Z2ClX6/qPzOA9QtJTeDXpDg1AIuOx96lGQMZHe6pI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RLUQeV8MWdCiBZM3vM/PrFHzL13ALuoUNOANmyhX+fDiLj9u3m/qwFMWn0PkEdynsBAmmVsUyhktItHMXBDNEognPO+8Y0jaUOtUCDc3ITj4RJc9JID1Uh49uc/LeYojmHf1x8P9KkVOojmFPDzWW6CtvEzJiJ9AuEFjsIJpKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DM4NWKkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE584C4CEE5
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741077967;
	bh=i9Z2ClX6/qPzOA9QtJTeDXpDg1AIuOx96lGQMZHe6pI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DM4NWKkjUiWQScChLIz4cERnMwaXjrNj9msXtEdZ08WRlWXDYT/0dCJUdv8mqEs4g
	 R9B3XoNhgPL0iyjD9D9TT3ZNaYN44blVapgivRhG4xg7Js2nsNGUmFFU5CqW1FLJyK
	 gu2RT9aeqv/W8UF0RshchV6ErMayRE63L0mX5FCeX0va71SvaBbVyE8lci7RnWT9RT
	 0bCwuUsSctQPeAd+iEDbbDIWa04bE58l8wLLO0VhQcebz/+kb2W0OKboVUW+Ab8p9r
	 jEPqEHdfBmw9hL63Cehk9GS9Au8b/aX4VKViBylC+jxrR+lYhVezTj/1pfYfBzoxV5
	 9w/PZpxestc6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF7F3C3279F; Tue,  4 Mar 2025 08:46:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Tue, 04 Mar 2025 08:46:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-WOD4bd7YLk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #17 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 307740
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307740&action=3Dedit
Scan downstream retimers after the router has been enumerated

Can you try this patch? It moves retimer scanning happen after the router h=
as
been enumerated so hopefully this is acceptable for the pluggable device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

