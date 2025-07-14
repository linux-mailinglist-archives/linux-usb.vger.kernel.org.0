Return-Path: <linux-usb+bounces-25751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5CB0399A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 10:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9761890E4E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A796A22F767;
	Mon, 14 Jul 2025 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1bRfyiK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF9198E8C
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481905; cv=none; b=gHqyLtnNm6q8hcqLbSbkSBPHI6TakKblxko9jrgbaLpe/2uZYor0/9PVwa+/T7HHMS8zVpncfWtX+9hY+1qANMG1nvW/H/dwBw6knetAjoBUbzDF+9C4fCf/lYDoY5jzuKBDDB/rxXAaQpEArt8zTErsrerxoKNVd4DLTWrQcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481905; c=relaxed/simple;
	bh=0M7iPm0HSUJSaI/9wfik1+ftqppLKnS1rcNbYOgBWYU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VIgWIlw78XrDChnpaEX0/xpmUiULFv1WPip1VJBn+dpbazd619x1g97glyrikBk0Fy1MBwZmUvCLT3e/AX/6DQUe8OjGoXJ8PUCNEd7Cx/VVyXIh4OPphLIPXMwE8tk+ZoSREx65/G7lPQGtpwkDg4gHIy7WU/CrUAuqFc1DugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1bRfyiK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1D41C4CEF9
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752481904;
	bh=0M7iPm0HSUJSaI/9wfik1+ftqppLKnS1rcNbYOgBWYU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X1bRfyiK8qbWJktHM9DkIz8Y8pX1XtGeRioAKCPyj/7/s24u4lU7DBIfXyZufF1fe
	 04QLT+3K6GViBYXVkOq25vqEf2BSKx7ZuFNOT0p3fc6xwlVTRrQz7XFJtwUyVgDki8
	 oVnWqVuYu+SyRMEdBWh+3ylJvqtW7YHmij+hD14Xq2ljHgGavyBIfQQBVS1JOrkKN0
	 PzzyyvMQNlkOnmG10oy0efJXXMduC/vMJrhQfgiSVtyJWYcp7fjC5ZEFuy+LEhGZw+
	 WucCLoOQo84pcxoxyN84HdWRsM2poVO4OBGTYOwdVFaU3V2s3qWpnnc4DP/UFRLo3Q
	 7QEzbbcZx/OJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCA93C53BC7; Mon, 14 Jul 2025 08:31:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 14 Jul 2025 08:31:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220181-208809-FWjVgvZ9CK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

