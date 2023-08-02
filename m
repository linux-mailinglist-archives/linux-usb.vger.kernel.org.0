Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9DE76C47C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 07:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjHBFCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 01:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjHBFCr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 01:02:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A21F1BE7
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 22:02:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27A54617D8
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 05:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 846C8C433CB
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 05:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690952563;
        bh=fSASMVpCMM0qPBKXhYTB0XXDczFkXa6c7FegAByExXs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pVQ6TPxYz72Iyu7l157Cb/ZLWxpvYofACzlS0CKioX/GhkCMms7IA3Gh9fGEqqNTp
         U+XW00PlQS4GTgALhByHBg9B4T4fE30hyszucgmte1bNoDhfR+FWUzVxbzuXZBJ1HI
         M8GWrIMC68S/KwWDEgDncu7o3ZRMHGLs7by7uQhd0rqrb6HysFYtspOPAaEtVtlXW1
         QsxT9VFGjsVVuM+3hIfqjBTcqLJS3ut6+9tKDkvB13PCWN05sYiKZpIbs2Qvhl039p
         om9l2eqxo/cXLzCvlIjQ0JNwHI98Pd/w6GUV55/beIgDDPbWl8Y7wHqhS865WUb0yA
         ZeOO+YorvHbRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6EA52C53BD0; Wed,  2 Aug 2023 05:02:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] Resume: "usb usb2-port3: Cannot enable. Maybe the USB
 cable is bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Wed, 02 Aug 2023 05:02:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.schaubschlaeger@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217744-208809-Wd2oVhsPxV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217744-208809@https.bugzilla.kernel.org/>
References: <bug-217744-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

Christian Schaubschl=C3=A4ger (christian.schaubschlaeger@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian.schaubschlaeger@g
                   |                            |mx.at

--- Comment #6 from Christian Schaubschl=C3=A4ger (christian.schaubschlaege=
r@gmx.at) ---
Hi,

this sounds a bit like this:=20

https://www.spinics.net/lists/linux-usb/msg242040.html

I have a very similar issue with this Lenovo dock (and on Dell WD docks, to=
o),
although on Dell Laptops. But I do remember that I had this on a Lenovo lap=
top,
too.

However, I observed this not after suspend (never tried), but after a reboo=
t:
when I go into the UFEI firmware menu, I cannot access the external network
interface on the dock (for doing a PXE boot over the net). Can you verify t=
hat
in your case this is the same? (I.e. after power off the net interface is
available in the UEFI firmware, but after a reboot it is not).

Regards,
Christian

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
