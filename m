Return-Path: <linux-usb+bounces-11756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144D91AA03
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 16:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26BD286E46
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 14:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4B5195FEC;
	Thu, 27 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj4K38Sz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDB13DBBC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500181; cv=none; b=h6DzymJlxq9/ogbcjFkAokmWm5Z+x9GLc/Ik8MH14l34LM46A7LRHvsh6hZswxxs4GT1R+l+PZkD7cIIGXXAmNHSzY7Q3y1/76pDN+zF9HVDF7wD+z0xFlPDJhaEGGN7C+2aUADdpz4R8gYHYgo71oDEkMWHwI2yeIcv/qKpKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500181; c=relaxed/simple;
	bh=FrQ1JHDj1JPz4oAtaTDr9fUvJWUcg8TPY5zWcjy8tRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=trsnTsrMVIwLcINfXw4RikLI2iQ8ruxDJ2KFnSdKhgyxsnHhQ0rG8TTtfKIcjsM//BhDOqhJjqgS5Tvz9rhFSvYd0OQe+3TvGP2QqO3eTWkzqW+5R6qkEC55CkjXte9rkrClhavvqUVmbZQ+G3gtN2gQpaMPhq/nb9GgP8RLASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj4K38Sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6C0C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500181;
	bh=FrQ1JHDj1JPz4oAtaTDr9fUvJWUcg8TPY5zWcjy8tRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uj4K38SzPc8BFn3HREd9gRL38TEdK2/mXuEMHExyzRN9Oh/cHwgkvAm8YO6jtQIdQ
	 XEbSK9cnm6mdQ75cVproKGUPgg4N4IzfMXVVeNg0lvkEvbg6sxogEP9tXf3TVWSNi/
	 QOvhpwKu8Z8Wpn/r+e+6XVvr4/UIRfpCfX37v/jVAcGNnwVBbNkRDbmonbQWPlPYWa
	 tfJqj9vHzTroNEBz1NmYbzXIz/UvsU2eBDloKRg9pMAFRuVgZ/vv9MOarqyUl7UXUt
	 dXXgKm5DuVSfmqbJGf7lcoFFJ8DAOs3fRRhAysh5/yrsJlPSCaRtK7EgwU2wFBqMX4
	 7/nGORHXknZlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21BEBC53B50; Thu, 27 Jun 2024 14:56:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Thu, 27 Jun 2024 14:56:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218987-208809-UaBdJJP9tK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #8 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Remi Pommarel from comment #7)
> Yes this works thanks.
> Just a typo in the commit message s/Restore Errer/Restore Error/.

Thanks, patch with fixed commit message (typo, tags etc) sent.
https://lore.kernel.org/linux-usb/20240627145523.1453155-2-mathias.nyman@li=
nux.intel.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

