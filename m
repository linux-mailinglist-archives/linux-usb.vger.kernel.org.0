Return-Path: <linux-usb+bounces-9877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B974E8B5437
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F66282C79
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE49225D9;
	Mon, 29 Apr 2024 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA/ASG++"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710E1118D
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382824; cv=none; b=EQ3y4iXaQtAg6ATpPq8SokbG2vP8tawhXLnnnH/jq0GywVrgFP+EjwRwZFON9RHZhIuxohm+iY1lds3GPzz3p8/mL1yDMe1J/NSV8XNGoFhhHRJhTmWp1kLNTG+1O7814iPGOMBNMnV6zU5mQguO460Y6N39d61TamE/92Ip2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382824; c=relaxed/simple;
	bh=Jsv4Azy8r92552woDzPGmgCLF6qfpqoGHorvaFKdjz0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I4Y2O2LTd5GrHhgVwrpkFlMx8m+V9ZX00gbYXCZhDrCXPkWn2sEBa5qsfX9Q+z3vhiGoSlM30DhXBQjU3+QooaWoYSmTeX/QryaYawKe0L1ug/xrcBP1sEVgbnMZTh/N2CzvjNIzh2dO+XOJLcikcsAM/OLlV/oaa+yCh6iOlgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA/ASG++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA079C4AF17
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714382823;
	bh=Jsv4Azy8r92552woDzPGmgCLF6qfpqoGHorvaFKdjz0=;
	h=From:To:Subject:Date:From;
	b=cA/ASG++/cVUMN9ARqf/i3XeZi+T/aOlBBbQ/eZYvhbPu1Ay9PX3QPu80NSZJ3gvz
	 ukKTbqb7168n0M4I0Mrd5p2RvxvIHEf6ZVaF+JUcMYqzO6xqWHYeWRPJpXtc7Atncz
	 y9JNjmKKbO7ILmI6VmnjdjBo2ePhE4HkRXMS23Do8tTVaEwewZIuDcKoiDtDIvtsLg
	 w9ydo7uQZN3TyP99iwBPPdfPyXmeSD9qQsdp8OdsG/k1kdX26YzoFb1TAkrvv2V04D
	 tU6USqv+6egu1H5Hq+V6j2VDYJO7qUekrRlvtlP4UUG2mTdplcUKCDmmKxfuYa2+b6
	 RHWc0ggQOyzzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEC0EC433E5; Mon, 29 Apr 2024 09:27:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] New: ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to
 evaluate _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:27:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

            Bug ID: 218789
           Summary: ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to
                    evaluate _DSM 2 in logs
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: webcapcha@gmail.com
        Regression: No

Every single boot I observe error in the journalctl logs

"kernel: ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate _DSM 2"

My devices specs and dmesg log are in the attachments.

Is there a way to get out of the error?

If I have to provide additional info please tell me

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

