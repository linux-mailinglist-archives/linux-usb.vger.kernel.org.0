Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5D96F6A8F
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 13:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjEDL6b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 07:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjEDL6a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 07:58:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBD41994
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 04:58:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1AB0B60F4D
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71ADDC433D2
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683201508;
        bh=v1vx0WY1q1RDXOdNePXKlFN0jWdf5vVwHXF5RCLbk1A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZKR4BT9ntYa/GcZo0vy2ok6QVmo9ZS//bDjQSveSgqAyiS54g0bDadE1Ct5Z4xNyB
         mJhDo2+kN5u6mlDHG3y2LkZcpxB0spb1DRcSGVmzSLdZCQhEX3OcRQU1+WoVETEABT
         bMpCaTJTTgSxr7wbfvp2mWEg4K8HG4HHJgZCroEKawgrgd+0jbJR8R16btzqFSU+rk
         aGdlmVKtwpZb0HtKVgxJparkvsXyyYTGzbNhWMjLmSnxda/sclQTcr8EcvlQe8Wfd3
         IAeXJJX+XRA0FONL6x354Q41LuwQiZ/wFsRGnIWyv8x8foYQXvdMqG21Azf2sEsziU
         /ini7maxS8Iug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 54062C43142; Thu,  4 May 2023 11:58:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Thu, 04 May 2023 11:58:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217399-208809-Q44DBUIFHu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

--- Comment #3 from Bernd Buschinski (b.buschinski@gmail.com) ---
I did not bisect it, but I think=20

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.3.1&id=3Dec51fbd1b8a2bca2948dede99c14ec63dc57ff6b

is at least related, maybe.... feel free to correct me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
