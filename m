Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D84264037
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 10:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgIJIkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 04:40:16 -0400
Received: from mail-vi1eur05on2074.outbound.protection.outlook.com ([40.107.21.74]:1839
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730252AbgIJIhL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 04:37:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWMQwGH3RNaN7nPa9RVb8i4Qh7JTA0/sRcl7TkCh08t/PvTAucubQNLKZMBXDLw8pBNDoVKan92Yt4rW6pjFnyisvz1ZerMAdPhfWELxjS906t+ptdsTSg0NGcPVCMyv4T83iKuyMVJSru7H6pdUl/c1EkhmOxnXeIKfBH8HKbthQcflZjifLnwtr+FW8pIxxlZhCafNa2CxeW0jopvoURqVyqsRp/ATvUlv4xdChnI9W1WrpXKV6WdvII872wlK5P514aHxgO8wuOwcFbKOEhzLGFgspGzRWHcLc+30CWtLpTHlruigOeyI1Tw2b9adm3VtyBPuVBTTQ8bwx207NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JCWMWl0BdLjYLNIoFhv9InOR8qWIU9h5Tb0kunlHVc=;
 b=Nz8R27gjyD51IgDwpfNIU+SiiuRzSmyFc5Q69x7U3XeN4EUMBKkIrlmr9mNmTQJlgeMGyzBwsNw2R67X7tw74MZhYkjKovlq3HGf0jSYAP199O0+m4vv5mo8ZyVXXklINKX9uKXSnbBoZBsOGZx9EqaYqioM7IIoDsU/7kA7asyOcLz1tx4QSSGTviV/YCHIAi7q6DOTRphFxfpsGsCqKblnF33O1TueP9LrjkpiroiHWB98jMYAPAIhZJj4z8E1hWD6sn6rJE+KOSqslZvHz4bRQjknVYrQNYsciIPQeyoU2+QRAtN4ehr0EQIqkLyOTqj6tFPLrYulQc5enG+/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JCWMWl0BdLjYLNIoFhv9InOR8qWIU9h5Tb0kunlHVc=;
 b=qIrSY8KFfsrg7UqrHhl0iesWJOSSo84UTthFGqNZhZrKT7mtDe7aJydhViBEcIUfME1nVltJwlzW6Tsj+avLbnXj+zV+8jDEqeVua1rebLSnvgZfBKG3wTbFZfrdXrz/OVfyfevgm2QHxj+7QNYqW3nSXXaTIsp2dRy7uGbNCE8=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3768.eurprd04.prod.outlook.com (2603:10a6:209:1c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Thu, 10 Sep
 2020 08:37:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 08:37:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at
 completion correctly
Thread-Topic: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at
 completion correctly
Thread-Index: AQHWgDxDB58nIRxd40yfTFLDkPKoTqleUUeAgAAj8QCAAyT9EA==
Date:   Thu, 10 Sep 2020 08:37:05 +0000
Message-ID: <AM7PR04MB7157725E8A0F6B6453ABBE108B270@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-6-peter.chen@nxp.com> <87a6y0n5sq.fsf@kernel.org>
 <20200908083420.GE17366@b29397-desktop>
In-Reply-To: <20200908083420.GE17366@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43a791db-9234-4c7c-a04a-08d85564b2dc
x-ms-traffictypediagnostic: AM6PR0402MB3768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB376815C163600D556F8BC19E8B270@AM6PR0402MB3768.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UlfsorQe/8mbCEAXh4BXPVmSgjo3jGZeQi0zPx5Itz/EdZWEuF9dDQDJyYXdjnK94FhL0/M1TNdldmvU3ArgVyqmnxQJMsA37P/GX+vuItxiyX8/i1hLaG4n1tuUGrHSx2DVeJGKkc5HjHiP7vc91gkCdjLzl1aeaDSaKs3saesfkAIfmBnc0+S4FHVy9QgH7qNH0vjlhT733AKFR7ahW3H9Bgyq3nI6UmiUwHREuQCuQSbN1S5biPwUM5Qw6UfDZJ83Lokovz56EBuV5vAMt/aOSB925P5yfA7bPLk9XEp0p91Fv9sL5iX8aruFwka0qbWL8usPSR1aLpCl4vTnKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(86362001)(2906002)(5660300002)(52536014)(54906003)(4326008)(33656002)(316002)(8936002)(478600001)(83380400001)(26005)(66556008)(66476007)(64756008)(66946007)(76116006)(9686003)(8676002)(186003)(66446008)(7696005)(71200400001)(55016002)(6916009)(6506007)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WjPYQb93y0OB2p2uPSbAtu3aN/W5rckTof4ffDTluc3lH8xxG5Ne1HIPR5UFTkjaVw/YVGsDWXbebj4nlxoY+QXXRhv/UoDwNo9/5CUjR0devXUqsZ2BoGjpLNh46lhqjcjaB53Z0EB++dxelETU6LTrGY9EPgJojWu05gB0hjG3o6OCY1P2vFd5BMamYyZFL9oK4j2lbUxob2MrBA9S2rehEQds/DblVQzJPPw643rRzX1x9EfiYhPRLuemDYgdTON3tilFDDJbAvt0HpgW8cu3aNrP5MP9wvVzL9MgzGoopBIV5fcYu8xOabn9nr3UBeDPHG1FBvRdWfrfoNw8dQQwjgJFhs375lYbIwl5LpVWN0clQqGRl4QGDMgwgMiyZ7xhb3FAqS7yb9dL1pX9HApHZqe+uteiClOr+3p1dpbTqmiTNmcEfZL13FTLZ+KQVDj86QfhMQUNfUQFVw6m3cGI4bQVdj9bmdFTM5/eEeEXP+W73xGCTLhEyblBn3sQ9JsazSIByRJJgn9OKDDysf/hDAqUDVrevuLl23tLF+1rzMNq98r9IUbWPOobiCiI9TdTYASMSD0mNv+X5S6dY6ORI8prZleqDvad9dSGbrwWVVe5FXbVDGuAb2bQt94Pr1n++igGW7F3T5vBWD/4Ww==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a791db-9234-4c7c-a04a-08d85564b2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 08:37:05.8012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWxpmkblLO2l9okdMPog6ESyWwNXiQlEQqoN5gItDks4aqmW/idy518/FNE5pPFS4d6x9UKtH+wwBuyGh9FuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3768
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


=20
>=20
> When I debug sg use case, it indeed took several patches for all function=
s work,
> and some patches improved the old patches since some short transfers use
> case did not be considered well.
>=20
> Using this patch, it could let the completion work for both normal transf=
er and
> short transfer. So I prefer keeping one patch.
>=20
> > > + * Then, we check if cycle bit for index priv_ep->dequeue
> > > + * is correct.
> > >   *
> > >   * some rules:
> > > - * 1. priv_ep->dequeue never exceed current_index.
> > > + * 1. priv_ep->dequeue never equals to current_index.
> > >   * 2  priv_ep->enqueue never exceed priv_ep->dequeue
> > >   * 3. exception: priv_ep->enqueue =3D=3D priv_ep->dequeue
> > >   *    and priv_ep->free_trbs is zero.
> > >   *    This case indicate that TR is full.
> > >   *
> > > - * Then We can split recognition into two parts:
> > > + * At below two cases, the request have been handled.
> > >   * Case 1 - priv_ep->dequeue < current_index
> > >   *      SR ... EQ ... DQ ... CI ... ER
> > >   *      SR ... DQ ... CI ... EQ ... ER
> > >   *
> > > - *      Request has been handled by DMA if ST and ET is between DQ
> and CI.
> > > - *
> > >   * Case 2 - priv_ep->dequeue > current_index
> > > - * This situation take place when CI go through the LINK TRB at the
> > > end of
> > > + * This situation takes place when CI go through the LINK TRB at
> > > + the end of
> >
> > not part of $subject
> >
>=20
> I will make another patch for comment improvement, thanks.
>=20
=20
I find I change the function from handle request to handle TRB, so the comm=
ents for this function
needs to be updated accordingly, it needs to be at the same patch.

Peter
