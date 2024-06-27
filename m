Return-Path: <linux-usb+bounces-11744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D591A97E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 16:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3534A1F2505D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 14:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12260197505;
	Thu, 27 Jun 2024 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1AorS3A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63AB196DB1
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499486; cv=none; b=HUHpJsCiYECj1arFrJ1YvEJMnpl9z0aQx7yeW8Nvw8kJ4o0Ucrhd2YmYi80gVO8/JMSGH3RlXjS7sM/CyzSrQUEmtrApc0hjr7+1X9KqB6d7LE5y8rWn2LCRjfd5NGlCBx6LUevDsf68fy9Lqfrma0hYrsAOusKr6rSTyXv2Xok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499486; c=relaxed/simple;
	bh=bV6pMkV0+VB/9V9ogB8UlgFP7o3YnKPH33jLb5wU5ts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c0WfuYAsG22+yqxv38EzWNAc1uBXCnCOhNf5RBS49zn6J8DeswexGm3XTrj764XyOx32ZX+ubKkOeO61xR1ydhehtSsR3Fbm0Ln94NIi7+SUCS5IuwDigmIrb4JJFLpqeIDa4n8+xOkOnLawM7P5yyhRTUnvfTGP6PRDmRzeyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1AorS3A; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec5779b423so59729291fa.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499483; x=1720104283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OU3mOlwnB7yXdNX3pzXS01pB5G7EZpP4xG1jI/1t+1k=;
        b=Y1AorS3AkbwfjqY85LtFXC1FyJzNPI5CVM8HjzNIMHu77KyTDLjUjlRz71k6LKwYJ9
         FS0HI6X5xyelg0rFU72TC20lrYEgs1krZ926Q2rdGJCJhd6NRy6TFz1iFvFciaBAH+7w
         1kR+/aLp8gJL8fq+LMoF4Q7HFzbWP/v/g7XpWpufVTEH+bBy1XuOJVxBY5968cH4BNZz
         3d6nTx/cVY4xB0qUk5PK3XTNQPzgC8xgdXjU5nOqaGrmEGgKvKtRpT4bwrELpdRLm7E4
         /PM2yzEEztR6IYgEKXAhqoO//nXeTjGGFiiqEVkIsgJkeNnyel26ZcMpFScMh40Zbct7
         w7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499483; x=1720104283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OU3mOlwnB7yXdNX3pzXS01pB5G7EZpP4xG1jI/1t+1k=;
        b=OKu6EJtgkFYlZuinZAK3jQgW9bsuV+o8gl+RBIVLmgxYk2uxZ3W1rs8bICQM75SXIu
         7gqlkynoUcel2GhDzvmGLB5gF7jnpnmJqGrwCmrF/ckK/XR0PyoxSnNuxPvYTRovFoLM
         +p2Kc97XRJilbAq+dHo7ggC6v3Pn7EVWK4gYUT48XByv2QbqtK9qwr8CUNOfLmC3C6X9
         nPhcrlYOKQOotVdhnK/DY7KvOy9XFZZsJYbvBwOefblfrl94gAh7/MelBLmzAeK+YJxC
         KWT5Q5GMQq0Bq7OTU7dVqMBNpvF24cGgcnli1PY1j4MQvqkPDSg/yqlRx39f2vjb2kIA
         n+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVTvL//HJbBjWe6z+hPla656hQfR16RLhRj1hVb32NOr1O+ZhM/TJX1g/U1gPUPqMHODBMW49J6zBc0mUSLThwt7sj1lF9WBWuM
X-Gm-Message-State: AOJu0YxJf7zSXc3O9AAvOoP1RdbGGRih9cBwfDh4/UyhFeCoi0E0Xzei
	MDzxAuqUmW4vSavPK4jOfYDOmLltAeYGyVwpmd0mLGDIorOMkWxiEyJz8z0APxQ=
X-Google-Smtp-Source: AGHT+IEawBNGQyhMDfZk05i3TKpcNT+YhEEzV5vSCXQFMuu8PQZieFyGjjzkLFDHqSWQ0x8moGwfKQ==
X-Received: by 2002:a2e:b6ca:0:b0:2ec:4de9:733c with SMTP id 38308e7fff4ca-2ec59310257mr100015781fa.9.1719499482923;
        Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/7] usb: typec: ucsi: rework glue driver interface
Date: Thu, 27 Jun 2024 17:44:39 +0300
Message-Id: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANh6fWYC/3XPwQ7CIAyA4VcxnMVswHB48j2MB8bKbDTDFEWN2
 bvL5mXG7Pg36df0zSIQQmS71ZsRJIwY+hxqvWLuZPsOOLa5mSiEKipR8buLyAkegc4c+xuQtw5
 45b0QWnltwbG8eyXw+JzcwzH3CeMt0Gs6k8px+hV1IRfEVPKCG2N1WynlwNX7C/aWwiZQx0Yyi
 RkjyiVGZMZKY7w3uvH1PyPnzNJ/SWZma7Wrodw2IO0PMwzDB3y8vXxJAQAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nikita Travkin <nikita@trvn.ru>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bV6pMkV0+VB/9V9ogB8UlgFP7o3YnKPH33jLb5wU5ts=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXrYk+USNOvo5MKGxj+al1QwKFMYgN/fC0KdH
 AL11aqxH5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162AAKCRCLPIo+Aiko
 1RDFB/9T7NQaaf13GsUbtwV5QVP8vJXFzfmwMieA4x3a3gV+YOuz/RPy7+T557w6o9XTQjAOdSj
 nRRJABvhYU7BCY9Jghy3/RAHQEZxiQJjIEAWSqJQwi6+4Qy4PJ9wZvAIO+k6Yp46wfSSJMrhhc0
 roNYrd9usq58bxfFuh7a0oEd2FEMpmATUYt7SlkMN0FAAsUmYiTUZNiWLDLVfKboH9ap3oCVtHS
 OVfqGTw7bZYnnK2am/90mDSRq0mDc41LITRKiTjtTaFefr4wVJ5mYAoPSPQ3dxIQaTwQL3ROapQ
 TKRt8EcmMSdJCgPghifjuqlOC/SmXEfuVjjQY6DIZPeiI4rS
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
Changes in v4:
- Rebased on top of Greg's tree to resolve conflicts.
- Link to v3: https://lore.kernel.org/r/20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org

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

 drivers/usb/typec/ucsi/ucsi.c           | 221 +++++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h           |  26 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 127 +++++++++---------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
 drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
 7 files changed, 325 insertions(+), 409 deletions(-)
---
base-commit: 878bae2ba39bdd581cbe77d8210b9a03ae172adf
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


