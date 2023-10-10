Return-Path: <linux-usb+bounces-1385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C497C4105
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 22:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4E4281E17
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 20:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2269CA60;
	Tue, 10 Oct 2023 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDMrbZ38"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B37F3B7B6
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 20:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0271C433CA
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696969150;
	bh=ImfFx22s14nFA12HbAQvpzMGOIo4wJ4SijEHAjelHtI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PDMrbZ38B1AN+ADH3LO1cZQ8sKsaqeKYMBtI/zJ7TijXY1F7+DcZbWECGqp3qsYDB
	 o9e0iTHlqUwe5xhbKqdTg17d+TH6HO3sR/Trj2LiPBuid7GQsvDE8si8PUO3TTh7C2
	 lQYPHDJ2RrbjVqlg9iCQUpo+MglyhttIszQM2wP9EzPvLjJiuMlWqN/4yA/E9X5HVx
	 Y4rrDnvftmbSpYq2kQkMAziZrqqJiaE2V1BnX5x9EutGszXlpS+E4JGHLUlaAutYB0
	 cKMMAHWs4koyEdH5HAHNcxp2W845CwAW7wdrQtRo+tCY4qBIYyHyK8TdxlulXS+7iR
	 da/PqX9lZPnaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97C72C53BD5; Tue, 10 Oct 2023 20:19:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 10 Oct 2023 20:19:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-wxKnzQFZwH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Ferry Toth (ferry.toth@elsinga.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #8 from Ferry Toth (ferry.toth@elsinga.info) ---
I also heard from Andy Shevchenko that he had the same error using even ano=
ther
hub. It seems the error is not particular to a certain hub, but doesn't app=
ear
on root hubs.=20

And indeed when I plug my hub into Ubuntu the error doesn't occur because
"debug check added in 5.14 under a debug config option" (Comment 5 above) is
not enabled in Ubuntu kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

