Return-Path: <linux-usb+bounces-17809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF59D696A
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 15:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC8A16165D
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 14:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602A618E29;
	Sat, 23 Nov 2024 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orq5bQ0O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B01C695
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732371921; cv=none; b=qTEMSSGCvntc5heyWzEDb1GPPQzIh4xb4kfCsqNDHS2XUnMuwRckTN93eloB74ij//Q7pLYPF9K0pgYgmtDBx2zSwWE1aYYzqb5UngpAYtFKbEY/e5wM+fZXp1S1uHE6ZkqRq/LovFbztHDG5d3Ack4AAunn/lHbDCO5vbgVVrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732371921; c=relaxed/simple;
	bh=d9paCNUtTAIclI8exRJEv8oo8tuTSJZ73JbFw9U2zos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UElxgh8+ysAF+EjXZF8WjPM5OiqEpe2XqWi7sriOXac9rIc2PxWIOWQqKQ0pF+fXIJSrG06pZWfzMENQTa4sq0AgfOW3Tzcf+BiomCLqEI8THaYwR7YjwQj7ZZ2So34xWms6dKiLU/ZrxekZIOEnlP5MaleC1kDpyNQDIvs+fNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orq5bQ0O; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so24927381fa.3
        for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732371918; x=1732976718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWc1hsS1vI2lcA0sYinoW65Qc486LVTBbqx/HlzYaT0=;
        b=Orq5bQ0Oc5PVJJ2X11FsOHMx2akScnNETjzlq2ldaaItvlLVa5gF1Y9hHl35DzZtsJ
         5VFh1cXIt5o6ABGelcd1y+ei4Nx3yynU0ayKoIFCd1R1RVUiiYrD6DpgRbqj6Qy9AWLa
         WpQC3OgPKPqeIzexZj4c0zxUNs1EHroGe6iV2seEuyJW9DF3HX+AlKpesg0ULfF0GPcK
         /hAL0+bSItPSVMcQSMAnynUGwxyCxn5nD8EucWCOxBy3mJHdUIybGo7kFtcyRAxN2Tov
         syd/8hbSLB1+NDKHoCiIZmyNU/xWx+rz3RDU0XCHa955pgzn1HxPbhPbdkVm3/u9cuIy
         Y+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732371918; x=1732976718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWc1hsS1vI2lcA0sYinoW65Qc486LVTBbqx/HlzYaT0=;
        b=V52cR0WViCT+R5RC1hPCw4lLrlR7/D6qi1638lmzoch+fpMFTdee/Xar2CVwjKihgM
         iCn2nPO2JnPoFDZ3iI/aPSFfRvh9Ui6PIIiA6VidARO+I/wKGwVV3EmQGItjKHs44Nj2
         0j2CHWZgGVuTXhU06FLIheEy9hfl5+MkCZl2F8Dxgp3b1c9kI/ga+i5OHe/+6T+ih9bA
         SsUEWOMpDg9n/3IRnjuk0vi1pFOPG+GAOKR9XwoBoaY9ymNQ6sjAzDY9BSEPV0eC6Utw
         Y5s7Xd+o8TjQYorZSI2IBTpWhfrATpy32wkoNPP9ih7EjVwtF4+LTEwOOsoWEtb8iaHC
         tDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIa3u4r0lVfkSGzTh/CRsiWoxD/Cb9Go4rG717GhsKqsx+2yBUirqZszesli7E4AhlysDMZNZdns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR6Uxeap0TGaUCqPw/x9av3AwIOtOMEWp+JUGwq6E8iVnL9xI+
	9g18Vwz6c8Opfrd/E8nOJzvLvaDesDE+M9nt8hcCzc+J0Ao9EQ+S
X-Gm-Gg: ASbGnctayg1Nsd2xITKD1Yven+V5jdBHKeMG6vCDsbBX4Sj2V3lMIMaspdJhNMHAoVN
	8WvNNLRfC6dD0nqrHa84/WRpAzo9NWVHC/5d8g1qr5MQ3ImOQRbAZt2VyphcLLUybxZVmiVMIHz
	e2Sm5zCRI0C6BNseL5CkTSgL0gOg/Qee0WraxOvnlBGSOcqUKMu9GXSXaiI4x7cGge/9lk4F8uG
	ZRWOeU+a6d2jDqJlPcVXuMKYHe2jaAmVOLGBO5ak/FH2Y0QO/nXCQazB3Ih/Ja5yPY=
X-Google-Smtp-Source: AGHT+IGJ7+Ilw8e8JmKBtqbb5WQ1WYjCBkXEHXGMHG0utjC3CtdioGCerOZQKvCBuWYE/s9GztHRIw==
X-Received: by 2002:a2e:bccd:0:b0:2ff:9494:969b with SMTP id 38308e7fff4ca-2ffa6d20bebmr38521571fa.0.1732371917878;
        Sat, 23 Nov 2024 06:25:17 -0800 (PST)
Received: from foxbook (adqi121.neoplus.adsl.tpnet.pl. [79.185.142.121])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538ea19sm9038281fa.95.2024.11.23.06.25.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 23 Nov 2024 06:25:17 -0800 (PST)
Date: Sat, 23 Nov 2024 15:25:12 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "a1134123566@gmail.com" <a1134123566@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Message-ID: <20241123152512.68853a5a@foxbook>
In-Reply-To: <20241123000209.5qowmsx3dxianl64@synopsys.com>
References: <20241122022146.ykwhz4byhy645njg@synopsys.com>
	<20241122085755.29cebea1@foxbook>
	<20241123000209.5qowmsx3dxianl64@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 23 Nov 2024 00:02:10 +0000, Thinh Nguyen wrote:
> > Long delays I have seen mainly on some unfortunate pairings of HC
> > and device (HW bugs?) which trigger unusual error conditions poorly
> > handled by xhci_hcd. Try with dynamic debug on
> > handle_transferless_tx_event(), if your kernel is recent enough for
> > that to be a separate function.  
> 
> No, this delay is not a HW bug. When there's transaction error, the
> xHCI driver will reset the endpoint. The packet sequence number is
> reset and out of sync with the device. The next packet cannot proceed
> until there's some sort of recovery. There's no usb_clear_halt() or
> port reset immediately after a -EPROTO. The only recovery (port
> reset) will happen is after a timeout.

I think you are right. I tried to repro and I got this:

[Nov23 14:01] xhci-pci-renesas 0000:03:00.0: Transfer error for slot 1 ep 6 on endpoint
[  +0.000380] xhci-pci-renesas 0000:03:00.0: Transfer error for slot 1 ep 6 on endpoint
[ +30.096820] sd 6:0:0:0: [sdb] tag#1 uas_eh_abort_handler 0 uas-tag 2 inflight: IN 
[  +0.000006] sd 6:0:0:0: [sdb] tag#1 CDB: opcode=0x28 28 00 02 d0 30 08 00 02 00 00
[  +0.012009] scsi host6: uas_eh_device_reset_handler start
[  +0.114634] usb 13-2: reset SuperSpeed USB device number 6 using xhci-pci-renesas
[  +0.017603] scsi host6: uas_eh_device_reset_handler success
[  +0.000072] sd 6:0:0:0: [sdb] tag#1 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=DRIVER_OK cmd_age=30s
[  +0.000003] sd 6:0:0:0: [sdb] tag#1 CDB: opcode=0x28 28 00 02 d0 30 08 00 02 00 00
[  +0.000001] I/O error, dev sdb, sector 47198216 op 0x0:(READ) flags 0x80700 phys_seg 64 prio class 0

I will keep it running for a few more hours and if those timeouts
keep happening I will have to conclude that I remembered wrong.

> > before resetting, but the whole endpoint is stopped and nothing
> > moves forward. At least that's the impression I got, I was looking
> > at other things.

But a completely stopped endpoint is *also* possible if you encounter
COMP_INVALID_STREAM_ID. I see it after some command errors on this chip:

13fd:5910 Initio Corporation

> Perhaps this can be enhanced in the future in the storage class
> driver regarding -EPROTO recovery.

It's a universal problem with xhci_hcd, it always resets the host
sequence state on every error, which is against Linux convention,
so nobody expects it and nobody handles it. It's nuts.

One thing I'm going to try is patch it to stop doing this and see
what happens.

Regards,
Michal

