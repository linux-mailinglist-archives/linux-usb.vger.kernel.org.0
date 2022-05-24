Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5923532D21
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 17:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238844AbiEXPQN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 11:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238816AbiEXPQK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 11:16:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8E5D75
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 08:16:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE009616FE
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 15:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19FEBC34116
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653405367;
        bh=+J3CP7anERe+virJtxgG+4nQgkDQF40qj3/sZGuMrX0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WXG969drIIDgarf/Jl6ATFIvq3OR9HGGnY7vf0mSFzxDA4z9/8yj+giiYUAgd//RM
         E5/U9p04hOOv20vyqHSP2ry2+wV0uJW26or/Bz/Y2ItKc3D7yIsowJ5sSWGsjNz2As
         zbpGU9Uwx2WMJEJby6nAvcFQEZ79ed+q4qnRpvv5svL2bm9iAALB+xoBbf7vow/UcN
         kgjGtfvJaYBDoDBlVmcp0ezRzvmH/153A6ooTqcLneW726b2MtOfCd4QS40XX/ZhTI
         1/ZYsZeziZSaEIYDSUTA8j9ltUg22QcBm5vpaGab2rospSj+m3Eyajs/GZgT2CXgEq
         Gaff1afDGOr7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E398FC05FD2; Tue, 24 May 2022 15:16:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216020] drivers/usb/ folder compilation with allyesconfig fails
Date:   Tue, 24 May 2022 15:16:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kushagra765@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216020-208809-ttbWsrhQIx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216020-208809@https.bugzilla.kernel.org/>
References: <bug-216020-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216020

--- Comment #2 from Kushagra Verma (kushagra765@outlook.com) ---
(In reply to Greg Kroah-Hartman from comment #1)
> On Tue, May 24, 2022 at 02:58:45PM +0000, bugzilla-daemon@kernel.org wrot=
e:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D216020
> >=20
> >             Bug ID: 216020
> >            Summary: drivers/usb/ folder compilation with allyesconfig
> >                     fails
> >            Product: Drivers
> >            Version: 2.5
> >     Kernel Version: 5.18
> >           Hardware: All
> >                 OS: Linux
> >               Tree: Mainline
> >             Status: NEW
> >           Severity: normal
> >           Priority: P1
> >          Component: USB
> >           Assignee: drivers_usb@kernel-bugs.kernel.org
> >           Reporter: kushagra765@outlook.com
> >         Regression: No
> >=20
> > When compiling the drivers/usb/ folder with GCC version 12.1.0, the
> > compilation
> > fails with the following errors:
>=20
> There are numerous errors when building the kernel with gcc 12.1 right
> now.  It is being worked on, please see the development efforts on the
> linux-kernel mailing list if you wish to help out.
>=20
> Also, patches for this are always gladly accepted, no need to file a
> bugzilla report for this.

Ok.
>=20
> thanks,
>=20
> greg k-h

Thanks,

Kushagra

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
