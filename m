Return-Path: <linux-usb+bounces-18429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 425039EE765
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 14:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40FEE2822FD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B58D214236;
	Thu, 12 Dec 2024 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kM3M//hA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E32209F5F
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734008928; cv=none; b=a+YVSrdpuRNxCa8xT4AzEUc658/YqMJLhao9+jm5PHL+k3LOEfFCsW4TmWPjQ8LxyxR9qyGeUL8OOl6kPK+XBnDvOei53zrnPVjmQ0BO6vhdLpeH7pzDkAT2VnHziBXoYYCzgJ7+qX8ewtzArEM2nFw9jtMQr7id5X7MgtCbQew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734008928; c=relaxed/simple;
	bh=UFD28TkJljZHWIG/COEi/QEH0/KPejNH2q0f4aHxkrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BrBKOd5eWNoPQwqw8Azt6IeRzGQ/4GVOZJ1v/MwYnDScmKoHoP8c8XnGiqS0eQtZxu7/kRH5NK0jbzRJH8Z4jSViC395DLXZ7aX4HnaTQ2M0eyFSrEsYjuNRrZBm4hbxW733Gqikll3sNGrB6SOCiwgHIuO7oj6mtNzYS48ZqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kM3M//hA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso74066b.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734008924; x=1734613724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSth3/irkWCqbGYvPdAI4UFQ10GoXyRIpHT4W2xQ1t8=;
        b=kM3M//hAZlm2x44xX8xrpQ+oJ55csQ/ML6ZrH4Gaph9xYBLgKRUH1Tv5PGnotU5tSZ
         bmTPu+mPwo8GId6PoVD5LQXE8B9oZxzFvshwpawfWNLOlzBk4A2x0T2QZ3EMhpfgk0FN
         jV3PpsW+HuXcGX1gvsctpJb7v9YLIbyCJrGMty2TQJEa5lWwohtPt27AGH2azq/rR3wW
         46+SI4dG+ehsP20oWIhFU5hR9QG5mBi9BNl6532VtfM5nyy/BVi7wdPobKwd56ydbTV9
         bAtOXy5dPB3i8xp9nwAoiy87FtnzyOa+6kt+Wz+sXDyHKg0/oSJxDO9+yhAw5zf5NK7+
         JSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734008924; x=1734613724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSth3/irkWCqbGYvPdAI4UFQ10GoXyRIpHT4W2xQ1t8=;
        b=K5pwoSQ+GqR/Fth/w2MBtWpfpSznJRK7WsHvqEyMaATMIPGXzlYlFZvNyo45peCCWx
         5E6nSjmCEO26If3fdPxkcJa0KXKTRXiUHqZb9XNC+YFwf4P5hU+r/y4LncDzX0zY/xBl
         ClN5QKbT8Q9YT3m0EFB5uiaQZVayigo9ycrdIgN2lpjzgPXKNaHAzzn8sFpADF4y0Rrp
         OiPqhNFtJnZqXX2VB7kobJvnDrvGlOYgYBaKyYp9+YVdI+84lhBP0D9KmujMWlEjHQVE
         qCNukw8tW8sPskpOlOOMBUGYyd87lG75Te/K0ajMWodUqGPh8tuO2rEgJw4cNuFI+HHN
         u3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+YyqURni2d3IgqffvRQLmO2u+F8APxkf6mlJIHrgaEVHKQCBOjOThW+oyEh+VTQLQkmy9a0qISoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkAXYyuBDRanw3zIX3qj/YH/MlD6HdJyXWs4PduvuFqoA3lkUQ
	HybMIEFAmYx6VjDabOph5D/z6Gy1phE6K5ZBmK3bLIFCVno9R8Zgbx2nfqdEnY4=
X-Gm-Gg: ASbGncurw1BnKt2gx1Ft5u5gU2oYvcRlTEHAROZwJSlZz4jdLoHrO21qvtoR/UJqgIz
	HyXWcodJeDotMTWzqgxTgn9vRsnAKYB+7WNK39kPq2fXCt2RflbLfEsDa7n/qMKfuSPwSNRGw6v
	NiUsPuuU19dN9DbLeTFH6jILrg9ZSH6NZM8KH4f+V5SnuLbK8K8AsvCYn7E3nuwfwF1W8xLDx+c
	Vgvx8CfEWHa4iiTZAktsrbitb8mGANpkOyOHzHx30v7Hps3n/Ko71MH2jJJYnBrdqdjTg==
X-Google-Smtp-Source: AGHT+IH5HnspAa4JrCnVw3hwDOXAnn4yvcS0nZlULcM6v3q4z8daLlH1OPoEy+LFJrd9QTFOsOaImg==
X-Received: by 2002:a17:907:3a57:b0:aa6:6331:936c with SMTP id a640c23a62f3a-aa6b13f8d18mr561440466b.59.1734008924498;
        Thu, 12 Dec 2024 05:08:44 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:3c0e:7a2d:e7e3:9cf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm605843366b.73.2024.12.12.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:08:44 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/3] Add FSUSB42 USB switch and external DP for Qualcomm
 X1E80100 QCP
Date: Thu, 12 Dec 2024 14:08:22 +0100
Message-Id: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbgWmcC/x2MQQqAIBAAvyJ7TnAlQ/pKdChday9mCiFIf0+Cu
 cxhpkGhzFRgFg0yPVz4il1wEODOLR4k2XcHrfSIGlFWJKtQKXm7JH3HGY1k7OT2AL1KmQLX/7i
 s7/sBgh0rN2EAAAA=
X-Change-ID: 20241211-x1e80100-qcp-dp-dc521e586cbf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The Qualcomm X1E80100 QCP has FSUSB42 USB switches on each of the USB-C
ports that handle orientation switching for the SBU lines. This is needed
to enable DisplayPort support for external displays.

Add the onnn,fsusb42 compatible to the existing gpio-sbu-mux binding and
then describe all the necessary components in the x1e80100-qcp device tree
to make external DP work correctly.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (3):
      dt-bindings: usb: gpio-sbu-mux: Add an entry for FSUSB42
      arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches
      arm64: dts: qcom: x1e80100-qcp: Enable external DP support

 .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          | 178 +++++++++++++++++++++
 2 files changed, 179 insertions(+)
---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241211-x1e80100-qcp-dp-dc521e586cbf

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


