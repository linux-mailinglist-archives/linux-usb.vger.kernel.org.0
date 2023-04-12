Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8536DFF3F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 21:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjDLT4Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 15:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDLT4P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 15:56:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50696213A
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 12:56:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF29E612E1
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 19:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F2A7C433D2
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681329372;
        bh=6G+/Vni19C4ZY+sbDvxIlO90S3t6g0x7oep1xe8pCXo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sDp3jWTFB7dYWSuqwtmfTcRp1cEmUJUOtVRb1eQadaCWN/BGPRSVGQMOZ164iFvub
         1oyJ/UugVc4OiaHnnTo7ZHTWDbrdwnyHODHrEvKQIekVYRtTCVXujNjUVSpbwnEia0
         jXjQU6BHAjLe4G0p+N3Ilfn0hagufaxchZnjr7LOKMb5Svq8Jc/K0waJTBIuYCgjsF
         AXFL0sUz8iv2/l08gVE1o8A3z/8PM6SlHyjjk6HOCNw3UJJP8oxU51CWzINr8gcLA+
         J69WzEbFDIbD1Vd/9XY085nNeaT24PpI3vtVg9/2bxnsEYWAbrs6q/g38mjQ5tX4mW
         J0qCnrIbyoFag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3B3A1C43142; Wed, 12 Apr 2023 19:56:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 12 Apr 2023 19:56:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-BVsaxu2x51@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #15 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304127
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304127&action=3Dedit
trb values

Found what (possibly) looks to be a similar issue at
https://github.com/raspberrypi/linux/is =E2=80=A6 1241972882.

The comment I've linked has a similar scenario (in that the single serial p=
ort
communication occurs frequently - the comment stated the serial communicati=
on
frequency was every 0.2s; the communication I've implemented is every 0.15s=
).
Yesterday I had started the serial communication process and left it overni=
ght
to see the trb values by performing

for d in /sys/kernel/debug/usb/xhci/0000:01:00.0/devices/*/*; do if [ -d "$=
d"
]; then cd $d; echo "${d/?*\/devices\//}: $(wc -l trbs)"; fi done

However, when coming back this morning and attempting the above command, the
computer froze and either the software or hardware watchdog kicked in and
restarted the computer (journalctl logs did not print out before the reboot
occurred, so unfortunately I don't have any information on what happened).

I went ahead and re-performed the test today reducing the sleep time in bet=
ween
serial write calls from 0.15s to 0.05s. With that, the ttyACM ring size did
expand considerably. The values I was able to obtain until a power outage
occurred which stopped my test are attached.

Further information: utilizing Microchip MCP2200 USB to UART converter inst=
ead
of FTDI (though this should not make a difference, pointing it out just in
case).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
