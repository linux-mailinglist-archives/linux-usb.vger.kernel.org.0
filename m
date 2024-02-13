Return-Path: <linux-usb+bounces-6358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA185357A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74FD2889B9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD825F494;
	Tue, 13 Feb 2024 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt2hpvGu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACB5DF25
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707839963; cv=none; b=pVZmxd3oE3ezqmbf2JtCZ3jVQ5a7skSq/GLvemfDqug2N8bVBPvaa9RlOoEVmZy5yQJN/GccgwIyx0jEp1WAdreIh6TLOVYdQzgYuPNAULdailh6Tfs4GP98vZ/HtERJ58nsACyam2+PdnqcAWCtwjwBvMYBWgKC2PCPsvxjm7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707839963; c=relaxed/simple;
	bh=PuExMx6mS0JVV2zX0VDjqKSKWEhm+D7tiyXTxhVvO+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFXFYbezLo43317fTB/aQ3YknX5D90IApM5Cc2uJeoim1Vlx5bQPrkL/hQrPqeFak6wTxcxp4PGy0QRsNkC8nN9mD94RqjwSbN/jcoKsexmGVs+ycyjEmKm6d2Fp8l7BSfKkti8mNiAIaJdEHx0m55OJnh1sm273hgl+MY16wEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt2hpvGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70FBDC43390
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707839962;
	bh=PuExMx6mS0JVV2zX0VDjqKSKWEhm+D7tiyXTxhVvO+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vt2hpvGuWeVlguSntVcNDqirxX5BeALEAk0coqGoQES7cCFwZSNzQlZlwo2cRASVe
	 +zil5uASSs8AFkJtNGP0XNh+q28SooDya9kv8IHgOYBC5wCYGXkVhByJm/MWi0MLFE
	 iWsteltJJxmx5suB80BdYESwNlSQ5HVqSSgVnXcSURXSr/+1GZeOrUnVlzq4TUCpyC
	 A3RhSQFd5dlU286+joAIVMOpampFkEk1EGn4rnJzRT547bdf3kcMPVsD6D4Xwn9jHC
	 LGKYXpi+0CWz5xckXnqt8HfcNaoWP9gWaBvj76UR9Osxfw/9bT3qxtRtGNK0geRndO
	 HJk8q0fnIG5Hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FA75C53BD0; Tue, 13 Feb 2024 15:59:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 15:59:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218490-208809-0epPdGaRvY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305866
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305866&action=3Dedit
Output of `acpidump` with system firmware 2.12.2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

