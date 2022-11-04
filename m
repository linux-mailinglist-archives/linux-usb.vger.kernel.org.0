Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF266194BB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 11:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiKDKom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 06:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiKDKok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 06:44:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5130B2A278
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 03:44:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 077C0B82C7A
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D219C433D7
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667558677;
        bh=trUMl3i0N/xrgU8zJrX+oeoSlNJ9dIdp3isxz7u08AQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tjVChxh2ppCMiZoj1PCGLmfKRuSOb9WkXIe2m7mDiAPcqLE9FHfTixW/NE691yzV9
         AH3Vu6E4zDIXidpgM/ow1NT9T+Jso0N5Tc/HlIrfsA2JbjOziTarvCXEGY6NihbOxG
         cD053wUcdY4Vy9vFHL2wz1bsRrrt7CnVhuVAA7sfmoxwLtgempz8P8xVFfSMeWSIvN
         2kSM8anEYfadOvDNW4vlPtgluFJGow7lpjf3DNZdl5BVpbxFXkfW2DerEW2tFfJi0E
         viLvJp9eEte0VCtJMWhctyJ7jxcnfeJZFy6U6pGNCyqbgJVqINMR1x/vEAJylx0v3m
         grau8o8/Yrgzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82F3EC433E7; Fri,  4 Nov 2022 10:44:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 04 Nov 2022 10:44:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-jfC4HnfmY1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #30 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Created attachment 303134
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303134&action=3Dedit
5.15.77 with your Patch with Discrete Thunderbolt Disabled

And again for reference, this is 5.15.77 with your patch with Discrete
Thunderbolt Disabled in the INSYDE BIOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
