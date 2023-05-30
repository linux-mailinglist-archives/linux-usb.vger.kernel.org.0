Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50705716EE6
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 22:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjE3UgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 16:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbjE3UgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 16:36:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194BF134
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 13:35:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EA9B63355
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 20:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1697C433EF
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685478876;
        bh=6JyO9DlojZp6GJ6rfFIXSW44tFPrgFTBGeoCSkZ3gNQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iqlp87vOHyoh4cSemtoFlSZLmcTJLt32l7VqtLF5AZ9uHbQYFgwIOnwfQp+zQ2QgX
         gqiKNL5LBy245lpyx2tYiOMbwMSOgCDY+Za7Y15/BQlLzjSHofLxh1tvTdtnHFItY1
         mM7SUjMoYSTR6rwglJ28BGyu74P47FAE2cy9M0FmyjYpptXSmWPvuEiZ95Ran7l2+m
         nljjVi8k4DF547vKOy/3+lnd0LQ30NHAypo5YGppK4WaGuIYi0OrMv4ifyfxJjX2VD
         ITAv67+osXvswxaaule+9lN/7kHd6SK1COePp3TMhRlUwf+P26XzPpKEDewHb4FZqM
         o9dauPnZlPjpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B5892C43141; Tue, 30 May 2023 20:34:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 - Charging over USB-C not working
Date:   Tue, 30 May 2023 20:34:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aaron@ephasic.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217511-208809-dXGRjNhPQ0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-208809@https.bugzilla.kernel.org/>
References: <bug-217511-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

--- Comment #1 from Aaron (aaron@ephasic.org) ---
It appears that HP's drivers are required for charging on Windows.  I have a
fresh Windows 11 22H2 install with no additional drivers or updates install=
ed
and charging is not working in it either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
