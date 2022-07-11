Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED3856D2A5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jul 2022 03:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiGKBgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jul 2022 21:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiGKBgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jul 2022 21:36:44 -0400
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30061.outbound.protection.outlook.com [40.107.3.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CA713D26
        for <linux-usb@vger.kernel.org>; Sun, 10 Jul 2022 18:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkg1wVJ1CSND4a+gQgdEjmMO/pElozVa6NsBu4yixc7SThta4brbO/Hd0fv5403W6ASaJ5GCQa1/rQYy5wVEYcfgRHo+Wnztggfgd+THH9oQtYP9kr/iswh2YDJwGwgTnCiE6XKRES5UDl9d/xk33uytgU9xSDXPQv5N5aVxPG9HE67VJSIydYRzIZ9nd9YB8hK+khPIh2etyUnAhX9aMAGVTZsgw0NAY8C9UaStj97JzglSrloORtx4ElMAGsQXogcDRBfWOZEgc8oV1eq9f0wWXG5XsMMfC0hx2tdTSQkVPS2xR1w1jCX3WufdGkJLlmRM133LUkga7vP5rA7MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8OKz2hfEbDo2Md00zMKJj6QlVdJYIpax5kQ00QOPSs=;
 b=ASXZvML6qqQWwvljvyu3/IsQ4XQwgzhu4JKRjCG2K3T+bCp1fUuDdUkzdQsXzwpPiAkYbkrFF6nY4MNu1UwcmiYOXKGhxiAAKTNZZzC6tOPu9s2FN/vKRaxtnKvs4RxWZdMnTYbErYL+oylTaA8X6XlVXuNXHzAMWxJ1GcT5bN1DcmL9ya57cip/7HhpSgj9eEgPFNtImufgVf1bN72RBDbOoThn7TVAAzj4fitZaU+SXsmGY6dPZcMx31ROoXnSO6T2OJV+w1kKVBt+HC5MsrHkvGdNEsA3UbxABXLFyoZWwJMY2KidSRJf3Md2CfP6nVTYDSaeFXT2E3VQ/JO20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8OKz2hfEbDo2Md00zMKJj6QlVdJYIpax5kQ00QOPSs=;
 b=a6MiV/dqg/GAUg+q1dqsoesrE72tD5tNutAeKA4YrsIdjAwb5MUrVrBkw1ZR2CCCPxYKh2rj+RdHGWmem2kBi/BCnM7olh0m0K7QkkxLA8DDXgm5RFWYPHzZyaxkryJrLRaFbNPXTAp9Bcau2IiXRydUmboVJ1TkkSEXs21sPIo=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by HE1PR0402MB3577.eurprd04.prod.outlook.com (2603:10a6:7:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 01:36:40 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::30ae:e991:c3ce:a0c6]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::30ae:e991:c3ce:a0c6%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 01:36:39 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: chipidea: udc: check request status before
 setting device address
Thread-Topic: [EXT] Re: [PATCH] usb: chipidea: udc: check request status
 before setting device address
Thread-Index: AQHYhq5WOiR0/OrgBkeSOefRZTwFG61r3heAgAGmQiCACGOugIAClRJg
Date:   Mon, 11 Jul 2022 01:36:39 +0000
Message-ID: <PAXPR04MB8784B4FE5F4F4F8EAE0315B28C879@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220623030242.41796-1-xu.yang_2@nxp.com>
 <20220703004209.GB1382015@Peter>
 <PAXPR04MB8784CA907581DCFDCFD196128CBE9@PAXPR04MB8784.eurprd04.prod.outlook.com>
 <20220709100019.GA1517786@Peter>
In-Reply-To: <20220709100019.GA1517786@Peter>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b288847-e25a-4318-0860-08da62ddcd55
x-ms-traffictypediagnostic: HE1PR0402MB3577:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjYHst28HHY6Exs9148qxpmMvKwi9hnZk0Yb1A+kZMvIqAW790rOZet/RxFcGeYnKbAec+DnHvOWFGWumFYaZcdJHVhJ9BZC9axZyzA1En3OUCROaP5ZtD51e4P9nnCJtnUqxqszPbkBgFfpFb6opq6hWv/cckykCSaZ+4HQl0hUKeW9hWdw+LGeoFEEifcNjmKaKv4WdReJOIltHUICmW5VSilQ6pvlz2bZXYX1ZxECYvlqOP6mbdlyyVL64VkRCUqaA6lIP7lz325BbarlFqmpZNtE/cJiWx2yrXAOHD4bEWUkWkKMvffw1tEAFD0xjc+q4dssocCgvbp+hMtoWUuLkPVqzzR5Zn6pqqwhDhZrU2e5kJU2LCUZ3QujGCB2aoaL0tPwi9gEewMUt1EAH4TyJHKFp3khggqNq5ImMkRl/jBs9xoAO81QlXhO/dzcFYtY4ve/HJ/1xdad320OiwwsMyHCQoJstz3LrME8fDkqF3CrNVDjq41y/Gq4lSXZqx3OLnWTwoOLDsFE6v22DqLZ5cE7xMXbtppU1T2GO2yGPwPAHZ3XJi5AP6Fjm+YCW9RZYBrpL8cyUXAT8AZSxKaYJshaoD7LGk0ntYBFxvdtbAIV4uyLBstUMcrDdPvTok5HlvPX0jx7MIJQmOvT4J198d/aF4aBlblBrdeVHJkkNGKYqf4zISHIXIyshT0+CxuV2sBIHGHCQ6Y6gBEXbp86gQfQid3jYnY9nSq8M4TmJ81f0zgz7jC9+oilRJTBWd1wKQGUvaXcQzkkPMxSx7LCRWu6cugwz52Epd29r5K/i/b93t+sWP7LbRduAcSD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(38070700005)(2906002)(6916009)(316002)(26005)(4326008)(33656002)(41300700001)(52536014)(478600001)(83380400001)(76116006)(8676002)(55016003)(54906003)(9686003)(186003)(122000001)(86362001)(38100700002)(66476007)(66946007)(8936002)(66446008)(66556008)(64756008)(71200400001)(5660300002)(53546011)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KUlXbccp96EUeRe3Q5pQaaCyqhXXkqHGYQlunCcT1sPgdL1TwsqJWnGDYkmL?=
 =?us-ascii?Q?0qj5pKpmK5xXAW6vv+AtzhK4jo9VxfLxpJz3B3AFJlaHjZPNdG3U6/b8oIym?=
 =?us-ascii?Q?/ddLDtaLM57oMr0bL/gDz8z5kNKyOyjZSfGBHbTwWGIuQIco9yXLObQ1bygk?=
 =?us-ascii?Q?xoFEYJRR7hgQ0JUEy0bSDY0lgRx2Eo0ZWG6KX+2awb5ql1/t3GPKzAvHjFcB?=
 =?us-ascii?Q?xJoEw6o37FI2qu5MpiCODZP/hIUT4OzlchNiHx2/EJS6yhUSamUihClT22nR?=
 =?us-ascii?Q?KWsr863GnJvF+VUgXgenvrGcWM1EklyiyZGji50VIB/oB4YKVod/AIetUOKz?=
 =?us-ascii?Q?ItndyObs+78/4avwGreOM5VEKYgL0mpIKKq2hKShe6OCZnEh8so+xZ5v/fq/?=
 =?us-ascii?Q?K/TvOVS/NEWvvxOFcKUc0b6q8Cud2tG+cHcRLGvjheWci6QrdGr3i254HN4+?=
 =?us-ascii?Q?YbUvX8Q+tGi9Wcs943Q9h1AhbqcB+GNru3RxfHdnNvuB2u6UdabbqameQTex?=
 =?us-ascii?Q?AJ31OHhUwfXcHUh8iP/Hi/ldso93+SP7reSpgjxYuVl55Sp51d5F6qVi9/UL?=
 =?us-ascii?Q?8y3/rUPKTHQfp6qF3BwSpM1Tc3kZ8lTf9WZwAgNl1Dri9OGQSBneLSqRX3js?=
 =?us-ascii?Q?4DUw3qTrlcTx3awqiCRw52PuEh1IOflA/x0ExSSijerevJv+bfs/GY7MPAca?=
 =?us-ascii?Q?j3d0PvILFNs099slyhapYnVxCcqf6+EKTpEsjBBDF06121TJPwmhQxNQfQ8Y?=
 =?us-ascii?Q?Rx8N4nhpeqaa5f9VgOx8HOcyjfyXrSaaIVrOOFDxNt2xfmAttg2a64srZkmd?=
 =?us-ascii?Q?g+7fiZcfd7EClwE+sYL+nzdPkHix/sa1mNFMojSmu0+aRhC8+7UYFmjOnDJZ?=
 =?us-ascii?Q?DT1I/TcXnTVFi3hrJwkg94rN6yoGQM8Op3cCRMD05q6UIyu9W+vPGk+LY7M3?=
 =?us-ascii?Q?AKP4mBzd/WTD5gMYaIb3X+P7xzPFEDdmdu7Rr3dtT7IYBLHOnXBhJSgM50dc?=
 =?us-ascii?Q?gnMXvxj7zIWdiFrPomBTAwUM3h8U7YGZerKNLnsAHOQAULO2Eu8TNtB6zvMQ?=
 =?us-ascii?Q?YusewZTEKZIRf/kRD9uY1ZiJDheMzK0Tfh+JcS6XU4Ub1iyeLL8SsEyhKT1M?=
 =?us-ascii?Q?jlUW8m8bSR4ra4CQdGdi5X5P0GEa2n1cSutbqCDpj6HgOSMFr7APSBEx3lzk?=
 =?us-ascii?Q?X6mMpr/JehW/uBfGzDOXNVD8i5h5aNWhLkc/Qmu815AXqR6g3PGWjZXCS1Bs?=
 =?us-ascii?Q?MRUSP7gcdI9BCZDh007nBvt+38qQzQW/Ix/bt3klYCWJplklt7YCYmz1PIvO?=
 =?us-ascii?Q?vdD9bTcwFWhII5fOW7sSHBpJJUSaeBYVJ0dEOhYhZY7eL72r96oLl6O4OZ0y?=
 =?us-ascii?Q?6mbgZ4O/Di9EOMOokhMswsKkadwEVhlntZyo1HZq91XvJvKdymvOkH90AeF3?=
 =?us-ascii?Q?yfZcapiWUsRidiApSaKduGzc3Ub/CSCU50dGAOx9/v0jVRRv/QucBC4clXHR?=
 =?us-ascii?Q?BdEnAsZ5SSJg2LGZC+JRl7vlqnbeOOdtWqrTW3bM13yTNID4v/u37N00wbT7?=
 =?us-ascii?Q?1tf4iXYqFxxLVqK6Ahk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b288847-e25a-4318-0860-08da62ddcd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 01:36:39.8074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WiQJ0l4i+J183wFk/q6I4wBplQSGfEldLUJe4Ru/ixKlIaGOWJDjwuMtPstm1uXjLz+5jlGmXc0+ykDmizpy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3577
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
> Sent: Saturday, July 9, 2022 6:00 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Jun Li
> <jun.li@nxp.com>; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [EXT] Re: [PATCH] usb: chipidea: udc: check request status
> before setting device address
>=20
> Caution: EXT Email
>=20
> On 22-07-04 01:59:45, Xu Yang wrote:
> > Hi Peter,
> >
> > > -----Original Message-----
> > > From: Peter Chen <peter.chen@kernel.org>
> > > Sent: Sunday, July 3, 2022 8:42 AM
> > > To: Xu Yang <xu.yang_2@nxp.com>
> > > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Jun Li
> > > <jun.li@nxp.com>; dl-linux-imx <linux-imx@nxp.com>
> > > Subject: [EXT] Re: [PATCH] usb: chipidea: udc: check request status
> before
> > > setting device address
> > >
> > > Caution: EXT Email
> > >
> > > On 22-06-23 11:02:42, Xu Yang wrote:
> > > > The complete() function may be called even though request is not
> > > > completed.
> > >
> > > Would you please explain more when the complete() is called but the
> > > request has not completed, and this happens before set_address has
> > > finished?
> >
> > The following sequence will be a case:
> > 1. the HOST sent SET_ADDRESS control message to DEVICE.
> > 2. the DEVICE acked this message and queued a usb_request (0 data lengt=
h)
> for future IN transfer.
> > 3. somehow the setup interrupt is not cleared by USB controller
>=20
>=20
> You mean even software clear the OP_ENDPTSETUPSTAT bits, but controller
> itself doesn't clear its interrupt, and trigger the same
> interrupt handler again?

Yes, still not sure the root cause of this werid behavior. Will dig it out =
later.

>=20
> > or received other setup token rather IN token.
> That's possible. Have you found that at bus analyzer?

Not yet.

>=20
>=20
> > 4. the driver will go through below functions:
> >
> > isr_setup_packet_handler(ci);
> >   _ep_nuke(ci->ep0in);
> >     usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
> >       req->complete(ep, req);
> >         isr_setup_status_complete();
> >           hw_usb_set_address(ci, ci->address);
> >             usb_gadget_set_state(&ci->gadget, USB_STATE_ADDRESS);
> >
>=20
> Would you please add your above description and send patch again?

This patch has been received by Greg. Do I still need to send patch again?

Xu Yang

>=20
> Peter
> > Xu Yang
> >
> > >
> > > Peter
> > >
> > > > In this case, it's necessary to check request status so as not to s=
et
> > > > device address wrongly.
> > > >
> > > > Fixes: 10775eb17bee ("usb: chipidea: udc: update gadget states
> > > > according to ch9")
> > > > cc: <stable@vger.kernel.org>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/chipidea/udc.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.=
c
> > > > index 0c9ae9768a67..8c3e3a635ac2 100644
> > > > --- a/drivers/usb/chipidea/udc.c
> > > > +++ b/drivers/usb/chipidea/udc.c
> > > > @@ -1048,6 +1048,9 @@ isr_setup_status_complete(struct usb_ep
> *ep,
> > > struct usb_request *req)
> > > >       struct ci_hdrc *ci =3D req->context;
> > > >       unsigned long flags;
> > > >
> > > > +     if (req->status < 0)
> > > > +             return;
> > > > +
> > > >       if (ci->setaddr) {
> > > >               hw_usb_set_address(ci, ci->address);
> > > >               ci->setaddr =3D false;
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > >
> > > Thanks,
> > > Peter Chen
> >
>=20
> --
>=20
> Thanks,
> Peter Chen

