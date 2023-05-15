Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF91D70214C
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 03:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjEOB5s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 May 2023 21:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjEOB5r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 May 2023 21:57:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8644A1725
        for <linux-usb@vger.kernel.org>; Sun, 14 May 2023 18:57:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20DBA61D5F
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 01:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80C1BC433A1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684115865;
        bh=4RCUQzHiW8ltkNSIi6KCy3q6oq3B/MLpPy6Xh6xVFqA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TAwtXTC6Ovrg1FvcSaXWHh9tjWhbsrAt1J01PDscuUrWE0jUdsUniDZOkRQnl+lWU
         v7WrqOp6zFs9RAgFZshWImbscstJZg4jdvuQ0+19jMhXr9tWcZtJLVcXWJ6yprYSG6
         gejV88n6Upf1vN6WQbgKnkC4595baZkA41mL/azD3xCL6XxTRXv7viBM2AbWnyOt0v
         zbdsCSRxuQpZ5qQ7RI/sfX04ZgjCL8Ld7DMIoouC5q3+UR9XTsNrGevMTlwNeCs8px
         8+vDdtKJe6iASeuHMBYF5O3xFcBvDtdnZba32TYuveyrgXji199jegYxqF8li9U3mX
         Mt/GIPkUmeJ7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6FA38C072A6; Mon, 15 May 2023 01:57:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 15 May 2023 01:57:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: neo.wong@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-jLxC7WP68H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Neo Wong (neo.wong@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |neo.wong@intel.com

--- Comment #31 from Neo Wong (neo.wong@intel.com) ---
@Chris=20

Is patch mentioned in #30 verified in current kernel version ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
