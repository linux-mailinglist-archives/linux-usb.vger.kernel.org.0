Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF84F5CDF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 13:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiDFLtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 07:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiDFLtd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 07:49:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2485A6284
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 01:47:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA788B8218E
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 08:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F724C385A1
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649234857;
        bh=GtAodZEEbnaBXpx28tmVn+XHQvCIdnZTtLnY+kvT7jQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ias5MCYsnWzo9408z1jssGH6LHlPESOZ7NdJZz4vOdUre6/ekELEq+2HoYNiXpd/u
         TX6dJW1getPl2ulj5IpneDJB6cikRbDeN4ThC6ASaQW2wiVxLpmAJdGG7PvLzihVX+
         1Rf1HtYCAMi71+U8gI/XHKGS9we5hbWlWkZkBVndIgzjiCeg9CujsVaWdW76m4AwpJ
         ZAD8XS+it7Ka3KLr/fxwNzydi2YEDxkJnA5Dwfq4r90TajkWd6UVQdsw15sngRxKuN
         Ph9ZbF1i+cTGHboA3hehNgGbZJ9AvdyvpPZQwHcJ+vzHZGaVFVS392/59vE3F805+I
         OVfBqYEpHVLXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4D130C05FE2; Wed,  6 Apr 2022 08:47:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Wed, 06 Apr 2022 08:47:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215799-208809-SEX9Mt2x0B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

--- Comment #5 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Manuel Ullmann from comment #4)

>=20
> Thank you for looking into this and for the patch. laptop-mode-tools is in
> Bash, so I can send the PR myself. It would be nice, if it could be
> backported, since it fixes a bug, but laptop-mode-tools could also use a
> better check for battery nodes.

Hi,

just to make this clear. We seem to have two bugs. Do both need to be fixed=
 to
remedy this issue, or do we have two independent bugs?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
