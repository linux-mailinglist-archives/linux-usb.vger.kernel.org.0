Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF542F3036
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 14:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbhALNE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 08:04:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:53818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405323AbhALM6f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 07:58:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 901DB2333F;
        Tue, 12 Jan 2021 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610456281;
        bh=UpGumYkVZZaMDfuk6uunnP8taHCnShB2Qy2JEVQn2Hw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jvZasEGIVnYx/Q9O+/Td4yal0Un7Xdc95MBrwwLQSkOU0cOt4YZFlZYAFaZW0rBp3
         +Ys6mMgy2HCf71FngJfvbYE4EZL3hbLgwU+rdwpJCaUgx02lsS9MNRAO6lQoHlDQD1
         2jkjlNP0tagFJYVav3/kVliRzxw0gr9NKHkGbf05/reVf3QeB3nED3ABtX+T3/SvKk
         nWEDMvCFoVeIOLP3nUSea3QG9Rh3Ls1w5ThKli88VLJt6C4ehsa+vT9w8iZ4FLjYcw
         gNEy/irGHSrW0LyOIW0xVYjxIXRg2YB876WfQyLsQrhum2YKmI6aKlT8TvYsMeP71+
         9YNg9X70gb8Tw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 08/13] net: usb: qmi_wwan: add Quectel EM160R-GL
Date:   Tue, 12 Jan 2021 07:57:44 -0500
Message-Id: <20210112125749.71193-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125749.71193-1-sashal@kernel.org>
References: <20210112125749.71193-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjørn Mork <bjorn@mork.no>

[ Upstream commit cfd82dfc9799c53ef109343a23af006a0f6860a9 ]

New modem using ff/ff/30 for QCDM, ff/00/00 for  AT and NMEA,
and ff/ff/ff for RMNET/QMI.

T: Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 2 Spd=5000 MxCh= 0
D: Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs= 1
P: Vendor=2c7c ProdID=0620 Rev= 4.09
S: Manufacturer=Quectel
S: Product=EM160R-GL
S: SerialNumber=e31cedc1
C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=896mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
E: Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E: Ad=83(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
E: Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E: Ad=85(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
E: Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E: Ad=87(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
E: Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E: Ad=88(I) Atr=03(Int.) MxPS= 8 Ivl=32ms
E: Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms

Signed-off-by: Bjørn Mork <bjorn@mork.no>
Link: https://lore.kernel.org/r/20201230152451.245271-1-bjorn@mork.no
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index df84d98aa880d..6fed2fc4565b4 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -995,6 +995,7 @@ static const struct usb_device_id products[] = {
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0125)},	/* Quectel EC25, EC20 R2.0  Mini PCIe */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0306)},	/* Quectel EP06/EG06/EM06 */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0512)},	/* Quectel EG12/EM12 */
+	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0620)},	/* Quectel EM160R-GL */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0800)},	/* Quectel RM500Q-GL */
 
 	/* 3. Combined interface devices matching on interface number */
-- 
2.27.0

