Return-Path: <linux-usb+bounces-2090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304E7D41F7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 23:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4DE61C209C0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 21:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC0823745;
	Mon, 23 Oct 2023 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DS5/I/t/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE0224D9
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 21:53:34 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B313CFD
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507bd644a96so5609970e87.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698098010; x=1698702810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+rsmYD1T4XayxZO0d9Wh3lxs23SfSgBqhqU6v10yXI=;
        b=DS5/I/t/a1rn3H4PvD8WGA+Ot6k1fJ2kVgyL+MH5affyN5A9UrUaD2etC4KxhCxcmb
         IeNcXo47DTDb7WunfIukITK1ituOxtTHWyUFuB3BNqmP8VgVRUatIdEgKovyTx005s36
         UYVnHmljV+Rc6J25ZLxxYSACDnU7lSB9D4iSOfr/S+J9ZvVZRl9hFABtThciloeawmge
         dx3BTNmzBvMT7zFPbYbHPiex0dcWy+jgR1SqZjNTAsC+156NLEBdEFgp/pMfI6LZf2bk
         5y6YqphoDt7FXKcm8O3j7Np03kbxiDisJtsJyIH+iQ28OjQPaeC509EyAShDFYE9+UGR
         3o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698098010; x=1698702810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+rsmYD1T4XayxZO0d9Wh3lxs23SfSgBqhqU6v10yXI=;
        b=laRhqJFnzxhRn2/prSn1nvk73IzjDAJcBq72qr3V+JFudPd7EQbMUjbjodGuqmz9AP
         huwXS4rioiSooh+N3FJp7CL0ljImK5wSxz1EKvW0OgS9+WZBekybqNfIszahyMMUYaaB
         hHHCTuwgFDYSoGp8R5ptEqIunQr2oA7aX0fksaNfnUKZ/uYgtzVpRVHil7ccMonH+h8T
         hdNucP3AfHhSYvtvJ4a7MrIyq5mlQnrLxmn3iYlA1G4ghs9/MQ1d7WXbQ+7UZFhIpofm
         NK/r2XGROUdf+1XPAbwVZIg07wkaH2a6xISFdXb7lN/jbIYd+0pi+s7n6awlphjoAbBA
         vWsQ==
X-Gm-Message-State: AOJu0YyNlMEp+25tsAQeQWGfMEEBB/PY54ekHV69+o3WDzybbTHeghpp
	sSEE6dXeHtBEc+bs+a4sPhrfjg==
X-Google-Smtp-Source: AGHT+IGXavENepsWbia0vw4b+3iZge7gks+4vDHuc1kxU3y//RzCXGuL+EX4pMSlLyMK5HG2fNi84Q==
X-Received: by 2002:a19:4f4c:0:b0:4fb:bef0:948e with SMTP id a12-20020a194f4c000000b004fbbef0948emr7134468lfk.5.1698098009741;
        Mon, 23 Oct 2023 14:53:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b005079dac9620sm1845143lfr.43.2023.10.23.14.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:53:29 -0700 (PDT)
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
Subject: [PATCH 0/2] usb: typec: ucsi: add workaround for several Qualcomm platforms
Date: Tue, 24 Oct 2023 00:47:25 +0300
Message-ID: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
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

This has been tested on sm8350 only, but should apply to other two
platforms.

Dmitry Baryshkov (2):
  usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
  soc: qcom: pmic-glink: enable UCSI on older devices

 drivers/soc/qcom/pmic_glink.c       | 7 +++++++
 drivers/usb/typec/ucsi/ucsi.c       | 3 +++
 drivers/usb/typec/ucsi/ucsi.h       | 3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
 4 files changed, 16 insertions(+)

-- 
2.42.0


