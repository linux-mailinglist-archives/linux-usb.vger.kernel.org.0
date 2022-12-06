Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549B6644FC5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Dec 2022 00:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiLFXnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 18:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiLFXnp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 18:43:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA211E0F4
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 15:43:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 629ED61976
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 23:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAB3CC43149
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 23:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670370223;
        bh=fJcn8cCslgXuwvI6IohKW7iXFQbjCGQkKSPD3xA1Skc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MwDlBnYkWM+rCGWqDn4RbGRjPwMVA5xUYi+UxXar1mMeERT2TeaxKdV5Q/3+t+LGR
         ZsKpBEt6ZC91AYALRDblVpvWz0W+/cEQ48GSSJW6qH8S6HVqFUyqfpHY2CMBm7Nfmn
         jpC6NRNKuGk46nb9vhGmMK5SsHmz866Rn0EYrF8Yup1S4L1bGhmKUNPvJ6bZ0x2T12
         SBhQ7fEhfX4whDX6MSLRdhMabvZmbGvRSs3ro9rqmpKAYZF2Eis3EN1hjXLXdfVujH
         u5Z0Y/BCgPAs0l00Ma8uLPIlAyUmJ/KN45d5amC8T5P2OxrgR+jyHrvhDaxBSMbHiH
         TPpblpR9+fgQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC670C433E9; Tue,  6 Dec 2022 23:43:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 06 Dec 2022 23:43:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nate@kde.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-210425-208809-qDySM7y92V@https.bugzilla.kernel.org/>
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

Nate Graham (nate@kde.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--- Comment #46 from Nate Graham (nate@kde.org) ---
This is working for me as of Kernel 6.0.10-300.fc37.x86_64 (64-bit) on Fedo=
ra
37.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
