Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DD96A7059
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 16:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCAPzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 10:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCAPzr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 10:55:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E17D2E0D7
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 07:55:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA841612CE
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3660BC433A4
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677686145;
        bh=0CBr6rDWVS+UybmaaUUmOP5zs3MfAc4y5OyxDcITU+A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=U1gOHO8UXHxqYZ645/vTay+RIat+YBMUs66DNxgkPTIFTybac3qZcFsi+3wWc8m1l
         6JgdFLwh0v29BWPVEWfvG/VNBeJRBPlLVeF8CrfzuVcTWfRa0FzSWMiHiLeBiYEwQY
         e8ffwu+OkuAfUzhi+ChmDYDUtXbEhYC2qpPvL8ayTDZDGpLYcBK8GgfuKDDfR+/faH
         vZ9n3FmETWeAMRy6MtLUFgGfugJVD5yolGFcnoJVxGVmgJMVn+YE8kAwMANVgb2Rd9
         t3CMK9wk7LxQ4lyQsFqWmISQ44t7+s1ens2wW/ZZl62CpHWJ9ncZ+gONuURvuaDX97
         ERpUB6HLMl6KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 209B8C43165; Wed,  1 Mar 2023 15:55:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 15:55:44 +0000
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
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-217089-208809-nlqhKTllYV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

Greg Kroah-Hartman (greg@kroah.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |greg@kroah.com
         Resolution|---                         |IMPLEMENTED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
