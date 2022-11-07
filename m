Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA0261FBCE
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiKGRsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiKGRr2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:47:28 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C2017A97
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 09:47:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B47C0CE1780
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EFE3C43143
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667843245;
        bh=KsI4bQZNOglYtnHIC9k8cIoQea60uWYQTe6BfIPzKwU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dtG+LcwAOS1n6QNQDQflk/5EbW54ATeaNgGjtP1M+xx4pJTtWqMB1VpUu6o2Nw+Gl
         rsCEOeOdIYI2lVavIzTdXOVeqlen3Pc6RA2HJAInr2TCJUqyvuHPYZuu78iU5s6X3R
         BecB/F6ST3ANEY2Sp52/ujc2WODRFJFQv6+VCInayxhuz7OpgMWpMMDCnElrPcDSnO
         oy+7/1Z9tB1LyDdZ2f6qWBQvvq6q7EzrFtrAVD1efpmTJNm2tNPifkfDzmuZ33/igX
         sJP7hKHJ5iYtzjqKFI3yOYy1glWys/PE3YBKNfgrQsQ36MsVr+5Lu8zLBMyAkeAHuH
         mWlfwyiDtJJIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0FC4CC433E4; Mon,  7 Nov 2022 17:47:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 17:47:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_pci@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-214259-208809-h9u68uwaQs@https.bugzilla.kernel.org/>
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

Bjorn Helgaas (bjorn@helgaas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |PCI
           Assignee|drivers_usb@kernel-bugs.ker |drivers_pci@kernel-bugs.osd
                   |nel.org                     |l.org

--- Comment #44 from Bjorn Helgaas (bjorn@helgaas.com) ---
Reassigning to PCI because I don't think this is a USB issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
