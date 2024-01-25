Return-Path: <linux-usb+bounces-5499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB583B65A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 02:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9353286A0E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15BFEA9;
	Thu, 25 Jan 2024 01:04:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FA136F
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 01:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.123.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706144683; cv=none; b=FV3pwTB0NFFf0+ttkxVnZxJmICRwLuttnQRK8T27CRczuzVefhqHLmwE0Iq0gCztqx9R83RyW5P+Co47KVa04DNuL+0VyZ7a79MUKS9MHQyEQYus8zTmavB4mqTt3cyDYw+WLlUnTztpm7T4xJ7UrmeEQE8oM2rFHucKZ1NZHrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706144683; c=relaxed/simple;
	bh=3XBrBWwnoycjaj2YbvlMbTvrF293aZgbY8yGIAvnH60=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E0HFNg4rWRw1AjYrK8DOyzpfKUqTu7aH8vbZ4oFR9adXc5ks0DzlLLvcgTiWqpQYFwcy2ZWAVneLJ1ITWAwkPjTX4Pxem+5toaLkBzFIJaM+BRd/qVDsq4hEoQwZBSSPOSdP8JMzbJspIiEsCVxqlAzUlT0i63EV0emkrRBPglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com; spf=pass smtp.mailfrom=h3c.com; arc=none smtp.client-ip=60.191.123.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.154])
	by h3cspam02-ex.h3c.com with ESMTP id 40P12Xni003667;
	Thu, 25 Jan 2024 09:02:33 +0800 (GMT-8)
	(envelope-from zhang.zhansheng@h3c.com)
Received: from DAG6EX06-IMDC.srv.huawei-3com.com (unknown [10.62.14.15])
	by mail.maildlp.com (Postfix) with ESMTP id 79D8C2004BCE;
	Thu, 25 Jan 2024 09:07:13 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX06-IMDC.srv.huawei-3com.com (10.62.14.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Thu, 25 Jan 2024 09:02:34 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Thu, 25 Jan 2024 09:02:34 +0800
From: Zhangzhansheng <zhang.zhansheng@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Ladislav Michl
	<oss-lists@triops.cz>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        Sneeker Yeh <sneeker.yeh@gmail.com>,
        Wangxiaoqing <wangxiaoqing@h3c.com>, Xinhaining <xinhaining@h3c.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTog562U5aSNOiBbQ29uc3VsdGluZyBh?=
 =?utf-8?Q?bout:_xHCI_host_dies_on_device_unplug]?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW0NvbnN1bHRpbmcgYWJvdXQ6IHhI?=
 =?utf-8?Q?CI_host_dies_on_device_unplug]?=
Thread-Index: Ado/deoXRCEZDWeZTvuVrPzYRAXR6wADli6AA1eMzaAAOXddgAAoPNiwABQDsmD//59zAP//egKwgACOYAD//scFMA==
Date: Thu, 25 Jan 2024 01:02:33 +0000
Message-ID: <f9a4a3fe96514ab4ade2e4e0dcbd77e6@h3c.com>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
 <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
 <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
 <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
 <7e00c498947c4efdb8a96f970656ee03@h3c.com>
 <2024012415-unleash-john-ff32@gregkh>
In-Reply-To: <2024012415-unleash-john-ff32@gregkh>
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
X-MAIL:h3cspam02-ex.h3c.com 40P12Xni003667

DQo+ID5CZWNhdXNlIHRoZSBrZXJuZWwgdmVyc2lvbiBvZiBvdXIgY29tcGFueSBpcyA0LjY1ICwg
SSBuZWVkIHRvIHB1dCB0aGUgcGF0Y2ggdG8gb3VyIDQuNjUga2VybmVsIHdlIHVzZWQuDQoNCj5U
aGVyZSBpcyBubyBzdWNoIGtlcm5lbCB2ZXJzaW9uLg0KU29ycnksIEkgcmVtZW1iZXJlZCB3cm9u
Z2x5ICwgdGhlIGtlcm5lbCB2ZXJzaW9uIGlzIDQuNC42NS4NCg0KPiA+VG9kYXkgY29tcGFyZWQg
dG8gdGhlIGxhdGVzdCBrZXJuZWwgaXMgNi43LCBJIGZvdW5kIHRoZXJlIGFyZSBhIGxvdCBvZiBj
aGFuZ2VzIGZvciB1c2IgbW9kdWxlIGJldHdlZW4ga2VybmVsIDQuNjUgYW5kIDYuNy4NCj4gPg0K
PiA+Q291bGQgeW91IHByb3ZpZGUgbWUgZm9yIHRoZSBpc3N1ZXMgcGF0Y2guDQoNCj5JZiB5b3Ug
YXJlIHN0dWNrIGF0IGFuIG9sZGVyIGtlcm5lbCB2ZXJzaW9uLCB5b3UgYXJlIHJlc3BvbnNpYmxl
IGZvciBrZWVwaW5nIGl0IHVwIHRvIGRhdGUsIHBsZWFzZSBnZXQgc3VwcG9ydCBmcm9tIHRoZSBw
ZW9wbGUgd2hvIGFyZSByZXF1aXJpbmcgeW91IHRvIHVzZSBhbiBvbGRlciBhbmQgb2Jzb2xldGUg
a2VybmVsIHZlcnNpb24sIHRoaXMgaXMgd2hhdCB5b3UgYXJlIHBheWluZyB0aGVtIGZvci4NCg0K
Pmdvb2QgbHVjayENCiBPayEgDQpUaGFua3MhDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWP
keS7tuS6ujogR3JlZyBLSCBbbWFpbHRvOmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnXSANCuWP
kemAgeaXtumXtDogMjAyNOW5tDHmnIgyNOaXpSAyMjoxOQ0K5pS25Lu25Lq6OiB6aGFuZ3poYW5z
aGVuZyAo5pON5L2c57O757uf5byA5Y+R6YOo6YOo6ZeoLCBSRCkgPHpoYW5nLnpoYW5zaGVuZ0Bo
M2MuY29tPg0K5oqE6YCBOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVs
LmNvbT47IExhZGlzbGF2IE1pY2hsIDxvc3MtbGlzdHNAdHJpb3BzLmN6PjsgbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZzsgU25lZWtlciBZZWggPHNuZWVrZXIueWVoQGdtYWlsLmNvbT47IHdhbmd4
aWFvcWluZyAo5pON5L2c57O757uf5byA5Y+R6YOoL09NLCBSRCkgPHdhbmd4aWFvcWluZ0BoM2Mu
Y29tPjsgeGluaGFpbmluZyAo5pON5L2c57O757uf5byA5Y+R6YOoL09NLCBSRCkgPHhpbmhhaW5p
bmdAaDNjLmNvbT4NCuS4u+mimDogUmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtDb25zdWx0
aW5nIGFib3V0OiB4SENJIGhvc3QgZGllcyBvbiBkZXZpY2UgdW5wbHVnXQ0KDQpPbiBXZWQsIEph
biAyNCwgMjAyNCBhdCAwMjowOTo0M1BNICswMDAwLCBaaGFuZ3poYW5zaGVuZyB3cm90ZToNCj4g
TWF0aGlhc++8mg0KPiANCj4gVGhhbmsgeW91IHZlcnkgbXVjaCENCj4gDQo+ID4gVGhpcyBpc3N1
ZSB3YXMgcmVzb2x2ZWQgaW4gNS4xOSBrZXJuZWwgd2l0aCBwYXRjaDoNCj4gPiAyNTM1NWUwNDZk
MjkgeGhjaTogdXNlIGdlbmVyaWMgY29tbWFuZCB0aW1lciBmb3Igc3RvcCBlbmRwb2ludCBjb21t
YW5kcy4NCj4gDQo+ID4gQWZ0ZXIgdGhpcyBwYXRjaCB0aGUgdGltZXIgaXMgc3RhcnRlZCB3aGVu
IHhIQyBzdGFydCBwcm9jZXNzaW5nIHRoZSBjb21tYW5kLCBub3Qgd2hlbiBkcml2ZXIgcXVldWVz
IGl0Lg0KPiA+IEkgc3Ryb25nbHkgcmVjb21tZW5kIHRyeWluZyBhIG1vcmUgcmVjZW50IGtlcm5l
bCB3aGVyZSBhbGwgdGhlc2UgaXNzdWVzIGFyZSBmaXhlZCBhbHJlYWR5Lg0KPiAgDQo+IEkgc2Vl
IDUuMTkga2VybmVsIGhhcyBkb25lIHdoYXQgeW91IHNheS4NCj4gDQo+IEJlY2F1c2UgdGhlIGtl
cm5lbCB2ZXJzaW9uIG9mIG91ciBjb21wYW55IGlzIDQuNjUgLCBJIG5lZWQgdG8gcHV0IHRoZSBw
YXRjaCB0byBvdXIgNC42NSBrZXJuZWwgd2UgdXNlZC4NCg0KVGhlcmUgaXMgbm8gc3VjaCBrZXJu
ZWwgdmVyc2lvbi4NCg0KPiBUb2RheSBjb21wYXJlZCB0byB0aGUgbGF0ZXN0IGtlcm5lbCBpcyA2
LjcsIEkgZm91bmQgdGhlcmUgYXJlIGEgbG90IG9mIGNoYW5nZXMgZm9yIHVzYiBtb2R1bGUgYmV0
d2VlbiBrZXJuZWwgNC42NSBhbmQgNi43Lg0KPiANCj4gQ291bGQgeW91IHByb3ZpZGUgbWUgZm9y
IHRoZSBpc3N1ZXMgcGF0Y2guDQoNCklmIHlvdSBhcmUgc3R1Y2sgYXQgYW4gb2xkZXIga2VybmVs
IHZlcnNpb24sIHlvdSBhcmUgcmVzcG9uc2libGUgZm9yIGtlZXBpbmcgaXQgdXAgdG8gZGF0ZSwg
cGxlYXNlIGdldCBzdXBwb3J0IGZyb20gdGhlIHBlb3BsZSB3aG8gYXJlIHJlcXVpcmluZyB5b3Ug
dG8gdXNlIGFuIG9sZGVyIGFuZCBvYnNvbGV0ZSBrZXJuZWwgdmVyc2lvbiwgdGhpcyBpcyB3aGF0
IHlvdSBhcmUgcGF5aW5nIHRoZW0gZm9yLg0KDQpnb29kIGx1Y2shDQoNCmdyZWcgay1oDQo=

