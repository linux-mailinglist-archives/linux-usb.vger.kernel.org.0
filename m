Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF26AA619
	for <lists+linux-usb@lfdr.de>; Sat,  4 Mar 2023 01:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCDALC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 19:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCDALB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 19:11:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABB3166CF
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 16:10:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F08761941
        for <linux-usb@vger.kernel.org>; Sat,  4 Mar 2023 00:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82D0CC43443
        for <linux-usb@vger.kernel.org>; Sat,  4 Mar 2023 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677888657;
        bh=9izbP7XBtUOgjU2r1WDBKegqGg+vyXksEYyubNFq5zQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=riUZwsXD3r6paA72eE4H5IZfzypdSaOcNVjj5tjnXKLuu8pyDSEW5yvxUm5j7RJsq
         pm4QBjIIUMuit1j1vI0J/VkT10jMD0u6GyvFpvmqU9DrTILK4dq9M5riWL7K4wjR+W
         Ucd0Q0pqZKlkjLjTWZOtsRPkbRYtXH2keAFZ4lHbe6C07tpvowHnWJClIeCo1m8Xir
         lIiTxSK+0skGwIAxVuf2cN4yctresdacjB0JZXzP53/kHHWVMD25XNcPhuYvvhf2xr
         ln1NltBuS6xAtTrGGXSk1DEZaVWeLph+DQZL8bR+5g/5bnRe7kC4jTtGJKxrJJDxLK
         W/JP6Z+ndACdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 73475C43145; Sat,  4 Mar 2023 00:10:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 04 Mar 2023 00:10:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wyattbiker@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-IRI0LtlAPR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #48 from wyattb (wyattbiker@gmail.com) ---

Exact same issue. Not sure how to reproduce it. Just want to add my versions

Operating System: Kubuntu 22.10
KDE Plasma Version: 5.25.5
KDE Frameworks Version: 5.98.0
Qt Version: 5.15.6
Kernel Version: 5.19.0-35-generic (64-bit)

Graphics Platform: X11
Processors: 16 =C3=97 12th Gen Intel=C2=AE Core=E2=84=A2 i7-1260P
Memory: 15.3 GiB of RAM
Graphics Processor: Mesa Intel=C2=AE Graphics
Manufacturer: LG Electronics
Product Name: 14ZB90Q-G.AAC6U1
System Version: 0.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
