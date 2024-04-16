Return-Path: <linux-usb+bounces-9373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 362898A60E1
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 04:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F3C1C20D6D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 02:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F9711181;
	Tue, 16 Apr 2024 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkUHihq/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6516AB9
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234056; cv=none; b=QYilIGD8W9EQnlrDa2xCiNw3vRcCzJXqOgJLp/AmbzE1z8aUWRvoHbC6Lz0wTMEuoqqWpdvrzqU3sCYLGDpZpq4uzl/lhGLN5S9xdFZSO5fcYF7oMMUvqyCnl4gZFDvTI733aX+rMmgLYCcxGQbj+h4HMX4j4hAuvjIV011V9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234056; c=relaxed/simple;
	bh=I6m2M+8GekB9Ra+iG3eKclLpfI1M2HDrEBoYGhILldA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fv087CMLecmMkyvyll1egWqrcU18WHEIbGR0HVw5QMkjB9nTAddu6JAjiUDUU2uw+pszdw2V08pJp07sTTXHjjz4pzfTDQEX2KIskAjCT98tZeITN6apBgcWuyT/IYsX7fjR+riy9LN7l1K9ZpsY6yNhgX9hPdIauYFt61V6izw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkUHihq/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-518bad5f598so2574798e87.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 19:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234054; x=1713838854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31Zi/BCGo17+6WL9U+yMAfsapL3UhLlQ6swNbqDLj4U=;
        b=zkUHihq/qhpHfQalp7GecvDPMulMGY8BACVR7lozX8LETEvu0foLdL14HbpkahLFIH
         R9drF4yyoVHQ26r95nuwsp07Za/zc223w6QPy3WMQ2fIjZAHqchPKA5SdBwCpZZOKNBc
         8uQ3U+AgtjUSL6FC32wdxeh2Gm2u4PFroD7ZvQGp6Yu013q9tj7OTZFRe0vCg4i91HGi
         XaVFsFvKLzCWC5o0kV+CFg0e654Of1blIYlrhbg1Fau/jZgj62ZtGTWc17QwbKiTRAgP
         F36l+Lxs+pOGAt5zIZ/nTqPO1NLLY8YB+as5wMK4gCpy/hQatU6ZaxFX4En8suuVqr8e
         EKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234054; x=1713838854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Zi/BCGo17+6WL9U+yMAfsapL3UhLlQ6swNbqDLj4U=;
        b=oAcVCl6zTBoGe9hSp92LsNRE/7/qffUbF5M4M/HHF6zV2N68tax3RJ2KxzK11eH0gS
         YoPi3eqNXuPR2U37++eKORs8keIhlYB4Csh+VpOhNkBh5rMmk0ZbAyoPq4wjkgSuEYFD
         OVsl3GbapcgOaL9Xiy14Pu4v5NbuFirlcTC4siqEQKnOFIUqlXse1XDkw+cNNnz3FviR
         4jo4G/aGqR+Z09s4bustvI+uDEM13un5OkHsH4OMhMKUYgTvC4Hx9gDvpmAZ8AZh43/Z
         30IAKi+ERwOalajSSIqP2EgjX47YL5uzXrCtFjm0NhmmQgeWhAw5UEw86Id/ZVcxQXdO
         ay9A==
X-Gm-Message-State: AOJu0YyFg+73O0GUs1+VB82SSUhXBZlx3pbiiVPVJ+NF91O0Rab3zJoI
	MnNHgxm4XuFLOHEU9IbOgUvbuxbebGSAwoAEW5kNWZLlWoKFtVmupVMKfvF2mrs=
X-Google-Smtp-Source: AGHT+IGg2XVY2pkXFF64W+aZzzMeOONtNpRSHuTRqOBIPJ3cw3XhH807g35lb7b4mCe4u3AVMKJyLg==
X-Received: by 2002:ac2:4430:0:b0:518:bd37:b27d with SMTP id w16-20020ac24430000000b00518bd37b27dmr3765414lfl.67.1713234053565;
        Mon, 15 Apr 2024 19:20:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/8] usb: typec: ucsi: glink: merge in altmode support
Date: Tue, 16 Apr 2024 05:20:49 +0300
Message-Id: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHgHWYC/x3MTQqAIBBA4avErBswE/q5SrQwHWuoLLQiiO6et
 PwW7z0QKTBFaLMHAl0cefMJRZ6BmbQfCdkmgxRSCSVqPE1kHBf2M+rlWDdLKJvS2MGVshIGUrg
 Hcnz/065/3w/lmAepZAAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I6m2M+8GekB9Ra+iG3eKclLpfI1M2HDrEBoYGhILldA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCDxYYHr6DhuHF5Rx3H3UF3NZQ+UU0xJXKpG
 Djr2ZkkgkyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ggwAKCRCLPIo+Aiko
 1cFvCACGUL3X5X657gbpGTVoM+fio/lBRG69Mp83UZWFjhSsTHLhtxOJ+1Pqt7GTpOVV9O0zMWX
 tXvrDXLDMuXJeA2bKmjfvqGLy0ye5PJttVLMeZJxrw6ynFo7rGrwfwGHlpunB4MIQk8UztvztrX
 H6TAuPebI9j6kGlYeXGrMcdGImjUi1HGDBExqy7vIAJpz2ntPKRd3zKvhcugQ7Tg1zX42bi8YX9
 JKGws/XC1UW8lznI877kckpaK/XIT71um7Hl5V+wLAsbZH85XEJF8wofi4fXdqXjae+otr3EuM8
 4q5EEIiPvt5qFPX9NbNoN+IHUzfvZYqcTXuhqwnUM5tbCugF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

PMIC GLINK platforms handle the altmode support via OOB messages rather
than by fully following the UCSI standard. Currently altmode handling is
implemented in a separate driver, which has to duplicate significant
part of the USB-C stack to control USB-C muxes, switches and retimers.
Also this potentially introduces race conditions, since both UCSI and
pmic-glink-altmode will drive those components. Last but not least,
there is no connection betnween the altmode's aux-hpd-bridge and
corresponding typec_port instance.

Merge the pmic-glink-altmode driver into the ucsi-glink, streamling the
altmode support for Qualcomm platforms.

Depends: https://lore.kernel.org/linux-usb/20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org/

Merge strategy: since the series involves both UCSI and soc/qcom
drivers, I'd kindly ask to ack merging the whole patchset through the
USB tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (8):
      usb: typec: Handle retimers in typec_set_mode()
      usb: typec: altmode: add low level altmode configuration helper
      usb: typec: ucsi: glink: check message data sizes
      usb: typec: ucsi: glink: use le32 for message data
      usb: typec: ucsi: glink: simplify notification handling
      usb: typec: ucsi: add ucsi_registered() callback
      usb: typec: ucsi: glink: merge pmic_glink_altmode driver
      soc: qcom: pmic-glink: drop separate altmode driver support

 drivers/soc/qcom/Makefile             |   1 -
 drivers/soc/qcom/pmic_glink.c         |  15 +-
 drivers/soc/qcom/pmic_glink_altmode.c | 546 ------------------------------
 drivers/usb/typec/bus.c               |  34 ++
 drivers/usb/typec/class.c             |   9 +-
 drivers/usb/typec/ucsi/ucsi.c         |   3 +
 drivers/usb/typec/ucsi/ucsi.h         |   2 +
 drivers/usb/typec/ucsi/ucsi_glink.c   | 615 +++++++++++++++++++++++++++++++---
 include/linux/usb/typec_altmode.h     |   3 +
 9 files changed, 619 insertions(+), 609 deletions(-)
---
base-commit: 7f3fd687151a552038967f31993f1bc7e447b99e
change-id: 20240408-ucsi-glink-altmode-293cdbf3270c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


