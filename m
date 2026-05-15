Return-Path: <linux-usb+bounces-37485-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAaAO9DiBmrVogIAu9opvQ
	(envelope-from <linux-usb+bounces-37485-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417154C0D6
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F414C308D1E5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF45842B721;
	Fri, 15 May 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M1ZKebKz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173BF438FF5
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835751; cv=none; b=GP1nAGk7P2lF88Ssv4Rp231n6FyFe/oD90mP+8eF73Jkd9WZ4sQanVxy/Bopw9b76/Prbb/fbEZ5+Y8blVPdEKEVKQIsg9OOAU8aJgQiOdMi0TQ2NTKMxuPT6Gn1MzzlOVPJxdjH0JEVjM5I78YKykVs8XA24ll34oqT6h26TyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835751; c=relaxed/simple;
	bh=ZpZa7k5qW6d4O5s2gIExYuE8RnKJzrY7mGSZ7vTtpmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8+7qqNDM8ID2U/Op9hfTadfgnCnYuhO6M3kzd/9DjJdaOZihwDm6tFNSd+M1+FapadXj59CATRGaNSmimW1QLfA/uRBRDegtWpQC1H5XIumJfQHTn6/lb6kcddPb3aJpqiwBrDjg/v/Gpu6dGp6B6Aq2Vw7vkAOpF/mx6het1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M1ZKebKz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so4897480a91.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835748; x=1779440548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=M1ZKebKzXgxRYmqadt91sF2wLWIgeZuyblx2pRSUYy433NDojHxvOTfmweZHw6Rpr/
         z+O5zJd0FkNbaCHBCAA95AX8Un9yEksRiBJ7GQUztR4++xhjMUiI9zZV4+5w6lSdiHjk
         nYN8SWqW1GXjG0rgzVuqjmInrVTD/qZJxOtPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835748; x=1779440548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=GNOfmA5mQWjday17dVvnO3eF91Pht3xL0I8kKla1rsAds/8746ILQ0PUQW8QvYpZV3
         WicWvtkGbRMwS572Pvv622Dj+nlJbq7xvu6TeyEjxsbtG/VzVAxKG/gzJ/+Zmyc/GHS9
         OwauUqkKt7LiKqRa6lJY2EKVUwum7uABR7XztjcgO/2gAD4GdB3BzJySNHhMMqDdweDB
         NgkTtArmxTKol1gQVJkEYyVLh/HvPj//LBdrnT/f1Q2MssvHvSfEoOZygQMzMfu8MVBV
         zuNRICR+qMWGIzpEgBNKSwKAdKRGkxyDu/1MORILlHSxA0/FBH9H1VmkGiLHVR1x7/3k
         U+5g==
X-Forwarded-Encrypted: i=1; AFNElJ8yyHCbEvbu6LZ4828K3QoP1rM1apFippuygLd41uA4quIfftNKzC27epWw05NB5IwSvvHcFgtNvT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFIlJJpvzBpH6Hq/4ipvS3UlroinZlC5CaoSlqwvun3kdM7lW/
	kjJtFBujZz8Q+S5x2fVra22+tAPLBOvzB0/zIs2vtTDGT3F6IYIQED6G7qQGlr2oOg==
X-Gm-Gg: Acq92OGJkZiyjqzXjYS/wWzov5/MR+mnIqrRptVmhZdMvZbK7XGrw5Drp/kSYcsA49K
	YJ56C6ksM+O61gNug+BJtYjoahCTcKKrxfvEEVm3uvHUeUFOXao5zB/rUpQqeASxlbzsNmV0XEk
	rP0UGoWYCXAAOsiCCywCWjnHUbNLuf3p7wp5/CcnOWdKuvyLFdp7LhSiyFkF0FwrgXyjqY8Wb9n
	R7EtmT0IkyX9/uinDsndRhIodRHUU+T+tGBmuUnmvksw34oOQuap07Mg+duPh9zRNiigjU2mIu4
	CP5HAGsXu9yR31WEY3XFcdWX9zqAF9Qf227ahMpPqeig1lOLnsKhcspOzyEgwBCSl6U4Y8yWkgB
	3K6ktCvQ/vfQIByTcGGTQuCR9/tUUrTb/MqVOzT0L2JpOoIw0WWUVeVuKF6uapUlXQkhk8qJ8i0
	1ZRWhMiTk0ygrZOf6v63oYHcZop/kMRROzy548HpUL2z6nFUXD3y6B2Wct76Fm3CjNvdrsquo99
	S938BC24ywpe25gJFQ=
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr3137430a91.20.1778835748348;
        Fri, 15 May 2026 02:02:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 06/12] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Fri, 15 May 2026 17:01:42 +0800
Message-ID: <20260515090149.3169406-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9417154C0D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37485-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.563.g4f69b47b94-goog


