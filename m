Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D66D6E6D5B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 22:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjDRUR1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 16:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjDRUR0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 16:17:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E67D7AB0
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 13:17:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D841C637AF
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 20:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD43C433EF
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681849044;
        bh=/hZPRpFL4CDvP2LV3L1B56p4FnZaFiIMwN8Vyy5QlRo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MoGE4FWyr8HqcSNkDpwQNCpzVIoOTV15tgh8FU3kWiXJcusLyP0dWjz45A9T7yKPT
         7WfhqM4WIBD1I/7mUCMTI72R+Jw72GuyIR9ypa/Ikyu6hREkY5VAXNaAmjc8O5SuKa
         ejIFLG0VeWUgaWsYcatVKr8OXqIUwVbdKAXg6xsjF6vSP0AcAf9Y+lAttU1buUR0IR
         We9+WxQp9870MqoXmKblyS2MEEFw5T/qsU9nyJjJpkQCoQp3UbyW4CVV/pi8Mi+UGm
         bIZW2yMBjIMbbptPH+10UGdLX5qCSMFjmRhhPQSqnATHR7fKNItoTz4Rk+K7HnpN+H
         hdfwRpscXAMgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2DDF2C43143; Tue, 18 Apr 2023 20:17:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Tue, 18 Apr 2023 20:17:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-eqeKXY2ESx@https.bugzilla.kernel.org/>
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

--- Comment #23 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304161
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304161&action=3Dedit
xhci dynamic debug log

xhci debug with dynamic debugging ON for xhci module

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
