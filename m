Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC572551F6
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 02:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgH1AdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 20:33:13 -0400
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:7264
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727008AbgH1AdL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 20:33:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDZ6+CCEFrnomQIzET5WnBCSzrS9B/I7AxHCqwcOgGcpDRpkQCkDxxl9b0zcu9c8FTiub7KwnpW0LRhE6ZBjVvvSuwq7Jt+FW/DEsOe/gNWLZpbKphrMf32whsds3bu8RtZxk6jRyzl5ryPMdKUUWPHS4AcUJ4tuQCQ4acthwgG6g2heG5q/NudavoJKeY2NQr/lwNHkqQem4XEIhdqYVuhMYZibDTSP6irMuyh6fsIIEtmNv9f8nXYPthdjmiXgC8Ql2PSOI/NFpMrC8jJk+KX0yTXVBdvJCWmPaTx09JVqpSnlhzmT5UURPF0PmQV0P/y+8pVTMXLY7FuzxTy/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBqXtibXXNPk3VgidA7KVrkaH1jbwGYvMCspbzqhPIU=;
 b=BJZBc+x3QKlu3S7WtZsp0GqB3Bpg5cy5qTmc8qi95bBDrpYriY/iL4RqHOuBkHFDHzq0Aei6HxlmPncZBc0oXgaab2VXfK31Tpy4BC5IFy1S5UGCKXPFZFyG8dZ2B5iScvJVulHzdAc6ab6qH6XouoMGitd2f+CgOO2ns8C0YplqTlojRWzAXVBs/Ze1FAG7ocoqOKb1feVq3OKHAULNjH/LLlON7lvmU4TjCNgtwL3ab6y5GzRcc1EioX0AmfVh5CjYomUjxN6AVpIezt564rjCmGAtDa0S4nMaViOHNdbSgxURnpG+2zVm5dP+VIrPQunFvP9ITOUE25xBydjPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBqXtibXXNPk3VgidA7KVrkaH1jbwGYvMCspbzqhPIU=;
 b=muZBaAhLGhzVuAbqUxwid15Sa/ZA98trVk1uDllrilfk08P9dtgdtf9lp7dznrgVoKqLqyHcXKBSWRcoZezFGRwgNcjexMt2Uy/z0Qb5pRBfafZ8UL5X7Vb+i5kdakNS3yof/Co/AzrxNTUWVliZY31yyB8FXGQMaj6hZwIJQpI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3319.eurprd04.prod.outlook.com (2603:10a6:209:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 00:33:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 00:33:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v7 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Topic: [PATCH v7 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
Thread-Index: AQHWeoU7WcnHmn/c80a7sEQ3NEwjaKlL8ZUAgAC+noA=
Date:   Fri, 28 Aug 2020 00:33:07 +0000
Message-ID: <20200828003151.GA13910@b29397-desktop>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-2-peter.chen@nxp.com> <87k0xki6b3.fsf@kernel.org>
In-Reply-To: <87k0xki6b3.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9fe12e5d-6023-4336-0858-08d84ae9efa0
x-ms-traffictypediagnostic: AM6PR0402MB3319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3319E0E9700EA92D521C662A8B520@AM6PR0402MB3319.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2siOziB99JnJXgO3lPfmciMtnbesy4T7DMpVKHDiNR6e80Poy1BfaUjQgwODoZdzpr+yAgz0nuzm2VR7yned0Gv8u9bZ55yCojSI9AkHKPZ+qrv7ct3H06Fc9UkpG2LQfHJJPJlEWSVMTVUVP9Fl/pmDhsnuZYLEcvSCPYHxQaJozKoVHiX+6hVq3ox05ROTpbysPcbMuZ78oEX0AIyjEfV/p0XoeJZMyO/s08DpTBvPD5M0FhkJ14X6T5uD0WSQP+7Pvrn2aamCI58HDUpBNFHcxSjgKgjlgFHUNzTJIRA6EkRHE8HpBh07THMd/OppUpRmCrSjWaJR3Kzf+y/REYES1ywWbM62ekvgowzAPzsJOcFtcf/BBcGysZB+0Sr2xdj4jx0JIMnXT/eYtU5DBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(478600001)(54906003)(66476007)(66556008)(316002)(26005)(66946007)(83380400001)(44832011)(2906002)(186003)(76116006)(5660300002)(64756008)(91956017)(66446008)(8676002)(33716001)(53546011)(33656002)(966005)(6512007)(9686003)(6506007)(4326008)(86362001)(1076003)(71200400001)(6916009)(8936002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rWJ7iwN5W6i+tL6l3ypOzdwTcVA9LhVELflSqN4uxJcBj9vyGZkqx81dayjFS5EIxWugAOxkY5DRtrUe7kqipEv8v1UFxYnfEmDJPt/loY84kggP4viHV+vNgkNWz0BE73kZ+/heMo/7G8N0ejOuFzBeawrSlFdjLfhHkRyH668bzDN/MwqC5MM6diyG6NiSFeDa4jJ5FyvPrHiiHpbfLVWNlxW1ApiNs5GFD7zksqUyQ3K6WyVGHJ1z/ukEAw8POtjbraTginlOUR0jndWLwjgNN+S8gcf4M3og3MQr2ynP0GxY+YJ93YS86++CXX428TMY5hD5wWv0JGTd8ESmTl/OqUdxXoO1O64Ggohta0uK54DR+h7nhLUw81VXOYdIorib8jChtGHkxRdynux6FAtfG2YhYRHNIRViNdrX5k1Pw6svxhx48oQ7fEJyamWgR2rfj54E3F/un/nvXNAioFXgAQ0tBmjoqJFVn+AKci07UwyYNw9KsHprlkWjejHt46y7T1G9Bi7rN2agV8+rM07hT4KXG/raG6eLItYb0gK5DCfC63RFJ9FQ01BwxtssqyPRXkwjkdchP9Lgi8lDnBuweOHmLCmt8AlwbWNt1BweThYRE9qTAwAU0wK9Ay9ar3q4FMhUsYMrV15YVQZ2yQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <779F9EDEA174D64F90C1C4A85AEF0BB9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe12e5d-6023-4336-0858-08d84ae9efa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 00:33:07.9748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6sIn6PYpGRd8sjlIsLd0wEuCJ1YZ3smWv7CaGaVXYeQhIiyf5JeYvK+aUP07eRaVeVeGB2b9N1Zfw4OnDEYpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3319
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-27 16:09:36, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> > better we have unity APIs to handle both USB2 and USB3's power, it
> > could simplify code for error handling and further power management
> > implementation.
> >
> > Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
> >  1 file changed, 28 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > index 5c1586ec7824..e56dbb6a898c 100644
> > --- a/drivers/usb/cdns3/core.c
> > +++ b/drivers/usb/cdns3/core.c
> > @@ -371,6 +371,27 @@ static int cdns3_role_set(struct usb_role_switch *=
sw, enum usb_role role)
> >  	return ret;
> >  }
> > =20
> > +static int set_phy_power_on(struct cdns3 *cdns)
>=20
> care to keep the cdns3_ prefix? It's useful when you want to use
> e.g. ftrace and function_graph trace

I original added it, but Greg suggested it is not needed.

https://www.spinics.net/lists/linux-usb/msg197076.html

>=20
> > +{
> > +	int ret;
> > +
> > +	ret =3D phy_power_on(cdns->usb2_phy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D phy_power_on(cdns->usb3_phy);
>=20
> let's say we fail here
>=20
> > +	if (ret)
> > +		phy_power_off(cdns->usb2_phy);
>=20
> usb2_phy will be powered off..

If usb3_phy's power_on has failed, it powers off usb2 phy's power which
is powered on before, and return fail.

>=20
> > +	return ret;
> > +}
> > +
> > +static void set_phy_power_off(struct cdns3 *cdns)
> > +{
> > +	phy_power_off(cdns->usb3_phy);
> > +	phy_power_off(cdns->usb2_phy);
>=20
> Won't this cause a problem?
>=20

What's the problem you have seen?

--=20

Thanks,
Peter Chen=
