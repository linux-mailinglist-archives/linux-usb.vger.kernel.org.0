Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430E1753BD2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jul 2023 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbjGNNaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jul 2023 09:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbjGNNaM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 09:30:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1A2690
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 06:30:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1045861D08
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7808DC433C8
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689341410;
        bh=MKnWGiGjzzes87LSqQ1JsEByUg5hy/JMNkpvzaMwpsA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KufUkPAkeJCW5cthbq+/pv0Fvs8znNvJaquanL3OFvwoFe9Lbfe07RDIGMR6sraHe
         YRbNj6sVfKVvdDJ4Y38g2xeSLU4KjTA4axGl9LH8cJopEXforUwJ9GDBMSVQsCLT4q
         kT1rRsm/X6YMuLLoxnycK+olMrJGACVBiTgPH2H0ZhPH9JuMmgjU17BX+795Eu1CNg
         L2oMIQFhVFkn1Nn+kPJjWxFkv/oWaTVRlifJiFLhoS6gNtwB02nbQbiw8M2TYt2bSX
         E3eHqEmPLG7ZIax7zflt2vc7oXppLYoMkGyA58Drxg0AhyvXNN8JIMzQj9l9vJgrWS
         xx4PMbCj4Nehg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 61E10C4332E; Fri, 14 Jul 2023 13:30:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 14 Jul 2023 13:30:10 +0000
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
Message-ID: <bug-217670-208809-8h3CVgZPvB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #3 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
The USB 2.0 devices are properly enumerated. Only USB 3.x devices are affec=
ted
in our configuration.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
