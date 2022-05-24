Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCA3532CF4
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 17:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbiEXPHu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 11:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238346AbiEXPHt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 11:07:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1AA08B090
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 08:07:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B4E7616F2
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 15:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF196C34118
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653404867;
        bh=o7kUjbPQebsbS0R0I95ZN7L77322eSdv3EXHILQ+yTg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iRZrR129wCr80DtgI/VfqbSWim0cvq0IYBnIY6u5EMQTQcFcM+NckAfdo5GP2XmQE
         tIFPDr3g35q5TO3suu8ufk6STR7cKX+oGNzMn99ofQdf1rKtWo0TRmS0jlt9d6Iqpa
         evacyafFtXiR2Y0RykYijeNJggxm9RpRv7J8O9CpsLkegO0LTHz1iI94rIqw1I7UVR
         cuAdw/40TK+cIAvNpfKrpCraw2+pFA5b9mk8OBLkd/x9ruLIzYtvcKTCax/epC/c52
         9z1SOyfYKqVJslFzVqiBYOvosldKeICew3GELJahqUxs/WVR0SDUSlVsmo5imDHeIU
         dMtresjAMeksw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BAB6EC05FD6; Tue, 24 May 2022 15:07:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216020] drivers/usb/ folder compilation with allyesconfig fails
Date:   Tue, 24 May 2022 15:07:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216020-208809-qH0CZAVF0p@https.bugzilla.kernel.org/>
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

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, May 24, 2022 at 02:58:45PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D216020
>=20
>             Bug ID: 216020
>            Summary: drivers/usb/ folder compilation with allyesconfig
>                     fails
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.18
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: kushagra765@outlook.com
>         Regression: No
>=20
> When compiling the drivers/usb/ folder with GCC version 12.1.0, the
> compilation
> fails with the following errors:

There are numerous errors when building the kernel with gcc 12.1 right
now.  It is being worked on, please see the development efforts on the
linux-kernel mailing list if you wish to help out.

Also, patches for this are always gladly accepted, no need to file a
bugzilla report for this.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
