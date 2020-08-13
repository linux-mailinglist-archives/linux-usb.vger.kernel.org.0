Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE88243E5B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 19:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMRcc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 13 Aug 2020 13:32:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:49364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgHMRcb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 13:32:31 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Thu, 13 Aug 2020 17:32:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-208891-208809-TNXXyeGX0F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208891-208809@https.bugzilla.kernel.org/>
References: <bug-208891-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208891

--- Comment #14 from Matt Turner (mattst88@gmail.com) ---
Created attachment 290885
  --> https://bugzilla.kernel.org/attachment.cgi?id=290885&action=edit
Kernel .config diff enabling CONFIG_INTEL_IOMMU=y

I enabled CONFIG_INTEL_IOMMU=y and tried again, but with the same results. :(

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
