Return-Path: <linux-usb+bounces-13445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05995199A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 13:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 568541C21781
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DF219FA66;
	Wed, 14 Aug 2024 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="YBRgd9UM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mr85p00im-hyfv06021301.me.com (mr85p00im-hyfv06021301.me.com [17.58.23.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488B1AE84A
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633672; cv=none; b=J3dASSkWDi9epLr0QlV30g0tOHtukMp8EYmQpuLZ+PvSQxP3Z5CRTz56y2nlLd22P5y7sykn/Z2y4HRQuFScnObdkv7obH7C4Pc2k5N7qeCktlW4h/4kZual4OzAUW2gKuGYVh+13wGTXdhScAt6466kbJbdx8V36FQlzF/ln5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633672; c=relaxed/simple;
	bh=yVxtCLTGgQjGhk74i6g7e4YI385bKUtyaU9n2k1GCyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o6eleng2gQjTicUObEGQTiUL6ygbXqpCtspOuQMGSZaxgPAAHDBcsknoPpDeAvpNszB4ilwmp8erkvpTOoIe/ObZU6J179NraYK1bqIzq3pmIncq0O3TVo6g+JtZaVyFlNaVkvcDKtraiLt52O2Vng0UQuIREN2HswvCr7xGdDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=YBRgd9UM; arc=none smtp.client-ip=17.58.23.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1723633670;
	bh=kQllxqwSlax4y60Q/SIAbtg0dy4MqxrZ7h0xytB4dvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
	b=YBRgd9UMOyXt52n2H0i/a0Jd4EMuhQYZVGJ7v7zrcQOxw6x0f4NKZt0aJTYhv/MPj
	 enFX764NMsVk6mDmCOaT/ywDnjzrxwFkg5NZuFQw5dBkhMd7sBNj/I+5/GKdhNn5Hx
	 eD7AXqyXEeP0JyPgF0m6kq+53MZXPFP9KLDCa3ebBpygG6hvl7uaHRPIVOWHJVV6Zm
	 ji9GHxQNT07p/7mySTk+VaFYwNZ6rpBUB92m5hjSHHo4CUK/05e9XsVkc3FDqkDIrs
	 YiIHqKenfKbKoDEdoAkHurGo0gwY7FXa9S+XbqnbmMKOk7+m3EfL6/BU4hbHbvJ1M/
	 xpCQP8nRynLBQ==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-hyfv06021301.me.com (Postfix) with ESMTPSA id DDB022150D07;
	Wed, 14 Aug 2024 11:07:47 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 14 Aug 2024 19:07:34 +0800
Subject: [PATCH] usb: core: sysfs: Unmerge @usb3_hardware_lpm_attr_group in
 remove_power_attributes()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-sysfs_fix-v1-1-2224a29a259b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPWPvGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0MT3eLK4rTi+LTMCl0jIwOzlFTLJANDc0sloPqColSgMNis6NjaWgC
 scZnJWwAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Strasser <kevin.strasser@linux.intel.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.1
X-Proofpoint-GUID: W73DaKZkeAHcuJAlEft6q5b5S4Zskhgi
X-Proofpoint-ORIG-GUID: W73DaKZkeAHcuJAlEft6q5b5S4Zskhgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 clxscore=1011 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2408140077
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Device attribute group @usb3_hardware_lpm_attr_group is merged by
add_power_attributes(), but it is not unmerged explicitly, fixed by
unmerging it in remove_power_attributes().

Fixes: 655fe4effe0f ("usbcore: add sysfs support to xHCI usb3 hardware LPM")
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/core/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d83231d6736a..61b6d978892c 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -670,6 +670,7 @@ static int add_power_attributes(struct device *dev)
 
 static void remove_power_attributes(struct device *dev)
 {
+	sysfs_unmerge_group(&dev->kobj, &usb3_hardware_lpm_attr_group);
 	sysfs_unmerge_group(&dev->kobj, &usb2_hardware_lpm_attr_group);
 	sysfs_unmerge_group(&dev->kobj, &power_attr_group);
 }

---
base-commit: 82313624b2ae5a943d16475a566b65c873989e9f
change-id: 20240814-sysfs_fix-2206de9b0179

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>


