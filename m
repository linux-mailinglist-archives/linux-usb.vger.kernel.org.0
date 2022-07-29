Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252BB58550F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 20:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbiG2SjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 14:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiG2SjR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 14:39:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA18365678
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 11:39:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 699D2B8290B
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 18:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1544FC433C1
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659119954;
        bh=3l7WCn7Ku/SF8X0bZiW/cb2gQOPW3QyLUHDSWqd0v1U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VHtJ1mGw1CW7Za1mKbMUJ5tL1dc23AmyLPFdl8+7p6DYgWdMOht004kHlZ4atxbeO
         e8EDujpb5+kxbT+i7K1ivpdcklKdrmLRNdRa5RNlwR5VSNVG6Tkpf9T45TAqim4j0g
         wBZX+Sm9lucgQvzVjszCBcbUk9eYDk2athD1fGyOG+fZPM/4cyc5kw5ltZOC3Qb1aY
         Svpu6DgVP965P5lJv+xRSDsf5S+6hN4Ee8XG8r5l6aSyt0nH6cT2Fq9BnSbdVYkuNa
         Hgx7YgSqV9bzDJ96mYKHyMDeDRz9U+oPwPYYt5XNfGN1iPDm/BpB8Q1Hu8sFsoRgs9
         IGGh47LXBAmrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ED828C433E4; Fri, 29 Jul 2022 18:39:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Fri, 29 Jul 2022 18:39:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216282-208809-yLOcQgoFPp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #20 from audioprof2001@yahoo.com ---
Created attachment 301515
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301515&action=3Dedit
monout.txt.zip

$ sudo modprobe usbmon
[sudo] password:=20
$ sudo cat /sys/kernel/debug/usb/usbmon/2u >monout.txt

turn-on No HDD
unplug & plug again
HDD mounted automatically.
Safe Remove
^C
1.1MB file
Compress to .zip
Create New Attachment for Bug 216282

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
