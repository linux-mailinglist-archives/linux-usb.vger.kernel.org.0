Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E00581D48
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 03:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240187AbiG0Bns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 21:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240151AbiG0Bnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 21:43:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C0D120A3
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 18:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA5DD6175E
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE15C433D6
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658886225;
        bh=Zbo7cxCtbDG6bz6GdinaM7rq/EjihoHV0nwsvKFAEYI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cA9v/Fdo7PMkiFAQn0qmU6w4CL8vxB/FIk9y8XiO03s5GZAlOyOrRr0oNWn+gP2mp
         oTCASPsHLnK2/G7ST8MzHdxoL8KlGJiSEUhoNhzWIKeuoQQo7RaM8ikcCx56oLTi/U
         TT8rcqB5NCGIdgO+3YdoMtkA49i3QVm35o88FjxKTpTq0AwtP8m9HqGQgjPKB1NgzR
         xIi6cU9oLC6F9o/sHcE2EZuGecqKDROSfpgSyR4i1az8aG7HL43tCknA7O/GyUOfiK
         cBsOkOS2DcXFIBX5Nn8I7dHqU3xY23wuZkskTens1R1HDQh2JZYhkVF80arfaPJ+hr
         AszfcOAaj58Ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1AA4DC433E4; Wed, 27 Jul 2022 01:43:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Wed, 27 Jul 2022 01:43:44 +0000
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
Message-ID: <bug-216282-208809-vKQE1wmF2C@https.bugzilla.kernel.org/>
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

--- Comment #14 from audioprof2001@yahoo.com ---
$ cat /sys/kernel/debug/usb/usbmon/2u >mon.out
cat: /sys/kernel/debug/usb/usbmon/2u: Permission denied

$ sudo cat /sys/kernel/debug/usb/usbmon/2u >mon.out
cat: /sys/kernel/debug/usb/usbmon/2u: No such file or directory

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
