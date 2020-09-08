Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02271260BDD
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgIHHWA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:22:00 -0400
Received: from mail-vi1eur05on2074.outbound.protection.outlook.com ([40.107.21.74]:32224
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728998AbgIHHWA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:22:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCCpVcAG5LGhz0pm/og644G7Mjmyrei02Ruh2dk+A744t4oNpVIoaCGZrqZVsOj0Z1cY7HfnCuk3eLhfqxrqP2j+4yZJ3AWldsH51ph/FTvLuu2PevFk1K++Q3COvV0ReMqSdPhxHXxs7934JC1E9Pjznclw2erXxzObELPSrHfQwzPTmUnhIDhdmKdxR3hziaOk/C5ZGM3VdxTaJ8fqZ0UvAjLMG3jEWa0xFQyoyvm8asoRyjECsA+IEuQRxpbqf6mECPAGNAKB00YePLRAn/dD7a6zMM4OuT/a/X38l3imVa6UqXYNLeLeiIE8ct2zECytcjF3wbHQhCQs8nnU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm3rJatfyegMgZgZM4Wa+o2MQEbrozyzlfJGFPg4Bac=;
 b=D9A7EPpXOtWpFK2jSk3dKzEPxSy7vg4JQq91LfPOVC7OV/1cDv/B6ZfVuTEnQXea3uDTGQHGCjhsKR3pLZqbzEXxg5KiJkS9TEIleb09UuJML5Xi81KjMO9EaPaS5mkEwb7JhmVUp6Xg8ZzJhROLAU83dhqM1O7FT9N8f9Yx6zwDzl+sbnSq7H/cCAe6KEZfxqpbJcCShHpUNdV99UyM/SIMGJz1Yy3a5IL8Do5XooK4OW/MVeeSfrXRlmBINTkvCofWIRhv9I+FDXJbvYPSbJY145zDDb5YEqzNroVBqjR/C5KrlisDQdUFYzxh7CHVyNItRubeCfADLvBd3zqPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm3rJatfyegMgZgZM4Wa+o2MQEbrozyzlfJGFPg4Bac=;
 b=CZPEgOW1JlVuX6wIDuNckBew81jjosRwPImdVAJrQo/ib5auNqWQ7eYkuNSIZAHD0utcva8BVg93SLswzBQ7TeMxMXYoTgDZL1ck1edzb9gqDGRyKGC1bdlHQge8mxJ8DW27JrVjRZ4Qv0JWzkNpxXWyoGh+Dr8cF7D3mtkXV8w=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2593.eurprd04.prod.outlook.com (2603:10a6:203:37::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:21:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:21:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg list
 use case
Thread-Topic: [PATCH 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg
 list use case
Thread-Index: AQHWgDxB6V9kAJ90K0ufrt7HF3hDq6leUHQAgAAQaQA=
Date:   Tue, 8 Sep 2020 07:21:55 +0000
Message-ID: <20200908072127.GD17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-5-peter.chen@nxp.com> <87d02wn5xn.fsf@kernel.org>
In-Reply-To: <87d02wn5xn.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 82de0aea-ee70-40b4-e2c3-08d853c7ddc0
x-ms-traffictypediagnostic: AM5PR0401MB2593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0401MB259327F2F1E184AC7B55374F8B290@AM5PR0401MB2593.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9B41na30EiXHgvc1zCsstiN1QumYte7L6L739yh227zVTErcF54C9Lp4nAoyp0jbwSuJZnToPj9TNf2SxzjdwPAz+uHbGd+59XAzfjnNT1hH/jHgHMaZ4eCfGHQHYk1ZEcXSCe0m9uD1h7kgynlt5fmNt0CykoYr7EDaSn1bYApYilayjN3pxVVWnBAmv9irnUMMjjL9nWGnw7LBbTNe92gVLoe1m9EEbLcRlxekDlw72R6KM27DgmLmLWVpxIf8yCNTTFwX3g58dG2IbeA+J8tDGXUgXYeyZZOkKCdr+EAvDWZfF4c0g+mkQIe7ql/0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(376002)(39860400002)(346002)(396003)(33656002)(186003)(54906003)(86362001)(2906002)(316002)(6506007)(53546011)(83380400001)(1076003)(66946007)(66556008)(5660300002)(91956017)(76116006)(66446008)(64756008)(66476007)(71200400001)(44832011)(8676002)(26005)(33716001)(478600001)(9686003)(4326008)(6486002)(6512007)(8936002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QzCr8RAcjFTLol/sCoPS48GEKEi0ukZIVE128blwss9maNndZkd1GjoY48l6JxN3axMAniCc4ablt8axELSlau9+rB8HndPhmqlHc4xPYjyMv7IpD/q8ehWSHpf0pp6J2CBCF4y7AwI4EWN1v/s1vOOkMjtFkrK8AncsTEFv/zgVTtqZDoYSj52ULgswHG838tRWx8g6i+bbMQPa7BtuR4FxCBx1k/lFFyIueXqNHKQfZTZeNnbvMgkj9hAoqSvfmk9J8R2E211tMAujIUvlmc72cwH7TFVvbOmEaR1rmwFB2SNIokOrguGnEC2dXu+L1L06Vj/AMTNZ6H2VxXJe5xeXStHDqxMvm19iH63a6A6wxUHMp82HgAsmyPIRce1v4gXfIl0fk28S5hPWdHuonLBqh5+bIPV9kGCk3lUmwIQVhUrb8gAPgsx20RB5regoXfhwNThBQHnWeHhQiJejV1Fa4x3m4MMGAw+Yst8ZwQ+6vbf3MYlCzKrOVy0cS5RTprcQ24aqcu7F9B+NKMC3xVBoNgSLzWjD8WXKJR/FTySI3lxxLqd+SGw+jJ2AqOFWe8vlnhOSqKkVQ1wuAP/t8UOOxnaGHXbMs1SkHCNjCJUsln0Os0YkDqj1xNfZYoUAO9+uO+UyGmTHkJFGSaiivg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC118EFF10C50B4FA89B7BC46557E456@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82de0aea-ee70-40b4-e2c3-08d853c7ddc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:21:55.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4+Nn48Sdrxrg2Q8bpXxSc/bZ5fKQxwVeuJtJKHgg2iU53kZjA7QWVNrs8kwcBqAobgVMXEOx74CKNzwiktR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2593
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:22:44, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > For sg buffer list use case, we need to add ISP for each TRB, and
> > add CHAIN bit for each TRB except for the last TRB.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/gadget.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 25e3ff1cdf61..a308a694abc5 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -1221,8 +1221,14 @@ static int cdns3_ep_run_transfer(struct cdns3_en=
dpoint *priv_ep,
> >  		else
> >  			priv_req->trb->control =3D cpu_to_le32(control);
> > =20
> > -		if (sg_supported)
> > +		if (sg_supported) {
> > +			trb->control |=3D TRB_ISP;
> > +			/* Don't set chain bit for last TRB */
> > +			if (sg_iter < num_trb - 1)
> > +				trb->control |=3D TRB_CHAIN;
> > +
> >  			s =3D sg_next(s);
> > +		}
>=20
> is this a bugfix?
>=20

The support for sg list is not good at current code, it needs all
changes in this patch series to let it work well, so it is better
let the whole things in this series as improvement.

--=20

Thanks,
Peter Chen=
