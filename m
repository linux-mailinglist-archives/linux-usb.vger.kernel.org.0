Return-Path: <linux-usb+bounces-9637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FBD8AE3F4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 13:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A97C287B61
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8DD7F7EB;
	Tue, 23 Apr 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9UX1odz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04206762E8
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871890; cv=none; b=TxSaP+/f79lBMTh1keBVCr/IKNw2EQF/2qD1zcQ4Syl21fwfB1zIw9zJYuvSM35IFCZ0ZfyhU8jqWX5XjcD3KwNlmEAnnH0vtCgSZ6XqfXXw+iEEdiTGC0BWuPJ79DdVUiVPdCsvsq4B1vBtw42WQU9vViovWDTnopKUBLUUMNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871890; c=relaxed/simple;
	bh=KGwYg5BpmageNP69p5k5pjwekZpsf7obfz4foiLeXhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AixQ/1xemTjzIrvKRR1kVi9z8F0WXylk3J4IPj1uLdMUMrX4yMnKuGZ712y4Fy0SXFjKBrVp/D4RY7qqnIr+uQYEsgjuzTRIFw5p0Sq4/Kv1oRF1rjlLCXsdlTzT1P7+CvGLe23YAaBOQNVsfqEOvYrdyN0W+0YbI4UIocB+jWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9UX1odz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 803FBC3277B
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713871889;
	bh=KGwYg5BpmageNP69p5k5pjwekZpsf7obfz4foiLeXhY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q9UX1odz/0PEFVdn3Mpre9+60Ui0ASENhC2tf3yosQwxWjZXlcLTkZVm53VMMQu18
	 8xs8Sfmuuq9B3r7YSwpXqEbtB4/xRb48Uq8tBehpfh9uFL9bXs4fsrMxPMS99oDZg3
	 zdnsv3Rz/oJYm2LHr0BAQMvb4iH2arLypDI6ANQq/wNKV4V2167PdoX5A10pcwFFo/
	 UT+8JJ0lNxrWp2ZU7WfkF42nj/67P+MQeW9kFK355aNY9mc00NS7mf6Zl2Q/P+SfjC
	 Uws1Ho8A7t1aOdm/O4p86AD30/oK0D+h5ETeXdm99dZdEE3piAATTgee3xmnefy6VU
	 hzylCRlCgBzKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F6C9C43230; Tue, 23 Apr 2024 11:31:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218762] USB string order in dmesg
Date: Tue, 23 Apr 2024 11:31:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218762-208809-f5OjYoZYXs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218762-208809@https.bugzilla.kernel.org/>
References: <bug-218762-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218762

--- Comment #1 from gregkh@linuxfoundation.org ---
On Mon, Apr 22, 2024 at 07:34:17PM +0000, bugzilla-daemon@kernel.org wrote:
> Is there any good reason why the code
>
> https://github.com/torvalds/linux/blob/c85af715cac0a951eea97393378e84bb49=
384734/drivers/usb/core/hub.c#L2361
> is declaring string (show_string) values in a different order than they a=
re
> specified in dev_info?
>=20
>         dev_info(&udev->dev,
>                 "New USB device strings: Mfr=3D%d, Product=3D%d,
> SerialNumber=3D%d\n",
>                 udev->descriptor.iManufacturer,
>                 udev->descriptor.iProduct,
>                 udev->descriptor.iSerialNumber);
>         show_string(udev, "Product", udev->product);
>         show_string(udev, "Manufacturer", udev->manufacturer);
>         show_string(udev, "SerialNumber", udev->serial);
>=20
>=20
> Now
> usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 4-1: Product: BM5100ADW series
> usb 4-1: Manufacturer: Pantum
> usb 4-1: SerialNumber: CK1A8823765
>=20
> Expected
> usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 4-1: Manufacturer: Pantum
> usb 4-1: Product: BM5100ADW series
> usb 4-1: SerialNumber: CK1A8823765

No specific reaason, just has always been that way for 20+ years and no
one has noticed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

