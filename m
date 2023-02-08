Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F5768EA20
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 09:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBHIpG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 03:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjBHIpE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 03:45:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67BE1117D
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 00:45:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E1D5B81C69
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 08:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 130BCC433A0
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675845901;
        bh=WOgHYR5vThCVuYQJ++icuDYI9BEvcSRGqvqhh4U/rBw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LREbmUM5VtPwQwJgwwjIVM55H8MEt8BG1E7p5rodMrS1Mfe6QaiEk87+t+IHILjJA
         Xr0XnUjYlPMw4ZF8DsAw5KFqUBZQhFm0+t4D7Tt385vMYZmCJ21816U8E7b3JxORHG
         N5C4Sk3F/8OO5NL71Ui9iuplajCGCzN3RJtbM/t1H3Mu6uzQSvvddWWmqdWomS9uGw
         YHX9tsIYeiUS/peZ1lBRr97dQYEd1hZiVZX2R7211oFp/FhFpOvyxuH5k97tPs3I92
         KOC5EWIguPRNMhR1RQD9GVc2aXUJO4COE8hYvb+fSnbfBhBKBVWevAsyWaOyzUcxnb
         TLLngM6RDiiBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04416C43141; Wed,  8 Feb 2023 08:45:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Wed, 08 Feb 2023 08:45:00 +0000
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
Message-ID: <bug-216697-208809-h1bNALzeK3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #21 from Oliver Reeh (oliver@diereehs.de) ---
No problems with the patch and kernel 6.1.10

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
