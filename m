Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64C51C21F
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 16:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380500AbiEEOTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380551AbiEEOTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 10:19:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD1D12AB2
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 07:15:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E676B82D7E
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E88FCC385A8
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651760122;
        bh=IiQRzvhWGBg+bu1L6py52+vB2YcaUs+kwtkJEtWCy8s=;
        h=From:To:Subject:Date:From;
        b=IHG4dAQkS71J5oZgv4Q48iCZ1jGGMZTGAP/aDYIB7jPMaRCpFpYVfYQwbu+KcjCfX
         JjVtikuMCrCXoA98KWhHKVRCzcrEClOwi9cgKb1jTWm4eN3u625rN2CM09W6j7Csrh
         4rfHONkKCfR+LN9coNKOMNyfthXQGFlsyawJV1u4tEFkMpKRWDP8WSGOW3AMXpxmgK
         Mg6Usf2vuINLeJ+avHGs53UNl1s6iJ7gtM2xLVh5rifDdQW6SJslpVDrLyAePjRaCJ
         bOeBrlYx6IZGY4h48IEujvZVmG9Z2gKaN5BDijn1AwNSF6tbQdz0iOArq+OGX+Pi0c
         0SbPVp5j3sUGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CA10DC05FCE; Thu,  5 May 2022 14:15:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215945] New: No way to get user buffer in
 ll_driver->raw_request of hid driver sent via hidraw HIDIOCGFEATURE
Date:   Thu, 05 May 2022 14:15:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ga2mer@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215945-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215945

            Bug ID: 215945
           Summary: No way to get user buffer in ll_driver->raw_request of
                    hid driver sent via hidraw HIDIOCGFEATURE
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ga2mer@yandex.ru
        Regression: No

I am writing support in the custom hid driver for the screen built into the
Thrustmaster T248 steering wheel.

Unfortunately, I can't send what I want in any way and I have to repeat the
flow of their Windows Kernel Driver.

They use a dll to communicate with the screen, which sends a feature report=
 via
HidD_GetFeature, which is sent to their kernel driver and they use one repo=
rt
id per bunch of actions:
ef 75 .. .. ..
ef 17 .. .. ..
ef 7d .. .. ..

And unfortunately (as I understood from the source code) hidraw_get_report
sends an empty buffer to my raw_request and I can't understand what this re=
port
about.

It would be nice if it was possible to take the user buffer from somewhere.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
