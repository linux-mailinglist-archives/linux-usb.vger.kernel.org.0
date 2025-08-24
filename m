Return-Path: <linux-usb+bounces-27224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7958B33342
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 01:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B620B204B34
	for <lists+linux-usb@lfdr.de>; Sun, 24 Aug 2025 23:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46DC257830;
	Sun, 24 Aug 2025 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScE1069r"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49D246333
	for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756077591; cv=none; b=oudTcI2UKSqb7Lc2aiowOy9vUnjLZzd59uVnhE/F05IDmDj57o8K/wkGha9PLyQ8BWhuXWlh5qP5wiIf+q5N9dLu5eJ5vdQehsxw0BFPNCNLmzmWFwjsbA4e0tsz+UV9K7LLt0dPSlbt0yUzvmM1GA0MyGfY+lmperyZjvQRy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756077591; c=relaxed/simple;
	bh=4OgCRnYO/gd7qQxsurpZByOWJ7JPwaMN5MFz6oCHgnE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uFK+duTT3Vm6916bGg0nLVvTJA8TD1qEEmc5COyS3TvfkoSnJmbjtsyKj4aLg5p5zn9E11ux2r3Y6lcxR64O+gArQ8YaGr+ifeshITjgxu0ZTCZTbtf7u3PyopCrdMmNJtMt5AwqHv2ylSvLcbppRfLpbTv0qlAV5zY1zJbDFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScE1069r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B92BCC4CEEB
	for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 23:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756077590;
	bh=4OgCRnYO/gd7qQxsurpZByOWJ7JPwaMN5MFz6oCHgnE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ScE1069r+Iyago7TEYs0JvLjez1QkTpU8kXBrkxtT3t/K+wi+38baKmkz7UAQrMg5
	 xHyhZyqmae2+mB3RBIjtc/yC2R31gPJCzie/Y536rKRR9VZY/9Yr7bOkWpKoPLMrEq
	 Drj4MMbwvYO5pvSjieQEvNmMu9r81xz3S2ejF1tRcYKMdt9UDTktLvthESTkOztumm
	 i/XFG4mqg+j7yAbi1yrwrQv1JmOkGK5C7pdJiLO8A9AzgdlD3QhTlj7rRzcS02RkqA
	 WbqJC2uOanNid+B2KJP8gfhEfof5xjUPrI8jvL/8MXGGUKK7b4L6u7JF5uimuo9VMK
	 dKJj2Blal8bEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC2C8C53BC9; Sun, 24 Aug 2025 23:19:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Sun, 24 Aug 2025 23:19:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: danagoyette@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-r02HNy95HE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Dana Goyette (danagoyette@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |danagoyette@gmail.com

--- Comment #14 from Dana Goyette (danagoyette@gmail.com) ---
I filed a bug a while ago on the Ubuntu bug tracker with information about =
the
device from a few utilities on Windows, on an X870E Taichi.

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2097466

I should test out the patch sometime this week.  What kernel version is the
patch for?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

