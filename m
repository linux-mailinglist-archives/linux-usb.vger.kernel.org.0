Return-Path: <linux-usb+bounces-848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF97B439F
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 22:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 8BA4F1C209D6
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 20:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59CE18C20;
	Sat, 30 Sep 2023 20:38:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E59138E
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 20:38:47 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857DDC4;
	Sat, 30 Sep 2023 13:38:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50308217223so23362042e87.3;
        Sat, 30 Sep 2023 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696106323; x=1696711123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rW993Rk+us1RS2s1pFY5qGoKza1E2XLS3Abi4keOId0=;
        b=ArRPf2Utr6fD3STr3sEvC6cxzGeLTDNxPMZ6542Rk9G6xhiDoVbaiP1CU1HAlMyB1p
         UnYYgswYUGaodebDoSh6Doq+ScCJItZ0TqUsWKv6WQVOaSX2jFqWvvqVW1WzW8tCte7z
         ZQxcncIr97kVN0SHocwMdCs9ZFh5iVnAA17tEYr+2HFpjJ9RxwDM8/WcTgzeAlU9EN1n
         dHBbJ0AEdEG7GpfcPZYL1i8FzZvzJcgdxk2zRNDO/8ILOXSa/LwpZR9vcfSGjCn3pWLF
         pHqKYyc8GohkrelUOwj0KVyLGLTYVYXcL9KQWO5aY2Izm3dM5ZAND2I9ShvqRsEzgOow
         1lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696106323; x=1696711123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rW993Rk+us1RS2s1pFY5qGoKza1E2XLS3Abi4keOId0=;
        b=mM2LCIfsuYuF+0O93iZCxn8G0HM2mffLzlC1+H2OV/vjDijRbLSbhqp6tAwF4h0Xcu
         pXBeuEFwysD+B7puNfsNAQY8Htv+N3ZFxM9pQJF08090OLzhxiXawl1iuibFL73SZ56M
         cRyvNu8oD+km3UjGO79MeLda1HrwfsYmrwW1ifIcArOSVIUHU2MqS+YdaRKJ6qJM+p1m
         OU4wPETDiaesuH71TZT9OQcWqdnD0o9OgG0PxF7q2r32mxQwEOhJnpj5v+3hxtwvteQn
         gd2AVBS6h8/mrNWjWRXUztsJ0F04k3NRmzZfjq38DeAuUZP4+d7CJmYz8pxp/dXu4Cir
         7n+g==
X-Gm-Message-State: AOJu0Ywn4i/91toxdvYWHyTT4nrDNUqQrUSgmK+EwIqHwtQc5pRG/TW5
	bw7lrMPoBCupmzAdBMTyzXO5eBb2MUoHHQ==
X-Google-Smtp-Source: AGHT+IGt7I0eKG+q25Ok/cEgz+Jsu9oElR0Jj91NbCmBaC80OrAuZCuK9OQueNxi+1nW2dFx5Yg8nQ==
X-Received: by 2002:a05:6512:3095:b0:500:94c5:6e06 with SMTP id z21-20020a056512309500b0050094c56e06mr7294226lfd.56.1696106322331;
        Sat, 30 Sep 2023 13:38:42 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id t6-20020a19ad06000000b00502d7365e8fsm1656082lfc.137.2023.09.30.13.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:38:41 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 2/3] drivers: usb: Fix issue where *'s in multiline comments were not aligned
Date: Sat, 30 Sep 2023 22:38:19 +0200
Message-Id: <20230930203819.61891-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Fix formatting issue where *'s in multiline comments were not aligned
and should be.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/usb/atm/usbatm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/atm/usbatm.h b/drivers/usb/atm/usbatm.h
index d96658e2e209..500c91b418e4 100644
--- a/drivers/usb/atm/usbatm.h
+++ b/drivers/usb/atm/usbatm.h
@@ -65,10 +65,10 @@
 struct usbatm_data;
 
 /*
-*  Assuming all methods exist and succeed, they are called in this order:
-*
-*	bind, heavy_init, atm_start, ..., atm_stop, unbind
-*/
+ *  Assuming all methods exist and succeed, they are called in this order:
+ *
+ *	bind, heavy_init, atm_start, ..., atm_stop, unbind
+ */
 
 struct usbatm_driver {
 	const char *driver_name;
-- 
2.34.1


