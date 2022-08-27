Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3345A3A06
	for <lists+linux-usb@lfdr.de>; Sat, 27 Aug 2022 22:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiH0UtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Aug 2022 16:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH0UtR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 16:49:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B05422D5
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 13:49:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FD2260B9E
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 20:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 725E8C433D6
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661633355;
        bh=+JXshdbxgZBr5gA94O0Aaza8ufKN0JB1VmzRX7WQN7M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AQwt4JvyG7V2EX25WMHxNTZm2WzKdmw0Mz5GXzpq9vaF02vxzT/LrDrk+gNSq17aC
         0N2vmQNIIk4YcyIgN6P3jUApyu+Yr6CFWwh7g/joyXokwMHV00LiHmV5boKgBEgoM3
         yHEwUKPvbbjGJU9WrVcWp763ARJy5nViSm7Lt2UmWXKGzCtYdx5KX/JtiHC3mRG4xT
         78iEBax3yi9gOqnnyffCOzTUe69LHnuul1wTYoQH+WSHaj8P4Nc9Y9VJlVqzTZkpil
         yLF8XYB29dmcNtB0yQmlZxSoieIXIU3gwAROUxZWQO5VcuInbFpRUE5MePY9p7i3n7
         cJi2ymZRJY0Fw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6206FC433E4; Sat, 27 Aug 2022 20:49:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216422] BUG: kernel NULL pointer dereference, address:
 0000000000000000
Date:   Sat, 27 Aug 2022 20:49:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel-bugzilla@janbruckner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216422-208809-SBW1wd1Du2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216422-208809@https.bugzilla.kernel.org/>
References: <bug-216422-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216422

--- Comment #1 from Jan (kernel-bugzilla@janbruckner.de) ---
Created attachment 301687
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301687&action=3Dedit
bisect log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
