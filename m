Return-Path: <linux-usb+bounces-14092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366995EC5E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 10:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62391C214F1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 08:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCC382D7F;
	Mon, 26 Aug 2024 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM4XF3JH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A682899
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662246; cv=none; b=kBgKaD23aPScXGJ2jtg8gw1brXCcJ9JxkM0Nn6glEisJZAhQg0j4mbAaPr1dnK7sp/dxuxi2yvmq1eDMTO7dPiLnjzbJbK7u1a3D/ZzApI7g9XcHaoCq57b5pmbxYppRQHq8QtSw0pWC4zZ+N5L/hkMRXrH5ZgvdpinN6nDHNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662246; c=relaxed/simple;
	bh=FwnWEDmL/vqikRkVKYQN6hYf5HWk943TqL7JQk0YhtI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W9HX8n71nZKgJwfcoqdhEE42GRc7Ntp5h41Fo2MaYW8CUEEl4iUjfMWbAKXcq07Z1moHfAv3aF4CzAI6hws2mFWOnJhJXcqCLzQHpIIXsJ3Y5Hjn/u925C4HMwLGy3SuupnwRmmktf0q6YNd0vnDJY5SrRLaUyufP0lioZsgu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM4XF3JH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8166AC8CDD5
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724662246;
	bh=FwnWEDmL/vqikRkVKYQN6hYf5HWk943TqL7JQk0YhtI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PM4XF3JHwYhcttKlRdtlLVLhUcp3HGS8phZSfo+ZTjibsTqcGN3QH3yh2pu3gQGJR
	 BC7iT17JBSbbOh8D+wE8kyt/oiatgMYHCUJLp7ysjCg83ogaomIqQZWHO2mcMdsV/R
	 8BW9/eH/dNE7wUlkpkiebCCJK26RYzIX0gLbPfOjGmayXhGfNy+eK2Upwav8aZCHaP
	 m3ElB6NDqxkQnJHGYloAjXTgMiPaM1tMlXDXA1yLlp+B6D4j6ZS/dY22ZAZstWAtpt
	 2FgNlfB4puxqno76AVGzoIuDT5Zqg6JqePxa4uS37ioxFhdNGE/HRNc+pVdYn1AAOh
	 CrRrOwu7TmVzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6E7BEC53B7E; Mon, 26 Aug 2024 08:50:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 08:50:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-sGmkfuftql@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #1 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306776
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306776&action=3Dedit
kernel log 6.11.0-0.rc4.38.fc41

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

