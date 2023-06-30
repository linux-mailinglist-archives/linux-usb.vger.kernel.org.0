Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6BA743249
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 03:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjF3Bfb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 21:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjF3Bfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 21:35:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73342974
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 18:35:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BDC961666
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B532EC433C8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688088928;
        bh=HxMoeM92PBTCK8SSPw0VrJY+n1kje1sip5Xvg7nLzdg=;
        h=From:To:Subject:Date:From;
        b=U4WLMi9S4/NzozY3ipV9NlmuIq6mv/AdN4CesifSm0Uk8OXPF1j71Q3cN/pGiUjGq
         bY9leFQxO4orOSmzoi9AHV4kcOQhrs1guBR8MtwBxliFFGOSkU1bSITkoYaWxpv6l4
         YIdY7KpJ9frmYNZYh4sLGiPfHQXxmURqzKBq9eF42+0X5lmoLAyvOXO0ZFDG+FZoYR
         wno/Scufaty0038kZAYD1MZawpM7CDoVif7k8MTBH/Mfs48eL4IyQ9Ooq93ppz5H2s
         M2cLN0YUVchRPWzaqkKRKIjTg4kkh3XgdnOoltdrRrA4ByaVp4PbVn0ZPTxoR6w/pr
         Ow3Q0rqw8ikgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9CAECC4332E; Fri, 30 Jun 2023 01:35:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217613] New: [BUG] [media] dvb-usb: possible data-inconsistency
 due to data races in dib0700_rc_query_old_firmware()
Date:   Fri, 30 Jun 2023 01:35:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: islituo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217613-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217613

            Bug ID: 217613
           Summary: [BUG] [media] dvb-usb: possible data-inconsistency due
                    to data races in dib0700_rc_query_old_firmware()
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: islituo@gmail.com
        Regression: No

Our static analysis tool finds some possible data races in the
DVB USB driver in Linux 6.4.0.

The variable d->priv->buf is often accessed with holding the
lock d->usb_mutex, here is an example:

  dib0700_change_protocol()  --> Line 638 in dib0700_core.c
    st =3D d->priv;  --> Line 641 in dib0700_core.c (Alias)
    mutex_lock_interruptible(&d->usb_mutex)
               --> Line 644 in dib0700_core.c (Lock d->usb_mutex)
    st->buf[0] =3D REQUEST_SET_RC;
               --> Line 649 in dib0700_core.c (Access d->priv->buf)

However, in the function dib0700_rc_query_old_firmware(), the
variable d->priv->buf is accessed without holding the lock
d->usb_mutex:

  dib0700_rc_query_old_firmware()  --> Line 516 in dib0700_devices.c
    st =3D d->priv;  --> Line 522 in dib0700_devices.c (Alias)
    st->buf[0] =3D REQUEST_POLL_RC;
               --> Line 532 in dib0700_devices.c (Access st->buf)

And thus harmful data races can occur because they can make
data in st-buf inconsistent.

I am not quite sure whether these possible data races are real and
how to fix them if they are real.

Any feedback would be appreciated, thanks!

Reported-by: BassCheck <bass@buaa.edu.cn>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
