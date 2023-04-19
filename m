Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266FD6E8167
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 20:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjDSSpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 14:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjDSSpt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 14:45:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9368B46BA
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 11:45:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ED3C64198
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 18:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92165C4339B
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681929947;
        bh=M4ofPFVwlFNWfz8zJfC4nCSrW3ouM8eu0NITvVqJST8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tON4mQuKy9jQmuJkxewSw5c83VbmzTFFZEH4w11pqwT5AUXgWBKw7KtTpaiYLfAuZ
         5AcNcNgM72qf48dbtUpZtQH863VB85fFhgJxegYEuFcIMZjAVmMY6pN9awtP1pjyY7
         cOiKBcFC7ydIMsUtPSY9nnYKlRV6VhMe2JLwKW7ZlHF4dXaMKiyDRBTLWK2GLTzaLC
         W/yNQeMLjDxC7R6iIyTyCM1CJqE8VUkTgjCh7Njs0sfP25Ee44QVhMm667mXJcTdlV
         TPF/J7tEdACsA5Cnnxm1/BDUMDc+UzrXvBqIFPjOs8zsyWPohz9Z6lZ3AExCzHZlyY
         T7lgpbDJPLXRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7445DC43143; Wed, 19 Apr 2023 18:45:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 19 Apr 2023 18:45:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-C6i6VSsNUW@https.bugzilla.kernel.org/>
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

--- Comment #27 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304164
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304164&action=3Dedit
init test with trb calculation test log

Here's the initial log with the trb free calculation patch compiled in the
kernel.=20

Initial test shows that the number of trbs stays constant at 512. I'll run =
this
patch on multiple computers until next week and update with results.=20

Let me know when the rework is done as well and I can go ahead and test tha=
t.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
