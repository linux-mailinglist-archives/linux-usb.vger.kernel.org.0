Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0659178E948
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 11:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbjHaJUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 05:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjHaJUa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 05:20:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582D9E48
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 02:20:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C06F9B821FB
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 863F1C433C7
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693473583;
        bh=ML5s4s3qlVn6bQsqWnGMadDQNFgfIfbMDvGP65/vQF8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tZxkzn1jUVJ0VQmU7lW0ViX+rkc3XUppS8sWy8yhEzI2+DQl1+iwW/xBXfUZ64JQu
         YI7zr/VFsGicIy6ia4Exd2yCcjTx9g3V7WX9QAAbnDL6K6EWHDF25ApVFr1fYHDvH7
         3ZCFawDhUqW/aToO7SngFjKFqNiteVM2eoo2ryfaEjvZEGXHmMj0LbumSVtP5eGFC2
         v3mKw7oQ4ooXL+WNeiw2T6NWA1Z5SD3FXtvne4auVNjbWKrEG5aq6LjdNKsOz2o1LR
         mpGmMdr59FU0/PJ3xTUZh2VUVn+GRmowoQxk5GT23l72ObHzHqovfkuloxs7smQPBj
         7Cv5Gn3U+ndoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6B220C4332E; Thu, 31 Aug 2023 09:19:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Thu, 31 Aug 2023 09:19:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-kcdHR1rD00@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #10 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
No it's not fixed in 5.15.y.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
