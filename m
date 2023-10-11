Return-Path: <linux-usb+bounces-1449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4057C502A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8CC1C20F47
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FC710964;
	Wed, 11 Oct 2023 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tK8qo+ec"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85D10951
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:32:51 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D6994
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so8461195e87.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020366; x=1697625166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLMM8iJLu30hrQyN+J6YeFrjzpqH0dHr2+bM9XqLIfE=;
        b=tK8qo+ecsXE4f1ezjug04Bm1VV0nr38WHFSj49GF3vy180QIvLdLfB3sSgPU11LB6E
         qno8kJq+2K5UbHP6lGWyiffU2RmeQDnGHztcXfEF0SKTcwsghkDnH82lh/TM99VvSBsY
         wPYD7tClM5nDRBtUIveAVk6fsjwBjyO3BDa3lz+QkjCh1zx9DJH/nqkjNkrE61bjUqm6
         bkHHuTCKDlb68SBKq6R4ztDxDJ+FR2gtErNrCBnDc5zTE/65EY3L5k8bs/fL0MG7WdyY
         gXp1jT9qqQWjGyAd+NzPu7Wjptx3GmL3D5nHopzWr1q3HoAzzyPlibHxLIjPVVCIka7U
         ukEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020366; x=1697625166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLMM8iJLu30hrQyN+J6YeFrjzpqH0dHr2+bM9XqLIfE=;
        b=h3jBVu3DqRkN1Ilt83/YZhHCyCDWw3SKjxZHGv/4hgWA2ZSrDPM107zwvHBWWGWoId
         0ZI8t4k4ip4ZLkFl+p4bryuBgMeq13Ks0QJCz9TMLkkNPpWx7tAc5IMzMs8kgkXO1KeI
         HZ4OuHxvUvb9KF0eF/Gxe7v8q7OgouEAZ0xq5/NUiKhdzr7NlXvoTkS3QVTDeneN5pm6
         kf7K5AzF6B46CazdQZpo6CtEF0iy2cAA5UgvwxgcBh+lcPza0Z6XQj5Uv4je7G1wThIv
         Hz42UTxQGllVVeIZeITGHgy6lw1ikZiIGu0DRZsaLaCIdF6g2kkI7kBh/wrUxCKhEMbF
         M14A==
X-Gm-Message-State: AOJu0YwshxP52oo8Ab/ipw0Zm5FsboN8Q/H0vdCQGVkNCSS4FitQR9Se
	u2IbipS/TfGe8Xk0HGwjfRIURg==
X-Google-Smtp-Source: AGHT+IFO+vrRnbC3xvmZ9XjxS2Y5LxPTY4gEpPwM6fm9kBoCwc0db+t/wY1/R7Wck9jlnqoavkj39Q==
X-Received: by 2002:a05:6512:6c7:b0:503:95d:f2bd with SMTP id u7-20020a05651206c700b00503095df2bdmr20815102lff.34.1697020366591;
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x2-20020ac24882000000b0050574829e48sm2195517lfc.298.2023.10.11.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Date: Wed, 11 Oct 2023 13:32:45 +0300
Message-Id: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
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

Enable the DisplayPort altmode, it is required to get DisplayPort output
to work on devices like Qualcomm Robotics RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9509a73db774..5807397e645a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1048,6 +1048,7 @@ CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
 CONFIG_UCSI_CCG=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
+CONFIG_TYPEC_DP_ALTMODE=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.39.2


