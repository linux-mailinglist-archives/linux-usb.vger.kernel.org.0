Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F1B2F6942
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 19:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbhANSSn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 13:18:43 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50570 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725950AbhANSSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 13:18:42 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C3173406EA;
        Thu, 14 Jan 2021 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610648262; bh=8daHQGrZ0a9LUYV/0JMZP2ZApDkE+H1Bp9Akihxi8AM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HUUCqH2hUarx91iTrtmRCT+6ppZnNdvdUyj7k9s+pYCIqppZU31sBB80Ec0DhorRy
         14z1A7fSrLzF5VR388V9qx7NF1TQzaOLd2Tu/Nulod3GIhI7QHFD/NmVHpMOQvDaGP
         6faqYqRK8F6SXww0Kq78cYPHHlk/8Bl7Jp7cheVmDlh5g0VL8Ax2km4cqE4aarIc9I
         quJugAh8eh6gEXxXtVlzAVQze2IOi5q8vRhDBCUQ9Wih8rlxIqyLwe0KLMq6kixmTo
         QChLy3BlNZ5gl4CXWMoDznzLXN5OvuFLqmgVBhHWe5J9UjtgY8nXwh8eP04JSqAlEE
         wDu9l2Y6QO0IA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A0721A0096;
        Thu, 14 Jan 2021 18:17:41 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2CFC44004A;
        Thu, 14 Jan 2021 18:17:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="G2P9hhOw";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUR8sXG2DMD19vmDRIUpx/YvVGSNnQQ5eG2VRLW+SwMgl/bgUWL23PCv37ly3qf7lKmGYNqFPA4eN/fMXCYdlbqx7b3ODyM1oJDzJooEOMJXyaVkMpcj+ETift0Hipec9FQuTC9+ToeVfj7U1CNv8YwpgG/DDkdWPff08s6LcwMPYWZO0Xadb/Sce0x6SjqgKS2ri9rRWs8Wy46sM/+WcsZWUUyPy7C09xtPZWOIMrJ65zLInAc+IGn6nVrI8O7XRpdziRDRQj8QhZ5althrRUgrQl5hFRDM9tcPc571kXaeKdQbLgePBsXU0KmLwhB33qSlvKu3zik38xPAeJ6n7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8daHQGrZ0a9LUYV/0JMZP2ZApDkE+H1Bp9Akihxi8AM=;
 b=H7Sv+x9TjaIClw3VgOUOt7puon6D9JzctrJhWXJmxFLsLTr1UPNAnzx0nCn3j1YBojmmLmXJX1Xkj7rorcfmujiQ5N7flHkmBpkju3jCIHF4hdRaZtMahpIoje7FvhPpL9q9b/2TPnnqIu6/4qTg/VM98EcKsIxWIFeNxZfIDlfZgDa9Uoux1KYKhdr2plluC9GaudZodlqUHdpoH1DAn9OQjslRCgPfiOemBJp4Ir7ibKnjLT2FqRHkexEYCv0VonL5QjaUP7yrcvz7JW8fhAMGXeMpgp4Mxjkth7Qawyv3PSGwiKFD7MadwLgLyQRFTe0svugOeANSDp5tOsNTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8daHQGrZ0a9LUYV/0JMZP2ZApDkE+H1Bp9Akihxi8AM=;
 b=G2P9hhOwQky2RAKxf8i+QSgIaMlmErALhv3Dz0S25/7/qF92qJMvk/WTfsCw3qGcqVuhKKvAvxbQVODw/n0hLkdZME5TfRsZz2nEcSPY2a/ZONVl41z4ebUjPxkv7P9brMMpRXomLbtxQ0KMuugHpNRGpJqGf3/jzVe9m5aYzD4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3748.namprd12.prod.outlook.com (2603:10b6:a03:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 18:17:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:17:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 09/11] usb: dwc3: gadget: Implement setting of SSP rate
Thread-Topic: [PATCH v6 09/11] usb: dwc3: gadget: Implement setting of SSP
 rate
Thread-Index: AQHW6iB3X4pM93lS30mHSeCEquKujqom5H2AgACKUoA=
Date:   Thu, 14 Jan 2021 18:17:37 +0000
Message-ID: <13fad6ff-f056-f6ab-713b-68794113e03c@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <1bbbb6cd0d80696c0b1c112a225dad0b0efe8b91.1610592135.git.Thinh.Nguyen@synopsys.com>
 <871ren3kg8.fsf@kernel.org>
In-Reply-To: <871ren3kg8.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d28fa33a-6af8-4416-6d10-08d8b8b8ac54
x-ms-traffictypediagnostic: BY5PR12MB3748:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB374850C33146E87FFE80EABBAAA80@BY5PR12MB3748.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fMj8THqofNTp3uSzUzRfUDAPyCX0Wcm3IhuYcAYmToUEtmbRqN+VX0Xt8XahLQKUGii0ff0CsMNLfDGwG62LLYreE1cVIcwqY/xWIDXsGrw1glx08QOhxjosJxVJkzvJENK05DVBs6SPy2cxYdjHX366/47eofRYmii+83WkhLy8opnYdkbELjEfxqF0AyU4f17gdEZte5p7XmVJhRCV49GU3gOXW3So9NtuMDnf1GRwSzkruz8XeX+WdAIT/SNk2v0I+oZLp3LnqCg4M8nasd0nBKtWMnvqzjKpPeEH5GIpjt1brV55H7oy8piy5onniyR5wNZ9Bj6QRE1mvMQxX2XaMq8WwZOelpUT4pDXpaOpOUZ4kKSBF5pQVcBG8kmwwxZ6NX7WwcLt2G+JkRR+eHlIbvG6uKx4FP1zgZa9WK79NQdXZphdpHAB+YTcY22S+bvFiBWTC0pdVsp6h4rpXqIF/3ny0VopZvbDCm0Ql5w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(366004)(39860400002)(71200400001)(316002)(2906002)(478600001)(36756003)(83380400001)(26005)(31696002)(110136005)(31686004)(2616005)(6486002)(86362001)(6506007)(5660300002)(186003)(4744005)(4326008)(8936002)(76116006)(66556008)(107886003)(6512007)(66946007)(64756008)(66446008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ejBieVphUGZ3UWpncG03VzdiV0dvWWRVMkVYemdmUVBnUi9iOVEwR0owTGVT?=
 =?utf-8?B?Q2JIMVJUS21ObVJVbEs0Q0dMeU9rdkpKd0tRRnU5VUR6YURJNlBtZ0N4Nngy?=
 =?utf-8?B?anJ1SlhEenpLaHovTEpab1hHTmJxakFQN2ROV2l1MWZmaWVmUkRxQldtWjBj?=
 =?utf-8?B?azI1a1dkUXhjeUlvOTd0dFo4MmI4UHRyVW51MU95MHhsVlZXQ0V0bCs1bEw0?=
 =?utf-8?B?N0JuTGlFb2FjakFWelB0eUpkSkRUNnF3NlhHcm92dDU0T2Jxd0dJLy9KZlZD?=
 =?utf-8?B?d3N1cElMczV3MktWYWJnMHNpajRrdGxydDAvaDhPR2JqZDlOM3JPTy96Q1M0?=
 =?utf-8?B?SllMQTNWTXJGbjhqR3ltcFlZcWJyWVkxTzAxS0t1alZpdTZ2SjRacTBuTS82?=
 =?utf-8?B?TmZWNDJmT29xNXNiSEUxWFNQVTVDYUtOWTVGcnZzd3RoV3F1ajRkNWpuR3Vj?=
 =?utf-8?B?QWx0OUw3TXJlYUg2SXM4QmEyaG1DQTNEdk40TWJna29QWUMveVNLcjRESnA2?=
 =?utf-8?B?cEs4R3RJV3RBVmVJTEtBWDBaMGRmdEN1eHd3bSt0RVhiOEFrL0l5MjhVR3J5?=
 =?utf-8?B?dHVSZ3lXQ3YySnNvZXhwVW1xS0lpRlR6UkpPRUF1RzMyRGhKZm9yV0dvYnZN?=
 =?utf-8?B?MmVhakhhZkxZNC81bHZrOWg3bGJJZ3dzTXFkd3BKL01CeVVxSVpaQmhrR1E5?=
 =?utf-8?B?MEt2S3AxT2hJelZvQ2p0NlV6azM4L1FyZk5uSGVQeW4zUGI1UDBaNU5Ieng5?=
 =?utf-8?B?UG1RVTZXbk9qb0g0TStoQ3gyUFR5VHhld1IrZGhtanhGMjJQQlNkRkZIUmFL?=
 =?utf-8?B?MnBrdWwrSHN3K21xODdvd0p4NE4zZEtNUCsxdVNVUGhkNlNSQjNiK2ZTYnhs?=
 =?utf-8?B?QWxLc0gxRWNGWFVWTm0rU1pNVTEySmh4cjhrTXAxNUFzRnBxMDkvMm9WOUxk?=
 =?utf-8?B?TEdXYis4bi9aOVZOcmIwTkNxNXc0a2tjNmtOelUxWWRSN1ZBTnc2djZ1VlM5?=
 =?utf-8?B?QkJzdXlVT2M3bXZwRzFQck4xWFdzU2pqSzQweDBtNWx0NDNHU2F3c1UwS0Fx?=
 =?utf-8?B?cVEwYUxycXE0VjhOWXZXQmp3TFhDcGkreHBPK2c1dHhqaG82dTFyekcyTnVw?=
 =?utf-8?B?MlNxRmtqRnRza3dVeHNkL3hHLysySW05V3g0TWxEVUJ2QzdpRmZXclgwRE9t?=
 =?utf-8?B?TW11L1lFa2JzVHlPbUFnNnJvYWFKQ0VHL2VVWXNiRVZCMTVKTUtuZ2lNSUlP?=
 =?utf-8?B?UmppZjdiQXdsL0c3R3RVT1EyV0hpVXl0d0JvSXpKZTllNkNJUG9rR3h2cVl3?=
 =?utf-8?Q?6v94b6wK1N7PM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4E2E3E5AFE60F4AA4105E736F429C70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28fa33a-6af8-4416-6d10-08d8b8b8ac54
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 18:17:37.6013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avA1CMMZKaICPZZKUQFw9rd2z/BEKMGDswaC6JWzjWa4cdJdO3lzhcM6aenlYez3UwpDz86f80BcjPl4TD9aCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3748
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+PiBAQCAtMjQ3Niw2ICsyNTA2LDE3IEBAIHN0YXRp
YyB2b2lkIGR3YzNfZ2FkZ2V0X3NldF9zcGVlZChzdHJ1Y3QgdXNiX2dhZGdldCAqZywNCj4+ICAJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+PiAgfQ0KPj4gIA0K
Pj4gK3N0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3NldF9zc3BfcmF0ZShzdHJ1Y3QgdXNiX2dhZGdl
dCAqZywNCj4+ICsJCQkJICAgICBlbnVtIHVzYl9zc3BfcmF0ZSByYXRlKQ0KPj4gK3sNCj4+ICsJ
c3RydWN0IGR3YzMJCSpkd2MgPSBnYWRnZXRfdG9fZHdjKGcpOw0KPj4gKwl1bnNpZ25lZCBsb25n
CQlmbGFnczsNCj4+ICsNCj4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3Mp
Ow0KPj4gKwlkd2MtPmdhZGdldF9zc3BfcmF0ZSA9IHJhdGU7DQo+PiArCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPj4gK30NCj4gaXQgd291bGQgYmUgYmVzdCB0
byBtYWtlIHRoaXMgcmV0dXJuIGEgdmFsdWUuIElmIHVkY19zZXRfc3NwX3JhdGUoKSBpcw0KPiBj
YWxsZWQgd2l0aCBpbnZhbGlkIHJhdGUsIFVEQyBjYW4gbm90aWZ5IGNvcmUuDQo+DQoNClRoZSBj
b3JlIHNob3VsZCBrbm93IHdoYXQgc3NwIHJhdGUgdGhlIGdhZGdldCBzdXBwb3J0cyB2aWEgdGhl
DQpnYWRnZXQtPm1heF9zc3BfcmF0ZSBjYXBhYmlsaXR5IGZpZWxkLiBBbnkgcmF0ZSBiZXlvbmQg
dGhhdCBpcyBpbnZhbGlkLg0KSXMgaXQgbmVjZXNzYXJ5IHRvIGhhdmUgYSByZXR1cm4gdmFsdWUg
aGVyZT8gVGhpcyB1c2VzIHRoZSBzYW1lIGxvZ2ljIGFzDQp1ZGNfc2V0X3NwZWVkKCkNCg0KQlIs
DQpUaGluaA0K
