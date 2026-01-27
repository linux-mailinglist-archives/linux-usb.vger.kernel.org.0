Return-Path: <linux-usb+bounces-32789-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL4jLJ2MeGmqqwEAu9opvQ
	(envelope-from <linux-usb+bounces-32789-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:59:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AB9248B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDAFB3047E57
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BC133B6D8;
	Tue, 27 Jan 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4iSseZy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC0339B58
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507869; cv=none; b=PWjIplRnnJMElNhtjT3tYDVK90AV6SSFuk10M2+z8mcusZi82G9XsMkGM8cf6T6TiTml2/W/kVIu4njVkFzUeqhwgNYiCIGtnBbifHGWz8XVyHrtllPug0nv7O+TEC4aEBtN21kEWI0WNg6v0svKj2VGLNa58zssxEXlFqy3yzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507869; c=relaxed/simple;
	bh=R2eSMSfkF1CrXn+gdldnHlOy1u5nKEpnHBlABgFJnG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YebDIjCY6yxtwuR4q5i3icyjloha1/m6/70XE/IXvbLXDK9YjBUetYCOpNGs3yh2t2sTY1Qr5uSrC4MLrsAz8ODpvdbtHwViUOn9KZVPR1OTxnkg1ODoN+LG8drQd6orKJALKm8l8JIOsy+vMMz5up9kStLVCfCdEd7KraxC+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4iSseZy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso41910495e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507865; x=1770112665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cb9V9b2ORNjXPVcwOKQNOEMmMPtYl7t/ceGkGIE011E=;
        b=H4iSseZyy1Hq1WnpO3S0m0azf7wKXxQeSLGwbiMu7ekOXJMIHfibF5lKbdZBekL2UW
         fVbRK5sC5VrTRPZ4emLoBlrIOKgpoQnPZ+uxLr14POPmEPb0k2sTNei8azQs6tDZMd35
         pGOpOWfrvd/BRgSeTYMQVMaVTzKhwjVTbZU7syCj5CIy041LlGaSArUNsKxqG7Sh8Gwg
         jRzvdbcAjbINndOZLLf/8ieEYDUNCJJbOPRwt0ER260Y8llvoG5f03zwf+LJ3yrvX5Ks
         Fow1Wbr8dBFl1rO9pUPsEwVBcw890SY1QXno8RRo7sJpzLnjTa6Y1Aa2CaEFfwYeUaRR
         ZYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507865; x=1770112665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cb9V9b2ORNjXPVcwOKQNOEMmMPtYl7t/ceGkGIE011E=;
        b=Ff9gp7M/RCdePwR9NUKkoezWAk4Tu+ivevhfIPki+ETi3mV4SulEX/rbLuQyei9+6E
         4BqnGyVeu6+0bKlaZPHcj5/wqHh4xRaVaJN4KslpoTk1IEMf4XZK9gZz2Q40JGfVxkVj
         ns8OTfY9FHh1mm5ODXVjxSfH6yaWwPP5HVznMYwUFa42CwyZTs4g/PPjde9S0ERU4xH9
         ppqoxJHQUlcGuqC9VHUitnlMmoxc0/8oMWKJ/gqzdp1QQURgBOKANPjKiHoq7jKnr2k5
         lHqsnpGmF55QS0YhBXqM34Nf2LP+TqInH/xH7D0XsYDkJTYpTYzVGLq+gHJfl4Y/bB8+
         25CA==
X-Forwarded-Encrypted: i=1; AJvYcCUDqn+StzbKQx7ZqyX8IMevfKkU5va4Ti3M7jnmI36u2qYrJUJKXjkilAlmMBcxX4V3wGsLhkfb4F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdMoB678+XlJfOVw4A+gYf3QffAdpcWmgAjkzyINV1TzAOTTp
	/nDjX9P9qqKGKk7S7Bp63p14TbWxKvzwkGRLxOHbxhrhc7e1BHemVzucfddU25eDJug=
X-Gm-Gg: AZuq6aIHrlsX/o4gy1ffclGDpj3IBFoPe1R4qFdpAbwAIyIbH+O5cFUfU2B+FPYOc1G
	0uumyIwio8X3Ounkwu3Byor7lzdjtDFWdOsza1EWUsVJwyk//rbzgVjCeyus2/XHKRImZgtZ6gQ
	QttmdL3OqxW/lOApvj5Kw9cwBWPr/yZ4yyoBI+fg/fctnxnzfnK+jB9pJPW+YWSWivJCmfO0Oak
	49aV/c7dsQ4B1IQD+SZbGHoa+77cmZlbR/yLVjwo9tNvpUGpLRoLf1Iu3TbUMp8Z1B4f5D+oBeo
	89iXuD5HDFcWjJCxdmlam8pl7pBg7eRa7YoXssCAobKn3PzjgKOneyMxOoEGGXzd/wA+cfZpWga
	6zNL+UWRgIhwEiW6COM4XmUSAdD4tyzL+2dA99ZUU2TiTLFQ9+ybCp/7yPnn4h4e1Y65K4bOuxe
	Djh8HEQCVfWJwP2Gcu1a4YUjmqCqwfC48=
X-Received: by 2002:a05:600c:3505:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48069b8bd79mr13663395e9.0.1769507865414;
        Tue, 27 Jan 2026 01:57:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:30 +0100
Subject: [PATCH v2 3/7] arm64: defconfig: enable pci-pwrctrl-upd720201 as
 module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-3-c55ec1b5d8bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=R2eSMSfkF1CrXn+gdldnHlOy1u5nKEpnHBlABgFJnG4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwSWwYfTlxDUpjTB45rdckHrd/ghXsMVEfoz3KA
 UJIdDDOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEgAKCRB33NvayMhJ0XFfD/
 0ebA/1uCI8aJQIY1G5W2HlDeP9+sA6gxCy85Fvlqu2QKR3v6HVdjmWewHNw7QmUyO5DavQTVVHKnhe
 nrwTvnHhShHIokOkxqLidW1RgWFFBXuAKNT3Py33p6UIFRFdUUqZnP4h67dezuWMkU20ldSyRmhfCc
 nYklx+uuwFhZKhZWI6LAg0wmTWUqj9eyvd2M88Eovk5uVP5baUWiIjMmNYLYpLKtk+TR5l47+v5i74
 GA6Fs36+RrakZzYXCfg5BGrNVTBVPkPmYAQ4h6BYsMEgisj8zFWTJIhz6RUMuOCLC11kC+BQoiezNL
 1nmMvEDYFbIOttmDi7qohh0aD/vMiu6vvXFhnAHok8qXpvygBD1FXmAV2E7TX9LzS6l8OsmzTuFmpb
 fuHfRHWFiEN3vhqJMfaJYwRJdcQfIvYttQKWKaqrNelljs1UZewRIPMynslHWhKNASwWImTkjiu8aO
 zIRpcbOaAj6V3s+wB9czZuXEudHIt0uM/CsIzy/d7Ej/NlbG/VVASaHlNZF8S0MPmQbAQ0oquUFqkJ
 TetXbupkFi6TAHpLJLs/1BruV5sTO4OB60LqBoXcsFWySSc5VASS5FahQbjY8MOqelxfeZJkYW7LPw
 XOqevKwZKEpZnRxhBsxBiI5mVfSTc4cHYZick8NejQ2VcmO0RF3o27j17KnQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32789-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B8AB9248B
X-Rspamd-Action: no action

Enable the Renesas UPD720201 power control driver module since
this USB3 controller can be found on the Ayaneo Pocket S2 gaming
console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..67c642821d35 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -250,6 +250,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_UPD720201=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


