Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146C6522D8D
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 09:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240221AbiEKHop (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 03:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiEKHol (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 03:44:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D737D6B015
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 00:44:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A257615FD
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 07:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4053C340EB
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652255079;
        bh=MQQE8uMMze9zoPVAds6FMvkkFi0DAVtyQmwrCTbFRzY=;
        h=From:To:Subject:Date:From;
        b=ZueHJrzZije0oUi6Z2OVN0NtFL1xXEeeIV9F6GL0W2JR7DKHCwONhZp+RWlc6jyOv
         eEM9yAzjbQAfTBQUGUTHBa3qf5r45TN+2bT/jbTzDRVMXk7YoAcX+bG+ZeCXO3NKBl
         qgxSzcXLLS39gd2/qrZuxtoqdUe2FxaFnukn2fv9/8NFbXcMvkmUh/X1dz1f2cEZ6v
         kc1N7O9R4L4jqbz6Iw69ijLaJHOEOsAEoxDZoQXm/TMH6Rd23q8pyNfuIbXWhRG/3r
         vYfyVynGtfXhdIQYy6cZm/lRP9M8jaEpWkm5YbExOLUoZlfdqzDrJZH084zi0teayR
         1CX6vGGkSzeig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C3F9FC05FD0; Wed, 11 May 2022 07:44:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215967] New: Kernel build fails if CONFIG_REGULATOR is unset
Date:   Wed, 11 May 2022 07:44:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trallala@onlinehome.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215967-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 215967
           Summary: Kernel build fails if CONFIG_REGULATOR is unset
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.114
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: trallala@onlinehome.de
        Regression: No

Compilation of "drivers/usb/phy/phy-generic.c" fails reproducible if
CONFIG_REGULATOR is unset, because function "devm_regulator_get_exclusive" =
is
undeclared but nevertheless used.
The offending patch propably is commit 03e607cbb2931374db1825f371e9c7f28526=
d3f4
upstream

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
