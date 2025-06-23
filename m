Return-Path: <linux-usb+bounces-25011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11684AE3D1F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 12:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29D3B168531
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 10:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EDF242D67;
	Mon, 23 Jun 2025 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xtuu08wJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17450242D64
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675216; cv=none; b=qvBeKnuD3NUaBkxBHMqXU5t26kEOi5NlrLXK0gaJ8mnoJl5HiTi3bpIjAHj3ikvgC8XGFh3RypUl+EdVnKDfvcyv/aGl3FqcbSzXcaR1b94Nop8XAyJJBytqGJqTaQxT7Z/oW8WRKV5LclPGfH/oZN1Z6zUFXpStciOyV0bnkgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675216; c=relaxed/simple;
	bh=H7UjjHVKmiurEZkED+QArVz4MHUL5WniviThMVw+5YA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HnGGJZZSRE0j9b6uPCjxpR5QsAyU/pEMv5LG83zKNFV0vWbKxbUEgxLPbw8jJCIYhcQmRvM8wxLqmJKadMR5A+9XDdtKF+ZG00FkCmxGu9qZ+2iablsQ02ZqtOxI5dHGQ5dK6VwC1YB1FQP9ygwZx+LXn4v5jsZj9+Kk6SxRv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xtuu08wJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9193AC4CEF1
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750675215;
	bh=H7UjjHVKmiurEZkED+QArVz4MHUL5WniviThMVw+5YA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xtuu08wJEqYiPUCRiEl7jKcgJbD0cSNhIPFL28PKGi5tAk1qvb3uL5Dj3e0Tx31H0
	 FMZChzE4tOtxTFeDySTc5p9SHzks0zPnUXOum5LGR7e/m+GGYJfKu9N7AHcZhqWRpk
	 2DxKEbsWMY3kl/azpyC7VBpKf4GguACkM46C6zKe4NcWAJY/Jy38sDTjhMfUKAlBDR
	 2RProuBppTNayTJUcX5aze7pwm8n2Bqa7dfPAT40Z4JDSSr5wfqjzSgk/bmpxe6YQK
	 /dSnsi2XpGHFqej6qZrOs+MvPe5GMVE7VPT5t3Op6DyoX+caOY7fAt7KhrrtRZRygQ
	 iy/XXEU7/Uj5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83923C41612; Mon, 23 Jun 2025 10:40:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 10:40:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oneukum@suse.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-ihSqAAM5RQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #7 from oneukum@suse.com ---
On 23.06.25 12:03, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220238
>=20
> --- Comment #6 from Ryan Walker (fewspotty@protonmail.com) ---
> (In reply to Oliver Neukum from comment #3)
>> It is good that you have found a work around. But you were right. This is
>> supposed to work.
>>
>> Could you please post dmesg of working and non-working cases?
>=20
> I emailed you the working state to you directly because it had a MAC addr=
ess
> in
> it.
>=20

Hi,

are you referring to SerialNumber?
You could set it to XXX and indicate that you've done so for privacy reasons
in the public report.

        Regards
                Oliver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

