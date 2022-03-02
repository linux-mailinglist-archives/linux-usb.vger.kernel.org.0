Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1046D4C9DBA
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 07:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbiCBGZ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 01:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiCBGZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 01:25:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DD956235
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 22:25:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2152361888
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 06:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75969C340EF
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646202315;
        bh=+hcA+EFjZxhnPylNEI+DzhnfZTzCxam5HRUMgv+q4xY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rPF8PcroEPA5z1lq05VsrqRyk3SimqyQjMUYGa6/B0dyGshNqOM1LtQMcXViWamdp
         heCvbx9KBNoq7sDXx4Eih5a1gArwWWp0Sb/LeRyqrz51hXNxdOfORUr/CEISSwOwpj
         zZWv/NRQYYlllzdptLBro1KEsbqqfkkzBdt0ocTio16eddbkbetvBT76Oa1NqKcG1U
         SQb1ampWyA6nQJoViNcryIdSE2KZ4ClbU9IGEN4rivTJ4wYp5wrO4cW9ZYdv/Kj06J
         kBIxZ2lpiLA5dPzx/yUEprvO9XX7S8wKj5YAtXmv4vCjX2WNnhwf0yHivNTxs//LQQ
         CL+hRfsp8g+Uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B49EC05FCE; Wed,  2 Mar 2022 06:25:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Wed, 02 Mar 2022 06:25:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: slark_xiao@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215475-208809-AvVjdfMCRP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

--- Comment #5 from slark_xiao@163.com ---
(In reply to slark_xiao from comment #4)
>   We tried to enable QMAP to speed up from host side. Ping test is okay, =
but
> failed in iperf test under simulator network.=20
  QMAP has been set up successfully, but issue still exist.
  Any other idea from USB side?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
