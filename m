Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1D661FAA3
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 17:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbiKGQzl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 11:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbiKGQzj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 11:55:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E0A21813
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 08:55:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D753761052
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B51EC433D6
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667840138;
        bh=KXh3JIjZvh3I6uT9FoLDWIT0khbbh6TCeEvzAgwUcog=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i7MWTrS1oFuy6VBr+1Rsds20rR/pZAxmYFRCqOGrTtRSL/lhS0od7hkDfmx03uv25
         hKi875F2hwnGijYBbxWSHHzgt7gh21ORtHwHBY9RKn78qEmfLONwP0a9L5GFSJnaSO
         /Yrpe2GfCw3hWGdMNvxqjEihGemPqV1TRM269oF8ioecFrn2MDhIuCV0h+ZupR7k5c
         VnpA5Kj3h1amZ5JV02fp+zG9YYryeD4vrZSIp8I38bEZjnbpQY+g+4KuB9cQR8lB2s
         hED5b1Q6jIYXHdpD28jD6NSgfLR3SpRUUl5DUlN54fo2qArc2sg51Tzun24y1k45Xf
         6ZryEGXTp9jvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 32040C433E4; Mon,  7 Nov 2022 16:55:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 16:55:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-NSaKq8OsUM@https.bugzilla.kernel.org/>
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

--- Comment #40 from Konrad J Hambrick (kjhambrick@gmail.com) ---
(In reply to wse from comment #38)
> (In reply to Konrad J Hambrick from comment #36)
> > Thanks for all the info wse@tuxedocomputers.com
> >=20
> > The Code referenced at elixir.bootlin.com is from Kernel Version 6.0.7 =
...
> >=20
>=20
> the two lines are the same in 5.15.77
>=20
> https://elixir.bootlin.com/linux/v5.15.77/source/drivers/thunderbolt/icm.
> c#L1024
>=20
> https://elixir.bootlin.com/linux/v5.15.77/source/drivers/thunderbolt/icm.
> c#L1630

Thanks wse@tuxedocomputers.com=20

See Bjorn's post -- I'll wait and see what he finds.

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
