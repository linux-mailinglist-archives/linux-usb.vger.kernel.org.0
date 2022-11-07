Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F4C61FA91
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 17:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbiKGQww (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 11:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbiKGQwf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 11:52:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A1923E94
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 08:52:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B986B61052
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25BB5C433B5
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667839953;
        bh=Hqh9EhxVpgCMo1SXJscx0PQpEYQKwKEM+JEK2UFVrqM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Vt3zmlasXpOElldoTEJy+Wj39hUGyb81SqMIvO++k/YCLDO1neH3PcrmLbvROSnAA
         6gGwTqhpy0UR7Fy2L9KspB1WSRGphqFXQdKuemo3biaQL8PYerYc/CRLwZ3df9Od5s
         a754uVk0VVNMBJTpU3/thAxIn822oVR7p+IbVsZlgm21EsAwTjeyFnCPzy5rRmY1KM
         AXmUZsAmsxHOqZvHkd8iP9IbChDMTu3NPVBTVTxGZHifl3Gent1lhChmXJzudn0lq+
         c07q8WMlPjCx2TRh+JI01Z+9sgSISxl75ye+FNg2frYo5gjwIJk4Sxd3lkoiqx/W0N
         r+ouJWBGfJhKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 138F6C433E7; Mon,  7 Nov 2022 16:52:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 16:52:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-2LiO55nG05@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #39 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Created attachment 303142
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303142&action=3Dedit
lspci -vvv for my Sager NP9672M / Clevo X170KM-G

Thanks Bjorn

Attached is lspci -vvv on the unpatched 5.15.77 Kernel if it helps.

It is large-ish but more may be better than less.

Should I try Linux 6.0.7 or maybe even 6.1.rc3 ?

-- kjh

# uname -a

Linux kjhlt7.kjh.home 5.15.77.kjh #1 SMP PREEMPT Thu Nov 3 10:27:53 CDT 2022
x86_64 11th Gen Intel(R) Core(TM) i9-11900K @ 3.50GHz GenuineIntel GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
