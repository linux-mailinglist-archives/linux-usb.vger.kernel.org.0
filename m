Return-Path: <linux-usb+bounces-3629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4D802A1C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 03:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4254280C53
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 02:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C424A3E;
	Mon,  4 Dec 2023 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuIt6aEX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C17106
	for <linux-usb@vger.kernel.org>; Sun,  3 Dec 2023 18:03:09 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso846878e87.3
        for <linux-usb@vger.kernel.org>; Sun, 03 Dec 2023 18:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701655387; x=1702260187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=RuIt6aEXs8YvqAjLVu1VycJ5l75taKd0KGIVnK8Dbcj8QEY6jLV0R2KXy8bUS82b6E
         lbsqKw4flKq9JAIP4R61UGRKrbK81JdVpmzFulpFj/I6iOHdgjKJ/3hEenG8vKlnOwM2
         RwhPlR1YznyNuohXt0MTZClr43lKK/9OlPFuQbzOK9sJ1XhqgIkrsz0U3syfgi0vhfPi
         YMo3cz1+s0CMLgmXq5B4IcJSfUoYuGcmHnwbrQa9pwCa2SMwoni/l2saHET6wcmdN1/K
         ib5S5Hu6DVmy0EAkQfdERE8GGRsKDqDQ8bapOP63lhGigVosTfGvOZk9fzHXkwkagY9o
         W+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701655387; x=1702260187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=FJbAkQDySRUvCvLYVl0q+3DEZbijLaHHpKGSZ6OwglDPYTRb14yGtMAWqZJXwYl+pm
         wSVW+AsiiI81JWnWthU0WnLeSHxODl+l4nmCXwrJwXSybt9+c4lWXHvOT+50nrQfFL93
         +9/TfxqObHXYrfllH7Z+BKipuSrhJwIUYbXr7/vTKkb261rI7H7GGT5z8tb5zzKgvxpC
         MRdz9gNRjqvX+V87V3dc04KFPbUkxj7NcYrbEwBB7UquDlSBAZvpWyNAaiuCtTGVwf6O
         ZKCorTBUO+YS7Nvit/F6yCQMeUK5BzxoIYqNbRypRHepGQJWqtPUD1gqpDc3rZNx/POG
         YiVA==
X-Gm-Message-State: AOJu0YzijYyj4vwiX5+XguH2EhQkW1WE7peAN0tB/EkEmeNEc+lQDwmO
	LZr1aX5BRAW0uKXNuTCb+hjw8Q==
X-Google-Smtp-Source: AGHT+IG7QyaVUc2ZKhy1cxZKsZEOS4C6cyPro5nNM707U6/C0w0pXqPIoFPEWzbXku87m7lBxnj77w==
X-Received: by 2002:a05:6512:3ba4:b0:50b:de3b:5359 with SMTP id g36-20020a0565123ba400b0050bde3b5359mr2580077lfv.107.1701655387091;
        Sun, 03 Dec 2023 18:03:07 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b0050bea5c2850sm525381lfr.39.2023.12.03.18.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 18:03:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Andy Gross" <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konrad.dybcio@linaro.org>,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Mark Gross" <markgross@kernel.org>,
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Mon,  4 Dec 2023 04:03:02 +0200
Message-ID: <20231204020303.2287338-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
References: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


