Return-Path: <linux-usb+bounces-13244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015B94C483
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 20:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CDD3288E30
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 18:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB17154454;
	Thu,  8 Aug 2024 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgFUyeHI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6C15350B
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142183; cv=none; b=lsix76gW8skUaXp8C6OP2kx8/BPI/HuWDtkMaOLXkxR0RchMYOKzOkg07kCUdsLfnABWIWAjtMCky9FlAK5frPbry86rX5zbXatIsVHo2ZgLtzuDvqTKWwB7TrZtbiDtdQ0ALJL46pb76ilnqcTJVH60kEGL2mt81bGmxBfqp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142183; c=relaxed/simple;
	bh=NEw6I+5t9LbGfOEcjSxNaDkvC62V6vn8Ldk0i+kv1MQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YyrqZlN1ZGcOyemyDMufNPZd3KllVseDhvyMw4fXs16y3/yFyxFmsba7HECYGNy+IJ7WzmhSnZr+Z8RwLsQM93Z+NshzVS29Yf7E3nCg33UOszQ1JFKi0xp+UAe1SLwyQYeU4EKvxPKaWsdF9qJUG6EmYyEunRzWTF4LHaChjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgFUyeHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D842C32782
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723142183;
	bh=NEw6I+5t9LbGfOEcjSxNaDkvC62V6vn8Ldk0i+kv1MQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FgFUyeHIK7U8tdktyMvzvSHCy7kE09myMocF1LuCIiWV+f6UixM+K7quYtebpTcYw
	 /mxFbcxEyVjo19c9pRSFk7JcxWDYImpEUFkh054sNPztYe6sNaB3MwQv6ZJz4HeO0L
	 bZReE3CGKnIkXUuvQRvuNPhBqA7Xqzj7SyCv/N1+n6UfCwvfwY32cL6qHXVCpxifVL
	 tM6CZbKs4S7ZbX9fw90elTC6VkyQNCBZR1G/l8xBaCWJcGo8piniNRa5R1KBbc2FRD
	 QThARJjFezEa5RnLgv6IHkoUiUlAx+5IvspxmyQostG8cPSzeVklsIXXhjLdhRckka
	 AzQkadQli7S9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E784C53B50; Thu,  8 Aug 2024 18:36:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 18:36:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-sgckTC33bv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #39 from CH (com+bugzilla-kernel@c-henry.fr) ---
> In fact, they do show the device in its first mode, using the only config=
uration in that mode, so it shouldn't be doing 4-channel I/O at all!  I don=
't understand that.

Maybe I messed up the Wireshark capture in some way?

> you may find that resetting the device while old_scheme_first is Y will c=
ause it to go into the second mode, even if it was in the first mode before=
.  You could try that to see if it works.

How can I do that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

