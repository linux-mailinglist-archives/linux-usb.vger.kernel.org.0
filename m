Return-Path: <linux-usb+bounces-1752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2627CC907
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAD42B211AC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B132D03C;
	Tue, 17 Oct 2023 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQvtG1BZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A362D024
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:43:54 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1711694
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:43:53 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9936b3d0286so959570966b.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697561031; x=1698165831; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFXlDKfrQnOR/JfbZEjyB14g3tLyocNuuQWrugy3cqM=;
        b=UQvtG1BZ1ArJGdOrXF4HDTGoUjsxie6kzEyB+k8/Jf5xx4ggcDfm81ctPf4mWbolg6
         rlTlbs/i6ks9EqGGqR6qd15mNjfCoofxztjHsVQiZoyy/jksRg0eRRshbJKgm/2TVQXO
         LgM1WkZWclh8sMsSzv4mUG0gKy3tYANU0ubyqJISDQNQxAk5WYB9ies6e2bp1/bB7ux6
         YDguqy6OarCsR/Q5C/qlG8tccSp7lECOKyfDsXqI0NxgxzAIC7O02tbs2eseBgb2EvDC
         35tN9Fgae7l8rZizznrt8jpggCXZW9xdFOBI3wf04RP2eXV4HLadFGlNOHBN6KUmw68h
         bVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697561031; x=1698165831;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFXlDKfrQnOR/JfbZEjyB14g3tLyocNuuQWrugy3cqM=;
        b=XK70ybh2nH4lG2ntbdGhR6jluIYvn3SYaVZYzMKd98N8WZ7CLv1t4Mv6+otuGEzyhX
         MPh6hyHFvWshF0bhuTIObMx2Jinfe+dSSol71pIlyUstChS2jq2AkO1s+LlD/JeItFxv
         l5Xj0QjcP01kYtvj0BizqFYrEwhAt5AHvqvvlP1NrQg+MLwJQ+4mVx5vM+zPQcERgY6+
         tNCYdVNt3iRzHJm7Ly0azEETuUWK3PjzqTk3ktFdlcwZueWCG7rXK7ZJMMT8Itjrt7xK
         KLiTjoJKp0EHMshGtZD5EGVTVwcaZCUBk/suePMTHcJ4QTzWHCkwKgDWCo0k19QEMVXv
         OwJA==
X-Gm-Message-State: AOJu0YwhMUW/yr0HiDh57PX90UmEub4Vv1Jd0N5frmllI/HvIUKT8Ld7
	a93lh2fecxpK2BVXCkk0uNFDOI3Oxak=
X-Google-Smtp-Source: AGHT+IG9D4+SQWbN9FWrzwpy1dFNAFq8V9r4VWzp61+FMtrJEG/iU1kdfXXIsa0o8lZaxxwtdBnQ7w==
X-Received: by 2002:a17:907:3f98:b0:9ae:56da:6068 with SMTP id hr24-20020a1709073f9800b009ae56da6068mr2320412ejc.57.1697561031259;
        Tue, 17 Oct 2023 09:43:51 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b885:fb00:2de4:7eab:b44e:65dc? (dynamic-2a01-0c23-b885-fb00-2de4-7eab-b44e-65dc.c23.pool.telefonica.de. [2a01:c23:b885:fb00:2de4:7eab:b44e:65dc])
        by smtp.googlemail.com with ESMTPSA id c7-20020a17090603c700b009a5f1d15642sm104707eja.158.2023.10.17.09.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:43:50 -0700 (PDT)
Message-ID: <4793f68e-cb16-4058-9704-230ae0e32b8e@gmail.com>
Date: Tue, 17 Oct 2023 18:43:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: core: Minor improvements to usb_hub_create_port_device
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Minor improvements, no functional change intended.
- Use variable hdev instead of hub->hdev
- Don't call hub_is_superspeed() twice
- Style fix for else clause

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/core/port.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 77be0dc28..84bd83d99 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -698,17 +698,16 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	set_bit(port1, hub->power_bits);
 	port_dev->dev.parent = hub->intfdev;
 	if (hub_is_superspeed(hdev)) {
+		port_dev->is_superspeed = 1;
 		port_dev->usb3_lpm_u1_permit = 1;
 		port_dev->usb3_lpm_u2_permit = 1;
 		port_dev->dev.groups = port_dev_usb3_group;
-	} else
+	} else {
 		port_dev->dev.groups = port_dev_group;
+	}
 	port_dev->dev.type = &usb_port_device_type;
 	port_dev->dev.driver = &usb_port_driver;
-	if (hub_is_superspeed(hub->hdev))
-		port_dev->is_superspeed = 1;
-	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
-			port1);
+	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hdev->dev), port1);
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.42.0


