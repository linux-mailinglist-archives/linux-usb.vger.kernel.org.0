Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64D463EE62
	for <lists+linux-usb@lfdr.de>; Thu,  1 Dec 2022 11:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiLAKts (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Dec 2022 05:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiLAKsu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Dec 2022 05:48:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA0B7CA8E
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 02:48:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38BDEB81ECA
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 10:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB089C433D6
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669891704;
        bh=huR96EjnGXuHdUS5H3O4d+KKJF7MZTkihMcLUTRLntE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sD08JE4ofmngEWfzhBzST2/v2ZUy2K4CgjIPXIDmtF++p89PpIMzf8D8TYtPQtyFM
         7JkH78z7O1MgbiDbep00QUaMbLUuTyEI2LyvOzsZXDFhFRPuGHG34CZl28CoGHptb/
         2G/pmmDcwE8+jK0nGUJIFH7mJ+dcNLU/iMWlRVLvitzn2Qx9E8vfzCFLMSvY5gfRHL
         qAYzo9M7+07ThJ8E80/SEtWjSVUfCT87LPJHx8agIH/NnoxFPe1JCxAk2jlChB9YKa
         nA4rLZLQ6fpJSjslzu4DQz99+/rhF075qSkj5zQWvdv/343kX35rHmoVd1y9rATYCG
         MfGoBt2hxt+LQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D3D18C433E7; Thu,  1 Dec 2022 10:48:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 01 Dec 2022 10:48:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216697-208809-RiKv1SyEnH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #5 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Heikki Krogerus from comment #4)

> I think that problem is related to bug 216706 (maybe). I'll figure out a =
fix
> for that first. Let's see if it helps with this problem as well.

What the status here? was this ever resolved?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
