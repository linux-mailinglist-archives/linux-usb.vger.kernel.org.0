Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99E26E25C9
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 16:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjDNOcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 10:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDNOcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 10:32:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF23BB92
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 07:32:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A41864255
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F917C4339B
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681482722;
        bh=Q8jipo3rkUxkXibBuTQxnxbCvWlp84FzhJGRJnp9Sk0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kiWtWJvOUMXm8vpJkvyu4+my2rM566/TSaWf0PKdFdZjDrwLbydzIglw13O1bJt6J
         sqanlcu0hehZVRFTyDQZuCCjdknjPk7TP4Laxwtro7BZJAHd59+opClmQ7WxuFy7Nk
         bKKAxJ6uMlum0gshkY0RkROTCD5K4eOtmb9gR2pEor56crgHb15s4zggvoCbmjzee8
         s6Xh0w2/JCEKQzH9l8QICN15zehPTpxq11BydpSrYmtw26S30JmytjrstVOty9W481
         HlOlAQYFAgBgyXuGkuNczo/oFBVGSJDtdCoSH3P4slSg8fA5RzCQNm/O3oh3RlTrLN
         ervXEhXzJ6o9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EC7E1C43141; Fri, 14 Apr 2023 14:32:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Fri, 14 Apr 2023 14:32:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-uoL5rbHvk5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #20 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 304134
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304134&action=3Dedit
debug patch comparing free trbs

Debugging patch for ring expansion and=20

Patch recalculates free trbs and compares it to the old tracked value of fr=
ee
trbs. Prints out a message if there is a new mismatch.

Patch also includes a new way of checking if ring needs expansion, and by h=
ow
much. used only to show it when driver expands ring based on old code

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
