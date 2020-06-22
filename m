Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC69202EFC
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 06:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgFVERr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 00:17:47 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:19804 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725767AbgFVERr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 00:17:47 -0400
X-UUID: 1040f021076140a19028f475c3459cf1-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PuCl/lBl9iDBpplRpTMsgHwBlFg/ULmA93+bshgDaec=;
        b=r8JBnb7V58Lzk+XcIxtOLeuiUReWX0XgaVfNcJIivSogSSvFhMYkyhjlOI/zmaihwKQ5/0h41OFRt5LS0Rh6rGRUwDk3+6oQfoymGAl+5oZUof497yGsKMvySsIPeNzpLC7py7HZ+8LGFKJr+WPrToDj4mrp3Wp6yumhzOjRzhI=;
X-UUID: 1040f021076140a19028f475c3459cf1-20200622
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1241328394; Mon, 22 Jun 2020 12:17:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Jun
 2020 12:17:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 12:17:36 +0800
Message-ID: <1592799455.3798.1.camel@mhfsdcap03>
Subject: Re: [PATCH] USB: ch9: add "USB_" prefix in front of TEST defines
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Peter Chen <Peter.Chen@nxp.com>,
        "Minas Harutyunyan" <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Michal Simek" <michal.simek@xilinx.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bin Liu <b-liu@ti.com>, Pawel Laszczak <pawell@cadence.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        "Jules Irenge" <jbi.octave@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
Date:   Mon, 22 Jun 2020 12:17:35 +0800
In-Reply-To: <20200618144206.2655890-1-gregkh@linuxfoundation.org>
References: <20200618144206.2655890-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 90C3A953C8EDBA825586FFED90CF686FE83FAFD48F4D38B165862DA8DB3D3B742000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDE2OjQyICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IEZvciBzb21lIHJlYXNvbiwgdGhlIFRFU1RfIGRlZmluZXMgaW4gdGhlIHVzYi9jaDku
aCBmaWxlcyBkaWQgbm90IGhhdmUNCj4gdGhlIFVTQl8gcHJlZml4IG9uIGl0LCBtYWtpbmcgaXQg
YSBiaXQgY29uZnVzaW5nIHdoZW4gcmVhZGluZyB0aGUgZmlsZSwNCj4gYXMgd2VsbCBhcyBub3Qg
dGhlIG5pY2VzdCB0aGluZyB0byBkbyBpbiBhIHVhcGkgZmlsZS4NCj4gDQo+IFNvIGZpeCB0aGF0
IHVwIGFuZCBhZGQgdGhlIFVTQl8gcHJlZml4IG9uIHRvIHRoZW0sIGFuZCBmaXggdXAgYWxsDQo+
IGluLWtlcm5lbCB1c2FnZXMuICBUaGlzIGluY2x1ZGVkIGRlbGV0aW5nIHRoZSBkdXBsaWNhdGUg
Y29weSBpbiB0aGUNCj4gbmV0MjI3Mi5oIGZpbGUuDQo+IA0KPiBDYzogUGV0ZXIgQ2hlbiA8UGV0
ZXIuQ2hlbkBueHAuY29tPg0KPiBDYzogTWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5
cy5jb20+DQo+IENjOiBGZWxpcGUgQmFsYmkgPGJhbGJpQGtlcm5lbC5vcmc+DQo+IENjOiBNaWNo
YWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPg0KPiBDYzogTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBpbnRlbC5jb20+DQo+IENjOiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1
bkBtZWRpYXRlay5jb20+DQo+IENjOiBCaW4gTGl1IDxiLWxpdUB0aS5jb20+DQo+IENjOiBQYXdl
bCBMYXN6Y3phayA8cGF3ZWxsQGNhZGVuY2UuY29tPg0KPiBDYzogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPg0KPiBDYzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9y
QGdtYWlsLmNvbT4NCj4gQ2M6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4NCj4gQ2M6
IEppYS1KdSBCYWkgPGJhaWppYWp1MTk5MEBnbWFpbC5jb20+DQo+IENjOiBTdGVwaGVuIEJveWQg
PHN3Ym95ZEBjaHJvbWl1bS5vcmc+DQo+IENjOiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9w
aGUuamFpbGxldEB3YW5hZG9vLmZyPg0KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4NCj4gQ2M6IEp1bGVzIElyZW5nZSA8amJpLm9jdGF2ZUBnbWFpbC5jb20+DQo+IENjOiBBbGFu
IFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pg0KPiBDYzogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBDYzogUm9iIEdpbGwgPHJyb2JnaWxsQHByb3Rv
bm1haWwuY29tPg0KPiBDYzogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9jZG5zMy9lcDAuYyAgICAgICAgICAgICAg
fCAgOCArKysrLS0tLQ0KPiAgZHJpdmVycy91c2IvY2hpcGlkZWEvdWRjLmMgICAgICAgICAgIHwg
MTAgKysrKystLS0tLQ0KPiAgZHJpdmVycy91c2IvY29tbW9uL2RlYnVnLmMgICAgICAgICAgIHwg
MTAgKysrKystLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMgICAgICAgICAgIHwg
MjAgKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgICAg
ICAgICAgICB8IDEwICsrKysrLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jICAg
ICAgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2Vw
MC5jICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL2JkYy9iZGNfZXAuYyAgfCAxMCArKysrKy0tLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL2dyX3VkYy5jICAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL212
X3VkY19jb3JlLmMgfCAgMiArLQ0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9uZXQyMjcyLmMg
ICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvbmV0MjI3Mi5oICAgICB8ICA1
IC0tLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3VkYy14aWxpbnguYyAgfCAgNCArKy0t
DQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMgICAgICAgICAgfCAgNyArKysrLS0tDQo+
ICBkcml2ZXJzL3VzYi9taXNjL2Voc2V0LmMgICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAg
ZHJpdmVycy91c2IvbXR1My9tdHUzX2dhZGdldF9lcDAuYyAgIHwgMTYgKysrKysrKystLS0tLS0t
LQ0KZm9yIG10dTMsDQpBY2tlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0
ZWsuY29tPg0KDQpUaGFua3MNCg0KPiAgZHJpdmVycy91c2IvbXVzYi9tdXNiX2dhZGdldF9lcDAu
YyAgIHwgMjAgKysrKysrKystLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL211c2IvbXVzYl92
aXJ0aHViLmMgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0tDQo+ICBpbmNsdWRlL3VhcGkv
bGludXgvdXNiL2NoOS5oICAgICAgICAgfCAxMCArKysrKy0tLS0tDQo+ICAyMCBmaWxlcyBjaGFu
Z2VkLCA5OSBpbnNlcnRpb25zKCspLCAxMDcgZGVsZXRpb25zKC0pDQoNCg==

