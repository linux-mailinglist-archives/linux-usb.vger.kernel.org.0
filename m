Return-Path: <linux-usb+bounces-32189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3463D136A8
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D13BD3017017
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3050D2701CF;
	Mon, 12 Jan 2026 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g82B3vAa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61A1E1E16
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228976; cv=none; b=uC6YAN2WES9vloQo8ClciRPc5lMKmsL1aAHxvfpevI3blJ++VdRKe2SNl8+WHGDNX9iMmFzE6gx1egDwuUy/dXLiMwDFCreEYLHoHBW3s7+7FHIxYAksFKSQWf3ViVtr+WOrT+yE7Zjhhp902ScCZI3yOmmKhKbdUj0kGIWjlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228976; c=relaxed/simple;
	bh=60OR38GxgqNbGBfyrJQXg6EOoliOh0K2Ng5TbNjN0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZltBWXtKb3fwfDOiHGdDWzGyL7IT8/DctZCmjYuj5nt0dz+qzffuC58scgWlhb/30qtSVYbFUg7R8EOBa/vXkYjtgx5V5ESDR3N7bK+gbhtvlqKIgwwMyCTudsJNNC2BpebBgD7Epd+XAdaCw1Sqau8XWT4CLLbz9kT0z4Ol4Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g82B3vAa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so71249335e9.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768228973; x=1768833773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m3yfBVkoolRxVNq2Krf8+6Hj0kUgAEyoP2VFU9cwmDI=;
        b=g82B3vAaUnWCU18aL3HRPhQ2SM52Xq8Hj5xgD5Wpao5P6vRAOVdcR7WhtNK8P8TDAt
         PIk8efEscbAwmfT1bw10vJccKySp9HrVqTLMxH6CtU9dpYH/aDI1TVuPsiAv+22cSeOP
         DXh4cBWGLdEJCTAk5gMlnqMJK8S1cqUJvGrm9c/vS2s/LqNE90tY6SKfy6ly8e0ZcbNv
         RhQMw9tArPirTiwmpn/nVHDzn1whEK8VvLxLl0pMgjtd8qrYSOeMq/IHZ0/sz6t7LCqG
         D8Fg8jxCoxGzyVhD7iK5pqbLG+TP1GN0KmNWUNmbu9NOr6M6bsehJj/0W6RyhdiRXgpa
         NGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228973; x=1768833773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3yfBVkoolRxVNq2Krf8+6Hj0kUgAEyoP2VFU9cwmDI=;
        b=fWPwPuiWQbk76np5ZPm6+cnXHioBHradUAl+UhmITQjnymmxxv4BNbCYK0Tbk2taZj
         AT0pJrfMdcpnwA+v+lRCv/GRR4BRnBitCJ9SHls5gPDMEyyK6L/e6oiAFC74pLrmQdLu
         /2O8ru8ltwZkDeSkwIe284CamUj9Kh0ZZCK4VZ3mt4YdozlF5w65yTWTODNl/8Hx1ciy
         jBiX4H1yDSzTRbTx5ck7yowdbx9fOM+SZDEFeS4ZUoQd6ZnV7kDwN4VcsOZdvkboMm1L
         WhMzmdW+NGVyc5jF2Rwbdq2CnZUfBZSkQrQ+UnHWNh11sVdb03Tmup4kSZ5+wlsdW5IU
         MLxA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ajSxllcUeKWdl1ex3Si8MGAJ8xZU6ml0p3GJqD+TiDEYff+k75Hx4O7B8WS/FMfJAQhezcyJ/ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjBeAwe6WI3tpeYj10Y7F1Jbt/v79wHEWTHgF0kZDFE9adu2E
	mebtH6+OKj57Kbl9M2V3PE8gFZlUu2RiXiDSl79AiFe9AG2RvevIKaKvOCtJBqiKA/Q5iYr3JOZ
	hfd+sp0I=
X-Gm-Gg: AY/fxX5aIHrYj6sV3Oo3/y8Yd9tAOys3hGx6QE+ev3vELvO5Shm+jbasrJ3aFCregpP
	lyvA+0JuPgMXKq7S0gmQEZfQWCnjD0vIefaSP9JybRwIIDXUn3+fI0dWSe33mf6RQVhmEH+eWr/
	I9NrpCXE9Oq3eSnsAXVwHvsCU8t274PPXfVd5N444IoQ+ff4YxlY2CIn0W3jmKJ5DXdjDTPD1qF
	kI7z27GTMA1Cyeq3mG+FUK/ZkG9ilIYrPnmXFu1Nnml+z7bVrlmWfTDN9qqgVSGQIacRKvAP7Jm
	3NEFAtOyc6YYNnQo+cJ10SEnZ1MjYi16/V6f8SEhhKMoiTpTflhszHJY8kc+HA8IX0m1JlDGkpH
	Tvah62x3NJ1iqAjbkR4e/vhd5opIsg5if3/dXsi+bCEEQE3IuiMyMCJmalc82pip9zCYHr5E3vA
	RGFj/5WTJVtNTloL3V9RkULCTb5yrot+yrc1EOB2FD8+GN10HScIWbFMg=
X-Google-Smtp-Source: AGHT+IE+9hidLlIhG5XkVZNty5th97HIbJz0T8VdI2pKLSM7UqyNRd5RWjNdh9rQvzcfXCm0BLl97g==
X-Received: by 2002:a05:600c:4e49:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-47d84b172bcmr207593345e9.11.1768228973442;
        Mon, 12 Jan 2026 06:42:53 -0800 (PST)
Received: from ?IPV6:2001:a61:1384:5201:596d:baf2:9af9:9ecc? ([2001:a61:1384:5201:596d:baf2:9af9:9ecc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653cd6sm376740045e9.9.2026.01.12.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:42:52 -0800 (PST)
Message-ID: <ea5b932c-bfa6-40f5-b33c-11bfa4daf7a5@suse.com>
Date: Mon, 12 Jan 2026 15:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Intermittent mount failures with SanDisk SSD PLUS over USB
To: Steve Bravura <stevebravura52@gmail.com>, linux-usb@vger.kernel.org
References: <CAFkb6ArxO79Po_kdoQ9P7-GSrzy9gs8THnfkxJ9x67Dcvg6ZfQ@mail.gmail.com>
 <CAFkb6Aos7pJc_X_W+yqh-oCTothAGdqamU4wTXgmzBuPy750pQ@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAFkb6Aos7pJc_X_W+yqh-oCTothAGdqamU4wTXgmzBuPy750pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23.12.25 19:50, Steve Bravura wrote:
> I wanted to add something important:
> 
> 
> sometimes, when I connect the Hikvision SSD, with the 70609-CM321
> SATA->USB adapter cable, it is not seen at all, wether by gnome-disks
> or Thunar oe lablk, as if i didnt connect it
> 
> 
> 
> 
> this is while it is still connected:
> 
> 
> vlad@vlad:~$ sudo dmesg | tail -100
> [  428.265776] sd 2:0:0:0: [sdb] Mode Sense: 43 00 00 00
> [  428.266013] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [  428.326807] sd 2:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
> [  428.326812] sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes
> [  428.347106]  sdb: sdb1
> [  428.347209] sd 2:0:0:0: [sdb] Attached SCSI disk
> [  429.960018] EXT4-fs (sdb1): mounted filesystem
> 695f6948-f448-4cd3-abec-51e9842bb6cb r/w with ordered data mode. Quota
> mode: none.
> [  433.115100] EXT4-fs (sdb1): unmounting filesystem
> 695f6948-f448-4cd3-abec-51e9842bb6cb.

Did you or did you not unmount the filesystem?

> [  433.231186] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
> [  433.575528] sd 2:0:0:0: [sdb] Synchronize Cache(10) failed: Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  433.611262] usb 2-1: USB disconnect, device number 6


> [  454.029833] usb 2-3: new SuperSpeed USB device number 7 using xhci_hcd
> [  454.054443] usb 2-3: New USB device found, idVendor=0bda,
> idProduct=9210, bcdDevice=20.01
> [  454.054463] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  454.054473] usb 2-3: Product: RTL9210B-CG
> [  454.054480] usb 2-3: Manufacturer: Realtek
> [  454.054486] usb 2-3: SerialNumber: 012345679039
> [  454.057359] usb 2-3: Enable of device-initiated U1 failed.
> [  454.057850] usb 2-3: Enable of device-initiated U2 failed.
> [  454.072008] usb 2-3: Enable of device-initiated U1 failed.
> [  454.072575] usb 2-3: Enable of device-initiated U2 failed.
> [  454.075213] scsi host2: uas
> [  454.078852] scsi 2:0:0:0: Direct-Access     Realtek  RTL9210B-CG
>    1.00 PQ: 0 ANSI: 6
> [  454.112835] sd 2:0:0:0: Attached scsi generic sg1 type 0
> [  454.119771] sd 2:0:0:0: [sdb] 250069680 512-byte logical blocks:
> (128 GB/119 GiB)
> [  454.121212] sd 2:0:0:0: [sdb] Write Protect is off
> [  454.121217] sd 2:0:0:0: [sdb] Mode Sense: 37 00 00 08
> [  454.124538] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [  454.189972] sd 2:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
> [  454.189977] sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes
> [  454.249751]  sdb: sdb1
> [  454.250136] sd 2:0:0:0: [sdb] Attached SCSI disk

Did this work or not?

I am sorry, but could you please give clear examples of working
and non-working attempts, marked as such?

	Regards
		Oliver


