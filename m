Return-Path: <linux-usb+bounces-11770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C091BA6A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FA3C284615
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 08:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8492014F11E;
	Fri, 28 Jun 2024 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB2i7Ffb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA014D6E4
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564666; cv=none; b=J2T53tSPJ9Euu5T7SjDkhx7e2H6N+Dr4hcHGsKMRbkEik2OOa66r3l0L5K/Afe7UGi28lm226DH8SmXNA2AhgDjMLduufhx3Qyy7enelHWs2bNSTf+olNAGxpVYry/H4t8wNGn4XzOvZqomy6XFd33kE+1ksX7n90CoomRMzx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564666; c=relaxed/simple;
	bh=pVyk1k1cBYw6IPVMHFwbAlLb0lw/cWaPcx9sEv/VLv0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cu7amle6qGgZUW6/FHr+FQQpEJ6Co6XRn4uYUnD2gKnS24HW5Wqa16Ra4mhI+5YubUab/wbLQS39NMRUlSziQh4lHKW7sFy3tAXP7ne2pyH7+aE0/Bssk5cJYYlv0TYeUSMX9rgR5LPIbmf71zDhYPb0OgP44kDtsK+WH3yUbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB2i7Ffb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C45C2BD10
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719564665;
	bh=pVyk1k1cBYw6IPVMHFwbAlLb0lw/cWaPcx9sEv/VLv0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OB2i7Ffb9HFbXdGkpYngxAvPVPv2wmtbTkSK9kLGIf1io1QC0UAYIeZAONUmBdRWD
	 5IG2VYmxWuj+2JgXbj20XuRZEjTvsBqx3NSnLH+DeQ/ojsz0QxqsXFaTg0JZ10jHHx
	 x3JyowkBBDcw5uQkmBuFDNAOIkGiuKWRynhk+aXszY5JqVNO15eDUcFCMSgXl/Niuh
	 wMfx49ZQbBqEfnTdGQ/FoY/VslbZ7ooqgvRg4/0UXAFlXgHn8a2NvqhnWyTOXHezi1
	 9Ok2yLK29WItHs7TqeX/gVn8qW7FCpptnVfaMjJp3jZtsrRa8VKv2A+99r7ykBrkKt
	 65+/6SG0fxv/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 827A1C433E5; Fri, 28 Jun 2024 08:51:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Fri, 28 Jun 2024 08:51:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218987-208809-lHnUmlZ6k2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #10 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
About SRE,=20

Logs show transfer errors due to disconnect. This normal.

Driver will however try to recover the transfer by resending the same trans=
fer
3 times (soft-reset internal endpoint) before giving up and and doing a hard
reset of the endpoint.

Soft reset is useful if transfer error was caused by electrical interferenc=
e,
but this case the soft rest if futile, device is gone.=20

Not sure if it makes a difference but could be worth testing if skipping the
soft reset impacts SRE.

Can be done by setting quirk:
xhci->quirks |=3D XHCI_NO_SOFT_RETRY

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

