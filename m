Return-Path: <linux-usb+bounces-28600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 651ECB99F8E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 15:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F6461B20C2F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A122E7BA0;
	Wed, 24 Sep 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twoi8nYm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40842DF703
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719228; cv=none; b=po4bn5hP6Vw+jKT2SQqkzL6292SMl1+m9mp2DS+VQTJF0Hu09u5p0rnnWWm6LV3tTxhNd6HuS5gjXaPLnWiIKD4vB87HSVy98f0OipZpRywWHqXjxGNFt6bc38sTbtqZswSp7I3oABKjoX1RRm81voAyRT64gNS9yTLqZQkRibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719228; c=relaxed/simple;
	bh=v6GIYowCGBI6foafR6gdKeQITc2Hjwe4Lw9DAytvOgc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s9V781KMhohhq/IjR4OGeoIUo9hZ1GqceUgEy3wZCYw7xjHJ2tLSRlOslnPGv2JrPvL7raNuHxPBUWocZQH0dHzXCz/JU2Rza7HssqBb9RWAg3k1ghsWqiIbiyTKCpYWf0dYkEhAgSbIT7LmSGL2728yPIOqHP8zZQhk1c48+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twoi8nYm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7054AC116B1
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758719227;
	bh=v6GIYowCGBI6foafR6gdKeQITc2Hjwe4Lw9DAytvOgc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=twoi8nYmX/0xDi9EqWSLHI8HXqg+XGPo3v2F3Uay0Ya5EbXBctSyv+XeaGk3MQHny
	 qr2LhPxyJNGWcqsBuHRDGn/G2VdqH5MoE2vWPHkp7mS04ULKl/50ak65haNcsTDy0l
	 n8nad4ehm8oF40D5U+ZMhzFaENzaQ+GSaOS67EwWuAhIMqFOMVBe6b+LXNGERLf25Q
	 6r43VQAoqAOBbiGiEjMH2LeRPLcxHtiyF8+6u0K3dx1qDWKzQOu95rQv3I+OyxD9cW
	 PIPkyqDK8jhWWgzhi6auiO//0kYMbQS4DQ4P4k4rGhNG3ZpEslIRlsds+ynzhwKAPH
	 rqEfgigTPebug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A3FDC3279F; Wed, 24 Sep 2025 13:07:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 24 Sep 2025 13:07:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: ali@pourdanandeh.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-oBzv1bz8ai@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

--- Comment #19 from Simorgh P. (ali@pourdanandeh.com) ---
(In reply to Mr. Beedell, Roke Julian Lockhart (RJLB) from comment #18)

Thank you for your reply.

I was originally going to post on openSUSE forum but after seeing this post:
https://forums.opensuse.org/t/config-failed-hub-doesnt-have-any-ports-error=
-19/186156
and the moderator's answer I thought to post it on kernel.org instead.

I will post on openSUSE forum as well.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

