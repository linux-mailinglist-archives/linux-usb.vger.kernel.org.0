Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D6057BAEE
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 17:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiGTPzz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 11:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbiGTPzy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 11:55:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D27DF15
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 08:55:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C807AB82027
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 15:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62753C341CA
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658332549;
        bh=tUr2Y/Ys2euImsZzVzOOLcXmredM+9B/jEuLkzLYGaM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oocK+Mz+8OXNJ7Ijo/SSAGXBpxXn3QjOCxKbQlVVv7N3Bc+8nYlH90hvtjXMoxg3r
         A4YFUDSuCZDNLcTynoFqgoXuJSgtGAwZG5bc4myNU1K4Fy5OU0afEuIGCG935rwe+A
         rQzTByomcBY3Q7jkOCgwG5PnLnF9oLMfIRJ28hMgzhV1MwwZk4fejaazSaD8//V45F
         V3iafCadW9ei3N6fK/MIWQKe7SztPejXOAKOCbIVL47enRwlKBRfQMTazwE4ShGqqD
         MkvpVRVmTomFnHkVmwACAFp9c96jJz9/IUdj/fHc3p8boi+26vYPwQcHEMtuqc7GIh
         8wsB5S+sTZcoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 45226CC13B5; Wed, 20 Jul 2022 15:55:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216243] Shutdown successful but machine does not power off
Date:   Wed, 20 Jul 2022 15:55:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bminaker@uwindsor.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216243-208809-mL7kxRmIiz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216243-208809@https.bugzilla.kernel.org/>
References: <bug-216243-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

--- Comment #2 from bminaker@uwindsor.ca ---
Sure, I will try, but one question first: once dynamic debug is enabled, an=
d I
get the log, how do I disable it? Is it reset at reboot?
________________________________
From: bugzilla-daemon@kernel.org <bugzilla-daemon@kernel.org>
Sent: Wednesday, July 20, 2022 4:24:45 AM
To: Bruce Minaker <bminaker@uwindsor.ca>
Subject: [Bug 216243] Shutdown successful but machine does not power off

https://bugzilla.kernel.org/show_bug.cgi?id=3D216243

joey.corleone@mail.ru changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |joey.corleone@mail.ru

--- Comment #1 from joey.corleone@mail.ru ---
Would you mind sharing a new log with xhci dynamic debug enabled as is
described here [1]?

Enable the debug output first, then try to reproduce the issue, and finally
collect the log file.

[1]
https://lore.kernel.org/linux-usb/9d54d0e4-d2db-3896-301e-9d9048599092@linu=
x.intel.com/T/#m011e17c6eedcf0e8fafbedf60caed1c2e8c7579f

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
