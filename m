Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43000564B67
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jul 2022 04:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiGDB7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Jul 2022 21:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGDB7u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Jul 2022 21:59:50 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C0C2DC7
        for <linux-usb@vger.kernel.org>; Sun,  3 Jul 2022 18:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7u6qJ9425l1QQ/dBhY1NGtR4Zdz2eMlWv5AFl35PFkOIKbE2iJKLikW3YDgTHdKnHdlYnbIHtHIK4ulmlWC7qZjzk2ft6ikPN+CAOrstV/IMDIigTHlG1WYm67SWKC+XBPTOsle5qrKyo5ytIxC5KhTXWBhBIp5Eu7qAHz65BV9dBGaLIXPkrc7L+UreOB1+eh4wVWV4ORZdLCKhVvVOPV9QXyeh9rPp23e0oBsMGJ+Dq+N+B1dLnih3JLXKYBKTcON9nRwvgIoA1bv419xQbdfJGCz9WWW6dVIi3tvk8H2KG2VmUEVxRxRXDS98nB6p/ji6+EQ3AkT9Nxer14Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0ax8+hpXAnlNhWgmWA3oEj30A5jZSXCdCE3kqtNU6g=;
 b=c4WHftUbnvMNroCAZxVUFf7e8QYMuUOodJM8JZCsKDWFvE5+Phqv8mgAYPEE4CjVP44UgznxPc8Glfce3IzMcIkL4lXLS02SwyrLan6K5sqzPQ/9EuPZwJ9voeYbwicMOUFdf9jI2ImNbAJwv13xu9ba1vNb513+v/cCKpQhpMq8j7iUEq/ApKp6oJnEAgdYgT6EehwGsSi5PBb2ns1SGuSJXzB+psuK21T8ittFam+BD/w9cefW7SJwRX9fYu8FOZwAmWHJZZ+g4YrOO8zg8HSnFSneXCW76L2G4XazHOl8yQUO1uSaCCm+MpjvDt17RHYzjCBceWkxQssg3jfXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0ax8+hpXAnlNhWgmWA3oEj30A5jZSXCdCE3kqtNU6g=;
 b=V+TpjQxQKJJJdM7PIq1eJw5MnvdjG+OgvGOftb4fXib1Blo5DIQmD/Gnsrlcbe6UyClIvsaNMoN92xmUM/pC/DU6x5qHKne1IvBao7JIx7IoRWC/skWlT84xpaJIU23EDF1XqKItDdp4Ic72QkXiE59yYd9kSt+OHE/E0kmi9nY=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by DB7PR04MB5306.eurprd04.prod.outlook.com (2603:10a6:10:1f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 01:59:45 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::30ae:e991:c3ce:a0c6]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::30ae:e991:c3ce:a0c6%9]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 01:59:45 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: chipidea: udc: check request status before
 setting device address
Thread-Topic: [EXT] Re: [PATCH] usb: chipidea: udc: check request status
 before setting device address
Thread-Index: AQHYhq5WOiR0/OrgBkeSOefRZTwFG61r3heAgAGmQiA=
Date:   Mon, 4 Jul 2022 01:59:45 +0000
Message-ID: <PAXPR04MB8784CA907581DCFDCFD196128CBE9@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220623030242.41796-1-xu.yang_2@nxp.com>
 <20220703004209.GB1382015@Peter>
In-Reply-To: <20220703004209.GB1382015@Peter>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c28b701a-c812-478a-dc88-08da5d60de75
x-ms-traffictypediagnostic: DB7PR04MB5306:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aQKCOiUi0EO1C9ZxCIJb/Zpq4IY8nolYJAV+Gpwkjz1sTWU8wYq4AFOoNRmf3lypMAn9/AYLA4J3nJuU2NoYxQQmDlZvvZ2BjnyIV+psA114mN31KUwF5AUuc065Z+Bn1q2cFzNGAyiJn7m4qdkAB57dxeiT9/Zy6CKNSXI8ZE4opVsRrCj6kUq++3dV9yTN8LPTyM+IP/VJ0T7qxG9OseqgbaPNfeq9mUu06wWL7Hhwbys163R7th8MbIa+Oh7yV3pFGaKlqBPDv39++iJYcfkzVRJNCWQSsCv9k2oZlCvptVgMYOwJaJxk4/VmNE9H8S2MOfnBlL1PUkuFoSHa846EQxrn1TmOVIHWEciZc/Y32A2ircs0V30xTlrnz6AMH/WCk7xZ/ccRUiI5TX1SjhifXnTjwK4hP/vLG3c3gmsSpttrYZ4g7tRcqqP7L2dLOzISxYzt30/FFxXudnoPlnZJUgrRhlNd/i19JDoX+YOa5FNyG+QQr++LEB+BCN3dxxUqSz9Kga9DgQxfOd+njMRF2fAkX6OL0eilNWH/Jw3q/YMfnG66kbQh4QNwOnKqorFQ2AdyEvBUinA+X88LF4EZoSPwYgKIl+YMh01yoSnPt+1c8SFni1E2jFuuTyPn/XP2QM6hiPym03X5TogLc1XXrEYUgiv+1vidXJLC4bzpj5m26olHH7v/+EXdpicFyLwmjdJln83Zj2UbNjrZCLRxFL+aoyoUJHsMPRMx3TTrqRwbzYnH0QRTm5CyVlylIlV5logqrHRO7lNrkZAIb9YRtE43o78sXaRFa+UhTIVqP2oaZt7tWsw+rqCbhOJw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(5660300002)(4326008)(76116006)(8936002)(26005)(53546011)(6506007)(7696005)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(52536014)(83380400001)(2906002)(186003)(38100700002)(6916009)(54906003)(55016003)(478600001)(9686003)(86362001)(38070700005)(41300700001)(316002)(33656002)(122000001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D1L5WawHUSH1z7uBw/+PCIWoNKZUwtkP3SmEuPMDwhArrWUp7rC4jWjTXIiC?=
 =?us-ascii?Q?9ShVO3oml9jr88lvDHjhSdb6XxOQe3JgOyP+cAWcGrYWG+Lk83KjfHQ+QL41?=
 =?us-ascii?Q?bq1+9UTQsJ8hFyTGXFKVYkgjp8cBCbfKq3FZDRA/BZxn5rmFo74lsOtg4clH?=
 =?us-ascii?Q?4Qb1JA/RJXFlsGIpWpxzzwp3BRDcNolR4ZNqZlbzCobMIa+/UDjCS4aKkn8D?=
 =?us-ascii?Q?hn4bam+vSYrfiN71jBxgKWyzviYz+B6LWjfhWThDgWSPoHCvtCm+5Q6pz3x2?=
 =?us-ascii?Q?Gk6a+ntYQC69TgxQNTnVktpQeT7/UyLFDIWbQ9z15HV/ZJ6Bs3/YxwuUB36t?=
 =?us-ascii?Q?APgMyMGRA5mKDbKs0Ro+/8xghL6oizef76IYC5kjOK8BqS4rxBxPsoYpJpKm?=
 =?us-ascii?Q?lKz2c0VBmEVtM2h8qwdiL1+KZXcQptZoxQnwz3xTBagmFUd2OEGHiFS/x0H2?=
 =?us-ascii?Q?1oBQvtnOOfd6pJjPVACxYqRYk8RWN6Xjrx1YXexIheloGymKJ04dE40jSLC4?=
 =?us-ascii?Q?8gPKCGSGYdJsUEatNKUVqk4QgPJgquELNynN4ZtzIf5jeQdkXEtY2D7PvJTn?=
 =?us-ascii?Q?btXYhjRtBJob44JlTetYbMkmSzMcPUz4Pf0DXXeQf8TPqkHhcWIW8kGmw5ZC?=
 =?us-ascii?Q?/Z+hNsn5hbMXrZNtTE3qc9zsJ0VaL4BaV9UafGHS2ShPndxv0iCMqEVKqGaY?=
 =?us-ascii?Q?q54b9HthO9AT2q00dZET/tx2q7CSW5mEUGLR7E74ci1H87nwHXPo/fSMLbVm?=
 =?us-ascii?Q?DWSQQ7qZ0mEBTeq7AG1CqzNEdouTw5ILrz3065/tpSwFq3p4HUXBgzV9KflY?=
 =?us-ascii?Q?AnbE9Torq2blVoVCC661ni89nM62t/Y5etLzv40c9nneV7qc/LiAWaw9ipvu?=
 =?us-ascii?Q?iQfwBITiG0qxmO5YQydBcTePqnBRmtqTd5izC2VVN0siWP5qjaBz+2z9SQ/R?=
 =?us-ascii?Q?9aE4k1mmXclSZwmzOGy5lU2upDRhnIo4dJnCstVwVgjxUYIS+sF0bgD+EOai?=
 =?us-ascii?Q?lw7Av8SlWcv72bWEJALHDbBP0dEkLPrCtH3scHUBe9+qJya3U4xrlkGnjC6H?=
 =?us-ascii?Q?kdQWuh0zTZq3vK48FZinvQqjbVuFg4llgWnPNEessyrmik854Zi8wZ/2Ms4u?=
 =?us-ascii?Q?dCLag3cEaSVH854STcboc7QjeIKf5qJ9I+okz7/0dafyz6A757lsLugEqEHd?=
 =?us-ascii?Q?SIcVZpM1lxVVqK/rJj90qxe2abwFv5wW+JdeL7TSBx51EBRuXUQGHz+Rmahj?=
 =?us-ascii?Q?mjnyjLPNy9SAfKoxmr1VjEaa5vMssK4BmximrfMhwX19m7GvC1tSpM3JPeFK?=
 =?us-ascii?Q?C4f30Ff0D0y7CbyskevuLd5ORk6mgXI+pmpZHkKqAG/5pe9Q4nd6P19NRJ6D?=
 =?us-ascii?Q?iZehht44oHMPTtp1l0BwtCy6XLSRB7wJF3qVyUtmyFWziPS0Nlh0yQ3tg0+n?=
 =?us-ascii?Q?UmVBShkhTSJXhHMH7JvI2xCM5qOuNEczp3uiVCsyGYk8RJMF/f/P51t2wEk2?=
 =?us-ascii?Q?9tbCyRhfmTt96eyXAAHsdJUXAr47O7XP3cdf4lexxlPs39NR1hG8v3uDymky?=
 =?us-ascii?Q?1Z1buRlQ47lpOB50Emg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28b701a-c812-478a-dc88-08da5d60de75
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 01:59:45.6388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pwL/zSqZi2Ugx0xGaou1iBL0e4x/3EMB5BUFlbNNVFytraBQoZ3r8JYEue2wT+aNCItD73OXFD9CnruPvuj2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5306
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Sunday, July 3, 2022 8:42 AM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Jun Li
> <jun.li@nxp.com>; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH] usb: chipidea: udc: check request status befor=
e
> setting device address
>=20
> Caution: EXT Email
>=20
> On 22-06-23 11:02:42, Xu Yang wrote:
> > The complete() function may be called even though request is not
> > completed.
>=20
> Would you please explain more when the complete() is called but the
> request has not completed, and this happens before set_address has
> finished?

The following sequence will be a case:
1. the HOST sent SET_ADDRESS control message to DEVICE.
2. the DEVICE acked this message and queued a usb_request (0 data length) f=
or future IN transfer.
3. somehow the setup interrupt is not cleared by USB controller or received=
 other setup token rather IN token.
4. the driver will go through below functions:

isr_setup_packet_handler(ci);
  _ep_nuke(ci->ep0in);
    usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
      req->complete(ep, req);
        isr_setup_status_complete();
          hw_usb_set_address(ci, ci->address);
            usb_gadget_set_state(&ci->gadget, USB_STATE_ADDRESS);

Xu Yang

>=20
> Peter
>=20
> > In this case, it's necessary to check request status so as not to set
> > device address wrongly.
> >
> > Fixes: 10775eb17bee ("usb: chipidea: udc: update gadget states
> > according to ch9")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 0c9ae9768a67..8c3e3a635ac2 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -1048,6 +1048,9 @@ isr_setup_status_complete(struct usb_ep *ep,
> struct usb_request *req)
> >       struct ci_hdrc *ci =3D req->context;
> >       unsigned long flags;
> >
> > +     if (req->status < 0)
> > +             return;
> > +
> >       if (ci->setaddr) {
> >               hw_usb_set_address(ci, ci->address);
> >               ci->setaddr =3D false;
> > --
> > 2.25.1
> >
>=20
> --
>=20
> Thanks,
> Peter Chen

