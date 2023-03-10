Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DA86B50E9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 20:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjCJT1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 14:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjCJT1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 14:27:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1E0134800
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 11:26:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2655761D47
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D3C9C433D2
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678476418;
        bh=Wj8n/MJDok2+SRDyU4fZat91NBpIMe90zWkSjnz6Wp8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bd5o2EcraUmT1uWVWPQu49E+wSZ8082K3WhJx+o0yO4oMFEOCZ46E0r3l+2l6Ua+R
         J5MlsohrWg8RsUzZWtYr3Y9fGfftx+8tTb5O692iRh7ffJ09avFSWBVg+MhjxJhWyR
         zyazpJNu1EZtw8fWrGnLjR2rr/jeb6OlUuysJz0uirj2M59XRTAOzoqsU6HxUhtkdK
         RP6oUme+j5SkUMaZ2NqrJKcYVNHSf07G9yPRjcsAJG/7ZlopbYNE69pdF8YqHfayqW
         iAl994GQTvPdN0BI14z5/CC6VM1Rlbc2NhpXL5TNlvXKMevnPDwgasn4MRLDEvRIgv
         3kfJJVY4cnC6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 418DEC43142; Fri, 10 Mar 2023 19:26:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217174] Plugging in usb external drive, mount and umount causes
 kernel Oops
Date:   Fri, 10 Mar 2023 19:26:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: Block Layer
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mike.cloaked@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-217174-208809-XYIPvSjtv8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217174-208809@https.bugzilla.kernel.org/>
References: <bug-217174-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217174

Mike Cloaked (mike.cloaked@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Block Layer
            Product|Drivers                     |IO/Storage

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
