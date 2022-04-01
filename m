Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E2E4EEEE9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Apr 2022 16:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346722AbiDAOMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Apr 2022 10:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346710AbiDAOMp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Apr 2022 10:12:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BAD12AEB
        for <linux-usb@vger.kernel.org>; Fri,  1 Apr 2022 07:10:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88DBBB824B7
        for <linux-usb@vger.kernel.org>; Fri,  1 Apr 2022 14:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AF80C36AE2
        for <linux-usb@vger.kernel.org>; Fri,  1 Apr 2022 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648822253;
        bh=F3PPjXONEfqSMNAfs+2YykVq2UZYQ8sMPqFaU2xEAIM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YLxtd4HgNmhtjrtg2ZaciIaXXXxDnXWgb+2XSx+5VyaPjJDigfVxyNu8wNuP6sF2+
         UJ2q1RvRb0xTSKeoyaCl1abByHapGgwE+8VWRaGblrvU7mEKYlouSpZOJSe0ShzI7T
         lBhJMLQiTjfsjNCLHhFZbdgnPTqjJsRz0M5w8yEO0muSYfLMXLnPzMGkgTsC8bJMZx
         hLVcVFlacQUGRWZI3Njf7LgiSXaWfzVYdh0j3drwQA0DVof3m7N6Mal2vj4aOc/XAB
         TYNngXpOLJceNC0mUTBrLlQ6HHgKTNmVZyPW4S+TQRDDiFKOnHsPvmSJ0CpR5hfXwR
         TzSYYEclnLbNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3B98BC05FCE; Fri,  1 Apr 2022 14:10:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 01 Apr 2022 14:10:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.co@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-INl12XnS1f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Adrien (andrew.co@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andrew.co@free.fr

--- Comment #11 from Adrien (andrew.co@free.fr) ---
I have this problem aswell on Thinkpad X1 nano

Linux XXX 5.15.27 #1 SMP PREEMPT Tue Mar 8 18:18:11 CST 2022 x86_64 11th Gen
Intel(R) Core(TM) i5-1140G7 @ 1.10GHz GenuineIntel GNU/Linux

I can't find any workaround that work on my system. Is there any command th=
at
can be ran to force check if a power supply is present ? For now, I have to
reboot the laptop, or plug/unplug the charger once after resuming from slee=
p.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
