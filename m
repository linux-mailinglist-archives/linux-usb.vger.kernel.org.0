Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC8F1E768A
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE2HWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:22:31 -0400
Received: from mail-db8eur05on2065.outbound.protection.outlook.com ([40.107.20.65]:6176
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbgE2HW3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 03:22:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzA5ONH2rTWjPSC0L5HCuheDU7BrKkza3MAmzmmBOfln1QcFtJvN1AdNobwU6UBxTZarXHG6WscbH55x8Wt4UYph/g5L8mN5/wL82YAFCryxrm5IymszOqIKLXzn4RhZsbq1L1fMaaReDQsMXWCBzcGPspL1DrPPOTXzAKttRVh3OT0UPCmr3bry23Kon8+J2kwoQkjiFDWQY7UXz0i4TCVy4VsBHmXyuasGgnJwLxHZiFtvrZLivrsmKzmnbJtfU2pQx7pLgJNApfOoILwzp9zRm0f4ACmQjn0YHWWo3yu+jOJdY65XtlC7Cot8y9MtwjNMhqNwz9tm9l+Q8/suSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szf0DLjeVBSH5VVxR7iQdVvGgu4sVon6iEGQ4L2TzJc=;
 b=ZtMOZP95mEeoNb9O+sl35EAPhmk+0+XfAlK8eqDA+uKtgnqviwA5yitedOHM+NcqHWdNS60ncvvdqLoNtQWTCyrRQLvOKnhQ1+uigeSNwlv25jW4DgldlXrGASMRGnn5Ul/nUcUS+mZndNRCTvlX0xpheYiYDAFnhK4fUYeXy5Ahzi1TLUwdqtlWW2kO1sHElF8QZxAzLTkyL8O87FWnreGMZg8YqNpycqK+IA+SGWuXGY5i05o5dBQpBlk8xfAkB2UjP6xLY4pCUntH3ZVYJpe/+aIZ8YqemTS6BGLK7/UTO2sjh4O21d44J/mrSI8p4Hl2a3arE6IKGZs8EFO9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szf0DLjeVBSH5VVxR7iQdVvGgu4sVon6iEGQ4L2TzJc=;
 b=Wyo08dMzobNJaZCA/x/hBZgKlB0MalfuCL2ac+RUUcu/zF/PX/GtyyAhMas5SCy0UAAxqkUtJZ/AAVL1WfuqvUR4SoyVauY0vtS5CzIp73S58SZ4i6l5QXNEvua9GCKR4brVKIXEUvedSaWfGXd9B4h2QVck2JPegkvtE1BjCB0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 07:22:26 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 07:22:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 0/9] usb: some PM changes for cdns3 and xhci-plat
Thread-Topic: [PATCH v2 0/9] usb: some PM changes for cdns3 and xhci-plat
Thread-Index: AQHWMVkUSVmjdrxfNUi7jFrNv0WdNKi+sTYA
Date:   Fri, 29 May 2020 07:22:25 +0000
Message-ID: <20200529072248.GB32755@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40f8b715-0d71-48d3-d1d9-08d803a109af
x-ms-traffictypediagnostic: AM7PR04MB7045:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7045E7EB4C7D1E1F74E5E4D88B8F0@AM7PR04MB7045.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XNALfe2B6wsW16a1UIzOxCxGfxufhtyJuSc8nrknoDnf/6moIk3SW1yz+j2FiDoNwN6ziOHv0butr/s54yoXz6H9CsLp4mbR/LUmELyx684BL/ZUZv7iAA23WF9d8VHfi+M0G5nwFEVvPTOhN8jTLYfBMRffiDX9ELHdDua+ev1kcIqqDw438gckKp4V18nNS66sdYysuubeN+01w3J/4Ll+JT9p+qilipaW90nZvkYnjNObmPJYtE0taUeJYNhlQ7c0QKpr1XZzMg3AcgVD4kEmdMBod1LUWSNOE09s92y9QPatzJ1rIzGFnwS05zPjDqxQJzfhC6P5TqBfLhMPEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(33656002)(5660300002)(83380400001)(33716001)(8676002)(71200400001)(1076003)(2906002)(6486002)(6512007)(9686003)(8936002)(6506007)(53546011)(91956017)(186003)(316002)(26005)(66476007)(66446008)(86362001)(66556008)(76116006)(64756008)(66946007)(478600001)(4326008)(54906003)(44832011)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: P5EScaYm+Ila4RUN7mjAuIaq4/VnL3pdcm+rqyU0RxQxoidOrZVabs3UP1zIpNmrG3Fb5uLvsxwBu/hI7esn9bP9DY6nW50z8QkqcZ7Fa1dPtT8OUPoe4TxRb2f1Rfy0X+mAFCx3IfqEJ/rVV2gxzGPUTDDFpfSfrLZZZvWVvgY6Mr7qKgtS5f8kbkjOQLm3vKhSOyI20bI5gHD1Wl1xi2U8nwTLwYF8nQXFY1sEU4uOhAiH0+0qM2KFpv+sXBInqdsanFbAIXJm7AVtccbMwok5pWSzmfPjAbsng1oEyEZ45OZIZtCwVKNJaysKKmmt0Uc4ru8NmPla8v86V+34WQypUEJYHsljLOImy5rn1vyp5NZDDGbfD8f7v+aut0FJzO1/yW+Pkk7HOqiJwmJ0/0y3vk97g+8cs9ECemCtXX2qcFvNsuqfNmIGatSXyNN49W+CVXsW6o7O1a6aMu/3OWfmrOE8IvAF2AEuJiqJZXw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <885B7C821D998F4BB3EE64F28D5A1441@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f8b715-0d71-48d3-d1d9-08d803a109af
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 07:22:25.9224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9bNIwUKfn03XpeXQs7QaPx4MLTxypKbbaDeodkDjgxzqcEgowQYcuYEKxn3chhCKKSCNYB5LbEEtaz/U2NN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-24 07:22:55, Peter Chen wrote:

Hi Mathias,

Would I get any comments for xhci-plat.c changes?

Peter

> Hi Felipe & Mathias,
>=20
> In this series, it adds cdns3 runtime PM support as well as some
> xhci-plat changes, and verified at NXP i.MX8QM and i.MX8QXP platforms.
>=20
> Patch 1-3: add main runtime PM support for cdns3 core and imx glue layer
> Patch 4-9: add platform data support and two quirks for xhci-plat.c.
> - .suspend_quirk for platform special sequence between xhci_bus_suspend
> and xhci_suspend.
> - skip_phy_initialization for skip PHY management from HCD core.
>=20
> Changes for v1:
> - Add the 1st patch. Without it, the build on the usb-next will fail.
> - Change the subject for cover letter a little to reflect all contents.
>=20
> Peter Chen (9):
>   usb: cdns3: introduce cdns3_set_phy_power API
>   usb: cdns3: add runtime PM support
>   usb: cdns3: imx: add glue layer runtime pm implementation
>   usb: host: xhci-plat: add platform data support
>   usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
>   usb: host: xhci-plat: delete the unnecessary code
>   usb: host: xhci-plat: add priv flag for skip_phy_initialization
>   usb: cdns3: host: add .suspend_quirk for xhci-plat.c
>   usb: cdns3: host: add xhci_plat_priv's flag skip_phy_initialization
>=20
>  drivers/usb/cdns3/cdns3-imx.c   | 179 +++++++++++++++++++++++++++++++-
>  drivers/usb/cdns3/core.c        | 163 +++++++++++++++++++++++------
>  drivers/usb/cdns3/core.h        |  14 +++
>  drivers/usb/cdns3/drd.c         |   7 ++
>  drivers/usb/cdns3/gadget.c      |   4 +
>  drivers/usb/cdns3/host-export.h |   6 ++
>  drivers/usb/cdns3/host.c        |  48 +++++++++
>  drivers/usb/host/xhci-plat.c    |  36 ++++++-
>  drivers/usb/host/xhci-plat.h    |   2 +
>  9 files changed, 420 insertions(+), 39 deletions(-)
>=20
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
