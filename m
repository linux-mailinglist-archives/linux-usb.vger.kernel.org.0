Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D384D38CE25
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 21:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbhEUT1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 15:27:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239081AbhEUT1P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 15:27:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 55190613D8
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621625152;
        bh=ZY9GxuA9Uuf5gG92lOz2oH3cXEa4nUXYR74tK79wZfs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qPTlkvraWw3MSxWQdPwJvEvH53PdvDaHUikH07ulVzPz80cp9RQ65OSLhSOjnPAyb
         +pRYTA4lJQvnzGRUx6Rnru3W2Uer+RAx8QVkitzCAKbMoDCnOM6TNPGg9g6BBTMcrc
         6dXKWwabuckB/dn37rF484y6ILVQRR95G2LfWTdzQadF6tFHfyoWKB7CWghqDtHhZs
         oXTDWTEYeTgz21IFCQHEVyHlmbtRDUQ9qu6aTSa27FSYaMBKzP0l1dtwplipDsODE3
         H85jOLH1ZOz0EfbNmVH2wfTYBcr4AKdR4o0j9UJShiYJO+JqvRdaG7Cn1bx7oma/hf
         uwTIywdG/wQxA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4839E612A4; Fri, 21 May 2021 19:25:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Fri, 21 May 2021 19:25:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-vMZjfbdbK3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #29 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thank you Peter.

I'll take a quick look at the traces, and clean up the commit messages befo=
re
submitting the patches.

Can I add "Reported-by" and "Tested-by" Peter Ganzhorn tags to the patches?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
