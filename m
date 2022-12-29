Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37481658C97
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 13:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiL2MOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 07:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiL2MOn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 07:14:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FF825E0
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 04:14:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EADD461794
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 12:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51778C433F0
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672316081;
        bh=b34yj5vE+Jd5XAFe15B4iBOYanW0Wg7s7EsgFsfgDLU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ofO3L51z2GsbYO5lR28xqXAsPvTTmHN2QpgJWtDaQusRMDuEfhXcaElt6hwWG11xt
         HM9MbIaP5p97geFFHe1kle0IvvWwoa+/pbtpyoNJl65TzMeJm3oowqU/FIfJxRgsb1
         Bw4/HFMb7D/uv0bwehfJZTvJ24O+/I9iHm2lao4RkiVfHM0lezhlLXCZLueuOcm0O+
         zitaVNOL2d3nXumKznn9UmF/6+BXwXQrrMo5hWdhNjmAGdaYv8mwKSz/81kmFsr5yH
         PW7IZ6CKvnKla4/3mRIGjCCzJODh3R9bG0MrjU/tqIvamFfzF4gRpvFrhEimzCqOdP
         FQUu3/BH5tP0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3829CC43141; Thu, 29 Dec 2022 12:14:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216474] Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date:   Thu, 29 Dec 2022 12:14:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216474-208809-BZMgaEEWMD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216474-208809@https.bugzilla.kernel.org/>
References: <bug-216474-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
As it=E2=80=99s another device, please create a separate bug report (and re=
ference it
here).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
