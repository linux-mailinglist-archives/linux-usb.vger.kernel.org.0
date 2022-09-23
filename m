Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7A35E763C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 10:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiIWIwV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Sep 2022 04:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiIWIvr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Sep 2022 04:51:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187F14BD06
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 01:51:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB565621A5
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 08:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13406C43145
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663923106;
        bh=FWstel/Cobc9ni6Pyg7wMms9InzStgNhGRhCnPwLxdI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e6bOr2JtNK9MjanS6ZwW0QNv5Jha+Wx7MA2MxySQXMJXO8NkxwxkjoXEDlnzWo3L4
         150e58PKPVBwxmZvCP3pdyFj+1Ur3HTjuMhgCrsCKHAFKr/3AzlBabYW7nDvg5PFnz
         tPASJtBDMP6eC0myaFhy1DpE6VEeekb2hr6IdLDfRBTMJSpEdSPcO/h0o2u9KyvOrS
         QN66PbdtOR+ogS9tE83eKJ6uZNrT+SBroCJZcZ/qvMPyVPV2SjMNYrHK3HrO5DLVGs
         YGG7fjZnZiIA/y+SlkMTv9jfr1T5wcfqhen7GU10XjKF7AKbrprxPpQ8qVDY75HZOo
         hswNT6BfY8jfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04327C433E7; Fri, 23 Sep 2022 08:51:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 23 Sep 2022 08:51:45 +0000
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
Message-ID: <bug-210425-208809-gxzlOGPiX4@https.bugzilla.kernel.org/>
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

--- Comment #32 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Quick update. Bastien saw a WARNING that my patch causes. The warning is ca=
used
by unbalanced DisplayPort alt mode driver's module reference count. I'm sti=
ll
working on that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
