Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3861E524E56
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 15:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354439AbiELNck (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 09:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354446AbiELNcj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 09:32:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BFE1356AC
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 06:32:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F04960FE4
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 13:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C675C34114
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652362358;
        bh=eH0hDTys1uDOZQzWWkGfGatgzJVjBCZe/wt/+zf+ur4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s7v7JiksRcFJPnyWF+cQ5OWgk+ZH7ZmAMljsRsk/stVk3ca5Q8sCnCKJ7cx6trle+
         mdtKN9yvfztxl4m9Bf2nxDMFxH5deUlK3LegfD7OFHuxwQ9pO356CzGevSbQ0n7vho
         rkl4flhwtpuThF/s4np9yMIEInDruajXT8SnkswBtkDYrLaz3ejGmSPrl713OTQka6
         Lab65JlJgEuNUpRm/N1YVgKYQu5ub+5xwpAQLO9BRnqiEL8BiEauPQogGIcn8lcslS
         7iKjfmj5uOkUBUDcPBq+3W4RZRtYNdsqa01DptV+eYF4iYZ6wi2lQUcVzY/kYSbpvP
         8353pQq73iXjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E8320C05FD2; Thu, 12 May 2022 13:32:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215967] Kernel build fails if CONFIG_REGULATOR is unset
Date:   Thu, 12 May 2022 13:32:37 +0000
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
Message-ID: <bug-215967-208809-pOhNKW9L4H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215967-208809@https.bugzilla.kernel.org/>
References: <bug-215967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215967

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Wed, May 11, 2022 at 05:30:06PM +0200, Bj=C3=B8rn Mork wrote:
> Greg KH <greg@kroah.com> writes:
> > On Wed, May 11, 2022 at 07:44:39AM +0000, bugzilla-daemon@kernel.org wr=
ote:
> >
> >> Compilation of "drivers/usb/phy/phy-generic.c" fails reproducible if
> >> CONFIG_REGULATOR is unset, because function "devm_regulator_get_exclus=
ive"
> is
> >> undeclared but nevertheless used.
> >> The offending patch propably is commit
> 03e607cbb2931374db1825f371e9c7f28526d3f4
> >> upstream
> >
> > Can you please send this information to the stable@vger.kernel.org
> > mailing list and we will work on it there?
>=20
> Please backport commit 51dfb6ca3728 ("regulator: consumer: Add missing
> stubs to regulator/consumer.h") to v5.10 stable and older stable
> releases where 03e607cbb2931374db1825f371e9c7f28526d3f4 is backported

Now queued up, thanks.

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
