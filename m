Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CB52134B6
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCHQY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:16:24 -0400
Received: from mail-eopbgr60064.outbound.protection.outlook.com ([40.107.6.64]:47874
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbgGCHQX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:16:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blo6uI8MgDq1cUmkbcjuVimoR8hzJlDmHaBIT7qnesR4nOHUlYOxDXIh0CBDdLZXorAaiY5RUMR+Ozg0rKAul6ZFl/2YNl1btZjhzx+6nUCgfxcZdychVAdI+HG7K5LdCCb9gsDzHHuva6S/AbrMtq1A5VDE+qPdQorXGsxQfZtJNQLsN5Vdpk8ngHnCrx5dl1/4pE5xe//UsQZVYHUfuwpAH/VW657GJIQbK7wnZNldXrk3EyojNb2XbbQvCNaetIySWlewgsKVGkGd+lEgZWkA4Gj47elPA6fSIUkcJk0lViije2+DBFG3wBY/UMBVEEJgt1saDJj33b4KbbHRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN0LCIjf5Nxv2E0SlY5KtAHpRRRvtAmJRck1Bumox1s=;
 b=nR//HVXnoDQtGqJoIVXplu3fJ/5EUtm2hh0Qtr2VzPd3DpRABoNbi2iBomhVTSCo3NkHM4GYZ1imX/0q0U++jdra0MYtwG4FDjqFinEFxJ6lZvnUObjNoftrfUwghVEtaSe3B0on2mupZW6rov+LZYFygvxLhC0KBCPojqcth9hs35U/2GGE/PK+tMGeucAIr4pgWCnHo+uFeS4Hp7R0at+w9mbUYM0oC9xxYxvGdwCS/VC4boKLObhEjOL2opLKTMTqsy98Lr6aNrfN9pC7qw65L1slAnUhQHpPXVw5WQKrNOL/xmzoDqXbO0wmf4jB3ZNz05RB9KSZHAVDXLYZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN0LCIjf5Nxv2E0SlY5KtAHpRRRvtAmJRck1Bumox1s=;
 b=Z2vBogp29LLAU9rTs1iWmctJ+uXT6xHP3czReS8O9zuKfHuPGk0+jVDAt0469uAj8vuUDi2IobxmcIOk1R/e48f+M0ipWtXLHNxthbti1s6JMXjzAfLkNJopm+Mzg28/w1/aCXgKo/wd6ION3TRFTrPeX9kPRWON17mD6HJnjtE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5621.eurprd04.prod.outlook.com (2603:10a6:20b:a6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 07:16:19 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 07:16:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Topic: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Index: AQHWUQL0PtcjUE4mgku3gXRs+JvfiKj1bVEAgAAEZQA=
Date:   Fri, 3 Jul 2020 07:16:19 +0000
Message-ID: <20200703071628.GA14348@b29397-desktop>
References: <20200703062653.29159-1-peter.chen@nxp.com>
 <20200703062653.29159-2-peter.chen@nxp.com>
 <20200703070044.GB2220026@kroah.com>
In-Reply-To: <20200703070044.GB2220026@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03085969-6ff7-4e8f-758a-08d81f20fbef
x-ms-traffictypediagnostic: AM6PR04MB5621:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB56216939D08209E395B240BF8B6A0@AM6PR04MB5621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+7d7w0lyYs9aNo00l+PYLJzPR8AKmS9qjGvpPilZ+e91ITZzh95KUrNzjcdwTmIaemMlAgp4Wu78CGz3vjzgtLuqUOcgzBqS2BWw7G0xMG9QwLCaogQXqFCdw6BKmGJoAH3pSJGiXS86ttxMm3kPOpn2oxT+iWQOs+NT1K2/3dxPWAvrlukilRXhuftf+Y/U07s7ufrwxgcNkd368L2PnHSUJ/BpAE0ZBu/GfKqdSE+pmb4irafngUKS0sZc42oOmqs+3C7MgyR3xzb+0CGC5v0Z8zigXL+GOZvUxOqjO6BiqVkhMfNKOhgmRtKe/XaqpWg8NgDZhkgFYa9gMLRRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(396003)(376002)(366004)(136003)(346002)(6916009)(53546011)(6506007)(9686003)(6512007)(186003)(33716001)(316002)(6486002)(33656002)(4326008)(86362001)(8936002)(26005)(54906003)(8676002)(71200400001)(478600001)(66446008)(64756008)(66476007)(66946007)(91956017)(66556008)(76116006)(44832011)(2906002)(83380400001)(1076003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AsY2hi7dLZaVnjMAYa35nxd9cCp0eoQ1aptfZCfi4C8FaEzAg59z5Kgpweo/m4TG41yDtrZzzR37nuTzRJ7kuzouKQJS7/CidilsDQCfC6k3u58c24sEJYnrHm3ySNAf/9mwzWNzCcvTEUIW6khauHK7U/PmST/7UpqFZM58F1EzdLuta8E4nnZFhlJ7wJnYJMj8G/3xOsJUb0xf75ljJBBqZ+0IwmyLcc941mFj7GoTttWDoA5R+nuwjm9s8J8IR3l9q9zG2vkFE7ZTOudkWn6xUNqw9P3R30cAZjaC0P3UO4zO9A5mAv+LoAoWbmCkOGhS3qAX1EZtqJBho27wJ8XqENmMZ8JCeaUA4EM6rfnihXdvSJjpqEydC2BlKRYaJ7aLAAMXUewkJwSK7a/clFG7qehHszEF6NhVZoqb2gLo5NL2EMzc0ySNdSxp5cvSz0pRd75emmq2fWrMNBvHOHbIn+go/eZ69EwC0aFwCT8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3FE0CDAD5DCD3E4F9E85A7D589A9FF22@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03085969-6ff7-4e8f-758a-08d81f20fbef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 07:16:19.8058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KsaAkmKcJ02DHgQjPvsgdJJqEbNL4W2aKjINihrnCwPeHv110Kgl1aR42LianeKVW3mZ+TlTcoW9nHCCwFLAsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5621
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-03 09:00:44, Greg KH wrote:
> On Fri, Jul 03, 2020 at 02:26:45PM +0800, Peter Chen wrote:
> > Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> > better we have a unity API to handle both USB2 and USB3's power, it
> > could simplify code for error handling and further power management
> > implementation.
> >=20
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++--------------
> >  1 file changed, 29 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > index 19bbb5b7e6b6..bfd09aa98c12 100644
> > --- a/drivers/usb/cdns3/core.c
> > +++ b/drivers/usb/cdns3/core.c
> > @@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_switch *=
sw, enum usb_role role)
> >  	return ret;
> >  }
> > =20
> > +static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
>=20
> Please just make function calls self-describing, instead of having to
> try to remember what a specific flag means.  This isn't as bad as some
> functions, but the general idea remains, this should be 2 functions:
> 	set_phy_power_off()
> 	set_phy_power_on()
>=20
> no need for the cdns3_ prefix, it's a static function.
>=20
> Then have those two functions call a helper if you really want to, but
> that means that reading where those functions are called is obvious and
> no need to backtrack to where this was declared to determine that the
> second parameter meant on/off and not is_disabled/not_disabled or
> something crazy like that.
>=20
>=20
>=20
> > +{
> > +	int ret =3D 0;
> > +
> > +	if (on) {
> > +		ret =3D phy_power_on(cdns->usb2_phy);
>=20
> See, phy gets it right.
>=20
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D phy_power_on(cdns->usb3_phy);
> > +		if (ret) {
> > +			phy_power_off(cdns->usb2_phy);
> > +			return ret;
> > +		}
> > +	} else {
> > +		phy_power_off(cdns->usb3_phy);
> > +		phy_power_off(cdns->usb2_phy);
>=20
> Ick, even worse, this needs to be 2 separate functions as there is NO
> common code path here at all.
>=20

The purpose of this API is adding two PHY (USB2 and USB3) APIs into one
private APIs since two PHYs power operation are always called together
and we will have more than one places to call them.

If you think it is not necessary, and make code not easy to read, I
could skip this patch.

--=20

Thanks,
Peter Chen=
