Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C572B4900
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 16:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbgKPPTZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 10:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgKPPTZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 10:19:25 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0952EC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:25 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id j31so13051676qtb.8
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWtERLXExs4DoM6gWGaTUFy6iPC/nCVkimSM+qIDVKM=;
        b=UHuHKb1wyzJgScpQpTHI+khKWYoA0r+5oV4I4cL+EXw762BNPY6IkiLTLnw7WI6vXX
         XFRXGWlHjy3L/v6/t8qZGt/ACYNMjAXyVJXA2jP1QltuyhGKVzJe0xsM52OpnSRgzh5e
         azZNUKR0ppmLCIEr61/CjjMSwazJcDSjYNBkTOmfSgp2yZawPeHX/Ie0w2k8yY1yzUSs
         Rqnu/m/uLC4WLFZsjftlmMaMdRJfPoAlIKQs+yVyyzuhJXhfR755gLQ5h4VoNQDy/A4Z
         SGQwkxLqM6Jd5yX5mXQvG+QFggL6XzgC12DqJ2XMhvykSOYVz8KjgQ3lbpi2orB/fACo
         ztfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWtERLXExs4DoM6gWGaTUFy6iPC/nCVkimSM+qIDVKM=;
        b=jVfSH11RcYgJqPq8vEePmipCMEw6XAjZh2UEll9a4l3gQj0SrVfPouZZHj2Y0sOMGi
         zvGjehppQ/7zadLgQw9T8NJxQukIytEIOhAy9VjY2Ge48haUreW+13U3OkM8VF8o3+Hm
         DHLZhgtWZsxG5/HUJvi2/Yj6ZhsKsbaU/kHq5AQgzpgVvJiqnolpV+p4cxM3mD3uLLNT
         wyCD47ohpQ1vlSIcMbyDL8bb9Ow1C1m2AxkuOyNvV7Zgs5ckG5HP6/KVzxuq1Imbtdz5
         DyvV6doUBBLbN5haRAh2oflTV+1FcO08uR/e5QvrVqdV6uV37A4Kg4QPJ9z6gWKTBLTS
         r74g==
X-Gm-Message-State: AOAM5307fZax6BVozMIvJM6dKjd3Y8OCLqOE2Znk69mQ8Bco/vDan5ZP
        wBH34vRK0+mwfu0ABl5deQE=
X-Google-Smtp-Source: ABdhPJwYnI/O7MjyagGSH+7FQMKnfE01e57JG2POD/MrOpJLlI2if5o0NkVRHFEUiDoG5h7TqaOQmg==
X-Received: by 2002:aed:3263:: with SMTP id y90mr14509217qtd.196.1605539964181;
        Mon, 16 Nov 2020 07:19:24 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:19:23 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wulf@rock-chips.com,
        frank.wang@rock-chips.com, william.wu@rock-chips.com,
        zyw@rock-chips.com, kever.yang@rock-chips.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: enable usb3 on rk3328-roc-cc board
Date:   Mon, 16 Nov 2020 15:17:36 +0000
Message-Id: <20201116151735.178737-5-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
References: <20201116151735.178737-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable the usb3 controller and usb3 phy nodes on the rk3328-roc-cc board file.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index b70ffb1c6a63..b060323830af 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -345,6 +345,27 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usbdrd3 {
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.25.1

