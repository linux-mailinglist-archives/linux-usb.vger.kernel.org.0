Return-Path: <linux-usb+bounces-33522-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBIjLFl4mGlrJAMAu9opvQ
	(envelope-from <linux-usb+bounces-33522-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:06:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53446168AA8
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D271C3026937
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CF634F254;
	Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alkGBNM2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA334E75E
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599897; cv=none; b=L+oLwW5EYsjwXW/1nkx/MF4Vrs0xcgBH4OUMloIuCUbzUwyvTs144Rye74NCyM8aY7yjasUMbou1qg9KsWMz+Fv54fZKoxF+x5Fn/0HRli1ENPG10lxYCZlbBUDfrFjZEyYoYemjq5w2e5NarLXb00bvnczBw2yY9S9hzst4j5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599897; c=relaxed/simple;
	bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGly9CaU8+mD1kzqU5f+0l4YBAbVgcHBeLxU3XM6gLyeu2Qepf3aEFDJI7+yzM4u3DkCoW2tGyYcMEtQfybLH3upxUPjxR71rVsb/J67wiu2u9L0QXePsTyvaW0UPORUf7CkJCKg1h9EUO6GY9xP4f6NWbMELww5tHjS74O8l54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alkGBNM2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837634de51so11067605e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599894; x=1772204694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=alkGBNM2yctjUTP2a66q6aRLUKLQHmVZ9AMGL2EXkkFAU4WbcZdOSitvQ1bY4ao9+3
         VE45VQM8NkZhTGhkUhmsyC2e+aSb8qcW0hT6UznmsPWbqYjC5Iaxr4gDnqvGys+iqDQh
         lVXord/hj1IiK+3tZiWTw9ZpjyfjLKI1nnlN2+aXdDmCAPhxoULL+4hl43/xJ2mEAPUk
         n+UTAbv94OTmG/kMvEjJwAynprI2XCBJyIIWrx7ky+6/nejeu0ER9snf0YltV0NDPsi2
         5GSuiQgL5T3Gn8ElUFg8ftxEjwCHnnaTbNw3w46cV+VqdSSuJ0em1ZoGCJsLGZW7WUom
         WfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599894; x=1772204694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=jn8qC0iUm4ZfYkFhv5wj+qcozFyCkFDMCftkARRvXufyTV60W+yRIlY0KgFMKuDOY9
         zA9pmGrLSYaPxw+5oIhyLsDLJBbDhqhaMUG1J5ACUxXJ1ecU6A/HcvFN/rDGEEpb+fpt
         ClrfA4wBHx05+M++AtaQcNiTEmvMeo298kXXIih8MLk21Tqfa4BoHWGPffv4XFQZEQlp
         os6uCFi4WNGqpGbCTceOlJwQcFuoRVKzDPi/la5TH5VdLp+x+OZ8a/IkwHWyNrq3DMCt
         LMMH38ikDVOIkoIVhC4s1U9DSM8E3EuZzE39KUQp6nZbH+pjzH94PKZT5cVTfWh3Jk0k
         alnw==
X-Gm-Message-State: AOJu0YwVAretGcB27ytpNcE4tZoNMyulaZikZ6ndHYKU88+3RJr6JjVN
	XC3+VRjjr2kw3HAFTAILmTnqAcZi+FjGN+0dUoIuE9CDuzqdWaPhgyzG0D02enB23Dc=
X-Gm-Gg: AZuq6aLYDCr2zLG67c/UuxwdF1iRR9wPGIfyvQZ007HB4XlrQ8nCudX4PcS4WfcQASB
	CiGlgx1V7FEhLO5wzAseoHJqew2xvGFuCzfHogYUep5iqCYD6kc5Iil9cGcHTn6rv0Z2ebqBVtA
	5Z1KIQVccyb8SdDFMLIu4/s5L1itpnS7Kpr78euJOz6SMgWhkBJNG7PEV++RgnahIAj45k1aDGW
	R2KkijP8ugAelrg8qNz1ZL8+2T4997IslMVSdd0PakhKbCZR5l8Nhhps2qC+Ut+Y5COP3DY3Pv/
	MNsxviJ1+7DHz8f5qmM23imffOS38pILvGj0RiTxhIfDgvdXSvO/JDx7fZ/FT07znAQ8YVCynqc
	vkc4L1+45Vzb3GdDbyYd7zNpElZh1wF4cNeciS20GL6sgWit2rP1TwkN+qnFUn2UaujZLZCgZhz
	oi5aOZCUVC52M3YzA3gghCJw0U7eojjL93TrGxovBXSJx0
X-Received: by 2002:a05:600c:3f0a:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-483a52b2e32mr41598565e9.0.1771599893489;
        Fri, 20 Feb 2026 07:04:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:44 +0100
Subject: [PATCH v5 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-5-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgMWIfn4SgSHhWQnnkQkpLCpCCiDb2cJXWObnzN
 iW+G1ySJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DAAKCRB33NvayMhJ0ZYeD/
 4mc6uejEUp9T+4+gG8RCsrT1Aa+N6h+H9ToFhbv8hKKYE2EIUPxVsfwFjc23XbA+Vny8t0VzRjLf32
 UvrTK6j2Va2XQW1aeaAHWkdWtNwCTU04fmMCyjmSvpExDUtZzQsCTCw8dNekvR+k4wQ9K1aC1bToCm
 qO/RfuveNUaLtUJKg+ZhNLzaAdSeqzSi6Bkg8+fY9ZpM3Z9goQBHMSaU02N/Xs8yweVPG64rbCYTV3
 pXV+uWbS6wKQ9l7JycKlUr/DkaXMaktIM+1v1KRRqrxUNrdmbbxgsH0UsEdNAf4qTb5yeFfFh9sApR
 zvSoIFbIdKbEJipTic08Qs66lYs6VTIr1FwKXBY8PDpepu257raCvWluryVBRLWqucprYiZ9l9XIeQ
 zjJAgTzLjKWbYTIYizKHzj+Qu+/0L6f7AxQTrq1xHalrmaZUQlaZ8BV+iu8MOPqC1/zWF0zHaQALPp
 c3cc6LKX7iXtuhIp7n8FETP1pxzn2pb1WCHtMvfjMS7Ty4NOVCb/IRraj2utZdW5Zbh9fMEtIv2Lku
 L/zSKVHXzVvDZVJ8lHo0axAqmrqlgvZUkoNpHdXqrQOxfGyPkE6HSYJFzAHAYGeZOu2QBRPY8S6LqL
 whv9Vz3NSaMt8HAT8DntqEy/ZEIdLy3lN8C779VndPbl+w7q/EqNkklsP0aQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33522-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53446168AA8
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..0e8b62ffa7db 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -258,6 +258,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


