Return-Path: <linux-usb+bounces-4217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42303814ED1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 18:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10B828745F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 17:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4559E3FB37;
	Fri, 15 Dec 2023 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mhSVL1Ma"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95241851
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so997457e87.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702661409; x=1703266209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdUQqqaWMHzQxJ+jrzxIYZWyQq/RjIiVZaz4ReZcmIY=;
        b=mhSVL1Ma+Jnqqq5ywAlSIDb/NWgqWWUNbOmemY3rfHxrfysE6Bq2RGfuMR7+f5J64m
         GIPu5W9UJL/xrhL8XA9iVzjLmpRTlfhv089s/6NnZTfPrzvZQEjX+LrffLaa676sRM0I
         1z17SKGg5TimPUa3xEmzIwgE7XKvEKEiNR6jCjQtJ6jJcWUoFcN+h7ZWZ//d/Z2Uu2g2
         Q2sf1zfCJ3mBp+XE/jCPEtQcFFGjfd+8aD5vpPZXcIHWt6Hb/3a2qODHn5WsiTKfn0Jn
         dkrJ0/DFrSRLw9Ki1FGg1mg8eaJtqHQ5q+N50ACYhGKjSXYyrpSwkT2CyapwlhpL8VZo
         eRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661409; x=1703266209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdUQqqaWMHzQxJ+jrzxIYZWyQq/RjIiVZaz4ReZcmIY=;
        b=eoc0FyjoyKNR9Yb8K+5b+P/DTY3fBaz70CpFl7072rkzRdr++n+yJbSvJeriqJZZM5
         HmZ2UKjWgKelTS6UJDK9E63GQ2Sd7Tx/mUd4HEu8XLeJrN/SNd32EDFXYUxWnwwD29Wi
         6lOJB60ukYKa1LsjO5LswCkppYvIWWbsSWbylhF1Ms+rUaGtOBX8p6S1uD6Fu6tW/uUh
         Zuua6qe7iHYDCarO0MoBDs/DjBwAICsqZ6m6M7wqwerohRnJ6Btd0HMDWb1LJqf4LXml
         JWf7+IPBe5DS9u0oRWqukSXm5zk3SAAGw7/V+7G6EgGMbgyF93lmAC8jDXVPe1CV0o59
         UGUw==
X-Gm-Message-State: AOJu0Ywu9YyIX4ijx7e77BG3ysB0xjIglQm4clIdFUn7/y+8eDqfQX0i
	51Dy7WshXsH+hw2npNF8Ps69AQ==
X-Google-Smtp-Source: AGHT+IEpxgNeNbJ9qmCuwuVfhPnZ0zvgsZ0AHWIarVbGf9r7l8dYVujZp+q007vDsJ/4JjoLhvo+tw==
X-Received: by 2002:a19:e001:0:b0:50c:11:4740 with SMTP id x1-20020a19e001000000b0050c00114740mr5196408lfg.29.1702661408967;
        Fri, 15 Dec 2023 09:30:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id g8-20020a056512118800b0050bf54b9f18sm2202274lfr.113.2023.12.15.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:30:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v2 0/2] usb: typec: tcpm: Handle Accessory Modes
Date: Fri, 15 Dec 2023 19:30:03 +0200
Message-ID: <20231215173005.313422-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending to be applicable on top of usb-testing, as the AltModes
patchset was picked up.

In addition to Alternative Modes (see [1]), some of the TCPM-backed
boards (e.g. Qualcomm SM8150-HDK) can support USB-C Accessory Modes
(e.g. the Analog Audio). Add bindings and driver support for parsing
this kind of information.

Note, while it might make sense to put accessory-mode-audio and -debug
handling to typec_get_fw_cap(), I decided against it. Several existing
drivers use this function, while providing AccMode caps based on some
internal logic.

[1] https://lore.kernel.org/linux-usb/20231120224919.2293730-1-dmitry.baryshkov@linaro.org/

Changes since v1:

- Initialised the `mode' variable to 0 (Sergei Shtylyov)


Dmitry Baryshkov (2):
  dt-bindings: connector: usb: add accessory mode description
  usb: typec: tcpm: Parse Accessory Mode information

 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                        |  9 +++++++++
 2 files changed, 21 insertions(+)

-- 
2.43.0


