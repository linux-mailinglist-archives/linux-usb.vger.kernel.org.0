Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B8C653CD2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 09:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235042AbiLVINS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Dec 2022 03:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbiLVINN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 03:13:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590C6252BC
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 00:13:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11D05B81CDF
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 08:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 968A0C433F0
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671696789;
        bh=tLOPP05yFNJeVZC/+MdTkTa9Ete5wfQy8QMo66B077U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A6KD5gDi0nnrfLuD6NclZw+5DcBW2qOAgX1eHjL1NMfyIt0FXbG54T6CBHZXNEhtL
         3LDme9lQvop1HHaVYJqAKC1KKebvm5DAzqzTEm57tzk2bc+It7ZizLI+MdDd6o+dqo
         6DdsfljKSKl78uqj/f4vExghi8CxCfyZjDS2SJ/PORaualFYOjFOMkuNMUHt5FvQc1
         h5m45PhdVg50EpFM9y5d6kB2aNoHjMMnYvVCjjJ8GScHGiKc+VUAPkpJz4uABppiSr
         08kZRCYT+pPxMASCEA+v5zMWJOaumtiY9LgIlKUGHi3cwULBoc71AyQ3TpCriDJLgS
         WQF4AqaK+rh5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7A0CBC43142; Thu, 22 Dec 2022 08:13:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Thu, 22 Dec 2022 08:13:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: max.lee@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216822-208809-QDjrBx1v4E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216822-208809@https.bugzilla.kernel.org/>
References: <bug-216822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216822

--- Comment #4 from Max Lee (max.lee@canonical.com) ---
On this platforms, OEM didn't design RTD3 on Maple Ridge.
Since the MR AIC is to share with other desktop projects, and the NVM was s=
et
to Native + RTD3 enabled.
This cause the driver to get the RTD3 enabled from NVM. and set Linux TBT
controller in D3 state then PME doesn't toggled by device hot plug.
Current BIOS sent _S0W to TBT RP and the NVM native +RTD3 doesn't change to
native only. Is this a correct setting on the NVM to support non-RTD3 platf=
orm?
should BIOS sent command to modify NVM offset to disable RTD3?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
