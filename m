Return-Path: <linux-usb+bounces-21138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA9A47B87
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 12:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E69C3B5B45
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DD722B8AC;
	Thu, 27 Feb 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT+V7C4V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DE22B5B1
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654541; cv=none; b=XMTyqBWB781Rw8XeuBpB0Ck3O7xa/5eGg4Eqt0zLNKbI/kxqMrGUYZyNiNCo7YE0AuNHh9rVeeN9Z1BprPHoXn5a0qkC+fjqoCzBgowo9cLLfvw6aDZc52In8RfJ45IhZwWvuBqbsM50C7vb0UmHauG0YjVQfWfTsz0pPxUZJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654541; c=relaxed/simple;
	bh=WawK8gVW5SyTzxKkh2/f/ZfFWmUlYId88jVCpLWeXeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkUysJWGq4QSqneNNmXemjcR/DraXWhgsLfcKoVcS6m/IT4Olihlu/fB5T3ylpr0NUA6TyTTzwqX6rsWB2+QJ9R4TEKkDXmix3dPUGyDjKGQSEhmO533v68T7uGy1P6ZkirL1wXNME5WXRryW6MK/KBK5cFlj8F/6Uwoa9T9SFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT+V7C4V; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4398738217aso7221805e9.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740654538; x=1741259338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNOPHCinbjjurZ50kHCaKgPhASvdGdiYybl9WvVYfQM=;
        b=lT+V7C4VEKZ5hKxfJMneo7h1j2lYBVk2XJcKyh/s4rrN7Hu3dajXFoMYomrUsnVO7z
         8Q/m6e8B9eZS+Gv6wjT5WwlP1zRtMHUObXz89TpV+Z8XgzFK7QrV8NHkvzp/WlxEyR6S
         Nx09qc5omlLLqnZA6eV1a78PpwxS2L9iK1BYt0h7YVp/eDNeNuKCbQFRKfmrfxBpztyF
         bvgPRWh8cscmuSYYgwDkxi3MMD4krnKUK4o0fGeHEYq4S1HxE+NqYkt0RxjWaZ8GhofG
         SK288VMemrgstW4HgyPTw3HYbt/kyVqE9mUkoWuenXZiSp9I/qg+LkhJSL8qutLKpSwU
         3IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740654538; x=1741259338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNOPHCinbjjurZ50kHCaKgPhASvdGdiYybl9WvVYfQM=;
        b=guYjk+lz9shcn4uVXtOOZWxy4JJJE8+kd07U+eDkrD6wFx1ZKMu7blr7pzWMM6/tFe
         DOUKAGCr1YH4COk7266CXoyT1hP4IKj6jHMgbIT7xY1LYjA9DygJavRYdOIczfEF0QB+
         oXjUebroPmXJ6qZ/+smV/fW8US4WiOtFc4zGm9vg7Ky6/I1Vz2vr47h17JPJCf/aVfYL
         noY8OEh6tkI2FD8CFT4/89EJrCM0LznUylY2K/JKS8StLZcYnREqySI1mCzhJwsuhdBR
         grBUe7KVEawqfypuGeyszh459mPQc9vGwdixRdL3FTahX9v1lEJvnOrlmLXhBvV32eAV
         qMhQ==
X-Gm-Message-State: AOJu0YyPnYTLgf/aebPpGWFUmhryVF+2/XL8gDafttYx4YNxgzDtNGB4
	GUjADbQp4zmw1BpvhvrhrRm/Si48OlqhrfuL+KVwtIHiam0Js0tC
X-Gm-Gg: ASbGncu02nZW7owEhnM/gNeoBZZQh3Owcc8SzbMYBR3yLssRAE8HBWFDZV+T+moC9SS
	EP5YbLs3HlHby2t+/QLwUrpMPpEYJ5eMzcYq7EXiuiHiLrZsgxpBqYHKNv3+HU4H8SFXQ46F8s7
	XCImG0EWvs46MNIVE5mjj4FGGhDOlQQXtzMG/fq7Wpa9cbPUgdQfCbexO4aYuQ3yz4Vy1lSIx2i
	NLhnCjPZsOC7X02jekluH/FY45De/yp6xsa0iANApZVrKmRm50meHvwL6a3Xaq3gNi5S0K/vkkZ
	3GKSFWcbNU0t/aDNnqM8GJyxWSAoGJy31HWpI/Pqef3T40bbeSNXNyS8GpnxDNUoZecT/GSLrN8
	/W9Kqol2ERpPhXHUx3Gw=
X-Google-Smtp-Source: AGHT+IGQjjURdYWHzqx1sRsx6m5XDDt2AekfIWHyOcDAmcHHEUG9T8GoU27Me/Ry2HAXWgUSzMoZ3g==
X-Received: by 2002:a05:600c:1c1e:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43ab8fd1e5cmr56675165e9.2.1740654537469;
        Thu, 27 Feb 2025 03:08:57 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm18961665e9.33.2025.02.27.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:08:57 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 0/2] Add usb option support for Telit Cinterion FN990B
Date: Thu, 27 Feb 2025 12:06:52 +0100
Message-ID: <20250227110655.3647028-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usb option support for Telit Cinterion FE990B.
Also fix Telit Cinterion FE990A name.

Connection with ModemManager was tested also AT ports.

There is a different patch set for the net part.

0x10b0: rmnet + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
            tty (diag) + DPL + QDSS (Qualcomm Debug SubSystem) + adb
    T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  7 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
    P:  Vendor=1bc7 ProdID=10b0 Rev=05.15
    S:  Manufacturer=Telit Cinterion
    S:  Product=FE990
    S:  SerialNumber=28c2595e
    C:  #Ifs= 9 Cfg#= 1 Atr=e0 MxPwr=500mA
    I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
    E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
    I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
    E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
    E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8b(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
    E:  Ad=8c(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
    E:  Ad=8d(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 8 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
    E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    
    0x10b1: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
            tty (diag) + DPL + QDSS (Qualcomm Debug SubSystem) + adb
    T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
    P:  Vendor=1bc7 ProdID=10b1 Rev=05.15
    S:  Manufacturer=Telit Cinterion
    S:  Product=FE990
    S:  SerialNumber=28c2595e
    C:  #Ifs=10 Cfg#= 1 Atr=e0 MxPwr=500mA
    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
    E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
    I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
    E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
    E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
    E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8b(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
    E:  Ad=8c(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 8 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
    E:  Ad=8d(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 9 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
    E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    
    0x10b2: RNDIS + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
            tty (diag) + DPL + QDSS (Qualcomm Debug SubSystem) + adb
    T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  9 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
    P:  Vendor=1bc7 ProdID=10b2 Rev=05.15
    S:  Manufacturer=Telit Cinterion
    S:  Product=FE990
    S:  SerialNumber=28c2595e
    C:  #Ifs=10 Cfg#= 1 Atr=e0 MxPwr=500mA
    I:  If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
    E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
    E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
    E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
    E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8b(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
    E:  Ad=8c(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 8 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
    E:  Ad=8d(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 9 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
    E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    
    0x10d3: ECM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
            tty (diag) + DPL + QDSS (Qualcomm Debug SubSystem) + adb
    T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 11 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
    P:  Vendor=1bc7 ProdID=10b3 Rev=05.15
    S:  Manufacturer=Telit Cinterion
    S:  Product=FE990
    S:  SerialNumber=28c2595e
    C:  #Ifs=10 Cfg#= 1 Atr=e0 MxPwr=500mA
    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
    E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
    I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
    E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
    E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
    E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
    I:  If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
    E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8b(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
    E:  Ad=8c(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 8 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
    E:  Ad=8d(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:  If#= 9 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
    E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms


Fabio Porcedda (2):
  USB: serial: option: add Telit Cinterion FE990B compositions
  USB: serial: option: fix Telit Cinterion FE990A name

 drivers/usb/serial/option.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

-- 
2.48.1


