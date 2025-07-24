Return-Path: <linux-usb+bounces-26131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8454B10261
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 09:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA91AC39BF
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 07:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B6726E711;
	Thu, 24 Jul 2025 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBuAL9M/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD226E6F1
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343641; cv=none; b=F5cpbLn/mClP8EoDt4j4F4zn5Wuib/WKU8bLtdJrQB/8gG7lgTp3c5ZkNIsoZYTCcsSQgGbYLV8GHqm/qwjqFbBM/u5NgZt/kWngV3L2dkxDb3EZTAaXr7oD+rLSsxpTzY/wElMx3Bc/VHdeE0CF39QOlrGB2DGpKwUWa38Uqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343641; c=relaxed/simple;
	bh=WXXZYXtWjnCumb+ZOw/64lczWC2xbZ3L6Pboz2YpeTI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c8EMeppFldskRHNYwUNS7yCrdzvfnb3vhnJD1MKidWiSfSwEkhp3IiE70qNXd1z30RtSrj68ePHDszQMSFHNgBakUE52KVyCi0vA26xd+iVzSINzdJg4NwSJQjWoHSsZGDXyPQAjMCVwUM0xsMm4eiGig6L6ozLePUdwFksMhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBuAL9M/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28A0AC4CEF1
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343641;
	bh=WXXZYXtWjnCumb+ZOw/64lczWC2xbZ3L6Pboz2YpeTI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bBuAL9M/obJrSG3PdQsmPrwc2j2WSQJfn3xQ8So2GJ3eDBIefqFO56wR0WhtzrcFP
	 etfbU+Mwl6UeLRZNGf4d9FzyJDsAgfeIWxa480vBBTLALnzMMkidz9L4HDugMvPHHl
	 Q20MMmAs7+cKqRXsVd/RLBgXoijmnxPxWNqdVF+g+EpBrSVHOByb8UL4fpuNQcSlYL
	 aHRxt7XF6qoTAyVuV8UNIH5voAOvVYTK70ALzmo0UfdyANKXoGSjTgBpPwAIbEHtWG
	 BGIoKEOghHnbNCmOiH7lr67I8C/6BbS8F2UiMsaAeLkmHhJG4ZLxURvJA6hNfc5Uov
	 gF0jzOP85U0ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B1D4C3279F; Thu, 24 Jul 2025 07:54:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220307] USB cannot submit urb disconnecting sound card
Date: Thu, 24 Jul 2025 07:54:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: targz@rambler.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220307-208809-7JdDrNtjao@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220307-208809@https.bugzilla.kernel.org/>
References: <bug-220307-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220307

--- Comment #4 from Evgenii (targz@rambler.ru) ---
Mathias I already tried to contact Intel about DDR5, bug they prefer to don=
't
answer making view that this is not possible I guess. But what not possible=
 for
Intel engineers doesn't mean not possible for me. I just had some issues
running Firefox for example when its crashing on start when I've used test
settings for overclocked DDR5 in Gear 1 working on frequency of memory
controller - that's why I'm not dropping this as possibility for issues in
Linux, while games running just fine. I been able to heat up up to about 52
degrees RAM using testmem5, the original one - not newer versions that simp=
ly
not launch on Linux, but in games it stays pretty much cold cause no voltage
overload happens on PMIC. And practically this is world record in overclock=
ing
about what again don't wish to know western society I guess cause its not
comfortable to tell everyone that they are not best in overclocking the RAM
that is not promoting high speeds cause in reality Gear 1 requires not that
much voltages and might work on simpler motherboards - again against intere=
sts
of motherboards makers I guess. But in reality this is the only way how Int=
el
could stop firing employees by thousands - is to use platform capabilities.
This also might be extremely important not only for games, but also servers
which Linux also targeting. If you are able to recognize proper work of Int=
el
MLC in terminal you might explain that to your bosses that prefers to close
eyes on reality if your company would not fire you as they closed own Linux
distribution recently. Maybe bugs happening cause of unsupported state, may=
be
not. My experience is limited, but still there is no one better who could
handle DDR5 on Intel platform. For me it works fine and even if latency not
getting reduced in 5400 MHz mode versus 5200 MHz mode Geekbench shows equal
performance benefit. So I don't understand Intel strategy to ruin Gear 1
support cause life shows that my strategy works better.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

