Return-Path: <linux-usb+bounces-17738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6399D3934
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 12:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808302879FA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 11:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FED8199E84;
	Wed, 20 Nov 2024 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1/J8mo8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878A17F7
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101120; cv=none; b=rz1wcOr3WwWFZCuQZRNKOl1aTMSHLvP5RI0nG2BCtdBeWDKGz5aoEsYkgdptPtzkw+OUzA4vOPBIrcQDe/CUUVkm2dnQLZT0eqnVDuvPgmCyBJAJGwoS8sIUmkminJB98tDHmEJaT60amH4ayGftYjw7xO0OROrQ1CNZ3shbhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101120; c=relaxed/simple;
	bh=mC8Iu6tLLKal4Bzy4TC+bgfoptls6MvQ+V656gtDXJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p2fllNzv4V/3rZPdr5jOqMhOcAegWsXZXQ71jmG/wBI0wmK6+XQkVDImnO/gdMnGoeToIhCLsQ+9onY4hciQ2R4WwWcKu2Wu2y46iYAt0lzPhJDBbhOVXJ39VVYw6J705sBQDTcqJjuf5gPCOom3q39mUMLRKQqjSum0k5eSDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1/J8mo8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7449C4CECD
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732101119;
	bh=mC8Iu6tLLKal4Bzy4TC+bgfoptls6MvQ+V656gtDXJk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j1/J8mo8zmfzs2ESIYjYSGAtHbn+dCPHBwTg20/KaXMzmWk9VSi2Zzh6Yk/h/eNzq
	 0BLbjZ5CijnC22IPg7LM8AjmNtazT2WVM+m7JWD/kyzoruCVIjpGQv48a42Pbj4jsv
	 dw9GWPQZKa51zOuNzSz3ZsWPzVjopKbJo4YaCPKEHnWIeYka7Xz3fS6JpTNMPh/Yt3
	 z10+Iqq8UxXsmKNnVhkelVBw96Op84yYH8q2xAs3Tnw5DJJo2qwrJOcJwuGPBESBfz
	 Luv0V398Qims5xRNImMkcy4bBD3bT/WXYClhT7RaQ1rmiSnn9uEpvu086Z3hBK0+n/
	 tar2ReG8Sx/5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 93057C53BC2; Wed, 20 Nov 2024 11:11:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Wed, 20 Nov 2024 11:11:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-2oJaFt7aAh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #9 from Eduard Kachur (glite60@gmail.com) ---
So, I've got ADT-UT3G, no errors, no crashes. Is there anything I can help =
with
debugging older boxes?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

