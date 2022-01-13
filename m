Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A1048DC08
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 17:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236802AbiAMQlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 11:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiAMQlU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 11:41:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647E3C061574
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 08:41:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 220FFB8225C
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECB4CC36AEC
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642092078;
        bh=rVNKZRlPWUoy8Uj7W/iQsIOtAUG6ms/R1hiJh0+GdX0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ij/KJvgq+kDjKUV7V0k+tcjhK6ejZss6alGT3ch5UDiBOCcsCdz9EWcMG6l4QAFg2
         Iva9PJIlT1Vjewa5ANLooS7qi36wIBJittJ2arC3Djy9SMixsMS9jEXPXcXKGuXn60
         I3OVbWl+9mYr9aiqqnMDu+WVcezqWmib8OrZ+7W7sAirI5kovfLb9OcQucnt88F9PG
         GiWsbUM0ABbuFga7fKcWy9tKEzijxomz0vk19VOKep0ISkGK/ro3437k/pX1G4If2q
         vG58u+UT6tyw/be6QFzK2W9rRg3jOzJqTjx/VGXwuluKFynOwpEcok3KPXXLbWMLPj
         2CbTNPRKHGXEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DD0F3CC13AD; Thu, 13 Jan 2022 16:41:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215490] Logitech Brio doesn't initialise on USB 3.0 port of
 Asus M5A97 Evo R2.0
Date:   Thu, 13 Jan 2022 16:41:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nouveau@spliet.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215490-208809-vPOhbMUcbP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215490-208809@https.bugzilla.kernel.org/>
References: <bug-215490-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215490

--- Comment #2 from Roy (nouveau@spliet.org) ---
Probably worth noting that USB 3.0 superspeed is provided by
03:00.0 USB controller: ASMedia Technology Inc. ASM1042 SuperSpeed USB Host
Controller

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
