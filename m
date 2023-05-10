Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659956FE736
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 00:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235456AbjEJW3M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 18:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236253AbjEJW3L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 18:29:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2935E53
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 15:29:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A6E163442
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EADBC433EF
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683757747;
        bh=N8OuK1A3CEXXvRb0yHraNS2xUxVzX7VFUep3tJZvxSQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FiKezWMT8MLJi1QU7P1jtyANGA1zp2++NJ+Tn+omCrGfz+1V82R+GulQ/BfPjuKGd
         Wy72HPgzK25jZ+0usG1fJULwAc2EPO3Vv6kNyetNyOLO0D4yS/Sm+rIyRTtV4eafKs
         UAOLP7Cteo7RvzJBcdF1vlOenPxOzujin7GhJGCxmU6alz+32ANdJ6prh4wAmNDVQJ
         WkcUAHxbUCmCMnDrMC1aKv0+tgpxnd6m1zVkYdUpVBQEWrZi3hQHrgUjF9uiJaCfjR
         DtTKYY3w+mK5QpqeV5H82RghyRggXC88RGfxYaQyD/Lf76wfF72AuRRrxyE+ejzK4K
         dWBsfLj0+kDEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8E11FC43142; Wed, 10 May 2023 22:29:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 22:29:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-lSDPtsdFtt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #23 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
OK, I will do that an dreport back if that particular commit also fixes the
issue with TPM re-enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
