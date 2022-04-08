Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FABF4F92B6
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 12:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiDHKTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 06:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbiDHKTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 06:19:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9D530F7B
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 03:17:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 16AAEB829FB
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 10:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C819AC385A3
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649413036;
        bh=JG4f4xvjt6xSCZrhgzjLK7AJI46a2xi990gywdjgfIE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i6+ip+LJY49tnYKZfU/W5QyhXRuG1mdT2vAStvVdo+qpx1cliSVup5NtspDTa8Avq
         3S7gJbIun3siqNRqxfRBb073T9i/nD+d6PBMnW0OFwqmEyaMoqWKKIW3Q9Lx0X0wy8
         sVvKCnXiWnyib8VqrvHOxuVMIJkSpeQIcg9uCImQO1+qf4tLxWsdvdXlZt9gwZaOCa
         VhUe4Z38cgeN8KZOKZqMrAt/RbYAKb1SR5qHWFDNReqJKMlH7PWzogErY7w+WfPhEV
         HkD/W1UesUuSVesq9w2rxTy0X9La8wGXnXE0TcFaBXQVny3slWqwiEvIaPPK7WbYjq
         tlSxTEihvUvXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AA22ACAC6E2; Fri,  8 Apr 2022 10:17:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215487] usb driver crash due to usbip events
Date:   Fri, 08 Apr 2022 10:17:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oltmanns@embedded.rwth-aachen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215487-208809-oBRw3y92RH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215487-208809@https.bugzilla.kernel.org/>
References: <bug-215487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215487

--- Comment #1 from Daniel Oltmanns (oltmanns@embedded.rwth-aachen.de) ---
UPDATE: We have upgraded to the new Bullseye 64Bit OS on the raspberry pi. =
We
now received the following error with the following Call trace:

Error: "Unable to handle kernel NULL pointer dereference at virtual address
000000000000004c"

Call Trace:
- stub_rx_loop+0x42c/0xb20 [usbip_host]
- kthread+0x140/0x158
- ret_from_fork+0x10/0x20

The full error message can be seen in the new attachment
'kernel_oops_bullseye'.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
