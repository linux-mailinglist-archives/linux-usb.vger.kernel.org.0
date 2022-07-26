Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D0C580A7D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 06:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiGZEZV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 00:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiGZEZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 00:25:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DD211C1B
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 21:25:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E85CF61147
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 04:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40872C341C0
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 04:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658809515;
        bh=8U2jdIsJ7eUGxIluIMCsE8yw3IUa7X1yuYdyfKxAgog=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IN7PdYsZYtwUm+XXWGC6vrwJRokQ734uKz+Q9F9AITXX9KeH5e8c8wKbNZ+akO17i
         fwh3KyZ4/jC2zLz/xtuLv3t2MGBwepbEP2XmPoCjP+t9gyEYjCVz6lqEHvfaLgvPYh
         WV1xRiiJm+uOHbAPDinZvYR9RH+vzkrnpF3UoB/mKo7oJ/QwK2+l+ksNuhqWnbnOSP
         /6fH59BqX+h+ePBDHfcBd4Fe/FQArQFPJjmRt90yY/ITeafGVdzioKl9VRf0fbGrk+
         uhZVDo69EV8FB1PzloW/QWiOaYgW4gFH21m+W0uhQksumGXftpVMEDG//NCWNh3SfP
         6sXemnpX9SCKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 220C2C05FD2; Tue, 26 Jul 2022 04:25:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 04:25:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-KbE3nsmmBJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #7 from audioprof2001@yahoo.com ---
https://github.com/torvalds/linux/blob/master/drivers/usb/storage/uas-detec=
t.h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
