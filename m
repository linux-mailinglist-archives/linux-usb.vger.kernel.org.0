Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A2B53E5EE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241295AbiFFPwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241291AbiFFPwu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:52:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF1E33E01
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:52:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EAF34B81A90
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E957C385A9
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654530767;
        bh=GLpQ3tpPghRGXmu8nYC+/8HR7HOl+AFs9AXft1CwXB8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HskJ7siBrqR29jtqrMCvtr9/24qTZBrst3vvSA9d4ZptMTlkc9/N33qJ/90C21qGb
         Go+eOk7FS/m3cZ/BXHW+NnzJTZ2FRibJMhHL8if/PFbngfLJPo81O0BhA8YbEUxvvo
         s5/rpLS68BbbLo+MUAwXpQ7QQ2/9nhIBvqpM3GyYXpuJKtufYvEdhcewWNxUC/TTsn
         Fu4VMCzCHTsQEphXOJ/qc8ABKJhg3+y0yLVFDrLSfTnXGvdvK0p1peqPJpsZk5X8Vm
         WqNz7OVsb46MEruFUatMLYXWC0hPsvP3AIa7itGut6U3psgsQZqLrPXbA6WQ4DtcLY
         5uJh850UWswAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 83F12C05FD4; Mon,  6 Jun 2022 15:52:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216085] MCS9990 not maximum speed USB 2.0
Date:   Mon, 06 Jun 2022 15:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: khseal@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216085-208809-Xlxt2LBGs9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216085-208809@https.bugzilla.kernel.org/>
References: <bug-216085-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216085

--- Comment #4 from Sergey (khseal@yandex.ru) ---
Normal speed only in Windows OS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
