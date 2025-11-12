Return-Path: <linux-usb+bounces-30465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A6996C54CA2
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F0024E1070
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 23:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8DE2EDD50;
	Wed, 12 Nov 2025 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hd59C+Ip"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A93232395
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989399; cv=none; b=Qha9CJ/6xAPdbORUYo0AF5V0ZNYkmTJeZjqakJoAY/UGnXSYBvTexhxRo/vJh7Ry2hJUBF3Qdy1pnJsrngGNiTz4lXoiHe50Wa2SgYWPJR53tUHSfbYXi2rvZ42Pxe7vHsIfLjx8NXe60dRkiAFH8hrFsaB8Y0kNs84QUYFHZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989399; c=relaxed/simple;
	bh=/8EtoNXwTMkeWcjoQvIqtHH8O2yT0TYt+nMOcvo9fQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rDiGXjEXJTfCTmYiqMWCjZBmDDkPSH5uj+I5VujMbD9w09nMXCfrjgyG6/R8zvO5w9qf98c+tZxrYs5kNFeqvIK3lWsu0wjVfAdE6WVNA637c7bkVx20nj16StjtR9dZJta/MSlLdbiW5Zw6UG58K9VdQfpL2weRAqCO88GcgoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hd59C+Ip; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so367481a12.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 15:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762989395; x=1763594195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KwFtcVnBkhDrZ7pflac47p5fWbvZ9szuOdFxHWKJ3g=;
        b=hd59C+IpM1FceP5dD6qmCR4JrHaCx7qTrK9dA7Tqon/QfhA5CjubhlZUxbauTV9NkG
         fcqmwPXM3efwI2Iqu1rZIIMRpwfxN8ml2t+7GQAFAatTdv4KdU6tVTUH1jXeGmiQyPGR
         VwYbx7qexnfiik5DSqak0uu/0angNvE2XklF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989395; x=1763594195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KwFtcVnBkhDrZ7pflac47p5fWbvZ9szuOdFxHWKJ3g=;
        b=xEw/Zg4kAlO7pC683nBztwBZrvFFGKCUm3TOW/fKQszxnAB/fswMOcGUD6vBddxboC
         wgf8iSu0Cn/ZFlwA8gTXf5FSfEQfB1k31nd1LrI6PKnBorvy0tmNmAAgHnhDfKTBxvr3
         HjEXAWsKwwjmZfPzJPiEfCCqQDsYtV/9H9GwHlv86sAmEHEG+LE//FK7q7dvKd2EkVcS
         8MW3UAYBmpv+JtRWRM+ny9QRLK86p5Na1hEjDkOvmwnNBH62e1hdbVJV9AX7ypJcE8H7
         aeBaDjxg4VFfTc54r7YSOwj3y5//dWuYSHdW58BYDD3ZbqHYF+8OdlsqsW2DRlzNOqih
         pJYw==
X-Forwarded-Encrypted: i=1; AJvYcCUU7Oktd2MY49+GRGNQ75tKArp4xl4N26nLg/V32Eq0XZTn4zlgFSUwGvkZ2RB8bal6t273gmAqq+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pOrH6dFFkqMKKv3FPm/ahMtdO692TXHbUMiRwMGCHkkDicc4
	LO+uuOeGjheFBz/WkZcWveuaJgX+eEk6Gtx73Lqq4DKkZKwYranjUteT1gSbnnPO
X-Gm-Gg: ASbGncsacPE1JBRuyDXJPAc/xHNOLKv6VGBqwAcpOIsU+Xu4trNYmE14+FQ8eHuEmE1
	4ef565U9aIdOmo2kAj4gZY2hUw5M1xju83+MIrAHn86AxZ5CSoE0eyj6qIC7dLfP85ZjmhS8pew
	koheiLq0GX1LOaRx675K7hmJjnOdor0Bm6yc8eSTa1OskbdtH4s/YU8KNbPAr+nTEnkjX/tbI8z
	YLiQbPAwNFZxDElZ+CYb0R4PAeJqZMyJ5nAUryu7x3pm8Lapo/IkMGocJPnAgGd6y30IX9f/Uog
	2ZnnSwcb0U94l+v9ksRjItb6Um29mic/f7ZmQKL0RasW6uu/N/kPS8k4mI+dcPnJjWt3mzkHQPJ
	CNalvDkCOw/Zqc0OSAiwwnoM054o/bYDcF2wYtXiMfSqBDr1jG9BmTQwFksVpWDRdrnzoN2lubz
	H2AsfCOWLpydzbr6H4HHjM4XllVZ6Sd1xlfD2JF05DPIgomTVoLb+7
X-Google-Smtp-Source: AGHT+IGd5J7aTsvZicT0Dx0/IbHhSI7QgwIpgu3wZw+m5/9ze2wvnFlnecYFdK/OqSAFTmGUzBS1ug==
X-Received: by 2002:a05:6402:304d:10b0:641:5bb9:fdfb with SMTP id 4fb4d7f45d1cf-6431a58498amr3263325a12.33.1762989395477;
        Wed, 12 Nov 2025 15:16:35 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm124516a12.29.2025.11.12.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:16:35 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v3 0/4] Enable to set DbC strings through sysfs
Date: Wed, 12 Nov 2025 23:15:53 +0000
Message-ID: <20251112231557.164797-1-ukaszb@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
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
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
Linux USB Debug Target
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
Linux Foundation
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
0001
"

2. Try to set product, manufacturer and serial to empty:

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_product
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
echo "" > /sys/bus/pci/devices/0000:00:14.0/dbc_serial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs empty values were not set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
Linux USB Debug Target
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
Linux Foundation
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
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
echo "A" > /sys/bus/pci/devices/0000:00:14.0/dbc_product
echo "B" > /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
echo "C" > /sys/bus/pci/devices/0000:00:14.0/dbc_serial
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
A
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
B
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
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
echo "New_product_name" > /sys/bus/pci/devices/0000:00:14.0/dbc_product
echo "New_manufacturer_name" > /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
echo "ABCDEF123456" > /sys/bus/pci/devices/0000:00:14.0/dbc_serial
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
New_product_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
New_manufacturer_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
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
than maximum 126 characters (USB_MAX_STRING_LEN):

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMM" > /sys/bus/pci/devices/0000:00:14.0/dbc_product                   
echo "NNNNNNNNN_OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_UUUUUUUUU_WWWWWWWWW_XXXXXXXXX_YYYYYYYYY_ZZZZZZZZZ_AAAAAAAAA_BBBBBBB" > /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer              
echo "CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNNNNNNNN_OOOOOOOOO_PPPPPPP" > /sys/bus/pci/devices/0000:00:14.0/dbc_serial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were not set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
New_product_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
New_manufacturer_name
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
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
whose length is maximum 126 characters (USB_MAX_STRING_LEN):

echo disable > /sys/bus/pci/devices/0000:00:14.0/dbc
echo "AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMM" > /sys/bus/pci/devices/0000:00:14.0/dbc_product                   
echo "NNNNNNNNN_OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_UUUUUUUUU_WWWWWWWWW_XXXXXXXXX_YYYYYYYYY_ZZZZZZZZZ_AAAAAAAAA_BBBBBB" > /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer              
echo "CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNNNNNNNN_OOOOOOOOO_PPPPPP" > /sys/bus/pci/devices/0000:00:14.0/dbc_serial  
echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

Verify through sysfs new values were set:
"
cat /sys/bus/pci/devices/0000:00:14.0/dbc_product
AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMM
cat /sys/bus/pci/devices/0000:00:14.0/dbc_manufacturer
NNNNNNNNN_OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_UUUUUUUUU_WWWWWWWWW_XXXXXXXXX_YYYYYYYYY_ZZZZZZZZZ_AAAAAAAAA_BBBBBB
cat /sys/bus/pci/devices/0000:00:14.0/dbc_serial
CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNNNNNNNN_OOOOOOOOO_PPPPPP
"

Verify DbC enumerates with new values:
"
[83206.326166] usb 2-4: new SuperSpeed USB device number 111 using xhci_hcd
[83206.342150] usb 2-4: LPM exit latency is zeroed, disabling LPM.
[83206.343022] usb 2-4: New USB device found, idVendor=18d1, idProduct=0010, bcdDevice= 0.10
[83206.343798] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[83206.344475] usb 2-4: Product: AAAAAAAAA_BBBBBBBBB_CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_FFFFFFFFF_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMM
[83206.345783] usb 2-4: Manufacturer: NNNNNNNNN_OOOOOOOOO_PPPPPPPPP_RRRRRRRRR_SSSSSSSSS_TTTTTTTTT_UUUUUUUUU_WWWWWWWWW_XXXXXXXXX_YYYYYYYYY_ZZZZZZZZZ_AAAAAAAAA_BBBBBB
[83206.347156] usb 2-4: SerialNumber: CCCCCCCCC_DDDDDDDDD_EEEEEEEEE_GGGGGGGGG_HHHHHHHHH_IIIIIIIII_JJJJJJJJJ_KKKKKKKKK_LLLLLLLLL_MMMMMMMMM_NNNNNNNNN_OOOOOOOOO_PPPPPP
"



7. Repeat steps 2-6 with passing -n option to each echo command to prevent outputting the trailing newline



Changes in V3:
- Renamed prepare_len() to dbc_prepare_info_context_str_len()
- Simplified initialization of default manufacturer, product and serial values by 
defininig "static const struct dbc_str dbc_str_default", removed DBC_STRING_MANUFACTURER
DBC_STRING_PRODUCT and DBC_STRING_SERIAL defines
- Updated USB_MAX_STRING_DESC_LEN to 254 and added Alan's comment
- Updated max output length in xhci_dbc_populate_str_desc() to 2*USB_MAX_STRING_LEN
- Renamed utf16_len->len and added comment
- Renamed dbc_iSerial->dbc_serial, dbc_iProduct->dbc_product and dbc_iManufacturer->dbc_manufacturer
- Added comment for struct dbc_str

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
 drivers/usb/host/xhci-dbgcap.c                | 258 +++++++++++++-----
 drivers/usb/host/xhci-dbgcap.h                |  37 ++-
 3 files changed, 253 insertions(+), 78 deletions(-)

-- 
2.51.2.1041.gc1ab5b90ca-goog


