Return-Path: <linux-usb+bounces-4889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C982854D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 12:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F2E1C237FE
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 11:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE95381AE;
	Tue,  9 Jan 2024 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4nH7K+G"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D513381A2
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 11:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B72CC433F1
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704800608;
	bh=iUhgOgxOPJ8Qk0c1x+iKP+TWLf4DSl1kZ3kJbwryuZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r4nH7K+GLlFJj4oH43XzlTHJBSHFCuMHt7NVa5prC3LZhIFb1ytisZ3GgTih/C/SK
	 HI66LNvw6r6W8//CeVj+GHQs2pmSvLNYBQlVDMqj4PsitovFPXUuJqemIV8eFJIA6G
	 nIu23SRNBA5f4c3blB4vPnXZw/el3DsyquHM713FTkWk/Zmhb7VMEXvXWYVcKvvndm
	 up+VVBghOpvyBsZGbY6y3MtnRIClNvq19nbHvuxuwjkZbUVleXpJhJFEq1+3P3Uox1
	 zRR8806oQAjw7INkIdIoOWfMpJIIY2/xM1DdzEyysg2iqDbE7kR04lu5EtBdYmkzkN
	 ANRR3p+7HK6nA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9B47C53BCD; Tue,  9 Jan 2024 11:43:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218356] NETDEV WATCHDOG: wwan0 (cdc_ncm): transmit queue 0
 timed out
Date: Tue, 09 Jan 2024 11:43:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: opw
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218356-208809-MCoiEDIBtz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218356-208809@https.bugzilla.kernel.org/>
References: <bug-218356-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218356

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Jan 09, 2024 at 08:44:30AM +0000, bugzilla-daemon@kernel.org wrote:
> I am using Linux kernel version 5.10.110 and the USB 3.0 interface. During
> the

5.10.110 is a very old and obsolete kernel version, having been released
over a year and a half ago.

Please try a newer kernel release, the latest 5.10.y release is
5.10.206, but really, can you try 6.7 to see if this issue has been
resolved by now?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

