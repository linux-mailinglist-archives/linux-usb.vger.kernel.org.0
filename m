Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90EA064174B
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 15:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiLCOcG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Dec 2022 09:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLCOcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Dec 2022 09:32:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1755A3BE
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 06:32:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 81B12B80188
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 14:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24EF3C433C1
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670077922;
        bh=S73isuG3sOg6NnPG4uQuvUDhiVKsFVX5hGhJgw5qrhU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UHPaGQnA4bX86EhYyaT57SSMQAPbEiiiYzuVBna7pEO83p5Uqhq9LDgvhKjZ+QEfX
         CjzF+oBfaigLPnzVZTXdAQfXa/b5dkqBbiMbOnw/bYMVeQFjywUlqYhxDYDyAVgEmr
         WraKzmjelMljevIXa9rk35eBrUgkjw3EQ/yy65JK6bf5tbO9bWZcoYOcnC3LHZxcR3
         d3gPQ5FguoE74yTYjxnNmTNYZzl3RabTmPGMgfRJitZKi9W05Zri9Bl+bCCWcH76ik
         feQyjBeuieYEzHCb4LIuDoAQ0Afl0k6ERzrFirmdRoK+kjBCOGZgcN1wykdkraIFrb
         oE62Lt7TimvXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0D86CC433E6; Sat,  3 Dec 2022 14:32:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Sat, 03 Dec 2022 14:32:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.burgmeier@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216766-208809-bWeDvGiJZw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #4 from Jan Burgmeier (jan.burgmeier@gmx.de) ---
Thanks for the fast response and analyzing the dmesg output, I will contact=
 the
mailing list directly. I assume the xHCI controller is the one where the
docking station is connected via USB-C.

The used Docking station is:
> Lenovo ThinkPad Universal USB-C Dockingstation

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
