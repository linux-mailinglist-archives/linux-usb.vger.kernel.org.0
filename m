Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D72523305
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 14:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbiEKMVk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 08:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241126AbiEKMVg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 08:21:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3954124636
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 05:21:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B3426B82345
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 12:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65DA6C340F2
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652271688;
        bh=dnynTjYAhC5GfrW1HBRm4CyAph0JRh0326UT0iPThjA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jAIgeVcDkoKpABjIKgrl5ifFZZ7f0uuXD1V8QUNlP7Qzr9sTNJwOO47n2tyQCeZMn
         BWavLL3IVjuzrbcFeXNLbcWpHmUnMs5jS8Yn0wRHLZBfNwS8whLjsTEIsKPqRwB29y
         rFaaPSjABzSA2zwamkB19TAw/qo8nYA+40wphBUmWHYmbBThvkoOIYbqHK3FRDsbxF
         y66s9qFRdaD+yMKI7TNYZUWPtnXC0w+ot6vybLjHepc6zkT+jm8LG49D97zw8XcMO+
         FU5DRnspHnLCIhe/JwUaqYDBvX+e0796lsils10mMtUxCZDzj6855RnWXWpDjJMg94
         0PbqGpt51cUIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4FEA4CAC6E2; Wed, 11 May 2022 12:21:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215967] Kernel build fails if CONFIG_REGULATOR is unset
Date:   Wed, 11 May 2022 12:21:28 +0000
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
Message-ID: <bug-215967-208809-q3QhiRTCNc@https.bugzilla.kernel.org/>
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

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Wed, May 11, 2022 at 07:44:39AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215967
>=20
>             Bug ID: 215967
>            Summary: Kernel build fails if CONFIG_REGULATOR is unset
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.10.114
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: trallala@onlinehome.de
>         Regression: No
>=20
> Compilation of "drivers/usb/phy/phy-generic.c" fails reproducible if
> CONFIG_REGULATOR is unset, because function "devm_regulator_get_exclusive=
" is
> undeclared but nevertheless used.
> The offending patch propably is commit
> 03e607cbb2931374db1825f371e9c7f28526d3f4
> upstream

Can you please send this information to the stable@vger.kernel.org
mailing list and we will work on it there?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
