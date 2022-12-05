Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7641964308F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 19:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbiLESjz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 13:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiLESj2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 13:39:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FE31D315
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 10:33:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65446612F0
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 18:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6D9CC433C1
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670265213;
        bh=UKYZLXh2FeDp99dya8oL2GPXGxcabeBBlZp9q7yX1qw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XeX5Ft9Pnpxo9zt44GjN179e8HbEKgRHcfypXLUsHVCHuccp9xTII11ElSMZAbVEe
         UGnaEjMYH/x15Q6zOS0szy7dOVLDyD54/toU0xIE8It3ZYhE2V24tdLCKHBTtVUONi
         vx2lqZLweSOQhIHedVWh14f18aivSriSAKUbfaKNY33R5+EJPiRFf1cmdrOBJREEgN
         KUOtJsOkTMBgiMQGsELG80sI4adSeEaQJ2b63pMgPlqeAiC/bd2C1tCV9OO05bSy3l
         0bQzhUuj2zmxdAHaDkfn6Ry07gYjDz4aQynoil2h8M9OVQK5TutLuq7tqCEuE77NZI
         v4WmTAeNysK7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B553EC433E6; Mon,  5 Dec 2022 18:33:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Mon, 05 Dec 2022 18:33:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.burgmeier@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216766-208809-6aokBbd87U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

--- Comment #8 from Jan Burgmeier (jan.burgmeier@gmx.de) ---
Created attachment 303361
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303361&action=3Dedit
dmesg with debug multiple suspend resume

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
