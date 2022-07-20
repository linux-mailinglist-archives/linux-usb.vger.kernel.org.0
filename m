Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA8B57B2D4
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 10:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiGTIYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 04:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiGTIYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 04:24:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DFB6BC1A
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 01:24:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86DF9619F6
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 08:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E17F7C341C7
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658305485;
        bh=uPZB87QFEtoAvQ3Un/MoZ3C5X8tDM0f7FPNUr3LIAdw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SQc8fDW8Jlz7wIUM3KM7Ku1sCmW53/bpM0Qg/V7eI5KoHod/bv+HtzyCxtMVW7pI+
         Yh+V/jUvGed3heQTK1Dn3u+XRCdvAyVzPEwxTGI9/ofuL+p58lVRocIbPNBrpVapYa
         KHqdUD07LK5pWJbgJKn2uZqVCg164+qT2+CsDnNNib09DIAelzsc40L3VlV6xViivi
         67KYuOpwFz0pc14HGQsl8Ty3DYkpFbFfm5liEzWXl2sjRZJNEX3DyNwyTB56TfNlOq
         Ov14XuLtf9iDAThB5VQvDazqhUXle5sim1OQRI8QLkDYQfQNmKX1gsbRIU/QNVbWyw
         75krm5lLPo1Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CC367CC13B5; Wed, 20 Jul 2022 08:24:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216243] Shutdown successful but machine does not power off
Date:   Wed, 20 Jul 2022 08:24:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joey.corleone@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216243-208809-iFkq0DgWNm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216243-208809@https.bugzilla.kernel.org/>
References: <bug-216243-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

joey.corleone@mail.ru changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |joey.corleone@mail.ru

--- Comment #1 from joey.corleone@mail.ru ---
Would you mind sharing a new log with xhci dynamic debug enabled as is
described here [1]?

Enable the debug output first, then try to reproduce the issue, and finally
collect the log file.=20

[1]
https://lore.kernel.org/linux-usb/9d54d0e4-d2db-3896-301e-9d9048599092@linu=
x.intel.com/T/#m011e17c6eedcf0e8fafbedf60caed1c2e8c7579f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
