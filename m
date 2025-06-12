Return-Path: <linux-usb+bounces-24711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4EAD79F6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 20:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785AF3A530A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 18:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FCE2D1F6B;
	Thu, 12 Jun 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4Q67bzI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50D2BE7AB
	for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754253; cv=none; b=Gg1K2VF6ImGCcoNCIYvO66HVLjL0iNM1ixQ2EayukhNFOLUndzxzC2KZ/EL+WyiDFwhsO5uQeEPllgXKVT8entqQCPbIUT76lAdfPb7mcnJtndVPuJlNCEITWroGAaoiF4WGjwZKAbQH2/xu48VghDQHLBMN7jXRV6rIa5WAtI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754253; c=relaxed/simple;
	bh=m7RmatOFZf37KbJP7V43/R/yV8MVhhr9v6tiEmktbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BTaczHwirFktPFfDQ2OBWeEonxuJZC1gx9JrxprvM1BWkYuE9p+MuGuyxxgJ2FFt7KDUOepmwZsU2AGLQBTCozEVr6tsnBtGUzkzMASsvmaIKjtifO8cCo8qgfPA0Lr6+z+z2e8T2QZrtWFQXR9EjUAVl/aw09u2BpoaJf1azwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4Q67bzI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d54214adso11268735e9.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754248; x=1750359048; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=B4Q67bzIJU4coZteL6LKnXHV9bWdUCjT9+viKzPnlDFVfoZG3z2picHwko74ESlp0M
         e8jZD0/SdoEzZjdNNhHiVnjK49nizYWZtpC9ttYthcdC2Iut4W2M8ADo5pXabyhq1jXZ
         h2MCX53seXrwwSmy0vziisZ/4s6Edsmm34DoWbkZtt2bxfLLiBRyLTE9U53AP4mngb6i
         O+c/SrBgQdsNevCsR1OIlSL54c7JvyJu9c0z5o3e3GV+npQtIbumN3OBe0gTLumyEZ3y
         8/R9kbSIzS+tgUWVHUd+BXMtR/K/SQnA5m22JwXjX5D1JqziA+3jHIdJa3SS/lZyPtqA
         WefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754248; x=1750359048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=SJtEcGhY7Sui+X6iYOMs10C8VzK8zPI5pF8QRY7QnUaY4ftSv+kgvODsba9d+1VftO
         Fv51bZXNE5BWO9DXHufJ3EWXMufC7qa6QwR5BVdX39GoH1L3RNIQxPp3LXUdU3JWUFN8
         BINkL7N/xamGHeL+jvZHWuBOkRUccb6rDkrI+LSwjAxdco2KU2LOPfhLK3X0KGkaokEQ
         f3l39g2r7cfomeH2NbAoS1q9tQLs/7fpRgpxzFPHI4ouJCuJMwEBrfx1dEMFt65TMSmd
         9FefmVhLS0FkntW/d7cgpZzP/+YpAkPIZ/jBWMDqTgC/hW7xAaJz4Oka868X/HcjuaIi
         hWew==
X-Forwarded-Encrypted: i=1; AJvYcCUs9btmk4Yqiu6GjOEgGhF8+0oFbj0kW72986qHPMFbDup5+VxXxJsRzsNmYMUw05+vvkf7rSpQQvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxw5+p4hPizOg1NBuCEmYWOygnnEdTcfR4OlCmgjbCg9//7xul
	upchxb+aTSGD6X1eCKzDRKwlW+Ue5UBQ5NdRSsSXs4iiioCXGKO/dBb4qICaEn5t4c0=
X-Gm-Gg: ASbGncuXbmVNkeAGwaHdkFewZVr4e7E/Jxo7h0sbk4IbkjuewQsxlIdiDcVdXX+nrYg
	cGuky3shLYqs8OYKBhlE0S0EVM/BaZiTijyFctvXvy9rtOSlO0vWJRpD3qkKwfm4/Odqm5V3Ax2
	OOBWhu5h4dEe0jGIJZ31JnOqBv6C2aVGzEVw06O7CAo3IYoUjSZ+KVis99C2A4MVW3zXy3B9vWi
	QR8iUlxM8tPdy/1d+7IDbSWgeQ+2B7ip6STzvKvEjSfYJY/Z4nTOmB1fOXg1XZgqA0TT8YD0Mvq
	cLbpdzL7nL36ZdOdmmW80aQEId8AgvAvUtdYfw77G5GBYuflBsRAqPQON2gWGdNFANE=
X-Google-Smtp-Source: AGHT+IFFK9l+yfY1kr4NnMO37BPPvCq/YrWFhg/vLvoWZsXd9u+zkfYJb5d1B0c7bwKtakecyoBgfg==
X-Received: by 2002:a05:600c:1d22:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45334b0246emr2257445e9.10.1749754247699;
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e253f64sm28578855e9.27.2025.06.12.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 0/3 v2] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

The changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 89 +++++++++++++++++++
 4 files changed, 99 insertions(+)

-- 
2.47.2


