Return-Path: <linux-usb+bounces-17382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF39C2889
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 01:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF151C21F26
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 00:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC0256D;
	Sat,  9 Nov 2024 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VLrt9XdB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17E647
	for <linux-usb@vger.kernel.org>; Sat,  9 Nov 2024 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110662; cv=none; b=kslN2fY7AlGRAqYm7OdMAQjMdACn5PK3RR31TCHVR7r9q2WKALETYEXd9GhDPng78S0AI4M0NXgVy6MLn6fVHR1hnWjSS4L8unjYhapaoIunpyMDSf0g7UEREC9L382WhiaIcrIpvgyCgv1Ls2ClIReeuBqXpdZo7Jnt69Ay7ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110662; c=relaxed/simple;
	bh=ywQdZRsjrKo4sX83lUQ0A3enWUCZaVbl7p53C3732sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=chob1B3M5+g8/Wm5jZZD1MLSRfjgtd7sy/IToEG1jXxKTZCbt3RuV0xjz371jvMbzy09nieNYV/H3iXHdztXRPwucYzsdqQS4EFJvZK0Fxl/dZl7uzoDD8TLvtUwRSDbg24G66zam6GVp+1o3M29E+hG/LmAI+DOErzaim8TT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VLrt9XdB; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so32871171fa.0
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 16:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731110659; x=1731715459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QqKyKuDkp5tv5kEc/k4lzuIOmv/CxXKRi9oTcpz+qh4=;
        b=VLrt9XdBOWnq6rpmg6rZCnozAiXXwkUo/7LciqhDCD0M8/oxxtgcexjWJLuFAyRU+n
         nQ75uakp0NRIE0siWOCHD0zvv1D03Uh0+1JjRunIqed/CxjZN82xB/3YzQPb+bOMFtSg
         BswpmuQTCBvckFiYwPm4qGl3BPAo6yQj7ZNYIAy4IGLtzmcb2cV37YhZtneLo8js9V7Y
         QARLZ6BO9D5Lg6z9hZb7Fq0eUNQvt47b4iYoPFs+UKLgumkZTqfgrdENSyR0/mXHztp8
         usA5v1wXbEPPVmJtFQZl4MdlwC6QOZR+1ihaoE1fwNWxDVG3uyIca+IoefPuspmVH1nt
         knbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110659; x=1731715459;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqKyKuDkp5tv5kEc/k4lzuIOmv/CxXKRi9oTcpz+qh4=;
        b=qlQ8Df95BUKp25H7eeRNNZPPr1xuWkbHk9ft9jeXJSf+xW3drEL8Uchb5yeu9FitmW
         b1K4k6dxTW4cKk27FocxjfiuW5Y3XLiHmHxAKI/jmcLzqfpRLHDcD3J25WxuOeYI6jE8
         f48kTtGPnTFfcWoPdj7ymanqUvIk0KCuKZtZa6MHgNGrIDTZ2jB7Ss9w3AJCx+dyLIqx
         uQB8q9vHdY/FWHxWaga0LAvRvHSHOZBVvh3ENqHqZV6bbMAzZSGzd/JzKm9M+KIHC5MX
         joqL+VzOgTBByimoYr8rnc3jQUjWWZCtq3Ed3rtDXgT1NrlrFkPXOm5KA1FLOvV2eZfd
         hM4w==
X-Forwarded-Encrypted: i=1; AJvYcCWe80rM3U8KBiURABpIGBxz+F6ECxB3GbNHLfVrTZe/7gw9gBZOrVSlXFvyNPxBKfNuEVqPoDmfZ8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVKlvnvN4oXA4JJoo+Km2nMOi4udqh6C5UkTGAg+Qoh0bOguX
	ROJt2QPYytw3fcBZmf+8cbXqp+XbotmOrtuoTKi6PKyelfNOgMtJEwZjmH/ja2Y=
X-Google-Smtp-Source: AGHT+IGkg8/1BmV2RcN7nA+ELa1/ToNCfGFI7QEJI20rxGhEwGc1qiymsJbIBZC6WhdCZ1RsdodnSw==
X-Received: by 2002:a2e:a813:0:b0:2fb:569a:5543 with SMTP id 38308e7fff4ca-2ff1f4d06ddmr19124921fa.19.1731110658590;
        Fri, 08 Nov 2024 16:04:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17902152sm8221431fa.57.2024.11.08.16.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:04:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] usb: typec: ucsi: glink: fix and improve
 orientation handling
Date: Sat, 09 Nov 2024 02:04:13 +0200
Message-Id: <20241109-ucsi-glue-fixes-v2-0-8b21ff4f9fbe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2mLmcC/3WNzQ7CIBCEX6XZs2tg60/jyfcwPSCsdJMGDFiia
 Xh3sXeP30y+mRUyJ+EMl26FxEWyxNCAdh3YyQTPKK4xkKKD1uqEi82Cfl4YH/LmjIYU052M4t5
 As56Jt6JJt7HxJPkV02c7KPqX/t8qGhU6pYfenQd7JLrOEkyK+5g8jLXWL/4kkaivAAAA
X-Change-ID: 20241106-ucsi-glue-fixes-a20e2b2a0e3a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ywQdZRsjrKo4sX83lUQ0A3enWUCZaVbl7p53C3732sc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLqb/wcBOA2fCkr7Uj/OTtbPQMqlXB8DxA4nBW
 CBSJEuWI6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy6m/wAKCRCLPIo+Aiko
 1eeSB/0QLsAkw8ZhGtj67u//gMuspxnLH5IBy+q0uWEoTEYqX/jZ+wgMQvGG0zt0ElJ2shTp8IX
 f9jjaFzblI4aJiGLGFqOycZ/bBe/AKl0l+SvFZ5xAOoLtuumDTtbKQh0X1/NG0lgezffdDsE8Gc
 qncddeC0lWX0b+O2jIhDeylsjhngKoR0ApV0NXdVHZQoqE/dhkVW314W19hqfxnPoemKQK0hP5e
 PtF0EaOBdxdSpqdWPCPi1/yWVWAvHHotqZ0EgFrADg6qwYRTU/GtRW8ooE3AukDHC1VOFXGh8pU
 ri0SvSau0rXUv9J/VwcplNTN65AlLLlDWFcEG8uujox4WHNd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix an off-by-one issue which resulted in USB-C connector #2 orientation
being reported as unknown. While we are at it, correct the way we set
orientation_aware flag for the USB-C connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added cc:stable to the first patch (Greg's bot)
- Expanded the commit message for the second patch.
- Link to v1: https://lore.kernel.org/r/20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org

---
Dmitry Baryshkov (2):
      usb: typec: ucsi: glink: fix off-by-one in connector_status
      usb: typec: ucsi: glink: be more precise on orientation-aware ports

 drivers/usb/typec/ucsi/ucsi_glink.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 0a2598971f04649933bd38f5db241b3bf23c04ec
change-id: 20241106-ucsi-glue-fixes-a20e2b2a0e3a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


