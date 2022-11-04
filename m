Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824AB619448
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 11:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiKDKQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 06:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiKDKQQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 06:16:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72182B604
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 03:16:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D5B062123
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5876C433D7
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667556974;
        bh=nffHvu+YRE0sLrZJfJKzTdeu2HVWE8GxQNXULhnZ1EA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jBSXBGkOxiDl06NRB9rbCTzkiU0CYbeDMDxfq+p/nXDw00RADL1ZBP2oiD0c9jkOs
         3I6gSs530V7/qc9zk5dZARriRywTG+FxAR+d+ht5xgKAzOCRc5QGSM1m91gsAjdYHc
         wXdKiOE8gZ739X7nHXuK24imgukyeq2qfsxWa78CSdXj1SVHDcRGtHs4oahOc8PThE
         xyj6Rn/gdDTH61z0xt7XzmBsLZhmaEmDj70LLMRVIlZg6NWKcNzCSJN5ZH9FAp8Ujr
         fCwS+lbIDGzubY5AUoSslDp3Vql38VxrhpfQjqP1tRJmXmqhZUTu8XSpJ30RehY32g
         TE93P0Np6eeYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C013EC433E4; Fri,  4 Nov 2022 10:16:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 04 Nov 2022 10:16:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-JqVXwqvVuz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #27 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Created attachment 303131
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303131&action=3Dedit
Linux 5.15.77 with Discrete Thunderbolt Enabled ( no patch )

Bjorn --

This dmesg for linux 5.15.77 without your Patch.

When I enable 'Discrete Thunderbolt' in the Insyde BIOS there is a long del=
ay
for each of the three DMAR Errors and a final delay for Thunderbolt ( see t=
ime
stamp: [11.534560] thru [88.380241]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
