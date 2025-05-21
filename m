Return-Path: <linux-usb+bounces-24148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BFABEBF1
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 08:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8DAC7A797D
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 06:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD732356D9;
	Wed, 21 May 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R78jODoG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDF2356C3
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808654; cv=none; b=uZNgM3LCCLATV7HTpchlEz5LVfvzJWeynQYkwZH595eiN94OmtGQfb5FM+FPoeDZlNiW1rRJjr/6cXRt5jGd0VRfroklaDZD/gWHb6QbRAg1Xyw2GNKTCtc5osvv5AENrE0MPSsqlyJzx0pJhTwGIftdIhP985QMAaN3ShwsCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808654; c=relaxed/simple;
	bh=4ZTl4rq3YswfGXB2EUmFZJ/EQynVGzpaRdr9yhFhpc8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlweZ/Fr8DcVaQiBXpmyS7/d1VABCCk5gWsGBdBsf3iwCTvdQnkYbpyGNxCI1/V2tIlXqbfcqNiWL1e3P8qb/KVQhuNJMxXx1Jzv5bH6cYz9ruVl8OgAgJm+t16WOMr/n+CvMOF3QOB0zwrsmfABtCFkbcv6bqhE43Q6J4NOu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R78jODoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44E21C4CEED
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747808654;
	bh=4ZTl4rq3YswfGXB2EUmFZJ/EQynVGzpaRdr9yhFhpc8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R78jODoGDkUudIJjnI45Vq1dsnFLIgaIL/z8VpoHeQb+wPuoKl722VdWbs45WSfcs
	 3FT1PLZGjNtPL8Uvgapbz1sN8kMRwXtnBObOyj1qAIWVYWuGkMpa84FiDaTcdidxZ2
	 7PkP4/8xyTEZBnpVmSIgN0omu5GwtINWMwdoubNp/RPC9QExOswvQKSAjZRKRhDcAk
	 xmPmu4NVO5G0XOss17cNnwY1bOU1LSOh90UeG7+aYZIYn76EkK3PM053xV8s4//148
	 el3OkpB45nEY+2eaSCuJIQ/CnGlF4Hy3RpjYABCMrHFwMuKPtWRRsytRCoJCtMcON+
	 iSUaFO7H26ZtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A16BC433E1; Wed, 21 May 2025 06:24:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxNDNdIERMWiBDcmVhdG9yIFhTIChVU0IgQXVkaW8p?=
 =?UTF-8?B?IG5vdCB3b3JraW5nIOKAkyBhY2NlcHRzIGh3IHBhcmFtcyBidXQgcGxheWJh?=
 =?UTF-8?B?Y2sgZmFpbHMgKHdyaXRlIGVycm9yIC03Nyk=?=
Date: Wed, 21 May 2025 06:24:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maps@knutsson.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220143-208809-PcsN525Zoz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220143-208809@https.bugzilla.kernel.org/>
References: <bug-220143-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220143

--- Comment #1 from Brian (maps@knutsson.it) ---
Created attachment 308153
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308153&action=3Dedit
alsa-info

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

