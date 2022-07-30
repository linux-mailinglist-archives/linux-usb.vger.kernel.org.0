Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6218585808
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 04:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiG3Ci4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 22:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiG3Ci4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 22:38:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539AF2D1DA
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 19:38:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB50861D98
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 02:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B449C433D6
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 02:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659148734;
        bh=SitAoFCnlSlDoTWlzeGyqZpZFwKTz08r8B97Rgbm7Tc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UypeR4Ee4pd8Nxh96ml8sLoLmLFEWX13BGDMfePMpLuzkYODEms1jQLnAHagx4eez
         b4l+tXA+l4UGzYPC8sma+DMxUuZ8aSw+AuBqjwV5fcwWmAiOR1swE3KMsLDJbx/31W
         ZNj+5f8F3Tt8L9mLpf2ptIZeZBPhoW+/xkQ5Oaf2TsbsalQKa43k/pSrB9LKlhs8pv
         tKjkjmSufxQ7iN96kvPCj8u+4ODJTcmG/rt7yOza/e7b0SpVD7SkKbugBStnzXKvEZ
         TWQjyL4HLD92lR8cM8fUs5+jwIFrUyg2Dt88vgblICnJ72kxMoKksdVTqbFkaEamgd
         2z1zrHgsjjoqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 207ADC433E4; Sat, 30 Jul 2022 02:38:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Sat, 30 Jul 2022 02:38:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-uw66lP9A14@https.bugzilla.kernel.org/>
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

--- Comment #23 from Alan Stern (stern@rowland.harvard.edu) ---
Your /etc/modprobe.d/usb-storage.conf file didn't work because it had the w=
rong
format.  It should contain a line saying:

   options usb-storage delay_use=3D15

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
