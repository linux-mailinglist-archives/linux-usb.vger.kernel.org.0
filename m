Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A598049C600
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 10:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiAZJPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 04:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238911AbiAZJPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 04:15:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA0EC06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 01:15:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49CE361586
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 09:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38F3C340E3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643188534;
        bh=5NTVciHrVgMp+1yIP2K8F+9GaWxYMB2i3oBxED29iTo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fTADUOR7hQ7vcztkU9uV5BBRHo4pBt0buH02mmQ46UQ6znBe3v8xwkIM/x+KfwoJr
         WreO0XcipiJhI4dLLrzcEGJ32n0/c9G1z0UbxudrZp8meRUbNv5+VtRj5Ou01cotYz
         UHHgqX+ezs7zYuEwY2RzvtZLNzrvKJxAFwl4i8aE6awXOvqwGpDR3LOP9wKDhXiuBP
         B8Z0hJ9ULEE98eQ2X+y/BIYQ0liN1g5MLB6oI48tOKaGZyGzNMsOK1vZSrujAI23ie
         ckmrlEBeTsE7qDKgJywMXPZYtg6xGh0RmmAB24BkllFNv4flhckcdS38yj+4xMkzs0
         QSZeCLVN/N1dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 87159CC13AC; Wed, 26 Jan 2022 09:15:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215530] typec kernel error
Date:   Wed, 26 Jan 2022 09:15:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215530-208809-5FRjAg9Hs4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215530-208809@https.bugzilla.kernel.org/>
References: <bug-215530-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215530

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
I'm not involved here, but I wonder if this will help:=20

https://lore.kernel.org/linux-usb/20220124090228.41396-3-heikki.krogerus@li=
nux.intel.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
