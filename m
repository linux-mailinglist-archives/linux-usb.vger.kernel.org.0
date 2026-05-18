Return-Path: <linux-usb+bounces-37575-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAQFK+G1CmoB6QQAu9opvQ
	(envelope-from <linux-usb+bounces-37575-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 08:46:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56090566E85
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 08:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCDFE3004931
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 06:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA9E3C1F37;
	Mon, 18 May 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFLTQ09f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918D380FFD
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086815; cv=none; b=HE5U5E8LnHhxw3EVuOZ1SiILgIxRIhaZSikBMWAlIaS6eZ6cUw5lfyBlflWfpO5UPPN1GVF73LpcePC0af3LlVHSxbhSKhFAdY09uB2iEnM6atu+uLosTC1Twf51u56QDE4I2MFalk/6avY1L92YYt7haq6bBiSIT8th1zi4ktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086815; c=relaxed/simple;
	bh=rvMG2WzzM7DPviAzAz1n9hBNlKv9P04YcncPa6PUsDE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRfZfgw6ErAGOY3x+W9QQf3xT+ZZ1L/9VPxw5AhIdHe127rzCz1PLn7AzwO9G/NgE8/V/+9W5b5U9hwzzFlwS5o8O2MkRKRrGllq4xFkgFvgYO6AoqA8ildcCTG/LLWDPUicIkhzM//hi4fsfB7P3YpHhQS9eQ06dpREcZUGi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFLTQ09f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso14096685e9.2
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779086812; x=1779691612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mFXyzrM9yDHoBL7zTKgPeCpz83tVhqQtJMltbmXVc=;
        b=pFLTQ09fLnTz9ML2vunIuFsQrPZc51PdrPCWBOyZs9jQ8n7vGIuTW2MHqM8SMmkowq
         ThpfM0DtJ/RYReYcSD7EnCTj8tlfm1HQual16Yh50F6PmPb9z+KfuSe8fczytQEBwbo6
         4phM3Sq3/sQxcgDYcYI8Tjntt8gvZE5AYllCCgvBvJmh65keUwsGq4Rm0XsSj9vo7mTr
         mia75bhVKtfVKxGGmOY0MhLS7naMem1yxsgikMQHZNexJLUsbXfD869Kk7vV+Ehlr+xc
         EQA99Dz093Dvyj4pq+8HJvyLTiZvNkysH9MJO87wMJJnrAYI/TiZGo7VPeIpIKvcuQwG
         TAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086812; x=1779691612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36mFXyzrM9yDHoBL7zTKgPeCpz83tVhqQtJMltbmXVc=;
        b=jQrlJ/XI+KQmukq3GnTvlXFVC6iJ5K6I/11LDtyrV2RX4hkHjOk8Do+0OXXBRhZBFE
         +HKNXHOTxDCDUphYqUiEybTgFgIhsgJqk/6mMQTrYWu8kATMMxyGFmJvlzFiuNeGdLek
         4uWWdCr9v0fpu4Yzszb/foYelrx+G7VrNQPXUdf0OGrlStOnOxLwaM6wXaoKSGhIEwwo
         SSlyPu9PvQVCbHpH/zknp55OLZdAbq6x3I+QkfN6DnWMy9kCp9qCuaJArjuxuQ6sIkTH
         ifoZoF79JVEg+QbsibZhes7oZjO+qOI+c3iT5qvdq6B/z8p6vDlgHXtUMUGGPwiriHEl
         C+Zg==
X-Gm-Message-State: AOJu0YxGvbB1i0Y6GvPpGnRb6gTBETmIr552ZGn3LautKEHWwDXsHO9B
	FN7AESTgebFVf45u68xIk3m+ZXhoxch8xh7GQ4ko1KS02jTVjoXm3rvd
X-Gm-Gg: Acq92OF1r1zePnOyy4LqiArdgUOjwOEevisf8rxjvEB/ZF7YcsPFD0dp+n5T25H4ytf
	1KmOOP2j2EFP5zPSePGS54oG/3DSBzjPqWHul6rkfiYV249F0PQkUPBCpoQFMfWrvm3OlER8FY0
	Cxed5MjbKbqXbibrpNjO7/043f6kIka5nJC4Qz4Jkb8blWg+mEIMF9WDqbPPI/pWughNAbPLsj9
	UoWctQ4lhtGKU8TIqiuzqwsZJr5N7ohmB/cC5qJQvC65Ku3lIxI991rW0REwx6qstSGv7sV37KK
	5uAc/T/6lxeBBFd6N0yaCkTrT6nA3Cn6IYy5uHI0VnqSvMXBrH6lA2FojiAFY+DJQRSsIsw7uLO
	PiDOwDhMgjZiO/1y2Uz5hQYSQA2R3/dHA3HDBGb94kknBKMycgM/OUWWCpq+Dhd8Yp0Dt509FDr
	BMY3lYpdMNAuUtlPVFgBZ9/q5Y3qWituSE0VLnBKtXKak=
X-Received: by 2002:a05:600c:c096:b0:48f:d1b8:9aaa with SMTP id 5b1f17b1804b1-48fe60e525bmr153251975e9.6.1779086811657;
        Sun, 17 May 2026 23:46:51 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm85403565e9.9.2026.05.17.23.46.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 17 May 2026 23:46:51 -0700 (PDT)
Date: Mon, 18 May 2026 08:46:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Anders Thomson <andtho888@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: renesas 1912:0014 failures
Message-ID: <20260518084648.00fdc77e.michal.pecio@gmail.com>
In-Reply-To: <CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
	<20260512122719.51338042.michal.pecio@gmail.com>
	<CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
	<20260512190203.5695eb7f.michal.pecio@gmail.com>
	<CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 56090566E85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37575-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 13 May 2026 00:34:02 +0200, Anders Thomson wrote:
> Here we go:
> [  469.798260] PM: suspend entry (deep)
> [  470.046476] Filesystems sync: 0.248 seconds
> [  470.048616] Freezing user space processes
> [  470.049453] Freezing user space processes completed (elapsed 0.000 seconds)
> [  470.049499] OOM killer disabled.
> [  470.049536] Freezing remaining freezable tasks
> [  470.050449] Freezing remaining freezable tasks completed (elapsed
> 0.000 seconds)
> [  470.050516] printk: Suspending console(s) (use no_console_suspend to debug)
> [  470.051839] xhci-pci-renesas 0000:03:00.0: Get port status 9-1
> read: 0x2a0, return 0x100
> [  470.051866] xhci-pci-renesas 0000:03:00.0: Get port status 9-2
> read: 0x2a0, return 0x100
> [  470.051876] xhci-pci-renesas 0000:03:00.0: Get port status 9-3
> read: 0x2a0, return 0x100
> [  470.051886] xhci-pci-renesas 0000:03:00.0: Get port status 9-4
> read: 0x2a0, return 0x100
> [  470.077248] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
> read: 0x2a0, return 0x2a0
> [  470.077264] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
> read: 0x2a0, return 0x2a0
> [  470.077276] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
> read: 0x2a0, return 0x2a0
> [  470.077292] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
> read: 0x2a0, return 0x2a0
> [  470.077501] sd 7:0:0:0: [sdf] Synchronizing SCSI cache
> [  470.077635] xhci-pci-renesas 0000:03:00.0: config port 10-1 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077818] xhci-pci-renesas 0000:03:00.0: config port 10-2 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077825] xhci-pci-renesas 0000:03:00.0: config port 10-3 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077833] xhci-pci-renesas 0000:03:00.0: config port 10-4 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077842] xhci-pci-renesas 0000:03:00.0: config port 9-1 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077847] xhci-pci-renesas 0000:03:00.0: config port 9-2 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077852] xhci-pci-renesas 0000:03:00.0: config port 9-3 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077856] xhci-pci-renesas 0000:03:00.0: config port 9-4 wake
> bits, portsc: 0x2a0, write: 0x202a0
> [  470.077859] xhci-pci-renesas 0000:03:00.0: xhci_suspend: stopping
> usb9 port polling.
> [  470.078452] r8169 0000:02:00.0 enp2s0: Link is Down
> [  470.083228] xhci-pci-renesas 0000:03:00.0: Setting command ring
> address to 0x2476001

This looks like normal suspend, no indication that the chip failed
to halt or otherwise appeared nonresponsive.

> [  470.085447] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [  470.085685] ata1.00: Entering standby power mode
> [  470.089467] sd 3:0:0:0: [sdd] Synchronizing SCSI cache
> [  470.089471] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
> [  470.089498] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> [  470.089976] ata3.00: Entering standby power mode
> [  471.185801] ata4.00: Entering standby power mode
> [  471.923516] ACPI: PM: Preparing to enter system sleep state S3
> [  471.923767] ACPI: PM: Saving platform NVS memory
> [  471.924004] Disabling non-boot CPUs ...
> [  471.925486] smpboot: CPU 3 is now offline
> [  471.927750] smpboot: CPU 2 is now offline
> [  471.930012] smpboot: CPU 1 is now offline
> [  471.937302] ACPI: PM: Low-level resume complete
> [  471.937330] ACPI: PM: Restoring platform NVS memory
> [  471.937770] Enabling non-boot CPUs ...
> [  471.937814] smpboot: Booting Node 0 Processor 1 APIC 0x1
> [  471.948497] CPU1 is up
> [  471.948526] smpboot: Booting Node 0 Processor 2 APIC 0x2
> [  471.958206] CPU2 is up
> [  471.958233] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [  471.967051] CPU3 is up
> [  471.970459] ACPI: PM: Waking up from system sleep state S3
> [  471.973104] usb usb2: root hub lost power or was reset
> [  471.973129] usb usb4: root hub lost power or was reset
> [  471.973229] usb usb5: root hub lost power or was reset
> [  471.973248] usb usb6: root hub lost power or was reset
> [  471.973325] usb usb7: root hub lost power or was reset
> [  471.973345] usb usb8: root hub lost power or was reset
> [  471.973735] hpet: Lost 1253 RTC interrupts
> [  471.973898] usb usb9: root hub lost power or was reset
> [  471.973901] usb usb10: root hub lost power or was reset
> [  471.973904] xhci-pci-renesas 0000:03:00.0: Stop HCD
> [  471.973906] xhci-pci-renesas 0000:03:00.0: // Halt the HC
> [  471.973917] xhci-pci-renesas 0000:03:00.0: // Reset the HC
> [  500.363392] hpet: Lost 1815 RTC interrupts
> [  500.363631] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
> [  500.363635] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> [  500.363715] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> pci_pm_resume returns -110
> [  500.363725] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> async: error -110

I see you still have the quirk, but it doesn't matter, the chip is
stuck and doesn't work either way.

I don't know what causes this, looks like a low level problem - in HW
or possibly the PCI layer. Maybe Mathias will have other ideas, but
I'm not sure that USB subsystem can do anything about it.

Regards,
Michal

