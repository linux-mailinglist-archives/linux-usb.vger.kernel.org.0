Return-Path: <linux-usb+bounces-23444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB092A9C62E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 12:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9BC51BA1270
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C82250C1C;
	Fri, 25 Apr 2025 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rGeRWTWI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7624887A
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577989; cv=none; b=UOx1ydjY9adml0xOY12lflvI4162S9p+iksV8KLu2sVlWIlpA3auP6H1RB3CGABhCaGLrfcAbSAHKZdJd5mvOINPqxFc3EeokK1ZgCvwJy//j681EXegsyhEgbzzFihgW0RTBjW5hSnPCStCz0xuiBFHAWaxDIOu2nHSGoGNUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577989; c=relaxed/simple;
	bh=85B3q5YxIURMuwDetlbKPbds6WVQ//EnUVbXQdNluFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQBABc9DaiONi/6Rb/d2tkTtgk1BsWr3JbVQfAmvXOtFe/IsSIjEt7lGMPUi5UpHKGNcxfH1Nt+0S2cJ2MCCAN/WRugtFSmmyXBAqwo9sPUagGsvEOP2EXtUQJazQ72q1OOViZpS4jiv4DB0NwOFIZL/vNfdHnlu1rfPu5HBfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rGeRWTWI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3651086a12.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577984; x=1746182784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=rGeRWTWIj6kPYx04Y2qyYOpqkrP9wTl6YHQc4uplKTpzcd57ZLCX5q421XbHnUT08/
         e1aLWsQORsiQZ4TyvSm7HWEY/HevFZfXI/sxLRTskY3rR0uJfv8dQiHmfOFhCh4O9aw0
         uNMhQXJcwYRZsSWepjcfDl/5j48S8GK6+c+jssmDr626Hcwd5v2zngaYkM66L41reaWv
         3FT/G5NQtVHbTvrl1z/m9IOrlMdR2Gbfb8zT/acH1TeA4xmurBNlITWDKBywE3w13oz8
         sskb93lJXe20rhAlTPpT/bOB6kEajcQ6d+4qxkCRBWXjBGVe0T0dbHaBdkj86NL8SwuA
         nWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577984; x=1746182784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=wirJYUuFdjdubBiytgxOsaHExL+h3AaNaXqDEyGpLXptT6+PPnTFnNjVjUO15Z5duR
         lTEcyNJNpSBy8hj1u28yBB5KfxWS+ATfKlKYORhUkfWMqMAEf62b92oH3nqNAMiMwu5c
         4i2WhNbsUKQGVnkcNtNAzv1YHdhM8UQki+2PZDyNs7l53A31HiH8spf4tZQob3gJai6v
         2jnNFQycTIP/SVMyLINR71nlvUBp7nAo23n4qCeTL0+jS7NZru3Gr+mShvOofehoUiYc
         ex9RqQv9ftbxI7Qwyt/HjGYCVDtaXs6UQEpK4aGFs9713UtJOFsD1qiige9V6p0mdOgn
         fiDw==
X-Forwarded-Encrypted: i=1; AJvYcCUxESbTUfeDTaI/f6Oj9xMIiPDBN9spzSvs+8gmzeJYfv2kZ37Mn0hT+9AmHxF+29+UapzQXw7DZyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+OSJhQWbOYKwpHNRaGXBQ2TzsObC4MXCE4Z4cWu81E5MA5497
	S3Gn22ZGoY0Ug/5yWKz0RUi/9brlDfG4/WgpQ3JQab6ex71nkIHWXlKqPrAC4KA=
X-Gm-Gg: ASbGncvO17xjsuSWKXZDOPqpehZFgGE1tu4HjIQ/sRKaCcubUca/aS7f6zXpDWURIq7
	6n/sbWzVn3oUKMZevOfHElVgVoFiwqzgfpCiSF6CUAqPD50GGH0jS7Z1a6r82V38f4Dz4tQWFYX
	nJR3uAIjgBtnnuCEq8pgOgxWGE6WBV2rCyjeiLUqm4WUrxNor1GeazdGSb1P/GRLCkk7aiwEDzx
	2YBfWMgjXPoxRAkYHGC6dYHksaGbNMO4cRMMkR3PVFDv8+XZUIH2HW9H2Vt5MdOa9sn+FLMbE09
	EmwO4x6pzajJPvzDCGvsUFybP+KbxA/DIIcWlDRuZtTVGVtwpFjaa16juFePBLAH57VAFtatI33
	YhYIyDDF55QzYZB41w2OwY6xMvsHvMSIihaDNeEkJ3RVc3YRlVHX1d4ep
X-Google-Smtp-Source: AGHT+IGUOsRcDWXWXshgw3+eUDsixcC1XjCIOga2rl+spBxCUbc06RAYeUk78gF6BzGL5litsgHz+A==
X-Received: by 2002:a17:907:2d1e:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ace7103877dmr173149066b.2.1745577983978;
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:53 +0200
Subject: [PATCH 3/6] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound
 card
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 57f62a228c262f38e703816efdcf443355052619..6f82e5cf6df30e021692015df9ad7b09d4b2c7c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.49.0


