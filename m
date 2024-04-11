Return-Path: <linux-usb+bounces-9235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE068A0749
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 06:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 500B9B23794
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 04:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBCC13C67A;
	Thu, 11 Apr 2024 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkxM4KW8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC713C3D7
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 04:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811003; cv=none; b=bxvSccTAzDADuri+ZhTevJWh23pjFgsdHLMHNh9bcI5LLlj3TKvZnymuWRnp5BMmErKOzMqEQ4KEkyBFAG+bTk+K10uTawDJKOnLZ8Bza8mSs2vyJVP4w39OgDhDvoedajys6rsUUtu3YObgWrlX0rGFy0ttWKE4uQs7QcYINrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811003; c=relaxed/simple;
	bh=VRh4cELFJAxzTfV9Lmyb3aK8qnX3IMQzXhMPdnfvKPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PMeMYo+TM5DFbHnfHpT1d6EmNXERedRrl4wmpnxud2Zb4lqlJcj9rlnYpqFYupk1ktDJnbpKZxg7fXN5PmX7M1G0UVvntJ1VqzGPpu6fgTTa+1arbBDPnqVahfUaRjAbEL/oJG2BWVkTc8kKtdaQoY8KfDUrYnz6EkeUkpomxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkxM4KW8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d2600569so8199804e87.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712810999; x=1713415799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vV9BRzBeDyBNLJ48q3v5Fy9CZN3Dn9Jl0gGyuwpCRYM=;
        b=LkxM4KW8W1WOusY/IRdlmVjrUFQmweij+N9CZJLYXNzqN6aDJzyhlDtusqPncmkcSB
         TGqHUO2tC7Tx5iU9+/hxJAIR8O9EojMN0B8LV3OqJnNMXqeTqZDzX4rbDS+vtJIvt6XT
         tG5z6wn5nEe96ZbS/Wl8lPh7dcVTu6wkMHJZ0HSyMDI0iGcJwIeJArKPHlJcEjz4A2Am
         iUygBEcF7kgUC56RiG6BZRB8NiZ/IS/A66FcKlTDIgfs/kuXoqVZEXW1WTcnnutvbtbD
         xjtujpLLZ+K6UDqWcquN861CKkaMZnSs5AzQYwBKzfWk8SZLAWGnegCfkZjStHb0iszY
         53Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712810999; x=1713415799;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vV9BRzBeDyBNLJ48q3v5Fy9CZN3Dn9Jl0gGyuwpCRYM=;
        b=tHHCWPzOioC47hz2w5QpYp61bw+mndMMfoRW5GkiheyM5qVzx2sssqo8uCJDtzaQvd
         WYDlecBLaZ3KU5moupcaCFShk2ms1NfdZJY9EHQ6bU6xEx6OcZdrIKOcJXK21RUHXBMT
         kHKN8mU9RxizWu0aTS9g9x9J/MqBxs0w/tDKFfFww6RPFrmWrMmO1mC5ffBheUbVGNzI
         WU5dmgdP/56FGDUvhvYSLK5R5h3iaH9/sXdTzuDZsr+y9TlUa9cYDPzk9SDYXjH3YtRf
         f+wpzKvqdWULXdKyz1OQJuaaRCGLUvoex0lmJ8Ig+U/ENiOnVtKmJlfNVaA1wKdkGXUd
         yH5A==
X-Forwarded-Encrypted: i=1; AJvYcCVVRemb1zAyLy3PXIg+Ddc/ktl5RwNeMcv3Yh2GqHwPYIOo8yWiLZasMeHR65KNcu6YOe+s8qwNflSbFn2BhuSAe/sp0JvC94o2
X-Gm-Message-State: AOJu0YzRx0T514GI1mVPWO28Ej6R2jvPA8TQzx6QBcvwd8wq0U0xX3cs
	cnhqjtGHdYBj8CNLEGCav90IeCYBZyIbvFtjFVpruqV+b4mIFEsTSHUNI6Ofj5k=
X-Google-Smtp-Source: AGHT+IF3SfEXgmPu3fSvHn0olC1A4Zma91pGBCR4YYTvXitB0wslizp8glzMzh1CTQpSE/9pmbSrNw==
X-Received: by 2002:ac2:4db6:0:b0:516:d06b:4c5d with SMTP id h22-20020ac24db6000000b00516d06b4c5dmr2783939lfe.37.1712810998919;
        Wed, 10 Apr 2024 21:49:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm364899ejc.130.2024.04.10.21.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:49:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] usb: typec: ucsi: glink: rework orientation
 handling
Date: Thu, 11 Apr 2024 07:49:52 +0300
Message-Id: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBrF2YC/32NTQ6CMBBGr0Jm7Zj+gcLKexgWEywwiWnNFKuGc
 HcrB3D5vuS9b4XkhX2CrlpBfObEMRQwhwqGmcLkkW+FwSjjlFNnfA6JMRYnLEgvEo9t4+xomtp
 apaF4D/Ejv/fmtS88c1qifPaLrH/rv1rWqLCt6eRIN5a0utw5kMRjlAn6bdu+YQZBHbMAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VRh4cELFJAxzTfV9Lmyb3aK8qnX3IMQzXhMPdnfvKPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmF2v1/z6LDJvfzV8t/CIwhQjQWdM6AsPGBCQcq
 KzaDZZmN4OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhdr9QAKCRCLPIo+Aiko
 1ce9CACQSjMOo/wkjdb0s7qb35/CWPHkhhOJQXJWqBn/WkoZcAP46zyr9FAxyftCJIIYlCJR9t8
 A9JdyBL+nRagocgsfU+N0cnwvk5JUbvOEZ/6fXHyvyOOtYhGsfBmavcSBfyboeKyPEWO/HlfHBd
 jA45o4f0k8LSwej/ZlhuJgxGN873oxofW2Yqa8mdFRv29QaduIPAA0sZ3SZ5oKF4qu4JCZ2tVhb
 TP7mm5FYYscntDYWbd3J9DCDwxlMZGHRFBuGomMEmCl/Rm8yzIMxP3reoteGpRws4QfwDLZyfWb
 el9IUYwbuTsTaOEsXL3agwvQ4BQRF882kGz8ilI345q58Wfs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Simplify the way the UCSI GLINK driver handles cable orientation. Make
the UCSI core responsible for pinging the driver to get cable status.
Use typec-port API instead of calling typec_switch_set() directly.
Also make the orientation status available via the sysfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Moved ucsi_connector forward declaration to the top of the file
  (Heikki)
- Replaced UCSI_ORIENTATION_AWARE with the update_connector callback
  (Heikki)
- Link to v1: https://lore.kernel.org/r/20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org

---
Dmitry Baryshkov (5):
      usb: typec: ucsi: add callback for connector status updates
      usb: typec: ucsi: glink: move GPIO reading into connector_status callback
      usb: typec: ucsi: glink: use typec_set_orientation
      usb: typec: ucsi: add update_connector callback
      usb: typec: ucsi: glink: set orientation aware if supported

 drivers/usb/typec/ucsi/ucsi.c       |  9 +++++
 drivers/usb/typec/ucsi/ucsi.h       |  5 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 67 ++++++++++++++++++-------------------
 3 files changed, 47 insertions(+), 34 deletions(-)
---
base-commit: 359b3d1a6f8190487067ec542ea7c194eee26e24
change-id: 20240408-ucsi-orient-aware-9643f2653301

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


