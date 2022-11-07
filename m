Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8825A61FBC3
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiKGRpt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbiKGRp2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:45:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC3023BDE
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 09:45:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B53D7B81608
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70DD8C433D7
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667843124;
        bh=ZjgQfxLPEe/O6ZK6HpBs518p0xu7rDnHVSFJZ372898=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iS3sUvTrx3vSJOZNcFdKCCPfENQcvS7YXgRtN1qHvNO2lKZxtMxNahGCuhn8lCl+X
         UoC5RDKVr59YhbVvSP+sAamTUxjTwQf/oLCxF6Qg9Q1HSITFut3/HoDCly5Hs/WkZ4
         w3+OvATLKqKKEnktSqkjFbNlPvIcwlyXN6cbSPzbh5eMH/SkgvXleHSo8op3ogfjMz
         J32O/jQaxhTamh6E35muj9MgeuEOxvdVO5FZ8Q1PetyFDJ4gha1qvXnwOImtMcICB6
         vyNR1NcR3b06eZKv1rSzN8X7bBGIXCIsurAgWiHtBeODEdkT1CwkFTSJflppA5uK0+
         iYBNFwo1zvB7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 54940C433E6; Mon,  7 Nov 2022 17:45:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 17:45:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-YVJMyBcC7d@https.bugzilla.kernel.org/>
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

--- Comment #43 from wse@tuxedocomputers.com ---
Created attachment 303145
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303145&action=3Dedit
connecting a dock after boot, worked just fine

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
