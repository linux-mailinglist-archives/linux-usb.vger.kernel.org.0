Return-Path: <linux-usb+bounces-22028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F2A6D2F0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 03:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227183B2731
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 02:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8533F3F9D2;
	Mon, 24 Mar 2025 02:06:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8C1362
	for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 02:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742781970; cv=none; b=uMbwBEEVvCTLfT0XoKq2E5WQAppHghQLT0r0egJ1eGx+4pkWZ536RW1S/J6qieiFLzQ2R4+1V8JpxKGwYIwisL0/n/iLoQagblxukMKAGLnHrCr1c/v9G5izi0Tyqz88Zsi5+uHqjGJxFKMuGml5a/F727iH0fVE0UlY6PSME78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742781970; c=relaxed/simple;
	bh=/GQO0IpY0p3UU1uwEF9ENL7JscOM0rc657vQQGldtOk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CYYVzCrjWfCHyvSUAMl+T1du6a3XojEx0jDVGRBexzTJRyFs3wTJSWwBbvdXrOJEgdlqY/HRUrmvHOxQ7nnAvo9wE+1iUCYtUB4FW88wWswebg50J0HhVmKGgX5Q40mxx36Ejc5WCRMHlOMkd8WgNtrHxAGEZ6Kv2mdiik1X6oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZLbxH117lz13L3v;
	Mon, 24 Mar 2025 10:05:39 +0800 (CST)
Received: from kwepemd200023.china.huawei.com (unknown [7.221.188.117])
	by mail.maildlp.com (Postfix) with ESMTPS id CE5081800B1;
	Mon, 24 Mar 2025 10:05:58 +0800 (CST)
Received: from kwepemn200006.china.huawei.com (7.202.194.129) by
 kwepemd200023.china.huawei.com (7.221.188.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 24 Mar 2025 10:05:58 +0800
Received: from kwepemn200006.china.huawei.com ([7.202.194.129]) by
 kwepemn200006.china.huawei.com ([7.202.194.129]) with mapi id 15.02.1544.011;
 Mon, 24 Mar 2025 10:05:58 +0800
From: liudingyuan <liudingyuan@huawei.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"patchwork-bot@kernel.org" <patchwork-bot@kernel.org>, "mricon@kernel.org"
	<mricon@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "Fangjian (Jay)" <f.fangjian@huawei.com>, Kangfenglong
	<kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>, "fengsheng
 (A)" <fengsheng5@huawei.com>, lingmingqiang <lingmingqiang@huawei.com>,
	liulongfang <liulongfang@huawei.com>, zhonghaoquan
	<zhonghaoquan@hisilicon.com>, "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua
 (A)" <huyihua4@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>,
	"shenjian (K)" <shenjian15@huawei.com>, liuyonglong <liuyonglong@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: re: [RFT PATCH] xhci: Limit time spent with interrupts disabled
 during bus resume
Thread-Topic: [RFT PATCH] xhci: Limit time spent with interrupts disabled
 during bus resume
Thread-Index: AducXikzdUFYLVbqQ+eBfAuxB4czDA==
Date: Mon, 24 Mar 2025 02:05:58 +0000
Message-ID: <e1cb9364c2744259af8940dab858a682@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIGZpeCENCg0KSXQncyBvayB0byBhZGQgbWUgdG8g
dGhlICJSZXBvcnRlZC1ieToiIHRhZy4NCg0KVGhhbmtzDQpCZXN0IHJlZ2FyZHMNCkRldnluDQoN
Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0DQoNCj4gSSdsbCBzdWJtaXQgdGhlIHBhdGNoIGFmdGVy
IHRoZSBtZXJnZSB3aW5kb3csIG9uY2UgNi4xNS1yYzEgaXMgb3V0Lg0KDQo+IFdvdWxkIHlvdSBs
aWtlIG1lIHRvIGFsc28gYWRkIGEgIlJlcG9ydGVkLWJ5OiIgdGFnIGZvciB5b3UsIG9yIHNvbWVv
bmUgZWxzZSBpbiB0aGUgdGVhbT8NCg0KPiBUaGFua3MNCj4gTWF0aGlhcw0KDQo=

