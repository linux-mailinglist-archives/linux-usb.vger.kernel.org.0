Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7BF286FC4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 09:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgJHHq1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 8 Oct 2020 03:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:33518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgJHHq1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Oct 2020 03:46:27 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Thu, 08 Oct 2020 07:46:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209555-208809-TlUfJl4kIK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209555

Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Minas.Harutyunyan@synopsys.
                   |                            |com

--- Comment #2 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
Hi Tomasz,

Could you please disable power optimization by follow workaround and test
again:

file: params.c

static void dwc2_set_param_power_down(struct dwc2_hsotg *hsotg)
{
        int val;

        if (hsotg->hw_params.hibernation)
                val = DWC2_POWER_DOWN_PARAM_HIBERNATION;
        else if (hsotg->hw_params.power_optimized)
                val = DWC2_POWER_DOWN_PARAM_PARTIAL;
        else
                val = DWC2_POWER_DOWN_PARAM_NONE;

        hsotg->params.power_down = 0; //val; WA
}

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
