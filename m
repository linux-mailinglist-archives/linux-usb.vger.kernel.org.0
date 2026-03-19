Return-Path: <linux-usb+bounces-35110-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMG5C9G6u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35110-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:58:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A45192C8353
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5915B31CFECA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81543B19DE;
	Thu, 19 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvPbnmpL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A213AEF40
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910517; cv=none; b=bU7aKcSch7kK+ZeBiI4mg8hdFOmmkj9LVlkoXm19+ouvg4UrC0prtxloEbxaMN8oPmS1wj95JFTkE5Xx/XQdKrgUUyycvIJI8Izg0RGtRN9XxdfN/xjgi9bg3rgZH2gP3NKwgtH1M5fGx8u1VqauAoS6veJGy95fmeg18RpGWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910517; c=relaxed/simple;
	bh=XvC/+pHwVb5NzB52XjoWhWvsP0QalYMxdzFh9h/c8IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdU3+BHguhogQSxFVOY8Due7MTARaOn4oqpgkAVpCOmyKfevP72qQVd1Mw5As82sJmn9m9UWEqQLfLQarHOYILIWCEW0H9pvsGfUiiW/kLagKGLqykcuFPg7QCZNflS5jUKEPx1iN5LkgxYgbCM/VVtZoSpwtkiqEkGpT2nLvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvPbnmpL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4121c40aso417603f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910514; x=1774515314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2I3d/W72WxunPTgbW/r5o2nF4g/KFg/bIY0fMyHO7s=;
        b=PvPbnmpLZqwUTwx9SWESa78OKPrdCWncJDzn/y73jLgxkvUJEJRoKDWf45RJFVknnb
         E/qpfQAud9zdgHdMcl/Ys9zrSgaLeFkBJTBOhwMCXWpSqyN/igYPDe0dkCN/HyCaHgk0
         jP+++enAzNM7RoCoNwIw6/dTXRWM94tzEt5s4dA4whgv8RHP3BAAwABEccM7VOqXS5eM
         ve86KtvNMKYVb4GgrA1mID9u0roVJq1FrH4muahx8U3fsp6hBBijhHElMX8Ajg21tLJg
         TwTH3B1J5unPoKM3OCpjDcDXImQhuZrST74yqgeZWHGlPBTTApF8wZjE/x+zryKwbkgw
         Qm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910514; x=1774515314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2I3d/W72WxunPTgbW/r5o2nF4g/KFg/bIY0fMyHO7s=;
        b=VLNiLKPTI20ZbOoMLrWsf74DBpuVZnB+TMUSaNqKk7TRmLIxejWH6HvE4TFxkVe7ha
         L1A0OC6Fj8BlxDRUF+FKJJisRTzCd+1l4ClOPfv3XN9gV6EUbtUvQBCspvHykAcwYj5f
         MDlRl0lb5nTsguvRqrsEpvBhgbq8v2U/B/K9Ua0fUXSD7rbahlhSRiuBHhGo01iQe0y0
         2udu1+2prtshInqH5X2DU1+Yo+b1R9IFV+wWxvNPgjkvsJ/56i3VAt5zKpmzEAyZS86T
         ePGrYE0NHGCYJ/EXjE9qZeXmebKe2qSgvX37kAAIAnmIyYDT6P72oQS9Ob7YSI9/iKqf
         TzIw==
X-Gm-Message-State: AOJu0YwXO7KFS1z2hTkRm1dxAZnNDzn3mlF8V8KhTYeZpMoHx5qrFpsZ
	1ZdYMUTGybha3R3y5xCqkMuv3A1nBJhpQibVLYcm4Hkbb+gjKZhA64bYF/UN8wjqF1o=
X-Gm-Gg: ATEYQzysd+ae9+UMkD7itVbmbfR8qw3u/qMD5TLxwKje/CPLfXFSNvVwNp1DRniKyr1
	4cUzjROiNP0eCu4TO26eBzQW22LgzdosQAzUpdhSa7ZBcjxwSIkyzkyWyL+UNjxHaLWlkpvcHOO
	MTJxDJj/8itU1M4ky+j/2EOSnRQ2Z+VWzNKBXsB0Ip8KiNLxBXblrjcTISlA4IBQDJDFUhgTbiQ
	NV5oI7+8YpbpG/js6rYEfnPp639hXELmvIz7RYuDqFTTvKqyuOC0zVMqbQcCPs/YcBE+YOMieTe
	86SgzD5HlDbJ8juz0h7G0vwXQwADIXl8RpJJVS7J/5n7Y2IuGzCBTS8fQckgnyoqExtZr17iXZm
	fq7AA72zarhTg4fUvl97RIgq2mRbU6RhMDBfsVrvQuq6xx85UjFNFFoa7U78DRpYXk4yPiBJ1+I
	EL67/qtAhgerwaz0Fq1EMcTiOiSng7bY/Y4mjgeZtlCzZy
X-Received: by 2002:a5d:5f82:0:b0:43b:45d1:f44f with SMTP id ffacd0b85a97d-43b527c89fbmr11259355f8f.41.1773910513729;
        Thu, 19 Mar 2026 01:55:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:07 +0100
Subject: [PATCH v6 1/5] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-1-797bf96df771@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XvC/+pHwVb5NzB52XjoWhWvsP0QalYMxdzFh9h/c8IU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7ntK92VjPgJU6LusU96CCjpdrZznIp+B8cqAhWc
 IjaiDqqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57QAKCRB33NvayMhJ0a1PD/
 9imeLObUOro2ziHQTn0Y0AKF4JJ+zd3UMzIolL+jH1PiXN/0saQQY/LYb2CTMEpRWBQPN78SQPEibW
 A79nzVQUJzwY2rAmo6OGLM5O+AfAOHEPJu9AvUWyMik8IopXmKxM6ph6Yck7Y0d0Qa2vWAykpXqONk
 EMucxj79YcQZaYTQtbJmUrrwTcEhimGlRdK2j3iO8S7BqANzmgBMeqQPHn1SoHniv2r2/uBVqRfkje
 3v9VkJzSkqgbI+uxuqLvs6S0+bAl1RrFUey7aqR8Q2PcNy2+2UIQ1AvrpgSJyNDFuLr07FJPDEmCgT
 lNkFjmisl1+JNf3ScVXykx7SJyhOlivlY8/kLyEZceIsSHrBiNn6E6MHWTKObG7Cy9KsNx/dN4da7N
 piE8v8n636zjFsYRaWEyZR341bccb1fqXXuVHpWSOIAov8IQloVj/Ln9htwhqds2a9dcebRcoaTUyn
 INHsmZGLeopDkjv44/JbirLyGJJuN8GE884Vc8DGFcWG3LkVh3s/dEN8MvgLUW/Ev9ABxsMT3lfeIZ
 XmLHFVXKegUPUnyfZtuRdSqwg7XHchxRSzbjK50/+335qj1WcUivl7Up2Bc7+XW8KzO6brgDzColmN
 2cfm8i4ex5gyxpd3iG2KIB6FG6rkDbe2BQSCc2rJrLAp16kD5RctSRRJzevQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35110-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A45192C8353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..47347da14900 100644
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


