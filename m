Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B7461F415
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 14:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiKGNPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 08:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbiKGNPQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 08:15:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DE825DC
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 05:15:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA0C1B80DF2
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 13:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55CA6C433C1
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667826913;
        bh=hZy6Za18L6pAn1FG0VIOIIBGUFQ+7Uh0SHEVBC+8p0w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YKlPXbBXKvUZymgABKoMGhcIVVpiEuWwdtkk5aQpgtC0GqH1StU4XauqazsdQHPJJ
         n5i3fCslWhU0JDmYu6Yv3mVzm7xbL/Nt8Rytv8vs5PrQNTY75G+teywUE+Jh29LRF0
         yPrJ6A5NjOwCkmr9zQhZ0zN/hFpergaKlj2zVHBYUjPTkso/RcSQLF86gfa5/Eyz6Q
         Okrd8lgoJ3RDBWmPBv/S7ZvBa8P+7fjS5s8fS42Xc8h62F761aw2ZKdI+hstX/IUlk
         K+KUoSK980OEbaoI7xxbLx3kf9QDpmNMclC+gejjikRXHPDk6p/WoBzgQaAcngFBLR
         twaW9fl9cUDFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 40395C433E9; Mon,  7 Nov 2022 13:15:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 13:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-MMb4vOAXUu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #33 from wse@tuxedocomputers.com ---
I think the long delay is a different issue then the e820 region patch and =
has
more to do with this:

[   88.372827] thunderbolt 0000:07:00.0: failed to send driver ready to ICM

the 20s delay between the 4 retries come from this:

https://elixir.bootlin.com/linux/latest/source/drivers/thunderbolt/icm.c#L1=
024

or this

https://elixir.bootlin.com/linux/latest/source/drivers/thunderbolt/icm.c#L1=
630

respecifly.

Having the icm not correctly initialized seems to be no problem however? I =
read
somewhere that there is a software fallback for it. But I don't really know
what the icm actually does in the first place xD.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
