Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54222700D5F
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 18:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237444AbjELQvm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 12:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjELQvl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 12:51:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283069EC1
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 09:51:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF5A763DA2
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 166DAC433D2
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683910300;
        bh=uNdX7CyiNbQkCFuYbW0MQbigCdHmbEi77ywC8/nov/k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uyLBzt0HviLWFNmR6XM/eMw8CqrWlDgxq0fdrGPakQC8VUVDMGtgXzsyYDjlYOoOG
         Saf1gtvH1MMShPpYYPZ/bRmswbr5F7PJh33+do4KURc7TWqt94SUV16woNxii4MBK8
         M3qsoYiPdGwqpcS+MocToShUf7JwXIzwQCvXb3PtBPpiX5CMwYP2y9R9ilRLcOzuNQ
         lkiGha1PID8GB0I902WM5RwaNTA8AHLdEtgX2FahQ+/QBFggzWIsaBaMEzOUt78bXV
         afAVO5eyMFelFXg/ID5UT83Isp0dr8nl2YVPMOMEFkGHHskyzViRBmkbIaHPJkxk/d
         6psDnTw7rw8mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EC70EC43142; Fri, 12 May 2023 16:51:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Fri, 12 May 2023 16:51:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-vLWZCFxQse@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #26 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
Cool, thanks for your help! This was definitely the longest debugging sessi=
on I
ever did :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
