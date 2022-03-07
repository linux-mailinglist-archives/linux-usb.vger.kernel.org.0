Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D814CF212
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 07:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiCGGl2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 01:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiCGGl1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 01:41:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD3522B3F
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 22:40:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 277B761299
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83578C340E9
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646635232;
        bh=vkBedR4NUqjKxbm3yHJ+oZ+ArtvaytUIA7ASuad9F4I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=liBDWHMnya2QYtXMAZXonSgNgHp9OhFxnxC2JB8x8DglXzRrHxOG6n6hzeAP3z9CL
         zLWWWEQJn79AWvUb1BmGwkY0dYsn1ybgN0yedJxPV1Pt5BTgd6eqZM3q+q2bNvBQrk
         s+Cvsy5VDsOYKx/eiWPI66X6/k8BLUUBllfxo6MbfjDj2q1RTuLV4OtQpIKCz/nEFO
         9/tS4IkzUUNQhrcXAxdYNHKDdhoeWKXM84KFjoqeNvRQ7plwADHuitYb1bhXxARxWp
         I7DtNSxNABdeMho+0plCm14e7ocZf8nEmEA0rAaupPGXNENu408bxaXn8FKZr7hJzQ
         dUzo8RZZB8KYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2EA83C05FD0; Mon,  7 Mar 2022 06:40:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Mon, 07 Mar 2022 06:40:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: slark_xiao@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215475-208809-x9DdEZx98p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

--- Comment #6 from slark_xiao@163.com ---
Make a update about this issue.
  When we change rx_urb_size in the host side and keep it same as the QMAP
related QMI, this issue is "fixed".
  I also checked some old commit which related with rx_urb_size, let's say=
=20
https://patchwork.kernel.org/project/linux-usb/patch/20200803065105.8997-1-=
yzc666@netease.com/
and
https://patchwork.ozlabs.org/project/netdev/patch/20200909091302.20992-1-dn=
lplm@gmail.com/#2524381.
They tried to update the rx_urb_size to make QMAP works better. But these
commits seems have been rejected.
  So do we have any new solutions or workarounds about changing the
rx_urb_size?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
