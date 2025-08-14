Return-Path: <linux-usb+bounces-26827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B3B25A95
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 06:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBC21C81E84
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 04:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433EC21421D;
	Thu, 14 Aug 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmY1QJpi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB9815624B
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755146700; cv=none; b=BGPKFtSJEqM8N5XZfpcjalyACAw2ROmmzHBZrNue2Sy6mh88ruMbND9mVcpTzrJcWI89PzDv+1ZrV8KoeUZ+dBd00b/rfUsCfVAc1pfTwCoeZq8/FRAth3xCID81ZkRVTIVwCqzHY3nM01ccXvTe1r0GRsaBxdYVzQ09p8RZJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755146700; c=relaxed/simple;
	bh=TB9bpv3hrwdShBhu8bS8fXovii0wvKwxuxsgMX2iG4k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sxif5TMmnZPoT7oCIHMyVydQUVZ/SWXIzYr0cpsWr204O/G32OI0c1I4sdAOGzFRVFL4ehyW4EdKnxkX21mIOjJjAgxj92xcKx/HZsuuO4P/33c4zK+iWhk47cJ91CcHL1XthZ/Qyh3v2S3jECbKg3lIKYg3CuXmaunWgOAQKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmY1QJpi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A8D0C4CEF5
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755146700;
	bh=TB9bpv3hrwdShBhu8bS8fXovii0wvKwxuxsgMX2iG4k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nmY1QJpik78Ty6NiJ7iHEoydJQtVl3ntaw6FcHF1y+ywFPAs63u5kX/X7cSZEXRPg
	 f5tzuM4H+BOo0k9pIxVOUWrpicTtag+7VJQffe+RZNeiJmYfSC0gAOnFKvRbIXfal5
	 on8PZbQgvL0NiaIlI1esef3YkFMysOJDsjYwG19Zf9BvMz1Y/5+MTD7slnqVpt3vim
	 Fs/vyPg6+xMzLzpFoHI3HKn5zWPRU5VTlu6W17W5dpEXiiGuFC0UmtcPky0bWSDgmI
	 jnM0dxS2/O5HuWCoyZU5mMBZjhfosafFPJ4nelzeHscsYuVsVRarAAungZ7ZFgEkA6
	 DdAN1qNveTaNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E23BFC41612; Thu, 14 Aug 2025 04:44:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Thu, 14 Aug 2025 04:44:59 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220284-208809-mY9tWLh2We@https.bugzilla.kernel.org/>
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

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #3 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Also please attach full dmesg with "thunderbolt.dyndbg=3D+p" in the kernel
command line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

