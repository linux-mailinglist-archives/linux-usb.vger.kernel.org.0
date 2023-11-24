Return-Path: <linux-usb+bounces-3302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC25A7F7899
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 17:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084B71C20DB3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0B633CE1;
	Fri, 24 Nov 2023 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXYSd+GN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71133CD8
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 16:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28671C433CC
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700842179;
	bh=r+4pWLbrsyX7Lm2KgDHQAV/hJyLxDdOhX7tlDj00bwA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oXYSd+GN4UwVWO9lGGG3nsF9SjmhA1B4h9hhduXUx/14pk+QCXwhGwgnEHA9N3tgT
	 GkZexT881jUXYjXvif7RJ6feWiof6ptga4R69EEYOoJ5vSGzm44Yw16SoDE7iupf2m
	 GzxaQTru5Nh6NepPZNKV2S+dgn8hjBm2HU+sBK2yvoZSaxK+ntqxwk3KMA3uIsZnme
	 YuJTKHNkyQh9Acx2QV5X4iKyNbmmq1cgVCMf2i69MlMfeQsZ3YgI1HVeF7y4frtQQF
	 69ecbQKx9QTsWpgGkGOh1u5LwMDghdeu5n/JTc7Nt0sOTLcZF9v63kv2FQVV7NpMIQ
	 nL7MTYxGJKhXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1245FC53BCD; Fri, 24 Nov 2023 16:09:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 16:09:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-jQSb0WUgVo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #27 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Yeah, I got it, so the problematic one (that triggers a warning) is this li=
ne

  ret =3D get_port_status(hub->hdev, port1, &hub->status->port, type, len);

where port is 8 bytes, but len =3D 4 as we asked for non-extended status.

Which line maps the DMA?=20

```
} else {
        urb->transfer_dma =3D dma_map_single(
                        hcd->self.sysdev,
                        urb->transfer_buffer,
                        urb->transfer_buffer_length,
                        dir);
```
This one?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

