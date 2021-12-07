Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269A446B083
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 03:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240009AbhLGCQm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 21:16:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238230AbhLGCQl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 21:16:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7BFC061746
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 18:13:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37220B8166B
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 02:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09371C341C8
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 02:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638843190;
        bh=SZezzdhdETCOMWzWFJXbK4dvrpy0Dm0SNlXYMDDcFjg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dl4s154sytsK3tarrXNexC4KMsXtYeg91s3H9k0t4EqUF5xv2iwI7Cwom0aRoM3un
         FV/aJQwiZPzUvP7RK32rHaHgDf1Xz16JpaXL7n/4jGToQydOmEF6JmMkNXiWE+T5Rr
         NtQr9ox61ITa7p5BulZdodNBsZ4j46j53FMzEq9/82Usgn3rEs2zJrilzaZXYsksbO
         1ToSlOfrKpCVJSCsSPdYTk1ON2z/rBgH+Y2at50M5yH5fp7Wh8wgRnXj4GZ9eRCXt6
         Z1C7nkjOysit3kq0QqcjLqbXT8flCVjPdDdfYPluscMnXZYCQskJVEnvGzWUWu4XJM
         HSQ5vTYUh4sRg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D07F2611C0; Tue,  7 Dec 2021 02:13:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Tue, 07 Dec 2021 02:13:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: remyvarma@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-08rQl8Dx9L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #31 from remyvarma@gmail.com ---
Hey just as another data point, I believe the odroid has a type c connector=
. My
device also has a type c connector.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
