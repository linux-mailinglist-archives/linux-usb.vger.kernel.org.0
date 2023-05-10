Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97596FE67C
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 23:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjEJVyj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 17:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjEJVyh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 17:54:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0C8527A
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 14:54:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 836696134C
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1813C433EF
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683755675;
        bh=nkKNHNo9CDL+d/e4HM0V5Lh48Km3AdJKB/hbhbZggDk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gMvZZyu4q9EGYjH2O3Wr0olEe+xTIB2kw9PVy7XQHxpRxCKYfI57/8MQ4ULL9FJRm
         jIQkv/o7VpmP7xRbD4gxjygW/9gR3bXkRCbSblTVTEGYAqp8dgS0pC6PfhGAWe1lb1
         JuontilSF+Ya8aJ43mIGHiOSIVPNqdwET4hELNf1pGenBbz+ROcMA6rsRi30wmTtqA
         0ck8s0dmumjaTeU05tsble2QMJAUNEogWwOKqcguUZW7g9xOxtlc5M6hztCfBeKk6i
         qZSrpYAovZxwLgnw9DnN3TDH1zOboa0OPeoWKf/QDkPLJpbI/Wm42lGOPVKMdt24Vv
         mnYhTiCiYE3FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CA358C43141; Wed, 10 May 2023 21:54:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 21:54:35 +0000
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
Message-ID: <bug-217122-208809-gBJBW3NVjK@https.bugzilla.kernel.org/>
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

--- Comment #18 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
can confirm, there's no longer a /dev/tpm0. Will compile previously failing
6.1.0 now and see what happens...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
