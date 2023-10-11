Return-Path: <linux-usb+bounces-1450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA307C502B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F921C20FCB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980EF10963;
	Wed, 11 Oct 2023 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNJtxGnV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740E10941
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:32:52 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685D1A7
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-503397ee920so8440176e87.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020366; x=1697625166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QIeMMhcSryQxmA+otjPSDtQCoEfBMg1N+BkKe5wFu8=;
        b=uNJtxGnVeBnjSN2RO5hwudMh/nyZiWej5RqaiLcUbuVGIhTvyDZARfqMNBe27XQvl5
         80yi9mtFAtEO92WhNiSJ4VW1HsuQTsHjfDfOc41lUCKynbRlPYWDzwh7+rEWgqCitXN/
         w7RRhS+XkXo6UwL9fKMoeewcd1oTaV9i53qD6Jfxf6Wh/W4N4f70bCA/mZWnX2X5p5Wv
         PvTHHLQ3xbQzun0DVXuctHJBAKV65hnvXGEV9rBf7CyN8dU9mAhNsLpnArn5cRnUsZeE
         Efzhk/ySyKN/y2BMMyJ6jcYRuD4o0Iml07e4u9LRKyHNaLYLMmArW1WP9vExWMKEM2Rh
         A/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020366; x=1697625166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QIeMMhcSryQxmA+otjPSDtQCoEfBMg1N+BkKe5wFu8=;
        b=ermCD3sP0bONv/Lk/QXmghDQBfppDeM9OhGkXq4UetnaCoUYnDnE1RxCb0+I8by7y4
         TC6BiF01GKGLymb6hcdtE0kq9UqDGwrTOPKzLQIAF17iiQ2Ed3sNh7v5ek0cPPK+/kny
         0HDRFfhuWO8oDbGQbzPRBLUr4CCi3Uy6hGXiaxIgIogxO3wbbt1z9vZ4s4R5yQC0Z6Tj
         Pm06HW+QD4klCiHQ4pNe1EstNf8zVQkkawxkpOk9GXDRJI88Xb3frlx5VTzPI4FipT3m
         NFmXQ+9x+meqbndS35GRH6aZ/QLInMHlZ6N7QE8Wqcy4QUTd0NfEjRV2TiwI03HGDEYT
         Q8iw==
X-Gm-Message-State: AOJu0YyDx0aNJooj8xfCa+WlHU7dOPxv7z5ScYCHtyzX9+0zQ89jMflk
	X+4BYGzpaFd69NmeEzpp9PSEZA==
X-Google-Smtp-Source: AGHT+IHmLHvAYx0QiL4fcVA1D7OPFE9bl/LdZFHcwQ9I74wF7LYRU/CP4cqEDFylwCc+p50yCTmL0Q==
X-Received: by 2002:ac2:4e87:0:b0:503:3816:c42c with SMTP id o7-20020ac24e87000000b005033816c42cmr14877373lfr.41.1697020366012;
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x2-20020ac24882000000b0050574829e48sm2195517lfc.298.2023.10.11.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:32:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Date: Wed, 11 Oct 2023 13:32:44 +0300
Message-Id: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
devices like Qualcomm Robotics RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 07011114eef8..9509a73db774 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1042,6 +1042,7 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
-- 
2.39.2


