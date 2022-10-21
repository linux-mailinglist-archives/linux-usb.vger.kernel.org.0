Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27EE6081D9
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 00:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiJUWxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 18:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJUWxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 18:53:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589FC2AD33A
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 15:53:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24D5D61F94
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 22:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82B0BC433D6
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666392793;
        bh=DPJgqMIRhkGaqaqKmV6Qe2AXTRy7ovSRxTxlJlx39bE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QWN4AQCQLZO4spqZbYYWQxmriNyIsynrNthnLAyWwFdSOMB/tj67Ofh9LOVdV9wDY
         KhNyCoJP0e1wl4X4Sp6uFJIwATnForZ1jFyEwzIXY5nvO35bdpUDKYPg8xgM+xrIhF
         2KkDnTdSt+ZsD34V7fJQy3KDCaHQDhO+IfZ+rFpgGZoPz1NaAk9wf9BdiDr524QZgD
         6iMjZ7TZtyZE+YOxKuJvB97NORYo3g13NpvO8v31X9xnJUgGY0/qK1huFNas9NiiUO
         MlbiOF9nWUg6pH2nV1SfMcN1w4ySSMjBEYtDu0Gzee97vlrHh3Pkh0usnwDiOAQ6wG
         zInu3lQfhqxUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 64860C433E4; Fri, 21 Oct 2022 22:53:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216588] RTL9210(B) falsely detected as rotational disk
Date:   Fri, 21 Oct 2022 22:53:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supgesu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-216588-208809-P4swcKCHGf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216588-208809@https.bugzilla.kernel.org/>
References: <bug-216588-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216588

Elias (supgesu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |SCSI
            Product|Drivers                     |IO/Storage

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
