Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7EA744FE5
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jul 2023 20:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjGBSuR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Jul 2023 14:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGBSuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Jul 2023 14:50:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44FAC3
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 11:50:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 836D460C7D
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 18:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9A35C43391
        for <linux-usb@vger.kernel.org>; Sun,  2 Jul 2023 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688323814;
        bh=NmG5rXWPHPUohWPcmLhCYCVoFIfAiuSXquug6un4k80=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R/GSBuKV4hdE0lyfwOhwgifDf4RzjlLAC0rnffBzPJs1KuSCxcyHqJbuo0l6l1fc2
         eEuAE7PoEhGGJ5+yHOmoN89e8ZQjvyPiA0LAJGLvz2gEg0AbBWzKcjGi6AcugQJ151
         JDswLv8/+2gEURMyfsLH0agFdTZ+ZLSPxQZNlu4IDT5jUefRk36o1680l4gFWUHpHe
         WJIJ1ngarF3AeKtEyAIy+Qnbt78MyKXyV9qujGRqnDH5iWPXdj96YtmeS2iMQnFFPK
         XGiiYInX2CZdH/nK9pqs4sZpXFiusQRp8s6FcXcTaprQH5SdXm74tzcDMJH7lUem4q
         D4R4frcS5mGLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DCF32C53BD4; Sun,  2 Jul 2023 18:50:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Sun, 02 Jul 2023 18:50:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Liang.Xiao1@dell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-HYS0yAn04d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #33 from Liang.Xiao1@dell.com ---
Hi Dear Sender,
I'm OoO until 7/7 with limited email access, please expect my delay respons=
e.

If you need immediate assistance please reach out to Shen, Yijun
<Yijun_Shen@Dell.com>

Sorry for inconvenience

Thanks
/Liang

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
