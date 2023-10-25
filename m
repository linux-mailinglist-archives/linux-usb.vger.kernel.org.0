Return-Path: <linux-usb+bounces-2169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0E7D6A83
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 13:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DAE2B21162
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5855727723;
	Wed, 25 Oct 2023 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQLq+hLo"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AD266AA
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 11:56:25 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A653E13A
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507e85ebf50so6328075e87.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234982; x=1698839782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tC3hBlKDyTX0Pn0eODz43Ay/ko7vlr8gv2SdlQMKZ44=;
        b=pQLq+hLoXVddm1Dc85Yg0b1fSq06nSPXVucNeAfZJZm83BxFF9pvaZfdWZsRgvFhuz
         OjsuSeeX4FmfDz6b91c4iKeti7cE8p4sW2bJRZKYqVtF34tGbiAOqk1UHofbkaIfyvUk
         +YoZfLykyvJpkLbzNxAW94p6DAmWE4BaAOjTvREKAcjGABBiLo+jDhY2EEf94su8Wt7N
         bc6OXYBMUD09TN7bNAltGewCM/mGHBpMn0daHiutkkWYAeIrHCrS7JQOof0P2JXzmaMO
         Pus2oH3VhHWr6p0nL22zhw7voVaJJhnejPCs4Gb9gEXve4nRwCtlbLYCvPfkhcK7DK/8
         gCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234982; x=1698839782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC3hBlKDyTX0Pn0eODz43Ay/ko7vlr8gv2SdlQMKZ44=;
        b=B6t5tVRbsFaQ/FGA13+ExoYezpaEUGG/Dyq7hYG/aMOre6wA6t+I3SfqZnEAfUToLX
         J0zIIVvTBcxWHV4DHZ9eKZSgAfVROxrMfTTbK9MAq7jiWYWcYWHGaeFNuDy6EFD1ES3O
         QlD3upkvWcveLf6kmUBeJheOzjg+MXnQbvnJ1NQXz50QOmAdiRabIpKsptUslAZCgbgk
         F+m9Qndsyl7fXIhdsPK3xUfGxCE0TgOjyCq3sn3GlalrR5CLh/GUfG4am0XqREZJWG4/
         9AO7YJyo6khMm0adijcTV9MDSGi8bb3JF29dpn41LJNjBJX46XkOq3aRvNzv/RGiDsuY
         S18Q==
X-Gm-Message-State: AOJu0YwOLeRKWLUs/XkU+bzXq2bReBiLgQ4wZ9KPHTaAoT/Eg1ktONld
	8PhhYmXVXrVsRrZOXsLQJuzY9A==
X-Google-Smtp-Source: AGHT+IHDASrMbvXnO9ZZlU49FTn7UPYZ/j7ox1h7m7wzGxNtISh2kopR63Wq+eP/XKEKn9P7fSoJiQ==
X-Received: by 2002:a19:4f0a:0:b0:4fb:7559:aea3 with SMTP id d10-20020a194f0a000000b004fb7559aea3mr9593648lfb.39.1698234981887;
        Wed, 25 Oct 2023 04:56:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several Qualcomm platforms
Date: Wed, 25 Oct 2023 14:49:28 +0300
Message-ID: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
Submitting UCSI_GET_PDOS command for partners which do not actually
support PD and do not have PDOs causes firmware to crash, preventing
further UCSI activity. Firmware on newer platforms have fixed this
issue. In order to still be able to use UCSI functionality on the
mentioned platforms (e.g. to be able to handle USB role switching),
apply a workaround that completely shortcuts UCSI_GET_PDOS command for
the USB-C partner.

This has been tested on sm8350 only, but should apply to other
platforms. I did not enable UCSI for sc8180x yet, it has slightly
different implementation, which I'd like to get tested first.

Note: patch 2 depends on patch 1, otherwise people might end up with the
broken kernel and crashed firmware. The easiest way to handle this
dependency is to merge both patches through the USB tree.

Changes since v1:
- Check parent's compatible in the UCSI driver instead of using
  different AUX device names in the PMIC GLINK driver (Bjorn).

Dmitry Baryshkov (2):
  usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
  soc: qcom: pmic_glink: enable UCSI by default

 drivers/soc/qcom/pmic_glink.c       | 19 +++++++++----------
 drivers/usb/typec/ucsi/ucsi.c       |  3 +++
 drivers/usb/typec/ucsi/ucsi.h       |  3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.42.0


