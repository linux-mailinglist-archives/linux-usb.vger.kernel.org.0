Return-Path: <linux-usb+bounces-2824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A97E9F41
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264D41C208F7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A992111B;
	Mon, 13 Nov 2023 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQQEoaJQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFBB210E8
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:53:33 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639E71724
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507f1c29f25so6118363e87.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699887209; x=1700492009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h53jKEflW3e/C/cuKnWnlAqCfzD5OxoKB9wqj+QaJ9E=;
        b=cQQEoaJQpUIvNyXM+Zrt7QDmVvZDwUD8AFvXeaYQQ8b4HwbhKu3leLBD9ewNjEoGDu
         Ijyd0LNohIvYFtJ4pU5tPSQOGGwHzKy6fDni5vaLKtjwSyNq/2pmfDmMnlrLOhCvJzBU
         VYInYRckRoBNMBLOCC18Si2dDsipo+YVfz4JcaqncesHZO7piwq5599fsqTslSS5djI5
         f4kTwpDtSXTWHm3YUo51NTWLvtN7MWNTwi9my/sxPERKvhWOYbp45zPpz2flx3Swla3i
         Hj2RcbfJOR95hZuV58etrbURfCXB60AjU/huMfwTHORNsbt0mljHqEorCqN4FXW3P4lP
         J8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887209; x=1700492009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h53jKEflW3e/C/cuKnWnlAqCfzD5OxoKB9wqj+QaJ9E=;
        b=u+HN/1XvVcBPPjpF1G9Iv+5Ese4VtrSrgJ+IcAW/ijozDWHSqrqB5qAwTlSySRYtOM
         BH+le3XvM16VOI17oyuS6QNSBCpDtu0pJbIxw222cSGmnbcY2ViH++v5pBO9gQB+X/De
         uYtUmeCzfoKQEDXmuv+NKzvVx6rkNM2HJ1/hLMl6dywr9l0E5hQIQkJQm3VUGXL4gust
         jJUPxYvvK/Ta2X1Ub1q8FIdDb0I6o+ocRjLfWHPu28q4+bF570auHGUPU1Us8Yju6Q4C
         3glECFQa510IpZlmjMsUhZN5a0aEwBzpBkb+CJjgsmLBvMjZnFQNJo7BMm+im8xoWovR
         wOgw==
X-Gm-Message-State: AOJu0YyK4L41ey4bZWcJTjH8Wha7auglugrQyRM+EcL8W2wB77TSrLX1
	on7BEptJ79267F1a6P507ITFBQ==
X-Google-Smtp-Source: AGHT+IEfWdXO8U4PcYgb7/pI01WDceQuQrzLOIYLYfOMG5ddcS10/Cscv2kajtCO4iZUCZ+f2JiyYA==
X-Received: by 2002:ac2:5def:0:b0:509:f45c:fae6 with SMTP id z15-20020ac25def000000b00509f45cfae6mr4757338lfq.10.1699887209584;
        Mon, 13 Nov 2023 06:53:29 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050794b05c8asm991429lfc.42.2023.11.13.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:53:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date: Mon, 13 Nov 2023 16:33:06 +0200
Message-ID: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases we need a way to specify USB-C AltModes that can be
supportd on the particular USB-C connector. For example, x86 INT33FE
driver does this by populating fwnode properties internally. For the
Qualcomm Robotics RB5 platform (and several similar devices which use
Qualcomm PMIC TCPM) we have to put this information to the DT.

Provide the DT bindings for this kind of information and while we are at
it, change svid property to be 16-bit unsigned integer instead of a
simple u32.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 +--
 4 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.42.0


