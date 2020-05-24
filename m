Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C151DFD76
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 08:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgEXGnM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 02:43:12 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:40508
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgEXGnM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 02:43:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN+yNhLE8/TBKwty/wiPp+ZkhFCpJLhRdMio8XwksHiBO/h63jbcE4cv3Z4H+vzljA/oU4HCtWYUhE3rr8bZE0weqHuOSFAvClLEpXmOWVaqxRyFJkm+vYADxFjCvENKgybpccTqb05YfqUWEK6MOp3ynaedprEgWNLEciCPcfeMq9Tcsx4cTu8TVd4iutyZin1ujIlE8eq60/KWJLr5oWynLRbz7c5sYd4rle1xocd4ht3IzRE7Zw/e1ynghLEiFxlLZn+NEIlFm9mmk8n/FBHibCCGYJgHkkEhRhp/dmjrTjeSFXtSVWcPFAxo0fUKJKipgJW1Vi7B+4JxErHWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI9AjEtMnZZrNSzGReZCo9xqYEIZbXyxzmqXNVQREOU=;
 b=eKWsxsBEYkf0S6g5qkNoDh46+yHbMuuvcDe4w7Z3c/5rcSjQROw+dMJAOrjXJEaMXFo9ZP+P6DOCgyOJaV7gAQjvS4hKJYFDbgoCqSnXPSfs7/TvCoSfI4AgVybOKvHqpzRbP0rBAHN5CVrnQYUr+FIzzlCsWORE1wvR4KNnOqbj3HraxjaVhBxsRXqcgiRIteUlQlts1JBK6MPy2F9ifi64+6bpLAiAZjbbP9u/kAzcRC1vPC0Tw4NxyuukzsWqaFS+jRwxYILgTlHlKiIGyHpl9l4JiS7FdrfOeF7pt0DL+tjtWEEze/BupQvuq66dhfkOI1G6+tz2G6qFndJd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI9AjEtMnZZrNSzGReZCo9xqYEIZbXyxzmqXNVQREOU=;
 b=Em94GFZ7mDofQY8hCNlq5SQvoYmlocmxvpx7nV/7LSMHWNXkjZuzkSGbdhWuzyLu/uBMXaXapntAECT9gZPhFf5SVvGkbktgaGmLx+AUNXGDbaeQ0ZjoPv2gdUWrDi00ZLQiO8VKKWsEwbebiH8DR4OEe6wnFJk+z+IUi2z05sc=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Sun, 24 May
 2020 06:43:06 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3021.027; Sun, 24 May 2020
 06:43:05 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 2/9] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v2 2/9] usb: cdns3: add runtime PM support
Thread-Index: AQHWMVkYJ51mljbS20inAt8JnOkvaai2f5LwgABJ87A=
Date:   Sun, 24 May 2020 06:43:05 +0000
Message-ID: <VE1PR04MB6528D2CCF7DFAF2554CC57B989B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-3-peter.chen@nxp.com>
 <VE1PR04MB652836D56801C440F3E3928689B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB652836D56801C440F3E3928689B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b59afe7c-9151-4986-bad0-08d7ffadb6ec
x-ms-traffictypediagnostic: VE1PR04MB6349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6349928F1C3BB34BFEE8191E89B20@VE1PR04MB6349.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0413C9F1ED
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: onTddmcfx+KxgfnDmZj4hfb1kWB8SjNpczEtoPL8tZZg3fa5XrAQnqm7quy2OVRJoGTzoHin6Kq986tVDvc/kM6miFuYhVlLLMaHc0knf+lIVZeDrb5Z6xTAsW42bC9ZWg28qSjtVLjPr7iJyc/ZS80QrOAw4s/WADNtLsoxGIhuOrHC6S5RXh4owzPisH4DofrFugmhghilRSWSykFyY7ardvBs9IQYYtLJw+bEDbzDnwCLXFcSYwSp2AUZwcd/DzDsjnOAzN+XNCr2CBhL9DP3R/qKCrdh0VmmffPXfYMpqo8NXaxcaeXu+xMVgnr2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(2906002)(76116006)(66946007)(52536014)(66556008)(66476007)(66446008)(64756008)(478600001)(2940100002)(9686003)(4326008)(55016002)(86362001)(44832011)(33656002)(71200400001)(5660300002)(53546011)(54906003)(316002)(7696005)(6506007)(186003)(26005)(110136005)(4744005)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fxxP/gVmZC9HEQO44f3NBwdSQ6u5fFLx2p5okvfmTmQuDXEP01tQf0PwjZcyqf12lDAPm7JhUsbv9YcjtQnMeXzgv8C6X0I8ZmEZJ+IUNr/RWs/dC8uClGKChcNcjnTAtgWntsWt/1yO5u2bRxzeM01AnQT1ANJuAL6XAbeGRXcEZ9g13otd5ydst75nSbN64+8tqbLmVCGTNYBYHP4ABaO7xmAz9ZRbCxCFrmSaafSMznHAjVSf1dkYN//vBJOdKcRA7JWD2rrxFd0ATWwD+PWAQ9JH/9K1z9e4g2I3hRNqy3z9u4jL8woiKG+DiZo8da8C+pzrkSOU6Guk8a5W61dAqMgf1oyUTZrIRtIZp/Y7ExRril+Olfyc3r6WBwv3RkhdeyR/aEZrlWlV26nIz/+bypP6s1mfAuQiSBaLrzu9N8g/1KOwUiZGMOh9P0rxbeJHvtkK3UT5xzuGmLI10B+7F4oRAYMpN9LS6Z512UM=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59afe7c-9151-4986-bad0-08d7ffadb6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2020 06:43:05.8607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zzim+PjxIQIrzB6tOUMpEHoEabWGICmiYul0nhQF0E4qDLYbVD+SAtyoluXRNFTh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVuIExpIDxqdW4ubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyMMTqNdTCMjTI1SAxMzo1OA0KPiBUbzogUGV0ZXIgQ2hlbiA8
cGV0ZXIuY2hlbkBueHAuY29tPjsgYmFsYmlAa2VybmVsLm9yZzsgbWF0aGlhcy5ueW1hbkBpbnRl
bC5jb20NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGlu
dXgtaW14QG54cC5jb20+Ow0KPiBwYXdlbGxAY2FkZW5jZS5jb207IHJvZ2VycUB0aS5jb207IGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMi85XSB1
c2I6IGNkbnMzOiBhZGQgcnVudGltZSBQTSBzdXBwb3J0DQouLi4NCg0KPiA+ICtzdGF0aWMgaW50
IGNkbnMzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgY2RuczMg
KmNkbnMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+ID4gKw0KPiA+ICsJaWYgKHBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZChkZXYpKQ0KPiA+
ICsJCXBtX3J1bnRpbWVfcmVzdW1lKGRldik7DQo+ID4gKw0KPiA+ICsJaWYgKGNkbnMtPnJvbGVz
W2NkbnMtPnJvbGVdLT5zdXNwZW5kKSB7DQo+ID4gKwkJc3Bpbl9sb2NrX2lycXNhdmUoJmNkbnMt
PmxvY2ssIGZsYWdzKTsNCj4gPiArCQljZG5zLT5yb2xlc1tjZG5zLT5yb2xlXS0+c3VzcGVuZChj
ZG5zLCBmYWxzZSk7DQo+IA0KPiBTZWVtcyB0aGlzIGhhc24ndCBiZWVuIHVzZWQsIEkgZGlkIG5v
dCBmaW5kIHRoZSBpbXBsZW1lbnRhdGlvbi4NCg0KQWgsIHNlZSBnYWRnZXQgZGVmaW5lZCBpdC4N
Cg0KPiB0aGlzIHJvbGUtPnN1c3BlbmQoKSBpcyBvbmx5IHRvIGJlIHVzZWQgaW4gc3lzdGVtIHN1
c3BlbmQgYnV0IG5vdCBpbiBydW50aW1lIHN1c3BlbmQ/DQo+IA0KPiA+ICsJCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmNkbnMtPmxvY2ssIGZsYWdzKTsNCj4gPiAgCX0NCj4gPg0K
