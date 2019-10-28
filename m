Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18795E7853
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 19:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404371AbfJ1SX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 14:23:27 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39250 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404359AbfJ1SX1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 14:23:27 -0400
Received: by mail-qk1-f196.google.com with SMTP id 15so9396927qkh.6
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/i6iib0QOySXmB9hMOchk2gqiCio9IrBQ0i7JtpvQ8=;
        b=glavdkw8cp4fn74iXdJZa7mzXJqdYB1oftGYI/YZPz1jGY0UV041SWlEIXGUV1/q+X
         30QerC4L/9veoteKetM98kE2nSDT2iNTHXXBUS3WzeHmVpEPow53RBYx/uglPeax9Tio
         ZuHLIP4U90fPzoeWafzxK7hFF/tTisc2Mfd5fz4YI91qlBozpdSQPQVm9+QtAnRNuM+3
         wXxETtJJCA43x1eDjVN1K0zrPtXA9F59ok4lV+BKCL8cQGx032AgMJBNE+Bhf6jWIAGN
         GUqM5ny2WjkUrr4JacM1+a1scp9EADl678RwqlTbccPNgHGMi9+bA5aHCB+VMqjwqSKC
         apaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/i6iib0QOySXmB9hMOchk2gqiCio9IrBQ0i7JtpvQ8=;
        b=mpMvg2dWJmf8XZBRIwr1C9CdpjsRsbOYBa+H3TyUlRLUVNZ7pkm9/3F82QNMiL8nT6
         xieX0AoFwxf8zlQiROPkKi2Nn8wQXf2k/ii3oB9WCFhjhphkm5VVPz/vPqgrlKGnUTpM
         YL8Q6QR6wo1JjcuVY01u40MOJa5aBCDv47AuYRhyLjGIAB257JULvVHir0d/dGWU3LQ2
         UewmzkzCzC1HymixvGHoQ3SF58mFwqPu5PBXtfAqI4bBSoP7gib2iMQ0IZ0WRzOe9bcO
         YGj82CQjZG/3N7LiU6tte377lIVJEdF7wb37E/c8LcGxkaA4rUbtvlFGElNph7SdDA0A
         rPWg==
X-Gm-Message-State: APjAAAU+wGP5ICf1pBNDsm+7YL9cfKGvvT47MEDr43P+WQGtFI9OB1pL
        2344U6v5LRTOckcOXLs8RuA=
X-Google-Smtp-Source: APXvYqxj9YsGeXLUuF/3NgVDL62I80DKTBCWKY3BsPDvmifn2t3iMdDCubfZHSH7GyVsSq3rLrPWIA==
X-Received: by 2002:a37:78f:: with SMTP id 137mr16724495qkh.321.1572287006005;
        Mon, 28 Oct 2019 11:23:26 -0700 (PDT)
Received: from firefly.sparksnet ([2601:153:900:a52:6f12:874c:d2b2:a9d0])
        by smtp.gmail.com with ESMTPSA id x9sm5808631qkl.75.2019.10.28.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 11:23:24 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     heiko@sntech.de
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 5/5] arm64: dts: rockchip: enable usb3 on rk3328-roc-cc
Date:   Mon, 28 Oct 2019 18:22:54 +0000
Message-Id: <20191028182254.30739-6-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028182254.30739-1-pgwipeout@gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable the usb3 controller and phy on the rk3328-roc-cc device tree.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index bb40c163b05d..f300f3d0f02e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -328,6 +328,18 @@
 	status = "okay";
 };
 
+&u3phy {
+	status = "okay";
+};
+
+&u3phy_utmi {
+	status = "okay";
+};
+
+&u3phy_pipe {
+	status = "okay";
+};
+
 &uart2 {
 	status = "okay";
 };
@@ -344,6 +356,15 @@
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
 &vop {
 	status = "okay";
 };
-- 
2.20.1

