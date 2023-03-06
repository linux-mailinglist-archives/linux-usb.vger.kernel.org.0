Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2A46AD00F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 22:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjCFVSr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 16:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjCFVSl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 16:18:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FF26EBE
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 13:18:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30D6560A09
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99C30C433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678137519;
        bh=emQ+yztU8P8xdLD6I/cOyZTTlnSL4HOL/m0wkN8tlkU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eDoEhwc1tMr21VnZE8CWBKMlQg/YfWnTY4cQwYWC7KelcQSzzpSuD0pZ6TJXLApnL
         oty0oUCdCgF4YY3Q59vJl/Iandzj7sC7IWjIiJwhOdlrsXS/u7ybWXLrBNFY7v8um2
         DZpErSqUcchEsM5yVjvBhvYLWFKFTIUzys2t5bPc1S2O1hJxDpgx6NgV2PuY+w/YHo
         j1tSGIKjz1VBjUGBB8Ac849EFIuFg2Wu05PUK5lBf4+YbGXlFBYHKwuF19jGC0/MaI
         8PRcslkeN6jwvfmxsKD//Oi7kt/kmBUKPqbYzVIhAHycjMmbjvbHxjKABRh7137DBf
         s2gp0MFLvLt1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 73D15C43142; Mon,  6 Mar 2023 21:18:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 21:18:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-XHuPd2NqsO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #7 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
OK, thanks. checked out v6.1 instead of v6.2 and it's compiling. Will take =
my
laptop through some tough compiling times in the next days I guess ;)

I will report back after I have some result or problems with bisect arise a=
long
the way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
