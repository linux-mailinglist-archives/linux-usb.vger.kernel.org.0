Return-Path: <linux-usb+bounces-1596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCBD7C87C4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 16:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51B351C20F14
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B1F1A724;
	Fri, 13 Oct 2023 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2+hII2Ff"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4818E38
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 14:25:06 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D1EBF
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo3638350a12.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697207102; x=1697811902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVIXIq/Rm+SyJ1K4MPb2o9/YrrlOkItMvHUn3gP+p+M=;
        b=2+hII2Ff7yQE1F+kHz7eaq+T9rEv+0RPXVQQ2GIZ8DFwPX4Ja3L1ypr6A0L7pVsJ1A
         SXICGxIdinIlXXiH7lMP2tK7iN+l7W8rQ683YTEMwrhvhnG58HecBgymRiSDAjCloQL5
         Uz/d+RhHk6JwLJNL2g+1PRqFr4qMVf/XDFhV+Z86L1N00vRsF15ptHJqphODandPRP2o
         YBcltQXbzIQ7ePPYAzKhGHQO7zU4S/Q5g1PKj+Pb5xucAMUHbhDIc1atA2FqN9ianUD5
         yL0YsVwPeob4MPnptj2t1QmcBS/uWOLFmJSEpg0xi3LG0TWyyvyZC2Fnel278L9RmlTI
         6kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207102; x=1697811902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVIXIq/Rm+SyJ1K4MPb2o9/YrrlOkItMvHUn3gP+p+M=;
        b=H0/x+YjDzIOMj8P54fwBPAkiLdTS/0mbgD+BCyINhhBdnvP9PuvgAlNvyOWEff7Epz
         /BHYUYPz5LmNKD87YwHrEUQ5KVR8ylTM2fmrHheUj3oSxvzFQIiu1/NKgWwK2nUFwa8Z
         abqBhBIhSpu423/xnGWx6LO91GzoodQ0ptm5qLF8rl6+ORWUDlnkElmZoYAEjptwGML9
         RtOAnyn5dJA4PAbK0SmodThuU0h9djOM2CDq8gYqzyuQGuFVq2YpftJHZGEEsq7RrA6Z
         tfYgeAHp63SS0mM5dlWZSkvx5bZccmZGhTCwdj4Nul1jB57n1kptj88lShua3PBzVX5Q
         HHTw==
X-Gm-Message-State: AOJu0Yz0AWvhGtDFgJ2Ek9/AUF0Ri3gVYAb1FwKrDySOTD2qAf01feyc
	tW92FVhK5Y3mVFftxbJ9hALxcw==
X-Google-Smtp-Source: AGHT+IGrkNfOBCtYpSIX9yoAdhv7XuR3zDtIfuz0Sker1ZEbl3nGD0kbwEPQAYtFdaX1mSAyG0KxZg==
X-Received: by 2002:a17:907:2e19:b0:9b2:c2a9:357a with SMTP id ig25-20020a1709072e1900b009b2c2a9357amr23293471ejc.68.1697207102578;
        Fri, 13 Oct 2023 07:25:02 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ot21-20020a170906ccd500b0099df2ddfc37sm12412041ejb.165.2023.10.13.07.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:25:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add driver for NXP PTN36502 Type-C redriver
Date: Fri, 13 Oct 2023 16:24:46 +0200
Message-Id: <20231013-ptn36502-v1-0-98109a430efc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5TKWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3YKSPGMzUwMjXdNEC/NUUwPzFGOzZCWg8oKi1LTMCrBR0bG1tQA
 UkoV5WgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The NXP PTN36502 is used in the Fairphone 5 smartphone, add a driver for
it so we can soon enable DisplayPort over USB-C on this phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: usb: add NXP PTN36502 Type-C redriver bindings
      usb: typec: add support for PTN36502 redriver

 .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  94 +++++
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ptn36502.c                   | 421 +++++++++++++++++++++
 4 files changed, 526 insertions(+)
---
base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
change-id: 20231013-ptn36502-5a87e507d36c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


