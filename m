Return-Path: <linux-usb+bounces-7414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A286EBC5
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 23:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5B02895A7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 22:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D458AC7;
	Fri,  1 Mar 2024 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="se2og7SS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF959B44
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331590; cv=none; b=lTndLnflOzysDjem3kXnrZ6oYbiVtsBjUgfFRsql0a93/FgWW/xdhksKb1CZJ5U4udQYZWh5ghmEYp3JvW6VKFQt+ibyt8UmWu4o4AsIcA0eW2Pc/+f8cRpXQTP8fENbMip1sZQ/LGPpY+Tz0Zze+4p987vjlnPAdX6MtypaAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331590; c=relaxed/simple;
	bh=DiEwknq2gdrHCR1ke5+KYGbeTuY1wOBDTdwTW76JDJ0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MAIvI+JHgqw6RvMF1siR3XboRn2iDl+9qvFVrKdJw0K8RrSGtJcqYdjs90/7//OumhGgTvOQl+BTn1iTA4z3IxlghMKlmBO+ytHwftHEridovjKys3KHsjuUx+1h03g0SnVhTpst5DszxPhFfs6cTxgwMwiHnodSY9pTH0MO41M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=se2og7SS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0116C433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709331589;
	bh=DiEwknq2gdrHCR1ke5+KYGbeTuY1wOBDTdwTW76JDJ0=;
	h=From:To:Subject:Date:From;
	b=se2og7SStXS70HKu1rCPteRjsYGdk8lAP5el2W0P9fjVnE1r/CnbnnZxzoJeookeU
	 OUnzIOcGsm43IEVIna6uIxAxtRLuJUGusWjAihf8ez9dq1hklxgFKvtzqNcy0fi5YT
	 PL6T5SLoi9/QIoJudpJlArVt/mTRVnCfp3YebvfOj1lqOE0ko+o782QRcRGsVOfNGh
	 jUJDG3bSJN6lCJ7tCOss0CF1MclrUtkFOqnpZu7oER29WLTM29n6qnM3GdGhpL+JbR
	 wYYM/rFT9GNkU+zpLwfiUXPNij8AKG8JLjtC0sJ5sV+Cg/uzGGgnMoPmpTb8VzLx7N
	 E48UUVDIJ0ZcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94053C4332E; Fri,  1 Mar 2024 22:19:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] New: xhci_hcd prevents hibernate/S4 suspend from
 working on several systems
Date: Fri, 01 Mar 2024 22:19:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter blocked cf_regression attachments.created
Message-ID: <bug-218546-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

            Bug ID: 218546
           Summary: xhci_hcd prevents hibernate/S4 suspend from working on
                    several systems
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.8.0-rc5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: todd.e.brandt@intel.com
            Blocks: 178231
        Regression: No

Created attachment 305940
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305940&action=3Dedit
lenb-Dell-XPS-13-9300_disk.html

When running disk suspend on certain platforms the xhci_hcd USB3,0 hub
controller device prevents hibernate by aborting suspend. The test is initi=
ated
with this command:

$> sudo sleepgraph -m disk-platform -rtcwake 60 -dev
This essentially performs these two commands to issue the suspend:
$> echo platform > /sys/power/disk
$> echo disk > /sys/pwoer/state

The dmesg log shows the error where suspends is aborted:

xhci_hcd 0000:00:14.0: PM: pci_pm_freeze(): hcd_pci_suspend+0x0/0x20 returns
-16
xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_freeze+0x0/0xd0 retur=
ns
-16
xhci_hcd 0000:00:14.0: PM: failed to freeze async: error -16
usb usb1: root hub lost power or was reset
usb usb2: root hub lost power or was reset
PM: hibernation: Basic memory bitmaps freed
PM: hibernation: hibernation exit

I'm attaching 3 sleepgraph timelines from three different production machin=
es
where this happened, so it's not endemic to just one manufacturer. The dmesg
logs are in the timeline itself, just click the dmesg button in the upper l=
eft
corner. The log button in the upper left corner shows all kinds of system
details.


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D178231
[Bug 178231] Meta-bug: Linux suspend-to-mem and freeze performance optimiza=
tion
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

