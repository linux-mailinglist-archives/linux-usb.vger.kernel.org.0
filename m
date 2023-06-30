Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1C3743407
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 07:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjF3FWZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 01:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjF3FWY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 01:22:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B3F2D69
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 22:22:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3011B61583
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 05:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98FD0C433C8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688102542;
        bh=leZMDDO7lH2UEn1VIjWxwdVRO1/Jlgsbb31E8oreQ0I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jaIOywR/Ue1a+84sQqGjtSM44a14gvHNXyjOQCU8aNaobPYKIdGsWgc7QPX9TD61l
         xkAaH0PV2R5FJuvMfc4Sn8cCTb5sXN/ZgSYspcebhFxY/s1iT9amTwqavL1d8+6A+A
         Xc5f0BFTfQu761b7pgizGiLl1faOZHT0kRhvbR94OvqTxlOKWfeNRMCwooQaXXY1Tk
         oDPWbi7CMAKc6Kd5Bzub6HpNgHg/d6gjQ9X98weMPom4GN1bzaHY1sbLRD2PBLWh2Q
         Ogb3kTuyaE8iPg+lMKu4gL5eoxWeFxGYixXa94HGPoCcmw7yiSqZo0HjaBzlpEHZXR
         ulkJPgTzt0yeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 84044C53BC6; Fri, 30 Jun 2023 05:22:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217613] [BUG] [media] dvb-usb: possible data-inconsistency due
 to data races in dib0700_rc_query_old_firmware()
Date:   Fri, 30 Jun 2023 05:22:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217613-208809-uO8Y1s7Sk8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217613-208809@https.bugzilla.kernel.org/>
References: <bug-217613-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217613

--- Comment #2 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Jun 30, 2023 at 01:35:28AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217613
>=20
>             Bug ID: 217613
>            Summary: [BUG] [media] dvb-usb: possible data-inconsistency due
>                     to data races in dib0700_rc_query_old_firmware()
>            Product: Drivers
>            Version: 2.5
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: islituo@gmail.com
>         Regression: No
>=20
> Our static analysis tool finds some possible data races in the
> DVB USB driver in Linux 6.4.0.

Please report this to the mailing lists for these drivers, not in
bugzilla.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
