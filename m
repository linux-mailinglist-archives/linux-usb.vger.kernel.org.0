Return-Path: <linux-usb+bounces-10205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A956A8C26DF
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8F61F24A07
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 14:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B17016D4DF;
	Fri, 10 May 2024 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPGHal9E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EB3F8D1
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715351372; cv=none; b=IpUrb4Tt97nucif/tb2uKbd/82lnoerpGzCtX82TRZxMmg36pRRNNWzkOPw4XjWuOxj0pRIgT+K2r3Ci5mPbpX7y2iky2dPAQnOwpsEyPwbX2R/wOLY9yBGlhzp0Qxz1M98FICCBNPLKtElH3UGHc2xn0jS9D/ch5K/NcBuSJE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715351372; c=relaxed/simple;
	bh=S1kTG7eGKWEjcnmQRjxvCVRYjytJR9nfRU2GcRHLLAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GMLbs/OgLm2WIr/+o7U1OWpEgL7Vzit23Iv0oqMjZnpizM594hZWAx4KxxK2MMJpKcE2BHceRuLTyDt2bKVN0k5IcFGSRe+IPL/p8ek8BuCU4cz/d4ls2eiWXMMb+NnPCnjWHE+/ZuMQ+1Wx67j9k4gdtI0TSb+uZ7rEY5LcR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPGHal9E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92DB4C4AF07
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715351371;
	bh=S1kTG7eGKWEjcnmQRjxvCVRYjytJR9nfRU2GcRHLLAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NPGHal9EBgHNpU34Er3i6qtb1eyfZno2EZ+yq/+K+s5khZU47f4qaDo/7adwLpOik
	 ureBf6DQhtidfU6TzgPKw0uogp4Xps5u4O2u/j+86JC8jw13alKDQG87o1xSLio68m
	 LXFM//MfiWLCkh8zvGJkzRJIfuU3gpSRfhYAXqhdIoKkoj76p8gdQTbwdDJfbLnydK
	 KtLg8F0WlO1pvDKU3pNLZuj9IeL+T2XpPBAroV8+cQxExDhML7l1sF4f/0r0WAdw7k
	 4vX3wF+SY+qLGO/ZCn5qJf6m737ixN0tTHGgnmmCvczsCGlEZpMaNViMhW1gCPrfhA
	 JBmyU8LGlUZyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CF42C53B6C; Fri, 10 May 2024 14:29:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Fri, 10 May 2024 14:29:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: EC
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rjw@rjwysocki.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: acpi_ec@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-218789-208809-kV6BwhXiTK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

Rafael J. Wysocki (rjw@rjwysocki.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |EC
           Assignee|drivers_usb@kernel-bugs.ker |acpi_ec@kernel-bugs.osdl.or
                   |nel.org                     |g
            Product|Drivers                     |ACPI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

