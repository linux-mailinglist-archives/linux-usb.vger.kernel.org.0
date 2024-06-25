Return-Path: <linux-usb+bounces-11641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0157916B21
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D400B1C20E95
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4B016DEB3;
	Tue, 25 Jun 2024 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tu4NxBmX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52B16D33B
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327272; cv=none; b=I7AE/hCsBzdnjhLSIPB2c3f7FTJPodi5PPg0ixtDtzxKX35OOxgoTjF7KAILX4yfqV7XBKlDs52O0BO9zI+cbrlVOinxytE2ohTd3xfHyru4dT3xPgifvxRDiAOVRZQGMq/Dal+IHaIJ2wiNXjKrdE5fXWsuuDZhirH39xFxIXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327272; c=relaxed/simple;
	bh=zRKg6mWitu11c42NN2MnOy4OSiuaKeH1XVqNTKR3lj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q+BajcCBCjdiUIq7hFcCaYUgs2u7ipYB+RPMDGWkx4PoKS43lO4tvj8/wXCnewN/4ySFsxWIXTPNnvk7L5PTEG6HUdyisdGSvdKZf8GQLZEKZa3XpHbT9vrZ5JM6KwMUyVnhE7yTsOpKksLmCdUDmiFOCNYf9+a4fLPDy+ujRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tu4NxBmX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cd8897c73so4380127e87.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327269; x=1719932069; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSweAIPoKXuI7H4LOqoZzWikrFkReHajx8tj+okt9I0=;
        b=Tu4NxBmX9pi8a4iBSGspVEc6TKVWpqDEyXUUDXRs/TwrhtzcvBLvj1Sq7MJ9ipgZ/F
         N6aTMvYsvpNtKnRqcBC5F+vFjUbnrqW+LFVTFwj5TxZuGhM8HbwHDmPtoRicrZ8itJpK
         0SDa+pebM+BFEL8VE4qQ+GLztFJbZM8kK14luzTf3ZY2IvyACjN5HXkBPBmmyaZ9dNb8
         QTMoY0Hdg3p/oyw9dPRmLsvXWIOCgRln2ES67niELwjYbF/W2PFaOx7Z2jcRpo7JKPx7
         eEK/5ouNM3LmCRF2Cf6IDd+iPmsIFKiSE/WGvmjq35Ad5SXL+UBZcaGWpq4tqUBEIKVI
         LPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327269; x=1719932069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSweAIPoKXuI7H4LOqoZzWikrFkReHajx8tj+okt9I0=;
        b=ZyJva6H24KMVT7y2yLgxxlvGzt8qpLU+qZXUQjN2JrY8mP2q7aUxdErCZCRfRuW3AI
         W+f+gkvWGhwsxMSvnO0eXtOuxs4MimcdF1EOBl285mprm+7nxhLlauUnN0EKUNs2BPnA
         BVUBiZ1Tqsyif47rwwP79/G24BTPgtYv3K0QB65Ssm0PnGWHpY3Fp7yOC+QWm8/k8sA9
         O489KWFW4QmPqSj3Tj+iTD3yD/y9JnZentDYeAAeDjkpLufy5Vwaah56DseOJCOMkxHO
         /GK9AJBw4eRdQUJNM5gPDXSt26xBM0mQHo2573fAFv1QdqL3IljZdXzD3gExZ0ZZlJ5N
         I+hA==
X-Forwarded-Encrypted: i=1; AJvYcCXa6JVUrdMN1qcACgTXdsqR9g2RcjKn6sf2ea9oJCad+rkqAjysh3Tt2aom8axWbPjSd4uLptnBiyUsWr/hoNjFPjjdD91/ZaKy
X-Gm-Message-State: AOJu0Yw3nxd5KtIhZzawwm/9XR145PyYlefmLcSGsOEBc6pfhgZRzyce
	CxdszX7vcFXJsWDSLo5GmdcvqH2EYOrQGst6BR1KmuPBkr4qh6fpxk0QVu0M4Tk=
X-Google-Smtp-Source: AGHT+IGeR7Mb8mzSff+xkx/yZpp3fQkqTztpSXyNBdXwUXBi7RBdm5R0F5OHiVIGXyAdCOnfrcQq1Q==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id 2adb3069b0e04-52ce183add6mr4527968e87.33.1719327269161;
        Tue, 25 Jun 2024 07:54:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:54:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] usb: typec: ucsi: rework glue driver interface
Date: Tue, 25 Jun 2024 17:54:25 +0300
Message-Id: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACHaemYC/3XNQQ6CMBCF4auQrq0pBRrqynsYF7VMYaJpzRSrh
 nB3C250wfJ/yXwzsQiEENmhmBhBwojB56h2BbOD8T1w7HIzKWQtGtnwh43ICZ6Brhz9COSMBd4
 4J6WqnTJgWb69Ezh8re7pnHvAOAZ6r29SuaxfUYlqQ0wlF1xro7qmri3Y9nhDbyjsA/VsIZP8Y
 WS5xcjMmEpr57S6uPafmef5A6rCgBcCAQAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nikita Travkin <nikita@trvn.ru>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zRKg6mWitu11c42NN2MnOy4OSiuaKeH1XVqNTKR3lj0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojbLrVWL1KxL/3+AbHhHJv1YRcYzQQRHB/+
 h1vtmKVpkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1RgDB/4gKJx8pOyKonR8hoAZs8N6uQfaS0m6ZS8C12DOGIsOmj8EhMwqGRG/WlU+e2o7/zwV5b7
 JQVzIQ/4Z73v39NBv26Ayj6nvXRYxtcg825wgzqHUTON9txQ/3IKYyTNEudMPmRxI+licVGwe+9
 ARjxOQTAEqZZepY5jQwusAlcE8pKIm+jKgw911/xi4Ary9atBJRvrU4pKt1rrtp3EhCmIrQAtJq
 6ymbchcfeBhgIh0TUjk40TeY80bihzj8L2GROdqmK3b5TIsxTYifm8nANyFI/DuBe7DQ/ZghnIq
 f9iCqUcHT4ovuC4pPPFm/y/uvRbEExcisxCsGYnGWRA0xx8x
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The interface between UCSI and the glue driver is very low-level. It
allows reading the UCSI data from any offset (but in reality the UCSI
driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
is to be done by the glue driver (which already resulted in several
similar-but-slightly different implementations). It leaves no place to
optimize the write-read-read sequence for the command execution (which
might be beneficial for some of the drivers), etc.

The patchseries attempts to restructure the UCSI glue driver interface
in order to provide sensible operations instead of a low-level read /
write calls.

If this approach is found to be acceptable, I plan to further rework the
command interface, moving reading CCI and MESSAGE_IN to the common
control code, which should simplify driver's implementation and remove
necessity to split quirks between sync_control and read_message_in e.g.
as implemented in the ucsi_ccg.c.

Note, the series was tested only on the ucsi_glink platforms. Further
testing is appreciated.

Depends: [1], [2]

[1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/

[2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Rebased on top of the next to resolve conflicts with the merge LG Gram
  patch (Heikki)
- Link to v2: https://lore.kernel.org/r/20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org

Changes in v2:
- Dropped the RFC prefix
- Rebased on top of the fixed STM32 patch
- Included the pending Yoga C630 driver into the cleanup.
- Link to v1: https://lore.kernel.org/r/20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org

---
Dmitry Baryshkov (7):
      usb: typec: ucsi: move ucsi_acknowledge() from ucsi_read_error()
      usb: typec: ucsi: simplify command sending API
      usb: typec: ucsi: split read operation
      usb: typec: ucsi: rework command execution functions
      usb: typec: ucsi: inline ucsi_read_message_in
      usb: typec: ucsi: extract common code for command handling
      usb: typec: ucsi: reorder operations in ucsi_run_command()

 drivers/usb/typec/ucsi/ucsi.c           | 215 +++++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h           |  26 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 127 ++++++++++---------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
 drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
 7 files changed, 322 insertions(+), 406 deletions(-)
---
base-commit: c0068dfdd1aaf0fa9d60367b0f392ce145ee27c3
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


