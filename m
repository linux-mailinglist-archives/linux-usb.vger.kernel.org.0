Return-Path: <linux-usb+bounces-3727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E4804CFD
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 09:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC999B20CC5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A10C3D39F;
	Tue,  5 Dec 2023 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMZWch3Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3BEFA;
	Tue,  5 Dec 2023 00:54:11 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9f751663bso30980531fa.1;
        Tue, 05 Dec 2023 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701766450; x=1702371250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyknJ2kgcVG072UTY8H4XJfMA8Do1SX6JMn4BPTg2BU=;
        b=XMZWch3Z2J0PSZ6wcsOj42Jl1z/L59IhIDa8sEkDGErehNI6u/JbOr1VYv0HDL/lRk
         aGI3gPGf1SU4ZLyhVAoLVgGCaLxy8ht9cZP0rT8pCZ2bMNRAhhFwSIbtf7lf7n8SCrqc
         8DjkELJV2Ec+DHVYC57Qp6ttwxksp03yL/kClOMjKB9dhMW6zcYR+oxZx5gf4r6PLk6B
         c0UE63ZawFgK78norn1ZpXDrxA+nOLYbRbCH1mFe/vFSG0IuyYf9KhwCWZZ9iaImqPMr
         vHHK0S8Fx3MowkMFnes/He5cN5FA8NBCVL583qUcXwfHdo3IWthOkcOFD6I7vqOTjyZY
         u1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701766450; x=1702371250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyknJ2kgcVG072UTY8H4XJfMA8Do1SX6JMn4BPTg2BU=;
        b=m/ecpYdGDtMsBVUz5BvFDvH1stV/Ki1CAJx+LgDy5aHlyoZQlSYk+W6DssrqOoVRd2
         QV+QVN1XgPc1bqzl1j4w+T9W0WFA9EgydRwDM4k/I6o/TKgGGWsZDpKyV4tTAAeUjuBo
         GhcmKPwFLAmAd7PnyCqnFOk6M+gIio1F784Sd5hb0pwixH/QtwAF4X4DAGf/e5DFbTDM
         jUUDbZiII9Mlsa1mSSsOWchHuAnxwHVaL9EB/LGDrGRxCkGlj0sTmdBEr/16ON4cZ6Z+
         oMwpgEdWEDxGL7PsHp/2h5A9ULLVmPwkJBBLFvf5Fp7cJC2IhzdbjIDvLixarsoOQJI3
         KGiQ==
X-Gm-Message-State: AOJu0Yy1nnLt/poYvnDpesBI0NqV59QF7lyuyhe+Du5TSTkVAIAvhDqV
	15d8ItroYGo4aZyNuDwONhk=
X-Google-Smtp-Source: AGHT+IFkFBpXLWdwrNG0O2AGZ5DnqqZ3qSHpctu5B65CGnP+bLv4YkGnqqMoUfNXS+GoU5bzILHdfw==
X-Received: by 2002:a2e:7e05:0:b0:2c9:f8bf:1fb with SMTP id z5-20020a2e7e05000000b002c9f8bf01fbmr742373ljc.196.1701766449554;
        Tue, 05 Dec 2023 00:54:09 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id y33-20020a05651c222100b002ca0ed22a22sm274879ljq.63.2023.12.05.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:54:09 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Cc: gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com,
	aladyshev22@gmail.com,
	ivan.orlov0322@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john@keeping.me.uk,
	lee@kernel.org
Subject: [PATCH 1/1] usb: gadget: f_hid: fix report descriptor allocation
Date: Tue,  5 Dec 2023 11:54:03 +0300
Message-Id: <20231205085404.175-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205085404.175-1-aladyshev22@gmail.com>
References: <20231205085404.175-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit "usb: gadget: f_hid: fix f_hidg lifetime vs cdev"
(89ff3dfac604614287ad5aad9370c3f984ea3f4b) has introduced a bug
that leads to hid device corruption after the replug operation.
Reverse device managed memory allocation for the report descriptor
to fix the issue.

Tested:
This change was tested on the AMD EthanolX CRB server with the BMC
based on the OpenBMC distribution. The BMC provides KVM functionality
via the USB gadget device:
- before: KVM page refresh results in a broken USB device,
- after: KVM page refresh works without any issues.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index ea85e2c701a1..3c8a9dd585c0 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -92,6 +92,7 @@ static void hidg_release(struct device *dev)
 {
 	struct f_hidg *hidg = container_of(dev, struct f_hidg, dev);
 
+	kfree(hidg->report_desc);
 	kfree(hidg->set_report_buf);
 	kfree(hidg);
 }
@@ -1287,9 +1288,9 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
 	if (opts->report_desc) {
-		hidg->report_desc = devm_kmemdup(&hidg->dev, opts->report_desc,
-						 opts->report_desc_length,
-						 GFP_KERNEL);
+		hidg->report_desc = kmemdup(opts->report_desc,
+					    opts->report_desc_length,
+					    GFP_KERNEL);
 		if (!hidg->report_desc) {
 			ret = -ENOMEM;
 			goto err_put_device;
-- 
2.25.1


