Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1A3466EAA
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 01:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245402AbhLCArq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 19:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238220AbhLCArp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 19:47:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC503C06174A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 16:44:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A12E628ED
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1D7BC00446
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638492261;
        bh=Nd/YeJwbG6OrWjPma11+e2cTKZI4BahKEA5vzlV2o44=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AH3xlX9bKVI7VCi7Mblt5GFxUDj/m42q72QlkILIYyWSMRxxZ4phXS2s2Xe8hGX9u
         eiqvjV0EkegKfG/xOwcACcT2Ip9LUBCVi5/bi2EJ7y/CY1vNL4Zc9mZd7/IQFx4a/r
         K9uTCcKkPS00s2HiXbwU7B5WMBlRTVXbvEoHbsxjpS/uSujO80fsF98ikQXdIOyTXN
         5lIqx2ZXGZ3IJY+Il7RkwAyTv9ne5qGWR5U/rAS0+c+zQAYDRhDLSpR1oD1QB5TybV
         aFKZXAtxc0r305iAn1HajIl0vRAjHQPyueta2/zo4m8fcC3So4F05xRPWPtOI4c4s9
         yRJDSWyvtJx0A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 941C860FC4; Fri,  3 Dec 2021 00:44:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 00:44:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-ZWF4zbGRSO@https.bugzilla.kernel.org/>
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

--- Comment #28 from Yunhao Tian (t123yh@outlook.com) ---
You may refer to https://github.com/t123yh/linux/tree/for-rk3308 for a work=
ing
version of code. Meanwhile I hope that we might able to request some help f=
rom
@Minas?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
