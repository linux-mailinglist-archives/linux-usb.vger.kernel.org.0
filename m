Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D479E2E0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 10:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfH0IkE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 04:40:04 -0400
Received: from mail-out.elkdata.ee ([185.7.252.64]:33803 "EHLO
        mail-out.elkdata.ee" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbfH0IkE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 04:40:04 -0400
X-Greylist: delayed 321 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Aug 2019 04:40:01 EDT
Received: from mail-relay2.elkdata.ee (unknown [185.7.252.69])
        by mail-out.elkdata.ee (Postfix) with ESMTP id 10C1A372B5E
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 11:34:39 +0300 (EEST)
Received: from mail-relay2.elkdata.ee (unknown [185.7.252.69])
        by mail-relay2.elkdata.ee (Postfix) with ESMTP id 0F50D8308D1
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 11:34:39 +0300 (EEST)
X-Virus-Scanned: amavisd-new at elkdata.ee
Received: from mail-relay2.elkdata.ee ([185.7.252.69])
        by mail-relay2.elkdata.ee (mail-relay2.elkdata.ee [185.7.252.69]) (amavisd-new, port 10024)
        with ESMTP id XQ0zWqYfMQ-5 for <linux-usb@vger.kernel.org>;
        Tue, 27 Aug 2019 11:34:36 +0300 (EEST)
Received: from mail.elkdata.ee (unknown [185.7.252.68])
        by mail-relay2.elkdata.ee (Postfix) with ESMTP id 7245A83089B
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 11:34:36 +0300 (EEST)
Received: from mail.meie.biz (21-182-190-90.sta.estpak.ee [90.190.182.21])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: leho@jaanalind.ee)
        by mail.elkdata.ee (Postfix) with ESMTPSA id 54AAB60BF44
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 11:34:36 +0300 (EEST)
Received: by mail.meie.biz (Postfix, from userid 500)
        id 30C7AA831EA; Tue, 27 Aug 2019 11:34:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kraav.com; s=mail;
        t=1566894876; bh=d61PiOFxTgD5q5f6YC05TEPzakKgZwZUPjGW30URG6Q=;
        h=Date:From:To:Subject;
        b=PwU6fUzUgYTfR6NeV8Sfg4F7obo+AZDV7MVmqL5B15n6BdyocajyjkiJj8GneKXXy
         sa6YUO9Se2t3pSkWKX1q5YbTSm7SZEa8lybz/Z0FnvPITtuZDOARZshmLV+cQF/Y8y
         wpLYpDTJVEi4PJYAdGpuTV7cG25sdR1Tw9XWv8nQ=
Received: from papaya (papaya-vpn.meie.biz [192.168.48.157])
        by mail.meie.biz (Postfix) with ESMTPA id 1E8E0A831E8
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 11:34:36 +0300 (EEST)
Authentication-Results: mail.meie.biz; dmarc=fail (p=none dis=none) header.from=kraav.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kraav.com; s=mail;
        t=1566894876; bh=d61PiOFxTgD5q5f6YC05TEPzakKgZwZUPjGW30URG6Q=;
        h=Date:From:To:Subject;
        b=PwU6fUzUgYTfR6NeV8Sfg4F7obo+AZDV7MVmqL5B15n6BdyocajyjkiJj8GneKXXy
         sa6YUO9Se2t3pSkWKX1q5YbTSm7SZEa8lybz/Z0FnvPITtuZDOARZshmLV+cQF/Y8y
         wpLYpDTJVEi4PJYAdGpuTV7cG25sdR1Tw9XWv8nQ=
Received: (nullmailer pid 11209 invoked by uid 1000);
        Tue, 27 Aug 2019 08:34:35 -0000
Date:   Tue, 27 Aug 2019 11:34:35 +0300
From:   Leho Kraav <leho@kraav.com>
To:     linux-usb@vger.kernel.org
Subject: 5.3.0-rc6: DELL Latitude 7400 2-in-1 (Whiskey Lake) unable to
 `s2idle`, XHC causes wakeups
Message-ID: <20190827083435.GD4124@papaya>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Bogosity: Unsure, tests=bogofilter, spamicity=0.500000, version=1.2.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all


[    0.000000] DMI: Dell Inc. Latitude 7400 2-in-1/0HCNR3, BIOS 1.4.0 06/10/2019
[    0.225802] smpboot: CPU0: Intel(R) Core(TM) i5-8365U CPU @ 1.60GHz (family: 0x6, model: 0x8e, stepping: 0xc)

For some reason this machine out of the box can't suspend on latest Linux, because XHC wakeups.

Only `echo XHC | sudo tee /proc/acpi/wakeup` helps.

No external USB devices are connected.

How do I diagnose which internal devices is causing the wakeup? Search
engines are only displaying results for people bluntly disabling this
wakeup source, but information on how to find out details is hard to come by.

I did not need to disable anything on my previous DELL Latitude 7480, so curious.

```
aug   25 17:24:34 papaya kernel: PM: suspend entry (s2idle)
aug   25 17:24:35 papaya kernel: Filesystems sync: 0.010 seconds
aug   25 17:24:35 papaya kernel: Freezing user space processes ... (elapsed 0.192 seconds) done.
aug   25 17:24:35 papaya kernel: OOM killer disabled.
aug   25 17:24:35 papaya kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
aug   25 17:24:35 papaya kernel: printk: Suspending console(s) (use no_console_suspend to debug)
aug   25 17:24:35 papaya kernel: PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x20 returns -16
aug   25 17:24:35 papaya kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x1b0 returns -16
aug   25 17:24:35 papaya kernel: PM: Device 0000:00:14.0 failed to suspend async: error -16
aug   25 17:24:35 papaya kernel: PM: Some devices failed to suspend, or early wake event detected
aug   25 17:24:35 papaya kernel: OOM killer enabled.
aug   25 17:24:35 papaya wpa_supplicant[1104]: wlo1: Reject scan trigger since one is already pending
aug   25 17:24:35 papaya wpa_supplicant[1104]: wlo1: Failed to initiate AP scan
aug   25 17:24:35 papaya wpa_supplicant[1104]: wlo1: SME: Trying to authenticate with a4:2b:b0:f8:27:f5 (SSID='s62-xt-1' freq=2462 MHz)
aug   25 17:24:35 papaya kernel: Restarting tasks ... done.
aug   25 17:24:35 papaya kernel: wlo1: authenticate with a4:2b:b0:f8:27:f5
aug   25 17:24:35 papaya kernel: nvme nvme0: 4/0/0 default/read/poll queues
aug   25 17:24:35 papaya kernel: wlo1: send auth to a4:2b:b0:f8:27:f5 (try 1/3)
aug   25 17:24:35 papaya wpa_supplicant[1104]: wlo1: CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=WORLD
aug   25 17:24:35 papaya kernel: wlo1: authenticated
aug   25 17:24:35 papaya wpa_supplicant[1104]: wlo1: Trying to associate with a4:2b:b0:f8:27:f5 (SSID='s62-xt-1' freq=2462 MHz)
aug   25 17:24:35 papaya kernel: wlo1: associate with a4:2b:b0:f8:27:f5 (try 1/3)
aug   25 17:24:35 papaya kernel: wlo1: RX AssocResp from a4:2b:b0:f8:27:f5 (capab=0x431 status=0 aid=2)
aug   25 17:24:35 papaya kernel: PM: suspend exit
```

Device 0000:00:14.0 is `00:14.0 USB controller: Intel Corporation Device 9ded (rev 30)`,
no surprise there.

-- 
Leho Kraav, senior technology & digital marketing architect
