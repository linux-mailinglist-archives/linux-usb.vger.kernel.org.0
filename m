Return-Path: <linux-usb+bounces-20245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D8BA2AA70
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 14:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 211813A312A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 13:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3E41C6FE8;
	Thu,  6 Feb 2025 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUi0fqkY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71181EA7F6
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850030; cv=none; b=tIIQx9Ntukw/XlvA0tOcgrWFYPpWh7zRDvoXyvUygOe/WkW39TR1ozGQSMlm73pmGvZz+Qkd4LPE6PlJrQARdwxA+2kVRbtBC67V1p/YXoTaBx/XCAq4T8tn7yR/cH6Jc4vF5zLpCfp39NiBR2dOFvewSWiIelVbr/ddFq/9DpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850030; c=relaxed/simple;
	bh=FYiaqXUW+XaWLV8y4hF/72rXxhHGfWgaxZIQ9YKx1d8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HEBM/mLpTUr0veNy+p5UeAYgyBu5D8XfW3M1lGsy/Uu7XpdgfiHJyHBpG488EmnyEC8BjHpZJAoj00hnoRsWzsYYLmtUITPacu7RqZ/VL1aXaZPoNuu1o5ZeQFokxthMbtEL/xY2XBW7WBuq+2/c0UlI6jr6fFqhLPJEMY9gK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUi0fqkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54640C4CEDD
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850030;
	bh=FYiaqXUW+XaWLV8y4hF/72rXxhHGfWgaxZIQ9YKx1d8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jUi0fqkY4QEQ2oJzcCn0UkCZ7sxQfLxyjbceq7QrEUEzXuwx6QagUNDu1nrFx2+ei
	 ZKE9LwEAJHDRqv1DJeeZnEkaoTW2/v1fohMIZ0Mlh4h5RwMAbHTebTad1GzTn2yLcE
	 vTyRzPtUbJwPKrRgNRZD3frnSQBGDmpT4nMxjc8RoLuZcTfgKmjoXuzKBLYuazeaYY
	 fHWo5RxQCS7PSfC5Fm98Rt0UqfqXTBGTOy6lxVUNsPXnxGBL7qXIZka8fy2yEXbBDT
	 s5yBIVNFQDrMOd68tUbbVkyFUU8jvK2ORHeCxLBjVob1R5Yficd7+3q5F/0g/MCsF1
	 osBJC0sGDoErw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 483A5C41606; Thu,  6 Feb 2025 13:53:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Thu, 06 Feb 2025 13:53:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-UqRN0XDkmm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #14 from Guido (guido.iodice@gmail.com) ---
The procedure is a bit outdated but I found an updated one specifically for
Arch on their wiki. I'm testing it. So far it seems OK. Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

