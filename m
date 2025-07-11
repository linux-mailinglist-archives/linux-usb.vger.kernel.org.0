Return-Path: <linux-usb+bounces-25699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E44B01340
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 08:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 277391CA19DA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 06:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE311CF5C0;
	Fri, 11 Jul 2025 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RE9Fk3ch"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D342155A4D
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 06:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213620; cv=none; b=niRG3UfLA0BS+pk+RCUCX1Mg3KFcpekiKixVECxeIU79ypz0UQoAnWumRUcbCjrGfh60+LCzdYRv6mXplq69aWjVOVpfB3qafzTzpfArj2C2jDEXakwxgvtRwlAvPHlCv4wxszP74m2jZUgyNaIlB2Fvya4sw1cgVT8mHp3WnjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213620; c=relaxed/simple;
	bh=ejZxII++u1+EwN8MkO8CSzf2OLEzbrg9PgDdB7pr2/o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRghVnJP6HDfs+z3NzDm6sNWAAwbhOLpKVZ8ZPdnNlasWM6ebeS0mMWS3MFFcsO4cPfv18nNHCzn/ouuIdkSjC46tpkNU+5cVxBG87d3GoANy/+OFDaohn1JynyQ/4KFTlOG4f5ZJ8PYqDnRlxBIwRsqb7l/UGCR8Czn4/WPy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RE9Fk3ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9FDCC4CEF5
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752213619;
	bh=ejZxII++u1+EwN8MkO8CSzf2OLEzbrg9PgDdB7pr2/o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RE9Fk3chzNYLr29PFKDdsSC6L7Zylkty2v7yxn7PB7xGSpnuj8grB+hmH7+2laf/9
	 xOMLpV0PkLpaM+eaJ5ecNkyVV720XVN/7wHSQvtiX3NpTYG/igS4jOXw7n8DZ6dgFz
	 bqJvlItSUv8GcSeQ0aCLTM5RZU1vmjw60d+oVOEXSjITolaIuCSxRvUppSQFAAecUM
	 7dF9LANRFMPPaa2a+/bEv7pwbTHlE1e5+aQWebL8FiN/ruGe4+FH9eYlvEVdkW0ule
	 1JcUgebUd4UEexXefq/Sr5meFm1BByq2FO2G/zWDRcDkvaOs5UEBUFIBU4cKqO8xmV
	 F7tiEr0fGx8Uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2D17C41612; Fri, 11 Jul 2025 06:00:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220331] FTDI serial IO - unknown device type: 0x8312
Date: Fri, 11 Jul 2025 06:00:18 +0000
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
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220331-208809-Xtgl3Dm4f8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220331-208809@https.bugzilla.kernel.org/>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
1. This is an ancient kernel
2. Feature requests are not supported here

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

