Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5582680857
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjA3JRu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236170AbjA3JRt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:17:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8672B608
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:17:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2414660F00
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 09:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D8BEC433A1
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675070267;
        bh=1JL3QvZ/udNtb13qbkDSMRKslhMOFt8IOkJvlwODuCA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aKGED8fsQvk6zFtJSluD+wnhv5b4ZIBPB0UmFvEmkL2JyyyP5NqCgFGFxmG53YNFF
         aEau4wXPQ4wJMs3byNCYlzA465NyHqQ/Q30Q1AWyH7D2pxH7u7rex807ZoPTd0sz13
         zNblzoLmNmdh2bX9kaSmk8VJug6aZOXclqvnXhO5qT7RDlR/Ut5TrrlLTHzgfq/Q/5
         ufm5EUJeCSWQKnjDvPxfYLhIjlDJmE//KDvz44eA/QiqsO2YW09P76RvjxJrm6Lxh3
         07Wu15o6VIhn/z56fuoUIFpes3BNWpPfbBUE1xSREUhog/svvyN51rpV3Ky/hvplZ4
         i6jYEfvgsQFog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 65FBAC43144; Mon, 30 Jan 2023 09:17:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Mon, 30 Jan 2023 09:17:46 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-08MZsowjC9@https.bugzilla.kernel.org/>
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

--- Comment #14 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to Oliver Reeh from comment #13)
> Is this fix suitable for kernel 6.1.x?
> If yes then I'm willing to test it.

Great, thanks! The patch should apply just fine on top of 6.1.x.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
