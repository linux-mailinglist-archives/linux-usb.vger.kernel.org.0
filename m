Return-Path: <linux-usb+bounces-4408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4509819BF9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 11:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11B728865C
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4D220B04;
	Wed, 20 Dec 2023 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2ga6A6By"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143B208C2
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso6814928a12.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703066579; x=1703671379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhB2sxNkKBiagF0783M3sqDgGJEaCC2xOC1nqq1YmjY=;
        b=2ga6A6ByhDbCY2zzftNgm6xE0y+Uwgt16L+0VgFjPjV4ycTP3uZOadOK46/3mNz9fb
         +RV6/HQ8QvbzfkplF5pHNw81X7Qoonqb09dGOqYICQTegElLRM99FF5eMOafTelLROJK
         Svsec8q+mmjGI3hS2JGiIWX43jfpt3ipiwbYoQAbyyLB/Ogp7YFulbVSTWWN6XDPHj9S
         8Nr0AxZf6Vc7VK+rusc0j+45vpZUdddYFGykNvu6rm0QD9gN4DWSJtTsD3kJahtTZD4b
         KYmFmF4zT7kOkQsbcwsYUREIdjLrvWIzq3XTIxPhG3E90dI/HSh9KN0jOv1hIKnY3A+W
         nINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066579; x=1703671379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhB2sxNkKBiagF0783M3sqDgGJEaCC2xOC1nqq1YmjY=;
        b=uKW3JCUu/n9LdIWs15+HB8Nv205zbEe0PMuBSZB8D0vteUjXuvkaXC0BKVg6qUL3e4
         vtLpFFgss6DcxvtLpf9FvsO8hijnDX9W92fKlx/us9Ng+cYHFOsNg19Jhg9+JkkFL3mK
         Dv7lRgFm0xH1zcdBZcV5NgxKZVtqyGPTnyQxXJhvZ5e6r4UpxzavQHful/ZzV6ClE2ms
         nhMT7PelbT0CX+6v0WTgOf29IskirwgHaK8glo06uNRODAKufFp5TK8/kVSC6paq08IX
         qYeUnTyXMaxFLDPFS4p/6lrfVUnfLMzoGkP/ksUJQkWqW9psdtETphSVbVNtAGLEQJck
         gXGQ==
X-Gm-Message-State: AOJu0YxzEU3V3oyIEwalXC6BKCI7ieo2Xys8m/l3eJ7Acg0fIBdeGW+b
	un37XOf/DoUKGieaGzT23TVwDA==
X-Google-Smtp-Source: AGHT+IHokmA9+d5x8tM9eQ1Cy3LVFwwsHmIA3JK2l1zkwjRap7mv+9Js+V7gnKo+1ddD+28jHQXyPw==
X-Received: by 2002:a17:906:26c6:b0:a1f:7298:aa25 with SMTP id u6-20020a17090626c600b00a1f7298aa25mr10590034ejc.45.1703066579067;
        Wed, 20 Dec 2023 02:02:59 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906561200b00a2356a7eafasm3718681ejq.199.2023.12.20.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:02:58 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Fairphone 5 PMIC-GLINK support (USB-C, charger, fuel
 gauge)
Date: Wed, 20 Dec 2023 11:02:55 +0100
Message-Id: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+7gmUC/x3MQQqAIBBA0avErBtQK4KuEi3MRhsqE4UIxLsnL
 d/i/wyJIlOCqckQ6eHEt6+QbQNm194R8lYNSqhOKiXQhgHDxQbdyf7AVcitt1qakTTUKESy/P7
 DeSnlAw9veBRgAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

This series adds all the necessary bits to enable USB-C role switching,
charger and fuel gauge (all via pmic-glink) on Fairphone 5.

One thing that could be made different is the pmic-glink compatible.
I've chosen to use qcm6490 compatible for it and not sc7280 since
there's plenty of firmware variety on sc7280-based platforms and they
might require different quirks in the future, so limit this PDOS quirk
to just qcm6490 for now.

If someone thinks it should be qcom,sc7280-pmic-glink, please let me
know :)

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: soc: qcom: qcom,pmic-glink: document QCM6490 compatible
      usb: typec: ucsi: Add qcm6490-pmic-glink as needing PDOS quirk
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMIC GLINK

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 46 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 19 +++++++++
 drivers/usb/typec/ucsi/ucsi_glink.c                |  1 +
 4 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 76fbb7732259f4c970998d6978d72177658a783a
change-id: 20231220-fp5-pmic-glink-b01d4fa1c7ea

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


