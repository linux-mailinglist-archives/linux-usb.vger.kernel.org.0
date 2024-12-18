Return-Path: <linux-usb+bounces-18631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8B9F6110
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A04188ADF6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9737198A07;
	Wed, 18 Dec 2024 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="QROwKhxg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2D187862;
	Wed, 18 Dec 2024 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512985; cv=none; b=XgzoACZ5U7OmA4piIsyOWNqo5xtg85omNr4jAZOocE8I7bROjHPsUmhznT6aMgVAq2AkA/NSpJc0yTPdRHHH+zgmwBW6pLOSusVz7NgYayFgXcWRf/S3YVgNSmSniaRkyhQuZRGiCUbd55KMd0uePB6lCFUYtQS4X3euAqfCoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512985; c=relaxed/simple;
	bh=m1nH9k1mfGAKPFfwMW45ncE2Y8cDxmK05/T/+o2NdFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIfyld5MWgNY7Mh4GBDxvnizQlS8HfIKQLELaHZXq+TCc7eRnrNWYK8edK8UIJaK9IWUZ1gsDaw4aW5+I2eRfDgKr09tvahFpj2u60wku3jm45n71FoWIXVgCHAmjWk7Ocu2JxxMwKGfoD+Mxp8nq/Fi0k4pkRrue25zyHeF1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=QROwKhxg; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1734512971;
	bh=oSmadU8r0m/jAstE7lBKy2o54FyM5MvoTj7czqiYO4Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QROwKhxgJK7Xz8nedrLMVJlwKeGEVEwIBBWbwm2uXgatamG0XY41DA5t78FYx1cRt
	 RgC8lIOIdpX8d5q3Ga/V9N/ft4zyG1Mh1Ov3XV1D9zI3b/blUuI3/2QHlpETUEvRrD
	 eQJi5NaKo8jBEu5wzNFa0ut+KMVvgj/d/k8z98W0=
X-QQ-mid: bizesmtpip4t1734512924ta12gj3
X-QQ-Originating-IP: dKoav+z8nrulxgB/v6xyTXVff+GrvYyc2HS0hpJYez8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Dec 2024 17:08:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8655085733377736607
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexander.deucher@amd.com,
	gregkh@linuxfoundation.org,
	rodrigo.vivi@intel.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	cug_yangyuancong@hotmail.com,
	lorenzo.bianconi@redhat.com,
	kvalo@codeaurora.org,
	sidhayn@gmail.com,
	lorenzo.bianconi83@gmail.com,
	sgruszka@redhat.com,
	keescook@chromium.org,
	markus.theil@tu-ilmenau.de,
	gustavoars@kernel.org,
	stf_xl@wp.pl,
	romain.perier@gmail.com,
	apais@linux.microsoft.com,
	mrkiko.rs@gmail.com,
	oliver@neukum.org,
	woojung.huh@microchip.com,
	helmut.schaa@googlemail.com,
	mailhol.vincent@wanadoo.fr,
	dokyungs@yonsei.ac.kr,
	deren.wu@mediatek.com,
	daniel@makrotopia.org,
	sujuan.chen@mediatek.com,
	mikhail.v.gavrilov@gmail.com,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	leitao@debian.org,
	dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org,
	horms@kernel.org,
	andrew@lunn.ch,
	leit@fb.com,
	wang.zhao@mediatek.com,
	chui-hao.chiu@mediatek.com,
	lynxis@fe80.eu,
	mingyen.hsieh@mediatek.com,
	yn.chen@mediatek.com,
	quan.zhou@mediatek.com,
	dzm91@hust.edu.cn,
	gch981213@gmail.com,
	git@qrsnap.io,
	jiefeng_li@hust.edu.cn,
	nelson.yu@mediatek.com,
	rong.yan@mediatek.com,
	Bo.Jiao@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Wed, 18 Dec 2024 17:08:33 +0800
Message-ID: <1E6ABDEA91ADAB1A+20241218090833.140045-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OI/LFjtEDwi4Vo0vNIAyQokbaIb0AkSbUOmPxF0xFYmWicvIAmxpr/T4
	FY4/ck+n6512RRdD8C9siBnVw0TEg8+/VxRm6dD1A0gM+g1IeP1HIhQbtxJaqGBK5xNd1Mo
	m10b9VlNQu3TpzWK+MIW7xq6EdFSkDr60JHZz/ER1DPMZ0U0ighcZG6y3BrCmpYPYZP3Xx+
	V6gwdXFTlf7ZPfpYq0XfCdV0NUPZtjL6oPQeV+C/+MA73CA9jPpsVIFyym3P6aZ/lAsjxVB
	jDJ035YewjubEbnckzngM/MzMrjM9+V9WmOxrn8l285IO6oLc2AHBG623OpKz0p9eJXwtZX
	Dh5WQEfoddqfGCtdvaZhsZ+j0uV+O358O3yQKANfwj0rKZWrJ9fzFMgMi8unopJIEbmY4MH
	brNNg8xmgIxMqSB2tbmTCFIe+/JKZ3XT1vPv2q20M452wx38wg0N0ofa9QoMDtDHQVOeFFA
	uTJlsK8ePDyS/okZcOlfKx0ag/fqq6i3rpxebywdaL99rxtN3x08eIBHF3pcwOdlZ/0LgTS
	E2T5wrO1J8iOKuGvCesOO5Cg66nEbLB3X/xhM8MZ9HYRyLonMHlX7p+TBcE2J18eE+enr1X
	JZvtJInrqdgtXHCED5Khg4GenSkjfOalvKkHm7d+J8x6bTn1cGTEXBhV3IerSY7HE+Lj4mh
	tF+bSY159nFLc2P6gTsRp3LSQW4b7SH89aucP9gns3l1dkNG5VR13l03lLYHpzm3PEVd+Yz
	9/IQGLZbIDX3E1qpWx/65ouuiSr/E9ikL5wDttIU0Ms7rJoFtash1KNkFsvQu6Gk1c/Vv1B
	7SzAWhvToV3De310vPr5rIQWSKZNs5dDoKnw0/AXoDt8o+0RcCKOf7DeLwDtRtCBhPz6kzs
	tWazD3PxvTKzegvjo90hiWdtazBDLCChU4Sj/H8PhcUoPZIwa/2M0kAXyfMA3vR9Jl3oyhX
	hVitXUT+bJBpxomDH1zbd6oG8aGi9X/k/R3UXVFVYOm5U4w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

When initializing the network card, unplugging the device will
trigger an -EPROTO error, resulting in a flood of error messages
being printed frantically.

Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 58ff06823389..f9e67b8c3b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -33,9 +33,9 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 
 		ret = usb_control_msg(udev, pipe, req, req_type, val,
 				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
-		if (ret == -ENODEV)
+		if (ret == -ENODEV || ret == -EPROTO)
 			set_bit(MT76_REMOVED, &dev->phy.state);
-		if (ret >= 0 || ret == -ENODEV)
+		if (ret >= 0 || ret == -ENODEV || ret == -EPROTO)
 			return ret;
 		usleep_range(5000, 10000);
 	}
-- 
2.45.2


