Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524FB6EB13F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Apr 2023 19:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDURzT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Apr 2023 13:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjDURzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 13:55:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C321BFA
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 10:54:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6551561028
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 17:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA8EC433D2
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682099692;
        bh=ozCnC41PGUEnlAEl9Ct9mGUtqWZljPvZFOwdkZPscLs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NC02G6EsjLT0XXSr2CA3cgcs8vu5iz4oxM65+3Bsp+YUpG+fqK+6iEwPYaKlTzjC1
         Mwz2q+ccFRA73ozhSvuj2yzbDINw+w0wJcXevpJCAvUam2XxSWs3vJ89T0sMSZs1uL
         lu82Xz0/9yTBfJXVRmMNq/8st8+qKKpxbi+bTe33Bvl4oDTnRIB4ZfMABbh4CViWXp
         VjarN4ktEkewIyj+bmAPcmWcI1vdKRAC8cvpGTQNtWO1e3UZeHF8EXQbrQ1Cs80A7V
         mRzVq1hgE19brDz6Db4aY3MUjRWLB9lyd9TfUjSZdMN4WdKHcI9VxVT3hcNzD1zPHt
         e0VEhtqjoT7UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9BC4EC43141; Fri, 21 Apr 2023 17:54:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Fri, 21 Apr 2023 17:54:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-pZLoaPYWS5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #28 from Austin Domino (austin.domino@hotmail.com) ---
A quick update.  I've been running a kernel with this patch on a system for
about a day and a half now, I haven't run into any issues so far, and there=
's
nothing notable in any of the logs.  I'll likely respond back sometime next
week with further updates, but things are looking good so far.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
