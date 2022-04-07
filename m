Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749614F89C3
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 00:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiDGVFz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 17:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiDGVFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 17:05:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9481D1704E1
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 14:03:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A385B82992
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFF98C385A8
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649365430;
        bh=jAIxo9i4Eo7yjEvqcIVm0TvNwRaesZ/ZEDRlN7cL9ig=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WKUnSgkbyDMsKVgCuoL2rDIMY7KnqC/0K0OwCwzi3DkrYDPNehKkluAOZDrZWDlic
         HHataNsL5docSBKL2mgRFS+F2Py5SCuNGOaXcvc/wCXUnijEKuqUQpabH4JdLDXbqE
         aV8iR1G7mYyH0fNgx83+dCejOlJY6UfmxlAFu4LL37Tv37h/PF7GcMciRspCisCwug
         VCafkuMAvI8+ING9BE8CjT26WcnOiFUUcQshvdcrF/afCnoiDBbSU6jYtBE5HIiy7P
         08hgw3sqO+QxRvQ4tIi00yjLmSveu/5AX9qf3/8OaFK350zIyGNGUsnMBGLRTjrs73
         lvVLDVcEhV2/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C6F6BC05FD4; Thu,  7 Apr 2022 21:03:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Thu, 07 Apr 2022 21:03:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215799-208809-j76CeCRnuB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

--- Comment #9 from Bastien Nocera (bugzilla@hadess.net) ---
"battery" is the "least incorrect" power supply type we could use. From my
reply to the list:
> POWER_SUPPLY_TYPE_USB also seems to only be used by USB ports that
> are used to charge the machine itself (so a "system" scope), like the
> USB port on a phone, not for devices connected through USB (of which
> there are a lot).

(In reply to Manuel Ullmann from comment #8)
> It just allows to change the charging type (Fast|Trickle).

This is one of the things that power_supply class devices can do. They don't
have to report battery information if it's not available.

If you want to read the battery information of iOS devices, it's available =
in
upower after at least one user has paired with the device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
