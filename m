Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3389C76B1C9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 12:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjHAK3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 06:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjHAK3o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 06:29:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F3EDB
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 03:29:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFC7861529
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DFE9C433C8
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690885782;
        bh=6vr5dDdeilL3GcaoYBqTl0b/3gP6Ukr7lfhO+DrgocY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dro/TGrGYibre3zy67NTRDF97rdPEEXIJwMeKubeTOLATecEoY86miYN+zTMDZeMC
         a5bxYpCsOg5C7Xa7sc/DvSSqBS0V//z/zPIKwcNmLGm6AsixD3Bziqz4Nj6qCBz9QL
         HQzsNb90QzT6VQc+fNigEFfZZoedg7HOZG4B4vnDU9XsKuIJpnObmME0P8neKXiGbE
         jGzBWzW+geRXKeA9feul3uFTveLZESUp38pNSsrr8TS9IVVRZx3FyFpvxExu7hID9V
         soez5nkg9DOSBbK7XFRzhGlRZoFmeF1gvgel92DxuBAZTl5STcICllKHy67aIDnNkQ
         h4mcIZjheyV1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1D4AEC53BD0; Tue,  1 Aug 2023 10:29:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] "usb usb2-port3: Cannot enable. Maybe the USB cable is
 bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 10:29:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@iam.tj
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217744-208809-bObhbA0RP7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217744-208809@https.bugzilla.kernel.org/>
References: <bug-217744-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

--- Comment #2 from TJ (linux@iam.tj) ---
Created attachment 304748
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304748&action=3Dedit
lsusb -vt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
