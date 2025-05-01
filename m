Return-Path: <linux-usb+bounces-23596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E136AA5B3C
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0699F4C2F2E
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 06:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F101E27814F;
	Thu,  1 May 2025 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NkvQCWE6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C226D4EC
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082161; cv=none; b=OEZ1y6UwyDg58J6KvBQ5LhU/ZcMtEbffFjvanYK4nytuH3+stBRIwN8J6dCThReHX80012bWC+oNWo8s6PgqvQ/SkSFr9DmkWce5veAFb5k7w6agu4Thg0TmnslLE9ha+0Andytjx7xhDWHeZnylW3VRVsPmuf5wOTAaE0Zb+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082161; c=relaxed/simple;
	bh=j6c00ET8Nxx+FPWVkkikQOyolQ/2oogumLYl1rwobr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAUm3PJGqGu6OTM2uKFeP8smAGC2ylueZkOHOHuc2BVQB9o+m+3a4zUkhm4Ty5rig3vKSQBAWk0MrYeOJJI06LsF8viEIxaxSrhq5veDbnM5T6Udo19ZQowLNIp1wlo5W9yob0hju/A8FX38JWKIsmazu4W7VHQ2icGS1Fb/Ono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NkvQCWE6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac34257295dso97848366b.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082157; x=1746686957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=NkvQCWE6QdxGUOdyFCgTLho63TOEuRrokB/EvKZ1f5PyPzP08LKxXq98axHw/ek58U
         e47GM/mvup5I4yG9owU1t2oOBJcYWXJ/MfMTu5RgQhO4Jvtc7MS5WRwAxnRU0egNAAsj
         4b68VnNC/rtgSWl3JyIu+1ZT6BoxDVhP8Z49xIu9PJDaffBuwh8LfP6ODkIG8FZ5rQe9
         8Cjo/IqoOnh6hgxyFPNGm2mCMFPoo+Oqdunvxe6qWdwKTwRZa8YY2VtQ9kCg6Wfa70z2
         awqrZUm4gHGTCcQFrlMFJOOLOTlRo+y4JwMALOTlmLQFmDdrOVx4rQViBI/TgKRgfj6Q
         pJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082157; x=1746686957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=RHTic+llBHkiLY5FWO0Tekh+G3jfuymF/rQQcOR+DimOA5hzfG/5rvlZmGyUx+3/Se
         n6AnLsXseIgHgzQkNP6iP5TcXycxdDfwTAnXkwv2YZf8ms3TW770UHljqxM5s/Yiao6t
         wCPVZ2ibdpr38BSLwVWyLuD6bhdrKBqzw9JE3KL85708VlYMehjBQSZIO4Ut9lwmtem4
         gTkiXeLdZ9hAkXgm2yGyeQ1WLoYfYXAtbLCZ66V08FdVoBZ2lyEkeO1QDypcDLuiQSfu
         TluoXf6s81vF+jtv2ae4T7xF5oyjkcRGpbxWsB2inwy6m4RYiC01Qr+RIjRtcPibpM+O
         EUHA==
X-Forwarded-Encrypted: i=1; AJvYcCW/dlxojYiY/rZC2bR2zh8H5DForBrfwQvq72arB6/5InBAKzbdps+GIVaw4VfVJeOhsLmo11b83aw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1enMNe1TBMnpClmr5qly0zvadErTFm4ZLuglKBCdUrJKvSox4
	4H7AbrGpOhwpuzdDrroOpYO/V2xwI/1hav40+zjiwHCPmV1KsHVTquMrrn2ZQ88=
X-Gm-Gg: ASbGncsSDSuYt7oX5POaRc3cUyZBlVTOu9jWOsdUqZ6o5lPQeZB7icO4PG9SDmhHjJM
	Y6hWD+uAgrVXijIPFzmCuVIgM4hcnIJ3LB9P9sGBmdys273Qcn7cj9dSnHNQgjjNZcBfEpr6gfb
	TvZ4qWAj+lO6keefvNe0nCJF7XETopK4m5AUY7pW1A44dxz81sQJk1MB8E9bJZXGgWPHiMWetPF
	4g4zzDBW4edjTISCaT0suGh8AzftCdGIjWVtOV7eqt6XQon3vfqwKaw0HUGNVsWKRY7zI/lVgeY
	gN5FM4WWi5Vo4ZCAiNySkcfffk3mqIcJWXvuLn8XUDft7gE0Ookgya6RrYb7N4ZzfepKAmbRywd
	oiPc=
X-Google-Smtp-Source: AGHT+IG63RNYN4HNO9Ko5hFY2UpicLAgom7xY0lbRX66pdh+OA4P68D6+HAwzHg7Vtk5TsYdejiLEA==
X-Received: by 2002:a17:907:d0a:b0:ace:6a10:6bf with SMTP id a640c23a62f3a-acefbfa083cmr147786366b.44.1746082156726;
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:49 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-3-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 43c93e24d77259f232062c7e4182a39151111c59..0025c8957abddf54d0aab6eb68acc79f031917f9 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },

-- 
2.49.0


