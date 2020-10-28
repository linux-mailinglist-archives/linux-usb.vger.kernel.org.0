Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A62929D598
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 23:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgJ1WFY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:05:24 -0400
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:10627
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729999AbgJ1WFX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:05:23 -0400
Received: from AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18)
 by AM0PR04MB5233.eurprd04.prod.outlook.com (2603:10a6:208:c9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 10:33:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MipECI6MEGvRRrdtSvPUcpMKC6v5NmzLEcUVpN/C0kivKEIjy9mqquu530QRNlHFMmCKnDbNFiWtv0NlexRySvjkCSaqoaNczlKwE+p7znegpW5/mVALQGPfdWCTZW66zVhPL/CN1hOcOYPD2NYWNrnyBB699sQLb7HpIfJMogC5pIFfxsK9wXM5l6t4XUBA0VjphxXP44ZbcaoMkAOvnPys1E4eBbku8aT9tvOoh6QavlmZ4xdMr0vcTdXrEBUpvtCuXlrEcrUyQO4C0LMmN/4jj+kNi13mk9pPaCj9UbtBLZS0j5e6fjnJykRO0GjhlMAaUyZFRJuIS3/+h7qSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcvE/mXgAMA0sajR8PSK7hFVgX57+Jct1Kkpk9P3P1E=;
 b=QWHPwOO0lCQPSlpMuXwQCB0SnXBYhQVi2LVq8ZXsWGlYSbxweMYDIEELS4QsUtARcJPImiKoscZWWRCUZ93CsZqoHilvpeYa8syj3BhFZL4WdzBNa4S39zUM8gX5oAKK4whF4OyDt3dr+/Qcd3HAXc564RSydUS2OwGNopS/5Aj7YiZYaSNPdCibrZYCv+0BMq079yHCDinaR3JnYfZbceVrw6nq4bQUi6cOUiz4WmiOX7XURgP2/enUtYQpube4oSsrHT7XqKjXXvzkObWdGzdOueBi8V0PVo7V2f+yR+jhXbVc6OpBMgwEqG1/clR6Nxkfq4L1JiiibCoG+Rje5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcvE/mXgAMA0sajR8PSK7hFVgX57+Jct1Kkpk9P3P1E=;
 b=i0qY2poIqTOhGNL1pqI0C3V+9FtGa/b1Jq85hPEEBXOIdYer1A10yL03Pubanfy+rTqqXp4u756Wdq0V14q57B+OgqIuF9rzfl1Pf+TyheICsPzysXwZH79h8HL3dj2Gw75MBRnbCrwB4BykgHKBmt05Yw0JcxqDzjM5RX6SzgA=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 28 Oct
 2020 07:02:05 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 07:02:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>
Subject: RE: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Topic: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Index: AQHWqB+8EkbyC5HZU0qhM2+GN/QOFamqAbAAgAC07bCAAHDwAIAAFWCAgAFfAVA=
Date:   Wed, 28 Oct 2020 07:02:04 +0000
Message-ID: <AM8PR04MB73002ADCD414D5FCA8A21AE58B170@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
 <e3f75fb0-8fab-357f-d3f4-ca122995166a@linux.intel.com>
 <AM8PR04MB73003D7F9CD52561E69616108B160@AM8PR04MB7300.eurprd04.prod.outlook.com>
 <1d673d32-5860-c4e2-c88d-df7ef57f1d7a@linux.intel.com>
 <20201027095023.GB5940@b29397-desktop>
In-Reply-To: <20201027095023.GB5940@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b3fdfff8-1654-4489-aa5d-08d87b0f60b4
x-ms-traffictypediagnostic: AM0PR04MB7121:|AM0PR04MB5233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB712188648554000254138D158B170@AM0PR04MB7121.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uDewvWqSKZE8NdzEVBkKmFZSVc81RmXS9e6QOPyGatim6JVFY/cqtuNuB3OVfTZ8oyxxhM5JSjFah+2HXLvBwioqxYOLeHZb4Rh1ATAiqiFgxS8b/vuUmsFcd6riXCeZCdJWGy7WOGJpheEmGEl2KF0FS0ZtGylznGh/VsL8qD/1LRp8A+f1fbiPmP3p+8AvnoG9BJsF4OeaKsiFQGEBYGAsZGuoM3Ki7cgeKhhNKkYetuif9Zb4m+YTwmJ7AtvAJJ93I+V3gA+usFK5gfUxlEceuxMZfJIxc/in9JbnDQM12RdH3hR/1hifg3v0NUih/Llj5eZUfVCYhdbUNBuV8qlaQ9eXZC8VXbsMyjzhoqa7aERWfgIA/ReA5aqSbI6G+oYDysjZvKWWR7s26j7lFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(316002)(71200400001)(186003)(6506007)(7696005)(66476007)(8676002)(6916009)(26005)(4744005)(5660300002)(66946007)(4326008)(66446008)(64756008)(66556008)(52536014)(9686003)(55016002)(76116006)(8936002)(478600001)(966005)(83380400001)(54906003)(86362001)(2906002)(44832011)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AbyKWOXUaYmKLq2fUzPw7irl7s5TiysHdNCvzz8OXA/GM4IHiM3ZvBDNeXUYrviFONeOj2gYKT7e1hodBX795H4COI/0SGmB6GfLZxibry772vJTtWY3BbIE+DKdIBuTtU/X3YO9w2Cqa0LFtjdtdMnZ75Dnz+zncH6I5RJJAsFo5SHNLdsPWECUBp0FRI4XPL5ccm0ZohR4UZwmIrMzgKu7NwDqfXHvt1V75l9eWu1mNk42r8Smniaz2uOE2rpT5QFiY9uLz7Eyp6qr6yROCxbBoXfz06EkLXpBFLXPRwh4VfE4swsNWQjDSUVN9wCLYgsFIaaRJRN0qkYBzbTdVzDDsb/aSyG9URQD6jctX/FblOsBlaSy2BU/lshdFTafFanfYmYgZ+SRU2A3h2HmSL61NgQs3YapQr03h+JflkjKHsjYrHKFBGPLEXbXZ50L+3LiiXIJCCwjO6N3WFsgmXqVwWCwScFfIf4te/eXTyxbvsrDYLya8+rVEhVZZa4SeCTpEy+OHUSAzRZWI66H01a7dxwpaATKQ9P4sc1qpmF+VhyVNGKVqAdHk4CEQvTh7a1iaqEK7eNgoFX8AS/B57UFGgCsjX9fVRRzPanIMYuX37uUzIc1gLmAGu2lXK2+l64Kp4SMu8DzsZAdHksZGw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fdfff8-1654-4489-aa5d-08d87b0f60b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 07:02:04.9277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5uq2vifwTiLxun12XatiAFpUaiBA6a5ZVKW9X7W9kj24a+OyRcos8TMoDGvMS57y7lAEQAKXAVJa+VXx7TWQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121
X-OriginatorOrg: nxp.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > >>>
> > >>>  	unsigned int		num_active_eps;
> > >>>  	unsigned int		limit_active_eps;
> > >>>
> > >>
> > >> Is the XHCI_CDNS_HOST quirk bit set in some other patchseries?
> > >>
> > >
> > > Currently, no, only at the function of xhci_reset in this commit.
> >
> > I can only see it being checked, not set. Am I missing something?
> >
> > -Mathias
> >
>=20
> Oh, there is a missing patch for cdns3 host change, the code is located a=
t
> drivers/usb/cdns3/host.c. I will merge them together, and send v2.
>=20

Mathias, adding XHCI_CDNS_HOST quirk at cdns3 part depends on some
reviewing patches [1], these patches add the struct xhci_plat_priv with oth=
er
quirks first. Would you help queue these cdns3 host patches after reviewing=
?
Or what's the suggestion to handle this dependency? Thanks.

[1] https://patchwork.kernel.org/project/linux-usb/patch/20201022013930.216=
6-1-peter.chen@nxp.com/

Peter
