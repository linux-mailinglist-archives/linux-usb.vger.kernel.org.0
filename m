Return-Path: <linux-usb+bounces-13242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AED94C36A
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 19:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A354A2832DC
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 17:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D4719066F;
	Thu,  8 Aug 2024 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFp+NH4W"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730482C7E
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723137152; cv=none; b=YTOo/1lGuLGninJXoi10hpTY+UKw9HnC+sqhEgQU36fTxaAb4+FHbscWxTXYypxEec61eJtkMEFmKYfFoQGmtS+ykFci3/LySvjIy4edeaxo/3WFZSzw1KY0icmPICyAgpKhAIjfA2De7tWh1I296BSzxKvZkBi2FKpZgk3AAd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723137152; c=relaxed/simple;
	bh=z90EgPafH/wtyL7Fhf3hN/rWE9iI6pLusrEUL36IzxQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/r946sy79p3EizKS6GDiVRmqHnwQsso93bEpEqxJ8j95azTaRnmQJalZ8Ee4w7Eu5UyNSDFpqGW78eqGN0XYkYE8ZzTvNS4YFYv+UOapghfLE2IAkpeYXwAhqA5v70vyeIk7LV5qcISMAW4pizQuG7gNmunv31A3x4nfL2/kYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFp+NH4W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 106A9C32782
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723137152;
	bh=z90EgPafH/wtyL7Fhf3hN/rWE9iI6pLusrEUL36IzxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cFp+NH4W8I7RsL2606x366Tod4FPlyR1mGsBOyqFKAtbjy6dsta1yOKr3PCtIGQsk
	 ISXvm2jRUlv2NFNpn48VppsxOQzpqHQT9dVFRyZN+DyAcLwOXsLh+mGEilVtD0rD+i
	 dtI9PjdMQVemGZdo7TOgFehA+Nu0gne8y6pwIMSjGNeoGRpRmHP7ktZpzL4TftjyaJ
	 xT2u3sXicMYQBZUkENNv77xIZPdyT2AzfcBiO6PZxrzd/hQeA2LUhWbh/oMCaIyrRY
	 5dV3/MK971V2o9V9OvFUx34x9QxouZjIscbcM4oFysI/D/q8Z3tLSF6oQUfbhGb1sl
	 6/HbMD1mwBtBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EFCF4C53B73; Thu,  8 Aug 2024 17:12:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 17:12:31 +0000
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
Message-ID: <bug-219111-208809-IpmoYeyoo8@https.bugzilla.kernel.org/>
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

--- Comment #37 from CH (com+bugzilla-kernel@c-henry.fr) ---
The mixer driver s an ASIO driver and Mixxx uses ASIO as primary sound API.
Maybe that's the reason? Maybe the driver don't even interrogate the device
about its configuration because it already knows it and what we can see in =
he
Wireshark dump is Windows interrogating the device not using the ASIO drive=
r?

Can you elaborate what old_scheme_first does?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

