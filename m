Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039D978FDCC
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343588AbjIAMzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245221AbjIAMzD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:55:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C505AE0
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:54:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5788B60DFF
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF0E5C433C8
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572894;
        bh=qgbPPn1IAPszlXPzfoCh5EfiPwrPoRW+FgbKH4aWxY4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AAwvC/0+yTLQj+TanHBE93HfDJ7L7LvZNdSbrKzyHND3KfgImEjfAiL/HmiIMnfd2
         /wSngZZTPoe+NoWFASqSoCK3nqqBD+2thf6ViUCw1jCiulSmWjlODj9itNx8buvHq/
         yCm+zl5qr35Hq70Ya/ERgl0zvZ5VP4HUL1m8B5gxxH3gxghbFa22svatISwIPW0jVf
         y6FTsWcYsBQeNxi9egWiZo3lPVsnJm87boirU/eBR6xiHEfc6W28xzIbIgflks5INS
         lDC1F/cuDQGpxRR2MQtLKX9hegukQfQBPbZnGu8XHXvNXpFb7G18bVFAxhsG1/6Nu4
         ARgI/J13Jl7hQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AF427C4332E; Fri,  1 Sep 2023 12:54:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:54:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-217670-208809-ROrT8PZFHQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305003|0                           |1
        is obsolete|                            |

--- Comment #19 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305008
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305008&action=3Dedit
0001-usb-dwc3-reference-clock-period-configuration.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
