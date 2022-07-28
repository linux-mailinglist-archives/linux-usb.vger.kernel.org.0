Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD76A5837B3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 05:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbiG1Dpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 23:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238171AbiG1Dp1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 23:45:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A0F5F101
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 20:44:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4958D61A01
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 03:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A24FDC433D6
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 03:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658979887;
        bh=g304CYGkvY3ZDysImfm8C+XL7zDA1j/+E+E62x6rF6I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oBUNN80lnC+kvJZvzc+UM9wvtmWgjE5M2JvskXUd4J7q0UH56SO8RO+G4bcf0H7qu
         dpipLENESmR1QsrhQpjC1juGPawSssRLTJ6SIRe4Fcb+zorViYS3xIi3Sw+CDOhBBM
         2VXUSD2I1uzDNqD+9arg5QXI3cBF4xAAw45nI/eNsuCW2O4afEc2nUJmOvXpwNeJvW
         NkRFp2GOUsjh2i25Ec7mUA50qiz7dwSBO8ueEt3Z5j58y6tIQuFOC17XIeRjMlMGag
         CQE7P/9aCt9g8VNJsddJOteTjv7CqHeUVjKKeZgbFnczGfIxKDoHGyua94u2jrj4Tc
         GGrIInbXV9oIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82128C433E4; Thu, 28 Jul 2022 03:44:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Thu, 28 Jul 2022 03:44:47 +0000
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
Message-ID: <bug-216282-208809-X2Uj4N8zGK@https.bugzilla.kernel.org/>
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

--- Comment #17 from audioprof2001@yahoo.com ---
im using another Linux, same usb problem,=20
but in this linux
$ sudo mount -t debugfs debugfs /sys/kernel/debug

is mounted in /syskernel/debug ok

i can see inside /sys/kernel/debug
with sudo

$ sudo modprobe usbmon
works
$ sudo cat /sys/kernel/debug/usb/usbmon/2u >mon.out

creates a directory in /sys/kernel/debug/usb
called /usbmon

but nothing happens all files inside are 0kb.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
