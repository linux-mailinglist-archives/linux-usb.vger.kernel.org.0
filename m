Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927F5773CA5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjHHQIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjHHQGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:06:43 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE5272A1
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm+g3to68SnEA1VdWM+AtYsH/+VExnwnT3hiCTBzKxj5ANh2qF08J5tXdXL3vlcTFKixmxjpGdtXI1AFzt7wVAGN9+GW4RJuUNfHFnpbMD1Oejf6p4DEMOq7Y1ccruImFTzKwj1RddRcAdIDfwi+3X0OMAP9jAtAiYPwmZdSMkWouJOc6sJ3VJf2YM9K+HY2xZTmG5VoNBDufdct6jvVrNH8wjjvGoZdfUXyWESxHVOPxEPp8i6HSw9Y8P1+rv75FACJ3CkHTPb66KtGyX5EYb8wUwAaIKx8PlVw7EL5+YRFjGI9HjT92U+JmsLr5dU4rFz9GbfO3XygzURg4iSI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBbMAAjpdRxhUMz+ezdIRAEUfsHIBOYpjLHaKcqwJog=;
 b=J3eB/q1ys6V4xyU2ytNBOrxlcFgUSxG37jS1oH41WDM1jCdPw/01Q0FXJLUBi9OiFrnWBIRf7ULETcZfHGBL2Z5SQLo70ccINqD9nkZyUwwKMR1vPg0V0CdzENWLr8jkW0SuODibP4eTeTIfGakqcNURy5uYflZ+JN4YrdsRC9C0I+92YIYPX/IVuJ28pNcawviby71el3a/oTohHbr0zCY8Y5DUJJ5psB8zbcNrQ8GtZq2oaMfbEI3GmLixHqeXdpKYq3s6OkwAfA2fl6seKzcTcC8nB7gA4PYLBZUv0dltTwLgYGJ7bq+CCl4Gn+dAPJ8e0whQyHpMhtV0YzlyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBbMAAjpdRxhUMz+ezdIRAEUfsHIBOYpjLHaKcqwJog=;
 b=ML0UgTvGftaCrb9EjzYJwYPXt67muqsgp3wvmpOLz6GQwpnOHdFkMz+fQKMSDpiw85aVEGDCsWd9HNF4Evd5+O4BdHg1lVLo0JIqhHmkMB4XD0J2p7UF/6ipCKtveSXdDLoxsJSLe84tcfcD4PE0zviJAvxsRrnSeQtZ7u0mztM=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.26; Tue, 8 Aug 2023 10:03:39 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:03:39 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Topic: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Index: AQHZuWobPyY9hy475kOcvOyONwwurK+/nFYAgBC7uaCAAI4JAIAPXlUg
Date:   Tue, 8 Aug 2023 10:03:39 +0000
Message-ID: <DB7PR04MB45059312D4FB6ED356E0A7958C0DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
 <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
 <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <fbd403ba-b6aa-47f3-a361-b122a028334e@rowland.harvard.edu>
In-Reply-To: <fbd403ba-b6aa-47f3-a361-b122a028334e@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DU0PR04MB9562:EE_
x-ms-office365-filtering-correlation-id: 83467489-6518-47a8-e34b-08db97f6bd3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnuoInfNGS0tmsYkm3Bo9CnSHvuCVv5W6yQUZs0c9B0x07kh+7sQla+imZHJspNqrSV+X34YrkkvTOf6cbD1zmVtBroLlAvbRKAH+jJ3JhVRd5uENrhV0XBucj8oadF5v9fUmN6ruEXDnnbc49/kt3y2f0yhiNFcMOLZgfVobXVGnqRgT52xwCl/XiLLBlJY2B4p2e4Yfgh5fVYvWjfmbTF+F4ySQAgYuzwA5eA+IoG58oy11CbbYwhJIsiLU83Oznfkt7sgh3nXlMk+wCjjd1djdZlhXiLeOclOAzj1UtFUll+lbtmuZiDGBFXQl382QhAz6WapQe2o2psNH8u9gObhMmMi2le31uP9YPvoUCxA1vc8Q/5XzNUwvFo6+pdQV2tMxGOTG1uO0MxOtdtkMKMmI3xQsKO0K1yXOC1lZnMZiziSyEkSSz6UZSWHwQQMvGTF/KX2m0KnFDcuXLR5STttczhC+hGU/q963QdrR15flq5vExGu1yRNrNzJyZ5eS9nitJat+CW6nBLXwsZnUhKEVw6oFwyXF0EAtUQtUVWdrr2rcz1Ol+Ibz9/wkjp7Q/IqRxXe5zzDpt8awS5TcXSdxT5qvi4QLJhRWiPxlIk8opVOgZdcX9Zwd6yAFp1A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(1800799003)(186006)(86362001)(41300700001)(52536014)(478600001)(6506007)(8936002)(8676002)(26005)(7696005)(2906002)(5660300002)(83380400001)(54906003)(71200400001)(38070700005)(55016003)(316002)(66556008)(66476007)(64756008)(66446008)(122000001)(76116006)(6916009)(66946007)(4326008)(38100700002)(33656002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?innxRaQaelsiMuQjrBMXIFr49B972jWGNxsX1KMob+5mv0uRzF+TTeqYvBY0?=
 =?us-ascii?Q?a+Jb9dErK7L5K/RgC+OT1G0wtFeeHB8QpFpvBTWWpbUvWcnbiwj4BfKrzCXz?=
 =?us-ascii?Q?wLIdW+T2TGjrcTBHHmoG5Yf46Qc9bvdM7m+y4505WBfFuHExgbueikav6l/n?=
 =?us-ascii?Q?btueIKbY6dwtbSdwu/RL4WSONB785rJORfi+gmePy+2lipZ6Pnu69MPKbiwL?=
 =?us-ascii?Q?PuTptyh2NYzRF44bHsPExJk4Qx9sfkZ3yhOA70zIgUC5Q9d/VIYw9XOBT/Ic?=
 =?us-ascii?Q?RKjSu7QNSzwufAi0ib+bPMQkpsxNIujxE+Q3BNSKXCvppeEkoIy+jeNPP1Zp?=
 =?us-ascii?Q?Y6Iup1FfL5KxNnkMUd/ThH/oFPn90LT6330P5AkWFv6ttOeG6W9q03pZhmc5?=
 =?us-ascii?Q?dveUtqc9RmbX28HMwY4abYvN7fwvJ/Ef0zEOLwCb37m5fcomVwCzoY/M5EG6?=
 =?us-ascii?Q?FpAdGDQOUr/T/1pBZA1RWjcxuG4PIPrnQqfvEtvnSZrP8UHgf+eFl+PuhJEH?=
 =?us-ascii?Q?irnRtx+nXMJRw6Vf4SUoSPHmzKE8WHOfjQs/+jNXtiNfUB+jjZWjUZvjElsV?=
 =?us-ascii?Q?vrcpNYf8yroAh2eX7FS1FSPHPz02DFD5TlEegp33RB2WEw7NoUIXXQFKZmKD?=
 =?us-ascii?Q?l/oh34liVzjYTaCbG9XcM1/rcBA8YaTzFliOfDb9/ecqoPHzfyZp7sdGH3R1?=
 =?us-ascii?Q?kZ/NMrDAektnpj1fv7gPGru+4nwK7wQRdvfjSIkWlZIW47xZZXXbqETJI/fo?=
 =?us-ascii?Q?K5ON4E0ubtYHV6qjNXOBIoZ2VPXWA+aig2w+CQjFnkebYeefyHQJOH3ftaQt?=
 =?us-ascii?Q?3e7N16wboaWFhJ0Lc/E3DQl3TNXwf9celcHfrho0OxrB0iuT/Uz576NYiqEM?=
 =?us-ascii?Q?WKgmQreM93A2CzeRu+UsP4vFFoUpluSawDuSS4i4aT+MsLsMQEBX7Py8qbqD?=
 =?us-ascii?Q?2bqS+986QIfS1t34WO+DBzh+0dSOiuzWJkPr+9Dw1YuIUu+umiU4YE4L/S2j?=
 =?us-ascii?Q?+9J2QQGlzhY9v+3+hQNH4usylW56tbnT3pJt8z8g1R8kJbXF4FpJvbUFrYMd?=
 =?us-ascii?Q?u9AGupsVzs9SbWMCOQQ96Zf8BkA4qsTn+t0gAzqrtU+SvGr+VPleVdw+jP6r?=
 =?us-ascii?Q?1xvWApfqVCz1bof/jdT6AZOVoGwh3rFIb2l/gN0Ryd2ic+OyUkwaRESgZ/PW?=
 =?us-ascii?Q?pDlL+LiqVTExhtfcIF6wa3VhEewY9pLliruljgUV/jkMNB63w59iKLWJKkre?=
 =?us-ascii?Q?Gl3Dw3AP87Iz/M52sYwJk/zXMXcdQwPEpwKv8nlMMFCBH9w+ob9bwnvoK0L7?=
 =?us-ascii?Q?OMkQ7hgrFieritDNZbnA9nJPBJAx6EE01G8PwDkLaqpQhGpnKbqQpUHBDD7z?=
 =?us-ascii?Q?7INWwmYODHIzGGdM0jyr6bPozacgcJA8yvogdLkDoWXaotr4GR/giVj2oXbu?=
 =?us-ascii?Q?0VfkUAvbdBxN+5sssNcbmoBSS9hCFpKDNeZLwGelD6ftib78lIkslcqrsIn4?=
 =?us-ascii?Q?fu+B7/pk3HS0Ht6kMfcOFjRNhR7xnuLwr09Ac3A50BfutV8WsKERh/wAKw1C?=
 =?us-ascii?Q?XME9pgP9GxCzKXEN7o8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83467489-6518-47a8-e34b-08db97f6bd3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 10:03:39.5490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OufbIMwS+N3GHR6CfZK7vPXEbFHsMbsDWA+ddrUps5pGWCSg9MChnMXoLmbkqZLRaamvX8hPwCYepH2O5svTHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

> On Sat, Jul 29, 2023 at 06:55:07AM +0000, Xu Yang wrote:
> > Many thanks for your comments and suggestions.
> >
> > Yes, there is a "live" variable in scan_isoc() to handle the case where
> > root hub has stopped periodic schedule. I have rechecked the root cause
> > of the issue , that is the USB controller has disabled the port (PE cle=
ared)
> > and asserted USBERRINT when frame babble is detected, but PEC is not
> > asserted. Therefore, the SW didn't aware that port has been disabled.
> > The periodic schedule keeps running at this moment. Then the SW keeps
> > sending packets to this port, but all of the transfers will fail. But p=
eriodic
> > schedule will also be disabled after a period of time. Finally, all of =
the linked
> > itds are penging there. The code can't enter into scan_isoc() if only U=
SBERRINT
> > is asserted.
>=20
> That's not true.  The io_watchdog timer continues to fire periodically
> (at 100 ms intervals) as long as isoc_count > 0.  The timer's handler is
> ehci_work(), which calls scan_isoc() if isoc_count > 0.

Yes, the io_watchdog timer will cleanup the isoc periodically as long as
isoc_count > 0.=20

I did see all of the linked itds are pending there in my case at the end. A=
fter my
debug, I found the chipidea/host.c had set ehci->need_io_watchdog to 0 whic=
h
will have impact on turn_on_io_watchdog().

The host has enabled 1 intr endpoint and 2 isoc endpoints from USB camera.
Therefore, ehci->intr_count is always 1 and ehci->isoc_count is changing fr=
om
time to time during camera is running. When PE is cleared by HW, isoc_count
may be decreased to 0 after scan_isoc(). When turn_on_io_watchdog() is call=
ed,
EHCI_HRTIMER_IO_WATCHDOG event will not be enabled due to isoc_count=3D0
and need_io_watchdog=3D0 too. When isoc urb is submited again, enable_perio=
dic()
will still not enable EHCI_HRTIMER_IO_WATCHDOG event due to periodic_count>=
0.
Then, the linked itds are pending there as long as intr urb has not been co=
mpleted.

Thanks,
Xu Yang

>=20
> > For this issue, I think the SW needs to aware that the port has been di=
sabled
> > although PEC not asserted by HW. I will send another patch to fix this =
issue
> > later.
>=20
> Yes, that sounds like a nasty problem.  The kernel wouldn't realize
> that the device had disconnected.
>=20
> Alan Stern
