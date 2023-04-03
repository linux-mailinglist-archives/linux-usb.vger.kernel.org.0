Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB25A6D5125
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 21:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbjDCTSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 15:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjDCTSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 15:18:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7871FF6
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 12:18:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A25656154C
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 19:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04B19C433EF
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 19:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680549525;
        bh=RJS8Rdhf5oJ45Vkq1I0grfEf+DFfVQrmoow0PuHzVK0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZrL6CCfnxvQaUaT46BuzJqkypoQzobI/Al7hgelWVh+7SzGeOtxbyUxFWdJ83oHIU
         mFawhwQJyHZR5HAPSIbIAhFhI/R/BCdX19wijIQ/I3IoRqRd+mIiLvXy+vebh0SYMD
         n/Kd8CnhqxZQY7cL+9189PyF7N9nMoR+BIygKYwAhdOzWgu+0GyFC7d7gsiWp1hia3
         +BpMCiwn5LgkmsaMFyatpb+C2J5ftlYw9SQAukIOEuMmNgRTy/3A1DL1U/glxdSDLs
         UpJ9gA6YDoyqtO4CuBXVE4YerTB3zr1jDAp3bCmcTq0UhPYHnSKOENMAgTrg8Fqbf9
         PekgRrXtgffSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFA2BC43141; Mon,  3 Apr 2023 19:18:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Mon, 03 Apr 2023 19:18:44 +0000
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
Message-ID: <bug-217242-208809-Oj17yJXyu1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #9 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304082
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304082&action=3Dedit
1 serial comm lockup

Update: Linux version 6.1.21-1-lts (arch linux)

Performed test over the weekend to see if issue reproducible by only running
process which communicates over UART. Logs attached.

Will build Kernel with DMA API Debug on and see if I am able to get any more
information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
