Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3CE6A2F00
	for <lists+linux-usb@lfdr.de>; Sun, 26 Feb 2023 10:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjBZJee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 04:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBZJed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 04:34:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFEF1024D
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 01:34:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40686B80B07
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 09:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02DB8C433D2
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677404070;
        bh=paFQcPVhz1aHLj2X4QgA6wtOGpf5HkUAutzurfa/cSQ=;
        h=From:To:Subject:Date:From;
        b=fvRGg6B2VRao3y/XxKQign7t/Alh9JCXJ18yK98fFM5vUWzdsrXnct3QtVPQddl4b
         F/Rh7bmByG8YKvHTcpdaHLKdA+hItHvo94S80T0W6jVfNNrimKkgcBctXAOjmGIR9y
         k1XBta1A438mA9F957opgA58/w3Fu9QJ3twCEBezKiTeUK45/JuulwicVaCldl2z9h
         OhPtYg8o48/W3OGvUjB7SmaTudQsbUBDFhznzUNogTygg3aQXwK/E4IWJ4OmgPPOj4
         qOjqsVKtvMpEYTH4NlXU6pWzdWrucGWp17iTohJGTTYx2oo/Ou0DxMTjGqkjk7zmy3
         tw30h/lG41wMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D5911C43141; Sun, 26 Feb 2023 09:34:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217088] New: xone23c mixer
Date:   Sun, 26 Feb 2023 09:34:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaufmich@valino.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217088-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217088

            Bug ID: 217088
           Summary: xone23c mixer
           Product: Drivers
           Version: 2.5
    Kernel Version: <5.4.0.33
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kaufmich@valino.info
        Regression: No

Having a few problems with the Xone32c though not sure if this is an ALSA
issue or general USB stack problem.

It's a USB soundcard that is supposed to have 4 inputs and 4 outputs. It
seems to have 2 USB configurations (bNumConfigurations : 0x2). When plugged
in, bConfigurationValue is 0x1 and only 2 inputs and 2 outputs show up.
Change this value to 0x2 and it shows up (as it should) as 4 inputs and 4
outputs.

I can change the bConfigurationValue with this udev rule, or with a `echo 2

/sys/bus/usb/devices/1-1.4/bConfigurationValue`:

This has all been working OK on Ubuntu 20.04 running kernel
5.4.0-33-generic. However, I just updated to 5.4.0-37-generic and now there
is only a single USB configuration (bNumConfigurations : 0x1) and
bConfigurationValue can't be changed to 0x2:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
