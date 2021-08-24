Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501B43F5897
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 09:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhHXHBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 03:01:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233333AbhHXHAo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 03:00:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C135F61360
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629788400;
        bh=UUARsU3j11W607683yTjhhWoJmEThIpLygK5Yek4YhU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ogS/5cSL7rr2PwVNEfkBp7QuXrbsjfk7gY8d1WpVecDrrWyxH5TjgLVIWMs+fJSB6
         sMHim5qHQ/x/s16IkgYXTp/ZI93ePqhMKmDna3si7YXZSrsF1yg7jLC2SFxpibS4QD
         AAUmLPZ54w+xIs+Za6a3FebNZaTJ01UxeCmEMBrjhqdLLCUQ4WIM9J8jXB2zx2TmGT
         XWBfEm8Lcbg8YWeK8++TEbfJLaoSWHKKW0Npuzq7ebRKCN2ADQH7wTefCoa/0mTyyg
         c/vH4p0/nid6IbByIo/Uc8q9uV20di8gAKejev3hICDpCwRgfoDMBWWfIQlsy8sXKL
         w9Hk9ddslaKYA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B6C1860FF2; Tue, 24 Aug 2021 07:00:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMTQxNTVdIHJlZ3Jlc3Npb24gNS4xMC40OeKGkjUuMTAu?=
 =?UTF-8?B?NTI6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciByZW5lc2FzX3VzYl9mdy5t?=
 =?UTF-8?B?ZW0gZmFpbGVkIHdpdGggZXJyb3IgLTI=?=
Date:   Tue, 24 Aug 2021 07:00:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214155-208809-bhRs2uMet5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214155-208809@https.bugzilla.kernel.org/>
References: <bug-214155-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214155

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Aug 24, 2021 at 06:54:45AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214155
>=20
>             Bug ID: 214155
>            Summary: regression 5.10.49=E2=86=925.10.52: Direct firmware l=
oad for
>                     renesas_usb_fw.mem failed with error -2

This should already be resolved on the latest 5.10.y kernel release.
Please upgrade and let us know if that does not solve the issue.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
