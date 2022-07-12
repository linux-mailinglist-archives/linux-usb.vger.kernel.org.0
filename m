Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBD0572827
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiGLVAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiGLVAc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:00:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243FDB2F7
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 13:56:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78C2DB81BEB
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 20:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28BE0C3411C
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 20:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657659392;
        bh=yHDGnMf4z3fkwg9F0XDHOH/az/IIxii9DnvmncdXCss=;
        h=From:To:Subject:Date:From;
        b=YMHwCJAJX9fbfpnRaAmEWiuFRHlfOxoW+I4dNEoOd0qyuu+dz3AxhmXck+Om38MPW
         mepoj+RSCpBx/gdzE3mbN9foYvYV1wI2X5jh/jcykEcxJpDJ5SroEUHSsn8H6hFRlS
         waG7JwPhy7+zs23YYqreLBov3tRYYatigwm552B4XGbKiQUZdpHsDCn60HcX61ytwP
         W9icHOjtnYoH75qnzz+AcSb7w25BCo0t+J+beBRwy3UXjWCB6z+rzYTFTV+HZAs6Fe
         GEYRs+8d/GDHsTh5viQbvLHlhxIoi3of2ZS55ceziRPS7eakOzdZ57UMBX1IEk4Xuz
         MYkNf0OfJ7GKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0CCB9C05FD2; Tue, 12 Jul 2022 20:56:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216243] New: Shutdown successful but machine does not power off
Date:   Tue, 12 Jul 2022 20:56:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bminaker@uwindsor.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216243-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

               URL: http://bbs.archlinux.org/viewtopic.php?id=3D277872
            Bug ID: 216243
           Summary: Shutdown successful but machine does not power off
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.8, 5.18.9, 5.18.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bminaker@uwindsor.ca
                CC: mathias.nyman@linux.intel.com
        Regression: No

Created attachment 301404
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301404&action=3Dedit
journalctl -b -1 --no-pager > log.txt

Laptop will not power off with kernel 5.18.8 and above.

Kernel 5.18.10 with 9245c6c1f0095d1e9d7862253680cb1e53e65e76 reverted works=
 as
expected.

-----------------

$ git bisect good
9245c6c1f0095d1e9d7862253680cb1e53e65e76 is the first bad commit
commit 9245c6c1f0095d1e9d7862253680cb1e53e65e76
Author: Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Thu Jun 23 14:19:43 2022 +0300

    xhci: turn off port power in shutdown

    commit 83810f84ecf11dfc5a9414a8b762c3501b328185 upstream.

    If ports are not turned off in shutdown then runtime suspended
    self-powered USB devices may survive in U3 link state over S5.

    During subsequent boot, if firmware sends an IPC command to program
    the port in DISCONNECT state, it will time out, causing significant
    delay in the boot time.

    Turning off roothub port power is also recommended in xhci
    specification 4.19.4 "Port Power" in the additional note.

    Cc: stable@vger.kernel.org
    Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Link:
https://lore.kernel.org/r/20220623111945.1557702-3-mathias.nyman@linux.inte=
l.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/usb/host/xhci-hub.c |  2 +-
 drivers/usb/host/xhci.c     | 15 +++++++++++++--
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 16 insertions(+), 3 deletions(-)
$ git bisect log
git bisect start
# bad: [2437f53721bcd154d50224acee23e7dbb8d8c62b] Linux 5.18.8
git bisect bad 2437f53721bcd154d50224acee23e7dbb8d8c62b
# good: [7afbac05cb1c95e286ce97a40ee1c9f1791446c7] Linux 5.18.7
git bisect good 7afbac05cb1c95e286ce97a40ee1c9f1791446c7
# good: [296692f5fe5965ee8e2f3690abe18815ee8c0d48] regmap-irq: Fix offset/i=
ndex
mismatch in read_sub_irq_data()
git bisect good 296692f5fe5965ee8e2f3690abe18815ee8c0d48
# bad: [d0368d4b1e294dd7ed7e1e678e8c95c906dab338] iio: accel: mma8452: igno=
re
the return value of reset operation
git bisect bad d0368d4b1e294dd7ed7e1e678e8c95c906dab338
# good: [27702e63d2baa759e07084cccac60a00818b5848] s390/crash: add missing
iterator advance in copy_oldmem_page()
git bisect good 27702e63d2baa759e07084cccac60a00818b5848
# bad: [d5c672ce67b450889ce7721ebfe7b62905d36a06] btrfs: fix race between
reflinking and ordered extent completion
git bisect bad d5c672ce67b450889ce7721ebfe7b62905d36a06
# bad: [d95ac8b920de1d39525fadc408ce675697626ca6] usb: gadget: uvc: fix list
double add in uvcg_video_pump
git bisect bad d95ac8b920de1d39525fadc408ce675697626ca6
# bad: [9245c6c1f0095d1e9d7862253680cb1e53e65e76] xhci: turn off port power=
 in
shutdown
git bisect bad 9245c6c1f0095d1e9d7862253680cb1e53e65e76
# good: [0e72cea60cb8b6791a194e04cf0abdd57780cd13] s390/crash: make
copy_oldmem_page() return number of bytes copied
git bisect good 0e72cea60cb8b6791a194e04cf0abdd57780cd13
# first bad commit: [9245c6c1f0095d1e9d7862253680cb1e53e65e76] xhci: turn o=
ff
port power in shutdown

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
