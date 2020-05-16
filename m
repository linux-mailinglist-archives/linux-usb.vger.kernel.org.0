Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA511D5F25
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 08:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgEPGdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 May 2020 02:33:42 -0400
Received: from mail-eopbgr20085.outbound.protection.outlook.com ([40.107.2.85]:15334
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725803AbgEPGdl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 May 2020 02:33:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBbTzdwUvoz6rx7sby+j510aC+e36Tq/kkmjTsat0CLG/ZOfG/JXt8umSNL/s6FgapAIqTGsP2cFZEYAykvKqPgCX39uc//EA0Dg068j83KR54hf2IHzYDm0Ki9HOTCfSesU3RZy5CbQclk5F073Sq6yyhdA9rGT5C0+HWOlkLOsiy2L6PSuD9MjQDQ1BHWbw8DPh77cTXzL6H97bhH0DPpg4Ljgn2N/ZlxgwEgQkaCCILf5M3WqkqyViZRoNJ4f4H7NegBumo7KkZatnnw1B9c22iEvGTpVkUpWqyFgj2yJFOve3qjbVYUIoCn+TRYtVQyI/9rLMBCi9LmcoKd6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNZbRKpGpbw+91k0plcRMmdMU/57VZi/OpyMqY6aY2Q=;
 b=THavTQuCN/ZTS+qTDHvPm9wkVbylvyXXTNze/2a/ohHPGGWqp9PBV3Lh4urJHIRFWvpMstNUNckG56yKnM3Uscfq2VR+ciwn2u+Uc66x02eXMjIeXULqJvy9NUfnc2sCWsB3ND+Gtksqk2sx+oudK0bzkbgKhdVXhe3zQfWdbol0qwP/wHLF9ZYhHM7bISpHarU35AKeMCYliRMOeyAPALMdEv27Mc9rsw5oA3B+OquuS9rUdCm8HO3gC6myfjrbRDnNVlFfAyMrdd6jTEdSwSTqW5348ljTgY5B14M3LDJOpTq1Js+VhbsTcZqQ0KidROz83mD1KLl5Mz00KtSxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNZbRKpGpbw+91k0plcRMmdMU/57VZi/OpyMqY6aY2Q=;
 b=D8XLg8QjxXLEVboIr91236kJgBWif08Ty9efxWzujYJZAUPAeuCmRdLF5m+BWzfyKraw2GVoT5kYMRflqlWQ93++bx7kQ9zTtpKtisAX3pdbEw8ElKORYH8RvY+qID8nYzWYYefRZhOUycd5hwGcNanUiF3qk4gb7wtgUmiukAI=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6622.eurprd04.prod.outlook.com (2603:10a6:803:121::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Sat, 16 May
 2020 06:33:36 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3000.022; Sat, 16 May 2020
 06:33:36 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: usbmisc_imx: charger detection errors
Thread-Topic: usbmisc_imx: charger detection errors
Thread-Index: AQHWKv1KRkkKUYB0Ek+1137XmW5syKiqPm5A
Date:   Sat, 16 May 2020 06:33:35 +0000
Message-ID: <VE1PR04MB6528C12091A5B0BD2DA0E51A89BA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
In-Reply-To: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84423213-baa9-4e78-b8cc-08d7f9630fea
x-ms-traffictypediagnostic: VE1PR04MB6622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6622D3E5C2FA344C53F9791289BA0@VE1PR04MB6622.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 040513D301
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E7w3ur5L/nR/Is/DMQVC+W49Ze0CUtOc8sv70XhXg3LaYhkkCf4du2TK/3dbOEfq7lrlI/cZVDus5aS054qp8MkgzmSBazE766SFRtvrEcuSyIbVb55bUmsCBwreK546awKzbsXDJfldgfc9firLn0owumW82r3b5j5SkBHGJ6Rdw1cbQaiMKbQYuBLQvo6uwPdGKpBP4YOFoLWobYnrYzrLYW9kT1ILSaSYAsZR5lukGmOpBatyL4Jo4Go0b0EO5hRAXnWqEo0hd5Y9ADKuqSBze5aCJsxTtnfs5WJ5MC0mS6Pedy+mzew13tXSamHNUkpOAY9YovUnKneaThhAKnnGNw0Sj21qho1rsCs3761zDpMZsLFSgoTJQaGjxDR/DYPG13gXFPBiIxC/R8bUrmKRFm3X3cIg+1ioU9ZnT9IokP3BcUzf6AWiqnP9jXrq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(55016002)(66476007)(478600001)(44832011)(9686003)(7696005)(76116006)(8936002)(6506007)(4326008)(186003)(8676002)(26005)(66946007)(316002)(53546011)(5660300002)(6916009)(54906003)(64756008)(66446008)(4744005)(33656002)(66556008)(86362001)(52536014)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: m/ITNYvOKUg/k/lnpcttYErhHopluzMS8Ouq9+8VIlHBk7VM4scZHxcgro1jL16lULwrINKmKn3Y6zTIP4hMg78Yla3AHZrCRIJ0rMde+Sqm75JOUXgTde6PAYEprmX9znUQyZXUvXW23fYCRGHqHiWnIv0xE2CV+YxC7JJaO0P39DIkK9qRtqunNM7kW0hZHAWghpraJaOV3lJecrfNo2uPZMsBrmOSk+83e8BbaPJxq1psbkhu0KgEOSJUFtQC6tzgInnI+P0HYhJ19EdL8y5eS152V8LVyCsV1WlumnZYcRGdBB/jv7qQRg1FWwuufCeHAG2tbvHzFYGcr3Kz3piMxx+X8SKCWfkW9ii++Fbg020nopmilWn1Em0YwOqbj/W3g/URVRtUaMMMOSvNYX7/lCHygVkaHSs4aIMLBDjOccys22jgHhDr+xM4Ev7kZki+X2JUaBDsp00ryBXTxJv7PRVms8Qiy44rDbGAKhU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84423213-baa9-4e78-b8cc-08d7f9630fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2020 06:33:35.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xw8YaVRkaZjgtMz7JSpb8//QCE239KhBWwy7cz0M0hukmb9zj/Z2d9L1CWTtbLm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6622
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmFiaW8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPg0KPiBTZW50OiAyMDIw5bm0NeaciDE25pelIDU6
MTINCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiBQZXRlciBDaGVuIDxwZXRl
ci5jaGVuQG54cC5jb20+OyBVU0IgbGlzdCA8bGludXgtdXNiQHZnZXIua2VybmVsLm9yZz4NCj4g
U3ViamVjdDogdXNibWlzY19pbXg6IGNoYXJnZXIgZGV0ZWN0aW9uIGVycm9ycw0KPiANCj4gSGkg
TGkgSnVuLA0KPiANCj4gU2luY2UgY29tbWl0IDc0NmYzMTZiNzUzYSAoInVzYjogY2hpcGlkZWE6
IGludHJvZHVjZSBpbXg3ZCBVU0IgY2hhcmdlcg0KPiBkZXRlY3Rpb24iKSBpbiBsaW51eC1uZXh0
LCB0aGUgZm9sbG93aW5nIGVycm9yIGxvZyBpcyBzZWVuIG9uIGEgaW14N3Mtd2FycCBib2FyZDoN
Cj4gDQo+IFsgICAgNC45MTk4NDVdIHVzYm1pc2NfaW14IDMwYjEwMjAwLnVzYm1pc2M6IHZidXMg
aXMgZXJyb3INCg0KVGhpcyBpbmRpY2F0ZXMgdGhlIHZvbHRhZ2Ugb2YgVkJVUyBwYWQgaXMgYmVs
b3cgVkJVUyB2YWxpZCB0aHJlc2hvbGQoZGVmYXV0DQppcyA0Ljc1diksIGhvdyBpcyB2YnVzIGNv
bm5lY3RlZCBvbiB5b3VyIGlteDdzLXdhcnAgYm9hcmQ/IGlzIHRoZSB2YnVzIGNvbm5lY3RlZA0K
ZnJvbSBVU0IgY29ubmVjdG9yIHRvIHZidXMgcGFkIG9mIGlteDdzIFNvQz8NCg0KTGkgSnVuDQoN
Cj4gWyAgICA0LjkyNTE3M10gdXNibWlzY19pbXggMzBiMTAyMDAudXNibWlzYzogRXJyb3Igb2Nj
dXJzIGR1cmluZyBkZXRlY3Rpb246IC0yMg0KPiANCj4gV2hhdCBpcyB0aGUgcHJvcGVyIHdheSB0
byBhZGRyZXNzIHRoaXM/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBGYWJpbyBFc3RldmFtDQo=
