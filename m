Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4733233FF79
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 07:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCRGYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 02:24:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45106 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229704AbhCRGYD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 02:24:03 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B3D93C00E5;
        Thu, 18 Mar 2021 06:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616048642; bh=nh1kdKsoceKRvzAIydypLg2YcXO3uV059KnpPXyV+5w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mTvQTJApnaxPljJGY4uz5/i2r3bX+ZVdANxPcYJ34sfeVkQg5ycNHljxTisj6EOsn
         c3j44kKn04i8EY+GdMCrTbwkDLAf6oiwZhjBlMPYHJrQ89XtHFZKIMzePWMTKaXOqg
         bzTtR7tIFmzrcrUmuo1qcaZ4Z1LvpIO6N+hqDEWMxclyg1X9pVtwmWMJ7kTYis04IK
         QtCPdHw/Ls3TWS0zHR2nMVeXh8TjbvNA4EZnR7dFQ8924uztNEJfBoklq984eTaWjW
         CxKUTrcvDVPHKKJfEnDTDoGjH339h98lMPmcjwtGaL+pIWvO7ESjp75bIIufAeJKwu
         WtZhTUp8+QnMA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2C647A0084;
        Thu, 18 Mar 2021 06:24:01 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 242E740133;
        Thu, 18 Mar 2021 06:24:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XWO+4ZQe";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYLqg1OJrfTSkW5GSiaVB1RpCQRvjbl197cZa/jhvkDOhoOFYf3DwBfKpdLuvTs9Jni09QrCSyUhqsyRJNZmcSZO2QPt8vP/ROC1lUStbXr3nAKwPSfS2vLpC/pynDLopk+4ffa6K5Gx9fEUyuhusJhU84Bf1FNrRAMJfYQ97SulRBNJvS3v6Cf5loNuDgEvLfAbPwEujkqtG1SkSSzP3SvohychnvaV3FoJv1Fx+gGufBfUb0ThLYnzLFGpr95rKlopNF8dK+h0wZoDw84IBLY2He7eouL16MHPDEfrkjqWTzzcXOp6pibrqX8sgXY9HGRpYzy3RJGEu0OIuSO2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh1kdKsoceKRvzAIydypLg2YcXO3uV059KnpPXyV+5w=;
 b=eUHDFEPrUTLUDJMAEuAHx91AvUonQcRBCMIfcXbKALFp9opL4vxBamBSVvIMwXgcBic22Lsp2SRtd2leSAwRCXi69XTGjjfQQA5hHMpsFAga6WwGxgCJjnaCV4qwZNqxdnSg4b5uJ1s5dK4MmfyYazxexNNarGmxGC59DORRKQnpjHPlpP5yrJAYV+ZfVkDPTzKSWsKW9EJKx1sLvf+XTrFgJdOwxfCuPVWSXpxic7ibwDGNZHX7upSLZzF3R7PyStzjwsF+ZtDhFjUpsr/BHIQgWVzpmHNssahyaoOdT0WE4LcRlAaSsOv5eRAgDOINaC1y2lvGra0T70i1CqkynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh1kdKsoceKRvzAIydypLg2YcXO3uV059KnpPXyV+5w=;
 b=XWO+4ZQeW62zTkiHQnjjqTDCmVuuIl0sCc6nEhGn1ydH5P1ApoE7c5xUTPAhFL1h6gPwNPplIVdT70rb4kUahzyL1+nccXQlkFoqSsZNDBpTKBW7hKKH+YGBVVO1Bw79zmTmckAJZ+kZzKFiUQA/ZrRCT7Jql1byNarFcSUnH/Q=
Received: from BYAPR12MB3462.namprd12.prod.outlook.com (2603:10b6:a03:ad::16)
 by BY5PR12MB3715.namprd12.prod.outlook.com (2603:10b6:a03:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:23:58 +0000
Received: from BYAPR12MB3462.namprd12.prod.outlook.com
 ([fe80::a025:1ced:b6f2:6c1]) by BYAPR12MB3462.namprd12.prod.outlook.com
 ([fe80::a025:1ced:b6f2:6c1%4]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 06:23:58 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 3/3] usb: dwc2: Prevent core suspend when port connection
 flag is 0
Thread-Topic: [PATCH 3/3] usb: dwc2: Prevent core suspend when port connection
 flag is 0
Thread-Index: AQHXG73WlhvSaLeKEEKy8p5VbL0QFaqJRxGA
Date:   Thu, 18 Mar 2021 06:23:58 +0000
Message-ID: <c88f6c5b-ed25-e779-eaba-f840f3e1277c@synopsys.com>
References: <20210318061333.D6F9CA022F@mailhost.synopsys.com>
In-Reply-To: <20210318061333.D6F9CA022F@mailhost.synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.94.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ee45b8-3ee7-41ff-f689-08d8e9d669f5
x-ms-traffictypediagnostic: BY5PR12MB3715:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3715CF61309A9FE320D3B0A1A7699@BY5PR12MB3715.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PNww1h2a/OrTZXxKE8IrAW5Jgwa/76tB/6gb9Lo/N8ehYV0kbG60bOVB7LQGirQlhGaWpLTwt+jkHl+h+3Sm8UYrKAndD9zKk1tog4TgBDb4lci0BSqNwyhmRg/67KL/Kjuj9pOu/2o2uIqoR6uj4im5qWd9gFjKQ3sFD243sUKw6QzXapDTvVi5YSbx8Rz0AU9aBVbZH2abm2QLhJ/ONUYbKYwDH2Z6BtP3Ten8/oZM5eE3gjK3Yhq0aCTpkj5nDXKUt/Me1StmQoN0Zh66Cpb+5h5sadbU696PLiw64YL5rhaSU7k9XuDxODr/FSpe8rGXrEZ7O2v3UWjczxTuG1CKOFtuTgJshKjoXfmStD3wWLRndyMGztZhMfFZKP3PcPstrCjtgfEpgKEJYVOC1LO9H+qovC1wCptJKx1pkwan+tNkpgo5zgWpBZHaDKkTNhUcc1mdsMJA5eXllIMd9REGRUTEhoIY/z2JaZYtgQ8GLzWH1k1U/H3XTUSfFc9GvopcVWHsZlopHNpOHTUt0f6TlqXrxfsuinhgaK2HFAl7+zYWcta9eT8pcsRosviZrvE9mBeQ7AE3dEQdUyj17nWh9gtU31zT8L/QzXyz3FjKJSI2gLzJs0twYsNkirhHlFle8Ol08pXMitf1h0ONqnri05mgBakNKks3weNTMbE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3462.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(39860400002)(376002)(136003)(31686004)(107886003)(31696002)(110136005)(83380400001)(66946007)(2616005)(66476007)(64756008)(6486002)(186003)(76116006)(6512007)(6506007)(91956017)(4326008)(66446008)(15650500001)(86362001)(8936002)(5660300002)(478600001)(2906002)(53546011)(66556008)(71200400001)(26005)(36756003)(316002)(8676002)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZjRweWxJSnZ1aFl3ZXZ0ZlN6SWtHUW9QNFF4ZCt4UGpFd0kxVG1QRW52bFZF?=
 =?utf-8?B?UTJqd3VzaTN3ZktDeGdGOTlNdWxqSkduSlgxU1dIenNKTGZCcVhacTl5YnZm?=
 =?utf-8?B?b3FVK1BpUkpTME1qcXVSSUV0VFBjN2N4TkoxUlBBT0RrNUVzRTZMSDZTSkQ3?=
 =?utf-8?B?eEltR1ZsVEZhQTZ3QmZ1MWVDVWVJdWJHbXRLWHlsZDFqeWROUHZtaFI2M2V6?=
 =?utf-8?B?T2VxTnl2S3VXUTNiVk43dlV0MHF6WXhEMndtS2VuUkNON08rTS9TbUtBZ0cv?=
 =?utf-8?B?MGdmVTNMZDdRWWhXbWxHSjEvcHBOemE3RHNlMm5zRmJlU0s1MmJMSnJIMlUy?=
 =?utf-8?B?L1VCemQ3RWJRRGVFdkNscytlY1laMXhvZWRFWU5XZHc4SkR4R1BmeXJXeEFQ?=
 =?utf-8?B?ZnBJN3VvQ2UwbUkrMlVPcHVlREtLUjhjbTU2eTk5bEhQUGVrKzVvYkhScVc3?=
 =?utf-8?B?bUNxd1gxb09Od3NPYUsxNWxLb3VhOXdhT01WeVg2bzM1U0pZd3dNem1ZcHpk?=
 =?utf-8?B?L0dOREdiR2lGZHc0UUtiTU4yS2tDK1lwVU9naS93UFZ2YUlRMjEyamNnUFRY?=
 =?utf-8?B?MVYxc05CYW5ESWY3ZFk1RldpeTRJaXdTeVVzSU13QURlWlluUmZRNjViMU9t?=
 =?utf-8?B?U0QxcGlydUtmWSt3aUlTQXE0Y3k1cFhCTkpaT2FSRVpxL0RvMU9JMGwrY0dN?=
 =?utf-8?B?WGYxenFReXE4WWR2NU9uSzdZeDVRTXMyMzZERmNPeElGbm13VXFyNUhwRWM3?=
 =?utf-8?B?bGsyWlEvSDh5QnlGbm1DOGFIbEN4Tm4wVE4wRUxjaFRKVm4wZkRiQndVSmlB?=
 =?utf-8?B?bWwybTJvTVI0REhmOGpaSllMT0pDcXRseUZXVDdvNDRrN0JWYWgvVHNjdDNE?=
 =?utf-8?B?K1hrem5jUlhZQ2ViQVNYWGxNekZjYWxGdE1EUnJTQ0JwSnY2cStwWDhVV2th?=
 =?utf-8?B?NGJVY0JqTmdtNkkzZWdtS215cmJTVGpFYmhWQnJFUE5wWFoySzN6ZERhZG53?=
 =?utf-8?B?bWhaVkYyeHh1bkFOYVNKNzMwQU8rMG1XL2pmVVoySUduNXhIZ2FXK1VPb0VJ?=
 =?utf-8?B?dWs3NE5Kem41Y0lHZVVhUDdTUjdUbzBTYk53TXJWMDlUSmlEUjh3YzBVTmhq?=
 =?utf-8?B?ck9LYW45U2RqdzRoaS9MNkdhMkxHUlVySTBMUTEzUE1WNHVBcVEyUkxoQmJj?=
 =?utf-8?B?OXpqait5QzNvWitNTE1IVlMwTVpBYy9CL1B1VUNTMnBkTGhNT09kZStPT2I2?=
 =?utf-8?B?d1RWcHJnVlIvN3pTWFhGNlBSU3VVUUNDeGNqc2NyNXJiRlNQbkx2M1dTZGtF?=
 =?utf-8?B?WVRXaENJVTVuK05kZkRSclBqZXB0MzRvWHNQYlpkVGZHNWlISHJIS1JYamRa?=
 =?utf-8?B?Y2VlSkQ1Z1JhRTNvK1gvM2ZxZnY2WkJyOGF1dERZa1MwNU1ldUYxVGNlT2Zj?=
 =?utf-8?B?bS9VVXJha0RlTlBWdGFrSlVGcWxnc0ZMdnJ2OFNiUjZhdUR6QlZkSmtvTFJC?=
 =?utf-8?B?ZEdYdHdrODJHMWlzS242YThDS1BPa1NhNVFYTW8wUThTb1B5SnhFK1JpZ0wz?=
 =?utf-8?B?a3R5aTYrMEZ6WmRYTWZwOU1CeHlJWHYxOU93a3MzR3V4ek13aHJjRjRETG5T?=
 =?utf-8?B?WUFqdGxTa05ubUNtNHBZUm9sckZjR1RIamsrRjJYdWpZMGxOYXpUdlFiZXJZ?=
 =?utf-8?B?SEp3VkQ4eWNLUG14YU5CNFI3eFhvT1ZTNVZISHgvQ0pCdjRWckhQRkh2ODhT?=
 =?utf-8?Q?t+cYrrIBJU/0x0lbWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F76547DE85DD1746B620DB75C03FA8CA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3462.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ee45b8-3ee7-41ff-f689-08d8e9d669f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 06:23:58.0606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGLR1RLAoGPYO2sAPan/sGVd1rThINEsFQfNvM3w4PAq77g5M/VB/jO0/DxLsy/8TKXPZILqQdai0qJTA9qYeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3715
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMy8xOC8yMDIxIDEwOjEzIEFNLCBBcnR1ciBQZXRyb3N5YW4gd3JvdGU6DQo+IEluIGhvc3Qg
bW9kZSBwb3J0IGNvbm5lY3Rpb24gc3RhdHVzIGZsYWcgaXMgIjAiIHdoZW4gbG9hZGluZw0KPiB0
aGUgZHJpdmVyLiBBZnRlciBsb2FkaW5nIHRoZSBkcml2ZXIgc3lzdGVtIGFzc2VydHMgc3VzcGVu
ZA0KPiB3aGljaCBpcyBoYW5kbGVkIGJ5ICJfZHdjMl9oY2Rfc3VzcGVuZCgpIiBmdW5jdGlvbi4g
QmVmb3JlDQo+IHRoZSBzeXN0ZW0gc3VzcGVuZCB0aGUgcG9ydCBjb25uZWN0aW9uIHN0YXR1cyBp
cyAiMCIuIEFzDQo+IHJlc3VsdCBuZWVkIHRvIGNoZWNrIHRoZSAicG9ydF9jb25uZWN0X3N0YXR1
cyIgaWYgaXQgaXMgIjAiLA0KPiB0aGVuIHNraXBwaW5nIGVudGVyaW5nIHRvIHN1c3BlbmQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciBQZXRyb3N5YW4gPEFydGh1ci5QZXRyb3N5YW5Ac3lu
b3BzeXMuY29tPg0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5dW55YW4gPE1pbmFzLkhhcnV0eXVu
eWFuQHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL2hjZC5jIHwg
MyArKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZlcnMvdXNi
L2R3YzIvaGNkLmMNCj4gaW5kZXggNDBlNTY1NTkyMWJmLi4xYTk3ODllYzU4NDcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9o
Y2QuYw0KPiBAQCAtNDMyMiw3ICs0MzIyLDggQEAgc3RhdGljIGludCBfZHdjMl9oY2Rfc3VzcGVu
ZChzdHJ1Y3QgdXNiX2hjZCAqaGNkKQ0KPiAgIAlpZiAoaHNvdGctPm9wX3N0YXRlID09IE9UR19T
VEFURV9CX1BFUklQSEVSQUwpDQo+ICAgCQlnb3RvIHVubG9jazsNCj4gICANCj4gLQlpZiAoaHNv
dGctPnBhcmFtcy5wb3dlcl9kb3duID4gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX1BBUlRJQUwpDQo+
ICsJaWYgKGhzb3RnLT5wYXJhbXMucG93ZXJfZG93biAhPSBEV0MyX1BPV0VSX0RPV05fUEFSQU1f
UEFSVElBTCB8fA0KPiArCSAgICBoc290Zy0+ZmxhZ3MuYi5wb3J0X2Nvbm5lY3Rfc3RhdHVzID09
IDApDQo+ICAgCQlnb3RvIHNraXBfcG93ZXJfc2F2aW5nOw0KPiAgIA0KPiAgIAkvKg0KPiANCg0K
