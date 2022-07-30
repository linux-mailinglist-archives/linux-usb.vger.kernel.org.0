Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08645585818
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 04:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbiG3Cpy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 22:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbiG3Cpw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 22:45:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090BC45F74
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 19:45:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9228161DD5
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 02:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6B31C433C1
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 02:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659149150;
        bh=nhioSoAxXX4Y4eRWkqUceePsnx/yg8F34w7J27a5U9Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=t/UhyOm09W+H1BJ4wpSsHvke0G8adW6VVa3LgGwICy5nwZyq8LREy6tAlSsM+kXXs
         TzdrcVWzsTjT2FTKKnTxZKV3lDELcLGGlqqgmXhnqimqO53L3VGOwCJJNe8Yv3cxmt
         RI9HGfl0f7joZPPbVmYcVdvzjRKOx/l9E2AQxGSqxv1j7xDR8lk85KepiYrldnTJUe
         Ldj5I0A2mLw2U3++3S8BbZZodGOpl76HoGvTAu2kNSJT06IeXvJQqPWB4S/+evMe4p
         JHpmjwS971XPEknL2dMIqS12JNeoBsQGErPB9C9jod3tA0V0kmVtxozXXyyJ9LuXR8
         HbB6JMWyOrTxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C8358C433E6; Sat, 30 Jul 2022 02:45:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Sat, 30 Jul 2022 02:45:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216282-208809-CKJ56KPBty@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

audioprof2001@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
