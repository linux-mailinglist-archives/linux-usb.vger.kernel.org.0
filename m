Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B910061F416
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 14:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiKGNQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 08:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbiKGNQR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 08:16:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D91615C
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 05:16:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CBA9CB8108F
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 13:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 869EBC433C1
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667826973;
        bh=ihTlMDnJVkkScWDP7/zYVvrPBBse/CERhinpQSKeqpQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Tl7rNkjjKz+hWuDZ9Rw72t0rTGt/7z083UWw72xXq6ql31RQsaPSbBj9EjZM64RPT
         ZqIleY5NkGepZlPur6B4XK2kDJ0lDqHCS0ivWjVu0+0QngSuRNFyv8ldjIzkQJrxJy
         K/2unhJH3/pcG8CO7Z+UCkfEOM9wrBIAjPWBUm2SoRY+rOYZ+0zJTnaYkjlZqAsfJn
         ojzjecvV6ZBWqA9iWExkiOD1+kWaahakDGdLDEXYF7s4AeVLIiC/vx4i5xralUP5Dl
         wLpXxpGsio7E2hlZU3pge3zvgok6rXNPDFR16BxQIGag80fw2NeH8b0+2DIxWb4aZG
         XyN/hPlfksy4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7718CC433E9; Mon,  7 Nov 2022 13:16:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 13:16:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-xosCxD73CO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #34 from wse@tuxedocomputers.com ---
But I think we should propably open another bugreport for this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
