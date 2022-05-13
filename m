Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8498B525D65
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 10:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378212AbiEMI3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 04:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378210AbiEMI3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 04:29:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5A72A7C36
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 01:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80C9DB82CD2
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D113C34118
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652430555;
        bh=5hFe1QzyIXIoOLqzafBqQ5HRfAteapn3n0hQ6AFHOKg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kYDxbsdMrhnvFgZ1z1/0xOaOsDI3Wdd8inUsvnfi4B2pQ//3Q1Mm9MtZJF2FV0qgV
         XiGvG3MqIYBzoDLEKQF/h9V3iIJQQW0q1eO6Ry5J/wZkp4uO6DD3CZ4SVFZKRF+hsy
         rzi56IRIM4fnOiu7YTmKGIbBVDKHePyiAUUyTab1N8K/ry9QoX7aR7rtRuZX6gktgE
         D7zLvqUOBxb/zPmZxorPU7PDFD5JXL3xZwB2idxhMbEhggFHeMcBqcbluf2wHbGQ2P
         OeSD8wD4vREDQ7M/NmW4yL2RAHiUFAQQMszsmNQIcYPKeKuWUU6seyhXiP+6Fr69Ft
         BkojF41jchzbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0027BCC13B1; Fri, 13 May 2022 08:29:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 13 May 2022 08:29:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kishon@ti.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-T0Q6ke7CjI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #27 from kishon (kishon@ti.com) ---
The patches are already in GregKH tree

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-testing&id=3Da44623d9279086c89f631201d993aa332f7c9e66

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-testing&id=3Db7a4f9b5d0e4b6dd937678c546c0b322dd1a4054

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
