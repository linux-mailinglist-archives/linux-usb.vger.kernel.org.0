Return-Path: <linux-usb+bounces-18968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88734A01337
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 09:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A751163C14
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 08:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CD814D71A;
	Sat,  4 Jan 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn4zqEE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA53EA98
	for <linux-usb@vger.kernel.org>; Sat,  4 Jan 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978235; cv=none; b=fKoI9XZA+yr32bXIRtG9pe4OZsObhR8bPoFOs8NzUpZfb1CAkFonHSmIxqDYbYMx8iA/MpttF18B6lbOdJTu+gz+tNTVru/JBnmF6T0GxQVK9UJjFfDf2gakCkMpETfYYI1lSMB2PH+JrJ7/ONVqhRznKpnrTzGW/EP7+INyywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978235; c=relaxed/simple;
	bh=znQH2HWXZmJkfpGpgAPQJOZ+yWNSutU8rDh/wCTCPTA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FK0oM8Yjg3pI8ejbIA/wTHJ2vTDjt0feEtGpYIvXts2B5i1/40xVaSkHOo3XuVsjhZGzD29KgrwDwKSl3ayidcKJlHJ4rg5IWnxIRztAZFXNbRTHxQM2tfuP2JYukTJ8QwiZI9c/B5hrBx5szMUJGu3zNvqthKWtUTrQpRO8F/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn4zqEE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44C6CC4CEE2
	for <linux-usb@vger.kernel.org>; Sat,  4 Jan 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735978235;
	bh=znQH2HWXZmJkfpGpgAPQJOZ+yWNSutU8rDh/wCTCPTA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dn4zqEE1ed0h0SingmdEq11i293uhaLz9lsKfhrUrZJvuHdi/4Z8TLkxFGddlY4yf
	 l/sXl1S1oAQL5tPH9jpbjYisQncpIwfSTDd7DuJSjoAYINhlSRuTbAnuSL9tvL7ZU5
	 PD4uM1svFECon2s/ab73tiTAEpAlR5PjqkdoIdyoklwGNw5FXnvUQpYHW1hvVbcNPY
	 rdcGAAXkxLSKoPTFWEz0sVKU87df2OgLwhUKKQVRgrdB2CEb1Qu9tXPIzZ+ZTdL/UO
	 EPqURNbbPCTJghBg3fcWe6YeJdPTwXhofjnx/c3U6JQwhw0GF70RhtDAfnREyrGCbc
	 apfGK8tTp+9fQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3940BC41616; Sat,  4 Jan 2025 08:10:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217501] Apple USB-C 3.5mm dongle cannot output 41000hz
Date: Sat, 04 Jan 2025 08:10:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: willmo@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217501-208809-HbnMMED5Q1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217501-208809@https.bugzilla.kernel.org/>
References: <bug-217501-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217501

--- Comment #16 from Will Mortensen (willmo@gmail.com) ---
I sent a patch for review:
https://patchwork.kernel.org/project/linux-usb/patch/20250104-usb-choose-co=
nfig-full-uac3-v1-1-f8bf8760ae90@gmail.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

