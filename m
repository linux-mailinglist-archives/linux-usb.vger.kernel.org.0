Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DBA6D34C9
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 00:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDAWMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 18:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDAWMC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 18:12:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA80B7AB6
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 15:12:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6498CB80DA2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBE15C4339B
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680387119;
        bh=/jXtl2Y//JdplSHtfIlkMxY2snnIdR+t80xaV6oTI7c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TPD0XzV09vVZGplMaHb3O97CKqFauRRYkvVXLil4WOz33223IS8XKnjLJqn0QhhZq
         35OGYUlSdc99/XkdjUsittJNVdiokOlHljy49fU/WV4uvpPBDHycbCd+Leb6YHer9E
         HjoD3zZ8kVc22pu3Jrt4Z54VVMeqRuJydQDhB28NVj68cTooV8dPXIFOUi/U16qIt3
         EFFIfkHB3E4i+8CxlqWmjWdNLDcy8lrRzCKCp7PjYYI2W7r0F9YYJJBSS5vVn0jwqL
         TLNz+Bb4EJsyofbgjSr/th6uOGyDRCjsj8Y4EoxHECts8ZIT/y9kOhq8g28/r6c9et
         mpdU8dh8YVamQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CB80CC43142; Sat,  1 Apr 2023 22:11:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 22:11:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-9FtjGAOBFk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #4 from Austin Domino (austin.domino@hotmail.com) ---
The setup that created the output in the previous two attached log files is
described in more detail in related posts on:

Ubuntu Forums -> https://ubuntuforums.org/showthread.php =E2=80=A6 st141369=
03
and
Ubuntu's Launchpad Bug Page -> https://bugs.launchpad.net/ubuntu/+sour =E2=
=80=A6
ug/2013390

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
