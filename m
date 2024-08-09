Return-Path: <linux-usb+bounces-13264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562194CD62
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 11:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB58B21FAB
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 09:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F2018CBF5;
	Fri,  9 Aug 2024 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rr5/S1gu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045D41DA21
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723195981; cv=none; b=Eg1p/Cn7gJOa695RSUS0PHXV9YCPUJt3vBoudD0nLO76YuIGg+ipFOvsiSOoqZWgvJGzhD4em8nvsFydPlflURdjKwpEATpu+1FAVPNUzqgx6pfx1pkFrldAwsc0DZCpLYET06ge4bbHlBP8pg0gVuk3X889uvhm8i9FJgKzQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723195981; c=relaxed/simple;
	bh=wGCFW/nU6AINuI/t9mofXVTUSNMlzpGrflWJsFzsabc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHbdIerlWvd/CB676s0HYmvoqChTauk4LGqy6tu8gx36laNe8gqxBar5R5VLam+7Ut3eVlgQJW/v341vHSRK+gjNZA3YAHwfLDC4TWidtj7bKIgVtcHPpZbk9q24gyCS0SI4ZnBnbgpQUhLcJhXNzv7s7jabsDKe3q4dp+6l+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rr5/S1gu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7229C32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723195980;
	bh=wGCFW/nU6AINuI/t9mofXVTUSNMlzpGrflWJsFzsabc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rr5/S1gubIuhVHtEGK8oRNGnuDU8tRvq1QfKMjheCHhDCjmmUBdGScW4W9YsOIBCs
	 /c13GHY4zgUr3wVmXq7LhOu+KfYGiMYye7ID/qCnjpd3zHouPdskjzPUi2yu0mVPcj
	 j0PisnGbDIzPdDEuxU/qUOftzYot5aASI3w8USeu+1z7Csf6SMFdeYH+DYYP/YOwK8
	 /tTMHkfiZW0c0lTxfKiqJkodnDQwyx8ki9znF3gOv52bCMueCtGoDc9G/M5u2EJBt0
	 crUpKOH398J4OV6AIAWHcrqwnelulKnNjGJLMsdQV8Y+bK6tmGkq5ASstZLSan9dR+
	 RodanSghn0PWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6489C433E5; Fri,  9 Aug 2024 09:33:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 09:33:00 +0000
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
Message-ID: <bug-219111-208809-OcWnNAEWkT@https.bugzilla.kernel.org/>
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

--- Comment #44 from CH (com+bugzilla-kernel@c-henry.fr) ---
It looks like Linux is unable to discover all possible configurations using=
 new
scheme. BTW, do I understand `old_scheme_first` correctly? Linux will try
*both* old and new scheme but only the order changes? Then in which cas does
the other scheme is tried?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

