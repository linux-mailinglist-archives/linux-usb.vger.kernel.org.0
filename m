Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C78D15CDF6
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 23:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgBMWPf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 13 Feb 2020 17:15:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:58640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbgBMWPf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 17:15:35 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
Date:   Thu, 13 Feb 2020 22:15:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@z3ntu.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206435-208809-EQQ0OSctEo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206435-208809@https.bugzilla.kernel.org/>
References: <bug-206435-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206435

Luca Weiss (bugzilla@z3ntu.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@z3ntu.xyz

--- Comment #9 from Luca Weiss (bugzilla@z3ntu.xyz) ---
Also happening on msm8974, see e.g.
https://storage.kernelci.org/next/master/next-20200213/arm/qcom_defconfig/gcc-8/lab-bjorn/boot-qcom-msm8974-sony-xperia-castor.html
(msm_hsusb f9a55000.usb: failed to create device link to ci_hdrc.0.ulpi)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
