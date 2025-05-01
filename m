Return-Path: <linux-usb+bounces-23594-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5236AA5B33
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4027C1BC50BF
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 06:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7052701D1;
	Thu,  1 May 2025 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HFDcAJtV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227B258CD9
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082158; cv=none; b=sUNgv2mj5GD9IIgI5g+HBDCNsawH47baFXuwO8ijIFoItcQP8iIgV3vxiToM/EhzWur2AYrABBRdzWesixI1i8ntrkcYa6kherR6iYprTwa3aLYJmifbmAEb5PmjnQ+lz9v0AuU6ejpMaswW1w+6A3/18wl4j1qiQ08sKmohEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082158; c=relaxed/simple;
	bh=116cbfgSezwsafks+V57dwlIk5wKMliQXk8+AlFgvVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ns+ZfcFMhMNS0wW6s+p+djWZYDO48vc5w0z84khOu8FsQYWWTGGJu3Q5bCrjRKNO9dxbbFWb5qB/178+amUXaxHvjwpY7YW0ztR6FRIzRAIE829UpjWcw94IeWhHFzGLcyrNxWNOIB3u63HILRl4VkRfISEySzVBGJQwn4eWRdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HFDcAJtV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25520a289so105963666b.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082154; x=1746686954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmVPwMjmOyli7RFKP/N7pH8Fgah0F5XlIiAvT0GKe8=;
        b=HFDcAJtVf82bLkYnIFrvVYU1G3hK7DVDMD91FZOijkiHBSMYr/idJFBOCU18Rgpaqx
         uBnMJnFSM1XOa7/jcBoi3ukZXvfYOPssGVWgqjutnBIn/UvNcx4SZaGx1d/JREzGDB0j
         egtT//RENKPa+MHqq8LAa2nGl8ETbel45D/t3UNIqYr2Ty1I3eiSEYIJZY+XYNySgCdl
         hYnP5cBbCeELCX7jdEWcaMplq2Dli84AIeXrFCrlVznIQ8SJV8Ter9Kb8mNGhR7jzYuy
         q3bkoVwJEobCL795ouZFPVi0FejRfLUWPweyFIbOrq4+vMc85RvUd9jYcn+d592SS96G
         ZtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082154; x=1746686954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICmVPwMjmOyli7RFKP/N7pH8Fgah0F5XlIiAvT0GKe8=;
        b=MoyDc0wWlrAKIXp/xaVdnardWKcmOxM1TFC7Gfk9BIzblRWUOX88zLdCyyxeH3egwK
         tvb5/qgzxWT9a+kU45QY7cknAFg0BF6VP95TjKsOIZlzgJUo+tTFtnhyKedTAHK4dTrs
         jw8gGhnNUhLJ8ax4ohM2Pfg5J7U/ez+BtSd2bQXbpObUZHr+0ImDqsIzs1QI6h+iPvSl
         NO3lKEHVPF5nvBxoThVDy7XPnpPORxfpVTw3slxiDTOs3D3g4b1CPSV7OIAXCHB6UJFG
         VFTfUjdrl9zcyFW9ch5cRgHB1rn06y48q2LB3rXt8G+Q1ZjUmLONd4svA1Z2UJdoK8Vy
         WGyA==
X-Forwarded-Encrypted: i=1; AJvYcCXem3GH8buPgHHtYZtqjXqzXZ+ajZr8VWtCoEeHIrN0ZAfxh9Fbud8MmeMsu9dCsJVgZLsOtkdgxeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8C8LmhUGPKdTrLUDJNJyUkosSeCV3OoJa/OTF0rC5XhfsqE2
	dK5B/jc+1WeNQZ+/KDrJIHJiELsREXR3GbV+5SpBCGtrsPyBBoggUEZOlse+UEg=
X-Gm-Gg: ASbGncsj9R5+yz0P+vFbU7CMDCMMCjTw0MIaFtIeElTBmzt3ajw9NdkcQp7onO07g6s
	aCYsAuGHx9dsmai+/0vZAMGT4EtIl0YgNIBOY1FTyYWDVf0T+2/0kfZGe4oOto5N+fUei8G75Al
	T6N4zQgk35Prckc7NqWMlSbXjZHTU/uRcCJxNNN2sJKlUPDGh+/Tx6UuRoOsAEAS/xPZZ+baTGD
	I6nD9vpZcDFLJW2L3jNmffcn8oJlSntr7/SGaw5z261QkwUD7lzTf/MJGIWAAgLSzWPls3ORue8
	rOIep5Ymsv/OiVJaWP7pZabUsHio99phZDkNg8ep6hUNbsb94/IXnNP3UT522koyBbg3PbR6KFn
	OcOo=
X-Google-Smtp-Source: AGHT+IFecEcz1pbl0bNby1akbXk/OS9BB4XW+tEKuivEZ9a3ze3eHfwybQTHoaKz7WPzovMAVqwFdA==
X-Received: by 2002:a17:907:7daa:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-acefbfe36a4mr110480866b.37.1746082153725;
        Wed, 30 Apr 2025 23:49:13 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
Date: Thu, 01 May 2025 08:48:46 +0200
Message-Id: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ZE2gC/4WQvW7EIBCEX8WizkbAgv+qvEd0BYYlRoqND2wr0
 cnvHuwrki7ljDQzn+bBMqVAmfXVgyXaQw5xLkK+VMyOZv4gCK5oJrnUXEkNflGw5QHM5kKE6P1
 nNA5Iu8YPWjvZIivZJZEPX1fv++2pE923Ur8+zd/2MnZ2oxSQpxo1B7MkENojNaRIW9Pvgv3lu
 RKKt7wrNBrcAjlus4MBm7r1yEU3uH6/OAaTCWycprD2FXbouNXKGkKBonFkTMcVoiyud53Sqli
 DZSfxGPIa0/d1TNk/kf/5YBfAwXfc60bUWJN68yakZYwzvRYEdjuO4wfPcLnJcAEAAA==
X-Change-ID: 20250425-fp4-usb-audio-offload-e5d7fb55d283
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

Since the series for the USB sound offloading driver was finally merged,
we can add the sm6350 dts and enable it on Fairphone 4.

A few devicetree binding bits have also been missing in that series, so
there's some extra patches for the basics in this series.

Depends on:
- For qcom,sm8250.yaml & sm8250.c:
  https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com/T/
- For dts:
  https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com/

Devicetree patches go through qcom

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
- Sort cpu & codec nodes correctly (Konrad)
- Remove usb-soc-be prop as it's no longer needed (Wesley)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com

---
Luca Weiss (5):
      ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
      arm64: dts: qcom: sm6350: Add q6usbdai node
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload support

 .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                            |  1 +
 5 files changed, 62 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


