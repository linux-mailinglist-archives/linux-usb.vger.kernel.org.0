Return-Path: <linux-usb+bounces-28982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AFBC2C5E
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFF3F4E5A59
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1A62638BC;
	Tue,  7 Oct 2025 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gyDyFBIC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F02550AF
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873179; cv=none; b=UnIyAjv3e0BB6g5PRdmWEvHjiBh6GENa6gxwng9yIgzpK6LJnZ7RZdeyft+0dwt52lPo83BIduhSi73OOMqProeVVVvkVUrWwAICPunb60mp6xZ+wfv9yEJlFf0oRC/3FG2OvpthZRfiuF95T2Z7xOzDgzZV2JuWBkdjtWvJ+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873179; c=relaxed/simple;
	bh=JiVlMRvHmJYRIOeJPeOgu6704rBfIfCm0lEfMZLJRro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=urb802tFaWU0Qjv8H/O0tw9G+TXAis93ACj/TElKJYHsaGEMWAJ5OW+pRXfkXemwKydLYilHcx0K5eiTmXOj46fVDSHafEMO8nAWm9emrm1lffVnvwD76G6NRXsk16qCEMvAC0l6HlubTDugjSECBfr39cp70Crc8gyKa3xIkUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gyDyFBIC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4736e043f9so1197466966b.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873175; x=1760477975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri0d169GhSEW0yIKvHdlBe1Y9VlcJadsGMOOZG2uCUI=;
        b=gyDyFBIC7Dy1uq6W0n7K8MVJh8nUsACToXTOBkiu4eQGcp2sGuot7IZ+FdDAtpK5/G
         c+HeDElFZ7rXBbOM27VLYeGj3pNjxa6tWIucNgT8SxwCAw9HLO0r6g0Sg96IrgS+WMRR
         go4AbhAPWov9wFFwCOfGmk4+V/mOF9DTo14Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873175; x=1760477975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri0d169GhSEW0yIKvHdlBe1Y9VlcJadsGMOOZG2uCUI=;
        b=gQLhxht41W+BRnPEnR9j4ObguNS1Oib+UG+qYdCvZl8E6bucQTjPMbS/g0LAaY/9YZ
         BA9P99kAQSAkS0w+i87DJhmxK/Vd5sDAGZWSEUudpJbayKqDQQ5b5m/KLGfVPi3Pbmo0
         DdFbkqYb6u1VqbVL5e/QUCVhceiKpDFhOceKtqvJioUFS2+GBeQLvsfzXi22oBwVemkc
         AJWfEDjrezdn+oi5zprNx9yVqcOPCjjc9J4keM7YI/aAx+qE7T3t3lBoRT1czLs1e2NE
         xsngY6R75Fb4xGV6sm6nLCkU6RPoKhR/bA769lMIa/Vsokdy89CZ2Ez2l0U6c56Xpqzv
         mUtA==
X-Gm-Message-State: AOJu0YzVZclAjUU7a25oqENiDlNCfgdT3ijVzT+sHNP6/R0H2JKC4AdM
	VW3fevx1ZohhVmt0eF/uy3qUywB/rnzr3jnNtmAQdcget8LuJUEQf7B5Tev+nRK/
X-Gm-Gg: ASbGnctdJOqTChiLjsMEbjEIPJ9moobElmg9ET8/NouW6M3EoPHV2lccN5nnutBPSqG
	zcZdhLqPHIfFXkewQN40RoMoJoDG7yr/3aObDAJfd6+qkqU+aEG291TlBBi+HSpB1SDlM7m9r6H
	MMOmnLyvVSfxaom3NKmLP4DZnMex62c1j6zEnpEAUU73xP98JKeqBMlvFP6cY/v44UXsmZBDu69
	lpK/Hsbzixvc2f8gPjYOxpo+ngon3d0avvXH7ArAgWvXPSuiMRFpLk41va9jx96q+8z8wzodyK2
	YjpAoSFXfQiqsMK7FB3fqWdabL3C5OU1xXu4NT00taDxBteEmA85sIY4pgKJOihSHhE25UmIZxX
	LMD29qgxu4RJ8cjDqrfjhsycXwL9iI37GTWtsjvrKWWeA6nmgPG9E6tt3kQnMW6oRyKBpe5BG7E
	1CapfV0mIONuxxYwDfSvu/MkNo
X-Google-Smtp-Source: AGHT+IE23QU0RXj5/Lz2LbrC6snB9MdliYNqw9Y9/FPwleiJtYa6tw/I0oiJsUqtH9UvTlNLXOsiNw==
X-Received: by 2002:a17:907:2d8a:b0:b3e:e16a:8cf2 with SMTP id a640c23a62f3a-b50aca0b087mr120256466b.56.1759873174944;
        Tue, 07 Oct 2025 14:39:34 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1506331366b.42.2025.10.07.14.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:39:34 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v2 0/4] Enable to set DbC strings through sysfs
Date: Tue,  7 Oct 2025 21:38:58 +0000
Message-ID: <20251007213902.2231670-1-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
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

2. Try to set product, manufacturer and serial to empty:

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs empty values were not set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
Linux USB Debug Target
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
Linux Foundation
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
0001
"

Verify DbC enumerates with default values:
"
[206723.036606] usb 2-3: new SuperSpeed USB device number 52 using xhci_hcd
[206723.056594] usb 2-3: LPM exit latency is zeroed, disabling LPM.
[206723.057795] usb 2-3: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[206723.058592] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[206723.059289] usb 2-3: Product: Linux USB Debug Target
[206723.059796] usb 2-3: Manufacturer: Linux Foundation
[206723.060284] usb 2-3: SerialNumber: 0001
"


3. Update product, manufacturer and serial values:

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "A" > /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
echo "B" > /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
echo "C" > /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iProduct
A
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iManufacturer
B
cat /sys/bus/pci/devices/0000:00:14.0/dbc_iSerial
C
"

Verify DbC enumerates with new values:
"
[222501.763069] usb 2-3: new SuperSpeed USB device number 66 using xhci_hcd
[222501.786948] usb 2-3: LPM exit latency is zeroed, disabling LPM.
[222501.801052] usb 2-3: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[222501.801857] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[222501.802556] usb 2-3: Product: A
[222501.802958] usb 2-3: Manufacturer: B
[222501.803329] usb 2-3: SerialNumber: C
"



4. Update product, manufacturer and serial values:

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
[222740.958461] usb 2-3: new SuperSpeed USB device number 67 using xhci_hcd
[222740.974545] usb 2-3: LPM exit latency is zeroed, disabling LPM.
[222740.975442] usb 2-3: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[222740.976236] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[222740.976929] usb 2-3: Product: New_product_name
[222740.977372] usb 2-3: Manufacturer: New_manufacturer_name
[222740.977896] usb 2-3: SerialNumber: ABCDEF123456
"


5. Try to update product, manufacturer and serial values with new values longer
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


6. Update product, manufacturer and serial values with new values
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



7. Repeat steps 2-6 with passing -n option to each echo command to prevent outputting the trailing newline



Changes in V2:
- Documented new sysfs entries
- Fixed *_store functions to handle correctly case when there
is no trailing newline

Łukasz Bartosik (4):
  xhci: dbc: prepare to expose strings through sysfs
  xhci: dbc: allow to set serial number through sysfs
  xhci: dbc: allow to set product name through sysfs
  xhci: dbc: allow to set manufacturer name through sysfs

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  36 +++
 drivers/usb/host/xhci-dbgcap.c                | 252 +++++++++++++-----
 drivers/usb/host/xhci-dbgcap.h                |  24 +-
 3 files changed, 237 insertions(+), 75 deletions(-)

-- 
2.51.0.710.ga91ca5db03-goog


