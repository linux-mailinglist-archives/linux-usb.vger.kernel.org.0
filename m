Return-Path: <linux-usb+bounces-28769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B263BA880C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489B6188E703
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9A227147C;
	Mon, 29 Sep 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NVx+u0OK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B351EF36B
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136534; cv=none; b=F6SRXdlQXqDlyhOvVoAYWneHw77D85bKbTarKVG323YzlJNFmGZMU3V4SO7AnyG3yujXrF1rScXVQq3vusJYv2U24szVFXk0+cu6GXTxUIalNA10ZHk0UVkb81S90NM41ztP36AMsRSm7Xe7Ek+Z9trZrm3dY2gjRwjEAq8mehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136534; c=relaxed/simple;
	bh=gePdrzevJC+x2QS97rEMusc0mdQafixLIRy9nGGrGVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SX/rDZRHlavpSL2e5a2AKnqLAHyLPFsuABxztR1wgGnC0JZLoT8xfeMufNU+TeFvCt4/0+z6pX6MWYa/wLAk3s9m9wcn11U/IDeeUGdq9JO17WddFBIq1zbpqJ47vWqdEJxZa2r/iok5FxeQNXTXb5BKuu2D/7bn6bSJKVsK2GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NVx+u0OK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so208347966b.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759136530; x=1759741330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqhvcIwTnaeA51kmqazH8s+wauB08JVVEqCuS8ucGbw=;
        b=NVx+u0OKXZfmUM4ES+qdOSYc+Z+cjhSk6xqA79+s5MLhfcMQaHB8wq8AFy38TvTmrt
         Zo5CbnDHK8X47s2pwmuDD8QbyWbIYx4/O2IPD2otIk0t4eau5B2pwbL1Lu4vkPqW4f7o
         R47+FMfDYyggZf8zIevcIVd3L84DOrlhYP76w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136530; x=1759741330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqhvcIwTnaeA51kmqazH8s+wauB08JVVEqCuS8ucGbw=;
        b=CR58Bs96h1PCTzVFznMG12R5FBbIIVmIVkd7BGPpfPtp9aTLheY4rbObgMytXyb1eV
         V8w50dlyHf2TSIgUVKdOaUSfakA7Rz7CMiGXCFhvuXMTpCHvSzj4aoYiPQn/kzFRVikW
         aXzenOPqVHc05BjnRqCCioZ93kFFhZD2krGMDhqV5BgrB9yREapG0AbhErKD2ScON1sm
         f4qA4szo9sdb/ohvO6HjpXHqGSUgIJcKbo8i9erQY7iBYIDIT4lggTWHrzavlII2Jp36
         S2DltcTROW3yhtMlmYaV8vaS7hmDu+HEnXJnVUdaAG2HJDlVElsXvNQ+vhB+iOsqVAQV
         AR1Q==
X-Gm-Message-State: AOJu0Yw7VFGlIImZ69Uxw2f6zOZT/uNIAddZmC3QOGpmTJxvMqP4XAvQ
	aKALXBFyc8Aizgq5HUnhhWDcjxe4VASsXbB807zHo7jhDkDesJGJDxJnIb05Snao
X-Gm-Gg: ASbGncuVyHbPUJaYZbmizowdv3vasvvhSDX6Er0ypb6juyz5Wdmvkk/sx4A8UqQw05M
	dpthevIxDbp6N1MPGRUuZSsaf/yY//SrRIactZ5hfJo/Rau31MhoKIBeP4FbHLnD+0AbWS++2WF
	47OG7cZzbSpJ8WTmSWfw5y+MS3R1jeWePuJvrXkqR47/arhjeCkwRsbGAgo/jxsGtHiSe29GLBE
	0bAe/a/Jij1RaVaFx2UyEbl56Uv36HAqz6nVXB/mIRXJsXNfaL/HWKNnisJVIK7khPIoBujLrSg
	aoBsRMXyqwylx7lkSIpyWpB3w0KcGuZpUztiIiuVNwjRwMowBC+AHmNvPYeuIAUijgbRiJwsJPU
	t3BB+K0fLOqCalTLRhy2BDcqROW1Z8qHojEe3ebbt6hNmUSNTsETSKBXsSwJfK0N1tnlTmO0v6l
	Shw4krPHQzw7s=
X-Google-Smtp-Source: AGHT+IHOs5QHEDHsFr4BvW1XoYBt3+IbG+8b0V1eFgo4d2vXOcqY1dQ2wkO13+Gd61I8fE7lr3Uv7Q==
X-Received: by 2002:a17:907:971b:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b3ca1617ce7mr513706666b.2.1759136530155;
        Mon, 29 Sep 2025 02:02:10 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm880017666b.100.2025.09.29.02.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:02:09 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v1 0/4] Enable to set DbC strings through sysfs 
Date: Mon, 29 Sep 2025 09:02:02 +0000
Message-ID: <20250929090206.423937-1-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

This patchset enables setting DbC serial number,
product name and manufacturer name through sysfs.

Testing performed with this patchset:

1.DbC is enabled and enumerates on host side with the following
default values of product, manufactuer and serial values:
"
[496803.112431] usb 2-4: new SuperSpeed USB device number 106 using xhci_hcd
[496803.128540] usb 2-4: LPM exit latency is zeroed, disabling LPM.
[496803.129387] usb 2-4: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[496803.130173] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[496803.130858] usb 2-4: Product: Linux USB Debug Target
[496803.131343] usb 2-4: Manufacturer: Linux Foundation
[496803.131821] usb 2-4: SerialNumber: 0001
```

View default DbC values in sysfs:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
Linux USB Debug Target
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
Linux Foundation
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
0001
"

2. Set product, manufacturer and serial to empty:

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs empty values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct

cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer

cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial

"

Verify DbC enumerates with empty values:
"
lsusb -s 2:115 -v

Bus 002 Device 115: ID 18d1:0010 Google Inc. 
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x18d1 Google Inc.
  idProduct          0x0010 
  bcdDevice            0.10
  iManufacturer           1 
  iProduct                2 
  iSerial                 3 
"


3. Update product, manufacturer and serial values:

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "New_product_name" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
echo "New_manufacturer_name" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
echo "ABCDEF123456" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
New_product_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
New_manufacturer_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
ABCDEF123456
"

Verify DbC enumerates with new values:
"
[497908.814834] usb 2-4: new SuperSpeed USB device number 108 using xhci_hcd
[497908.831057] usb 2-4: LPM exit latency is zeroed, disabling LPM.
[497908.844994] usb 2-4: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[497908.845797] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[497908.846482] usb 2-4: Product: New_product_name
[497908.846965] usb 2-4: Manufacturer: New_manufacturer_name
[497908.847505] usb 2-4: SerialNumber: ABCDEF123456
"


4. Try to update product, manufacturer and serial values with new values longer
than maximum 63 characters (half of USB_MAX_STRING_LEN):

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGGG" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct                   
echo "HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNNN" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer              
echo "OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_WWWWWWWWW_YYYY" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were not set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
New_product_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
New_manufacturer_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
ABCDEF123456
"

Verify DbC enumerates with previous values:
"
[497908.814834] usb 2-4: new SuperSpeed USB device number 108 using xhci_hcd
[497908.831057] usb 2-4: LPM exit latency is zeroed, disabling LPM.
[497908.844994] usb 2-4: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[497908.845797] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[497908.846482] usb 2-4: Product: New_product_name
[497908.846965] usb 2-4: Manufacturer: New_manufacturer_name
[497908.847505] usb 2-4: SerialNumber: ABCDEF123456
"


5. Update product, manufacturer and serial values with new values
whose length is maximum 63 characters (half of USB_MAX_STRING_LEN):

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGG" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct                    
echo "HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNN" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer               
echo "OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_WWWWWWWWW_YYY" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGG
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNN
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_WWWWWWWWW_YYY
"

Verify DbC enumerates with new values:
"
[499856.473572] usb 2-4: new SuperSpeed USB device number 119 using xhci_hcd
[499856.489786] usb 2-4: LPM exit latency is zeroed, disabling LPM.
[499856.492080] usb 2-4: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[499856.492871] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[499856.493624] usb 2-4: Product: AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGG
[499856.494445] usb 2-4: Manufacturer: HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNN
[499856.495307] usb 2-4: SerialNumber: OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_WWWWWWWWW_YYY
"

Łukasz Bartosik (4):
  xhci: dbc: prepare to expose strings through sysfs
  xhci: dbc: allow to set serial number through sysfs
  xhci: dbc: allow to set product name through sysfs
  xhci: dbc: allow to set manufacturer name through sysfs

 drivers/usb/host/xhci-dbgcap.c | 240 ++++++++++++++++++++++++---------
 drivers/usb/host/xhci-dbgcap.h |  24 ++--
 2 files changed, 189 insertions(+), 75 deletions(-)

-- 
2.51.0.536.g15c5d4f767-goog


