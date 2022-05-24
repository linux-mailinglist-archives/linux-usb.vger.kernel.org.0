Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDECB532CC3
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 16:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbiEXO6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 10:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbiEXO6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 10:58:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E4E8022A
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 07:58:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CEF90B81979
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 14:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 985B4C34113
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653404325;
        bh=MoO4aZlzsEZjrFqiGaRkIjDiGadUtaVif+EAp2DXMi4=;
        h=From:To:Subject:Date:From;
        b=OR7bJA4QqXXtkvvoHE3BqxQUGLNHR3BObu/357AnqjeKPe7hU2+jiBqu8Wj83Knf/
         n5/EpNa+MJPJLdW7DP0v1a1pGyfnZgw7lNyCcorYRGkkpCWSNZA6GzV2n+JYEKxu7A
         DAl3wrKRayslsjJ7JyArLmFSS3lXVIwH2tF/QF8hWVMkyYaCrqVAn54kjWbomXzcXI
         jq7y0Udv0mwl1dZ/UCVKQ3SNSJhb905uvfOTJ+JbupfZx0lj1dT3N3U3YuN/3BuMnO
         8m7TCgMt7WeDpZYi0XKO8pKdWMHR4DORdX6OdpxymeU2pNIi4qdqQmIyKlZ9sXa9Gd
         0lU4sR8VM7sMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7DBD3C05FD2; Tue, 24 May 2022 14:58:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216020] New: drivers/usb/ folder compilation with allyesconfig
 fails
Date:   Tue, 24 May 2022 14:58:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kushagra765@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216020-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216020

            Bug ID: 216020
           Summary: drivers/usb/ folder compilation with allyesconfig
                    fails
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kushagra765@outlook.com
        Regression: No

When compiling the drivers/usb/ folder with GCC version 12.1.0, the compila=
tion
fails with the following errors:

    drivers/usb/storage/ene_ub6250.c: In function =E2=80=98ms_lib_process_b=
ootblock=E2=80=99:
drivers/usb/storage/ene_ub6250.c:1050:44: error: array subscript =E2=80=98s=
truct
ms_bootblock_idi[0]=E2=80=99 is partly outside array bounds of =E2=80=98uns=
igned char[512]=E2=80=99
[-Werror=3Darray-bounds]
 1050 |                         if (le16_to_cpu(idi->wIDIgeneralConfigurati=
on)
!=3D MS_IDI_GENERAL_CONF)
      |                                            ^~

    drivers/usb/storage/ene_ub6250.c: In function =E2=80=98ms_lib_process_b=
ootblock=E2=80=99:
drivers/usb/storage/ene_ub6250.c:1053:70: error: array subscript =E2=80=98s=
truct
ms_bootblock_idi[0]=E2=80=99 is partly outside array bounds of =E2=80=98uns=
igned char[512]=E2=80=99
[-Werror=3Darray-bounds]
 1053 |                info->MS_Lib.BytesPerSector =3D
le16_to_cpu(idi->wIDIbytesPerSector);
      |                                                             ^~

After these errors, when make waits for unfinished jobs, the following erro=
rs
come:

   In function =E2=80=98xhci_mvebu_mbus_config=E2=80=99,
    inlined from =E2=80=98xhci_mvebu_mbus_init_quirk=E2=80=99 at
drivers/usb/host/xhci-mvebu.c:66:2:
drivers/usb/host/xhci-mvebu.c:37:28: error: array subscript 0 is outside ar=
ray
bounds of =E2=80=98const struct mbus_dram_window[0]=E2=80=99 [-Werror=3Darr=
ay-bounds]
   37 |                 writel(((cs->size - 1) & 0xffff0000) | (cs->mbus_at=
tr
<< 8) |
      |                          ~~^~~~~~
drivers/usb/host/xhci-mvebu.c:37:59: error: array subscript 0 is outside ar=
ray
bounds of =E2=80=98const struct mbus_dram_window[0]=E2=80=99 [-Werror=3Darr=
ay-bounds]
   37 |                 writel(((cs->size - 1) & 0xffff0000) | (cs->mbus_at=
tr
<< 8) |
      |                                                         ~~^~~~~~~~~=
~~
drivers/usb/host/xhci-mvebu.c:41:27: error: array subscript 0 is outside ar=
ray
bounds of =E2=80=98const struct mbus_dram_window[0]=E2=80=99 [-Werror=3Darr=
ay-bounds]
   41 |                 writel((cs->base & 0xffff0000), base +
USB3_WIN_BASE(win));
      |                         ~~^~~~~~
cc1: all warnings being treated as errors

These errors also come when compiling gregkh/usb.git (usb-next branch) with=
 the
GCC version and the configuration mentioned above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
