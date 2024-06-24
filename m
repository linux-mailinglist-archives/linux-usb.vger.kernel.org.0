Return-Path: <linux-usb+bounces-11586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823491516C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 17:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6EB1C21155
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C819B595;
	Mon, 24 Jun 2024 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uckGRmSB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7C19B3DD
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241722; cv=none; b=FNCAueOHGBjYK4/I4zq44DKICDzVI1/88sMvFJ9baxEzvp/sLSxktqUube96zEBEpakhLRvm9w2IXYxqBXSQrlIOd3G5eIY+X752EHq5Bcidbn3nrDF9D+MZBkJRahiNSp416uow/tfgJZp6WPOxmVd6ZiymtvAYqmHf/jlPa+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241722; c=relaxed/simple;
	bh=O17KHny+PKJLRMJiaVJD5JkTqyGCxDzVU0kKd0eL68M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q2uYFJqda4tVSmGPvPruAtpIe7aAcX8F4bU9B1G3S8uUHZt/sNK7j7aSnvn20JTg4X5N0KjXHFwfy09qQ1g5TtgSQkJ0Y83u1iz5fN13y4aAc/wD2CAp6X0Imytu/5BXPEF7RJnuRXB6dsz/phMb/kpNLriUOM67YfyyQee6HpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uckGRmSB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52caebc6137so4297339e87.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719241719; x=1719846519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+i7tHvoX9oiBmnDTucLRJvHjOPDgCX/xdps63rGoyow=;
        b=uckGRmSB4ws+KhpjcOnAxQDIBdqz3ymoabiRr+HqfUbhBVnBaer4jErfKAp/UDUpHJ
         C9I4yGSUE7Zk6cy1OxxdjD2R4UOpNIe/uG6v5ilwqbE0AhdomFKuQksJ8XrXgviEFAQL
         oLEA/IslokrvJJf9mcPYGXwkg81TAxumc07YGNHOSxSryWRAHLSYOklpjf8i2L4+y/Wg
         BOythEs97h5L+kxUlR62jSC/Jmy560mCN3rgiTbXQKhysYz0+4wes9K1POzPPK7VetvE
         TpBb6NoJyg5bZ8+64wRzoj2ai6lW1MBs9n8qTPYeeTMW3eH0H3FwRpV19pX7Iv4ksJbk
         +ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241719; x=1719846519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i7tHvoX9oiBmnDTucLRJvHjOPDgCX/xdps63rGoyow=;
        b=WZeB2G3VhMyaMPhKZ7YBwtKepZoBa9eON774NmTWyTFSXkrfPohWT5Bs1vqPqA2OK2
         qvUFkwxPwvGsS0t2dwOxCXHBt/fn1g97218nX9crm5EAVutu0CN0ISwBsi7UABivWiLd
         nNdSoC8aBKjzwsm06fTmvS39co45FRcugY1a0lE6LpYTZklZJFPM5Zoi6x769Kxxek7g
         wtiHeNnI53NoXf057sdpef/JFAeD7qGRdanRKgX2Nudq8pK9pG841VLv0qTqclPo/oeb
         V6XRBPext1EaO4g83bnOR1b7Y95d2i6ocHLUtVtMd0mnCGrAQi2gYfEb8qk+RDDuAviI
         wJrw==
X-Forwarded-Encrypted: i=1; AJvYcCXk8DWpSd+G5h8ViP4aJBqLV2fwK2P82TQyp0z9aXikM1O2mOZYLWU9x9LoCR5w4IUyrhJzuuCSGIvQGMkUsn/tlOIOkdCseAyG
X-Gm-Message-State: AOJu0YyJhO3iEZORGHGx1TqiOmv28bpuxllJIxmOXgLoEc+PMAha9m3+
	8KMrsm3yiRyOR+4v54KEkbFBGAYxwqMmGoToCOqd3abfr15ATZHRJSXCCzpxlYo=
X-Google-Smtp-Source: AGHT+IFT5HawGLSVTf4X4/6ikyDeByekKKk7ajdUQkw3r7Lc/OKMXAwm1wzTZHlNuIRpNZAGpliWqQ==
X-Received: by 2002:a05:6512:138e:b0:52c:e08c:a0dc with SMTP id 2adb3069b0e04-52ce185f753mr3231755e87.51.1719241694245;
        Mon, 24 Jun 2024 08:08:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdbe1bcefsm840571e87.159.2024.06.24.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:08:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v9 0/2] usb: typec: ucsi: enable Lenovo Yoga C630 EC
Date: Mon, 24 Jun 2024 18:08:11 +0300
Message-Id: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANuLeWYC/23Ry07DMBAF0F+pssaR34+u+A/EYhzbjQWNkRMso
 ir/jlMJNWCWszh37mhu3exz9HN3Pt267EucY5rqYJ5O3TDCdPEoujp3FFOOBVXoc5gjWtMFkB+
 Qy7H4jJQMTgXhHHjdVfmRfYhf99SX1zqHnK5oGbOHnyyGKRZEUI1NTyljnElEkLvGJa+9hbzO4
 1sqz+9xgpz6lC977BjnJeX13rWwPfxR60+jwhBGjCowWhAHThyj9kqFH71uPK+eB9AuAHhlZeP
 Fw0vc7hfVExgMAWw5o62XB09o42X12itpocZzZhqvjp43XlVvArbGclwPaPfrg6fk37cWXX/iM
 QtMMGn18Dtk27Zv6sjLJz4CAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4779;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=O17KHny+PKJLRMJiaVJD5JkTqyGCxDzVU0kKd0eL68M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYvd+SwPl+mOdOKgF4RE6aIbYVRFnfGmQkuQ3
 95CTYElG0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmL3QAKCRCLPIo+Aiko
 1dLtB/9uSRHXYgTl32PLdkLn11KOEMHJlvfFXdBYmjtYWlO9/oNquJIgMAQAFXCfx2Xb8r1/UFU
 eJvlfKAphXU17eNS5bhZK+Rm0QgzoNaBA6sDFuLaKwD08FituL8425PhIsBiL/XmCQiqSUfLaHg
 9NExn3dmzU+VVy0QPRodmtDsn7JXpkt9GsrKJPNC99qY/F8137C8a1Zb+xunWbnUIYd8QDAzYTw
 EH89EQJK5/fDvOcsE1iVDpfEojU8031f20zrwIDzU6cXp0zXzMqIuhEr+H8hWWDDG4DXobAY7UF
 97ZwA41AwnvVHHyImwdyP3IiulT6D7gbq6QHEqhbW8eGb1Ty
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add driver for the UCSI on the Lenovo Yoga C630 laptop, as implemented
by the Embedded Controlller of the laptop.

Support for this EC was implemented by Bjorn, who later could not work
on this driver. I've picked this patchset up and updated it following
the pending review comments.

NOTE: Ilpo, the first patch is required to fix test builds for the Yoga
C630 UCSI driver. run by Greg Kroah-Hartman. Could you please either ack
Greg to merge the patch to his tree or pick it to the immutable branch
to be submerged by Greg.

NOTE: the patch depends on the header from the platform driver. Ilpo
Järvinen has created an immutable branch based on v6.10-rc1, please pull
it before merging the patches:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11

  platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 12:51:30 +0300)

----------------------------------------------------------------
Immutable branch between pdx86 lenovo c630 branch, power/supply and USB
subsystems due for the v6.11 merge window.

platform-drivers-x86-ib-lenovo-c630-v6.11:
  v6.10-rc1 + platform-drivers-x86-lenovo-c630
for merging into the power/supply and USB subsystems for v6.11.
----------------------------------------------------------------

---
Changes in v9:
- Fixed modular builds of platforms/arm64 on non-ARM64 platforms (Greg)
- Link to v8: https://lore.kernel.org/r/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org

Changes in v8:
- Split to a separate USB-related series
- Mention the immutable branch.
- Link to v7: https://lore.kernel.org/r/20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org

Changes in v7:
- In PSY driver use guard() instead of scoped_guard() (Ilpo)
- Use switch/case rather than ifs in yoga_c630_ucsi_read() (Ilpo)
- Link to v6: https://lore.kernel.org/r/20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org

Changes in v6:
- Use guard() instead of scoped_guard() (Ilpo)
- Add a define for UCSI version register (Ilpo)
- Added a check to prevent overflowing the address in reg16 read (Ilpo)
- Link to v5: https://lore.kernel.org/r/20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org

Changes in v5:
- Added missing article in the commit message (Bryan)
- Changed yoga_c630_ec_ucsi_get_version() to explicitly set the register
  instead of just incrementing it (Bryan)
- Dropped spurious debugging pr_info (Bryan)
- Added missing includes all over the place (Ilpo)
- Switched to scoped_guard() where it's suitable (Ilpo)
- Defined register bits (Ilpo, Bryan)
- Whitespace cleanup (Ilpo, Bryan)
- Reworked yoga_c630_ucsi_notify() to use switch-case (Bryan)
- Use ternary operators instead of if()s (Ilpo)
- Switched power supply driver to use fwnode (Sebastian)
- Fixed handling of the adapter's type vs usb_type (Sebastian)
- Added SCOPE property to the battery (Sebastian)
- Link to v4: https://lore.kernel.org/r/20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org

Changes in v4:
- Moved bindings to platform/ to follow example of other Acer Aspire1 EC
  (Nikita Travkin)
- Fixed dt validation for EC interrupt pin (Rob Herring)
- Dropped separate 'scale' property (Oliver Neukum)
- Link to v3: https://lore.kernel.org/r/20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org

Changes in v3:
- Split the driver into core and power supply drivers,
- Added UCSI driver part, handling USB connections,
- Fixed Bjorn's address in DT bindings (Brian Masney)
- Changed power-role for both ports to be "dual" per UCSI
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230205152809.2233436-1-dmitry.baryshkov@linaro.org/

Changes in v2:
- Dropped DP support for now, as the bindings are in process of being
  discussed separately,
- Merged dt patch into the same patchseries,
- Removed the fixed serial number battery property,
- Fixed indentation of dt bindings example,
- Added property: reg and unevaluatedProperties to the connector
  bindings.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20220810035424.2796777-1-bjorn.andersson@linaro.org/

---
Dmitry Baryshkov (2):
      platform/arm64: build drivers even on non-ARM64 platforms
      usb: typec: ucsi: add Lenovo Yoga C630 glue driver

 drivers/platform/Makefile               |   2 +-
 drivers/usb/typec/ucsi/Kconfig          |   9 ++
 drivers/usb/typec/ucsi/Makefile         |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 204 ++++++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+), 1 deletion(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240527-ucsi-yoga-ec-driver-76fd7f5ddae8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


