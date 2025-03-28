Return-Path: <linux-usb+bounces-22306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F5A751DD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 22:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77B43B1399
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 21:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FAE1EF365;
	Fri, 28 Mar 2025 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQq5rqA7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCE1EDA13
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196098; cv=none; b=SZBEQePHhXEHKKc0t6T0QsoakGaaHkYp9sRroIjMMISIA2YJqTz+4Ks+UABgJM82meJc45aMxkJpzF7l9Viwnx7vbSFDiMVFyvQcfEtC3DxFjmUbaAbkFpql337bFca2Cfu8DoEZTSD+asHa/0U6vF0zbOJKT0664FOSh1JXgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196098; c=relaxed/simple;
	bh=1+uGOX+vV4HIhFeOOD8grkzmUhCkfC7eNxfMRJyqYLk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TZw1ZJb0UbDB2VhPtnbAA7wHVX4asosyhbIiCRaj/Qzm+cKIcfaDp5qHSJ5JVUo3iQ8nmiyo/mt/eITEZRS/wSQT+YsuLTzPThzlIwrLM5I4yk/gjYWHmtEoW8w6as2w1h4gB9YbYIFhi4cica7DEW+GYy8kZ7W5ua7bdMWhf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQq5rqA7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 840B1C4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743196097;
	bh=1+uGOX+vV4HIhFeOOD8grkzmUhCkfC7eNxfMRJyqYLk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pQq5rqA7Tr9XT0yQz1AshzugUxsoQ2PQifRfhPt6Ktdxs7ZZphbDQHhpXXvzMFjeL
	 3lFbQdxd9A1YAF9E0VGr37AD0Zfro/+nTZJPWOA8V7vmBpyqZ/tBbYCu0AWx4vrCfO
	 O6vcSVKaTR2rjE198SsUg4f1yMY2xHkZFvZAmP3xeMAQzubOFUJ1zHragWyar/NfIy
	 U4Glwemea5BrQiDrA0oPRtrMMrYb6f3HqXPAEOt9u3S/+DkJZqiUDGS0SudFp75+rM
	 Pva/HzdEUCXgoGleNApY2STmdMMaizs4Vw8AyzBKYHYncEr31WF6DOoMfqgyC6UN5m
	 0oENFXA751I6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77AC5C41614; Fri, 28 Mar 2025 21:08:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219951] Missing null check in ast_vhub_init_dev
Date: Fri, 28 Mar 2025 21:08:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219951-208809-TXuW1Et4Ll@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219951-208809@https.bugzilla.kernel.org/>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219951

--- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Mar 28, 2025 at 01:14:23PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219951
>=20
> --- Comment #3 from henry (bsdhenrymartin@gmail.com) ---
> This is patch file.

Please read the kernel documentation for how to submit a patch in a way
we can accept it.  We can't take it through bugzilla, sorry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

