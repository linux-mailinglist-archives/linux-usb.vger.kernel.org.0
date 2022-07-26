Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E675816B0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 17:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238972AbiGZPpG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 11:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiGZPpF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 11:45:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59ED92CDDD
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 08:45:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D23AE60D17
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 15:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CEF6C433D6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658850303;
        bh=jAye9Jw8WoChlZgacezjKoA5wB+Pn10N33tmo9u86qs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ffZ8p/zwHGYwktNaFb3oQJtdcsaCGVa1HmDwT9QL1jX1BN6BL5Owznii/xjZ8MPAk
         mnkYkWZ+fuRi1UxV+bcurJm4h3O9niQJRb3eUD53+KquHs0SYTxwlZPNELGS/8hygT
         vMuojxuLAodUVLvaYb+N/u6aVh/Ni8R5QrMe26Cq3ihH0UPmeRxMOjnf6Y/nT1D5rZ
         wPT9vLYWYGBvTBmCaxUoBZVvJCFDS8wOXT0bqHaCtvaL3VKaT7EBc+j0BUtBwPZO7u
         bX8/tqPPs4Xjdrvtp51h5ZyiaaZJDADi00u1ZJTUSQyIMbRfDv+WghCpqp6CMdbdIc
         R3ECyNr4XmS7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1E8E8C433E4; Tue, 26 Jul 2022 15:45:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 15:45:02 +0000
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
Message-ID: <bug-216282-208809-m9GMuWHWqE@https.bugzilla.kernel.org/>
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

--- Comment #9 from audioprof2001@yahoo.com ---
$ sudo cat /sys/kernel/debug/usb/usbmon/2u >mon.out
[sudo] password:=20
cat: /sys/kernel/debug/usb/usbmon/2u: No such file or directory

$ su
Password:=20
root@macmini:/home/user# cat /sys/kernel/debug/usb/usbmon/2u >mon.out
cat: /sys/kernel/debug/usb/usbmon/2u: No such file or directory

root@macmini:/home/user# whoami
root

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
