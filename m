Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDEFB658CA3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 13:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiL2MTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 07:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbiL2MTL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 07:19:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E0210FC7
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 04:19:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B3180B819C2
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 12:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6532DC433F0
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672316348;
        bh=g4D16CroCnGhf176qqfpEfqfoRqFNqkL6nwNfdpAogc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N2qpJjLFclrqg8NO48gZmcnwchxwUw8+NJPs6M2zytyH9ZtFYDLqrEemJHJwSrWFa
         yfCqHMeAu86fHcI2eNW3XbLvICh4+Yt8krEy6iZ9iPTH1O43FS9vzSAWhKxrTsSe6a
         ddsBfh+7jT52zMwZqgjaXbRgh31DhQwwbc2KiSs1aNCqeEGdMybRaFSifg880SgdNK
         yBLQpkPY2smArbyz3r72Z1for3b90veznVXD5/D/aO+bmIsAEArUEib617C/qfK2E0
         lQP6bS2ZCMFWKUj1lRg1xYaZSAM9/fx/EvKUcXKlxFO0rhanDwq4PaZTPg1dcj5SZ+
         jNm6rHCXBJCng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 494ABC43143; Thu, 29 Dec 2022 12:19:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216474] Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date:   Thu, 29 Dec 2022 12:19:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216474-208809-KEiwXZfmgO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216474-208809@https.bugzilla.kernel.org/>
References: <bug-216474-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

--- Comment #4 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
I am going to test with `pcie_aspm=3Doff` next week.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
