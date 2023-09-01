Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41A378FDC4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242633AbjIAMxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbjIAMxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:53:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FC1E7E
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:53:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3158160DFF
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91648C433C8
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572782;
        bh=2JyBvpaxih7lc6k7SDG0BWeos1paf1JVjup85IlPkOY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sY4tVWJuPqzxuKxBmcmmXNYwaACqvuQvORAYIsIsBQvU7C+5DTwI+N0ri7cwbj/PN
         22/hK0podHV9xYKpSBs384f2vB+xq/6yQvQrBfVuvP0eXLNwjYGtJhS/nd7cWj+e8U
         ryZkqKZIepQZYZCSMy47maSJ1c9sev9LrR0HkIGIhQ4Tk5SCnMc4A4fHLmX6lPWD5V
         3Pwyc87OHsozvlfYp5BLby01jhbQVai0vIqvQifYW759qmA10PBAVBo/ehEgWjsm4Q
         vk1CuJKSi544XCOvVpcTftdzmsJ8bO+FtePRMs5CFbZzCb5cIh9cW96sYv10dECuxo
         6NIKvtabJ3ueA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7373FC4332E; Fri,  1 Sep 2023 12:53:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:53:02 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217670-208809-avc9jtoqWz@https.bugzilla.kernel.org/>
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

--- Comment #14 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305003
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305003&action=3Dedit
0001-usb-dwc3-reference-clock-period-configuration.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
