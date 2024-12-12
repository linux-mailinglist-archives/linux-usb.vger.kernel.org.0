Return-Path: <linux-usb+bounces-18433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F739EE7F9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 14:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4F6188918F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 13:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA917211A0E;
	Thu, 12 Dec 2024 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lcRkd8TJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F62101A0
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734010970; cv=none; b=PHAham4I1iUFnrzC3taif9dgofc1IEVKXIP0x7/ma15fhhwIKri1SpbQG75HeUAGVWvmXytL7gI6zEhlJkehkLe988b5vApwEeTeyxmZKRiOqoa1J/vnaEnCjaQyMVT0poR3gRjr7C23Nn19lwIyFemANZTcGOX3cJC5Bz21mIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734010970; c=relaxed/simple;
	bh=TJaPEhN5dPL7qghbv4Shmz5FEwWiDm5qF51LO8/zbYw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gFHWerZ92Qex6endXVZLlKKPJE0p+xWQ/IacUdoj8rgWNm9qrG0ChTFRZpo3ZfLl+HwwzwL2+MUR1XTM8W88Vqo8u9FaupBCs7SiMaLhaIwMlWEAA5abe7wVlRiSX4Ilqrqa+rWrVxAkUQncjy8S9SQyQjrIqa1Xbuq1M+Nk9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lcRkd8TJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166022c5caso5235245ad.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734010967; x=1734615767; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ioEgptBGStQecowb8hsxs0yHbIexmBpWuNeY3q3dqBE=;
        b=lcRkd8TJIFEFCwxZI6oshFcrJnWNW8PHlYsmtzA2P10fzNWW7tzdx9v/FqvndeEWDF
         Wv503adS42ZvC2aqo+S1nvHdpLux2fJO1kNmp+3WVg9JPuayOeR6RDiaD2utPhFsypYj
         mCJpa456+weR2xDKAzxwqeWqWVCRkUphRV+ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010967; x=1734615767;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioEgptBGStQecowb8hsxs0yHbIexmBpWuNeY3q3dqBE=;
        b=pD0ykJ2SjrjYuLs8daNhKzB5ymhWgTA/ST3shrYjv7FWzrqPjP1OvCZ5/LOiboGf7O
         h3x+6ydSYfRjQEYN0cpJ+QyKoSPTLsS6z2NK1ptWTAnMUt1nnLEIpQ88gM/mk9w0p5Ll
         ltKvrums+syS0beBioyxXCmeGWKaFoVjPq4Sa6ild40xaH6N0FX96rSLUj0O3PtliZev
         ant297yX9Pf7t1EIE0HVEtWn2mgsouYbkeXLh4noL51TziqmJUk9P91/SHVMo3XhD+6O
         jmd/RqOSCR5NCDA0IhsxhocynTmoemfUZwtntG8y2cZN/RrpKZ8C9n+P+qdZmkn4UX8F
         rzJg==
X-Gm-Message-State: AOJu0YwmLA0U79CA4XvOF/Wq3NJudy07paGq38kllhHuWRSb10hY/KMG
	ts655BvqqsQw3XJZIriVQkMlZJ8V0iFLORqLG9AO22/ehBLLaGlNJFao4ea13s/pmJ2DNzMfiTE
	=
X-Gm-Gg: ASbGncs6VZkzfH99yXF2dBoqd37FL+Fuk3Cdb+NqU/9GHSPBZoR/WD2s9wrMzm4kXi/
	2JWFS6W7uSMW/6M+8l9A2srquijoKtf5anXguCx1ix8fkz7YfSyWDSNGHbKuMP+PmuXghNnK3+q
	DyTJM1u/C0nQg/44gB/Pb71BNIzH+tWClNmGKFSzr1pKy65Re9G/cMd3Lc/VEqbwaHpreGGvQ+A
	7b8E6YOEp+hamzMrlGBFr3HzCOFiKuUXNz2TtuImB+3UHicBkYDmLc8uf2Age3LY7edul+MoSLX
	x5XhTlaIbs04VrsIifQ=
X-Google-Smtp-Source: AGHT+IEZzFpHh2AGoGJNBxL77LIQ2f1SFJKNe1mtBrmIwnN7d9Gpm81wODJIxR2lHuY42s/VMzFQ3Q==
X-Received: by 2002:a17:902:d4c9:b0:216:3c2b:a5d0 with SMTP id d9443c01a7336-2178aee7588mr47368175ad.51.1734010967449;
        Thu, 12 Dec 2024 05:42:47 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21632aaf054sm86995415ad.252.2024.12.12.05.42.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:42:46 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so424430a91.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 05:42:46 -0800 (PST)
X-Received: by 2002:a17:90b:38cd:b0:2ee:b2e6:4275 with SMTP id
 98e67ed59e1d1-2f13930a5bemr5226158a91.26.1734010965932; Thu, 12 Dec 2024
 05:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 12 Dec 2024 14:42:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCtZrWAbH14fqoSq9OKv8oV30Df6AnvWGCw3gdWHT3RBrw@mail.gmail.com>
X-Gm-Features: AZHOrDkkeUSv68uFDsthNPVdPT9M9vwSK5vDMlQCWhio0xwm_BfaQRgAl7Py914
Message-ID: <CANiDSCtZrWAbH14fqoSq9OKv8oV30Df6AnvWGCw3gdWHT3RBrw@mail.gmail.com>
Subject: Annotating USB device Location in DT
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm working on a way to annotate the location of a USB device within a
system, specifically whether it's "user-facing" or "world-facing."

There's precedent for this type of annotation:

- ACPI: Uses the '_PLD' property for this purpose
(https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device).
We already leverage this for MIPI camera sensors
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n265).

- Device Tree : Has a property for this within
video-interface-devices.yaml
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/video-interface-devices.yaml#n386).

I propose adding a similar property to usb-device.yaml
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/usb/usb-device.yaml).

The ultimate goal is to have this information consumed by the video
driver and exposed to userspace via the V4L2_CID_CAMERA_ORIENTATION
control (https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-camera.html).

What do you think about this?

Thanks,

-- 
Ricardo Ribalda

