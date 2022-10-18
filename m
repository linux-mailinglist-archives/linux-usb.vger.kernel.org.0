Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC05C6023F2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 07:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiJRFmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 01:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiJRFl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 01:41:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEB1A484A
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 22:41:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EA362B81620
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0D06C433C1
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666071697;
        bh=0s+cz+O+9JHm7CTo7PAxjBWRUong2Zeu97oMT4LXi3I=;
        h=From:To:Subject:Date:From;
        b=PtD9SLUQjK53bs4szEcanL7zKlNUcx6M9Gx48KWG6S0WqcFc0nXRrTXKb4p2Pbu+M
         UfpwNOqWg3xM+LtqJHOQrxjkNtmwGFe/FvSufHYxJXFek+9bu/GBDej8lUsuJFxwdC
         DiGcvVbu1LyQJRWgOPndSEeKbOkv+GIzm7LdX4jbDVH8OyiNmwwJptVWCaiqSerw7S
         KK3k/+g7p4U1J8W67jZUj0ENaw2DSiDbILMIAa2Gf+sjPgwnq0rtKlYGCwaBJ+BOTR
         sN6AN79rygnZAjmFtSkE9Nd9M16Y85BSkhCzv/VjYIL441DidjiChDBJeRK5lJgdzH
         4eE4tTRAPsvnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9473BC433E4; Tue, 18 Oct 2022 05:41:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216601] New: pci_pm_suspend(): hcd_pci_suspend+0x0/0x40 returns
 -16
Date:   Tue, 18 Oct 2022 05:41:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: koba.ko@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216601-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216601

            Bug ID: 216601
           Summary: pci_pm_suspend(): hcd_pci_suspend+0x0/0x40 returns -16
           Product: Drivers
           Version: 2.5
    Kernel Version: latest drmtip/pci_pm/usb next
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: koba.ko@canonical.com
        Regression: No

[Steps to reproduce]
1. must cold-boot into OS
2. checkbox-cli run
com.canonical.certification::power-management/suspend-30-cycles-log-check-w=
ith-reboots
3. get the xhci error
~~~
Sep 27 19:48:10 ubuntu kernel: xhci_hcd 0000:00:14.0: PM: pci_pm_suspend():
hcd_pci_suspend+0x0/0x40 returns -16
Sep 27 19:48:10 ubuntu kernel: xhci_hcd 0000:00:14.0: PM: dpm_run_callback(=
):
pci_pm_suspend+0x0/0x190 returns -16
Sep 27 19:48:10 ubuntu kernel: xhci_hcd 0000:00:14.0: PM: failed to suspend
async: error -16
Sep 27 19:48:10 ubuntu kernel: iwlmei
0000:00:16.0-13280904-7792-4fcb-a1aa-5e70cbb1e865: Can't send a SAP message=
 if
we're not connected
Sep 27 19:48:10 ubuntu kernel: amdgpu 0000:03:00.0: amdgpu: free PSP TMR bu=
ffer
Sep 27 19:48:10 ubuntu kernel: PM: suspend of devices aborted after 465.967
msecs
Sep 27 19:48:10 ubuntu kernel: PM: start suspend of devices aborted after
466.632 msecs
Sep 27 19:48:10 ubuntu kernel: PM: Some devices failed to suspend, or early
wake event detected
~~~

After disable xhci wakeup events, can't get this error since.
Here's script to disable xhci's event.
Ref. https://gist.github.com/kobataiwan/d22482e299c01825a9fe51910d6214ee

There's existed open bug that have the same xhci issue,
Ref. https://bugzilla.kernel.org/show_bug.cgi?id=3D116761

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
