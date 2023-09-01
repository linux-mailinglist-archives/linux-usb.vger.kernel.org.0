Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C331D78FDCE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345865AbjIAMz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjIAMz2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:55:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E5610F3
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:55:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87ED362C5E
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EACE2C433C7
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572921;
        bh=z/FjrWQKkFX3mof0s9R/qFLdz/0ik6cIYZ7yogaE280=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e2AxmGePiy6wMbxyoZ2LfpvlbbrDK0C9NsSDBYyhb8W+NzNA3Yh9WuXJoljcPhZhv
         /N22MozEtY5zgN7mGjcMbUINFC0IkqRsgCELEVDijxn23o4swyas3nWNNmHvBcvE4c
         rUmw7G6yqFZnSBXbfulkF+0hW6DjnynTKCAyTOi1JluNg68dzwc/TvSjWnJ3SDrOes
         vLmjMCnYZJJ7cJAFWLdpcIamXsU2JqB1QVvaGYD1b16x4UgOSaaI2eMNk3a8WqaI3n
         LNZZ9gKw4+masBmU1QMWcrwpyf21CVlq9kUKWQYSr4mveM/B1K/WlKI0e/eJ+OPKgc
         /nVhjw82VHwKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DA21CC4332E; Fri,  1 Sep 2023 12:55:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:55:20 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-217670-208809-yyXhSfZUhD@https.bugzilla.kernel.org/>
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

Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305004|0                           |1
        is obsolete|                            |

--- Comment #20 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305009
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305009&action=3Dedit
0002-usb-dwc3-Get-clocks-individually.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
