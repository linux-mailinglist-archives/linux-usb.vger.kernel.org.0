Return-Path: <linux-usb+bounces-30770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E75C7253C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 07:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7600334C3B8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 06:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6020F28D8DF;
	Thu, 20 Nov 2025 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuFl3nux"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D7283151
	for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763619704; cv=none; b=ajKVziABs0l/as7gvcgHx+QyvViys7THM2IVjpA/R05vD6+4amtjybJi4B/jsLfXVhMUEbyMqmPKpuGqdTT1W3kS9FsZaR44EFuzV96fYwhypeaPJfTBBFksZsXtG+Pw26tItHmeGDEL/urQWeBrxODQnUZ99yj9w+kQ4S9y2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763619704; c=relaxed/simple;
	bh=rCFICJxIc54ngCiIlBR6RAyfMbPDx0nv3IodpOq/+lY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Y/9MU24chQLJOV+o3QRUfaCMCW47O4f2aXh72BwEBpkjVhbwYX/UdVdWM+c9EbHI8R/fHARL1yJJ0tETtTMQ5x9SWSGncnjiy44haCP2tx7ocxHdx4QpdvRmksi7N67PkTmiFkRxnABKdBiZ+qOVDNcMRZmUXermTjU/J37Thf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuFl3nux; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso718830a91.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 22:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763619702; x=1764224502; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1u+S26kKhgouAEsV6adZ9b+HeJMglqKEoK8fF795p4=;
        b=LuFl3nuxfwqAEhvZ3ZUqnlZBLW+RRTAxEU/HAmLuLWEj5wHWw4IhQXcL40YMvlJnor
         DFgO3Oq/59dUmwnupJFu9H+bv5xREt8kZ/rC5ensrEPkhtZcPjjYE4NrZKerBHen9LsV
         gEnI4Pcf/VjffV0Z34G1cSsU5POlZP4hXD3GVKvJ6nJYZZriPJ6lb9fo7/F53XWepbbX
         sCYWr8ECsD9yfsemdxaATUz4B//832xl1OP+nC88pOqKcGA+JfSSqJl0KKIyAn0jtght
         3Vnmndhf7nLwx9FdcVdbzBc40XupxwJ87qMULrIBBsO7SiEeVKlXRtYDSsXZB3HKcgMm
         Pxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763619702; x=1764224502;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1u+S26kKhgouAEsV6adZ9b+HeJMglqKEoK8fF795p4=;
        b=oXsIEFcPVturrkh/cNslhxg04wWAl73mZaXakaXjsfnFARDfrz+cMiy8QG32LzEz7L
         LybVxtsP1bX6zp95lILpRJO8qgyB0NKcudzda+VmGHNUcn81SfNN8edC/SaELeUYfmHz
         VIIk5Ezewr2c0DDLu/aIIjfoKkyftNf5N3RaKNrXvXrXZq20f4uz23rpU2HZvHUHUcsP
         VF0qgB5dr2lbdB1mtIIhp5Tv/pzT2WRNGa6TL6LCnduAvh22+RxFpIVIM6SLi0zCxQEz
         y+ASTdIiQ4C5ABALnqYFyDGB3PeRJenm5j7d4NtFSH0GIkVqBc1NvT9PQgNLzkjvDEwk
         6vwQ==
X-Gm-Message-State: AOJu0Yy7XdW9XcVtbpfXhBt/92rVpoqd+1z7SXSpdbBqS6Qf4n4z9HUu
	rtB/Dg9qE24OU8NgcN+C/epXRsoSzdEQ0x3oYWlgu8tT+ryz3Z7D5wS5NERnCrkXBx6zYj3EUVp
	KoVlGAom/LcCJ28kAax92+3XZ7b+VtdDJNLli
X-Gm-Gg: ASbGncvRPqnHSL6tzZCnwdRJEsuMTEnvV1SAVmBEzc59dDeWAehS/r0EvRmX9axnX06
	rgGnz708drCeNsNCW6kaBXTzNsvFv6vygNHFsBAlQg6e/R0RR2kbuihv8dZvSoFsOYn2JXgar0E
	Itn/UFhRA9+3p+b+6ftr3qBr7G+Dc+knpUwwW5WGMBfcjORfmuSLCQAewFXLMN8Lqo31uyLc2og
	XU8hVESGVYipzaqFBJxjhu2JCkwBI4C2dgvGHy/cPtDR+2K3Of8UR5ELGSjMQL2teovO0M=
X-Google-Smtp-Source: AGHT+IEQpLXGOEcWRN1mfyJ0bwmJL7iPXXnxKUCpvGydz8B8nCp11QAC+J2TrqVRDCyWchQ6s13gdKlkCGwimXiMVvE=
X-Received: by 2002:a17:90b:5546:b0:330:a228:d2c with SMTP id
 98e67ed59e1d1-347283a2250mr2074719a91.15.1763619702367; Wed, 19 Nov 2025
 22:21:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: stealth <oleg.smirnov.1988@gmail.com>
Date: Thu, 20 Nov 2025 08:21:05 +0200
X-Gm-Features: AWmQ_bkRAqHZzHydZxHHvdfPxoMYizXzpzv2oR6WHQw7sr8xo0IKOTlOwdQsvGU
Message-ID: <CAKxjRRxhC0s19iEWoN=pEMqXJ_z8w_moC0GCXSqSKCcOddnWjQ@mail.gmail.com>
Subject: 
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[3266355.209532] usb 1-3: new high-speed USB device number 10 using xhci_hcd
[3266355.333031] usb 1-3: New USB device found, idVendor=0603,
idProduct=8611, bcdDevice= 1.00
[3266355.333040] usb 1-3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[3266355.333043] usb 1-3: Product: YICARCAM
[3266355.333045] usb 1-3: Manufacturer: XIAO-YI
[3266355.333047] usb 1-3: SerialNumber: 966110000000100
[3266355.338621] usb-storage 1-3:1.0: USB Mass Storage device detected
[3266355.338817] usb-storage 1-3:1.0: Quirks match for vid 0603 pid 8611: 4000
[3266355.338821] usb-storage 1-3:1.0: This device (0603,8611,0100 S 06
P 50) has unneeded SubClass and Protocol entries in unusual_devs.h
(kernel 6.16.10-arch1-1)
                    Please send a copy of this message to
<linux-usb@vger.kernel.org> and <usb-storage@lists.one-eyed-alien.net>
[3266355.339525] scsi host6: usb-storage 1-3:1.0
[3266356.351895] scsi 6:0:0:0: Direct-Access     XIAO-YI  YICarCam
         PQ: 0 ANSI: 5
[3266356.364249] sd 6:0:0:0: [sdd] 61071360 512-byte logical blocks:
(31.3 GB/29.1 GiB)
[3266356.364423] sd 6:0:0:0: [sdd] Write Protect is off
[3266356.364427] sd 6:0:0:0: [sdd] Mode Sense: 2b 00 00 08
[3266356.366194] sd 6:0:0:0: [sdd] Write cache: disabled, read cache:
disabled, doesn't support DPO or FUA
[3266356.388784]  sdd: sdd1
[3266356.388962] sd 6:0:0:0: [sdd] Attached SCSI removable disk
[3266357.036652] usb 1-3: USB disconnect, device number 10
[3266357.036891] sd 6:0:0:0: [sdd] tag#0 FAILED Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
[3266357.036899] sd 6:0:0:0: [sdd] tag#0 CDB: Read(10) 28 00 03 a3 df
fa 00 00 01 00
[3266357.036902] I/O error, dev sdd, sector 61071354 op 0x0:(READ)
flags 0x80700 phys_seg 1 prio class 2
[3266357.042515] Buffer I/O error on dev sdd, logical block 7633919,
async page read

