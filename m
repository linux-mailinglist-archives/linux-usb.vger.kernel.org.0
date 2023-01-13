Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3117669ABD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 15:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjAMOmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Jan 2023 09:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjAMOmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Jan 2023 09:42:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FB110B65
        for <linux-usb@vger.kernel.org>; Fri, 13 Jan 2023 06:33:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EAB2BB820C9
        for <linux-usb@vger.kernel.org>; Fri, 13 Jan 2023 14:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BE61C433F1
        for <linux-usb@vger.kernel.org>; Fri, 13 Jan 2023 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673620383;
        bh=6qTYs8Bg0gZ4WlY29OyjFHHFkvukMQLfnWQuy0dj/sU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YL0FYSeA/G2Mun1sP//CXaE66RQPUKbgjLSTz6ZOqMI9UvcpmA/C+lHSPv2ZSq9N6
         S8bbdaBfSmp+t/cM9W2l7oVFowPKgnW4jhc9A6vpBtrldTzbuFucaQsTuiP2kewriH
         fuyo/Pby2PWf3slcrlqb7MVtGqUouZxdFQISCGxbzL2L2+aETR3+Y6bWyphVjsqU+L
         zogGiXnZsmI+sFsr6HmFVu771gvAghhaZ2BNRzq7KUTEBlLakTQT5BeH5ni8i8buVT
         xN8hzcpYlU5xLvY+tO8DwyTQ6sfAQF3eObWrHjj6tshCPF2WTy0XT3paoGqnoc/+Uv
         +rPzJnf1q9v8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 67AEDC43143; Fri, 13 Jan 2023 14:33:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Fri, 13 Jan 2023 14:33:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-aZd0TEX8QB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #22 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 303594
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303594&action=3Dedit
Use pci_dev_wait() to check if the xHCI is reponsive after the link is
activated

Can you try the attached patch? It seems that sometimes it takes longer than
the additional 100ms (up to seconds) for the xHCI to become responsive after
the PCIe link has been trained. This fixes the issue on the Dell Come Lake
based system at least.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
