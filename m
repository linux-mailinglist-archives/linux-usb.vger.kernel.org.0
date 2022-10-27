Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1DD60ED95
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 03:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbiJ0BqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 21:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiJ0BqS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 21:46:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBC0130D78
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 18:46:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79990B82407
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 01:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E564C433D7
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666835175;
        bh=+jOfGNJ/TO4gyC4IvjmIBbyBawj87kEedW/H53vhFm4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qqDTSJe8l7Gyx6vCe5wcN54KuVkomXAisGGOFXpWq6lRDCY4rm3++EtU2pJhtvGGI
         MPeNmZVOnUXu/GJYi/Lj+n1+6v+tY3Zh2TDBLSVOcXX4YAHXfOYTd+Svv7exRI+atp
         oboMe7pbukVFn01J6gGCK89Uwj00Yagl6GZY2Un4rNdKl0l15am4Muv4lg8D9U9n3C
         AgzGg8tfJHxS2S0GNfjkU8xFpeh2lRip0rOwzyCsfP2gpJ1GNmiBgYIDtXONUb0L3j
         3/OOgmRZaC8kaV4xr6cSnmmmt4bamfrdBhOm7FltaZK6zQAv15FJvnLec44n8as2Vr
         xCExjxkkXh0YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F1BF8C433E4; Thu, 27 Oct 2022 01:46:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215649] all usb devices stop working and forced to reboot the
 system
Date:   Thu, 27 Oct 2022 01:46:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215649-208809-GsCsn3kzBO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215649-208809@https.bugzilla.kernel.org/>
References: <bug-215649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
These really look like hardware problems, not software bugs.  But I have no
idea what components of your hardware might be the cause.

Are the problems still present with current kernels?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
