Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFE620DFD9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 23:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbgF2UkO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 16:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731711AbgF2TOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:14:12 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDE8C0068B0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 04:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWAXFSMU/mPkbvtp5Cm+CPz4MK4XWVCxtJuefggfK9yz8uY+GC4pLgf39IjtjHW5f4WSo3TAVlFaW3+II2lUNBL73jWBjEU7Xp3nH7CBYv4mu/UFJrSNds35uaq1BEnn4NMUmggnzt+4q+WfQe09fp1enjPQesVLLh/TZKSxEB5ZzUeNRqq5DMdPNjDimDqdRsSiRAtHg5XYnRrrBK0uNMtJzHBDipDSV99owdRc/ghqQLNsqxN29Gt0dbUmQeHruK59UNpaJGMSmMDwdd79mXCNmw8ui6RJHYO7s4c/rm+SzPUDLcHxrQ6/ww0xSrAn1TfqKLNjGaToa/jyCF2skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIW6aNegH+SuyRQ8azYVFeTgYcabYtXJndYVbcX6MQM=;
 b=E/OdoTjLv3adGl+5W01EYmU3UBz6Md+QoeiUZgG0v4o8X2HV06ny/D3SFuHEx5g1drLdc+D7nmu5kost/Z5QiZaYRvOAWzPqXORdg8Xm7UYdNkaoiVICBNo/yubZbnNaL+gY6hfFrOpwH2fpnAQJozAks3pcdUQFKDk9zJbxH+6ODEwYHNTAkVrIpOhUIUtm10cyYc89xgJvkBSHsba062Yn73OwbFOO56ZhdRDqj2NwCN6pAXvpD0WDa/7Puf7oA1gkraBZMP0t5y+Rm7Ax0pHy0N/BwOh3imVgdzEh47NNFxLfMY5rAjcN+lL6zjHj81GWZyaas3n6yVbLbxpprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIW6aNegH+SuyRQ8azYVFeTgYcabYtXJndYVbcX6MQM=;
 b=Lo1yLo1NrKYn8ng9WGTSTGme8VuekmYGFu8UromSPsVvbu1WDSsnWY5dPOL92L34IZ3aI4wH/Hkj2XcfPJqXRze7o49gdPX68DaspH+XTEPa/5xenkdpxPT7qDKY9swP/gBnczDHo4GwjnUCIqBlco9E0jQWCJSxCdef2hZ5eD0=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR1001MB2077.namprd10.prod.outlook.com
 (2603:10b6:301:36::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 11:48:20 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 11:48:20 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "peter.chen@nxp.com" <peter.chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: "usb: gadget: core: sync interrupt before unbind the udc"
 question
Thread-Topic: "usb: gadget: core: sync interrupt before unbind the udc"
 question
Thread-Index: AQHWTfxUURogi5P0F06kOiJScuWkHajvdzDQgAADNIA=
Date:   Mon, 29 Jun 2020 11:48:19 +0000
Message-ID: <8968a345994bca4f1835804ff6e802ccf15826a0.camel@infinera.com>
References: <3cbe4bf7fd4a152e600ecb1b85b8a24ad5aacc55.camel@infinera.com>
         <AM7PR04MB7157E127429188EFDF829EAC8B6E0@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7157E127429188EFDF829EAC8B6E0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6c5d330-aa91-4cca-8ecc-08d81c2251d2
x-ms-traffictypediagnostic: MWHPR1001MB2077:
x-microsoft-antispam-prvs: <MWHPR1001MB20772D3D48EAAAF1D1B34E2DF46E0@MWHPR1001MB2077.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FZqj1RRiYDCYNtBHcEZV+804aOcbD/Qx2PNcMnimNnj48igLFDVqd/XFty5fupHuXiMzOFlaTxbs5Qgnp48AgN9/5ryBYCSM1Yo0ELBVVAJc8bBKhuY2vGYl0lDbW/+RlIZBxMq1WSkYIsATFzM+quq5/UoHiyVX379e/jZZEBfUpMHbuLpASm7GGJGc76aLScfHN+DT6uD6tsj52KSxRVU+Bn7gExbeD7NVMK1lNzcX8+YdFsMQE/KUnLlKMqKtdxUumLLHsBGLYzukIEE5/CWHgRN1VcifVEvtZV7xjIj15EXmp1pNNxd4r+iMBMmBp+PHntE77cxVkZTLJ/9xNtHE1hQUZpor/ZYDxiVUe2IKU9KfePCS1EFkFEWJR5ZV2FdEZw95J44JIwYYyFRnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2190.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39850400004)(45080400002)(5660300002)(66946007)(86362001)(6506007)(91956017)(76116006)(6512007)(26005)(36756003)(66476007)(66556008)(6486002)(64756008)(186003)(66446008)(2906002)(2616005)(316002)(6916009)(478600001)(8936002)(966005)(71200400001)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: x/BekuT3sWbH/yPJW2r2TcHyjXCwT9PKr1b+wgfHx5tOXS3JXh67uyNxVbRSi6AD+iTL/YXQtlTmKPQuCynRiDyaXkyIOwYpJFv4eV/NCdB2XXBC4lI9q+lejscXcPf4VMfoNGLHUBSRJ+rF8VGxe+4K4iXP5rDVleLHXFKGNcKEh/rshNzyV8qo5A/E7FILhfvblU2On8/FwtidiH5B7NttS1y5lTUJJxh4OW6/hBJsvvTWeiZi9aReDlCVe4BJP9B7iToTtbSqYBnNStt1PYLGsGGKW1N2Pyh4NvcaKSeyF1peuc7xkssm4JO3Q0FAz85l+qSqLbMUqmqD0IioTdIRly+mAhunQj15T+oaqqgsyvd5zHrbSY38OgELKNfRnQhAJTmHXbi5HXEvCvfVoe3cCWg1RUKn9kCn2RqRtML/A8yWlXW8agMiLN46FPgzm39AeoPok/FzX5i68DslKeD0vBu84OllrpU0RgZ5pzA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DADEAC910C636438D67020A56C558DF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2190.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c5d330-aa91-4cca-8ecc-08d81c2251d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 11:48:19.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlb/1V5qMjdOuRZh+2wzRluINtKmw0NMDLTPVlvSuhVcLn+OsOMLh3JzBfGPOkeL+RE6gm1bXyfuVhiPqeoiiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA2LTI5IGF0IDExOjM3ICswMDAwLCBQZXRlciBDaGVuIHdyb3RlOg0KPiBD
QVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6
YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiA+IEluDQo+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmcNCj4gPiAlMkZwdWIlMkZzY20l
MkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnN0YWJsZSUyRmxpbnV4LmdpdCUyRmNvbW1pdCUyRg0K
PiA+ICUzRmglM0RsaW51eC0NCj4gPiA1LjQueSUyNmlkJTNEODA1YmFlNzU5MmZhMmNmZWRlODk4
YjI0ZTJhOGQ4NWZkZDYzMTdlZSZhbXA7ZGF0YT0wMiU3Qw0KPiA+IDAxJTdDcGV0ZXIuY2hlbiU0
MG54cC5jb20lN0M3NTUxNjRhZjRjMGQ0NDdjYmY3OTA4ZDgxYzEzNzkwNCU3QzY4NmUNCj4gPiBh
MWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcyOTAyMTcyNDA3MzQ3NDYm
YW1wO3NkYXQNCj4gPiBhPVNMTkhSQ2dod0lZRk94TTZROVFlY3lNdlg5QXpVTmZoZmtNR0dNUksz
NFElM0QmYW1wO3Jlc2VydmVkDQo+ID4gPTANCj4gPiANCj4gPiBZb3UgYWRkIGFuICJpbnQgaXJx
IiBmaWVsZCBidXQgSSBkb24ndCBzZWUgYW55dGhpbmcgc2V0dGluZyB0aGlzIGZpZWxkLCBzb21l
dGhpbmcNCj4gPiBtaXNzaW5nPw0KPiA+IA0KPiANCj4gaHR0cHM6Ly9uYW0wMy5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmcl
MkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRm5leHQlMkZsaW51eC1uZXh0Lmdp
dCUyRmNvbW1pdCUyRiUzRmlkJTNENzdmMzBmZjQ5NzYxYWNiYjNkOTBhY2EwMDA0ZjM5M2ZkODFi
NjNhOCZhbXA7ZGF0YT0wMiU3QzAxJTdDSm9ha2ltLlRqZXJubHVuZCU0MGluZmluZXJhLmNvbSU3
QzBhYjQ3N2E1MWI1NzQ2MWNmYzAxMDhkODFjMjBlMDkzJTdDMjg1NjQzZGU1ZjViNGIwM2ExNTMw
YWUyZGM4YWFmNzclN0MxJTdDMCU3QzYzNzI5MDI3NDgxNjU2OTMwNCZhbXA7c2RhdGE9eTM0eiUy
QkZERzg2elEzckJWUmJMekRlSW1NTG1Uclppbmc5Um9vTzNRUzNZJTNEJmFtcDtyZXNlcnZlZD0w
DQo+IA0KPiBQZXRlcg0KDQpPSywgYnV0IHRoYXQgaXMgbm90IGluIHN0YWJsZT8geWV0Pw0KDQog
Sm9ja2UNCg==
