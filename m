Return-Path: <linux-usb+bounces-21158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E3A4847D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 17:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C323A3852
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AD226F471;
	Thu, 27 Feb 2025 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig23QLPF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9526F46C
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672335; cv=none; b=fTc6A/tcg3XvoSIKlPoD1CsyDKeroyppJN6RJrD1MwxxcJOXjbmGO2f51XBVwAQFLxWcb5FhbD1wtLZNf1x1o6cwDhbmkhj9Uza/9u/y2CBEsyAqNF/Ik/TxfZDVjRoTFaEyJDW0alnxMYLAX1aJwN58TeqV0gt/g+eoDJBWf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672335; c=relaxed/simple;
	bh=FbpxtgXJwHoIhvwyMICCpotZI6EKuCtTaH977V0CuQE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=garvkDSy52c/bOCX97FRg3PcOrrTAGRHPS/jrcmQAQV7oFXfnQ8US06mxl+Qbu0rkh7nLcDwSKttMNL79RR3cHyq5KrATKbNKDjCd+f6a49ZXYb+81/94tEolYKDSZggoX7bccRYqR16DHhRR4NCFQXW1B3LUfx5G/MRz8tNnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig23QLPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74FA5C4CEE7
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740672334;
	bh=FbpxtgXJwHoIhvwyMICCpotZI6EKuCtTaH977V0CuQE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ig23QLPFVcZA2cUUAH+MqRD60iDnExeAUQQ8PQyXpC0r8hzf0oz2cLtGbFap7JrXX
	 iYvf+VL1T/QzjNTwEmh4hUEMEv3O33Uo8liEkNH8ntpjUyE2zMkJ4IqgZpIi9PAgPW
	 juELz7+nHS/DNx+FpnHo7fI6XJTBWJOLUHgJGRaJzYjKghCK1Pgw8OTjrdYVw3Oo2c
	 k6nWmJk0ekUkSjAwAWaFWxK1pewvMSs7nJrYKYPbnzV3AK0nYfaUv/Z0f3J4HDFZWH
	 Xjx70BW0Uyv5r9hZNnwczkAg0wMibdkywgVlObwPM6OwoJspxlxrshjH46TBBz7zUh
	 uwYN/5Lztgc+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5F96AC4160E; Thu, 27 Feb 2025 16:05:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 27 Feb 2025 16:05:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-kfpjumh3tE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #6 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mathias Nyman from comment #5)
> I understand that bisecting an issue like this that triggers rarely isn't=
 an
> option, but can I ask you to try running 6.13 with xhci dynamic debug
> enabled.

Will do as soon as possible. Thanks a lot!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

