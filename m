Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BACB62FECC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiKRU01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiKRU00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:26:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E328C64567
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:26:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8E3A2B824C9
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ADB3C433D6
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803183;
        bh=lI1sA0yikwehj5ohJ/nmBASuRoquQnkhJ03J5zmSYx0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Uw3vH0YVATY8/m+VWraljjF/W7o0/OEpzU2KTBPBfYId8HLjqCxuHUEQpvcmv+BXF
         wgyfN3gRc40hQmoo4FwosCkD6hFY11aic+GfbqgmspW3pK8yoxHbpE+u+FKIkTlpYI
         sid5doNxzm3UFAsKm/Rd1sREyjw/bgIikI83DH/U8/FG4tQ3DId/8lQaxlCfZtXA/V
         r9/IyfMuzCRyIeRGw+VToFODaQvd1VhUWBe/PS4ugQ9xdwu+C7hv5rsoxG39iFCzXY
         Udbpx4MiP1L01EszIRkk80uxo+yECAVCBxZjSN6XTl9bfVhsCWbpFHGBIicWR7TwAv
         SI5rjhlZDdrvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4B730C433E4; Fri, 18 Nov 2022 20:26:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:26:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216706-208809-XOdnfA6uer@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

--- Comment #5 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303223
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303223&action=3Dedit
otcpl-hp-spectre-tgl_freeze.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
