Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234A3528128
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 12:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbiEPKCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 06:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiEPKCX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 06:02:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3C638BC
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 03:02:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0443AB80F1A
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 10:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1599C3411E
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652695339;
        bh=DLim5gcnetNzlVC1Ju6PWjn5yftxJYdO7PyrR1eYyTw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZiiKPnWb3LNb5T8U9MoMh9wjSO+zTPrBqyTCz3Mt7Ow9vExA7nwvcDDljh7pEy1zd
         LZaR9PE/H8SarE1UxbEmNV/Z07OIAzaSaJUGkzG6yr5oa6A7XPrvV+iV8vgFcrn4T6
         deQqCcAGMtnQqnLcMBlHPTFXWcoDt+gG2mm6q/28oz38kQprPfWcKLR+Y0yrTQFwGV
         lTdAzXkFkQeabwh+2NddrsxjOnf2i6c57wDO6T+JihPoXCEdaQryvrQ9pny30SyDFM
         1vaRqndDO3FpZJ17+4VARkfjdbrcFAv3hlEqbU6VbwEfF8ZsQlEciZ1Sutzrxs0IVs
         Yc7mggYiMp0Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8ACD6C05FD0; Mon, 16 May 2022 10:02:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 16 May 2022 10:02:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.co@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-ykdeBBMWZG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #13 from Adrien (andrew.co@free.fr) ---
same problem on 5.15.38

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
