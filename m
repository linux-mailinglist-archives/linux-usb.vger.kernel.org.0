Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5828F643094
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 19:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiLESkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 13:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbiLESjk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 13:39:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF69F2127E
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 10:34:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C24D612F0
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 18:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E951DC433D6
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670265274;
        bh=cWqkxXFcE63AXgreejtXOAPCNA1Skg/ArrAXVMw9Soo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SrU9OFfgdCmYOXDraULP9eL3auDS0qNJc30+LYWbLAkeNtpWlczpf0YRBSjrevsV+
         +hGMTjjxjEboY8f3XKbQTfieOAuu74kqD52J3JnQFXbjc3PVVLqI00yglfxeVjCDrn
         9t4m1eUbmhrdYmmgMqGruV8H8TXFRUBFQlfYfp7Mdbi+Yv+hmGLvIvejKin56T4KvJ
         A1Ni6IWsj+koCBZUcfK26BUzKrA66YLrIGAZ/y5InLf6Yoa7D3Tf8/i904pUloJJx3
         7kal6uwGv3AS3dBLoSa5BA1J2ccEtelqMssORaMU0sW/9nzxfm3Rv7ESGCXj7gLscH
         ew3Ypryo+3ceA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D72E4C433E4; Mon,  5 Dec 2022 18:34:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Mon, 05 Dec 2022 18:34:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.burgmeier@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216766-208809-iMMAFcHlbm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #9 from Jan Burgmeier (jan.burgmeier@gmx.de) ---
Hi Matthias,

thanks for your feedback. You are right I have also 2 Monitors connected to=
 the
docking station.

I enabled the logging and tried to reproduce the error. The behavior seems =
to
be a bit different, the error seems to happen a bit less but after resuming
when reconnecting the docking station I need to connect it twice on the fir=
st
connect the monitors are not recognized.

After some tries I was able to reproduce the error, multiple suspend and
resumes where needed, it seems that a longer suspend time increases the cha=
nce
to get the error:
>> https://bugzilla.kernel.org/attachment.cgi?id=3D303361

I had also one try which was even weirder, where the system seemed not to go
into suspend because the backlight stayed on but after ?resume? the error
occurred:
>> https://bugzilla.kernel.org/attachment.cgi?id=3D303360

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
