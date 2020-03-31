Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24281989D1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 04:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgCaCOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 22:14:09 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47902 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729129AbgCaCOJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 22:14:09 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C118C0FE4;
        Tue, 31 Mar 2020 02:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585620848; bh=v8hlRprSLRE1LrJO3Q+EQ71R+GBxLwss8B14bgjHCBU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RCCZH61O7IukLYLNq0H0EfqP0MiyXDyYXiRfJ6QQdonq5VK3Y306SBK6FxEGwXM6p
         PIMXzhSIyJdfWDGHN6GwYBQwI/uqjYHMoz3jzZBuBr9cTe4F3c/JLnoY1yWzcDMMkv
         lZzvfQDFZtTFGcxbDOTS76zrmh3jyDhDfyQCmmGjbE4na8GuyILbtclTAyZiuw13a/
         +qNO6Wi09WayQB3ThaTrCwb/gGVU0ilQAEadmWWOMyYKOa/kSCvUGEU8t5/NsdiAIr
         9B8lzWO2nVQNvsXCMyRqBIlQIAWWdPM2bsVXEqpyU/xE6Hc7wnXBAMrsVqAWJcglSG
         ZTB/6+I/So2Vg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 06B68A007F;
        Tue, 31 Mar 2020 02:14:08 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 19:12:58 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 19:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwGBwd71G8bUFiDLQ8O81JJzVgCTtKskLfFWOJi8HAgEGqiCt3gUKDGvcg9HQRI6SFCpozj/BRTKuBzoe/3p2RyWuVYrLeo7VWuviQR7P5KuRDAPpe+aoTQXA+1/IMdz4pxDS1T6cU4I/f8zfbeLhpBPL9UfJP8/ypb/USBJaILaYL5fIY9+FrMAWr5apFLqPUn4HkeyjlrWnHrIY5QFnEtkFGzn6BZDRqL5ej+a3BMaFnUVsQ4yPDuzRlsCx6krxCvOz4EDGZ/+HGG/HrPP73NgvtBZICZhM7AMO7wT7SkuYqckInROeKkTwLllV6tihLWREtpH05CkQL84LH2E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8hlRprSLRE1LrJO3Q+EQ71R+GBxLwss8B14bgjHCBU=;
 b=MLfZxnZZLvV9Kfg9P+uSoaLXZTK+tTxe29K3STsitCKIucR7YVVGJSA9sgKhPHEgtO3tpDZZm8ETDSDdSu1VDuYuUFKMsLoF3QK+BmzXBoOc771IzE3velizJzoPy2brXgotzs+key63FMXEthJBL89reDjkDbr9nc9XsFAFg2f7gyOBmyeuKiNCOqB7lCSJA0SdABy0oxv8cfGIDjmURNwHFaJGr2w2XYK35TUjCtYL3J10RvvyL46u304P67g9fAW/lAGMy4a7UIOYHO6UtYfOOwxEAXF288yFpRv5eHLrufLxdTtdXThkNM49vplgufnfcQOLyJSbGAXfEtDNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8hlRprSLRE1LrJO3Q+EQ71R+GBxLwss8B14bgjHCBU=;
 b=XWQWcYhQO9rHi/NUev0CMtdT2S1bIMfNL48irAIN5k2MlY7ZwiERSSjkBzgP/U/ip0GZg3RG3FvmfMgyJEbpuIMvUU+v/omTQBeoJajPobryfC2YjwSXC7pqRUw6DmyP6CfUyaIe8nQJGTQbLW8x8ECVe6tZan5/V+PveE+1/rg=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3208.namprd12.prod.outlook.com (2603:10b6:a03:13b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 02:12:56 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 02:12:56 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] usb: dwc3: gadget: Do link recovery for SS and
 SSP
Thread-Topic: [RESEND PATCH v2] usb: dwc3: gadget: Do link recovery for SS and
 SSP
Thread-Index: AQHWBwHkxiFarzwbuEqbgBerubpUPw==
Date:   Tue, 31 Mar 2020 02:12:56 +0000
Message-ID: <73b1d4e0-6ce4-7c60-2c08-ec6a6e233304@synopsys.com>
References: <20c05d4e60c97b03314ede8d7f2d7c29b34f665f.1576028945.git.thinhn@synopsys.com>
In-Reply-To: <20c05d4e60c97b03314ede8d7f2d7c29b34f665f.1576028945.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11fecde1-26aa-4a2c-5fd9-08d7d519071c
x-ms-traffictypediagnostic: BYAPR12MB3208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3208F08071B49E4910D2828BAAC80@BYAPR12MB3208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(86362001)(31696002)(316002)(6486002)(66946007)(64756008)(66556008)(26005)(76116006)(186003)(4326008)(71200400001)(66446008)(54906003)(6512007)(2616005)(31686004)(8676002)(66476007)(6506007)(2906002)(81166006)(81156014)(478600001)(5660300002)(36756003)(8936002)(6916009);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HasZ83P9wUN9BKGPStsmXodcsInWUuV16ovswI3NvO/XLRIHZ+CNkx35h30mXqRfW/R2tnLVChCNRlwoLARtbiOVTq1//6HAHLClBjZHa7mnjQkVV2klbZCjKbrGZNHPcp+hNr5Y7YRgvX5zRvd03fw1Mwyc32TOBXjoGxKum0p2XxKVIU8lq2aRLnfaqzQTNDsJOO5Cky+h5VCKKhgOruL8/PYpjwFG0VK5pohqSJ07nbPFQ3B0lu7altqIGtywnuz33G/cJ1CuBPWIxv2fo9ZPJaYH91VIeTHjRiqr+ufmMGvGg5eRI513qWxgZ/dIetFF0nx9GzFwC6Ch7u49r4w6cC8w3ghadLCFFXOvL0xaATM3Ih8QOHH0FLe01zX1TF3IbYzG64S7lorKdzxswOPHtMNBK+yGh/cCCxSmmnNQ844uRsekaLfcTM1wzCQQ
x-ms-exchange-antispam-messagedata: RI0aZEsGauzdmtKmtzavWwsW/YZnA+Vbt/lLjYTiWx0oVdguLNDuXUoWKDsC00gQe/bMR6Z5tVY1gxKGKKIuL/LKentu59aUDnLri61oMRmkVyy68PiMB6k9qzSuv84mATnfr/MkbLgrBk7oE3BdPg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2549C92D7A40548B98D4F9A134AC511@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fecde1-26aa-4a2c-5fd9-08d7d519071c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 02:12:56.4924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cj8d7KW0NWaWXjdC9m7S26qE7LAD8SUZU739NtKEgM77JVQf34+cVLq+9FlDOHvCMRHuMo6+lbyofu67cFgYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3208
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClRoaW5oIE5ndXllbiB3cm90ZToNCj4gVGhlIGNvbnRyb2xsZXIgYWx3YXlzIHN1cHBv
cnRzIGxpbmsgcmVjb3ZlcnkgZm9yIGRldmljZSBpbiBTUyBhbmQgU1NQLg0KPiBSZW1vdmUgdGhl
IHNwZWVkIGxpbWl0IGNoZWNrLiBBbHNvLCB3aGVuIHRoZSBkZXZpY2UgaXMgaW4gUkVTVU1FIG9y
DQo+IFJFU0VUIHN0YXRlLCBpdCBtZWFucyB0aGUgY29udHJvbGxlciByZWNlaXZlZCB0aGUgcmVz
dW1lL3Jlc2V0IHJlcXVlc3QuDQo+IFRoZSBkcml2ZXIgbXVzdCBzZW5kIHRoZSBsaW5rIHJlY292
ZXJ5IHRvIGFja25vd2xlZGdlIHRoZSByZXF1ZXN0LiBUaGV5DQo+IGFyZSB2YWxpZCBzdGF0ZXMg
Zm9yIHRoZSBkcml2ZXIgdG8gc2VuZCBsaW5rIHJlY292ZXJ5Lg0KPg0KPiBGaXhlczogNzIyNDZk
YTQwZjM3ICgidXNiOiBJbnRyb2R1Y2UgRGVzaWduV2FyZSBVU0IzIERSRCBEcml2ZXIiKQ0KPiBG
aXhlczogZWU1Y2Q0MWM5MTE3ICgidXNiOiBkd2MzOiBVcGRhdGUgc3BlZWQgY2hlY2tzIGZvciBT
dXBlclNwZWVkUGx1cyIpDQo+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5
bm9wc3lzLmNvbT4NCj4gLS0tDQo+DQo+IFJlc2VuZCBub3RlIC0NCj4gICAgVGhpcyB3YXMgb24g
RmVsaXBlJ3MgbmV4dCBicmFuY2ggc29tZSB0aW1lIGFnbywNCj4gICAgYnV0IGl0IHdhcyBsb3N0
IHNvbWVob3cuDQo+DQo+IENoYW5nZXMgaW4gdjIgLQ0KPiAgICBBZGRlZCBGaXhlcyB0YWdzDQo+
DQo+ICAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDggKystLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
Cj4gaW5kZXggYTlhYmE3MTZiZjgwLi4zZGNkZGU5MDgwZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiBAQCAtMTcxMiw3ICsxNzEyLDYgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3dha2V1cChz
dHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgIAl1MzIJCQlyZWc7DQo+ICAgDQo+ICAgCXU4CQkJbGlua19z
dGF0ZTsNCj4gLQl1OAkJCXNwZWVkOw0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBBY2NvcmRpbmcg
dG8gdGhlIERhdGFib29rIFJlbW90ZSB3YWtldXAgcmVxdWVzdCBzaG91bGQNCj4gQEAgLTE3MjIs
MTYgKzE3MjEsMTMgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3dha2V1cChzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiAgIAkgKi8NCj4gICAJcmVnID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNf
RFNUUyk7DQo+ICAgDQo+IC0Jc3BlZWQgPSByZWcgJiBEV0MzX0RTVFNfQ09OTkVDVFNQRDsNCj4g
LQlpZiAoKHNwZWVkID09IERXQzNfRFNUU19TVVBFUlNQRUVEKSB8fA0KPiAtCSAgICAoc3BlZWQg
PT0gRFdDM19EU1RTX1NVUEVSU1BFRURfUExVUykpDQo+IC0JCXJldHVybiAwOw0KPiAtDQo+ICAg
CWxpbmtfc3RhdGUgPSBEV0MzX0RTVFNfVVNCTE5LU1QocmVnKTsNCj4gICANCj4gICAJc3dpdGNo
IChsaW5rX3N0YXRlKSB7DQo+ICsJY2FzZSBEV0MzX0xJTktfU1RBVEVfUkVTRVQ6DQo+ICAgCWNh
c2UgRFdDM19MSU5LX1NUQVRFX1JYX0RFVDoJLyogaW4gSFMsIG1lYW5zIEVhcmx5IFN1c3BlbmQg
Ki8NCj4gICAJY2FzZSBEV0MzX0xJTktfU1RBVEVfVTM6CS8qIGluIEhTLCBtZWFucyBTVVNQRU5E
ICovDQo+ICsJY2FzZSBEV0MzX0xJTktfU1RBVEVfUkVTVU1FOg0KPiAgIAkJYnJlYWs7DQo+ICAg
CWRlZmF1bHQ6DQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCg0KTWF5YmUgdGhpcyBwYXRjaCB3YXMg
bG9zdCBzb21ld2hlcmUuIExldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55IGlzc3VlIA0Kd2l0aCB0
aGlzIHBhdGNoLg0KDQpUaGFua3MsDQpUaGluaA0K
