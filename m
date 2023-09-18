Return-Path: <linux-usb+bounces-343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E7C7A5331
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 21:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52611C2083E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F482773C;
	Mon, 18 Sep 2023 19:43:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F629C5
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 19:43:15 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8400A8F;
	Mon, 18 Sep 2023 12:35:51 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf7423ef3eso35697885ad.3;
        Mon, 18 Sep 2023 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695065751; x=1695670551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVaQmA2LhT7dn8cne4eMfEhfPLLr6K6HA82d5u2PJzw=;
        b=jY/kNih26N0M/imLrXvEGvz5aoQl9b0CkrGejo0/xd5WuK8Jr/vDA8Zwa8wp3ETvFG
         k5PwLNlY+ggA3wzfrK+qp7j2hYEuc2fQdUGBUeyarKOtGHa57bnkNA15uVfXxmPHqCU4
         pyklZoJAk4GDCZOIUjuVk9ihN3vMI8U226gslNqvXY2K25OhYq2xVTDFA4zKFW34P1ES
         tzpqdt2cQyBfbiHuBCdL36LJsR92ltRxWNOG6hjs4FNlnuTDb6b5AgAur0S294FkrAM8
         37LaTt0kskU0b/KLqQdLsPkjKfgALbAYCMUM6+YfvYCvZewWlQz7Ye3DuPCzr5O7Hkqc
         j1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695065751; x=1695670551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVaQmA2LhT7dn8cne4eMfEhfPLLr6K6HA82d5u2PJzw=;
        b=iH2P5KjyczOm9YDtBYiWXVFPpCUuTUQg7QwYUDZdFGPEdAwZRjIPq7N4ehq+hnrU7I
         qqPYSlqqHwPhAtIPaJzmoZUfInQqgo9aadCYRe3BPHy7FNYjAbKCjbTFlFwagxEt/OjZ
         bcgAn60sm8N3MBjFciz1IsOegyLkzeWcaceGuIi75AzepVeskF/FByZRvmfFVx1AGWRw
         JP04+zZ7sBXtraPbZ5llIJsVk4J9a44mwuSLb+mfQ8DqipQumK9VNCo/3IIOidLAJZno
         9EvAluvRpV0qKZmRERSYKoN98Ulj/GrxG0IsNFnj+Ak6ZTJ0D2tUdKUzH7Rc5s3MOFU0
         ap6g==
X-Gm-Message-State: AOJu0YxEtfBFArMV2Kxyi6g8AVPB5Y4u605xseq/L4fnMuKb3WLrLfFT
	E7vRSgABWI/QF6iaTXcvh4EUDEE0ppJKYdgd
X-Google-Smtp-Source: AGHT+IFAQ8y6vwskWBz+ZyVbgackyibWf6YMx1p2aw0coDBfIZWQGAKolBLnHAdbUrp0ZedKdV1Edg==
X-Received: by 2002:a17:903:24e:b0:1c4:abc:b85a with SMTP id j14-20020a170903024e00b001c40abcb85amr9799862plh.9.1695065750965;
        Mon, 18 Sep 2023 12:35:50 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b001bde65894c8sm8602032plh.268.2023.09.18.12.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:35:50 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Subject: [PATCH] usb: fix kernel-doc warning
Date: Tue, 19 Sep 2023 01:05:05 +0530
Message-Id: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
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

Fix kernel-doc warnings discovered in usb driver.
Fixes this warning:
warning: Function parameter or member 'gfladj_refclk_lpm_sel'
         not described in 'dwc3'

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 drivers/usb/dwc3/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a69ac67d89fe..078edfe0f88e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1106,6 +1106,8 @@ struct dwc3_scratchpad_array {
  *			instances in park mode.
  * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
  *			instances in park mode.
+ * @gfladj_refclk_lpm_sel: set if we need to enable reference clock for LPM in
+ *                         Global Frame Length Adjustment register
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  *	0	- -6dB de-emphasis
-- 
2.34.1


