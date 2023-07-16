Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6941E754F24
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 17:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjGPPAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 11:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGPPAE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 11:00:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222961B7
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 08:00:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 98B0F60D14
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 15:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04DA1C433C8
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689519602;
        bh=XT93Y1GaODy5DT2UnCPn1NSw+vMcfW32OvWyx7ehJlc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UodhOVUFP3ugHPBVGomVjO8zkUA7XjOqP6P7V2CLPR17dJp7ddiqoX9PdF5MYxpSP
         6fZ0V5xHlu125aYFulLvNwR9CkaJ4rn4pfv0Rft8G5AiWMRRYaBkJMA49k4/C7u3HI
         7y3WxY3mqZoxDVTudXrjcWkxk6YUCkWLQfPHXn0c33AJHYolYLWsKah660RqNfIUFf
         vLlM9KiREIeOo4uBJHa25BrY0Jagrz3MshAET1jYYn5B1o2CzNdKvoOlQIg5u/iskp
         en3+49p9vFOe9FVHSQiEgmz6RVOuNmvD4g4+RdFSbma3xyTQgalU5X7E7XvJRZ5LuJ
         A+/ItHaeKHYYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DFC38C53BC6; Sun, 16 Jul 2023 15:00:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Sun, 16 Jul 2023 15:00:01 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-zXUU1q4kqe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Jul 14, 2023 at 01:18:29PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217670
>=20
>             Bug ID: 217670
>            Summary: Regression in USB DWC3 driver in kernel 5.15 branch
>            Product: Drivers
>            Version: 2.5
>           Hardware: ARM
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: tomasz.rostanski@thalesgroup.com
>         Regression: No
>=20
> The backport commit to 5.15 branch:
> 9d4f84a15f9c9727bc07f59d9dafc89e65aadb34 "arm64: dts: imx8mp: Add
> snps,gfladj-refclk-lpm-sel quirk to USB nodes"  (from upstream commit
> 5c3d5ecf48ab06c709c012bf1e8f0c91e1fcd7ad)
> switched from "snps,dis-u2-freeclk-exists-quirk" to
> "snps,gfladj-refclk-lpm-sel-quirk".
>=20
> The problem is that the gfladj-refclk-lpm-sel-quirk quirk is not implemen=
ted
> /
> backported to 5.15 branch.
>=20
> This commit should be either reverted, or the commit introducing
> gfladj-refclk-lpm-sel-quirk needs to be merged to 5.15 kernel branch.

What commit exactly needs to be backported?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
