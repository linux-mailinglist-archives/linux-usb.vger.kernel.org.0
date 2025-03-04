Return-Path: <linux-usb+bounces-21323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C253DA4D7DF
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 10:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07BA3ABA52
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DF11FBEA1;
	Tue,  4 Mar 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGpFzvii"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573731FCCF7
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080105; cv=none; b=B53gY0VFo5yohYYdD1FdRmH2DnP4Z7jjuyUECmTJ+087qypWQyPGbitAndZGB4b2kPgElOsBQcO7JLDmIwWdyutqv+b1hCe6JDhg6+NqzniAcWJpdNs6GWIl4Wm2a6M2zfaAigdN8eotkTdNXQYMsCHWkwOy6XyZW+B03tWBZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080105; c=relaxed/simple;
	bh=8LoVwb0OYavqDoap8Cw7JimwbjM4Glr1UPJbubeCrWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6icyqpLCf8EevGFgH3OUVYhZPRW7y1peJ+wcpYcsLK8/S1ZYfkjANX0/pEKFNQRaWFOPCEnyL4rdGBi2sraZFac4M4zNdFq4FN63iIXh4K3eMFkYzFTyifHUISDWrxAQOAtAnD6CNsy8ZTT6RvzMev/gpxbc406WNXNYcKstRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGpFzvii; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so2738576f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741080102; x=1741684902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0JZBTDj6gFtvjU0jNqKaNuRNkf6iWitFVuuW3Zy8hY=;
        b=mGpFzviiVm2IFkcK/U8bGqIO1uN3IqG6Awbdnr9J56tpszL0hje9xaesibLmhrA4HV
         ssp1VE5xnlV1yPSYY8xmBoTet03cmhvrWod+D4fd9UFG+J9tuY+DYQyoMvX5uZf6/Esn
         zL7cfVJagNy5I+edf1qym+J3RO6806J7tnZnO7dVa9g+/E5eYnFkwaaNRzSPjbuNM3uq
         U+F22uvxoY2g/j1b78wlgsmu4libNuiHmLDexf4+mFPaCdozeaYonBo084Qy0qZsUwNO
         ESXPdxWctFbElBer8kF9FjmQXXI6F7cLi3rZthMWDlVXLmVq8ZK+sg2Ksoim4bu71Na0
         oNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080102; x=1741684902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0JZBTDj6gFtvjU0jNqKaNuRNkf6iWitFVuuW3Zy8hY=;
        b=ifDUsu49LNpDypA0KsOHI+1/H4j4dgCIVyHNLfe4PyWKusu+62/+XdnLyxMWxVo8ub
         jLeWJrFi4QujhThXJtJw1JUAfL+bmM6O1GWaSJK9C3pYoLckmGR9wzc47TroUZiL1bp1
         QeoPwrQ0cNu+WwJ+VfbdcN9TK/KR03HPNFQM40qzF1P510k32FfIwVtvEYYuAKUhRHS8
         gqE8p9U87P4KHf8MiBZCw+2W5DFQ8Pp4yGsjomos8j/YxxlbyKmtoOWwNyS0SDKooVzk
         DWvrEJ42wQKYjD3WsvJqD1D/7o+EPOlNvfzqocN6x6t5C57GZQNn686n3qyQUUSMgoe0
         YwVw==
X-Gm-Message-State: AOJu0YwVwTGZG33mCdLlnmxUt3ddjKhiioe9BSIq1ltOicXukAoBztNJ
	cDFzlA6prYMpRnkcKj62Rt/wbga6OhOrCvqlQuFxYW4nXzLrWpBs
X-Gm-Gg: ASbGncuQgEX/eRBHBaN4e6Jtl8dprrgbVGDzW4zMUNsGE5qUxISInubkqSmFAS/LGF5
	Khlb9W6e6AbLnYzkwQgZ7Q45AZ1UMSdyJ1Z2bpoKTaumlmsjCuZdxEnK0CkekBWCPTxQVOhLITF
	KnqfGqzg52D6aghylQEhjEr9tI4mpi8AH+OQDFLi+dEc1IT64jVb0cng89vdA64sVtupxaDTV+E
	vQ6B5h0Lv1Tw1am+/t4w8IMi3Tn0YJWS0EpRprfT29XcIUuXWUKaGQdYUjyXna1WFuC6qeZvpMu
	/LlGEFb0+FZnSvolInEtN2Ox/edvPKS5h3Gq8SRAfWZpBIpS/xYVw1iqmZMYgPujkbvY1TX3PLX
	kWDmD8v8YuQkdu8+vvWIIxCceY9+xshJLGcf6/Q==
X-Google-Smtp-Source: AGHT+IEA/FSclU2qYn9h97ASSBnHxWUtBNakmMBUAfly9vKYXqFok02xbb6TltMInuFRANJbjcp+gg==
X-Received: by 2002:a5d:6c6f:0:b0:391:10c5:d1c6 with SMTP id ffacd0b85a97d-39110c5d59dmr4620597f8f.2.1741080101282;
        Tue, 04 Mar 2025 01:21:41 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ddesm17069325f8f.41.2025.03.04.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:21:40 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH V2 0/2] Add usb option support for Telit Cinterion FE990B
Date: Tue,  4 Mar 2025 10:19:37 +0100
Message-ID: <20250304091939.52318-1-fabio.porcedda@gmail.com>
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

    0x10b3: ECM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (AT) +
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

v2:
  - in the subject of the cover letter refer to FE990B instead of FN990B
  - fix the commit message and cover letter using the correct pid 0x10b3 instead of the wrong one 0x10d3

Fabio Porcedda (2):
  USB: serial: option: add Telit Cinterion FE990B compositions
  USB: serial: option: fix Telit Cinterion FE990A name

 drivers/usb/serial/option.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

-- 
2.48.1


