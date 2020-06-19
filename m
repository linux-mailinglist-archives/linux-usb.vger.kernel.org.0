Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C61200030
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 04:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgFSC2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 22:28:13 -0400
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com ([40.107.21.72]:61949
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728443AbgFSC2L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 22:28:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWejUCcTNgd1IoDKqYd+ne82na67wP0Yo1sd5ILqXkFiV+wHq0lGKPTG96CIU4bCcrnnO2Bv5kIZ6PcHBLnQNK3SgFYaIZL2vNeLCBiXzFOZDNRfO06/JI8DiRBdhcKyxMEicilCve2dvDLF2BHlinWbBlaPmPdloyyCJhv59hBYdIjaaWfawMCjmfod2KtuhqmquE3Vf1HhlGpPSRM+LtOsnYKKqfdBsYMF4S/IZ/5wNpd+kK7CH+36uToHdaAsKUGfFeoU/4UfaBzpTTd2u3VeepmXeyk/rSPumsXav2azYG3Sj68Gxf+BUNaH4Yho4nb6qSS+NKvGpWezolYUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ye5F20jInMqo46th0yQ+5nk+wfBIdpQ4qFFcfdzTL0=;
 b=f/ohCEHdwFK9JKz85MtvWNBhaxayKYLTOe2LY29VFwVUBJi983cwry4hVhPvEoWEYFTAKf17qV1W6SZp4Zeu9gdwpPFb4PuJNwsDoForuaV7PBK5uXD2V/FnQMFf9IxzSMAnUQ/eLmm0VxqsKFtPmeMEByYIjZ3nWU85hI0OY1TVQoVh2kh2KSqMdy8O4vdcMXZ9jJaj3DV0FaHDn/VQZEZ7LPoQBJ04GU3GJe4siNQ6BSDfekiItULIRqv20KutIQ3hQTEY4dLJk6omXnw5wYwF2kOQrMHcEwqGvC/JYqs7f5k5+XCFoWjCBeCdNWa5hRca02qG9qJ0Fx4Hb4NFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ye5F20jInMqo46th0yQ+5nk+wfBIdpQ4qFFcfdzTL0=;
 b=B1OJlLZBTRFthlqRQuEF7TEudGuUjUuoqBNP5dUiyprn6/NPyBMnI/8Y+RATWDFybxt4HDSBXs7QhWzqHwedE2PwssQTaHb1Fnl/40wVddtLK1d5ZQrG5cC/wBpgrKvu+6xWyfAbNtLOIFRPRPSRevP5RpTHmH30jtqf9z3WXmA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6935.eurprd04.prod.outlook.com (2603:10a6:20b:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 02:28:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 02:28:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Marc Carino <marc@syng.la>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Behavior of USB controller when receiving isochronous transfers
 with CRC errors
Thread-Topic: Behavior of USB controller when receiving isochronous transfers
 with CRC errors
Thread-Index: AQHWRa5zv2wNMQqjBEu5D3TdX4scQajfN0cA
Date:   Fri, 19 Jun 2020 02:28:08 +0000
Message-ID: <20200619022830.GA8096@b29397-desktop>
References: <A95C723F-F3D5-47BA-8694-3042ACE1ED1F@syng.la>
In-Reply-To: <A95C723F-F3D5-47BA-8694-3042ACE1ED1F@syng.la>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: syng.la; dkim=none (message not signed)
 header.d=none;syng.la; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 89c47c66-269f-4423-0a4b-08d813f867a2
x-ms-traffictypediagnostic: AM7PR04MB6935:
x-microsoft-antispam-prvs: <AM7PR04MB693589EF8F683074B569F1508B980@AM7PR04MB6935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mu53yEUOPxSvppHLfPO/0XTWzRBeeLXO7jo5lEJ1izrq6NQsxECYMBcAdFru/H2+uEu3Lv2HNPVhSKpoFlk9BRyAWCnz4q77M08u/ky+wmg32HHK68b7+e05A5x1Ui4dxV96p2Q3sIoY7b4qshccJxjOP4jHooWtmUJFUQJ7FA7zV01nhR3dCNYzj3br1Mc0FtkKvQVAvxkCT4V9S+SM89UWfA4p3TUkIIy63w+5zG0SoUPsywzQWyp8i0ffJNbayHdy6ck8enFHud2Y5HS38xBJld/7VvWWayptJ5+LswR3UvgBLojH63FV8D903IovJLL2V/WPUn3TuNYkCO1v2SJGnEk5jNqSFcEoSsFpZC3DhFCkcT4jhlENvzCRrcIkBbLVz2Op5E1MMlbvF59ciw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(26005)(6506007)(6916009)(53546011)(66446008)(83380400001)(86362001)(4326008)(64756008)(66476007)(316002)(2906002)(966005)(33716001)(66556008)(9686003)(44832011)(6512007)(1076003)(33656002)(71200400001)(186003)(8676002)(76116006)(66946007)(5660300002)(91956017)(8936002)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: K2LbRTbkMNhivZb3oWg3Xq2Suj5OA6geirES9mWPq02hh57oagk1pyBunrYWy5I+BKz0BQSg9Uda2XvfsIUEz5cyJXItwa6yhfH+6wyoLHyss1BkYzAIyll54zK/V3E9OdWGR+u7J5nEDfmkEsTIz6SLjgFQBbw4KvOCG78qyoji4n8SprEqFZZFpDaLPRWoRIik16LTF87ZMZ05bhETp64SXM4byYWThJ3DuoY3TFkZh6zQ0Lty/hcMpEWdSZCwNDMPkya5MQMQ7YjoO6CsIK29tuYdCndsqAwxdQIVZ5dn2QlvWdNdfOwwAt8/CAq45C8M9J56KUbSOOKjIh17CrveGqZjd7iuQKyshdEye9wsx0isK5fPPB5oYwVmtHGzvclFGb+cm9UZG8EcZnvznvaK5+UmJeFuSytOjnAlfNAFSECwnUxgV2gx+1vR/yTKXg+aZDoTUK0SuuVDHYe5/K8zrDCa2AfJOnuGbXBShhk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D627DA189F946C48A6247C1E54DFC396@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c47c66-269f-4423-0a4b-08d813f867a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 02:28:08.3399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/EneShO8mECgeyGOf5KC7iTvxTnSzGs/KpCEiAKJm5R4a6rg18YJnCCGnpa+W38xcjqJ8IaMDCFeTPyZPne/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6935
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMDYtMTggMjA6MjQ6MTcsIE1hcmMgQ2FyaW5vIHdyb3RlOg0KPiBIaSBQZXRlciwNCj4g
DQo+IEkgbm90aWNlZCB5b3VyIGV4dGVuc2l2ZSBjb21taXRzIGluIHRoZSBtYWlubGluZSBmb3Ig
dGhlIGNoaXBpZGVhIFVTQiBjb250cm9sbGVyLiBJIG11c3Qgc2F5IHlvdeKAmXZlIGRvbmUgcXVp
dGUgYSBiaXQgb2YgZ29vZCB3b3JrIC0gdGhhbmsgeW91IGZvciBjb250cmlidXRpbmcgaXQgYWxs
IHRvIHRoZSBjb21tdW5pdHkhDQo+IA0KPiBUaGF0IHNhaWQsIEkgaGFkIGEgcXVlc3Rpb24gYWJv
dXQgdGhlIFVTQiBjb250cm9sbGVyIGl0c2VsZi4gSeKAmW0gdXNpbmcgYW4gTlhQIGkuTVg4TSBN
aW5pIGFuZCBVU0IgZ2FkZ2V0IG1vZGUgKFVBQzIuMCwgZl91YWMyKS4gV2UgaGF2ZSBhIGN1c3Rv
bSBib2FyZCB3aGljaCBuZWVkcyBzb21lIHNpZ25hbCBpbnRlZ3JpdHkgd29yay4gVGhhdCBzYWlk
LCB3ZSBhcmUgZXhwZWN0aW5nIHRvIHNlZSBzcHVyaW91cyBDUkMgZXJyb3JzIG9uIFVTQi4NCj4g
DQo+IEZyb20gd2hhdCBJIGN1cnJlbnRseSBrbm93IGFib3V0IHRoZSBjb250cm9sbGVyIGl0IHNl
ZW1zIHRvIHByb3Blcmx5IGhhbmRsZSB0aGUgQ1JDIGluIGhhcmR3YXJlIGJ5IHNldHRpbmcgdGhl
IGFwcHJvcHJpYXRlIGJpdCBpbiB0aGUgVEQgWzFdLiBJbiBvdXIgYXBwbGljYXRpb24gd2UgY2Fu
IGFjY2VwdCB0aGUgQ1JDIGZhaWx1cmUgYW5kIGtlZXAgZ29pbiwgc2luY2UgaXTigJlzIGV4cGVj
dGVkIHRoYXQgaXNvY2hyb25vdXMgdHJhbnNmZXJzIGNhbiBoYXZlIGVycm9ycyBhbmQgc2hvdWxk
IGtlZXAgb24gY29taW5nLg0KPiANCg0KRG8geW91IHJlYWxseSBzZWUgdGhlIGVycm9yIGJpdCBp
cyBzZXQgYXQgZFREIHN0YXR1cyBlbnRyeT8gV2hpY2ggYml0LA0KaXQgaXMgSU4gb3IgT1VUIHRy
YW5zZmVyPw0KDQo+IFRoYXQgc2FpZCwgaXMgdGhlcmUgYSBnb29kIHdheSB0byBjaGFuZ2UgX2hh
cmR3YXJlX2RlcXVldWUgdG8gbGV0IGl0IGtlZXAgcHJvY2Vzc2luZyB0aGUgVERzIGlmIHRoZXni
gJlyZSBmb3IgaXNvY2hyb25vdXMgdHJhbnNmZXJzPyBPciwgZG8geW91IHRoaW5rIHdlIG5lZWQg
dG8gdXNlIGEg4oCcYmlnIGhhbW1lcuKAnSBhcHByb2FjaCwgcmVzZXQgZXZlcnl0aGluZywgYW5k
IHJlc3RhcnQgdGhlIHRyYW5zZmVycz8gSSB3b3VsZCBtdWNoIHByZWZlciB0aGUgZm9ybWVyIGJl
Y2F1c2UgaXQgbWluaW1pemVzIHRoZSBhbW91bnQgb2YgdGltZSBhbmQgYWxsb3dzIHVzIHRvIG1h
c2sgdGhlIGdsaXRjaC4gT24gdGhhdCBzYW1lIHZlaW4gcGVyaGFwcyB3ZSBzaG91bGQgaGF2ZSBh
IGNvdW50ZXIgZm9yIHRoZSBudW1iZXIgb2YgdGltZXMgdGhpcyBvY2N1cnMsIGp1c3QgZm9yIGRl
YnVnZ2luZyByZWFzb25zLg0KPiANCg0KSWYgdGhlIGVycm9yIGJpdCBpcyBzZXQsIHRoZSBjb250
cm9sbGVyIGRyaXZlciByZXR1cm5zIHRoZSBlcnJvciB2YWx1ZSwgaXQgZGVwZW5kcyBvbiBnYWRn
ZXQNCmRyaXZlciBpZiBpdCBzdG9wcyB0aGUgb25nb2luZyB0cmFuc2ZlciBvciBub3QuDQoNClBl
dGVyDQoNCj4gQW55IGFkdmljZSBpcyBncmVhdGx5IGFwcHJlY2lhdGVkLg0KPiANCj4gVGhhbmtz
LA0KPiBNYXJjDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy91c2IvY2hpcGlkZWEv
dWRjLmM/aD12NS44LXJjMSNuNjgwPGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2Nt
JTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRnRyZWUlMkZk
cml2ZXJzJTJGdXNiJTJGY2hpcGlkZWElMkZ1ZGMuYyUzRmglM0R2NS44LXJjMSUyM242ODAmZGF0
YT0wMiU3QzAxJTdDcGV0ZXIuY2hlbiU0MG54cC5jb20lN0NhZjE0M2Y2OTM4ZDQ0M2I4NzRhODA4
ZDgxM2M1OTUwMyU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzElN0M2
MzcyODEwODY2MTE2MDEzMjkmc2RhdGE9ciUyQkE5dEJ5aHhpUyUyQnklMkZDdjQyaHVvTHBzeXZ4
N2ZDRjZocHNrTnFOOFV0NCUzRCZyZXNlcnZlZD0wPg0KPiANCj4gVGhlIGNvbnRlbnRzIG9mIHRo
aXMgbWVzc2FnZSBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kIHByb3ByaWV0YXJ5IGluZm9y
bWF0aW9uIG9mIHRoZSBzZW5kZXIuIEl0cyBjb250ZW50cyBhcmUgb25seSBpbnRlbmRlZCB0byBi
ZSBzaGFyZWQgd2l0aCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IGFuZCB1c2VkIG9ubHkgZm9yIHRo
ZSBsaW1pdGVkIHB1cnBvc2VzIG9mIHRoZSB1bmRlcmx5aW5nIGNvbW11bmljYXRpb24gY29uc2lz
dGVudCB3aXRoIHRoZSBzZXJ2aWNlcyByZW5kZXJlZCBvciBvdGhlciBjb250cmFjdHVhbCByZWxh
dGlvbnNoaXAgYmV0d2VlbiB0aGUgcGFydGllcy4gUmVjaXBpZW50IGFncmVlcyBub3QgdG8gcmUt
Y2lyY3VsYXRlIG9yIHNoYXJlIHRoaXMgY29tbXVuaWNhdGlvbiBvciBpdHMgY29udGVudHMgd2l0
aCBhbnkgdGhpcmQgcGFydHkgd2l0aG91dCBTZW5kZXLigJlzIHByaW9yIGFwcHJvdmFsIG9yIHVz
ZSBpdCBpbiBhbnkgbWFubmVyIGluY29uc2lzdGVudCB3aXRoIHRoZSBpbnRlbmRlZCBwdXJwb3Nl
IG9mIHRoZSB1bmRlcmx5aW5nIGNvbW11bmljYXRpb24uIFJlY2lwaWVudCBhbHNvIGFncmVlcyB0
byB0YWtlIGFsbCByZWFzb25hYmxlIG1lYXN1cmVzIHRvIHByb3RlY3QgdGhlIHNlY3JlY3kgb2Yg
YW5kIGF2b2lkIGRpc2Nsb3N1cmUgYW5kIHVuYXV0aG9yaXplZCB1c2Ugb2YgYW55IGNvbmZpZGVu
dGlhbCBvciBwcm9wcmlldGFyeSBJbmZvcm1hdGlvbiBvZiB0aGUgc2VuZGVyIGNvbnRhaW5lZCBp
biB0aGlzIG9yIGFueSBvdGhlciBjb21tdW5pY2F0aW9uLiBUbyB0aGUgZXh0ZW50IHJlY2lwaWVu
dCBpcyB1bmFibGUgb3IgdW53aWxsaW5nIHRvIGFiaWRlIGJ5IHRoZXNlIHRlcm1zIGFuZCBjb25k
aXRpb25zLCBoZSBvciBzaGUgc2hvdWxkIHJldHVybiB0aGlzIGNvcnJlc3BvbmRlbmNlIGltbWVk
aWF0ZWx5LCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuDQoNCi0tIA0KDQpUaGFua3MsDQpQZXRlciBD
aGVu
