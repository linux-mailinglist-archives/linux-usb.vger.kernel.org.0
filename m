Return-Path: <linux-usb+bounces-6003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222A84CAD6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 13:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 674081C25A61
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 12:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4B776044;
	Wed,  7 Feb 2024 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEgkQTp8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5022030F
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707310099; cv=none; b=CySV/n6CT9WZ2S5EJjEYlKg5mE/VoCsmLOs/mjv/O4mSssHl9KWXlKR1qVUZgO+q22b3cXJmhrSvw7SmCGerh1tVrN5B90/mX5S7U8ny022EDuE6zq10GW3gmfwOn5DSjm1XSlXz4vF331JOmuz/dYza85WW3CtUfyEUMv7sESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707310099; c=relaxed/simple;
	bh=UWLZu71OwMizV75jU3WWzPF4tDVtS071fe3fly4GTjE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=RBqDsawSbOgvcVHF8MK6+KJLGFJVY+Uyw75HCxoKOt02b5bVVH+oITTCU0Vo3oXD2A8qMAH6YE2Uc14MesRPuRbGB21zXNrbGrHP5m6Fbwc7proVEtfulQU5FbcygjqnmwOxP/LOdNKX9E5G5UeTRfVNt9TDpzftYcSFLzQSzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEgkQTp8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e05f6c7f50so340853b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Feb 2024 04:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707310097; x=1707914897; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdgnEiFisG6doq+tFpUV0nJHSWC2e+rbQS3z7NWXE8w=;
        b=eEgkQTp8p+t63cUhkLMm5aE1zaca+r9S9cUjo8PZeZnKueAJUeel4emR6z3XIbxRsa
         9oqSbGcSlCcbhX0XIiNi2uIPzbPUk8Hhlq0Q9Egn5grqOTIe6l2f8j77HBr/eNmGUkHS
         8Yr7EJlaoMaJcsC929JrUJC6Y2HuLuCttQ9MsCpgs5WShMeM51/TBPctB7MHVT3H0Izb
         ef0IiT14RqLyDPKCG+uY42F0u2n3xykGTRLVRsU2ldX3zxjbJRa1brgDl+EkfGg/5Oo2
         79fpjyLNYtBvBuDbTZqPdTCJ6DIQex2c7bFoiBb677H5somkcYmS3VNAxgcgo+iKo8ht
         8u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707310097; x=1707914897;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xdgnEiFisG6doq+tFpUV0nJHSWC2e+rbQS3z7NWXE8w=;
        b=VCB9cmqF3mWJz2gbPEqZPxvrLJcvGQAIvDFa9DrGs+e7C9/Y446x5MndMAUBZKwyn6
         bGa94tbFQbWboceNBxoSGvEFiM7pBtHC3BrlAHDnStk2nQyN1qmDl8FSuA0j3DCu/TAs
         TclAPs+SO9j+PSbt8T55PxycyGWO3Up8hXOgXPVxpQqTqpp7TKjlyY9aLrUHunwdJlUr
         tqdy4y3cncSpn17krjrS72azij2GTxuTLzr+Om8nELEFj6W4VpngXsMK6M5oBvIJiKzt
         7QQmx5e0VrfIQBFwuqGnQ70c72qcdfiax/LKvMbe1jmmFG9cuwM0JH8R6ebAKZufvpL/
         JXhQ==
X-Gm-Message-State: AOJu0YxqjIZlJu6lbZqIKuRMMjN31MfmNfBujOo9SIbeaZx9iaHowJQd
	oRXpkCDXCvquk3SAmATOC/1CeOC54yzNV7Ifj3kEEb3hDpzEyJ9Ro1Bd4uxh
X-Google-Smtp-Source: AGHT+IEkPgrAvYBG0D/SsoGpJfkQD5bnrYo+bysHaOmEi/velhE6SRhxYPiTyx+xm5crbPGnDjcz0g==
X-Received: by 2002:a62:5fc6:0:b0:6e0:5281:e0d1 with SMTP id t189-20020a625fc6000000b006e05281e0d1mr2402653pfb.1.1707310097383;
        Wed, 07 Feb 2024 04:48:17 -0800 (PST)
Received: from [192.168.1.120] ([58.7.160.150])
        by smtp.gmail.com with ESMTPSA id t189-20020a6281c6000000b006e047a34834sm1466879pfd.182.2024.02.07.04.48.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 04:48:16 -0800 (PST)
Message-ID: <b133097f-0793-47bb-953f-4c31a721a5c6@gmail.com>
Date: Wed, 7 Feb 2024 20:48:12 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Content-Language: en-US
From: Mike Miller <u492758@gmail.com>
Subject: Tell linux-usb@vger.kernel.org to add your device to a proper driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am only doing this because dmesg has told me to :).

I am struggling to get a cheap arse Chinese knock-off Arduino Nano 
working on my

Linux MyLinux 6.5.0-15-generic #15~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC 
Fri Jan 12 18:54:30 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

and I get the message

[ 2840.099780] usb 2-1.2: new low-speed USB device number 8 using ehci-pci
[ 2840.210523] usb 2-1.2: New USB device found, idVendor=16d0, 
idProduct=0753, bcdDevice= 2.02
[ 2840.210537] usb 2-1.2: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 2840.211335] usbserial_generic 2-1.2:1.0: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[ 2840.211338] usbserial_generic 2-1.2:1.0: Tell 
linux-usb@vger.kernel.org to add your device to a proper driver.
[ 2840.211340] usbserial_generic 2-1.2:1.0: device has no bulk endpoints
mike@MyLinux:~/Arduino$

This something you really can address?

Cheers

Mike



