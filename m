Return-Path: <linux-usb+bounces-32791-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JzLHPKMeGmqqwEAu9opvQ
	(envelope-from <linux-usb+bounces-32791-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:01:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D609253F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59EB306C9E2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0C33CEA1;
	Tue, 27 Jan 2026 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVJ4L/G9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54933ADAC
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507872; cv=none; b=dw0owFV+LntLACEHFLg3hRgdEITGC4tS44nRKhT2TsbbYujM0oEI8V49VZ0+5h/nBXhN8LJ9r840OJL4zmmWXjYHfLH1yNsWsrNaX2Xe6v5meCrotGMUYhYSMTGnIrDGbek+resWg7eu7U6arptw5r+bwJxMopDnospbqu25/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507872; c=relaxed/simple;
	bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCM9gryzyXVPmltYbhleznodWYLUsbSlGu+ImAT+aE00NYZKRr9MLLgkc7w9B89dKNFZ3MP+DE1MmIhE5UJhw9ew6e2kAucf48gyoNCVXPDxtlJSP5HG14AAIXDI9UcqcBW5Vxuib6Hh/+yjCCwoqiP6tMbUBO4iw6fJl7stJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVJ4L/G9; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so42138495e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507868; x=1770112668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=DVJ4L/G9jNhAiDu8bQG12PnQqDrAVD7z2J0rEBczEt+Ax1Miyo2b8Y2Pl3imp9MsiH
         6AUdJVd23Syw1UxP4Amrnghve4056g8QKM75MyUor3WFQX0Diof06Quksi110n4/Kxls
         qxAuGmhvhCqR/DUU9mBYtVeu4XwEJo6wuOw0gnTssNleLPnB0mOkRFEuIQsJ8duTLf5O
         XhwBEu5uZmiuJj57YTPows1Wko3vrHDgsXMt1yPBwPO1TYOuOTlu2TA4dgfiCQ1PPOUh
         46iYQ5Pr0gHAbHjUFoggBkS6i64B8I0O8FbNSGfsOR8oHDq2Az6CUq3Ij4IDbsNYL1Jy
         ELsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507868; x=1770112668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=CNquuG9S7CoxQQ3LjhA1fQ5ljDVVXd/mrLtEQg0jH2qleG8s2ea38/51FuXvzgshhO
         Dyh4XiZ00BRIJ7EvGsB09ytfhE3PJ4rMY0S5Cf2focGCjuu/nH05JcVTldjjqclHj9Tl
         SXhjqbXJRt8Uiu/8Ihv4NuVSP1T5eLjIR7gTP+zwSxJbE/2uM0ri2FFAmYQZmcXzdfbu
         O+07r9CJT3fVhgHI6fb5gAR7DdCk4otznT1vGaGSQfynDz9UDQkn88UGhdGJN9jGS9GU
         UMYrJRrFlofMb8S/2WWeBp+rHUGuELaNV+Nfxt5sDXapAaDLNy/1hyPpFBlJeRGrTkqE
         gCkA==
X-Forwarded-Encrypted: i=1; AJvYcCVu/Y+slHv6VXWKpG4TNVIf9gU7pW5DXhQ4V87kMYZ3rWA5Bna8GouNxxth6VOLLyKu1wtRc0D+3H4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtf9VWTDS2TNYkcbBB9W/T04b+UibTfArc2PiVOEfOJUT841g0
	/hg+FIqu8HMhXsfCqHJR7TxIjutO0jxJdvU1W5X3uUqYAFMO6OU56eSHfPpV5xZGS+A=
X-Gm-Gg: AZuq6aKJrud8t6QFu0eYdaY/XGJvTm1Gf80Xw54RbZFANPOPepcpsooMtEw5efELAyP
	F+EtiviLfGtk3Vf2b8IbBnuIFlgEn8OsOIym0aovF5LvfD0Yo02rmEIZiqEvWFuSTlhCpIj8cTD
	UEeM84dSEC8NnH5B52EhNuJe1jfAhVNyalL8I1BeJlKdag/l11wyIkcdn07jMlCEIg9G0QMbdNM
	trNLMM+onQNNpR44nUiVDvuOcBw4EVh5372yvsL6aXL9YjmlOFF4E2irfQ0UfEtQCLIk99L+meY
	RlMohivosULvDuLqZuwdlAQLxcc8OVpfOCN5C4Q1j7InQ6p1pwJwIFcfL7DndSUBgEqgW5sWh2u
	4e7oPapXFQzHBVFStQ/Eh4qT6IjrdKV3qZsuradNFSopS5zAMXJszaeHL80beqTUdbSwixocXsL
	PQPxnwSVEaBnvhRVIDu665dKT60GPYd8iuhsyknRkxxw==
X-Received: by 2002:a05:600c:34d0:b0:480:683f:76e8 with SMTP id 5b1f17b1804b1-48069c7c265mr12611895e9.26.1769507867692;
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:32 +0100
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwTWMafMrwJi/UrUblmDswBaoYuUWQ2fwrzpDVA
 O9HMxsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEwAKCRB33NvayMhJ0UFBEA
 DPXxue632XoOKUO20a+YCsKF2UAhWuEgIA/+CWcQ8AAkzX0mKU7Ada7O5tgYC+2C6JOx2B2DQX43te
 +5aBc/dnZY90jLZ3DsrXJS2l5r3LPEBqFYiU8u0M+pLDYuDucZBdExoCYmTVshHoXtkJ9LSKSo6nnD
 gqQ0rEjVHTYrjcLYTIxxrgyNitSAFvzcgsm572Gu4urrwcWKJPKHg+PGxRimxRLB53vR1LXsM4m9Eq
 3I/aPsGIlOU4qsl+NSziBRL0bQrh8FLncxI33/Yq+ApgJtf9GIFw5omCPOdmxRT2H87qAV5D4sbJYO
 iw7Ewf9u7IoCJgr9dhpmee043Nnnj9HipdhsM83tbrjn2mJPoSIgufB9qjTvP46AlXiEYtz+rDvilE
 iXYM+wcORtdDgiJgLxqX9LkYxY2s8syHgTWBQBm25ZuTUDuXoW1Ze5IVTFbnJzOY2klsyaFf+2V0Y4
 Ipxpetfml5c9XHYicXC1Kc31vpoAToQckxTjybcua6AmKRLOqqQiRbb0RoQgLEqWbw0QUeEXu97Do1
 fUEazfXdUSif4MYm7YFXrQuMnegrrN039OGFUJXegyNxbBjUSgsvyDGO4woBlxzYT6LmqCIThzJrIF
 gQq3gUt21+BhhuVP8g6tOCoqo602mIWnf7znRDzCQeo3vM7RmUPLTXT1z3jQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32791-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 14D609253F
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


