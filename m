Return-Path: <linux-usb+bounces-23528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392DA9F6E1
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 19:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8303B3BC1EA
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 17:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FAE28D840;
	Mon, 28 Apr 2025 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ1tkIoq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900415855E
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859966; cv=none; b=iwn9+L8aA8ZW8Jn8qDsbNILb1zQylQZnHusz/+BIvITEB6fTZmejOieVPpsZTipEflFXB5PO1PmBrRLWSikd03Y2+Sq1eVBNphujfRiRL5GvgXTgTAM/qXG6YfTeTrA2y3gA7uwZb+fc/LQbywjOGSEZ8XuFv4isda7Uk6wacoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859966; c=relaxed/simple;
	bh=wP4xccBG/9kmAwVIK/DWpvii7VPpfgkirfR+OlWcEks=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WDrwEbKFHn4eWZxJiyKtNweR3Q1grrD5BnbeIxgsSoG02tTnwuzO8SpApvPMSP1YjVDzNg3q+AVn61m7V3Pmi1PCa3gqPzy7/KXeXNNYG4ayURsDpiVUVbrsACGuvbIZ5oMllchbU10reNpr7wDP0OXojbqZD2hvJ3mlLl10/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ1tkIoq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B410C4CEF3
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859965;
	bh=wP4xccBG/9kmAwVIK/DWpvii7VPpfgkirfR+OlWcEks=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dQ1tkIoqSdIy67mFV1lMBLJOeOU8tHTX60B0kFxBp+r5LUwQ8gj1QHgIWM7+W4I5q
	 NPR0ZfA4zmIZhtFPU/zNSSqdeTi5/L9sbkB///g7OaupJ8/In/rOhubVY4j+tQKp+p
	 aC+0Vc0IJD9YTnBGK7WGRw0mbVu3B3L9nm9TBF+wQuS8ghYZRgCc0HRR52NOvnHUqA
	 wGGrHh8RQxoLI47SmTD6TinWLgFcjKXWA5428TK5RmAf+l3qaOPOEwRaoxH8HVlhm8
	 NaItUJH1u22JAe6+pgA5jX0pwtfAYISb99h/WSUOAryhv5xoHx7rSIdmLK9paI9Y4n
	 /C0a5rKCBFZvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7644FC433E1; Mon, 28 Apr 2025 17:06:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Mon, 28 Apr 2025 17:06:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jmforbes@linuxtx.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220016-208809-a4j3O9SpFy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

Justin M. Forbes (jmforbes@linuxtx.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jmforbes@linuxtx.org

--- Comment #27 from Justin M. Forbes (jmforbes@linuxtx.org) ---
For some background, CONFIG_PCI_REALLOC_ENABLE_AUTO was turned on for the f=
irst
time with the 6.14 kernels in Fedora, prior to those it was off.  I am turn=
ing
it off again because it seems to cause a number of issues.   That said, I do
think those issues need to be fixed, so while new kernels (6.14.5+ and
6.15-rc4+) in fedora will not reproduce this problem, it is likely worth
debugging with realloc=3Don

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

