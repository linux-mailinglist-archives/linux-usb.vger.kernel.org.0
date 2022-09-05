Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACE95AD4E6
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 16:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbiIEOeB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 10:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238237AbiIEOd7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 10:33:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD0A5A883
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 07:33:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A80F61040
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 14:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D621C43144
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662388437;
        bh=sgmNqRF4Ywn4lOepNqrJpcU3vDq1j4fM2h2cI6vxLks=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FPkMBnGdiQCzlt9soI8QOQTZTt7cHiGUm0h+6sdKOxq6852RuIFnQcpgjc6YyvU07
         I/yFuuzOnelzublDIG1ouDWnyEhvY1AYfo12Ruhj3opefP6aua1fcFoco0Eu+lFm0f
         m2DqFZWsh/24X1mYXJuq47TEANJ3oj946Ukjl+biALK997kvtTcZYQ2eLm9dwReGUn
         h5UnC3wdoWebs+Nh+xY612Ttmq/zKRiLWOnw8G79E1aQEa4PundmPLRhjQ8aWIunOf
         jFhG+WmmzLIPOAquOjiyVGRe7d05+23M1IZE3G06upY32ZBmMJ1JLlD1gWv24uTVOV
         6eTwz6g3vnk6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6A2BFC32747; Mon,  5 Sep 2022 14:33:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 05 Sep 2022 14:33:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-GR6K493O6R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #29 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
Will you post the change request to the Linux kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
