Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773F024CD4A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 07:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgHUFeh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 21 Aug 2020 01:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgHUFeg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 01:34:36 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208911] Renesas USB controller - FW has invalid version :8224
Date:   Fri, 21 Aug 2020 05:34:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vkoul@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208911-208809-ZYOVywCM1s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208911-208809@https.bugzilla.kernel.org/>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208911

--- Comment #13 from Vinod Koul (vkoul@kernel.org) ---
(In reply to Vinod Koul from comment #10)
> Sent v3 for this now, removing all the checks!
> 
> https://lore.kernel.org/lkml/20200818071739.789720-1-vkoul@kernel.org/

Patch has been picked as fix in USB tree and will be ported to Stable as well

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=d66a57be2f9a315fc10d0f524f670fec903e0fb4

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
