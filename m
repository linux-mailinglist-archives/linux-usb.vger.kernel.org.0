Return-Path: <linux-usb+bounces-1986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FF7D1210
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199501C20A50
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 15:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5151DA51;
	Fri, 20 Oct 2023 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f4aNpQIa"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7BB1DA2D;
	Fri, 20 Oct 2023 15:00:29 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA31FD5D;
	Fri, 20 Oct 2023 08:00:27 -0700 (PDT)
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64C32660737B;
	Fri, 20 Oct 2023 16:00:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697814026;
	bh=K+0lTyZ8qgIAV5y3w5nBjySn4RnIUfEpHKakMzY0RXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4aNpQIay1c/DlzV39XL7teswYsy+XOUcc6z2UhE9Z5b9Mmh9Jcaahk5ZEY1Snm4R
	 TF2F0t8cjWTU+QdC0g/fGt+UOp4yDhKsLds9ntXcqJjCvSD31qyiuokFEtIT0CIoxj
	 CnHuFvYferPRoOLD8r6kuIEpl+QWX6jpgHAin9kALEvQkEYcS7xfQZ/J/iN49v301f
	 sjabKyb+/fzyqAaMpKyzfM50Ihv51fes7Dgrd1ZrLqYLTXK+yJPB5J8upWLkaPYRwK
	 QQTNh5UMVo53kvxJUzCq9x5GLudUr5uTX8vBfWwNe5Ea6CLkVuy5qqby9+D2Q4g+fX
	 D7yJwz8RtA4CA==
Received: by jupiter.universe (Postfix, from userid 1000)
	id 087F2480104; Fri, 20 Oct 2023 17:00:24 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v4 2/3] usb: dwc3: add optional PHY interface clocks
Date: Fri, 20 Oct 2023 16:11:41 +0200
Message-ID: <20231020150022.48725-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020150022.48725-1-sebastian.reichel@collabora.com>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Rockchip RK3588 one of the DWC3 cores is integrated weirdly and
requires two extra clocks to be enabled. Without these extra clocks
hot-plugging USB devices is broken.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 343d2570189f..639b768c3386 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -854,8 +854,20 @@ static int dwc3_clk_enable(struct dwc3 *dwc)
 	if (ret)
 		goto disable_ref_clk;
 
+	ret = clk_prepare_enable(dwc->utmi_clk);
+	if (ret)
+		goto disable_susp_clk;
+
+	ret = clk_prepare_enable(dwc->pipe_clk);
+	if (ret)
+		goto disable_utmi_clk;
+
 	return 0;
 
+disable_utmi_clk:
+	clk_disable_unprepare(dwc->utmi_clk);
+disable_susp_clk:
+	clk_disable_unprepare(dwc->susp_clk);
 disable_ref_clk:
 	clk_disable_unprepare(dwc->ref_clk);
 disable_bus_clk:
@@ -865,6 +877,8 @@ static int dwc3_clk_enable(struct dwc3 *dwc)
 
 static void dwc3_clk_disable(struct dwc3 *dwc)
 {
+	clk_disable_unprepare(dwc->pipe_clk);
+	clk_disable_unprepare(dwc->utmi_clk);
 	clk_disable_unprepare(dwc->susp_clk);
 	clk_disable_unprepare(dwc->ref_clk);
 	clk_disable_unprepare(dwc->bus_clk);
@@ -1785,6 +1799,20 @@ static int dwc3_get_clocks(struct dwc3 *dwc)
 		}
 	}
 
+	/* specific to Rockchip RK3588 */
+	dwc->utmi_clk = devm_clk_get_optional(dev, "utmi");
+	if (IS_ERR(dwc->utmi_clk)) {
+		return dev_err_probe(dev, PTR_ERR(dwc->utmi_clk),
+				"could not get utmi clock\n");
+	}
+
+	/* specific to Rockchip RK3588 */
+	dwc->pipe_clk = devm_clk_get_optional(dev, "pipe");
+	if (IS_ERR(dwc->pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(dwc->pipe_clk),
+				"could not get pipe clock\n");
+	}
+
 	return 0;
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a69ac67d89fe..f5e6ae6e394e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -991,6 +991,8 @@ struct dwc3_scratchpad_array {
  * @bus_clk: clock for accessing the registers
  * @ref_clk: reference clock
  * @susp_clk: clock used when the SS phy is in low power (S3) state
+ * @utmi_clk: clock used for USB2 PHY communication
+ * @pipe_clk: clock used for USB3 PHY communication
  * @reset: reset control
  * @regs: base address for our registers
  * @regs_size: address space size
@@ -1156,6 +1158,8 @@ struct dwc3 {
 	struct clk		*bus_clk;
 	struct clk		*ref_clk;
 	struct clk		*susp_clk;
+	struct clk		*utmi_clk;
+	struct clk		*pipe_clk;
 
 	struct reset_control	*reset;
 
-- 
2.42.0


