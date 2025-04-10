Return-Path: <linux-usb+bounces-22925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06514A84FFD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 01:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2297A9C0E70
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 23:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0255C21129C;
	Thu, 10 Apr 2025 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIpdUTnw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBFA20C002
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744326686; cv=none; b=LsacPayKD5XWdpljsJvwBVu+U5hgZ5GUC3j5d6KdToWJEJJ9GGhNVmVIAX7bNtMYiUfhcn9XKUapayr2Hw+TwPUAdiAbUirMVCwOYJcMMv2XRGN3P/y59yMUsP4Jo/8Wtv9mQ9c7X/o6QzQ5NFkcyE7HySMLi6CG/eRNdDzs+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744326686; c=relaxed/simple;
	bh=dHlSDwMjf8zbA4bCD4F8fGR3dv4aUSSek0+bZhbLYFg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mvsA3TZfvXzqTujbu8UnjJ3N803HATdlorNbViUfpqBChyBvWXVGKPXDouIRoEERr3NEuqiB+PxOxJvwsMWDgAxP9tVIPaNz6baMnmEMrrcG2Oinh0ZYe3L4gvBD+ycVQEo8PX0JN51p9hxzXFMCPSYWjuO40r/rruNcus26+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIpdUTnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E801EC4CEDD
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 23:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744326685;
	bh=dHlSDwMjf8zbA4bCD4F8fGR3dv4aUSSek0+bZhbLYFg=;
	h=From:To:Subject:Date:From;
	b=qIpdUTnwqf/2WOBJvbc79aIYvDWiS4Y4frDsaF9NIfd+qws+/bZr/n+ajODMoKLAY
	 j1D4YMdFJvgCu5N6zQrOhor8syiJpLXXrsMZEDq6FNJKJ5Br+yWWItol8pj+OWOWqX
	 PKq0Zgi6l8S6fGqBfBw/YtzQmdol+8c9K7llzaNnoS+AJQzwYm3JeY8NtSRdb6WoP1
	 NmMOAwVS1vAahCiNclVTmCN+G8YxLmTJ+ReV/inr1MWzlrrkwBD7QMCtHUo0uJwY6Y
	 IxfQKutIId5jUxv9PG30QnNgIrxDKXMsSqcbhFEFBrEflaUb+UFPkvqv6nWqnCt8d3
	 sO5JjjCykfzSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF915C41613; Thu, 10 Apr 2025 23:11:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] New: USB tethering fails with rndis_host on 6.14.2
Date: Thu, 10 Apr 2025 23:11:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aminvandh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

            Bug ID: 220002
           Summary: USB tethering fails with rndis_host on 6.14.2
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aminvandh@gmail.com
        Regression: No

After compiling from 6.14.1 to 6.14.2 my USB tether stopped working.
- Phone: Tested on two phones (samsung and xiaomi)
- Kernel: 6.14.2
- OS: centos stream

dmesg:
```
$ sudo dmesg | grep '5-1'
[ 4706.908695] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[ 4707.040053] usb 5-1: New USB device found, idVendor=3D2717, idProduct=3D=
ff40,
bcdDevice=3D 5.15
[ 4707.040062] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4707.040064] usb 5-1: Product: Redmi Note 12
[ 4707.040066] usb 5-1: Manufacturer: Xiaomi
[ 4707.040067] usb 5-1: SerialNumber: d6a7620f
[ 4716.408590] usb 5-1: USB disconnect, device number 2
[ 4716.771173] usb 5-1: new high-speed USB device number 3 using xhci_hcd
[ 4716.900356] usb 5-1: New USB device found, idVendor=3D2717, idProduct=3D=
ff80,
bcdDevice=3D 5.15
[ 4716.900362] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4716.900364] usb 5-1: Product: Redmi Note 12
[ 4716.900365] usb 5-1: Manufacturer: Xiaomi
[ 4716.900367] usb 5-1: SerialNumber: d6a7620f
[ 4716.971029] rndis_host 5-1:1.0 wwan0: register 'rndis_host' at
usb-0000:0b:00.4-1, Mobile Broadband RNDIS device, 86:aa:5b:28:2a:ef
[ 4716.976223] rndis_host 5-1:1.0 wwp11s0f4u1: renamed from wwan0
[ 4751.690348] usb 5-1: USB disconnect, device number 3
[ 4751.690389] rndis_host 5-1:1.0 wwp11s0f4u1: unregister 'rndis_host'
usb-0000:0b:00.4-1, Mobile Broadband RNDIS device
[ 6113.354484] usb 5-1: new high-speed USB device number 4 using xhci_hcd
[ 6113.487020] usb 5-1: New USB device found, idVendor=3D2717, idProduct=3D=
ff40,
bcdDevice=3D 5.15
[ 6113.487026] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 6113.487028] usb 5-1: Product: Redmi Note 12
[ 6113.487029] usb 5-1: Manufacturer: Xiaomi
[ 6113.487031] usb 5-1: SerialNumber: d6a7620f
[ 6124.087792] usb 5-1: USB disconnect, device number 4
[ 6124.442925] usb 5-1: new high-speed USB device number 5 using xhci_hcd
[ 6124.574687] usb 5-1: New USB device found, idVendor=3D2717, idProduct=3D=
ff80,
bcdDevice=3D 5.15
[ 6124.574704] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 6124.574706] usb 5-1: Product: Redmi Note 12
[ 6124.574708] usb 5-1: Manufacturer: Xiaomi
[ 6124.574709] usb 5-1: SerialNumber: d6a7620f
[ 6124.624566] rndis_host 5-1:1.0 wwan0: register 'rndis_host' at
usb-0000:0b:00.4-1, Mobile Broadband RNDIS device, f2:00:f5:90:be:3a
[ 6124.631938] rndis_host 5-1:1.0 wwp11s0f4u1: renamed from wwan0
```

networking outputs:
```
$ ip link show wwp11s0f4u1
4: wwp11s0f4u1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel s=
tate
UNKNOWN mode DEFAULT group default qlen 1000
    link/ether f2:00:f5:90:be:3a brd ff:ff:ff:ff:ff:ff
    altname wwxf200f590be3a


$ ip addr show wwp11s0f4u1
4: wwp11s0f4u1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel s=
tate
UNKNOWN group default qlen 1000
    link/ether f2:00:f5:90:be:3a brd ff:ff:ff:ff:ff:ff
    altname wwxf200f590be3a
    inet6 2a02:4540:9025:d677:f000:f5ff:fe90:be3a/64 scope global dynamic
mngtmpaddr proto kernel_ra=20
       valid_lft 7121sec preferred_lft 7121sec
    inet6 fe80::f000:f5ff:fe90:be3a/64 scope link proto kernel_ll=20
       valid_lft forever preferred_lft forever
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

