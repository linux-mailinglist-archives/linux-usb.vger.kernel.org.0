Return-Path: <linux-usb+bounces-2827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43457E9F4C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FF71C20878
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E056A219E2;
	Mon, 13 Nov 2023 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJcfMXe3"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45921358
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:53:36 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE7B1711
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507a3b8b113so6268784e87.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699887213; x=1700492013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=VJcfMXe3ExiMBDQgYmCyUNtHRsDg+Yhk/Q8ESynJ1U48TbuzDon7N4dz3sWUHXWSCX
         7y5mxJCq4E7WvR4+G+VohoZfFnwToNZBhO7YVmLoxyq6gCuyXB5oH33ME2oVmh9jm1Ow
         wk+ww22bB8ouOCnSJo3BKLy8VKsPkSg9q8npY8TprRjzA0EYKGomAWuVTwW5gUgPZ/Qw
         YtaN08+KPrjWJAdrY2PVyHd42CE18u45HGYKdxa2f0xEU6MTq+RK0GNMfuGGItC3YUyS
         8vFDuHLadKsK4xyYgss2gF5O1nS3JvLp0xOnBZzqk4Xd5+ObSrz2rjvKW/IRWdYScLE9
         4CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887213; x=1700492013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=uvPu1Ro7mYMJcaAi9sWzwXyFIegh2XMXzhuirrf7x4GnYYauyBJ9GDYS6EJt5LsrAZ
         VK+LbO/7wbsonUPDZTezj3rRQVUM20fry0iGW/kswsFOiWMk8ohFkjfrtmOuJ0j2Iyx6
         IPsOW2XwNhroXYgd+LE5rGDV5D2RZOxVuAvncGwpNSdng/POSqhR1hrEtCy8UgBjFQRX
         bBjqUJMO/Ea976vznZ2D7q/iewXvgnzzb3sKz6lUXXbtwLiB5blnWskBh2iklsUOdgRM
         ZIQzeVS6ipFfOgfssR5FBKLpAUEXzRq1uf8G3zhIviwOWqSP//YWhae4Jak76Uy7ZcGG
         yxFQ==
X-Gm-Message-State: AOJu0YzNWxHHlfDXsfGahfNj0kAUUtx9nOKLt3RPj9PAGddDlxz3BPaO
	sq03udFHpNCSCNQF28arYng9Ig==
X-Google-Smtp-Source: AGHT+IFssdsSeMO8OhuFr2rnn73oVtRkLf8RT6Drkzt27EUHXdwP55jUd9bvfFdMoYRyYOwcBoTFqA==
X-Received: by 2002:a05:6512:3d90:b0:509:494d:c3d2 with SMTP id k16-20020a0565123d9000b00509494dc3d2mr5401160lfv.32.1699887212950;
        Mon, 13 Nov 2023 06:53:32 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050794b05c8asm991429lfc.42.2023.11.13.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:53:32 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Mon, 13 Nov 2023 16:33:09 +0200
Message-ID: <20231113145328.42575-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0


