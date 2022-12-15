Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD5964DAAA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 12:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiLOLw2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 06:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiLOLw1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 06:52:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F57220BDF
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 03:52:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E24BE61DA3
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 11:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46D47C433D2
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671105145;
        bh=DGFMlKOInJ/VAEnbVPmtaE54Q8Ufk4i+kX4Kz/Yk/H4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IuAqu9Mo9KL6NzrmbdO7+285/wyUPdshJTIVWsgJqQgIlhVHM/XprxsaLLwRa9U6M
         m7Tc/eQ5lk1aX+wAQwZhU59R1C/9eEwqcmn6rbErQj+bMKNr3DHMk5LmTuHXVKVC+S
         xqRkjSdtuMgC7ngm/Sf7wM+s7/I8D7JjOX/ndbyHeoChWD28BbR6iyX75vy882apOU
         r9JrEWa+fFaM/OF2ENfZDCMJ5Q1gR1EXHUgxnc1XtYQ7gvOHn34xjtNL5gH+9ZVZZm
         r5tFZk60WwYA3DJ6FUKVAAiz2BmM0+5r4gWBycOk0OX8fmfRSdqi4ENca6RGgi1op0
         SSd3v4N4N1N4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2DCEFC43141; Thu, 15 Dec 2022 11:52:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Thu, 15 Dec 2022 11:52:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-d5229Su0yB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #19 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
It is likely that this is not an ACPI issue because rest of the Titan Ridge
(TBT etc.) come up just fine and the power management is done for the root =
port
so you would expect it to affect the whole add-in-card. Unfortunately I don=
't
have any ideas how to debug this further either. I can check if we have this
machine in our TBT team and if yes to try to reproduce. What is the exact
model?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
