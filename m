Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C8174324B
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 03:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjF3BiO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 21:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjF3BiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 21:38:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD69F2D52
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 18:38:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44F3A6159B
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EBF1C433C9
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688089088;
        bh=2aeFI+ssKF1ZeLU3JzDEHY3pQ32AOs8I0rpzEC9s8HM=;
        h=From:To:Subject:Date:From;
        b=Px1wYRB/FAnuTWzGtilZLArN52VnRpfMerk4JUJGDJ2kniqL81T3mVQnmUXG5XRAo
         JBtd1jRm+TN30w9i0PxmOHgl7lsGdHHe7ivlJK9BDBHixak3UdvO4yv+elqz9415IM
         /btp31lCgN/ArbAA6fWaT2REnCc8FVAdkrhq0X1/S4vaXRZm0FhYhcJuQhko5i4cUx
         7uOqwpE3d4yVkrg5ZPUn72wQa/6Mk7uUzr/YhV8qRFh50nwXI9B33ZRK92y29cIH1k
         PzyaBm/IgtEIk7bFMNCFewGB0NLfLuDQhVaxlZpu/h8JC8JuJaVBc2cklW6/0+Cbgi
         BEAyDYFupHLbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7A772C4332E; Fri, 30 Jun 2023 01:38:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217614] New: [BUG] [media] dvb-usb: possible data-inconsistency
 due to data races in dib0700_rc_query_old_firmware()
Date:   Fri, 30 Jun 2023 01:38:08 +0000
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
Message-ID: <bug-217614-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217614

            Bug ID: 217614
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
