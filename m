Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4BE47BBB6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 09:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbhLUIUn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 03:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhLUIUn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 03:20:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57B4C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 00:20:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 940F8B81052
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 08:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63B64C36AE9
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640074840;
        bh=bbDgB8gwqYyBmMc82pbeuwAZxM0QNObca3fgmTFliCw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BsiSRUACPFNfxLAsu+VeL0IgGhtM2je+XW12WC7WfG3CnUM5XLMRNQZT4m53jErwf
         Rlk7B2xjEwHfZ+G995kTNIjSEXPou0abpmuQY2T/lIzSCFqJEB4Pd+RbF5phPTKB0z
         SOB6tNG+vlnr1XILjPQPec699LY8dpSnLSqDTIHvI019UppS4l/lUBdBiwvyRII9/o
         NAp096YZ3PRvrtoj7lAUEy7hBofgbzRFmUiy6t6d2SGux07CXpw+GZT4UY+4l2TxLg
         fmQo8DHt39GTXpx7EOWPQuSDCyui+E49FIjYKOOxzFVrg+dUCy0QGnmTfRF2ZA5HQ+
         PAoV8mLFhbdhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 47AE261106; Tue, 21 Dec 2021 08:20:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Tue, 21 Dec 2021 08:20:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-nNCCLtxHOJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #5 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Dec 21, 2021 at 08:07:37AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> I am wondering if there was a change in the cdc_ether or zaurus modules=20
> that caused it to stop working in 3.0.

There probably is.  Can you please use 'git bisect' between those two
versions to find the offending change?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
