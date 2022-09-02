Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E9C5AAD21
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 13:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbiIBLLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 07:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235336AbiIBLLN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 07:11:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFD75301C
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 04:10:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9A883B82A63
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 11:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4230AC433C1
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662117028;
        bh=2gS6qdveTBBXLkiyFbgT6SdZ9cA8TtsvVtOrmWXczks=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=d4sSqHbeHFO4+M8gooUofyg14tZoL0kJlL6YbiUBC+d577A3ObAtfG0EAh5JLmIm0
         0aYOxsVv9nc081LNSdXnJQ+AI5IILEz7FRZeIGWmlAW89c3Q491KlDHKyUoli26IJG
         yWoxQFqCNOnYZuBhjDVCoW1cuB6jf8K+AXmZdQBsQeLcHnY0cKopzt4I/52ld5XxsN
         jttAwrx32zR2+dT8qQBqpLNX3P/dBK74xkLjDqYakqrMoEPgGFmT8qlOlqx4SjWuHX
         KlB2LF/h8fHej6HCokB5VeLtYFcN8SWxHJKMX+Hi8TMyFuvwYOMWdC/cU8X/fcneAb
         2rPqITNmW9Xvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21D35C433E6; Fri,  2 Sep 2022 11:10:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 02 Sep 2022 11:10:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-210425-208809-8fY1fz5gBS@https.bugzilla.kernel.org/>
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

Heikki Krogerus (heikki.krogerus@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |heikki.krogerus@linux.intel
                   |                            |.com

--- Comment #23 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Created attachment 301729
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301729&action=3Dedit
UCSI resume

Grzegorz, thanks for letting me know about this issue.

Can someone if this helps?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
