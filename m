Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29123481C5C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 14:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhL3NK3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 08:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhL3NK3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 08:10:29 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1894C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 05:10:28 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id w7so17693018plp.13
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 05:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAZPCK1uvg87sHQvK64/uk3dVFYBSri9o+qXxP1WQHo=;
        b=gxVJlN69MOBb3gTjiUmMuXBJJgyAjf/fKtjdzJ+GaaVFEELYEbRK94vK0a0EMUMnj9
         0/R1Rdyuc3K8z3Fw8nUG0vCLwTvlnyHrCVxxiNfTVHwbQs19AADT3Yp6NRMhemwMCccX
         6ajAbHuaaRnNUB7LsdXLxFX5m3qzc1VMxISq/PDQeF5gdnAPZ0YjYwfo/i7OQLT8KyzR
         7j4wq0QxvCBBeO3sAGyVfH1+vnap0FlmDG9LUpzgoq2CE9nmwXBXB813+mIp4/1xuei0
         +sNXGx5YDlC6JLaExfmQ6GdRQUyUPT2T4ixnkQkfd15MISRf/4ZSgMLOgrSyq2ZWv2nu
         h7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAZPCK1uvg87sHQvK64/uk3dVFYBSri9o+qXxP1WQHo=;
        b=CfrEF/qq9iuJ6V1Wn1ivr4zzlt1cx1vOSbB3TTgpr5jeyLHP6CkwAUcKie1LchfkLJ
         gpoMWDsUEJuHWXVB9P/LboLOtTFSmVesGfWsyp8DIjycQKPtpFrtE7qbf7Q6J6bbLOX9
         /wjzokej768BeMAfj/uM5A0ornwcfU9wOeB/UaHvSWUk23LskZWR8WAhWLM/k3VBa2Us
         D6bKvD7GU7Rs8tpbzilMNiC0juaEWAv7tlJ0T40AkfogcHu6/dGYAx+WGlQ2jGzPo8pO
         Nw1CEOduhjAX+ZAp6P0oaZ7uflTmDLWSNbYuUTORJgZs1RMHcV/poF5G4nyZIn4z95xo
         JULA==
X-Gm-Message-State: AOAM530cZwrczgONg1RuBQsP6/r5Wjzys8zb3t2DMYkadmZvm0f0eqcM
        hj/K9DGjCFBI3SAyFmZawUA=
X-Google-Smtp-Source: ABdhPJzym3fmACuok8dgbP+sNwWP+ZKzBIQLNyaoDgZbYHNatWufJUSyru2lo9eAK3WtsDaD9IzRVA==
X-Received: by 2002:a17:90a:d191:: with SMTP id fu17mr38259075pjb.73.1640869828055;
        Thu, 30 Dec 2021 05:10:28 -0800 (PST)
Received: from localhost.localdomain (ns563253.ip-139-99-62.net. [139.99.62.207])
        by smtp.gmail.com with ESMTPSA id y126sm26430804pfy.40.2021.12.30.05.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 05:10:27 -0800 (PST)
From:   youling257 <youling257@gmail.com>
To:     mathias.nyman@intel.com
Cc:     william.allentx@gmail.com, linux-usb@vger.kernel.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Date:   Thu, 30 Dec 2021 21:10:14 +0800
Message-Id: <20211230131014.21886-1-youling257@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

where i can find the series patch? https://patchwork.kernel.org/project/linux-usb/list/?series=427561

when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only 500MB/s.
cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed, 20000
maiwo k1690 is on /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed, 5000


01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller

[    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced SuperSpeed

[ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
[ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
[ 1191.795049] scsi host9: usb-storage 4-1:1.0
[ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device   1.00 PQ: 0 ANSI: 6
[ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
[ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB/238 GiB)
[ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
[ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
[ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[ 1051.072131]  sda: sda1 sda2

i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe to USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on PciExpress X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be 10Gbps.

