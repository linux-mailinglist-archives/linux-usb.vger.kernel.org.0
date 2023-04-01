Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466CF6D33FE
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjDAU5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 16:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDAU5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 16:57:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C7D133
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 13:57:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66D9860F0B
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCA54C433D2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680382654;
        bh=DXGPvilsH9xR9RYPRwJ8jgZBNJMnaswruOTsa1FbkBw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AlsdVmDMGuk/WsWKOzIr4tm081KJAzx5Ku6McOrr/iegLf7gIPEMaTCQqpfkjJqAl
         l86QeBHyO/6rc6uU9/thDvSQkzhEnAROjXYEx0NF7kWk1ZLuGWZ5xpYPMi0tTXe22z
         c4N1ozkh5OnGl9R+tAoPb1aGKnmmeEtip5Rm9bWk6lk/crnWhjHP4rme7tXYeT0lqW
         l2jNwL/UbpFfSM00KKkkWnQwu50IcdMDVOpv/1I4G+bySpq1svM8zmCqyyH9DUq25G
         eFgteAJz8BSVsvElIuOpA9CJzU5fJxsdqG2kQBpARwIvnVPdcDFIxcjPS/73QGuv4O
         F9QtD/2gxA/ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A4055C43142; Sat,  1 Apr 2023 20:57:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 20:57:34 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-IUln4VkJ8J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #3 from Austin Domino (austin.domino@hotmail.com) ---
Created attachment 304073
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304073&action=3Dedit
Log file displaying this problem on the Intel NUC7i5BNK running kernel vers=
ion
6.2.8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
