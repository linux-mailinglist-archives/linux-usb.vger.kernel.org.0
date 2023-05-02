Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393686F43EA
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 14:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjEBMbX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 08:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbjEBMbW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 08:31:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80A21A1
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 05:31:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 549FB623CF
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B491CC4339C
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683030680;
        bh=/NpkSuefgWUi6ROmdzOtAAS5JtleiJ2XTF+UUFv0wtg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gpicc3xoY02WrH6xXtGXsGVPOwRggNKeBF0eH7G8Sc5AWfHxafrpbiWPh0tpKM/7W
         in6yaLqqkBY80olkk7PexEn0E/B6EFBKpiB3Qm5ui3ZKNk2XZvy3v3INYiU1S3FMD/
         INsxbv0k4I5J36h9BE5wphlOpvLT4pwJazLoA+7xQtadZRUdGxt5CfXz3D0u5IWwA2
         rRGRHtmaMUfjW1HFTaBXzTpswk0Ygkx/nJbEaAo6x8SDQG6zZhE5mJU/bQB/B0SAHc
         Kr4Cw6f44BWSfUZLQHXGhMsaRKyoJYDZxdgoA1rB8FcviN5JVOOTRelbuslh80e3IP
         TV+mMdQPtBM/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 915B6C43144; Tue,  2 May 2023 12:31:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 02 May 2023 12:31:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-tdS3uRQVhK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #30 from Chris Chiu (chris.chiu@canonical.com) ---
https://www.spinics.net/lists/linux-pci/msg138650.html is the upstream patch
and may land in v6.4. WIll backport it when it's in mainline kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
