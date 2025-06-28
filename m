Return-Path: <linux-usb+bounces-25214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DEEAEC741
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 14:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C81E84A19AD
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 12:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F386824DCF3;
	Sat, 28 Jun 2025 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvjcwQqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7180724A043
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751115223; cv=none; b=QlMWo4JJ/WWbqNNn5cGbPzCKSUEknOqAYkMXa0NFUUMgnzdZzznHE2fCUvUaPv7j6ipm8UPqWZckIfu1Yw303Y/tS1LH0/p3PdASKJaVKsvkYN4jAsvYd7yEgFAHBMMMUqgP+TJciuVP8Z7nK5zmgxfldE5AqkaI5w8nv8/1hmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751115223; c=relaxed/simple;
	bh=rzh9b9OkOaL/E3WRwRbPug0TpQXISjZzdR/0LcuW6nI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ANlnuRB3tJXlpnnrouQAlcorLclpc8xzM1ljQ5/OEZdWR9hFL/XnQi3uru/XfmQhbh7ZADjbL0uljlf8lqGJ9kVWDaQQdhEGfVuEcAuvF3SlZDza32MozQ7kAp19z9VnZjoH8OTlsI9Hzmq/VYZfet/X+1Ze3Mc7LE7+7y7bbAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvjcwQqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AC5DC4CEEA
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751115223;
	bh=rzh9b9OkOaL/E3WRwRbPug0TpQXISjZzdR/0LcuW6nI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GvjcwQqK4eDn0Pn8sUP7kSMOfmzhebCPzcxtkKWbHuR1rRPga/WY2VoZu+OVmvpvZ
	 PnreKDXgHKjl8Lnh/0gJuePg/EnEjI0mtp0flVlioSF2qByuB/rUEzzuTEbBpagJly
	 EXKbWEIiUtX8ZwCN/HDPkvTNDBnYmaloM/5TekZf5wsNhJ98iJ2PoFH7lUzJR4+ysY
	 +7oVQ01womDNjBQIfqW65IhpkKL3Xlf2yzSgM2Lo9YLFW7nvYVWXxWnC4Z7PKGPDcU
	 /Q8AZD3k1NoAGLyl/icQiFYMPbur0kFGaSAdte8aENVZsA8zWyaE5e+kejaijCMVoU
	 f4cQsD3ulKd4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE22AC3279F; Sat, 28 Jun 2025 12:53:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Sat, 28 Jun 2025 12:53:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hi@alyssa.is
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220284-208809-5JsQn6bWzA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220284-208809@https.bugzilla.kernel.org/>
References: <bug-220284-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220284

--- Comment #1 from Alyssa Ross (hi@alyssa.is) ---
On Fri, Jun 27, 2025 at 05:29:56PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220284
>
>             Bug ID: 220284
>            Summary: USB4 / Thunderbolt not working after boot until
>                     thunderbolt module is reloaded
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 6.15.3
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: kim.lindberger@gmail.com
>         Regression: Yes
>
> Laptop: Lenovo ThinkPad T14s Gen 4, model 21F8CTO1WW (AMD)
>
>
> When upgrading from 6.15.2 to 6.15.3 my ThinkPad Thunderbolt 4 Dock stopp=
ed
> working, giving basically no signs of life even when unplugged and replug=
ged.
> It doesn't start working again until the thunderbolt module is unloaded a=
nd
> reloaded while the dock is still connected. If I unload and reload while =
the
> dock is disconnected, nothing happens.
>
> When booting, I can also see
>
> thunderbolt 0000:c5:00.6: probe with driver thunderbolt failed with error
> -110
>
> in the log, which wasn't printed with prior kernels.
>
> I don't boot with the dock connected.
>
> The issue persist with 6.15.4.

#regzbot introduced v6.15.2..v6.15.3 ^
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220284
#regzbot link: https://github.com/NixOS/nixpkgs/issues/420730
#regzbot title USB4 / Thunderbolt not working after boot until thunderbolt
module is reloaded

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

