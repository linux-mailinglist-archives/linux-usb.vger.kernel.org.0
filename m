Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D770581D46
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 03:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbiG0Bmi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 21:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240151AbiG0Bmh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 21:42:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBFF120A3
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 18:42:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB48B61759
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48094C433B5
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658886156;
        bh=pdhkvvVjf7hWMGfUEC3Uc7g+ghRGPbAMpVykPsN0XnU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PoKugoME7cjPlHhI9ySUtfebig/9gehUTm/6qMMoBHwZENqD4CVW7h7djbmtwJ6hj
         hFDrEh9qSqOmiSvjwa7L1vsITLxfQkNQL3Dy/1ZVDZGP6J66jmEuxgIxF+76qx/lNo
         nn7kt3EMVS8BgxFdp24PzbVrJmg++mmjVVI79+PQvxFtjyqrRbp3Rj/eT1+eHlE1Vv
         3DkWu5N0zx8fbR2RSHJQBfHcmN9AjM6T3CnkAInkmyZG6d3fImdUecrkT1ycUqZij6
         JusOgo0mPCNjgaXoXuHgXcVrcMIMmOHQiOKCYFq0hmvgSkuI2abUQfG3ZbLbtovVF0
         9Qk6Lh9L7lyZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B6C3C433E4; Wed, 27 Jul 2022 01:42:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Wed, 27 Jul 2022 01:42:35 +0000
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
Message-ID: <bug-216282-208809-qTyszMDPF0@https.bugzilla.kernel.org/>
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

--- Comment #13 from audioprof2001@yahoo.com ---
$ sudo mount -t debugfs debugfs /sys/kernel/debug
[sudo] password:=20
mount: /sys/kernel/debug: debugfs already mounted on /sys/kernel/debug.
$ uname -a
Linux P- 5.15.0-41-generic #44-Ubuntu SMP Wed Jun 22 14:20:53 UTC 2022 x86_=
64
x86_64 x86_64 GNU/Linux

$ neofetch
           `.:/ossyyyysso/:.               mac@P-=20
        .:oyyyyyyyyyyyyyyyyyyo:`           ------------=20
      -oyyyyyyyodMMyyyyyyyysyyyyo-         OS: Kubuntu 22.04 LTS x86_64=20
    -syyyyyyyyyydMMyoyyyydmMMyyyyys-       Host: Macmini7,1 1.0=20
   oyyysdMysyyyydMMMMMMMMMMMMMyyyyyyyo     Kernel: 5.15.0-41-generic=20
 `oyyyydMMMMysyysoooooodMMMMyyyyyyyyyo`    Uptime: 9 hours, 47 mins=20
 oyyyyyydMMMMyyyyyyyyyyyysdMMysssssyyyo    Packages: 4488 (dpkg), 28 (snap)=
=20
-yyyyyyyydMysyyyyyyyyyyyyyysdMMMMMysyyy-   Shell: bash 5.1.16=20
oyyyysoodMyyyyyyyyyyyyyyyyyyydMMMMysyyyo   Resolution: 1920x1080=20
yyysdMMMMMyyyyyyyyyyyyyyyyyyysosyyyyyyyy   DE: Plasma 5.24.4=20
yyysdMMMMMyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy   WM: KWin=20
oyyyyysosdyyyyyyyyyyyyyyyyyyydMMMMysyyyo   WM Theme: Sweet-Dark=20
-yyyyyyyydMysyyyyyyyyyyyyyysdMMMMMysyyy-   Theme: Brisa oscuro [Plasma],
Akamayan-darker [GTK2/3]=20
 oyyyyyydMMMysyyyyyyyyyyysdMMyoyyyoyyyo    Icons: breeze-dark [Plasma],
breeze-dark [GTK2/3]=20
 `oyyyydMMMysyyyoooooodMMMMyoyyyyyyyyo     Terminal: konsole=20
   oyyysyyoyyyysdMMMMMMMMMMMyyyyyyyyo      CPU: Intel i5-4308U (4) @ 3.300G=
Hz=20
    -syyyyyyyyydMMMysyyydMMMysyyyys-       GPU: Intel Haswell-ULT=20
      -oyyyyyyydMMyyyyyyysosyyyyo-         Memory: 6206MiB / 7827MiB=20
        ./oyyyyyyyyyyyyyyyyyyo/.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
