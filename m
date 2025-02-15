Return-Path: <linux-usb+bounces-20683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC2A37031
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 19:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A751518931E3
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 18:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CABD1EDA0C;
	Sat, 15 Feb 2025 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVB/Oexn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249A23BB
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739645132; cv=none; b=MXFOPgcDL1feBoCKYIn98v8cySL37neWh2Gwqot26PtfD3jRFtK9YRbEyNzm4l4qSaMxOKSVU9umqTIc/tH9/qQaPm/BM2lKAk6J7eAXewZ37akIWCvlB9i8Pw8RUpi51b4Bx7NTDMEZjTVJumwGgTTSpZkHsPQSMVb4UG+/iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739645132; c=relaxed/simple;
	bh=UxtDusDf1U6fpBGyjaYpw2Jkhf9ugYxO7v/7lPSwtwg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V6kTKZcEsKvwcjxhQHkt7RNtPyUR/MWTyHINlcqGGvJPxh8sVAS3iZODPSD+BBtp3KwVxisy0I7YNw4oJ9VGcJG09m65nGqnwbOyN9AStpyUC7V6BtjRJbU7W3k7DE8nriBObKODHhEvgTbfMSX3EAOBUCT8r+IgHQwU4LBWeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVB/Oexn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32779C4CEDF
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739645132;
	bh=UxtDusDf1U6fpBGyjaYpw2Jkhf9ugYxO7v/7lPSwtwg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GVB/OexnMMqGoKVcOXSkTCoQWy91xlgjJ45STUe7DyL67+7rg13hfNgqqKslGubOs
	 N+MxsR6ldHkdk4BF5McMrIpZ2AnwgvYb+Q9BC+9Ddi+ywMldlQUFzMmi0oekaPQ1Oh
	 HwcpjFe033F3lScVOZNvtFgyMwu+8yTzvRlp3s7/2NDQUj7uv46SJOiX7YjohcnP+C
	 BzZqmkBRcWtowHZsSVv7XH1XrhXykUWjJ81f/WZSfF6jkg/CTAqv0dIxf7d+ctdNzO
	 D7CxpbgzGoS2knr8TDuISylTGoVUDi2tNp49Dd/nzpWiah7N2SGK5egudYE0bCaIIJ
	 Ay+ZP5CiiDSSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2501EC41612; Sat, 15 Feb 2025 18:45:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 18:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-H2lBLwyjnR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #11 from Frederic Bezies (fredbezies@gmail.com) ---
(In reply to Alan Stern from comment #10)
> Sometimes intermittent errors are caused by a marginal or insufficient po=
wer
> supply.  Maybe the USB-3 ports on your computer don't provide quite enough
> power for the drive to work properly.

The motherboard is new (3 months old) and same age for the power.

>=20
> Does the SSD drive have its own power supply?  If it doesn't, have you tr=
ied
> putting a powered USB hub between the computer and the drive?

USB SSD was powered by the motherboard. And I do not own any powered USB hu=
b.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

