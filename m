Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0ED161F9EB
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 17:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbiKGQeg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 11:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbiKGQeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 11:34:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB09DC0
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 08:34:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 580C2611BC
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0462C433C1
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667838849;
        bh=c/uly8F8KqMVMtARFZvtpP3PNJ/Xj6GVlP1m4BSxgPI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GBH3J5fjf6ZIGwct5KwZlJLeLPrhJKOWYyMBmPySBUu/lwXLgPnYSjth9hUA9zhRi
         2i41SRJv1w+hdfQ+Egub8XePbASD68+/c1mFs5T1U3sXt7GkpNG8uZmWhj+28eo1JA
         AkxF/k6UGLqRSJnkjq9sC8V+oc/FubnqKJtpDlCX9rAVqUPcVxKabxEqGB1dx145W7
         bynQi/eY+NRdIsX1VTLDCbG3g6nx3+ImXJ9S9MNBaei/obbjb9GHX/VxzK0tHzZNNA
         ZHm+K01IoR9XyQ5OVXaee6YbFaTIeTT5k2tgvGyiiJQN4Nw+HkRoZCYh+y/wh/Vy+m
         bhpl+i/wE3SGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A60C6C433E9; Mon,  7 Nov 2022 16:34:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 16:34:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-K7WfiaL333@https.bugzilla.kernel.org/>
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

--- Comment #38 from wse@tuxedocomputers.com ---
(In reply to Konrad J Hambrick from comment #36)
> Thanks for all the info wse@tuxedocomputers.com
>=20
> The comments in Hans de Goede's three patches look familiar but I'll try =
all
> three patches against 5.15.y again.
>=20
> Or should I be running a different Kernel Version ?
>=20
> The Code referenced at elixir.bootlin.com is from Kernel Version 6.0.7 ...
>=20
> I'll test next weekend when I've got time to build ; boot ; dmesg ; repea=
t=20
>=20
> Then I will open a new bug report.
>=20
> Thank you and thank you and Tuxedo Computers for the tuxedo-keyboard-mast=
er
> and tuxedo-keyboard-ite kernel modules ( they work great for me ) !
>=20
> -- kjh

the two lines are the same in 5.15.77

https://elixir.bootlin.com/linux/v5.15.77/source/drivers/thunderbolt/icm.c#=
L1024

https://elixir.bootlin.com/linux/v5.15.77/source/drivers/thunderbolt/icm.c#=
L1630

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
