Return-Path: <linux-usb+bounces-35113-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLUTFEi6u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35113-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:56:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F42C8270
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB3A1304D657
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75583B47D2;
	Thu, 19 Mar 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpcvy4P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059D3B19D7
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910520; cv=none; b=mckzdwJu0X5wpN7WHX/q4yvdEbPcdBqu72jT9T0LYfqDQiWfwOZc29NceDS+tiPGJnXg5PO2ut1QicwRPmIMF5yztZ5xU1p+pX6ZAOyXNBHHDb0D4LtxIe3foA2IW6HKeWY846gEX5yqiWWpej8dUNeer3ycLEzHBEbTcaluEXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910520; c=relaxed/simple;
	bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRAV5NW0/srrjIsSdMj21AU/J92guP7KRTEGBE0qSzVR6IjoTzfoRzz3bbQjW6nJgrQGiBgxL5Wl2EiU4pvjG2U5qfPHx9eszBYPGkR1ulWerXuNAPSVRPcOf7dz5gnK1PMOjTGoHO1BvY0Bj0yJjSkexZXaeCUnFVNzPCuthTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpcvy4P; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439bcec8613so470487f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910517; x=1774515317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=qOpcvy4PyuYumXY/Q6TMUEv2CuiWVW0e6eMLvYa8EwYth4he3BrbK6fiC77FUL22od
         w8Gw45KCqlp0FBdbfWHCQJwd6P+HcessnTi7MdePCFvJGfg4szTe3jmZifM6eHAMSuvT
         nMed8FAK9IuuMuNrOS2z2PnIYYXpS1CFVawr/ExcvbWrfOlA8k6UuKoH02INB6gQwBNV
         mStyEZs16Yz8PQJNshIOqNcRoTQOl42E8DdNIYhxM79xOwUwmDvLDo6zK/gq6BUsX32u
         3npKxULLsbac9baWJugjwM8fjUUEbFJk5zmZWx1hBWB8WP3yegIxYcO+yCPQkDo502Xe
         Z3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910517; x=1774515317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=omqXPSViEQ9EXY884304xUlyWlqpUXa3TAjZYYKzDl/fvM5bOP4dJvkvJ1X+qHqNJ5
         AOIJW94qD9FLtosdX8cmQuFIt8qoG6MBXh5vf00LOb3D74hPp8OvJWnvzdIA71qaB6DC
         EvEMTWFaVuBcMBFcOk7hkBbNNZJ4UX22HnTGZDdCvRXQvY+FY52zGYzIhqgv6QbCfdGm
         MpT8t16O/iz+/iRhqfz+jKKx6KLiSEtcYG276l4rffKM0PVXXr3xH6lAj1lhwsbxQ3O4
         OQsvLXQ8OTEAbKUMgtmeykoLqb1S/giHqDct2nKUdGp/kQuJIhcO/ZX4fzCXFmujmEz1
         +CbQ==
X-Gm-Message-State: AOJu0YyiuC7exQgxOwqEb0x/w5zSmTdmHFVdV8nhdfxbtJhRNb+z477G
	jZDNGWsN0LRidQQ+0V/slN7OaRg8vJtWcM9wynMPq463UblXz6cGKEgqU88vJNLE/0U=
X-Gm-Gg: ATEYQzxvFmvJAlaE6JP14NcQukN5lSeZgpWwGLxvnxDW5NIQtAzhRndDPlmgWqtlJrk
	ZJwxGPmhP+LHQjJo8oCQFlTBwwykemDBavkp2ufcWmxg+2B7FJWlYF32w5MZU2KaVPETDvD6CIK
	TGSueYylmvYAO7NNTsgfsPUaIVBXd5rCJ+hiGwm8ue0MB8qoLurR2zyqc7uk8aGPyvT4jlVo4nj
	+b9GITj/Jy4Kh7HFNlrYMB0lcrFQ3Qs5qpHoMyj2lNMhF6BUyHXIhKcusgLDJfPagMcso963Dmu
	7cOrFb+CQi9uraPzAekWy2a+wC6MoK+nL21fXZQiupeD82GBLNBlQitfkm2DS9BppxUV5y4AFIj
	m30fGT23PgYTbVVbjAe6+QfQ4h4jcmVAmByMIEUnhorvTp+b9r56rxzSz6gOU/H4idv2PN2lwV6
	uLQhCOIYrCPVZJA9jcyrDBLgyWfNH8fXIbBZxyEuAcj7JJ
X-Received: by 2002:a05:6000:186d:b0:43b:3f2d:7d43 with SMTP id ffacd0b85a97d-43b527a41d1mr10142006f8f.8.1773910516752;
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:10 +0100
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-4-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nunPYOhTiI99B5Q/bNgHEtHbrjhLdq7ubLUAcH
 lJSCB2qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57gAKCRB33NvayMhJ0cAmEA
 CM/lnQzXzLyU8ArEX7ukS0vkNKBQz38y9Nv6eGSyPOQY0sDW3YmKM9yzSVKIjuL024yDvar2AUX8Ih
 st4dPbKYq+/lFKSSZTLwlNoGFaCptRBZNG94QHR3jSMV6OJd8Dyyb/9Wo0R2euulXJChBmy3OeMNAn
 2Aqw3aFaUku1Sj+H42NVncVW4kCCdcZradlXFKwOzOjBvgSkTDiRPX9Fh0eS4mqeMqkMORmdpM/6ui
 Bs2rwZJeaSK57gYJTod5eitu3i+Rejj1ZI0VzhOFLjYFaU6e0ACxBsETiyoXQwOEe5fJlDkrzgD69u
 fztO+Yt/jR+5c29qszteEBbQX9OrWhv/Kx5smzn2EvTFq8OfE2tmVyXrX1KbSdfCzjSjbO3rjLFueN
 M2NlPQFHujH7X3gdQ9SWa7N0VXFYc42eIyS4ofCl4ZBA48aDyueC+lKX01m/u1dT3+WgaEJigz0T3k
 bcVhyt5NKoUFBuY2IhHd3j5o/2cUiCEBoVLp9p6FxgO1QNMlJQlDLS4l8wV2KUp2ees3gEJY5tzk34
 BLluwcybNLRwOrwrlXkJ7PQogiAG5BAPSusADSPqdfyK0QoQ5XUmZ4R+xN1KWHqMaAgo0rJn6GwHGP
 pf+WlySA0ojDgxmJDj05DSh919K16ItqTM9vtaeCck2t9pdgp9L0V024wsFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35113-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,af54000:email]
X-Rspamd-Queue-Id: BC7F42C8270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..f172c78367c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5905,6 +5905,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


