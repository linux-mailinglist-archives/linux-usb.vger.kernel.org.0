Return-Path: <linux-usb+bounces-19381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C21A129C7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 18:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297863A58BD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 17:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1796919922A;
	Wed, 15 Jan 2025 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2TNciag"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC71553BB
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961900; cv=none; b=FyiKNbzAjK8+8KBsiVvAE8r8bMoOuIfynGUsBkUPTlBOtiHKONe3M11YhFM2B0H1G8H17LWJkNig7tOQHPQeuOxyW3eqv2TFod4WYIkZSsMCHPhc5yzYgTqGWiUqQoFrTHQSjw8s7mVkp6VMpw6j+eLfM4JpAW4jdcP1uuQUs9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961900; c=relaxed/simple;
	bh=hQvu0Ic5EwC+x6UGo9AkLjBKdcklxsn7fPUIny8wLk0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/Sm9cKbqeR4BnEIzy9oW4wtzap7Mz3wV+Uuck96jnYIOU3NWJaHEPE8VsNu8xUZPb1bKgKELOyQ/9PJ3Lnw7Zp6L4DkYu8/1x3oasDu00xR9mp8F7NUk1ttPqnC7QNeejlnruwpVuPVg4Dhvie8Zllv62NGeCnDw7jeWeuEK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2TNciag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CC47C4CED1
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961900;
	bh=hQvu0Ic5EwC+x6UGo9AkLjBKdcklxsn7fPUIny8wLk0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b2TNciagHmoWTeQojr81Fv0+odfguACuD9W7xcfFdOVFt/ngSZLPZDzHhxYM1OKsF
	 /ygzRXPKTSALC7JSs7P0Z5RUEYbE3REK1ipkL2fwxX031vpNbBWMFI8NSsnJqVqSka
	 APv88yTcAFBaGsp4Uhd1jQbI2uW2fPEoVS8tEijSMdbrdA+/0w+MfJUdoRgg+E7LzO
	 s2619f5Mt/z7EpD8gbze7I2UUsfV4UuWmX1wlOQrV30iPSnNireJtzt1sVwVMo9TWH
	 iu24XeSeAdoN6ywOSfpGbzbS554hML+8ttEP43GqWmnEo3nTrGpGPn1TkLLNP4X7hz
	 WAhZtnCHq54Kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ECCB2C3279F; Wed, 15 Jan 2025 17:24:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 15 Jan 2025 17:24:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-oEyEqPTAUL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #4 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Stopping is not suspicious, but "transfer errors" are. And disconnections s=
eem
to reliably happen 270ms later.

Not sure why, the driver should issue a retry and then either get another e=
rror
or things should go back to normal.

What happens to the errors when it works (on USB-C or through a hub)?
Are they still there but recovered from? Or not happening at all?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

