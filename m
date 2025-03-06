Return-Path: <linux-usb+bounces-21462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17FA554A0
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 19:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47AE93BB450
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 18:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA9526B2DC;
	Thu,  6 Mar 2025 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpdsX58K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98D25A33B;
	Thu,  6 Mar 2025 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284719; cv=none; b=qBvsJXdEEuszY7SbJBVQGNKQa2GavHZxGeiTKFytwVx8ROisQYqK4OM2FcwMxa9eAqUXhjH1eaBakygg12IVAlyr82ndxNNr9/PuW+oeHNXyd2h/C2MuSfU7eJnexqasqQD3nURfvQlMzMVp5ehQv9ytQ1ciDDNXW71gE1N0LYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284719; c=relaxed/simple;
	bh=brIzXQ+KsPs9Hq7w62oxxE95slJohYJWjgpGR76u2Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0SXPohpZb4ZTD7DeuT04iD4UKhLvEbwFjHZ7ZAifAasp5A2qzkAkS50U1IHM8X+1bs0HDcrPv6bfhHHd0b1YnfauU4yb9JNeqWmpFa8hu8RThLX61qvImtR758BispE+NpNQq+etXpC/Ra5OXilgQ+zXyKvmpuf27nB4l+w7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpdsX58K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF5FC4CEF0;
	Thu,  6 Mar 2025 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284717;
	bh=brIzXQ+KsPs9Hq7w62oxxE95slJohYJWjgpGR76u2Mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dpdsX58KmpZ0HZWRdcdCTPuuQ65yTlGvE81H97vyHEeovWhx8tMkI+DqHTI2DIDp7
	 lCIMEL0Gg0ZJSHIBGp8b6LO0ESlgQRSbLhmNL6l9U8VYpZFs5TZtF/kYpGKS42wdIP
	 B6aKOiSxv6gn2lZOj52imnqu9wO/I3NVjYg/bGHTenZswLVi7lUN/1dH7IiYi77Xml
	 +spCudgqt2NZ4xKSx3YBxNMlOHantAxZNRoTDo8LnRHfDApFQbwAwZhmBcBXAl1K4j
	 4TpzTGG34QkIlSaNimg6fs1h+VPUO2yNCxHbwvx82smuiLOqoCxsr+gQaaiGI2sKMx
	 cKsUv82UAfj2g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:15 +0100
Subject: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=916;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=F12XfCS7Vo3riNf+gNtzfCh4h4fayEM8vMuqOfB1zQY=;
 b=27gogwMd9Yy4IoH+3zCgiaEZItXC3AV4MgiCvuI0/buKQbyq8ElW4JMUooOoWUMHsYbGTqAwG
 5SI8jrMWTj5Bwn+XZ6R0iOs++TGHdzP/m7wTODv8fYFt4+D6tcTFl75
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
whom this binding document was created). Add a new compatible for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
--- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
@@ -18,7 +18,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,kpss-acc-v2
+    enum:
+      - qcom,msm8916-kpss-acc
+      - qcom,kpss-acc-v2
 
   reg:
     items:

-- 
2.48.1


