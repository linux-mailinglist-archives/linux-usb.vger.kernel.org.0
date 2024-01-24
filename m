Return-Path: <linux-usb+bounces-5464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05C83AB67
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 15:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F221C29623
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 14:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A12D7A70B;
	Wed, 24 Jan 2024 14:10:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1D7A707
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.123.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706105430; cv=none; b=DK8EOoXE2SWb28rtcSolzsCFggQGVDBfA4QYa5+PHbGW/5nICZIjtxatrEWA/Vk24NdbEGcxRtHB9AkmK+FwTK/BQ744KD+ax3BOabkw0aLqj4CoqESUzIE1h7ptEvpNUFZgBjrvq/UGqt5wooT1Bdi0tgYXyvo6qrRq7iM1wyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706105430; c=relaxed/simple;
	bh=NUvnWmgX+3a24k0iIz17AV3ecBrcPe29naHgXmptg60=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u625V8B1HYvTR3xGSs7V0pc8XaN4710ccOUMQLRxViIvOwmT9/bE6hI3h2V4Zlhru4kK9++1dC53SXA/NXDDpmdf9SADXulHRXhVb1pXJZfP3fg32jZPMEAxVVKQXL6gVuJFh43oIKDHgJzuWZg0jAu+p87G+FkLuV9lD+ThEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com; spf=pass smtp.mailfrom=h3c.com; arc=none smtp.client-ip=60.191.123.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.154])
	by h3cspam02-ex.h3c.com with ESMTP id 40OE9e2m093953;
	Wed, 24 Jan 2024 22:09:40 +0800 (GMT-8)
	(envelope-from zhang.zhansheng@h3c.com)
Received: from DAG6EX11-BJD.srv.huawei-3com.com (unknown [10.153.34.13])
	by mail.maildlp.com (Postfix) with ESMTP id A27C02004BA8;
	Wed, 24 Jan 2024 22:14:22 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX11-BJD.srv.huawei-3com.com (10.153.34.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Wed, 24 Jan 2024 22:09:44 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Wed, 24 Jan 2024 22:09:44 +0800
From: Zhangzhansheng <zhang.zhansheng@h3c.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Ladislav Michl
	<oss-lists@triops.cz>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Sneeker Yeh
	<sneeker.yeh@gmail.com>,
        Wangxiaoqing <wangxiaoqing@h3c.com>, Xinhaining
	<xinhaining@h3c.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW0NvbnN1bHRpbmcgYWJvdXQ6IHhI?=
 =?utf-8?Q?CI_host_dies_on_device_unplug]?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtDb25zdWx0aW5nIGFib3V0OiB4SENJIGhvc3Qg?=
 =?utf-8?Q?dies_on_device_unplug]?=
Thread-Index: Ado/deoXRCEZDWeZTvuVrPzYRAXR6wADli6AA1eMzaAAOXddgAAoPNiwABQDsmD//59zAP//egKw
Date: Wed, 24 Jan 2024 14:09:43 +0000
Message-ID: <7e00c498947c4efdb8a96f970656ee03@h3c.com>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
 <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
 <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
 <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
In-Reply-To: <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-sender-location: DAG2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam02-ex.h3c.com 40OE9e2m093953

TWF0aGlhc++8mg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KDQo+IFRoaXMgaXNzdWUgd2FzIHJl
c29sdmVkIGluIDUuMTkga2VybmVsIHdpdGggcGF0Y2g6DQo+IDI1MzU1ZTA0NmQyOSB4aGNpOiB1
c2UgZ2VuZXJpYyBjb21tYW5kIHRpbWVyIGZvciBzdG9wIGVuZHBvaW50IGNvbW1hbmRzLg0KDQo+
IEFmdGVyIHRoaXMgcGF0Y2ggdGhlIHRpbWVyIGlzIHN0YXJ0ZWQgd2hlbiB4SEMgc3RhcnQgcHJv
Y2Vzc2luZyB0aGUgY29tbWFuZCwgbm90IHdoZW4gZHJpdmVyIHF1ZXVlcyBpdC4NCj4gSSBzdHJv
bmdseSByZWNvbW1lbmQgdHJ5aW5nIGEgbW9yZSByZWNlbnQga2VybmVsIHdoZXJlIGFsbCB0aGVz
ZSBpc3N1ZXMgYXJlIGZpeGVkIGFscmVhZHkuDQogDQpJIHNlZSA1LjE5IGtlcm5lbCBoYXMgZG9u
ZSB3aGF0IHlvdSBzYXkuDQoNCkJlY2F1c2UgdGhlIGtlcm5lbCB2ZXJzaW9uIG9mIG91ciBjb21w
YW55IGlzIDQuNjUgLCBJIG5lZWQgdG8gcHV0IHRoZSBwYXRjaCB0byBvdXIgNC42NSBrZXJuZWwg
d2UgdXNlZC4NCiANClRvZGF5IGNvbXBhcmVkIHRvIHRoZSBsYXRlc3Qga2VybmVsIGlzIDYuNywg
SSBmb3VuZCB0aGVyZSBhcmUgYSBsb3Qgb2YgY2hhbmdlcyBmb3IgdXNiIG1vZHVsZSBiZXR3ZWVu
IGtlcm5lbCA0LjY1IGFuZCA2LjcuDQoNCkNvdWxkIHlvdSBwcm92aWRlIG1lIGZvciB0aGUgaXNz
dWVzIHBhdGNoLg0KDQoNCg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IE1h
dGhpYXMgTnltYW4gW21haWx0bzptYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbV0gDQrlj5Hp
gIHml7bpl7Q6IDIwMjTlubQx5pyIMjTml6UgMjE6NDkNCuaUtuS7tuS6ujogemhhbmd6aGFuc2hl
bmcgKOaTjeS9nOezu+e7n+W8gOWPkemDqOmDqOmXqCwgUkQpIDx6aGFuZy56aGFuc2hlbmdAaDNj
LmNvbT47IExhZGlzbGF2IE1pY2hsIDxvc3MtbGlzdHNAdHJpb3BzLmN6Pg0K5oqE6YCBOiBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOyBTbmVla2VyIFllaCA8c25lZWtlci55ZWhAZ21haWwuY29t
Pjsgd2FuZ3hpYW9xaW5nICjmk43kvZzns7vnu5/lvIDlj5Hpg6gvT00sIFJEKSA8d2FuZ3hpYW9x
aW5nQGgzYy5jb20+OyB4aW5oYWluaW5nICjmk43kvZzns7vnu5/lvIDlj5Hpg6gvT00sIFJEKSA8
eGluaGFpbmluZ0BoM2MuY29tPg0K5Li76aKYOiBSZTog562U5aSNOiDnrZTlpI06IFtDb25zdWx0
aW5nIGFib3V0OiB4SENJIGhvc3QgZGllcyBvbiBkZXZpY2UgdW5wbHVnXQ0KDQpPbiAyNC4xLjIw
MjQgMTMuNDIsIFpoYW5nemhhbnNoZW5nIHdyb3RlOg0KPiBNYXRoaWFz77yaDQo+IA0KPiANCj4g
SW4gcmVnYXJkIHRvIHRoZSBxdWVzdGlvbiDigJxXaGF0IHRoZSByZWFzb24gb2YgdGhlIHVzYiBo
b3N0IGNvbnRyb2xsZXIgaGFuZGluZyB0aGUgc3RvcCBlbmRwb2ludCBjb21tYW5kIHRpbWVvdXQg
bWF5YmUgdHdvIGEpIGFuZCBiKS7igJ1KdXN0IHRvIGFkZCB0aGUgZm9sbG93ICBvbmUgOg0KPiBX
aGVuIHRoZSBwcm9ibGVtIGFyaXNpbmcsIHRoZSBmdW5jdGlvbiBvZiDigJx4aGNpX2hhbHQg4oCc
IG9wZXJhdGVkIHRoZSBob3N0IGNvbnRyb2xsZXIgc3VjY2Vzc2Z1bGx5LiBTbyBJIHRoaW5rIHRo
ZSB1c2IgaG9zdCBjb250cm9sbGVyIHNob3VsZCBiZSBvay4NCj4gDQo+IFNvLCBJIGd1c3Nlc3Mg
dGhhdCB0aGUgdXNiIGhvc3QgY29udHJvbGxlciBoYXMgbm8gZW5vdWdoIHRpbWUgdG8gaGFuZGxl
IHdpdGggYSBsYXJnZSBudW1iZXIgb2YgeGhjaSBjb21tYW5kLg0KPiANCg0KVGhpcyBpc3N1ZSB3
YXMgcmVzb2x2ZWQgaW4gNS4xOSBrZXJuZWwgd2l0aCBwYXRjaDoNCjI1MzU1ZTA0NmQyOSB4aGNp
OiB1c2UgZ2VuZXJpYyBjb21tYW5kIHRpbWVyIGZvciBzdG9wIGVuZHBvaW50IGNvbW1hbmRzLg0K
DQpBZnRlciB0aGlzIHBhdGNoIHRoZSB0aW1lciBpcyBzdGFydGVkIHdoZW4geEhDIHN0YXJ0IHBy
b2Nlc3NpbmcgdGhlIGNvbW1hbmQsIG5vdCB3aGVuIGRyaXZlciBxdWV1ZXMgaXQuDQoNCkkgc3Ry
b25nbHkgcmVjb21tZW5kIHRyeWluZyBhIG1vcmUgcmVjZW50IGtlcm5lbCB3aGVyZSBhbGwgdGhl
c2UgaXNzdWVzIGFyZSBmaXhlZCBhbHJlYWR5Lg0KDQpUaGFua3MNCk1hdGhpYXMNCg==

