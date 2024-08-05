Return-Path: <linux-usb+bounces-13107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EB947F05
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 18:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C21041F229CE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C1115B55E;
	Mon,  5 Aug 2024 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOhJvz0V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49115B54A
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874401; cv=none; b=ZgqRn6BVzlByxwmLEW5VGwfgI7c27s+3N5dWT6Ee+2pyEUU9sJ6hpF01dNNFvK/eiSfGw4V47Cb24Fg8/9QNHNqW/pUsrr2bqT9Bkt0fToqZ1jygtUxURXSBxT4fYqSPwqkBcwSFFEWsWBDYm2e26v1gK8rUGXqNhNhcj1CazSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874401; c=relaxed/simple;
	bh=mHOHNwOsGq5tNRQMVuhWBmSpw8I/0GA0vuAAEy3wijY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uj7RvOmsyYT/OFPRjp2AVN+10qqd1NV1wbbP5JRUcJXwd80Xd4bJSMYWKD4Dq8v9K/MaEU4TKdkkpT9cpZjVrijk+ID8Y5kia2bHnysoLWnIG5EIKFFhsCf77PYerZbTslSKQ2DQwBh0IH44DdwA+W+KO/31AowsZx0ouIAn7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOhJvz0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6BDAC32782
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722874400;
	bh=mHOHNwOsGq5tNRQMVuhWBmSpw8I/0GA0vuAAEy3wijY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hOhJvz0VZAYjd3JcRgsdMwsHxixbi/RXZ4SmpQi+Z1vYMFdE214xPOdMe/ULVRZju
	 UU0XDBI5b+6mtWR8N+iKjYcO9vmuj88MBLmcFIRTme9R4FheyzQhVUcCowgy3RhEoZ
	 v0pkJxDZI3IIIbQ1UMhxIcJU6AJxdDS3BEKtSRO43+37N/FafBED4xFSMLcg3LAO3b
	 KxMtSDs1jFWpqJN6KDEg8pBHkmrJU/a9FsU19sF8HpoPV8IvzW6VyZ56uFpzpX5pHG
	 oiYN29QETUyxQABRwDfDwKivkcaYZI3/zDoD6ssFwVD2FwN0ZtowPkOJBEsyUENEku
	 qkNxe/Wea0LHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95CE2C53B73; Mon,  5 Aug 2024 16:13:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Mon, 05 Aug 2024 16:13:20 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-MdSuZUANQa@https.bugzilla.kernel.org/>
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

--- Comment #23 from CH (com+bugzilla-kernel@c-henry.fr) ---
Yes, the device shows as a 2 in/2 out under Windows but only with the driver
installed. Otherwise, it shows as a 1 in/1 out like on Linux with
`old_scheme_first` to `N`. And yes, the device do appear as a 2 in/2 out un=
der
Linux with `old_scheme_first` set to yes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

