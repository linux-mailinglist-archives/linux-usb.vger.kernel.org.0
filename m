Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DCF1C9DC9
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 23:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgEGVrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 17:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEGVrA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 17:47:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83168C05BD09
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 14:47:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so8221549wra.7
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E+C63PimI3JUh9oJtf9mMQhTZR3e2TIZWCw6qNFtEm4=;
        b=EIBGvpEzSRV6kLrrN5jXNHuAm4InASPlo4/PMeIqszqgOzKGA+q0EpQRV3vZgiBXhd
         IAMvnrAEd702l5gw2ZHSLKScYv3QE5JDlBcW9WXY2KaYLJzQzLzL6ILttVWACKSdcROI
         jiahub6wyuX9PeV5oZR70DHaYBSo1LhQfMPiYDj5uG6lLo65a1oOaQUK7h8TNYqk0GU0
         EB+rFNMvwHp0E2ye19dUYI5sBjnesozxyR/hDY6pN9gW941adEKxvrHxAWf1x/ptDgAl
         sOxdjSojYLNDC3zgPQcexCLX8HigSJn2oN87FpNxOt62WncFzcA08q8gBV+FNwu6Jxnh
         RzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E+C63PimI3JUh9oJtf9mMQhTZR3e2TIZWCw6qNFtEm4=;
        b=SO6EkzEyhRMph2sdoMflyEWnBW18k8UFPjz/zHqBlerRO6ZhdT+IK83+BqM7CgOVom
         CB7qIaFCCrIpMpDYSu9rPteGJTUqHABPW6MRYNKvmbmhSZvkUF5sDAy48Jbt+czMADef
         Tuu/YdgAMdNUw8Mzl6RUpxt2FHaxH3965Qbl7C60+v1BBgoWCl+hq4hsPW6lxomv30jK
         z3fwR004ztGy4sW+qT56yFPmHB3ILjSS+HpBKG6JkTh1x1DjvbVHsGERH1fnatGlSwX3
         1062GIn0j4lixer45J52Kq6vaYMAm38rMIeuLTvj0Ig0LGQXmyxcb5FtCJpDbsiwgMxS
         tjXQ==
X-Gm-Message-State: AGi0PuajqGf4JxQXznkH4pHM0yENo5tc23WP6ZrPlKMj7T7VZlyb7yot
        Xzhg5V/WHsxHkCE9tdh/lcuNww==
X-Google-Smtp-Source: APiQypIQlk8OWoNsZGmK853V9zuLgRfr+WJECJnW1/wmFrBc/OLs07Ry55dIcFicAVwipzEYfVM6kg==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr19460582wru.219.1588888019214;
        Thu, 07 May 2020 14:46:59 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a10sm6653538wrp.0.2020.05.07.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:46:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] Add TI tps6598x DT binding and probe
Date:   Thu,  7 May 2020 22:47:31 +0100
Message-Id: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2:
- Put myself down as sole schema maintainer as suggested - Andy
- Fixed whitespace typo - Andy
- Removed ifdef and of_match_ptr() - Andy

V1:
This simple series adds DT binding yaml and a DT lookup table for the
tps6598x.

Its possible to use i2c id_table to match the 'compatible = "ti,tps6598x"
and probe that way, however I think it is worthwhile adding a specific OF
way of doing it and having an accompanying yaml as an example.

Bryan O'Donoghue (2):
  dt-bindings: usb: Add TI tps6598x device tree binding documentation
  usb: typec: tps6598x: Add OF probe binding

 .../devicetree/bindings/usb/ti,tps6598x.yaml  | 64 +++++++++++++++++++
 drivers/usb/typec/tps6598x.c                  |  7 ++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml

-- 
2.25.1

