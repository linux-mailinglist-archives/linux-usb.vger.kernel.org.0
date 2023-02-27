Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38696A4D42
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjB0VeQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjB0VeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:34:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EFA27D69
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:34:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1F6DFB80D2B
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F8AC4339C
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677533637;
        bh=eOxBbcYRll09S+qyHgxsgz2UZIlXDQoHsUGs2pf46Hk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s+wMT31GMuqT6cES/VUQfpYfwT2VQL4+NRvcedt1bCY7q/Bzw/RSUXiRr99oGAwxo
         V0JoqckJ02otVHEyQ9/zN8kV5K3Z/gZ6OsTeWuYsD9Djpbzq59iRGYmnJfDGCDWMzw
         0HWVbozkahxwIERZsHFz4/Y9SmxNVoM2gqR9NWwQPp6V27ltmGAtxt5cf5dONl6Sym
         ZwZ0VoXIGWqX6UMR3Xev0UR3O0ws41+18itiRYuFtxNKkkIXeyG1yUgs/fkho/QP78
         aWQNn01rf2yXGIajMTMzpFbPPHEQsqmwnQ81OvL36lpopR2lKSUy+r2i0akZ8Z6Urk
         SlXKBJqU4v8fw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9EABEC43143; Mon, 27 Feb 2023 21:33:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Mon, 27 Feb 2023 21:33:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-9ivEJgWBh5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #9 from Pierre Germain (pierre2008@gmail.com) ---
Good evening Alan Stern,
Thanks for helping us. I have attached the following files to this bug:

1. xone23-c dmesg and lsusb under kernel 5.4.0.33.
This file shows the ouput of dmesg and lsusb when using kernel 5.4.0.33. As=
 of
this kernel everything was working great.

2. UI showing the xone23-c under kernel 5.4.0.33.
This is a png file showing the UI, showing briefly how the audio device is
recognized as a 4x4 channel audio device.=20

3. xone23-c dmesg and lsusb under kernel 5.4.0.37.=20=20
This file shows the ouput of dmesg and lsusb when using kernel 5.4.0.37. Th=
at's
the first kernel I was able to install to see that the audio device is not
recognized as a 4x4 channel audio device. I have not been able to install
kernels between 33 and 37.

4. UI showing the xone23-c under kernel 5.4.0.37.=20
This is a png file showing the UI, showing how the audio device is recogniz=
ed
as a 2x2 channel audio device.

Let me know If I can give you more information. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
