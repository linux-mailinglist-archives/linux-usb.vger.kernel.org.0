Return-Path: <linux-usb+bounces-10233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B158C3047
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 10:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54AB728218B
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0D053370;
	Sat, 11 May 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjdI6ynY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47BC4D9FB
	for <linux-usb@vger.kernel.org>; Sat, 11 May 2024 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715417680; cv=none; b=fW9oIu6XUbm1Bf1YnbMgmGHwAYZSGkXH9Nj+eGsHQckD6uTbha2RSgvfgJCiHF4fUFN5XktDRVJTH8hDTz2A3w4d1LZW4HYc/nLnrE/kS6/BwLVBh7hjTn9XG8MIKGw0SLWbyVq/wklpETfDiaKwjmTOpYBMhHn4KNTzhtNti9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715417680; c=relaxed/simple;
	bh=qc1uu2w0hZF9sL0QGWbvDzG6Bu3Z4a6AXG0E9PYlt3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uhAV+nP5buxpa4wArEFHL/lpEuXN7KAkdb9DeyEDgt67A6edwSufNapFIaZlK1cKnRuEvPpLK5TTkjGmqfayayI9RwurJ9NVHTRF1okP6wXfWUVeZ/s/RRNJdMR31YWzKgXZ5Pb3wng9HJThXu0sgqAsF1CBS5fJugFxwcw8TgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjdI6ynY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e2c70f0c97so32740181fa.0
        for <linux-usb@vger.kernel.org>; Sat, 11 May 2024 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715417677; x=1716022477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zUvWAtUTM4Sm4FoN3R4b0S2PPHKLWOTANM8Xp+Goivg=;
        b=IjdI6ynYLRwzQASENnbniZ9QONjcCE2Dai7kpjuqbJ+tVci3p/wkGP0RjBjvAXLJL8
         jv0FS5JXEY9ZfvTimTTRgK6YN1qMpdf0vo7tN3Ds8K+72muxGdprSw1wozifO4TY2m7D
         xL1oGSVKCKyPgAKdFkzuBfOKu1/EJ0pELyfgnPNq5ln/7bMaiubXbpDMqBstmCAXu3tk
         n7kB+P3Uy9xYitEUoGkVewpEV2uKeLV8BE5cIu1tGHPwUAaiXSzCJkIs0Nj9RDN2dW4D
         eFFbCuC9JIlIEwGHc0Ymw2dQzPI55+9twAsYoxOaEQWFQsfL+aq8YO3ra/IK65Gn8YJR
         NwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715417677; x=1716022477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUvWAtUTM4Sm4FoN3R4b0S2PPHKLWOTANM8Xp+Goivg=;
        b=lgsR1wx/CVPSFn0bpbYFTAE1Ok0/vF5uNn1XjbRcdGQSuY8i4r17xrXK3EvwqffSv7
         Cq85RVHtA3WUk/2ghxxu85ikrIcLlEkLCepARzGa3cLN6FyBRxkVyhdvBpj5krC3wB/+
         YlPLZSVXFjJEtHk7muO0Sz0vUraVFH8icEcMgtDoFWMH3r1LUpo7qN0+jkUUXWfgc3JM
         B119hPkyToae5OxWYQCvXkwS7aJ3cJmHHoK5gyrII+bFHq+hW8Pp/lK05FJz3nA5JDyk
         tjrbtAQSlMQnlS1K8UCVDu00qLOivntnk2Fi69DytWEubLGrfah4YOvw8Vi05mGFuR8J
         XW3g==
X-Forwarded-Encrypted: i=1; AJvYcCWz0hCnvLO8yZHOh1VnYF26DI1R1/8Owq5TB3yS4TDPAIbYXZAy3C/JRZP1btS23770vILuSrtlo+0LYtrn+cB1N5NRWn9XXgw5
X-Gm-Message-State: AOJu0Yy5m53CUdNKpxSzYKGmcEeHhJYWeCz7Sowg0GhHVG1sM7VCUHmS
	pu2KGhG6jaNo3xaWOJb92ryeoMbcIoWKBNJA2gmwChKiVDSIPS+frzieLjexRlFJKMGhyfqqyAV
	0
X-Google-Smtp-Source: AGHT+IFxmb3JASctmdQgt9BFaS012sf6ELNlLw2ZYBIT1wHgxOLuixLYpW87XXBjRRhFOdfcx5zcLQ==
X-Received: by 2002:a05:6512:23a0:b0:51b:e46c:19fd with SMTP id 2adb3069b0e04-5220fc7acdcmr3641943e87.18.1715417676689;
        Sat, 11 May 2024 01:54:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d3237sm961631e87.142.2024.05.11.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 01:54:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 11:54:30 +0300
Subject: [PATCH] drm/bridge: aux-hpd-bridge: correct
 devm_drm_dp_hpd_bridge_add() stub
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-fix-aux-hpd-stubs-v1-1-98dae71dfaec@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEUyP2YC/x2MQQqAMAzAviI9W1hFGfgV8TBn53pRWZ0Iw787P
 AaSFFBOwgpjUyDxLSrHXoHaBnx0+8Yoa2XoTNebgQiDPOjyg/FcUa+8KBJZbyyFEKyF2p2Jq/Q
 /p/l9P/RDEjxjAAAA
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qc1uu2w0hZF9sL0QGWbvDzG6Bu3Z4a6AXG0E9PYlt3w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5q9kYe6aNXtI9uPP/h+lZGvKur40WVdWf3e5YKzuEKq/
 Jakm0/qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBETp1n/1+vXpY1L5jfRIil
 RMm/kSc3m0lj9nPrRKW4yijTH8YnQzQ3nt9YrlkbIWnducviIKfLlTM+exoz/OYmRPedeq1nUrh
 BUM1CnN3vXqnGurcH1qyvP30s3GsBw6TWnNnG7Vvj30VUr92rJOKxYsqyRKNm4YeuqlKX2GeWJ1
 hN0fvbcHr9V6M8ldlfvk6Jf6Uk/sj7MntQr+tVXdfNTP65a3WLpor+lmnawtskknm4++Kf2fc1N
 d7mt325tW3hTzteE654XS+2WYWpD0N6Htl9CJmQNDlXQ7vnxJ7kZzEud+QOWOiqH9rsfPiVbNmy
 icrPlCYW/jv2+P9RRqWXiRsDhH22rvrzw63/iKdxQ7sRAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If CONFIG_DRM_AUX_HPD_BRIDGE is not enabled, the aux-bridge.h header
provides a stub for the bridge's functions. Correct the arguments list
of one of those stubs to match the argument list of the non-stubbed
function.

Fixes: e5ca263508f7 ("drm/bridge: aux-hpd: separate allocation and registration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/
Cc: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/bridge/aux-bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 4453906105ca..c2f5a855512f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -33,7 +33,7 @@ static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct devic
 	return NULL;
 }
 
-static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
+static inline int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev)
 {
 	return 0;
 }

---
base-commit: 713a75079f37b92835db48b27699e540657e3c5a
change-id: 20240511-fix-aux-hpd-stubs-117c071fff77

Best regards,
-- 
With best wishes
Dmitry


