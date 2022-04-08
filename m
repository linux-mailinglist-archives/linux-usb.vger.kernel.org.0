Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F71B4F92C9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 12:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbiDHKUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 06:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbiDHKTu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 06:19:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA20D3997
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 03:17:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 103C261E95
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 10:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 780E5C385A1
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649413065;
        bh=DVCz3xBHnFw5uH6eGDqc2Xmh8Lik6Tst6oY94PUhadQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nv0L8TTzAYl66VVnhwemRUvXTLjSpfiB4/8MgRtN9O60QpWhcYnj+yap7wksSaWgp
         ygf+tIW70KDrWFsowKmjXQbg5S2MIF/297D48MmW2ynqRIYKNuOlFJ6OVtaypI1fQ0
         PGnIzae2dixDiHex333KDv21nq9WpHQ+zyKQ6Ss8Bky4yxmRbT2QwjLEJCoK4Sxcnc
         kjnQjB6EG8ejMa1zpjSceCy9hBnyFCIuljfuBhXxxAFB+KL+kMRgYFMY178TgqXnhD
         7q31sAQMRw/TfwjhGRbn6Z6HTTNZIIRz0Q6dpWJ6UJqqICJrRARhVD6KJQKEcH6Gpu
         y9ElrJI0ApaBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 668F4CAC6E2; Fri,  8 Apr 2022 10:17:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215487] usb driver crash due to usbip events
Date:   Fri, 08 Apr 2022 10:17:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oltmanns@embedded.rwth-aachen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215487-208809-6cCuDP6SiY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215487-208809@https.bugzilla.kernel.org/>
References: <bug-215487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215487

--- Comment #2 from Daniel Oltmanns (oltmanns@embedded.rwth-aachen.de) ---
Created attachment 300722
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300722&action=3Dedit
kernel error bullseye

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
