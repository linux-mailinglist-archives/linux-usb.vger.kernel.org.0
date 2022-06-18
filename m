Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24693550622
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 18:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbiFRQlb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jun 2022 12:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbiFRQlb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jun 2022 12:41:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B032FD0F
        for <linux-usb@vger.kernel.org>; Sat, 18 Jun 2022 09:41:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDFD660F22
        for <linux-usb@vger.kernel.org>; Sat, 18 Jun 2022 16:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37ED3C341C7
        for <linux-usb@vger.kernel.org>; Sat, 18 Jun 2022 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655570489;
        bh=VESMTaxT8OursHJLO+KXlYjILY23wxuhOTIvi4RP0DE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Swj7Hu2UY/MVxHMWlCfHNlWPL1xwb53+LsTrnpGPVy4GB0ZidcxVn4GCA3bEPYLFO
         0KrNA7hFgbZbeuM1/XGXykzh8zozwSe0kcNziRHeOwvkym8avVAvtTdhkUnumOq0VC
         2S44DODl51sna4HW6bd2ovwPfQzUIntI36OMz4CS262nsqDoIeA5nO2IYraIZbdXZ0
         1+rVWQKfIOMZ/Lch/7v0GWBQlRoHzf4iEalLHmebvncrEDXmnrxGCBA38znyP+KGjd
         H11B4FrD9uxC84dg+HCRFIdTh3zXwxQ7ajO/LA95r/u0sVBI3Wn55lx7vpJZ9ALEYb
         4Nyeh72mEKN4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 261F9CC13AD; Sat, 18 Jun 2022 16:41:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 18 Jun 2022 16:41:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchernik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-TOz5Jq9I1r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Pavel Chernikov (pchernik@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pchernik@gmail.com

--- Comment #18 from Pavel Chernikov (pchernik@gmail.com) ---
Confirming still happens on Fedora 36, 5.18.5-200.fc36.x86_64
ThinkPad T13 Gen 3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
