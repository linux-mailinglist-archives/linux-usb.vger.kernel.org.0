Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E3C5F2BA3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 10:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJCIXT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 04:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiJCIWu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 04:22:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4014B4E84D
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 00:57:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED68D60FAC
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 07:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C23CC43144
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664783767;
        bh=bxhbxqxnNwuY3lcAulqN23emeWqXUT8gD/RM78TzfMY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=piI6522HlUkABw3sLcauc7ym4d0wMOvepQTcNJEJ5ZJTyAnM4ClW9LiZDrQDNFJ0J
         iMLJSW2axQ6mHJUtC3LeP8EHyGVbKKo6TQl1of46Fg61nDhcX5FD7QA8e+FpW2MrBO
         PiMpiXsOyG/rKJ50XO/02xL5gJbvuFZvnLBWlG8vW/TaLEHRaCARzZhAq355PwCDeX
         ov87ZB213NbGwS3ZifLu7PvbjC8WUYcR6Dn/qTdFgZQIEMNyj4SWyLHBSl2rU6jQIH
         sNbtQq1jNDPuDgrpHc3wKTMxzuw48p4wXYWNuwNE2ZwOvIaCv1nJ1NG0EqmYeSZ/AD
         yVQM3UersTnQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4CF1FC433E6; Mon,  3 Oct 2022 07:56:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 03 Oct 2022 07:56:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-YoTq7dRf6d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #38 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Maybe... Okay, I'll resend the fix later this week.
I'll test it one more time first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
