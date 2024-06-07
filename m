Return-Path: <linux-usb+bounces-11021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5C90053A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 15:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144A91F252F5
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 13:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C66D194159;
	Fri,  7 Jun 2024 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AViY6cYH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD5192B89
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767726; cv=none; b=UsTLq4mTcmKj0Ed93q6cklgjmIVmTa8mL/MPgs0VNNvs8YHzTVPEc3eO4aCgmFRHjKnn7SMciAoh/lP21Fjd06a8DBkCc/cmccatHXFiJx0Ua6NDdraVqbNjwc9kDoZWCVHOeZyXrnJ3EfhfLdakrTCvPSs2siAWsg05Mn7XXAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767726; c=relaxed/simple;
	bh=hFmHGGx8pX2kMYxasi0WPisiEOBjW4j+hcBs3xuZTgc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E53vYgJfLGnhKQuQLWeALtM0w1M3LPXpVodupg2GtKSSjX8+XekauB3hTgYWzkmMLYFkVX2ZP7Z56ej1+DACozAtmQOj8tOvshYldzsXI1lzHQx4FZM/F59nd0ZBASuLh13k9SLSLkGN4ZH/VUUdYU3uY2SamO52rl4i98UtcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AViY6cYH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65580C32786
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717767726;
	bh=hFmHGGx8pX2kMYxasi0WPisiEOBjW4j+hcBs3xuZTgc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AViY6cYHLFK5y6zAC224bnDr7lecnr+Fv9l3gubF5HWDestiG0TXU/Sd3y8+Y/Ext
	 Mm3jEtRy300I1QtT4Ql+lsJ0O8QtYpeorr9gF6SJZZ0+5fZZeMxwA/a92ITX2hCA1/
	 7Ih0VPZS3vilPmpjowFHA79prA3/GPXuEHllTRqzFeqLTX84pRwg+1s+gH7Mb1xXf3
	 3uNFmcNjlKvsZ6KBdzFqajiVmjvR1sySTndyF8x7VtNp+E+NBPCdZW8uOllTHYYFdG
	 kLIeiUXNbdtTNZ0ONQhNNLWV8ZdwOAY2stH9Bu3CSs1S6+oaV6PpZGPisG/vQXqbxD
	 fyErlYv0HsNKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AA67C53B50; Fri,  7 Jun 2024 13:42:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 13:42:06 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218943-208809-bVN6OWST5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Can you check the xhci roothub port speed of connected devices:

mount -t debugfs none /sys/kernel/debug/
cat /sys/kernel/debug/usb/xhci/<address of device>/ports/port*/portsc

If host uses default speed IDs then=20
PortSpeed 4 is 5Gbps
PortSpeed 5 is 10Gbps (Gen2x1)
PortSpeed 6 is 10Gbps (2x5Gbps, Gen 1x2)

example:

cat /sys/kernel/debug/usb/xhci/0000:00:0d.0/ports/port*/portsc
0x0a0002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change:
Wake: WCE WOE=20
0x000002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change:
Wake:=20
0x000002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change:
Wake:=20
0x00001603 Powered Connected Enabled Link:U0 PortSpeed:5 Change: Wake:=20
0x000002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change:
Wake:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

