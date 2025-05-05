Return-Path: <linux-usb+bounces-23711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E141AAA9165
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 12:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E61527A14E4
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F771FDE09;
	Mon,  5 May 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSc+dekO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03634C62
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442405; cv=none; b=Tr8UJPDqSuBexSDX8v5xhE0ed6MNdwxiPQjA0K7ZGANRuDOuvHNlHibnt0S8/bHvWDG4IpEUSgOpF5rtOMjZYmrxn/autbaA2kX8wCRr9WZ/cKIiXlP41gW62ZeOBN7KuHKEoQsDvoo7I4/j5DE7/9zX4QehRAdh248srjXzSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442405; c=relaxed/simple;
	bh=6uSjTKSPpR0rgjekaTVBC0kiIGXtdkco4f1wbZHquaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dXc+TVAaBGBnkFZLy5t/InX6Aub7dt9F5LbOM31b3zX+Z3cVadyfOQ7VfxuqXtmjUAsx1ok07KjjbXoEpbPYy59tmNgAhlMw25qFemEWWGC1+tUIwZZnfhMr1ovinkNmSESI+CkJ82KFhr1l7cmy9IKZpTQp9+E1nj/287ikie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSc+dekO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E839C4CEF0
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746442405;
	bh=6uSjTKSPpR0rgjekaTVBC0kiIGXtdkco4f1wbZHquaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MSc+dekOup1UheJYrssKKhBLCleeeS0DTLL5nmlWIOyT3vLcQd6GVrloiTEhKdRr2
	 /HbNFy/fOJlRNgF4OjT+litpu8rS4rYhVHtaw6LaK4ytiY6DhWKbRdYw97YXVLbPVt
	 ErYLWLTQbKoxWSHTgA+2tMs+tNxEIRMaFYiZ5eix0B7zP3DNdjwxdHOs4TixutBDt3
	 DUqU3ayPzMqnp56PVLJz/mwUrhtm8Ws0mQBeTkiQEjNg+Ccd2Na6iavaPN/s09Ss86
	 ThMtnKolcf+JZsAigAT5/UJyH+vcwgxgNYIyYlkkj3UR39E/NoBXI9KsHdloO1NH/H
	 NNb3NW15IO3sQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31E8BC41616; Mon,  5 May 2025 10:53:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 10:53:24 +0000
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
Message-ID: <bug-220069-208809-5PYtzDz1Dg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #42 from Mathias Nyman (mathias.nyman@linux.intel.com) ---

The two Reset Device commands followed by an Address Device command
that Michal pointed out earlier could very well be the reason for the issue.

Reset Device Command: slot 16 flags C
Reset Device Command: slot 19 flags C
Reset Device Command: slot 19 flags C
Address Device Command: ctx 00000000fff42000 slot 19 flags b:C

A Reset Device command will move the slot (device) to the Default address 0
state where only one device should be at a time. In default state the device
waits for a address device commands to be given a unique address.

Here we have both slots 16 and 19 in default state at the same time, and bo=
th
devices will try to respond to the address device command.

Xhci section 4.5.3.4 "Default" has a note stating that:=20
"Software shall ensure that only one Device Slot is in the Default state at
time,otherwise undefined behavior may occur."

The commit 2b66ef84d0d2 "usb: hub: lack of clearing xHC resource" that Mich=
al
pointed out earlier looks like possible cause to me as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

