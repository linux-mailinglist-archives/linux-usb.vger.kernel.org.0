Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABDA700D45
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbjELQpj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 12:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237331AbjELQpf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 12:45:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD84AA250
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 09:45:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 41B6263DAE
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0E97C4339B
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683909931;
        bh=wMiJ2Iho9ro7J/vZJD6/BdF2EwyGLMkAXjSBT6r7eEM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=STlVZijQQZVXLzwRmPXhfObvs7KBluhtsN5sY1TrfbzsH6gz1zNMfgj6OGL/jmf9E
         94cV3Hp9dudVyICCzKsxUbc5RWeSxOcof0gNiSwLzGOHCQPsrfp4YicP8Rbf4yDeOo
         hlWtvegK+9BbuudSoCVKOGzu/XmEDKJY8AmjaE3zUkfARthbjALK2YPUNqgxzMZu0z
         D1cAAycAIO+QBLKLiqRYF9zjlQrR/Sd4RCka5MDe8/754v9/v2oTz3UkXgARMWM8Q4
         Ca0wIaLTrumS+V6g01dQ9paswTxwxlWVJ7yc4ud2gJSxWsHF625VmN4EOlIqO4Y7FQ
         ZlxkhRtQvmwTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 876CAC43141; Fri, 12 May 2023 16:45:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Fri, 12 May 2023 16:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217122-208809-872Ajl3nV8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #25 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
That's great news.  It's actually a duplicate of
https://bugzilla.kernel.org/show_bug.cgi?id=3D216989 then.

That patch rolled out to stable kernels, so this issue is fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
