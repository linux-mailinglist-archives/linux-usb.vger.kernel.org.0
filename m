Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B285837B7
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 05:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbiG1DuT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 23:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbiG1DuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 23:50:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1CF267F
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 20:50:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7192B8231B
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 03:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EAD6C433D6
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658980212;
        bh=oPh+oAjwW1uEek+nhNX3tiATKP+N+Od3qg+J++Qp39s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JwDGq8Y+McoW0upGy5ZZakjvfZKnJ+Ck8i/4joqE5nGxykd6gWbpLJIy5oT57mWyO
         0WXYpYj18fr2aaPyihNW9pR1vwZvpwY10IfTJQ9rjy125soGSginZloEVHzSflnYkz
         XtbZBMg8UzoP8mOOvQtKwfCY1C/HlbKoJbS2OIrPy5YsV+leZov1cRWBygpcJekxR9
         ZzRF3Q+0FI4Cf/FH7GRqqbCxW3rZ5ZSZxsgkFs2nBtLT+nCy7DesH/pFka6PwMnvq5
         /aHazyF0nRRg87FUGFV3reP1zK7GXAMMPppd0qUl5rWG2wHa2UaVc/uSm4qVKi2mQu
         TDGn2KinPzErw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6EE24C433E4; Thu, 28 Jul 2022 03:50:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Thu, 28 Jul 2022 03:50:12 +0000
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
Message-ID: <bug-216282-208809-2F8iutEZc2@https.bugzilla.kernel.org/>
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

--- Comment #18 from audioprof2001@yahoo.com ---
$ neofetch

                  .+yh                   mac@macmini71=20
                 sMMMo                   ------------------=20
                sMMN+                    OS: pearOS Monterey Beta x86_64=20
                +o:                      Host: Macmini7,1 1.0=20
           ./oyyys+.                     Kernel: 5.14.0-1036-oem=20
         :dMMMMMMMMMm/                   Uptime: 2 hours, 48 mins=20
        :MMMMMMMMMMMMMy                  Resolution: 1920x1080 @ 60.00Hz=20
        yMMMMMMMMMMMMMN                  CPU: Intel i5-4308U (4) @ 3.300GHz
[49.0=C2=B0C]=20
        mMMMMMMMMMMMMs`                  GPU: Intel Haswell-ULT=20
       yMMMMMMMMMMMMo=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
     -mMMMMMMMMMMMMM`                    Packages: 2789 (dpkg), 17 (snap)=20
    oMMMMMMMMMMMMMMM`                    Shell: bash 5.0.17=20
   oMMMMMMMMMMMMMMMMy                    Terminal: konsole=20
  .MMMMMMMMMMMMMMMMMMy`=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
  +MMMMMMMMMMMMMMMMMMMMy/`               Memory: 4290MiB / 7832MiB
[--------=3D=3D=3D=3D=3D=3D=3D]=20
  /MMMMMMMMMMMMMMMMMMMMMMMNds            CPU Usage: 13% [-=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D]=20
  `mMMMMMMMMMMMMMMMMMMMMMMMM/            Disk (/): 58G / 103G (60%)
[---------=3D=3D=3D=3D=3D=3D]=20
   .mMMMMMMMMMMMMMMMMMMMMMM+=20=20
    `oNMMMMMMMMMMMMMMMMMMd-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      `+hMMMMMMMMMMMMMms-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          -/osyhhyso:.=20
                                         Copyright =C2=A9 2021 Alexandru Ba=
lan w/
axtlos

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
