Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2750171F9BA
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 07:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjFBFm5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 01:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbjFBFmz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 01:42:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CAE197
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 22:42:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B03561625
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 05:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A319C433D2
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 05:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685684573;
        bh=a+UZPdK1cGH02KEHbYeYHA8JZ2X7ykktYmZQdjm/UB8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UAzcxaRQI/uI4AAxv7a2L0X1jar0ZNPsAOUvROLZTkrUcU6RG0A3tPtQoWQxoAoNj
         lHPMS/Nd180dpDleHQr90xZb/WSsyPQoxJgM4CtZmipXF1XzKiCT0TMRS1yZoN3ayr
         2Lal/b0JC5i0EFX+mebj83Tj/qIYKVkm4ZpIu2QcX2/xb01TvVsu/gYodBJ466k9M5
         p+F4r1bC1RSy3nfwRjJ71bTK/lRTJ+TVPusYJKHqS7Gv5nj0Kwbj5emUH5LhFSA8S1
         GTdUPwP6Se099+GCzSd81EOnbtYKuzodORGDtmwH9vHlEUJhfjnKf+URkkSnJx2/pG
         OpDDdLZnDTmTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7B294C43141; Fri,  2 Jun 2023 05:42:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 12-b020nr - Charging over USB-C not
 working
Date:   Fri, 02 Jun 2023 05:42:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217511-208809-OpAP8dFaI6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-208809@https.bugzilla.kernel.org/>
References: <bug-217511-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Did you enable the UCSI-ACPI driver in your kernel config?

Perhaps you can attach your kernel config and dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
