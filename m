Return-Path: <linux-usb+bounces-926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4367B5337
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 43B231C2098C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA5C18E00;
	Mon,  2 Oct 2023 12:29:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6D18025
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 12:29:20 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA61FD8
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 05:29:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31f71b25a99so16397320f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696249755; x=1696854555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTJqVBoOgLxU8zj+PMnKpZEI8SgRr76FsWuJmkP+inE=;
        b=b2VPz+shcLvZudZI8QobsNHgb6qOWj52cycG3QPRipuvqqDSu3Kqtw9lX7bILuDQ87
         QMUoYRoOF2Ag3HZRxdpuk/g3BMq4uzyFxg0mkARllB5VUKHfF+jMv5ckgkwUSgkxVdTD
         XRxgbU9pu8ReZIYLQfHiiZdj/IE9k288a8dicWmUVrpoGNRfPYVOm9qkAVAOn9O2sEe7
         626TTlAP3oIC5w5GEJP5z3b0r+mM8QINTelUfHz3xvbL/1SYeCdUg0x1M5BSGqONqJqb
         zfn39ogNReXv4zmK+/iekfVaHtHou+63H0FGRoRUa7XlI7O4ZVhRdR4YsACazO/jtfgj
         47NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696249755; x=1696854555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTJqVBoOgLxU8zj+PMnKpZEI8SgRr76FsWuJmkP+inE=;
        b=NnPqtxVKrRtfG9sStv+srHBk0zAYi3hmvsfv/P1ns+OOhEE5ZrTGonE9TJ66F/+Y4r
         c0MlCKtRLw3yG4/kMtJRVRBfipmazYYSPWYEM3FZ5rl+pEYUoUigvh3rhKpZYSQEf/cg
         1+ypDRdYhDq6+/R26NgF+6dbKh7eJneO/wBGLB1XbP0sG1QM3V9dxdL3ro+oKKuFgj1H
         EA47BSpbFvH1D/Nw3SwTsGdb9ShEcelqF9rPbEXz1wJYt+sRKB6RMeX3SU9ndA46fPHb
         bY1ORCXh1z/rGuSQriCL5TLDgKQpGSfm6bUnfCV3rPAaHbeCry2zb3GQ03lNJQaR9f82
         l6ZQ==
X-Gm-Message-State: AOJu0YxlBO4/KzdNV1kU3GDS/RcnCnW41RenpWA9Ax+Hs+sJs0chQ+Nm
	qMiacmA91Ppul2qms56y10bHIA==
X-Google-Smtp-Source: AGHT+IFRHHZHyI7q31hR72m2ZJJLYi9dW2DnTOfh6M0zxWL5XbDOqS+zPZ63hr6D6g2MpN9MwxCxSQ==
X-Received: by 2002:a5d:60cd:0:b0:320:38:9e14 with SMTP id x13-20020a5d60cd000000b0032000389e14mr10225432wrt.7.1696249755020;
        Mon, 02 Oct 2023 05:29:15 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fcf2:65f1:853c:13be])
        by smtp.googlemail.com with ESMTPSA id s16-20020a05600c045000b0040536dcec17sm7144819wmb.27.2023.10.02.05.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:29:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/2] usb: misc: onboard_usb_hub: add gl3510 support
Date: Mon,  2 Oct 2023 14:29:07 +0200
Message-Id: <20231002122909.2338049-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patchset adds the bindings and driver support to trigger the reset
pin of the Genesys Logic gl3510 usb hub.

Changes since v1: [0]
 - fix typo, replacing '.' with ',' in the bindings
 - use existing gl852g data structure

[0]: https://lore.kernel.org/all/20230808100746.391365-1-jbrunet@baylibre.com/

Jerome Brunet (2):
  dt-bindings: usb: add device for Genesys Logic hub gl3510
  usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 3 ++-
 drivers/usb/misc/onboard_usb_hub.h                        | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.40.1


