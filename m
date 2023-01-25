Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86EDE67ACCA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 09:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbjAYIsK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 03:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235373AbjAYIrz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 03:47:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC735619B
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 00:45:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F98C61470
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 08:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F62AC433A1
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674636250;
        bh=VQBojgpRz8WISRa8NGYIXqF0KoWPeeNpg3eyNk7spQs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UPHZVUs+2+0tkqJON5CWgZ93MiFu0lisdsclpNx4cGXkhNz6pV6PBfvZ+oT4LHjrL
         pjVmrejNjL9IU/TiKKBFP7AxtB3/HqCRG/irjYqCS71rcZO5CPRy9tFfq3eaesxh8L
         Pe25VTdm8F/3msHVaNtl1JG1IdWLQ8xsTaA97ZylwXWZ8rMtZqngtmtq2pUH2vXMpF
         5PAvUNR4lgxUjQMe1JV1k7/3gG0LC1H28mgyKetZvQnfwv4wKqmMBfUTz/DnwWVtJN
         i9+r6n6fFOf7mEfzo8gnapR/ODHZUbPFoE9xhgURwLQ2hersvvMqSLKstT+Ps/etjy
         H+SZuyZsu+sTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6DAECC43141; Wed, 25 Jan 2023 08:44:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Wed, 25 Jan 2023 08:44:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216697-208809-u5AHrjz5ug@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #12 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Created attachment 303643
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303643&action=3Dedit
Test fix

I got a bit more information related to this from Fan Chengwei on the linux=
-usb
ml. I now have here a potential fix for the problem. Can anybody test does =
it
work?

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
