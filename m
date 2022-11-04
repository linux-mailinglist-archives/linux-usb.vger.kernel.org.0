Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155F661945F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 11:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiKDKV7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 06:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiKDKV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 06:21:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DE2D118
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 03:21:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A34B162093
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FE2CC433C1
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667557316;
        bh=jtWdTj1dEtRpPk3/spMNlN+zhkyR3U7eYyUFdifdlpc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hJN76HlsWDERiYKBaOnqj3K5HSbiXywcuwxaUh9PFG8CIh/NWtaJrf7xeUJMS/0Gz
         5L5ayaERgKl+lUjx7nbI51ZWaCjxuydVVCsbw/6NE0gNX+/9g9i92qe49zkNE3MKq1
         qQCz3rVZXwop4eSsbSoyg0IXccbRjiOozsAaZK1jWdLqGgX2OoF9uS92/y39tyGZX8
         7eaoEByuzg9cmFZR0VKYX1OfpCIVhNtwtfR6QQvldDANg5kCcFZ8bGmZ5Quuj790lp
         5V+TWOmLC/FbeuvYxTK5vUffQG30eYlQBE0YnE8RH0+H2gixGLghB3f5CD41uStAR4
         bIJEPK1zPBJGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EF084C433E7; Fri,  4 Nov 2022 10:21:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 04 Nov 2022 10:21:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-ujpKpsPgJ8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #28 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Created attachment 303132
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303132&action=3Dedit
This is 5.15.77 with your patch applied

This is linux 5.15.77 with your patch applied.

There are extra log entries before event 'do_add_efi_memmap' at timestamp
[0.000000]

The same three DMAR faults and timeouts still happen between timestamps
[26.938364] and [88.372760] and there is still a Discrete Thunderbold error=
 at
[88.378716]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
