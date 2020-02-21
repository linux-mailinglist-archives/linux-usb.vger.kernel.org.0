Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D8316791E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 10:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgBUJPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 04:15:43 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39075 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgBUJPm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 04:15:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so1111921wrt.6
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2020 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=lK15oznkmE7fuECcUv45VNqmPJJHug5zq8zfFtk6asoOdoXNE8Ncepmk6uu778oaRb
         Wb5ADtEcDnQ1EoHLqd9x0hDO5Zfon8zRMFSAH3D55szfBAnIoMh5/8gqJqjERYn6z7CK
         XrtoYQCsOXL16av6t6Mdss1v/p6VCWn4Sx5PtMWtn8PmEsqzJvgSfDSeNd8wJcTim5y+
         YpDWz//queWKkrXbRBzoOqidSN8hslbIgUtrEFT74IISO51Y4qL45svbFHnAqa3Fmpkb
         400SJQUNjWCrbsCZsGX26tBkAiu5lPFKsnhs1hlVXw93LQvck3x54xy2xbRGbD0DX3b2
         X44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=mUS4f/L7f7xV+WMd2BpRCsx3BSzpmKe1VoYo2L1JhETcNHdL+Zm1O/NRGkhbAAP5do
         vSAzBy0q1DdpXvI1xYPP4EnHazjJfC/fn/0NVmDUNBUDT78NtlXY2UEImraNKcdMoSqi
         +695G7X75ZEiZkt9tq16BFoFLDLASEhi2FIeo59RQoBqvM6kKdkDmj2G8w7vtoSI9ERr
         uTxt1z82U4PW+16FWFlB2rMbppPQ/UIExAT9T3t5t0NXn6AhjNbfzXdmi34OhSLf54M9
         /laCjhdM4J3OpPos6olkrABgmKMKBR+j6KvBmhijY5TPAIAjUQLzjqUpfdGlnPOoMFwg
         n35Q==
X-Gm-Message-State: APjAAAXD84aH9u2n2+vxYjoyX1ciEJMZ5bWq7bxMeDDLHtrG4vJoYe+Y
        r0LiswLlK88yfGb/rhApUK7yhw==
X-Google-Smtp-Source: APXvYqw1IrIayRzEm5+L4hNTMttvykUESXzbqguy+LbKUkETLLIIENqD5GsBuIotlJYN9+0XYuZ30g==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr47715116wra.339.1582276539064;
        Fri, 21 Feb 2020 01:15:39 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id o15sm3257837wra.83.2020.02.21.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 01:15:38 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Jun Li <lijun.kernel@gmail.com>, Tim <elatllat@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
Date:   Fri, 21 Feb 2020 10:15:30 +0100
Message-Id: <20200221091532.8142-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221091532.8142-1-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCI
instances in park mode.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
-- 
2.22.0

