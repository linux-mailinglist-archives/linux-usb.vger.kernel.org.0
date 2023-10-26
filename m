Return-Path: <linux-usb+bounces-2217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7237D7D82A4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 14:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15EDF282012
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 12:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10F22DF8E;
	Thu, 26 Oct 2023 12:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dnKI+KRY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11B2D7B4
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:28:43 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD29E192
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 05:28:41 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-777754138bdso66477485a.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698323321; x=1698928121; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WGRGpf1ARbPQY1fumL5DeKAJhYKCHf4gxWwDp4LFCQ=;
        b=dnKI+KRYtDpu0CiG0JK1pul4NU9Hct+sFwSQOppcwiuo8mtHcmyexNE62F4XUS6IPD
         g1YscC/b6pe9EAhaoZGXT6l9HHlQNzZ8w36M+vDezM3QHk2MHFxgv1cH8CcmlC3Q9cJY
         /qd79aJ3ykA0+83zUYpG3QUwRwtwOnB5h+CbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698323321; x=1698928121;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WGRGpf1ARbPQY1fumL5DeKAJhYKCHf4gxWwDp4LFCQ=;
        b=okiVlqCYMcFY5sJCuMd3AO6FWnI/EUmXHnuwvhi0F6QpfVv7L+PBZ4RtROaHefYNCM
         WLhnxEY5GBrONpW1lBdv5G+jvJDSOXKuQqQYLA6N92zvoMRV1AQsGbSjWg/5tbEGRsUE
         3yIO/B3Wy9/1QxJSXsSawNUEZGBpE0R//F+/If2NBAk/iFmS3durkdW5HA0oGgvA1jFr
         PHP2IDS014tP9UzJYCUbfKFKiaznBkN9p35wSAdhzULwIEIDFeLBgi2AsCNu3+zQLvwj
         U/Tv1NgcFwhhtJ1Devw1H61HGoJJLn8aCqOwR11tX+bCVSmuS70K7iuYfY1P4jq8QMAN
         iXYg==
X-Gm-Message-State: AOJu0YzwVtLBuQ3yZ6sovJ6Brxr44Zb+vHdAvFRjy0gLAUcTdPcuceMT
	Vg4sqyHyLc5DS4lRbuOW2rKA9w==
X-Google-Smtp-Source: AGHT+IGbmmi/fPDM4l/eOyFgg7t4XG2htGE2skFiTTZytx2fRoIZQX1f5cqp42EdqvLnV4afw+cnOw==
X-Received: by 2002:a05:620a:22a2:b0:770:72c3:dbbc with SMTP id p2-20020a05620a22a200b0077072c3dbbcmr16056365qkh.18.1698323320869;
        Thu, 26 Oct 2023 05:28:40 -0700 (PDT)
Received: from denia.c.googlers.com (112.49.199.35.bc.googleusercontent.com. [35.199.49.112])
        by smtp.gmail.com with ESMTPSA id x6-20020a05620a14a600b0076f35d17d06sm4941476qkj.69.2023.10.26.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:28:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Oct 2023 12:28:36 +0000
Subject: [PATCH] usb: dwc3: set the dma max_seg_size
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-dwc3-v1-1-643c74771599@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHRbOmUC/x2MSQqAMAwAvyI5W9BWFPyKeEhjqgGp0uIC4t8NH
 mcY5oHMSThDXzyQ+JQsW1SoywJowTizkUkZbGVdXdnWTBc5E5C6JpB33iJo6jGz8QkjLRrHY11
 V7omD3P97GN/3A0wzq51rAAAA
To: Zubin Mithra <zsm@chromium.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.2

Allow devices to have dma operations beyond 4K, and avoid warnings such
as:

DMA-API: dwc3 a600000.usb: mapping sg segment longer than device claims to support [len=86016] [max=65536]

Reported-by: Zubin Mithra <zsm@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Found while running 
yavta -f YUYV -s 1280x720 -c  /dev/video0

with:

CONFIG_DMA_API_DEBUG=y
---
 drivers/usb/dwc3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 343d2570189f..65f73dd8ef47 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1918,6 +1918,8 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	pm_runtime_put(dev);
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	return 0;
 
 err_exit_debugfs:

---
base-commit: 611da07b89fdd53f140d7b33013f255bf0ed8f34
change-id: 20231026-dwc3-fac74fcb3b2a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


