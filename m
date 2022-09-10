Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947635B4666
	for <lists+linux-usb@lfdr.de>; Sat, 10 Sep 2022 14:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiIJMtx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Sep 2022 08:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIJMtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Sep 2022 08:49:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BF515FDA
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 05:49:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E13A60C38
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 12:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7455C433D7
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662814188;
        bh=L6IdZq8BoEBQaSEJfGKthnOt94zbQnK+jq8WGrU6qyo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AiYjKopl6vBYjWDS10wmsEyGMwzFCMO8YwSyufAN6S6qFtLLJTycLAuIUdd1WiNZX
         zZIDfOitUEqtWYfxQ2sbrjHH+duV7YR1vsseM0LbnQVODGyxfRE9/JA6TmCsT9jTa1
         T4O0CUMVcfHwwmCnKMuEFR6LK/hjIq3DJYjGjmXEy+3ICP/hy2T9GAplsxt2VkY6K7
         v24qDkT+KRtPa2oARnG1XPxf/7zUxTGbNAMhydEVTqcNMvrREj+EjV3+CceYjeLTHL
         5OwJmxpl9C6lU2zoFl5TYezf50MNWl1aupxdSvrRUaQi92P0+8ZGEcpxVDDfyPpRq4
         LLfLi9QX382+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 98473C433E4; Sat, 10 Sep 2022 12:49:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216470] [Regression] xhci_hcd 0000:08:00.2: xHC error in
 resume, USBSTS 0x401, Reinit
Date:   Sat, 10 Sep 2022 12:49:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-216470-208809-XtZVG6rhW2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216470-208809@https.bugzilla.kernel.org/>
References: <bug-216470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216470

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Google says the error is relatively new:

https://www.google.com/search?q=3D%22xHC+error+in+resume%2C+USBSTS+0x401%22

Looks like this is indeed a regression because there are no results other t=
han
those starting at approximately April, 2022.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
