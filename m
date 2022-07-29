Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860B05856E1
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 00:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiG2Wfv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 18:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiG2Wfu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 18:35:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAE5DF6A
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 15:35:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C30CB82863
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 22:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4502C433D6
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 22:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659134146;
        bh=PA5M921I647W6QPtxrN7WDY23K1Ed5Tpdd0qaniIUmQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BeL2YH6W992VXAG8nT0gCRbZRCXKF3Lmi/ix40v+5iVEs80UH64mSNIV2fhBElKEM
         4HoFPujVcBdL2RQKdxHWHyi0Iy3EUL8ZCVXFytlXsEfAV5K48HgaLt91lCxlYXWLCQ
         jf/VpTPTUnQ5uy/Kvo7IlU/0aDS7rD8E89zlWVpH53xG1m1OhKiKX2UHjhLIBAuZPd
         p39+/oI6QwaTzDjIyemgbujOZFFG6Rlw0eQyFXk04pXC62ao9wP07/Ya6osKd1Shmc
         C2BJJ53PYT0n3yk59mYfX/RlgcSPD0LhgJ+pJDJ2nLsgc9fduCOGMDs248QFLvKmXa
         C+1+9Q14uYMzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BAFB4C433E4; Fri, 29 Jul 2022 22:35:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Fri, 29 Jul 2022 22:35:46 +0000
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
Message-ID: <bug-216282-208809-jIWTvk1cyW@https.bugzilla.kernel.org/>
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

--- Comment #22 from audioprof2001@yahoo.com ---
1 Fail, yes..
...
4 worked 1x time, because did not waited for hdd platter to stop before
turn-on. inertia.
...
10 works but probably more is required for 20TB.
The heavier the platter =3D more time.

Large HDDs "fail" because are sealed with Helium,
has gas leak,
was Not filled enough at factory,
does Not-pass Quality Control.
Temps are higher, does Not lower fast at Idle.
=3D more spin-up time,
sold cheaper without warranty. LOL=E2=84=A2

creating /etc/modprobe.d/usb-storage.conf
adding
delay_use 15

Fails.
Parameter invalid,
but deletes the folder=20
/sys/module/usb_storage

Edit:
$ sudo tea /sys/module/usb_storage/parameters/delay_use
10

Save=20
works but...
each reboot Linux changes back to 1

---------------

$ sudo echo 2 >/sys/module/usb_storage/parameters/delay_use
bash: /sys/module/usb_storage/parameters/delay_use: Permission denied

Fail,
because modprobe usb-storage is loaded

$ sudo modprobe -r usb_storage
[sudo] password:=20
libkmod: ERROR ../libkmod/libkmod-config.c:712 kmod_config_parse:
/etc/modprobe.d/usb-storage.conf line 1: ignoring bad line starting with
'delay_use'
modprobe: FATAL: Module usb_storage is in use.

$ sudo modprobe -r usb_storage
libkmod: ERROR ../libkmod/libkmod-config.c:712 kmod_config_parse:
/etc/modprobe.d/usb-storage.conf line 1: ignoring bad line starting with
'delay'
modprobe: FATAL: Module usb_storage is in use.

$ sudo modprobe -r usb_storage
libkmod: ERROR ../libkmod/libkmod-config.c:712 kmod_config_parse:
/etc/modprobe.d/usb-storage.conf line 1: ignoring bad line starting with '2'
modprobe: FATAL: Module usb_storage is in use.

$ sudo modprobe -r usb_storage
libkmod: ERROR ../libkmod/libkmod-config.c:712 kmod_config_parse:
/etc/modprobe.d/usb-storage.conf line 1: ignoring bad line starting with
'delay'
modprobe: FATAL: Module usb_storage is in use.

$ sudo modprobe -r usb_storage
libkmod: ERROR ../libkmod/libkmod-config.c:712 kmod_config_parse:
/etc/modprobe.d/usb-storage.conf line 1: ignoring bad line starting with
'delay-use'

"Works"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
