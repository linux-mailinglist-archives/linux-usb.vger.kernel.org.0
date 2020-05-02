Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719E91C25F6
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2020 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgEBN4u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 May 2020 09:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgEBN4t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 May 2020 09:56:49 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342CBC061A0C
        for <linux-usb@vger.kernel.org>; Sat,  2 May 2020 06:56:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so15203047wrg.11
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2020 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Io1LXUZNEcboXh8F44BlxRuNoh4z/FowLUBDrMbY0zQ=;
        b=vM0JKQXXn/FVJdPQDGY4mDLNxVkIV3jXntjER4z8GQO2smnPUPGwcFNkTCDDkXTpHl
         esCD0fm2gIfJlasZDfUL5JGgxZhgaMlPqfsfl+z4KrsNtaE9TMfLNaSe+K7eD8mIPmXN
         y3ntHb9dmCfL6IfgTjgY4mWq3Hh4nnftW8OpAubLauDa1o0EDJicf3Jl4uwWsaKLrN7G
         EYM/sfYhxGa2KEk4w7FOQK8hBeaDZgF544SF3ZPc6vcJcIh2w61nI0fmr8YcHnlezZ48
         bSHabDSkiz11zjmZSN2Iy/35eP68QL3O7FTCq33HyNhW0d90LjlGNYoqigDcJ5/tQexH
         xhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Io1LXUZNEcboXh8F44BlxRuNoh4z/FowLUBDrMbY0zQ=;
        b=glAtTHkrrJoFyDEvTLtZV4RYNHbEeFrwVv+GmME4Ys2Gt7n/QnfmhcglE9RSRCAsh8
         WpDbwlada4gWmxlLEqhS4rbVmQZvqF+OMbgkEIaNSRsqN5Vw9oatFgWDpzk/8YrK9Qgm
         SS69ifSjKNWV5HQogzMGKGN1jJFzN5MCaLOvHAT+cml9be65uvysW+f9E+yUIiUWP/HJ
         PtvZmzF6gDtoSqGzpiQDXLspFg5x9V4kBA/Tq2YAydnliHcyHwC5BvfFA/FyixCbrNNI
         LhJi4Kzh9clsuSTPkJzTdRgZgr/qEN3lK17mwJbJB2FjBEahGqNSwWRnki+cPqXkXQdu
         oq5A==
X-Gm-Message-State: AGi0Pub8ln/9W1h+G5LRLKl++5tn6vU50SsTPeY7ufjYnQp3xtywhu5u
        bZzURBjNJvXy7WKaKVGTqtg=
X-Google-Smtp-Source: APiQypIVT9w7D/gPwXeultB8EosbP/2Qs4z+aQFihR0NzqBTRL1XgXMiHzRiWiUmCsNziTDp4JVCLg==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr9338144wrs.230.1588427807582;
        Sat, 02 May 2020 06:56:47 -0700 (PDT)
Received: from [192.168.2.75] (ip4d14af3f.dynamic.kabel-deutschland.de. [77.20.175.63])
        by smtp.gmail.com with ESMTPSA id u2sm7465733wrd.40.2020.05.02.06.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 06:56:46 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: storage: Add quirk for Samsung Fit flash
To:     Jim Lin <jilin@nvidia.com>, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     usb-storage@lists.one-eyed-alien.net
References: <1583158895-31342-1-git-send-email-jilin@nvidia.com>
From:   Atanas Dinev <atanasd@gmail.com>
Message-ID: <bb4db5cf-60bc-9c0f-e1dc-3047542d2b42@gmail.com>
Date:   Sat, 2 May 2020 15:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1583158895-31342-1-git-send-email-jilin@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Jim Lin wrote on 02.03.20 15:21:
> Current driver has 240 (USB2.0) and 2048 (USB3.0) as max_sectors,
> e.g., /sys/bus/scsi/devices/0:0:0:0/max_sectors
> 
> If data access times out, driver error handling will issue a port
> reset.
> Sometimes Samsung Fit (090C:1000) flash disk will not respond to
> later Set Address or Get Descriptor command.
> 
> Adding this quirk to limit max_sectors to 64 sectors to avoid issue
> occurring.
> 
This may need revisiting as it appears to be a performance killer (3-4 times slower seq reads) for otherwise perfectly working sticks.
Going down from 2048 to 64 seems to cause a pretty significant speed degradation.
Here are a few examples:

# lsusb
Bus 002 Device 012: ID 090c:1000 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) Flash Drive
# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
     |__ Port 3: Dev 12, If 0, Class=Mass Storage, Driver=usb-storage, 5000M

# dmesg
[23153.493726] usb 2-3: Product: Flash Drive FIT
[23153.493729] usb 2-3: Manufacturer: Samsung
[23153.493731] usb 2-3: SerialNumber: 0375119090033353
[23153.575386] usb-storage 2-3:1.0: USB Mass Storage device detected
[23153.575514] usb-storage 2-3:1.0: Quirks match for vid 090c pid 1000: 400
[23153.575559] scsi host2: usb-storage 2-3:1.0
[23153.576529] usbcore: registered new interface driver usb-storage
[23153.578645] usbcore: registered new interface driver uas

# cat /proc/scsi/usb-storage/*
    Host scsi2: usb-storage
        Vendor: Samsung
       Product: Flash Drive FIT
Serial Number: 0375119090033353
      Protocol: Transparent SCSI
     Transport: Bulk
        Quirks: MAX_SECTORS_64 SANE_SENSE

# hdparm -t /dev/sdb
  Timing buffered disk reads: 132 MB in  3.03 seconds = 43.62 MB/sec
# dd if=/dev/sdb of=/dev/null bs=1M count=1000
1048576000 bytes (1,0 GB, 1000 MiB) copied, 22,3564 s, 46,9 MB/s

# rmmod uas usb_storage
# modprobe usb_storage quirks=090c:1000:

# hdparm -t /dev/sdb
  Timing buffered disk reads: 452 MB in  3.01 seconds = 150.33 MB/sec
# dd if=/dev/sdb of=/dev/null bs=1M count=1000
1048576000 bytes (1,0 GB, 1000 MiB) copied, 6,51492 s, 161 MB/s


[23612.690798] usb 2-3: Product: Intenso High Speed Line
[23612.690799] usb 2-3: Manufacturer: SMI
[23612.690801] usb 2-3: SerialNumber: 19112500000332
[23612.780771] usb-storage 2-3:1.0: USB Mass Storage device detected
[23612.780895] usb-storage 2-3:1.0: Quirks match for vid 090c pid 1000: 400
[23612.780940] scsi host2: usb-storage 2-3:1.0
[23612.781093] usbcore: registered new interface driver usb-storage
[23612.783226] usbcore: registered new interface driver uas

# cat /proc/scsi/usb-storage/*
    Host scsi2: usb-storage
        Vendor: SMI
       Product: Intenso High Speed Line
Serial Number: 19112500000332
      Protocol: Transparent SCSI
     Transport: Bulk
        Quirks: MAX_SECTORS_64 SANE_SENSE

# hdparm -t /dev/sdb
  Timing buffered disk reads: 220 MB in  3.00 seconds = 73.22 MB/sec
# dd if=/dev/sdb of=/dev/null bs=1M count=1000
1048576000 bytes (1,0 GB, 1000 MiB) copied, 11,5469 s, 90,8 MB/s

# rmmod uas usb_storage
# modprobe usb_storage quirks=090c:1000:
# hdparm -t /dev/sdb
Timing buffered disk reads: 1016 MB in  3.00 seconds = 338.51 MB/sec
# dd if=/dev/sdb of=/dev/null bs=1M count=1000
1048576000 bytes (1,0 GB, 1000 MiB) copied, 3,31022 s, 317 MB/s


I'm using both sticks as a bootable/emergency media (Debian stable, kernel 4.19/no-quirks with X, XFCE, web browser, etc) and haven't had any issues with timeouts, unresponsiveness or whatsoever.

When tested with recent kernels (e.g. Debian testing/5.5, Ubuntu 20.04 LTS/5.4) it's slow.

Setting "options usb_storage quirks=090c:1000:" in /etc/modprobe.d as a workaround for now.

> Signed-off-by: Jim Lin <jilin@nvidia.com>
> ---
>   drivers/usb/storage/unusual_devs.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 1cd9b6305b06..1880f3e13f57 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -1258,6 +1258,12 @@ UNUSUAL_DEV( 0x090a, 0x1200, 0x0000, 0x9999,
>   		USB_SC_RBC, USB_PR_BULK, NULL,
>   		0 ),
>   
> +UNUSUAL_DEV(0x090c, 0x1000, 0x1100, 0x1100,
> +		"Samsung",
> +		"Flash Drive FIT",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_MAX_SECTORS_64),
> +
>   /* aeb */
>   UNUSUAL_DEV( 0x090c, 0x1132, 0x0000, 0xffff,
>   		"Feiya",
> 

Thanks,
Atanas
