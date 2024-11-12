Return-Path: <linux-usb+bounces-17506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3272B9C5E3C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 18:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E429D280A20
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 17:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3A82178F7;
	Tue, 12 Nov 2024 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+/aro0U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FEA21744A
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430905; cv=none; b=NCyp5fx1ngLYujSlcEZFveOCJIb29pYV4+SEMAxiSDHYNd4iQ3o7ZV8uU/cWtBTd+BR8wqpyfJQKcMlrGU9MSETlqnisiw8Fogj1sy2PDijuQtvqZE/K2/XyDyxu8wp5LbhaJDKP9uWif7YkIYuKInWSd+qKLd6MZbTBy5KISFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430905; c=relaxed/simple;
	bh=rn+jasv615xUQJB4N7xZ8g5baYva1Q/g3fELDqBa3t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kf/lZeZfRCPGvGCb3ESS6Hn9eXyj1LsN611OGy8SUF74vzXz2jir4V4rn9mwTA5ECx5KJ8vujulLZZMtj3UD7oQ+yqq5gPRXjCT4SSdg01wxneTrq93EGvG270+8cOfiEfLMISFq44g/ZQQD5C4oFSlSzp2XcROfjVY2JcoI7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+/aro0U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43161c0068bso50653985e9.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731430902; x=1732035702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDAU3CwYwIX4meKlBGetJ6SUUfzYfEjUa4hBGXQbBGk=;
        b=j+/aro0UCs+tyWTtKKkcP8k+eyt4pbd0HyyM4qDw3Ohgndqn5J11+ROAfxSZZdhdEO
         tLOQqcQfMx5RYRWFPZW3j61M1UXiZkDIvHm3nvN8zkWKPh9n1AkkThEHtGHm0PXq+BbO
         vWZ2Z+fsVSltG1NJgAyQZx/aH1vTF+toL89axkBmj/PjVLv2vR37qeRBt5aDQIYe+6n5
         AYUxoyxb9kBAWjOq2yG2A8noSgmA7sE+krujelgMGx2Lvv9cEKjTk+hvc3Wi5caxDgYH
         KLnJUk66KQrK5GYd50h3WHWYKHtF9+Quxks0uahLGpy+w5UNibIXtAWDA+Cuy5CDWdWv
         RmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731430902; x=1732035702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDAU3CwYwIX4meKlBGetJ6SUUfzYfEjUa4hBGXQbBGk=;
        b=DGR563Di+IArzMyM3Dk4SKAshV8ZnIT0RUvcHTpAOUiXh3qHXn8bt1rxJ1P453WrU9
         BsavYZlppymyeBgW5j7Do2zw/4tgn9h/eeKJZKTASC/N9MWlkx41Q5luByHbM7CyT46C
         sTD9t1ZzVozI/zBmzYCIXmXgm/gNu+xI3YOq5u4MiePfzFZ34UHejYtJPjzgFeqi3Ob/
         idKof3DCK30rIJXyHdT65dqWeQAeE8WcBwj1Y66C1czApuRBI4nFRwp8vr65LZthbHqu
         kd1XJ1aAtlv0RhQ8T8ypzMnQQV/Ovs+P5jhpc2iNUtaF1/czJpBuILG8Qhltj0YHxVR5
         J5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSCq5D4lc1jpw82Y/skIJ3F5aXCFSbw9dverxah8bG785jEqYF/a53bipks9pSwqDYCS7FwWrYYnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3us48d1dWv1sTX4/jUW5J60jBo+zi2KdgJG1EKascFqD3Q5ct
	Gl7bec9HTKnNurI6VmIgrVkTcZNuAoXwAUhrBUCNfdQU2guRNkGmC+5tZzJLhNs=
X-Google-Smtp-Source: AGHT+IE0OEDwvtbJFTeaRMmYM5F1pgSlybbTTgZrG3TWcAARzKXSju2/JkaU+mTv07QpjxCuESbsAg==
X-Received: by 2002:a05:600c:1e24:b0:431:5c7b:e937 with SMTP id 5b1f17b1804b1-432b750ac1emr162887985e9.17.1731430901824;
        Tue, 12 Nov 2024 09:01:41 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053051fsm215018895e9.6.2024.11.12.09.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:01:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Nov 2024 19:01:15 +0200
Subject: [PATCH v5 6/6] arm64: dts: qcom: x1e80100-t14s: Enable external
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-x1e80100-ps8830-v5-6-4ad83af4d162@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
In-Reply-To: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=rn+jasv615xUQJB4N7xZ8g5baYva1Q/g3fELDqBa3t0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnM4nooVrdW/yU8miEA+L4Xy9iK4msouCHUCLHx
 MvHLodSW92JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZzOJ6AAKCRAbX0TJAJUV
 Vh3iD/936X04EIfWLT0ixdHP73iLGpIg9fGVohinecPML5LM+E/SIZPJt4e4tEAtWAVm/3VljVt
 pMWl5v65H2JihwAOKI8dR6IU1Tjpg/XDCRKISzVdBXLypsT/FsGPQNr9G21ZuDpWw1Y6y5mgIL+
 6RrttKGGGa55CWweuJUxpMl8QzVvvj+QOE0D+oZVz8OHy/EW6y3/B3ftKPx3feWod9byaiIaO2F
 zWzfMAqkkn80lUm6tzvufnOrCceyQSWpBpk0uygPCod1R0jx7CalmD6g7A/kxBGACECJW7t2A6R
 xFBmzfd1TKtETema0lDa2s0koGGxKLMPozDJ6d59253fFEdAqMPoID7UbxPxx9joQBdZGSGPUsF
 iAIfzBQmlO3l8NLv+jra+Z6DkphpjxFfOZRUABFKZtJn/0YnUP5z2rRe6IwTKqckMemgZoUshm/
 V2LvUWtH6qd6t1hTLiuEiwJCsdPN2rYNbUH8OYwRNokg1ZS6j/R/INTE6KANcWkM7nJ4z+QWF+H
 AE8TZh7tk8EhEMIaqCk+mL8g+TKOigMWEDOnvZA2wvnOmnkPzE7DjeFTwdoiL2zoCMwJmPZ3QaF
 wfxIX1MED70VwUTzaDwovsPrRMIyCk1UmFrQOgfruwWRj3QV9lqW5YmI1KF47xI2yRK2JowdGgc
 HQO/SeejfR0k3gA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Lenovo ThinkPad T14s Gen6 provides external DisplayPort on all
2 USB Type-C ports. Each one of this ports is connected to a dedicated
DisplayPort controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable the first and second DisplayPort controllers and limit their
data lanes number to 2.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index ea3ecc7c5bda24f3a0a7bb027b456462b11daf4d..b08a173f0cfe2a2fc241a4e689d35b5e7e03d7e1 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -746,6 +746,22 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


