Return-Path: <linux-usb+bounces-36078-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aASfA4+h1mlUGwgAu9opvQ
	(envelope-from <linux-usb+bounces-36078-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 20:42:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B53C1471
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 20:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 872CA3027416
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 18:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43573D75AF;
	Wed,  8 Apr 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLhYFVCG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AF3B19A3
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673465; cv=none; b=OBWS3lL8/SnOXX0HU+LpZLW5gg9vXbwrNtt2OpLNk+m+69O9jhxa+HmYheAWZDGRHx9yMwnLcJxX7Vglz5oME+zQ1ck1oHy3hEpIcL6QMztLaZuEkrujLgQD2VQ+VOe9vpO4oj9Xegra5mZug6oiGMroVWnszbsoeDM6MCLzh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673465; c=relaxed/simple;
	bh=X+KuMhWmjKp5MqE7yRFJVr1IwP9hDO2cQ12R/Sp/F1M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hV/A6mJ5LNVm01XUA0DAcnZpV8HV4jh8bZpLUoCEhYA6DxA0Y4ddJopJ/TuTYfOj3OMGiHLp/1RPrZTu39FJnssJVMrWvokvlH08iDln9Nbifv5Jfv5kkjmPSH31ZRD5hJEC6NHzGjivzLJEpR9D5jAnuNgKgVHk8MVkTch96m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLhYFVCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 104C1C19425
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775673465;
	bh=X+KuMhWmjKp5MqE7yRFJVr1IwP9hDO2cQ12R/Sp/F1M=;
	h=From:To:Subject:Date:From;
	b=cLhYFVCG0FGutZVsJE/pkrkqMU+6dYoHTLXp4b7NE5gR1UQkoIt9z4Ltl9V32Wbbm
	 P77Aio7VPJJd757o2TR3YVeVXmUEOFYc+5h+3529zJUj77fSZX+afi8nbHTlEamY+k
	 ZidH2qo4YP0Fchg91/MHc1obsppB/p0R7WYafWAK21oBcFeqNw52U80sqy2I2HCI1v
	 827lNj1Bb1fTmGdOACbvJ34iXHxP5H1yOcTxZKCrxYYiBvH4P6zE0gBYf9f8vlQuUn
	 /aaKHnFA7AuiNaLUeO72liJmLIVK54FzJhVOQt5iL+gc3Lp0cZQgaOdIvuie4nX6mk
	 mZWj/9TjzFBsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02B72C433E1; Wed,  8 Apr 2026 18:37:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221337] New: Regression: USB webcam (0bda:636e) fails to resume
 from suspend on 7.0.0-rc6
Date: Wed, 08 Apr 2026 18:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chromechris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221337-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36078-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 115B53C1471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221337

            Bug ID: 221337
           Summary: Regression: USB webcam (0bda:636e) fails to resume
                    from suspend on 7.0.0-rc6
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: chromechris@gmail.com
        Regression: No

USB webcam (Realtek 0bda:636e, "ASUS 5M webcam" by Shinetech) fails to=20=
=20=20=20=20=20=20=20
  resume from suspend on kernel 7.0.0-rc6. The device disconnects after=20
  resume and does not reappear until reboot.=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20

  Kernel log on resume:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -22=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: PM: failed to resume async: error -22=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: USB disconnect, device number 2=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20

  The device works correctly on a fresh boot and across suspend/resume=20=
=20=20=20=20=20=20=20=20=20
  on kernel 6.19.11.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

  Hardware: ASUS ROG Flow Z13 (GZ302EA), AMD Strix Halo=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Working kernel: 6.19.11-1-cachyos=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
  Broken kernel: 7.0.0-rc6-1-cachyos-rc
  Distribution: CachyOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

