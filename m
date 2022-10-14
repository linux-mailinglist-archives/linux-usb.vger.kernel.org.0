Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7155FF6E8
	for <lists+linux-usb@lfdr.de>; Sat, 15 Oct 2022 01:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJNXgz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 19:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJNXgy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 19:36:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A43B2FFEF
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 16:36:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1ECDDB82374
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 23:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC89AC433C1
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665790610;
        bh=5qCORrgSLOjXbEhDclcthcRg5w+x3Weg/U8J8TjB6K0=;
        h=From:To:Subject:Date:From;
        b=Iqw6G7z6inQvX9QaSJKixU8HOPnijd7JiiSu0xuqc39hgLhnFjzy3406Uwjw7K3+x
         UtnrhLLTez6qpwREeX6qwnDo8NrmYhPGScJRvYW/GlT8gTH4HrqLjh4hLhlk3LPWWD
         ngUHecSDd5ZshZ84DHBrt+WgilxMoBducCIBwSSwyD0Onk6dkHlNZGZZNZewSJ/p4Z
         niPzkZL0iM+mM6dkt2XV3UZ+CMnRKRMs7Hoijo+n5QWWpdsGVAirWyD1DU4bi2jJ4g
         MolGEA6NM00BlixJQ1JOdzD8xTHs2K9FIxigSe0wnz2Gt/BjqEGTT2UkgS7U25JSXK
         7VCFSz9m7wRKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B049CC433E4; Fri, 14 Oct 2022 23:36:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] New: RTL9210(B) falsely detected as rotational disk
Date:   Fri, 14 Oct 2022 23:36:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supgesu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216588-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

            Bug ID: 216588
           Summary: RTL9210(B) falsely detected as rotational disk
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: supgesu@gmail.com
        Regression: No

Hi, using an Realtek RTL9210B in an NVME M.2 to USB enclosure, the kernel d=
oes
not detect that it is a non rotational disk.

`/sys/block/sdX/queue/rotational` is set to `1`, which is false, since this=
 is
no and can never be an HDD (adapter is for SSDs only).

On another adapter with JMS583 chipset it already works and correctly detec=
ts
queue/rotational -> 0.
Only on the Realtek one it is wrong.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
