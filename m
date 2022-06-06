Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1DF53E98B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240432AbiFFPUc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240404AbiFFPUY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:20:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FFB140414
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E098B81A6B
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27484C385A9
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654528821;
        bh=/qid1MlraxMDDHK5lq0ZicNRsc43zsz5khwhpQ4Ohyk=;
        h=From:To:Subject:Date:From;
        b=W6kBt8WFzcZwh+ZAUjHW93DeXK1ye+BAQi5Ygo/lAZxzRA/B0cPHgRhUanbGA5ZzY
         5d34l4BZREQXtdbht6OOs5luI9cmswSyZoPQJQ+VFCrzCzwx41DAmceT7EcXwdmjEK
         +e72eZPASOLoZ2LDg4Ary7z9t/qPOXo99qF77k8KUuX7Fx2GhQnBkFs/zE6TS9cyCp
         1Zisfh5jpr6c63n9SzSeNnTQNkS8atrAo9FoOaPGa/+psC5Z71PJCHd5uZ3jLMp3aw
         MTD9a0qKnWLV/3JlqGWxGKDA6CwpkIGCc+Ly/SfxIyn6pq7TtBxpfeM9461vbT4lcf
         Cohyr39+g7OpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0BD0CC05FD5; Mon,  6 Jun 2022 15:20:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216085] New: MCS9990 not maximum speed USB 2.0
Date:   Mon, 06 Jun 2022 15:20:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: khseal@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216085-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216085

            Bug ID: 216085
           Summary: MCS9990 not maximum speed USB 2.0
           Product: Drivers
           Version: 2.5
    Kernel Version: All
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: khseal@yandex.ru
        Regression: No

Created attachment 301107
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301107&action=3Dedit
Ubuntu low speed.

There is a speed limit. Tried different kernel versions.
I think the problem is somewhere in the drivers.
In other operating systems, the controller works without problems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
