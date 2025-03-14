Return-Path: <linux-usb+bounces-21760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D74CA60BF2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 931AA880425
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 08:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B239B1B85FD;
	Fri, 14 Mar 2025 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHHaNZQo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAB176AA1
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941730; cv=none; b=Q+K7V404oCEbCBZLgS2yYcTRqdodVfjSczgkUPxSTliHfwO8iwVGvPKxvrGi1zPm3qeePL0Ru8OWEtluePwDh6uJPlmgFqvaepK5S6Uaj1hHhuxnRlkvbwDXsXNBEwdJsArinHZmQFEoHWxgE8KFpkRbSly6DQ7YyswtQzr88ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941730; c=relaxed/simple;
	bh=kfYAjzkluBWtqIRmHsOqTkTGorHzVye2ivtUmt7yWPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d5UcZAl77/pXrVhg0MvL3kZKuo7GJBP2Aw+qJxRK92P5T6K7NC8wH783lviw/f/TUhLqqNkBpqF5zfVVrdWyAziTDiVxOUgTn8b4HGYrnFw9LCPlu/R1k3gcA/4crXmi7JkOlXdfB8h0VB71gkOpC7VrUOWExm8P5jLivBwXRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHHaNZQo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DC8FC4CEED
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741941730;
	bh=kfYAjzkluBWtqIRmHsOqTkTGorHzVye2ivtUmt7yWPE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jHHaNZQoCsvoN3nYHrcpnTfktztsMkuyhLZnA46WCSEIRGn7MJj0PK6JV9aqZ9qRm
	 zSQgcLtod+YIfYFeDGJLmwNzXmnSCRf1S5t6Dx+1B6fWF02ZCYhRjtx4UgolT7VFi2
	 G0Gi/id0MkFgHyz6VLehdCcliMoOda5rr0qI4ePtJ1mMTNFDzHNCIBtpAh+yUn8Z1j
	 db3iBTjPPZVIC+7pE6ixuPNpfJ+ZNiL0O0uLCQBbghod3KcnKfj/CB1ZuoxAk2Qu0o
	 sSQb5Zk00MjMxLn2KzTRa8v9UqBFJsl5D8UKwu6vr6/walOtBaPqOcqi+IYTwb3Pfa
	 yujErVlLRNdNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F36DDC3279F; Fri, 14 Mar 2025 08:42:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Fri, 14 Mar 2025 08:42:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: christian.rohmann@frittentheke.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-wsKaflnw3v@https.bugzilla.kernel.org/>
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

--- Comment #21 from christian.rohmann@frittentheke.de ---
Will this be backported to 6.13? Seem 6.13.7 doesn't have it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

