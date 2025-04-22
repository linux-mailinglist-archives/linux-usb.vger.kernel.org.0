Return-Path: <linux-usb+bounces-23309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEDA974F4
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 20:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D60D166A65
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EF81EC014;
	Tue, 22 Apr 2025 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="b9r5XRzv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74328F952
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348202; cv=none; b=GmKG/wkOh3iFyZ6sZXKUs+Kd454CKH9rFg+bqAK9aLK7jWm/hjZ8zdLbVp0QTIl7QGE//5/3JbyCUv74oFb/Zj8pKS8oyzz4U5OstrIPDV6eG7djEh8nlUrGEqVnKmzlqYH+Ked5upO4YKSeyHM1k84QcX/tGKfQC5c3DBrdTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348202; c=relaxed/simple;
	bh=GAd7FiG72WxodVBQLrl0g4R227Hk7NYtP6+jDoQt7x4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QSDp17oT2pBIr/6HVusZll/HpOAhYLRFOo17gz1jrhqtiisoWa6YFXUHTE0NenOjjVVAnCw9K0kEhLfVh3neaROXsM9b8umyRfQOa+7YIY6DkHfe53+qlKAMqW2CnnhxdRZ2RMkcRtXlnsGli6ueB89vEz9tAVWqa1KvJrORT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=b9r5XRzv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1745348180; x=1745952980; i=wahrenst@gmx.net;
	bh=BSHmHAHN3tMsHkmRifmnPDZ6fAgWgKwXH3Idxud7rO4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b9r5XRzv7PQ3qZqg4vaghewDI/e5HAtjYZPXqUGezuDvwx/voF6AXaeu/I7FSRqy
	 qEqoW95A8Ild9EDexakd1RRzqQn5ojA3atu10PWfIiGmMlp6+h5EAaVaiWOONthEd
	 2u2pO4zqQaEX0+56JdOdWVOl5JkjI2bFSA4GU5bMC2Jlq/KAvpGS5MP6A681gtlQh
	 VFMoHv9PJPNB62TmuqjZ7EvsbsI3CCViPJEJjSI7DMRg9vWqGoK9HXeCaKrYgY6g+
	 q+ccxkBOrNjznwGYn8RO2RrS+5fd0khAtW2nmdwl5ozma+x3AVOv/vdUM9ICGVi+n
	 ZDRgcFC71AmX7MW5Gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1uXb5I1daK-00WIPV; Tue, 22
 Apr 2025 20:56:20 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>,
	stable@kernel.org
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: Fix NPD of usbmisc_data
Date: Tue, 22 Apr 2025 20:56:01 +0200
Message-Id: <20250422185601.80199-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pf84tJ/m1lp7UmygA+WLhUS0WfyHGGUXL4xeTM1k1Mn3H7JxdqW
 aaaD2WMryXgoPK1BN6ZE2SYiLqSKhRNT0xYejYfOJ+3eC0PpHYznunu5Og0lOa5/I7u7JLS
 1Uw5giCWUivRzA63WF0gW+AcnXc55CYqgyUkmcW6uGodjk8vzOGzXkuUylXkjwksYhTPF9Q
 gnAhnTASFLs//rmOJb3wA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QRqP7DSt7/k=;msQ4u+5Rk55PN/JHwBq+LRj9dyc
 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
 T2LUg2KMEfx5ZWxDPihjYY=

The commit 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's
refcount in .remove() and in the error path of .probe()") introduced
a NULL pointer dereference on platforms which have no usbmisc_data
(e.g. i.MX28). So add the missing checks in .probe() and .remove().

Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's refco=
unt in .remove() and in the error path of .probe()")
Cc: <stable@kernel.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_=
hdrc_imx.c
index 1a7fc638213e..619779eef333 100644
=2D-- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -534,7 +534,8 @@ static int ci_hdrc_imx_probe(struct platform_device *p=
dev)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 	data->ci_pdev =3D NULL;
 err_put:
-	put_device(data->usbmisc_data->dev);
+	if (data->usbmisc_data)
+		put_device(data->usbmisc_data->dev);
 	return ret;
 }
=20
@@ -559,7 +560,8 @@ static void ci_hdrc_imx_remove(struct platform_device =
*pdev)
 		if (data->hsic_pad_regulator)
 			regulator_disable(data->hsic_pad_regulator);
 	}
-	put_device(data->usbmisc_data->dev);
+	if (data->usbmisc_data)
+		put_device(data->usbmisc_data->dev);
 }
=20
 static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
=2D-=20
2.34.1


