Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5717768A21A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 19:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbjBCSjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Feb 2023 13:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjBCSjO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Feb 2023 13:39:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DC51ADDD
        for <linux-usb@vger.kernel.org>; Fri,  3 Feb 2023 10:39:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C84F561FC6
        for <linux-usb@vger.kernel.org>; Fri,  3 Feb 2023 18:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E470C433A1
        for <linux-usb@vger.kernel.org>; Fri,  3 Feb 2023 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675449553;
        bh=pIoCM4F7YTn7mdjxK9Udgjhk5FJbCLGhQUyqmHiIIMA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pBhOnYsU7wFvppgHB3G/7nWTnYnPCZLMSSxXDPwG77jTNe8NFgPvCFFkNakCUVMyR
         O93D9tnY8UviR0SeJkidaxgz5ds/RQlL49PRtlXHGCD+7XaitYDGE/b7Gvw6NtnN3l
         +MyGU+9pb/jL5pP4DfrfvPINMX34LHu6J3fSjCnVTPohvPfBNIlaLmfY4HMI3BYg1b
         dvzqALAB/5vDYLw7k6bf5WO28f0MPhl7I1JarOCzzC/spiMeVMu/CfI95m74Mf2QOJ
         HU7tWMyLREm+TV2nDZWHJxawLiE/soZNsQRDRZJ9RZnlOAGXsGXydpQWrDrhOBmHl9
         rrYk1BWeJ6ygQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1360FC43145; Fri,  3 Feb 2023 18:39:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Fri, 03 Feb 2023 18:39:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@diereehs.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-3o7tSAy9ZW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #19 from Oliver Reeh (oliver@diereehs.de) ---
No issues with kernel 6.1.9.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
