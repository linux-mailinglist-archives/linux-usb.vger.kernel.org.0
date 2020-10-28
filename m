Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E48929E076
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 02:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgJ1WEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:04:52 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:16774
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729468AbgJ1WBB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:01:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO7oreyqx/zOITcqHYaEJBt73wvh0ZZ+zyOfSjgACFfRqqav2mFXxA+cDW+K1Jyy8WZgR3e+ZeprcK55gyg6bfKTXtyfN5OjBs+ZMhONqMUKV/pSRcDQf3z88jYlvCHyMwHGSTkugLQ5saqEB27ek+TWi7QMFE0pJw9iwFo9B6zERHt7jszz7+mq5JNlzo5QdFKOy0pi6ATT0WoKX1THWObyWnwjgRTF/cvV5Yw7QRQS/AoRLsNEf3QD/e51acN1Q93ODBE29lDmFwQRD4rdclgdkKAX5Xci6u+MQTbUtgZrKhJAHRyQnOOJPIcjResA4Wh/Fc2mlOGd6gqv95IIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X+JRNlUy/JyJXIvSDDUa9LrLPwjd6FWCg2LtfQe1z8=;
 b=fy4UgWa19GK/8EGWstN2P0kEKA66QzMJHvJzzhwh+FJVXwZPscXQ39ykV4vezwt8ZT+0za7fFIqKbvxxvaj0K1udxoLcssdK2lfcEjZnlY9rZsB9hR2z9HoY1/vnAqlguJZDwc/zBJvnhyt1oa7kRhrIKtm4B7h9lYEkC0KXmOKK8wD/Ehl9IqGuMt5XxOUu73QLKGhvoGmHCXFj91t0ylijoNxcmwcQODJ0dmkD+bVXqDIUWl9625ahKE1eZkmyG7hT9AUD0zcTHoNt9FkwprZ+wkvhgDWozkCfa0lBcZuokp5R3t4JpIiXycJHWJbRAlnfb8L13Izafzlz8EJkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X+JRNlUy/JyJXIvSDDUa9LrLPwjd6FWCg2LtfQe1z8=;
 b=XeI5SrF63IWwNPCgu5pSjO6VycqHbW/f58BJde9A/3HSkplJUTE5YcYleHyYPlWnjOKMEYUHptgjdHAz56N+9UEmiwqkCRLCD+K1YRNIqhhQuIH57fPfTPxjrakDfd2LbMpUQoXK3943D1+fNviMQn5lBIHxsrIxIcrmJ8yF4QQ=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 28 Oct
 2020 09:33:30 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 09:33:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 0/3] usb: cdns3: three bug fixes for v5.10
Thread-Topic: [PATCH v2 0/3] usb: cdns3: three bug fixes for v5.10
Thread-Index: AQHWqA4SCeLvyFR85U61BCyloXYoeqmsw1oAgAAHHFA=
Date:   Wed, 28 Oct 2020 09:33:30 +0000
Message-ID: <AM8PR04MB73000068BE5ACE19DE88504D8B170@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022005505.24167-1-peter.chen@nxp.com>
 <20201028090716.GA1947336@kroah.com>
In-Reply-To: <20201028090716.GA1947336@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d3a04d0-74f9-41a4-f379-08d87b248836
x-ms-traffictypediagnostic: AM9PR04MB7601:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM9PR04MB760169D4ED5E9F43F04C884D8B170@AM9PR04MB7601.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4kRII5vGdk+CuvSLoin70PHXcbLYTu+LaGrugJ945gBCDDabWhwd05W0yV9tXxpYmVeHCpg9vTWmOkEItHovim6Xtme9zJJsXot5isgSWgjHuMXDCzTG/HZRQ+R/7EsRvUNN+eDbB77CkjXoD+TA8NZGUALbYy2PBI788OfJ0rv1LJl9UWJq+k5T6SupuBeJL3lLOmoe/yA8UnyVF3xlOChVDHu1idmekOiQM8BRntCUBta3VJLv2yVLz2c9en5OTKwCM/BhbsX8h9ZplUGjIRcDjQuGWBz45a+0yVOsjAk5CWJ6k6sjSRaJ5Ub+DLwjnHCWhsPrQPJz0akQ+iJpow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(66446008)(66556008)(66476007)(4326008)(5660300002)(52536014)(64756008)(33656002)(86362001)(8676002)(6916009)(83380400001)(316002)(6506007)(71200400001)(26005)(186003)(7696005)(44832011)(76116006)(8936002)(4744005)(2906002)(55016002)(66946007)(54906003)(478600001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8gMNrxogaVtprjaWmVLp2KfJKiWcfYltkSYTrb9g/1xmAPHUR3DQmW6/KwYZS+MmqfFE8jwfJlsY5h8H/YZ+KDy7SCLjA4gfvvZ8LoVrVYxnPBpiu+qhcZA3zxgFbil2063ecv0S35pXlec6dbiJS/0vNnTdOFcrH7A/vI3UQ6dG+KIr98UoJh+NsY7x04Mk2DeCFkp4Ulhxva/bEgbCKD/azvcJcoWwS8qFJGFCN8emrbCZ57U/4+XZYAuWhkl/PGj02cKa4/o1jjxhS7Xop2YaPHx4pEg4bgorgErxFxx9cqoc1gUcImAuY1m1I3kGdD4oKb+c/ImVG+QeAxsUnfgveFztn7eYFdxyXDZwmFtPFOdgC/kYmHv1tPFrn16uuxJGFIHflMxpl43VYcTkk4J4sGOhIpvlCbMpy5UMOMfHwgQD01s9/XExQ2oBm70qrL7rrEAF9EQwDzpEWFs1c7cYuSU8kUS96DrXLH97xtzzwApvJTu6Ex8/Zrnxw6OJdJCtNtkcWkfTP72nCfI05PaTMBneZFT4izpttcnQzLSFM22lMnWK//gXTD4ANJsmW11IO9XxS31E2efjde4fdekWP8Ym092e24xwB55aP3nuNf3HLtFyGq3+5K1pjashaLOek1h/ajcNv/eJo4ZvwA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3a04d0-74f9-41a4-f379-08d87b248836
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 09:33:30.6281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQ99AKews1mSf40E0tuEkYDHg/XZh/KseVSWu2eaytpJ4QbVRBdvTJ6prDqfi9z6VO8dGEUMM1G2AknRq6F2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601
X-OriginatorOrg: nxp.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> On Thu, Oct 22, 2020 at 08:55:02AM +0800, Peter Chen wrote:
> > Changes for v2:
> > - Move position of explicit cast to unsigned int before ((p) << 24)
> > [Patch 1/3]
> > - No changes for other patches.
> >
> > Pawel Laszczak (1):
> >   usb: cdns3: Fix on-chip memory overflow issue
> >
> > Peter Chen (2):
> >   usb: cdns3: gadget: suspicious implicit sign extension
> >   usb: cdns3: gadget: own the lock wrongly at the suspend routine
>=20
> Are you going to send me patches to queue up for this driver any time soo=
n?
> I've seen lots of different ones fly by, but no "please take this" type o=
f hint to
> me, so I have no idea what to do at all...
>=20

I will queue them up after reviewing, thanks.

Peter
