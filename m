Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14C113C251
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgAONLm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:11:42 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:60400 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726071AbgAONLm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:11:42 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2418406D1;
        Wed, 15 Jan 2020 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579093901; bh=JzIecizUliOAIs/tkb6G1Y1Tt/gLbncDy+Pjhl9zXuY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fnPw7LgpgfVTbalF3K/fveoNG/WC53Mz3AKBsK4NpT9Wk+icEHWjH/NTJKIteBrPG
         hukk7SRVj8RBLb5G5RMyKpcr6xOSuObzC3QYdcjKBO5mp4asHOKKZnv1lZvQZcoouW
         bQoPM2MC53x3FxQ1KF00+FdchL7RCsB7UHHl4SlLeQ/R63GY/wfdeSYgKmHfxM5l1g
         5nllz4g1dQ1VAC+njLeWBfD7GUVSJd4xyarhPE7f4MlQpdZQtJIV20zqUES5kjpZN3
         4r6sHp3xDNF/cUDTSk1g2AM4d7ILO+odG9p3VqPAvIch1PQxfRnYpZSrpoWZtm8k5J
         weSA6g9KwPARQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 60971A0083;
        Wed, 15 Jan 2020 13:11:36 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 05:11:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 05:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqS2jGadQ4jj3Vz+zmehs7ay2HjyUF7ZErEqI5dPijlGFv1g8MY4ivTLP0DiG2M042zOlaO2mjGDOusDDiHlDyPgVv8NE8zqbG7DHv4KiiwVFRHAC99lrQcF/vDOIJnUcV4Q+7QbsnxYdCRY3rGMVKhocTO0JeoqHrbMLpl1XR/mLPMdeNBcLVBmJ1d5NjKByHCYCum1KjTZan9BDlSRPIt/hCl+8mRR4w0S+OzQG+V59W13A7rUIvxJV7J9Lb6uqLuoVRTYfxy3RO+7Ib5Gaytdrfhy7bVuSaGGutAQ103YQf9kx8BeaotL06SEA5W2OUc8I1wKVQRKzKHJMb50SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzIecizUliOAIs/tkb6G1Y1Tt/gLbncDy+Pjhl9zXuY=;
 b=jUTtw/LkBSqkKm27GuoWWsmIf9okv4ay6kFYsAkqGtj2wkFLPKdnEO6/NsMr7pCrrZRrbMKlkuR5KjxUePn5hSSo03UwmygcQmFFEn40uwxQ1VRebmi3A2mck8kn+X8ZdKL16QftPOiyzqpiTk5qfEypsn70tfCz1eWaJDo8XfzueF6p6CAysZ0GSwZff3w6dn0882Bdq1L7kZS5nXmijNhUIHHN7/pDBbfC3XJ7Ox4ybbXC6hFym/KwD5hRvDmvViHU4CVjwxY2gJFLYSz+0sIyod4DincP/DE2sxbVJgr0eWFK3+9U2IehqBpq1e7XeCISj2m2r132xy0odJpz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzIecizUliOAIs/tkb6G1Y1Tt/gLbncDy+Pjhl9zXuY=;
 b=MCLeUzHQ5SixsqDWUynzBQu6vKtRyuvwN8ioIFNF8pu5ldlUcrYQgQEvL3t0xEtheChOGlRXUc2+7sgcRtlZlAiNn7TXMhJfAytXUNiSSd8aapmHcuK3rVqqBOJuS3wZJ2bhbzolsOPyYEoFATY2Ncf1aYnbBMmS1oiMp9cSSE4=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB4032.namprd12.prod.outlook.com (10.255.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Wed, 15 Jan 2020 13:11:10 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 13:11:10 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Lukas Wunner <lukas@wunner.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Topic: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Index: AQHVn4uRIRY3I3zRxEWS1SsbsjEXaqfsC2sA
Date:   Wed, 15 Jan 2020 13:11:10 +0000
Message-ID: <e417bbba-f2dd-3ffc-0db9-149b08b11913@synopsys.com>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
In-Reply-To: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9ec8507-fa73-4186-0d0e-08d799bc640d
x-ms-traffictypediagnostic: MN2PR12MB4032:
x-microsoft-antispam-prvs: <MN2PR12MB403200F9A59B973D78F06A68A7370@MN2PR12MB4032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(8676002)(91956017)(76116006)(66446008)(64756008)(66476007)(66946007)(478600001)(81166006)(66556008)(4326008)(81156014)(36756003)(2906002)(86362001)(31686004)(6512007)(6486002)(6506007)(53546011)(186003)(5660300002)(316002)(110136005)(26005)(31696002)(2616005)(71200400001)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4032;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5P2Qrzl17kJXHxbrNOkl/eItYoV69HFm0xRWrial4haRqltZz1Hd5zlJlVICcAe1oIfG72ERjGmNKR5bArT5zyMOl27Ukg24iGOW+HvNCtjWh9dOAdfEXOg+ykyhuGLVp9MZuL53lYdq0HvpNy+82fGA6LrI0KjoSmK1fvX9y+wk3y12XQRI9+Se+jpKPDDwk3AWBhbo/ssszC5n9o+coX/Nt+dZULezS6qohEIQxKOfzHZbCYWRZHfTiW/te3j3H98Mm4E4vKBv9Z2MbU+RRBIDsGA1qOVTwI1U0WW4fkPZJhXZ0hCrg+gltVfPQ8rqxtugYW3T4eOwNEX+zOpA4p0gdH4mIDgEJgeIl+spa28dZXx2yOW3BrMlmOEupIz6vQd7K3pAaqO7gtai8L/e1VoHJF9Xa/37DxqFJl0AbvQnZLXW00XNVhGnKK1j5E5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <03F64A9C2372B24AA4039BAD66333B20@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ec8507-fa73-4186-0d0e-08d799bc640d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 13:11:10.6458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Du2TXUTN/QGJGfwkLevERNVxz8Xcmn9P2th2YjQFdyxY+BGr4uAedNJEYEh2paivJkbiG1AgUTEgjFIsW/h3pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4032
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCk9uIDExLzIwLzIwMTkgMjoxNSBQTSwgTHVrYXMgV3VubmVyIHdyb3RlOg0KPiBUaGUgb3Jp
Z2luYWwgZHdjX290ZyBkcml2ZXIgdXNlZCBhIERXQ19XT1JLUV9TQ0hFRFVMRSgpIHdyYXBwZXIg
dG8gcXVldWUNCj4gd29yayBpdGVtcy4gIEJlY2F1c2UgdGhhdCB3cmFwcGVyIGFjcXVpcmVkIHRo
ZSBkcml2ZXIncyBnbG9iYWwgc3BpbmxvY2ssDQo+IGFuIHVubG9jay9sb2NrIGRhbmNlIHdhcyBu
ZWNlc3Nhcnkgd2hlbmV2ZXIgYSB3b3JrIGl0ZW0gd2FzIHF1ZXVlZCB1cA0KPiB3aGlsZSB0aGUg
Z2xvYmFsIHNwaW5sb2NrIHdhcyBhbHJlYWR5IGhlbGQuDQo+IA0KPiBUaGUgZHdjMiBkcml2ZXIg
ZHJvcHBlZCBEV0NfV09SS1FfU0NIRURVTEUoKSBpbiBmYXZvciBvZiBhIGRpcmVjdCBjYWxsDQo+
IHRvIHF1ZXVlX3dvcmsoKSwgYnV0IHJldGFpbmVkIHRoZSAobm93IGdyYXR1aXRvdXMpIHVubG9j
ay9sb2NrIGRhbmNlIGluDQo+IGR3YzJfaGFuZGxlX2Nvbm5faWRfc3RhdHVzX2NoYW5nZV9pbnRy
KCkuICBEcm9wIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3
dW5uZXIuZGU+DQo+IC0tLQ0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0Bz
eW5vcHN5cy5jb20+DQoNCj4gICBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jIHwgNyArLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgYi9kcml2ZXJz
L3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+IGluZGV4IDZhZjZhZGQzZDRjMC4uODc2ZmYzMTI2MWQ1
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCj4gQEAgLTI4OCwxNCArMjg4LDkgQEAgc3RhdGlj
IHZvaWQgZHdjMl9oYW5kbGVfY29ubl9pZF9zdGF0dXNfY2hhbmdlX2ludHIoc3RydWN0IGR3YzJf
aHNvdGcgKmhzb3RnKQ0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBOZWVkIHRvIHNjaGVkdWxlIGEg
d29yaywgYXMgdGhlcmUgYXJlIHBvc3NpYmxlIERFTEFZIGZ1bmN0aW9uIGNhbGxzLg0KPiAtCSAq
IFJlbGVhc2UgbG9jayBiZWZvcmUgc2NoZWR1bGluZyB3b3JrcSBhcyBpdCBob2xkcyBzcGlubG9j
ayBkdXJpbmcNCj4gLQkgKiBzY2hlZHVsaW5nLg0KPiAgIAkgKi8NCj4gLQlpZiAoaHNvdGctPndx
X290Zykgew0KPiAtCQlzcGluX3VubG9jaygmaHNvdGctPmxvY2spOw0KPiArCWlmIChoc290Zy0+
d3Ffb3RnKQ0KPiAgIAkJcXVldWVfd29yayhoc290Zy0+d3Ffb3RnLCAmaHNvdGctPndmX290Zyk7
DQo+IC0JCXNwaW5fbG9jaygmaHNvdGctPmxvY2spOw0KPiAtCX0NCj4gICB9DQo+ICAgDQo+ICAg
LyoqDQo+IA0K
