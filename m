Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34DC1DFD8C
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 09:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgEXHkW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 03:40:22 -0400
Received: from mail-eopbgr130071.outbound.protection.outlook.com ([40.107.13.71]:39090
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgEXHkV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 03:40:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1lBsPsybxMROrG5Kc6AvMJMusdtbZYYAHymsyQWpxidazmPDuQ3vK81oA76AFhJFlaX11qFm60wkf0M6pKOFniqchY6B7oPBafAJLOqO/80tALaZBGmYQV1jwzGT96yHmNuKVfGkVfudLf+4PLct07pRxf6anZbRmNhu0DWtt7ZS357fg8ZU3EsCtHBrKpiPBLNwa92u809+wbfIyETmaHjtjLEMCLXgwXc7i5t8Ii9lYZc+Q1zDToDHrMIvL/V7jq1ewobTg4JfUGnNZR6647a7n8OyniDTemb2vIOfBZMNCE8BdV8nw8pCRzEpoIUeta3VsWubcskIwKjmPqGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4TVDl4nMYkR5JlzrKw0Be05xYiYYF55yrKFWoHQwpI=;
 b=KWkkDIkKvADpD0G9x7t8Caev5jYAxvsFjhlJRy+Xp/rRJSN+oksDqn2AkH9wcFHI5NqGKhZXQRoaLKFEEjS7ZpjLxJAvtXQb8Ill7FI4DbHvuJ8nIkPyPzpxyElmH7j79dNZPNOY0w++LlNAmbSkL81LMgY5S7+HmpCtKN3UCXaDg4IX2b8kPQ4qiBH1iPHpbh2l9s1KWJzTwIozoGaTV5NPK0Kuy3baqDeAobYexNZhnDOXwzKiFkOf6EeYSvnEUDjpCBqGy5/2a9cO/4mI0h2+imnj86RWFdNe3/7IKuYFNq9uexyc28jXKFD+3KjMlNyCvDS4C90VHd2ItAfRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4TVDl4nMYkR5JlzrKw0Be05xYiYYF55yrKFWoHQwpI=;
 b=WEzTkbHCfUD8UNiiJrY7xIIi5+GwjW+kXDs6n1LYkWWBDpzd8R6TgiCmPn0sK9CI1VohDcoabaKksU6a+dUy2Eya868428ty05UmmOA7BSzVZrJbBPcnf3UevsUUx4sS0u6wBXsk0PNIHTH3hmKcLie61i6yI0+uQIHUfqk8+yc=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6736.eurprd04.prod.outlook.com (2603:10a6:803:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sun, 24 May
 2020 07:40:16 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3021.027; Sun, 24 May 2020
 07:40:16 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 6/9] usb: host: xhci-plat: delete the unnecessary code
Thread-Topic: [PATCH v2 6/9] usb: host: xhci-plat: delete the unnecessary code
Thread-Index: AQHWMVkfOGgmMmsQtkOcIVKxvmXu36i22jkA
Date:   Sun, 24 May 2020 07:40:16 +0000
Message-ID: <VE1PR04MB65288460CCEBCD9B42C83BAB89B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-7-peter.chen@nxp.com>
In-Reply-To: <20200523232304.23976-7-peter.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b69bfa55-61de-42c7-3d7b-08d7ffb5b3b5
x-ms-traffictypediagnostic: VE1PR04MB6736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6736EDEB8C009F96A7308FFB89B20@VE1PR04MB6736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0413C9F1ED
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1yhM2jjgWfqOpvH9bVMgSFmaWxMK/ufoFPQCPbd0OHj27cwsxU/1I06d2f4Iuseit6XKE3DBnUNFrfjemY3amgdCidyH3jSJWUMNT0sEOpgM4KqY26a8vjM9bMus0ox3hCx6/2Rj0giz5tDDDiwN6ZvbQ3go5NfJtb1HW4l6RzBhD8dfXgRbSBanzc4p+M4R3Timi1yd6uss7EhSahXBBTAnxcRzuHFZdbQT7p3S/OKIrqWSDHIXB4t7QZ786i1KW4OaLKGlSe/FhgSIx+XwqvnCZZopeM6j9+wjGIRseVUsPN+R8VdveMokSCcqvEi/nO7TecvONc9B4gAShotCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(478600001)(64756008)(76116006)(66556008)(66446008)(9686003)(55016002)(66476007)(4326008)(66946007)(54906003)(7696005)(316002)(26005)(53546011)(186003)(6506007)(8676002)(71200400001)(110136005)(8936002)(52536014)(33656002)(5660300002)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KFNt58Hm+cBt2MHacj7i6UD2i3iApIq7E2YxYps4Dzgxskp2h1iXEyxaDl473fKK9tsQZVFLZ+5vTa37xqzpjzIR2DJmdnMPR1wssbybbBwj+G2lUARwEtocaW6utAaEhqn5PGqBdT/mvsURJN5rfQyVUh71b3Ez11zSTFfyButbZMacM8B2AiCcc7VLVRBdSX55cIxTjgSOmsrugdv4iAa1HHnWL7cQmReG/qXiXfhGgkew8ja7eTojWrT4odOuV0KB4If2MEa7nvpwqoRnWRMjZ7sGgroZ3q+HWnMg9wijKKMFtcK5y/WGG4yYobBbM+5//V/8aUNq7E4T1h80kGuBEHHjJauJ6HpvB+2eQ8nFr0oOTBVMLk57npBhN8ErDHiHaHLlH9ojREjITj9bfN8oTIwBaYye8pXL2hLZA0xnrO6EXqPNcURXNQt4smmUzkj0S5V3puS8OyyhZ7LWgsIjL0aJhIJyt+qr4ztJKMg=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69bfa55-61de-42c7-3d7b-08d7ffb5b3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2020 07:40:16.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrLMK3NWThSdLcRqeRUISOzUdmXVtgAiAfxEAriMimfR1hWV8CSKLF/Salb7lkcv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6736
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ2hlbiA8cGV0
ZXIuY2hlbkBueHAuY29tPg0KPiBTZW50OiAyMDIwxOo11MIyNMjVIDc6MjMNCj4gVG86IGJhbGJp
QGtlcm5lbC5vcmc7IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+IENjOiBsaW51eC11c2JAdmdl
ci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gcGF3ZWxs
QGNhZGVuY2UuY29tOyByb2dlcnFAdGkuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsg
SnVuIExpDQo+IDxqdW4ubGlAbnhwLmNvbT47IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDYvOV0gdXNiOiBob3N0OiB4aGNpLXBsYXQ6IGRlbGV0
ZSB0aGUgdW5uZWNlc3NhcnkgY29kZQ0KPiANCj4gVGhlIGlmIHt9IGNvbmRpdGlvbiBpcyBkdXBs
aWNhdGVkIHdpdGggb3V0ZXIgaWYge30gY29uZGl0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVuIExpIDxq
dW4ubGlAbnhwLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMg
fCAzICstLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIGluZGV4DQo+IDUxZTIwNDY0ZmUwYS4uMDNkNmJiZTUx
OTE5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gQEAgLTI4Myw4ICsyODMsNyBAQCBzdGF0
aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CQlzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYgKnByaXYgPSBoY2RfdG9feGhjaV9wcml2KGhjZCk7DQo+
IA0KPiAgCQkvKiBKdXN0IGNvcHkgZGF0YSBmb3Igbm93ICovDQo+IC0JCWlmIChwcml2X21hdGNo
KQ0KPiAtCQkJKnByaXYgPSAqcHJpdl9tYXRjaDsNCj4gKwkJKnByaXYgPSAqcHJpdl9tYXRjaDsN
Cj4gIAl9DQo+IA0KPiAgCWRldmljZV93YWtldXBfZW5hYmxlKGhjZC0+c2VsZi5jb250cm9sbGVy
KTsNCj4gLS0NCj4gMi4xNy4xDQoNCg==
