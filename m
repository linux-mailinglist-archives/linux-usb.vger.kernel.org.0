Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BC51A684F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 16:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbgDMOqC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Apr 2020 10:46:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729135AbgDMOqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Apr 2020 10:46:01 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E945C404C5;
        Mon, 13 Apr 2020 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586789161; bh=IWa1nBLZDP4wW0sfMOBXLyCvx+LoY+CONve9uv8Q5Vw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WYgWWtA3yJzZQb2jDBoUepF4tFZNbvdmtHyxLdsJg3SpQV0XV63Gp0xNBp26dKX3L
         RyJ/e2RQXKrc6dlzZpkg6pNe8REfdXaiYd7nC/1ocrYkZYH9dlkRl2zsxDMk+hVBu9
         I1tF72cMlJ8YDNWf4qrtcQYtw7x/JGA+HSUnX7EbfP4xKhoMe4p6HfGMmAEeaErIqY
         v8ViD6Jlelwoq/q+zuMkiKfB+2Mk3ONHahQ+HCza1Dz8QmeZlDbONWScSGnJxdjdJP
         nm6vGieR6W1Gh0jsknbSB/rDgh/wqHdbZiBjFPxyME2cBObWYSF53vNRl/99i6XqoW
         iPwGvg7OSsBwA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E6AC7A0067;
        Mon, 13 Apr 2020 14:45:59 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Apr 2020 07:45:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Apr 2020 07:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgUUcoO+j6o6GjnRbkVhc3+HuD1YbaQ749+gOkd9Vhl9mZWG7v25KwvhADJJJArIMl2bHnC7RI2srhhXaRCr1y+H8/nmuabZ8xzdBx2FXlCdVFhhDMGO/4+RcUkN4no89JmvGctV3/igL4k69yJBEvOayvCtaAh4/1ViUNyG2lW+JsN89o/xFoA45BkLgj+P3tTvtNex2ikXk9DEMW8FK/vgXOv80hoghhlV96bQaCobASNkP6Sh6kycJfbm46fOPgDmvsbNSU8W0eDhpb+Gavaa5JjynOEH4Xh7ljMbGE0Qc1/b6HTZX2Y9gK+xYHGUmfQC3qyBhRp5UWYiBoJwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWa1nBLZDP4wW0sfMOBXLyCvx+LoY+CONve9uv8Q5Vw=;
 b=dF3j4/ctpD7yvlFBXVf8blTLomPgfbIuvW529iPhZJdQzsyTaLezYdVbi/z11DFNkxp1YiEZ7XqvPBwus9irIFEhSdFt0Vx9OumRYjax7iRYFQzhAcefjaRhYX4V7OjJLuCfxo1uWK8jrZr22gK3Q0Wekblygvrbb26Te7cUKoMKkH5HnRm2Dwi6Sqk7khfnNtpDIs4KqtLRqly/QeCQcuYdObNMwhCcOLoxgmpgzuM1Wr9WbBWLca5JbBRiMoGQ0shvXE+Moih0Ru3ynjl4VdU6ei3n93yzrfWf1zIpqlnln5LooYxUOieKZ4waPmQ9BdCiGYbmC8SfimTbYMln/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWa1nBLZDP4wW0sfMOBXLyCvx+LoY+CONve9uv8Q5Vw=;
 b=mIUkvwSFmA3P1wECW39Ie0kfFOktVV4MrRJf5LouWYJ0wvyy5DYbwLeSJPGgdl9wZt4w54E8KZljRsh9Jnd+IY4Lz9xXU+jacW37WpD8dZX9/bKzkWT0cFEvF5aMPdrN2v3IyCWI0XHcCbpvV341wPIHsMNNcNhQpcCijtAQgRg=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20; Mon, 13 Apr
 2020 14:45:57 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 14:45:57 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiA
Date:   Mon, 13 Apr 2020 14:45:57 +0000
Message-ID: <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
In-Reply-To: <20200413143107.181669-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2fa79c6-62ef-46a6-0650-08d7dfb96097
x-ms-traffictypediagnostic: SN1PR12MB2542:
x-microsoft-antispam-prvs: <SN1PR12MB254251AAF92CF98FBA70CE50A7DD0@SN1PR12MB2542.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(346002)(39860400002)(376002)(366004)(136003)(76116006)(66946007)(478600001)(66476007)(91956017)(6486002)(54906003)(66556008)(110136005)(86362001)(6512007)(5660300002)(36756003)(64756008)(66446008)(31686004)(4326008)(186003)(2616005)(53546011)(8936002)(8676002)(2906002)(81156014)(31696002)(6506007)(316002)(71200400001)(26005);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6497FBXrpzBIcVI3RLEbvrM7R/lpLNqvr2vbMv57H8NnVKime7MSi53bNlP7bgwk5sxJQO8COisRMtEh/1aiIhH4o5pB0lTciAPSRnkUi6DLHxA35ivTv2/EBMcPB3ktV+iKskr/2IPt+IFMw9W2ukTpzGB/oxbJ9L5i/Q75aQYaC2WyczbQL54dSVK2SdNnjfMQUFFJJ3fKkJLRTt92g3KtCfyMGF3ceeBSC3ATA3ouRcgIRTK2ASYVRnhX3H3OLmjy4gx7HxLnnAjskddUztpBFSdbyColGHJEn3Ka1s2A8UyMaPpKNf/WsE0wdBd99C4iqenhy2g7yavJInn0tVzKtnMU1G/CynMeeBnJVduZ3vBTYqrl4oE8lcy3Ol9tWA5mSdSMw/cHmaAKa/GcvrgKqLs0KW7cGrsfRSbeb1Ao8QLoIBPTCEoc/ALsqp3
x-ms-exchange-antispam-messagedata: LrbMQ38Yc47BON8wL48RdFGbUDyE6dG872dQeUb0VbrbO6Zded8GzRzwIMdSq0i+eMB5DnKDx3FkHrgmo+dXmcIzc3NzpWtTvF6XrZwRKhuqwXq/tg5LREDqg3hZn1jQ753jXc18kPQBvW+oaPD3dQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1270B011435904F954B0569A585B089@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fa79c6-62ef-46a6-0650-08d7dfb96097
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 14:45:57.6859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybOzHAHYB9J6Vad0sh0IycT2AxfPqFCAZJCZwy2OvhvFwKyu3Gdb2P3tNjzKIoLcs2tOfFgH5YHRQ1K9gFB99Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTMvMjAyMCA2OjMxIFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gU1RN
MzJNUDEgd2l0aG91dCB0aGUgU1RVU0IxNjAwIFVTQi1DIGNoaXAgKGkuZS4gd2l0aCBwbGFpbiBV
U0ItT1RHDQoNCkNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBHU05QU0lELCBHSFdDRkcxLTQgcmVn
aXN0ZXIgdmFsdWVzIGZvciBTVE0zMk1QMS4NCg0KPiBtaWNyby1CIHBsdWcgd2l0aCBJRCBhbmQg
VkJVUyBkZXRlY3Rpb24pLCB0aGUgVVNCIE9URyBwb3J0IG9ubHkgd29ya3MNCj4gaWYgYSBtaWNy
by1CIGRldmljZSAoZS5nLiBhIFVTQiBzdGljaykgaXMgcGx1Z2dlZCBpbiBmaXJzdC4gT25jZSB0
aGlzDQo+IGlzIGRvbmUsIGJvdGggbWljcm8tQiBkZXZpY2UgYW5kIGhvc3QgKGUuZy4gYSBQQyB2
aWEgYSBVU0IgQS10by1taWNyb0INCj4gY2FibGUpIGFyZSBjb3JyZWN0bHkgZGV0ZWN0ZWQgYW5k
IHJlY29nbml6ZWQuIElmIGEgVVNCIGhvc3QgaXMgcGx1Z2dlZA0KPiBpbiBmaXJzdCAoZS5nLiBh
IFBDKSwgdGhlbiB0aGUgUEMgZG9lcyBub3QgZGV0ZWN0IHRoZSBTVE0zMk1QMSBhdCBhbGwuDQo+
IA0KPiBCeSBydW5uaW5nIHRoZSBjb3JlIGNvbm5lY3QgY29kZSBpbiBkd2MyX2hjZF9pbml0KCks
IGJvdGggZGV2aWNlIGFuZA0KPiBob3N0IGFyZSBkZXRlY3RlZCBhbmQgdGhlIFVTQiB3b3JrcyBh
cyBleHBlY3RlZC4gSG93ZXZlciwgaXQgaXMgbm90DQo+IGNsZWFyIHdoZXRoZXIgdGhpcyBpcyB0
aGUgY29ycmVjdCBzb2x1dGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPg0KPiBDYzogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3Qu
Y29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4NCj4gQ2M6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxp
bmFyby5vcmc+DQo+IENjOiBNaW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT4N
Cj4gVG86IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy91c2Iv
ZHdjMi9oY2QuYyB8IDUgKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZlcnMvdXNi
L2R3YzIvaGNkLmMNCj4gaW5kZXggYjkwZjg1OGFmOTYwLi5lYWQ2MDVlZmViMjQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9o
Y2QuYw0KPiBAQCAtNTIzNyw2ICs1MjM3LDExIEBAIGludCBkd2MyX2hjZF9pbml0KHN0cnVjdCBk
d2MyX2hzb3RnICpoc290ZykNCj4gICANCj4gICAJZHdjMl9lbmFibGVfZ2xvYmFsX2ludGVycnVw
dHMoaHNvdGcpOw0KPiAgIA0KPiArCWR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nvbm5lY3RlZCho
c290ZywgZmFsc2UpOw0KPiArCS8qIEVuYWJsZSBBQ0cgZmVhdHVyZSBpbiBkZXZpY2UgbW9kZSxp
ZiBzdXBwb3J0ZWQgKi8NCj4gKwlkd2MyX2VuYWJsZV9hY2coaHNvdGcpOw0KPiArCWR3YzJfaHNv
dGdfY29yZV9jb25uZWN0KGhzb3RnKTsNCj4gKw0KPiAgIAlyZXR1cm4gMDsNCj4gICANCj4gICBl
cnJvcjQ6DQo+IA0KDQpUaGFua3MsDQpNaW5hcw0K
