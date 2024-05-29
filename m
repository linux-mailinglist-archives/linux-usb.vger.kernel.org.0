Return-Path: <linux-usb+bounces-10682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC03C8D3B3F
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63CC1C23046
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 15:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90BC181BB8;
	Wed, 29 May 2024 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOIDBEZb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13B181334
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997372; cv=none; b=ErOpipRUuRh3v3x5NBkDw+y4jNxOt2YS1D0/Ifts5I8aRlNrLcRJenbGjilGePvv63yawUYlZB4N2e+NNtbDp0NwkuDw19jGh5GlAR6IZzGTWeWsNN+0u3HRgCyztMmc8E9ntV58Pt1oxcIROg4dBIRaO/ov6Y403guTHxeV2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997372; c=relaxed/simple;
	bh=qPAeCnRkEZxxakrUU9ukibfD1xETWSXinKaZf+bcmSo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M1d/AwC8+zs0TAosua3Jb7fvOc6SIo2VGW4MK+aWA6jR3FU/PYWBjg8OASDwKx7B4cJLv4LATzwIZS0MQ6+ykff+yI+ABAD482/WyaFPIMnh7l+KuDgM6R2ARNcqrCdKosGwzjIhnQVNxxk8fjLojnVlBNjxnXxFDMOYXriuDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOIDBEZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07ED6C116B1
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716997372;
	bh=qPAeCnRkEZxxakrUU9ukibfD1xETWSXinKaZf+bcmSo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mOIDBEZbK/R7Pol8aXg2JMc4ryjv/Lloj1sOQbFjm9MKhud2i12UZFRgeCpSeuc7F
	 SD5L1W6mqNFOOW1koNo6Wz9tnBxgqCXVt4tSsisXZXE+j3CNJUPskzSQXVrN5gcLyA
	 iUGSah7qo0s1Etucx5k24+W1ug9cp35QYU2sy5biTGxPh6y1+oHQlLWSsrtynzNYqq
	 imeLcZBRkDYakiQdNeLrmNSVhyi2ZQsJwNpis7LqoVDMbwqpp02kWtLh91hMH2Jrp3
	 62n9uNVYrkYu9gI9k+wgttqzDI+n1pYr1LkALHi6cJKlB6nFLk7kU3sUVMMyi8UVaV
	 qK7gWiVI/p2Dw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF61AC53B73; Wed, 29 May 2024 15:42:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 15:42:51 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218890-208809-l2gvJ9IGuT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #10 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 306368
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306368&action=3Dedit
patch to fix cancelled bulk transfer length

grateful if this patch could be tested.
usbmon or xhci traces should show if it works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

