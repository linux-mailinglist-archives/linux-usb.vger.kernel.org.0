Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDE52A1176
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 00:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgJ3XO6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 19:14:58 -0400
Received: from mail-eopbgr10067.outbound.protection.outlook.com ([40.107.1.67]:11441
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725681AbgJ3XO5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 19:14:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddZhntsAB5Cgeula18LQCxefK0oFgtD5Ge6yU7JjSN7JqZXKjjWDLzL6z/8tHwR9UceG2zE5kX+wJUirE0ugtAUXrK1b2WrGCxh+ie/Kqf2Asft5rZovj9Nul+uavgUHnWMbOOc1+AFvX51XkDOlIROorFhlRysspFk+4XpshNjUAuDLjtL4fSu0lc4qaFF1TBTxbISpbmE6Hv9qyqBLTL5aSVn/53xI6rEZ/GXbsYUeN4thiiYH3QktS2YiDiIPUdtCWu13+XFaS4+9kX1FPVToQsoJB7sCaPYNeoPmYMKo/6axCxJhBmPXV+EGe/BnGSDdI2yGAV7iTFW+lDHtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHD6uxRLcosYsHKotoXhon6MxDf4W46D7NiwvVjNr4A=;
 b=mjxZANBgw6zUPX37stXMIl/M9JN8ogTBgWOcQGO1h7kyXwz7jiccUxARfhXcsogJ7sHpRuVNN5oFNegqGFE0KQ5yaktBhL/HS4X+o32+MNnTkcTxL6I54m8/D1ahZn3o6Y9HIAVF5cK32NnoBPhFEt2bei5Epf/4B+BpWKfuJsYL/2CDfjEinruSLpQiuy5RtT4RduPpk5utzNE0U3vqRv0IUe5/+H/ne/ZD0ufyKhrN0zud+jgA8WSJq1YHPuyOuTQV4kg6WYSMtjgrUGfRk7w5+yH9WGH9S9Sq+AxUNde4nIi4lJM5anYR8FegHL1z9Z8fsJRYki1+gNypEYG/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHD6uxRLcosYsHKotoXhon6MxDf4W46D7NiwvVjNr4A=;
 b=QZPW35DeF+90ArdkS/UZKyaUezxqG8EpSwvK13DviEMwk/5OiqNqysNcnDPr425HH4ZEqXM0ibRtyWRmx0YTjrioQZsQCMpgacQ8wNzoncW6gcaOX2r/ZNcM5KrJx0qpFAyvhhpHU8x3MXs0rTalVUdrE5VMCozZpU8S0a5KzoQ=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 23:14:51 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 23:14:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Roger Quadros <rogerq@ti.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Topic: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Index: AQHWqB+8EkbyC5HZU0qhM2+GN/QOFamqAbAAgAC07bCAAHDwAIAAFWCAgAFfAVCABDhKoA==
Date:   Fri, 30 Oct 2020 23:14:51 +0000
Message-ID: <AM8PR04MB7300AC246A3D29B1027C36038B150@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
 <e3f75fb0-8fab-357f-d3f4-ca122995166a@linux.intel.com>
 <AM8PR04MB73003D7F9CD52561E69616108B160@AM8PR04MB7300.eurprd04.prod.outlook.com>
 <1d673d32-5860-c4e2-c88d-df7ef57f1d7a@linux.intel.com>
 <20201027095023.GB5940@b29397-desktop>
 <AM8PR04MB73002ADCD414D5FCA8A21AE58B170@AM8PR04MB7300.eurprd04.prod.outlook.com>
In-Reply-To: <AM8PR04MB73002ADCD414D5FCA8A21AE58B170@AM8PR04MB7300.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rogerq@ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.215.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8100c46a-4c1b-4715-38c7-08d87d299ad2
x-ms-traffictypediagnostic: AM0PR04MB7123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB712319EDB88B092926B629B38B150@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QesuB4nPgWw/DthchxYvwbdQVv+gMdg+uhzLHnnHhdtiy1sIgm00TI/MPkj8k5pyE66qbG9LcDmzR5KE10oAxt+TP3redaW7vYzueaDOqHmQO5Yops4jsqbhFyNpD/ckOyFiwDEV4XcFm9xTGMxYEon1G54GAhAySfbdutY0a06AEBoVymFiwsVTtW/XUzkoVIXdBoYOo3uzcoZ5b7L+iM1eBUHUGABfZK0yyFH/gBG/xLdLH8IkRCT1JD5APqTaHagDmADqG9RENMnyTSfxzAnTZwRNPwowrYjmUkur2CTCZ5SWh9lAHqjLoXjaMLvsYTJfiY9df2fbs0CXtCFXlAFGwKuHjHW7npgy5UsBJhL4M7Z5ENH/dhJECp+xHAHSUOU8cA+ADoKiTcp9TM9v8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(136003)(346002)(66556008)(66946007)(76116006)(66476007)(33656002)(7696005)(66446008)(64756008)(316002)(86362001)(44832011)(8676002)(71200400001)(54906003)(478600001)(4326008)(9686003)(26005)(6506007)(110136005)(55016002)(5660300002)(4744005)(186003)(8936002)(966005)(2906002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sonlQFl7y2Q5x5SveegSGlKXWv9czkWm6qg/viqfr7MI/7gvMzEREEIz1Hy2WnqjMwowtbdAF7rRfFodUretakc49R3dFJ5ZzZHZQ/HPq0eNLpsd/FzO0rS7xuJceDUb+SgumcPiT15tT3Vzfy5PqRIXhw+tGylwt2UR7untkjt4uSEal2myQBUkJKN95PnNhAY2ftFj/5JyBNz4w7bDhc/q4DcfzYmh4g9uMcP8Y7dMKBggoQhmq6mRbbw5gjWlLOVltB4G4+nF9cCW65xoo5gDfFwN9W7TpLtsMQivvXnCe1/0eix7RTlFSeGzFDb3J0z4TtK04vmLZG9YqLrJaCQpccjAPJB4Pbl9z/NeLabL7hNrIncrEUhN+kU3MRNBCdlQDh9IpSYdIBudACNW8DxLQrh1jBbO9+2ZKV180ChCCYVSIiVzkh1yLY8w0+QjTgV6Xs8jtk9fJVl5e4i+IXgUk1Y8ncZ8Rt8VV/mqe1roPGz32f3t3wZr9Zjcc3TOYibgmrWqNs5ZTh961RZz7aoS37RFIw/mA+PcyTcqajjKE6VtzS1QLbdP53Y7WbqI7vINbRgMBYODsm+yJuzKeEyHanl8EbwGgCICz5SwPr8MmipUZPm7yu/8xI4j42JWdRYwwO+1hzLZnW0Ng2kHlg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8100c46a-4c1b-4715-38c7-08d87d299ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 23:14:51.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AL5dnbLuKucTJp/691RKmz5Fy/Gco7BhDZI4kFmJ3uKV/DrO1TqdrzpHv39j7qm0xsyv7BscfhK9uCh4hnHwBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >
> > Oh, there is a missing patch for cdns3 host change, the code is
> > located at drivers/usb/cdns3/host.c. I will merge them together, and se=
nd v2.
> >
>=20
> Mathias, adding XHCI_CDNS_HOST quirk at cdns3 part depends on some
> reviewing patches [1], these patches add the struct xhci_plat_priv with o=
ther
> quirks first. Would you help queue these cdns3 host patches after reviewi=
ng?
> Or what's the suggestion to handle this dependency? Thanks.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-usb/patch/20201022013930.2166-=
1
> -peter.chen@nxp.com/
>=20
I think we may not need this patch at upstream kernel, I run the test overn=
ight, and could
not reproduce hang issue. @Roger Quadros, did you meet hang at the reboot s=
tress test?

Peter
