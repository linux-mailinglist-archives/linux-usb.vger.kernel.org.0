Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8201C682658
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 09:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjAaI3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 03:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjAaI3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 03:29:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6F1222FF
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 00:29:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08DFA6144C
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64A77C4339C
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675153755;
        bh=KY2S0C2KcJQHcr8jrph/0JsXjsZWwJednwNd2FT0WBM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J+7pVaubtcU5wwi4d6dbwvyxC/BnA/FUPm/w4DbP7sOambmHdn4fSMVR145YHzbcb
         gKBdLHs9IETBLsTcr7CNiVGftO0GJGEXe6CvtYxoGkPIGDlBTRnXr8cyYv4Yzy+Gcl
         CQVWYbSQg4BAy9xIyDOM8stCZdZ7l3AT11ytpnymMdBfrgbdNtKl+PcbHPjwgMXDW3
         QeYIiBHKAbsysJojH1QBGZr0F24DlTcYVmYp76ibvWZpi3FrFHUFw9AEXnIZLa4WS/
         dpo51CdMeWZPIaY6RbUd8SKr1CRVaSJ45+XdGM+VEB7wgd0fkLP+8OFYq1CPTnubE6
         aj5483wY2/LYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 50ACCC43145; Tue, 31 Jan 2023 08:29:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212053] system resumes automatically by the XHCI host
 controller - Intel N6000
Date:   Tue, 31 Jan 2023 08:29:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhp@endlessos.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212053-208809-lYunpO2uyY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212053-208809@https.bugzilla.kernel.org/>
References: <bug-212053-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212053

Jian-Hong Pan (jhp@endlessos.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #13 from Jian-Hong Pan (jhp@endlessos.org) ---
The machine is returned to the owner.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
