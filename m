Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0104450AEAB
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 06:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443844AbiDVECy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 00:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443835AbiDVECx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 00:02:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0DD264E
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 21:00:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85A8961C4A
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 04:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC0F3C385A4
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 04:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650600000;
        bh=dLdSHAYqrmVQbg35A03zgPV2WHURwfTt3gXV9lt8nNo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fK6PUgl8fWS9UPhhzjz6DAJR4HP5JhC1kWR33vE4sFmT15nhTwMzAOYfsaD5Es3qO
         SkJX7cH/TLgK+5jPf13Tl0SwV3GanihCXDRuZjMV1EHVTGdHI3Xlfo1/cLGH/3hEt2
         IQFBNJUdA0RCQ75DQTMWbwnR0BwUBavfWlPMJZAHVYo/Id3HuBGbCgyIm1NXEibIVL
         XUnhBFVWn0jyO1gUOjgfs0P7KFJJpboNz5uDKDmHMieP0M9z/iPceFyO16JWWM7sLv
         GLDP0joQYiI+z3bG3M+UbflSII9/6okgFNeSIBEVUeZ3d8qM1vU/iUkBf6sCaGoYBH
         C1Kx6ymCbvFeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BDF36C05F98; Fri, 22 Apr 2022 04:00:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Fri, 22 Apr 2022 04:00:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215361-208809-tchco4jE6F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

Ross Maynard (bids.7405@bigpond.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
