Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7B81AAB7C
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 17:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393129AbgDOPKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 11:10:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:58844 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726083AbgDOPKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 11:10:51 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 89BB9404D1;
        Wed, 15 Apr 2020 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586963449; bh=CBwTbQGZ3wnSzbUJIMC8BVP7M4dItIH6x22OpEaowcw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Bl61peep84oRjml975NyLkeU17AGiyVJJknc7mv8SGtjhJ16LunlqawhUoNgdcMe8
         WCd+MC1ypmupLMKhkYyaq4JKxzFfaTxbHGjCf3DsfD3LCFGwdZaC3vnsKNIj/rUZ/m
         fWE03IPCg+86EFbBA8B5tf1bjPq7kwfanfnWonsBQSlOrsGyEGE/Wv9sxOHDiZXskG
         ed0t0doPvfk8wapSrPhg5GoCDqt+nNsmew10T6M1D57w4UJQzBxSeRvvj/IXhPWba1
         w1mW5C4LbbBPtk7OStGxLT4IeKsfPn3BP7UP6b1fMtdor4mu289fIcLnsKsgb2pFCH
         ds/EBkye+Lj+A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A4C5DA0083;
        Wed, 15 Apr 2020 15:10:48 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Apr 2020 08:10:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Apr 2020 08:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmitxw/LCl32DFItsEacQSA3MIdwhAOHM7HcbA+dZlnPLI3FmSKigyu4TDklcUq4xDi0ynRi082VddZkEJ+qKIJdDByLq2CEXwIVk74x24MNDRKV+e/mjoCxRnCytd8/hXKx4CSx4uEoTNmXIYLTY2cXkC9tk1cLSzQjr3abGQBWfy2y7BzFitobRmThFJgZNh2m0fvI0IE963VnwczhTnyoQWZXEvGLd+LJNsWqcUam5Ho/64bVc430pkcFdfNhNXPp3dMjHUHqtdKvNgH/e3p5376rb0yZm2hJqgr47O3tC/RU/VPIBo0PYNb7NGwQiL3ASeNn6OCKVpdllEEoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBwTbQGZ3wnSzbUJIMC8BVP7M4dItIH6x22OpEaowcw=;
 b=GGq1MU/fiG9kV6gTrVx9TNy7+rHjOS20hbpFSHNoLEsJysQDBckC2CBYFf5i0F/NpBqnSws5Dpe7a7+PUFGTDMATbnGYLaTQi/zJI6yOFA5g5+dt1iPRo2czvRK/z5JYlVe4AaTXHotCFDtV4txFQFe5ZafU5d/9ojOOqvMh5vp4JdqN43oDK+dZFrBSSO5Chko1zjRyPxv8N67TQ2giOHT0yzpCc+PXNN5SQXv2H8n9gkkoQjEPRZJshsofWJp+v/YGp3ypVE0owACMwvTcofHBa8Gw13ZpiqoszaMTCKRiaMuEp0fGsBU2grUj6Pl6lGnsnF6VwIJylrgBgsz3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBwTbQGZ3wnSzbUJIMC8BVP7M4dItIH6x22OpEaowcw=;
 b=RLGoIbDBGqkyP8zR4Cm3/y8mzZ5Fq8+KMIhWIEVH94xe9PyarL5TlqG8b84PtVyrkiVszh8gHKkTpX06gxzzAWEI/O2699YmjohSyyTtMonUrB/0E6YrtJTIfwjKPUh+xGEeYEX7kHBzc2yYSDJAIP8fEsvgRpWt0vdR+/sTH+M=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 15:10:36 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 15:10:36 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gA==
Date:   Wed, 15 Apr 2020 15:10:36 +0000
Message-ID: <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
In-Reply-To: <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
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
x-ms-office365-filtering-correlation-id: 0d47ddcc-142a-4281-d4b1-08d7e14f26b2
x-ms-traffictypediagnostic: SN1PR12MB2479:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB247975F35E1BA36379D1B94BA7DB0@SN1PR12MB2479.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(376002)(366004)(136003)(396003)(346002)(76116006)(66446008)(6506007)(66946007)(31696002)(64756008)(36756003)(66476007)(53546011)(4326008)(66556008)(86362001)(91956017)(6512007)(8676002)(6486002)(81156014)(8936002)(110136005)(316002)(2906002)(2616005)(54906003)(186003)(26005)(31686004)(4744005)(478600001)(5660300002)(71200400001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z0oFYHrScDijBOu2hlSZ2MF3GWlJNOiz9V/MFWmmZOL+V+qAodB9o+RqgLxAEq4ZAhiC/9HJGxYJYbihR2zBWiNGQxm6KVNrlb7xBqv/ztQD85Pk6NBjQtSJVvpLQKeYOC0675PffbjnOW8Xa3E5L/NC95VuKt14aJcm7wxSubRFvGyIrVF8dzcuyCgAvlmUIoeWmVV9wJjgaOrNnhQBIYfKuciOXYFmAKSeT6x5jdyYFzoVevMf+XhjsMB0Kmz+s+iYfvH2muuUD1B/KH1BKfZNgkoqVJXWHW7mOEF2BEzV5eldNt8pRaLN1ivgW+QY4uW/PDW5Nggqy3VyrPPQgQ85GpqOZNb08KNWnN61Sn29zp2/vUrctmENGF+UpQuvr3NDSBDP9320H4Jn1tcsrGvXvivoI07EU2uM5bNIrchfARGPISbDRyXLhYRDrsDr
x-ms-exchange-antispam-messagedata: tHuwwZMSFN2WtdqajQU/5xdIjec+aFiG+JHYgZv3SUEGHlkOxNCDzAVipP4UQkzO0U0vxOZDDiProuY33alLeoxTzMxXVps8tUf98pyxtGOUV38HdwXmK0SokqJI8RkHGUl4ZAsE/msQ1l1XfyUeuA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <853C3885F4277C489104C3785E3DFC9A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d47ddcc-142a-4281-d4b1-08d7e14f26b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 15:10:36.2905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqQ8377BolzjQOImNCIAaSZreSeQUc0y0+jCJN2PHf1GTCWcSuFnvFDNx+O9pMJc4gPv3DD8pJXJkzHq7kDTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTUvMjAyMCA2OjU1IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
NS8yMCAxMDozNyBBTSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBP
biA0LzE0LzIwMjAgNDoxOCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+Pj4gT24gNC8xNC8yMCA5
OjE0IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+DQo+Pj4NCj4+Pj4gMi4gZGVidWcg
bG9nDQo+Pj4NCj4+PiBXaGF0IGtpbmQgb2YgZGVidWcgbG9nID8NCj4+Pg0KPj4gRHJpdmVycyBk
ZWJ1ZyBsb2cgc3RhcnRpbmcgZnJvbSBkd2MyIGxvYWRpbmcgYW5kIGNvbm5lY3RvciBjb25uZWN0
aW5nIHRvDQo+PiBkZXZpY2UsIHdoZXJlIGlzc3VlIHNlZW4uDQo+IA0KPiBIb3cgZG8gSSBlbmFi
bGUgdGhlIG9uZSB5b3UgbmVlZCA/DQo+IA0KVG8gZW5hYmxlIGRlYnVnIHByaW50cyBmcm9tIGR3
YzIgdXNlICdtYWtlIG1lbnVjb25maWcnOg0KDQogIFN5bWJvbDogVVNCX0RXQzJfREVCVUcgWz15
XQ0KICAgVHlwZSAgOiBib29sDQogICBQcm9tcHQ6IEVuYWJsZSBEZWJ1Z2dpbmcgTWVzc2FnZXMN
CiAgIExvY2F0aW9uOg0KCS0+IERldmljZSBEcml2ZXJzDQoJCS0+IFVTQiBzdXBwb3J0IChVU0Jf
U1VQUE9SVCBbPXldKQ0KICAgICgyKSAgICAgLT4gRGVzaWduV2FyZSBVU0IyIERSRCBDb3JlIFN1
cHBvcnQgKFVTQl9EV0MyIFs9bV0pDQogICBEZWZpbmVkIGF0IGRyaXZlcnMvdXNiL2R3YzIvS2Nv
bmZpZzo2Ng0KICAgRGVwZW5kcyBvbjogVVNCX1NVUFBPUlQgWz15XSAmJiBVU0JfRFdDMiBbPW1d
DQoNClRvIGdldCBsb2cgdXNlICdkbWVzZycgY29tbWFuZC4NCg0KVGhhbmtzLA0KTWluYXMNCg==
