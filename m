Return-Path: <linux-usb+bounces-23168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F36A90F80
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 01:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D7B3B876B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 23:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B3724A06B;
	Wed, 16 Apr 2025 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTb7wgvJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52020FAA4;
	Wed, 16 Apr 2025 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845832; cv=none; b=ejS8P4rabcTUyc5hBCAg6F/4MPMS4zF8crizLe5rIqbknlAjDH3m4YVPvgUk12AvOIKkGtn9sZlgJ3eFCCPrlHhQey5gdO7roe8mYItZOsrHc1t03Rh/SEhtvMyZrh8aRooHscLsmcYH3fzCo5jnyQaK8WFs4fzOtM1JUjJj6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845832; c=relaxed/simple;
	bh=yTdWu3jb3raIEY8PHfD41fdbsUptBNrENh/qqRJ6QGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGeJrcv9r/+bzlLi3+5fqT/lTTtQBYrPgGcqFD11FiFB1s/enzkMbAnOQmaiO3y9g0Eok2ISS5Ov0umJCPKHHVGIoluqKgZbNTIqtyWUwKXJv+6s6Fx4/5ZH+DRSFQZrNhoZh/vt8Ocm1Ln5RUi1bg2Cirz9klQwiTbpnup7H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTb7wgvJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so1233265e9.1;
        Wed, 16 Apr 2025 16:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744845829; x=1745450629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZHMqnFSjtM08FxT/yASbxF4MC/QCltnnNiDCemWCjE=;
        b=PTb7wgvJbGr32Uj8j4uoGFvShh4nQUpvOdYiguIVUJqLX+m3QcAdcA/8Tq24aBYm2w
         nqFsk7IYJODh2Z1zRRQRQ+P3iVH8+9AfR38IFnsahtdTSdgPaPyMIkyW7xmUtFgMbLew
         aCHhmK/jv29B8q64nyDLC4pPgXfrOryIjkZmefN4mh4wFs0YkSGEGqMxpgLfIL8M61mi
         aHTTf2tXlBaD/BcwS9ydhdBYCKAdgJU4vCL60xa5w18DRTjFzZOOs5Ilbr3exOHLcHlY
         /BlUn81dDPzG+6QIl9oJ3LKBVDMEgS2GGFBzk3kdaW+BV/4bw4GCqsmy6Eu+oPA+LVr0
         M/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845829; x=1745450629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZHMqnFSjtM08FxT/yASbxF4MC/QCltnnNiDCemWCjE=;
        b=LoRVFbOMN7cdmJrd/KxI7AsVSMKjdvIFelu+JK4wPzU3ypJ/SYwGL/1Zf2Qw63CeoV
         QSbTMEHZ0qsUhQYAkMmhawYd3jCt8fRZ5/LCxZSLkzMVcGJbDOY5xEjqqUthx410+PkG
         +QShsPtrYrO+NVwWEQKjGN4hmz/3UojTulq5u5Tgp+/bTDorLGIeMfbQIJ7iSlXM/fr0
         TY3rUbGMeNevdkvspMZLb28/hT2kvzXiIJ0Dw1c1XEGj/2+dsZfPkvwOyE11VRPUDW2P
         TuyIYCD8Dv36xN6kLnQcp2018k1F9ZnGC3LdI1ZzU6/soz2LnMrd0izIgY5wmwL+z79q
         3Stg==
X-Forwarded-Encrypted: i=1; AJvYcCUQLSrlXvGvVbNhp7hU+xcb10wyUnos5+bVzLrRsl193VhpOS3NJ07sUDNvd1EXNm3Rg8JIWYBk/WyE@vger.kernel.org, AJvYcCVIDrgbnk/x1EeNLYHLkl4y3nzbFcIsZUeSI+lCjfKacZ7f/Hox6LYr15fKjX8upvhMJs66+eohDBMjgJyC@vger.kernel.org, AJvYcCWtJBVR8/f0glRrW6n7gb06uLbCyHrGEadFSxrkjEES4k74zztaDRPeL3wVGxRlPY1dRdAtnTwLkD+DxmJs0A==@vger.kernel.org, AJvYcCXWCfhI3JECRnXK5mYO0MGHswyuy4AlrE18MvH/GlZEMwxKT6VHiV8jCo3G/48IZ4/PmA821wGOn2kT@vger.kernel.org
X-Gm-Message-State: AOJu0YzchcrCMzn62BqgkSjwiwZOQTiaw+6H3jmQ6qUJT6VhkDXd7GZ3
	stan2tE1G6CVufJmV6xaF9cIPnjmwb5UATt5wGj5xI1FbiQBhT4=
X-Gm-Gg: ASbGnctarSsauE2ZxtcBQcDPmqc8ocLsoAwmwbqZEbPKCKld2QtJTgWee8Ax0Od1xqC
	mmTnJI5yG1mg94KDcSI7Ztqks1Y3nDuRB68zA1kinXqaRODq9Kc82heoBhs/GzFchse4t1Zl3Eq
	plxricL2TY/OfoQaCTrhzZia2lcy8LhjZvZq5MWYBiXEUrJPa8jiTY9rqowm4bob5WnfiUPetwm
	tVyh5qraqYhxvZDKQpGYuFsCtDmz4/bnKN5Nr+lvfrsLT3Tye+v9yAnOqSHmAvb925HtvU4sBv1
	MIU9g4c4jyl9Aib1+OIQ36kvh1CO6Y0NOv9qZgyjbOhiQw8eLAXmMPMX
X-Google-Smtp-Source: AGHT+IH5bYIEa3IAks8Q3drBGUpMUoBHlUX0+GeIAsKBdq/NPqPPDfrbkgM0obKBR71cGNy9NAaj3w==
X-Received: by 2002:a05:600c:6a8a:b0:43d:fa58:700d with SMTP id 5b1f17b1804b1-4405d73af2dmr27199755e9.32.1744845828576;
        Wed, 16 Apr 2025 16:23:48 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ac4sm34026465e9.23.2025.04.16.16.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:23:48 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 0/4] X1E Asus Zenbook A14 support
Date: Thu, 17 Apr 2025 01:20:47 +0200
Message-ID: <20250416232345.5240-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for the mentioned laptop.

Particular device exists in two model numbers:
* UX3407QA: X1P-42-100 or X1-26-100 (as tested)
* UX3407RA: X1E-78-100

Mostly similar to other X1-based laptops. Notable differences are:
* Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
  and Qualcomm FastConnect 7800 on UX3407RA
* USB Type-C retimers are Parade PS8833, appear to behave identical
  to Parade PS8830
* gpio90 is TZ protected

When comparing device firmware between UX3407QA, UX3407RA, it seems
that only ADSP firmware is different, CDSP and GPU firmware appears to
be the same. (At least assuming the GPU firmware name in both cases is
`qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
also makes it easier for distros to automatically extract firmware from
Windows and place all blobs for the model under the same path. If/When
firmware blobs make it to linux-firmware, same blobs can be easily
symlinked between `qcom/x1e80100` and `qcom/x1p42100`.

NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
[2], or equivalent proposed solution.

Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
additionally required both newer firmware and patches to `board-2.bin`.
I added a short how-to [3], as it is not exactly trivial.

ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
dtbloader's github [5].

[1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
[2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
[3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
[4] https://github.com/aarch64-laptops/build/pull/134/files
[5] https://github.com/TravMurav/dtbloader/pull/4/files

Changes to v1:
* Fix/re-add PS8833 as fallback
* Add EC's i2c address
* Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
* Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/

Changes to v1:
* Drop PS8833 variant, fallback to PS8830 as they behave the same
* Drop wrong pcie6a_phy compatible revert
* Drop redundant comments, fix order of properties in the device-tree
* Fix device name bindings, express in model names instead of the soc
* Fix GPU firmware name for UX3407QA
* Fix model string, enclose variant in parenthesis
* Added missing new lines before 'status = "okay";'
* Updated cover letter to reflect some of the above changes
* Left SPI10 disabled as it is unknown how/what for to use it as of now
Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (4):
  dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
  dt-bindings: arm: qcom: Add Asus Zenbook A14
  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
  arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 .../bindings/usb/parade,ps8830.yaml           |    7 +-
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1307 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   44 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  137 ++
 drivers/firmware/qcom/qcom_scm.c              |    2 +
 7 files changed, 1499 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


