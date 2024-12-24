Return-Path: <linux-usb+bounces-18773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D29FBAC9
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 09:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4F5816587E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FDA192B69;
	Tue, 24 Dec 2024 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HMz6jI+6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F001A8F7A;
	Tue, 24 Dec 2024 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030435; cv=none; b=I2g9BT7rUlWErLh0nZvbIx6m/HhzJXxFHwGYdDDoD7+YL0ShCmfEePHbXhL+hRdXhrLr5E1qMgfoX34Elx1CsPtbYRXxho66JzJPR3kEQv+7Yb+cfDLK5U2tE37t7y6SGyImUfPU6zTPUpQ7XaSmSkIcZRgs6qM6hL21lAtulRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030435; c=relaxed/simple;
	bh=90+x2RjiN0d1WTwTmBN4pZjkDM0LElpAVBWh3nmtQAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R1yWR2cGbq+nEbiC8VeC/zD66zG7EEiBVoLJdiOP9jNaQHY4IKEDi8Wkbhi1+oQbcETtbTKvDHyiX4Rz32eX8DbVR0Ls0BK+rjNjSM3pOnYt3CWmw5kKzBZgVHREpRT6gjW6B+/ZAFMQd9HAit7zcqz+QNuIwVnez6cOD+6xdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HMz6jI+6; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1735030420;
	bh=hlFS13odVb55GccO5hmoQYgmewqIs0Q10x0eG5VUCq8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HMz6jI+68USinBDRehCevynXCNOCOTX080YUQtq6Cc62PJ2xzXaiiZbhXGuwf3b+R
	 /Au6Y4iUF1ezFMnQZtca0rsw9PfN81w4EOu8jskmJ6BhUTgPhqddUx9uzPgDzm38J2
	 L+oSFez+j5ZuE/t1q54R6rOfQWPucDwfJbwrVFrk=
X-QQ-mid: bizesmtpip3t1735030374tjbdwos
X-QQ-Originating-IP: +Rx9ITqM/H7d062Vb3FxXVe37HRvYxsU2EFSjD4Gbak=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Dec 2024 16:52:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11559618080003878219
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
Subject: [PATCH] wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Tue, 24 Dec 2024 16:52:44 +0800
Message-ID: <BA065B146422EE5B+20241224085244.629015-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OLiMdF5B5RXDJytSIdNkLPg4VLy/8JjsIsAyXULI5rSTjbEuJ6qkmpmf
	Y2102JG3kABXjhPzV0koXwIIuptHcL/qXEKhhz8W78vuzfV0LPT7WP/6TlSqk4bzyoDIl0W
	2n5YnOMSMWtCU9BOJGPPYwwPhkuMp1+kwfGbLn47qKpph1tNfqsidlB59ETvbCTBPPfXv9V
	egTGqEmc/MD0wdlUwR4Dsqel3VME/PE65veBrpncrboHzNweZPdo1qBsRRvfwElxUdXLxul
	oSF9x6Rf/F1O/KTJjmi+NYaQDCnnfpsK7hop1iMbR5waB2uCv1AT4qJyQ9KcLN24SUjJfS7
	p0PzjTdjFzmT61iPanwikCHrRIT3mhIG+3PbHM5HV/EsQMGA346/L9LBo1IzbpJiTFEG9gh
	Eb3dRmf9Mq7tEkQ99HSjiR4MfPzkKqHWHSNA7Q5ZwGE9uNfryvdlKM7tXL1PKbX//Pkghuv
	X82L59tDKWWyAwbOKr+UC8cY/bWv8kb+qs02B8D7js0XlVUrt9fO9ZnPSiHXl1xAlZthWjI
	aoRSFg3rLJHXCO8xzSBmqwsKxo174O5I5GGfyad8+MgWVe4ovQrayGXYKtkSWkRM+A5Z7xb
	Oqm5wWo7X/z+tawdVdG3b7UaKzqrf95GL2PevMC44Di3ih00YxRw1r99dx4x5ClC684AAQY
	9F7RKp/DiQc4e2qhp0YYTJcXxsYYFVPdyrmipR+ETqbbh/cfy47UZf2FXrKD5qTlmBZShJS
	pSJxxvF5+4hEnw2Puxm+criKg2IUTx0vrLiv23OtwGmwrldwwH2zjOBxHKwH3No6rvaWb4G
	Gmpbx5Bx5uZQc4BskUFYp9Ia+xLlrj0+jbhN1mktzcTzDL/AeITYedCmJdjE8z0bRmF9kNV
	kKaN/5wv5cdxTg0wRhIQvanfEr6RHI9lDY8ulQf/Zo+RIiYulKOa2NlKi+Dls4+cKJu1v5B
	DQOXpXI6Y+JXGYmYIML8OOF0CcXkCMhgIAQwFdDxX7rdM4y8DR6GjwfVuHxDtQdmyAlM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

When initializing the network card, unplugging the device will
trigger an -EPROTO error, resulting in a flood of error messages
being printed frantically.

The exception is printed as follows：

         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         ...

It will continue to print more than 2000 times for about 5 minutes,
causing the usb device to be unable to be disconnected. During this
period, the usb port cannot recognize the new device because the old
device has not disconnected.

There may be other operating methods that cause -EPROTO, but -EPROTO is
a low-level hardware error. It is unwise to repeat vendor requests
expecting to read correct data. It is a better choice to treat -EPROTO
and -ENODEV the same way。

Similar to commit 9b0f100c1970 ("mt76: usb: process URBs with status
EPROTO properly") do no schedule rx_worker for urb marked with status
set  -EPROTO. I also reproduced this situation when plugging and
unplugging the device, and this patch is effective.

Just do not vendor request again for urb marked with status set -EPROTO.

Link: https://lore.kernel.org/all/531681bd-30f5-4a70-a156-bf8754b8e072@intel.com/
Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
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


