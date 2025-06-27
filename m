Return-Path: <linux-usb+bounces-25192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3FAEBE71
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 19:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90294646C1D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A3D2EAB78;
	Fri, 27 Jun 2025 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVCJmaz4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177A171092
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045397; cv=none; b=gbrGpNw16r3L3CgpMJBoCZm6UbilgV3cNouwmnoPlXuWrkEbrkvZXOtHGUEd78/sGAa27AqvSL8rzeQ3QYeSXvzia3SM8WiddFNAptgiKOHE2wsGJzB7KziQPTe03YTW59Xve4n+ukim5VaTBci9qgo3ze2p9EM1k3RMry3PlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045397; c=relaxed/simple;
	bh=etz3X9xHo29OymaaWvYdAi7E0JjiIUmY+W2S0ZJbOkw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=npYzZgE+WAIQ7JCBX9XSuZ+CGH2zoLbMTZYP5uQBKpugS8JmgneekF9KYNXJ2V5vWIu1m3givUCggIb/ZZw0HLB9n+GG+86gGEPbUq1YwcolFqZtVnbOzQDV2xrWZfHteD/vA2XaqACqmi6QCONCpwwL8lMu4Aeo0ZRprTBH/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVCJmaz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07755C4CEE3
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045397;
	bh=etz3X9xHo29OymaaWvYdAi7E0JjiIUmY+W2S0ZJbOkw=;
	h=From:To:Subject:Date:From;
	b=OVCJmaz4jIE9V/ez9nzvjGUeZNoPF8Q+UzUysCDqzdqAfJ915AjwpMP6HMyAJ1GG1
	 Ae08KfQ1lSp/XK5Q7/GbCf6LZi14c0GphN3k611GGQeGTRB5sJcF5MKc67Wu6fp+wn
	 Urj509C/RdVF2boKAwUvYwtZ7baC9KaUssmO9eBqy59S+T/reTs7w06zLRli4Ei4rv
	 6TkZuYugZn4IvMm6adYivScMYXePshGGUuyghwJroV6d69yuh1aV7YhPwrGvstVoBn
	 rddjQdmIrSsCnflk+ykOaF9d3vuP6B99i+e3lQc3InBnMmtAfR8RX/DHerPhz+Ozqf
	 lfN1vwVzAQ3ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EB8E9C433E1; Fri, 27 Jun 2025 17:29:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] New: USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Fri, 27 Jun 2025 17:29:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kim.lindberger@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220284-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 220284
           Summary: USB4 / Thunderbolt not working after boot until
                    thunderbolt module is reloaded
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.15.3
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kim.lindberger@gmail.com
        Regression: Yes

Laptop: Lenovo ThinkPad T14s Gen 4, model 21F8CTO1WW (AMD)


When upgrading from 6.15.2 to 6.15.3 my ThinkPad Thunderbolt 4 Dock stopped
working, giving basically no signs of life even when unplugged and replugge=
d.
It doesn't start working again until the thunderbolt module is unloaded and
reloaded while the dock is still connected. If I unload and reload while the
dock is disconnected, nothing happens.

When booting, I can also see

thunderbolt 0000:c5:00.6: probe with driver thunderbolt failed with error -=
110

in the log, which wasn't printed with prior kernels.

I don't boot with the dock connected.

The issue persist with 6.15.4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

