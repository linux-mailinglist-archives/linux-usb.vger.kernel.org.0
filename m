Return-Path: <linux-usb+bounces-1137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 166BC7B9E3A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 16:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id BC917282184
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 14:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92A5273DF;
	Thu,  5 Oct 2023 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KKrci8db"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CF273DE
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:02:34 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F20441640
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:01:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406609df1a6so9326225e9.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514469; x=1697119269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEBsoHti+XFvDHXO7qEwI1whIGP245jboTAo/jjD/QE=;
        b=KKrci8db8VRy3JFiNy+IZkV0W7Q/sa3mLAmCPkqXzvuUsYdQYoa2s9Gf3h2F6SZnOg
         m/cgxtqrpDBqc6TkMBcciSx1IsDXsoLD40FEbsflmpi12IJrh4PU3w0LHyylFeo+3+Lx
         ZMO8Hxgk4WnqAZh0FooXSjv7aaOBC98sxUJ2WObUyNPXx1xaWhrqBO9Vl4hK8g0mehP8
         luig5mMA25vLPH1srIt3PmsRVBnCgB6Suv5LxtvtT3GU5xxLH1dRhP6ZpSgTKchXJnu4
         xGWVkHNagosGEq95hf5z8DvhYyIA2dbE78RAjhjVnxw5jDTidJs0fUS/R7kfsJUG2jbU
         f9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514469; x=1697119269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEBsoHti+XFvDHXO7qEwI1whIGP245jboTAo/jjD/QE=;
        b=rg7CzOFHByfUnGwBzbvNicqEuLbOGX+pvuSpaaUPNdw4QXaKBpb5Ezdh1fqD7gHJeb
         K29JE09nvTQyV33VcqDneXoZTVUTzdf31gr+T8HUwpPflp9VlfOCz8BDzcn4RZ8jLiM8
         IZ20Qoz7gUk2TK40N5ukMdoXBraHew0JcGETxHYJEgrxtb1h84r6hSxWFSJcGbgAnFjA
         J/x2yT7lFujPZdVM33DwsKoyj6o2muDRfzRQChua5bezbafm/3xMAnc4tMU1/pW63OFk
         LLPZ+Mjw/SCpXFn961ViUifUWrlW6O2TY8V5ymXCm2vAqDyoe7vTBEb0uZH7UGtNOhLm
         8Vzg==
X-Gm-Message-State: AOJu0YzAMKH4bArfAwXW6H2G3koon8M/mjLvFmfZVAYgG1HKUUx0V59+
	+qsJinRPPdDYXNHYsNtHnUVBEA==
X-Google-Smtp-Source: AGHT+IGzlifFWTIjaG638PhGniL1vFxzx5LlNFebcJmya8nSpTFh0K36mX5cGJufCOfMbbweh6tN1A==
X-Received: by 2002:a7b:cc8e:0:b0:401:38dc:8916 with SMTP id p14-20020a7bcc8e000000b0040138dc8916mr5000549wma.10.1696514469148;
        Thu, 05 Oct 2023 07:01:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l1-20020adffe81000000b0031779a6b451sm1854809wrr.83.2023.10.05.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:01:08 -0700 (PDT)
Date: Thu, 5 Oct 2023 17:01:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: usbtest: fix a type promotion bug
Message-ID: <506f7935-2cba-41d9-ab5d-ddb6ad6320bd@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The "len" here is sometimes negative error codes from
usb_get_descriptor(), so we don't want to type promote them to unsigned
long.

This bug pre-dates the invention of git.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/misc/usbtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index ac0d75ac2d2f..caf65f8294db 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -705,7 +705,7 @@ static int is_good_config(struct usbtest_dev *tdev, int len)
 {
 	struct usb_config_descriptor	*config;
 
-	if (len < sizeof(*config))
+	if (len < (int)sizeof(*config))
 		return 0;
 	config = (struct usb_config_descriptor *) tdev->buf;
 
-- 
2.39.2


