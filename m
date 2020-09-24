Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF726276D8C
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 11:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgIXJdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 05:33:45 -0400
Received: from mail-eopbgr40070.outbound.protection.outlook.com ([40.107.4.70]:55070
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726267AbgIXJdp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 05:33:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XETivqR48JmmU/VfdYfZz0Fa8fJpoDUTV+LU/UQhDiz/e7vZvUkBsu2gTmTwLE/ZjVI1EmtTKloYeRlW9vZKKxTQxCsWnruhwJpETaKDjXvwmKy/SKF3AQ73WDbOxp4f/jVCVAxXsKcPoNmr2JK7YvI5qDL8f1hQpELaV4DGpjdp+5PnsncZchjFIcIYCgLDCwuVgUdeYDS5EWODu449nb9j/oR+7/4gyKgflp99ppe4jhL0M673CKB4fdVWJaX0mZZtn2xIvWm2WP3Hai77mjGBd7CNnyyK7adYoW85UkIPPB6gfn2XUy+kRgUiN7IrMqb/u1WFoUkJBWL3zgfCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsOEuzG4k8ShI5XELK75tP51dN+3RJlUi/W61VULY54=;
 b=ERppJ4EGGGd0fHIObCmD8LOo2m9w4rdTHkv/Bbf4mICFkf5ztY3PB9wPS4iUZ4hRHNiGzDBRjIpCxVcJhk5WDkcwndyj4uEUtRR5hNqwaNnEOMTcvU9+ePJgGZMg/kU+RTETsUQUxtdL3uc2HyOYAvTLsHKawyOFjHnctW/1rLogiuEHnxzyzBbj2UBTyoj/YFqY5HVAG6nt3+ImJLRF2vVyTEUAAxDJxpm7vTE7qMruuvEoTW6J8OZKrvIH4E++CcVnjPHm7/TKVawP2oZkfklAG/V6TPq5Pt2pRy/cjY1TXqNqi5Z7INpODWOLJi/3UZyZhhJcRhEc5//GxJutHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsOEuzG4k8ShI5XELK75tP51dN+3RJlUi/W61VULY54=;
 b=eCYbbgAZaZRhXq13XCoYNmBDHPaHBogWbSbFgLJAG2UQhoucud6SbhnQgR5KwZSoOyPHroM7c7qceX6LB6X9qcW+LF9NUtuFQl7pQY3HRwLhnZRuhdu+6Xo1MwO6g0HSt6dA0B/3oad6ufk917lh3B6VhGg4tNQ0E9rMvwlRTgc=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6150.eurprd04.prod.outlook.com (2603:10a6:20b:71::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 24 Sep
 2020 09:33:41 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%4]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 09:33:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
Thread-Topic: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
Thread-Index: AQHWh1J65T529oHJzUK4DV982MdnFKl3eZmAgAAirQA=
Date:   Thu, 24 Sep 2020 09:33:41 +0000
Message-ID: <AM7PR04MB7157E8B31971129B3E5113968B390@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
 <20200910091130.20937-2-peter.chen@nxp.com> <87ft77eisu.fsf@kernel.org>
In-Reply-To: <87ft77eisu.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aa183c52-bb99-4232-3a68-08d8606cec8f
x-ms-traffictypediagnostic: AM6PR04MB6150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB615020518FFB999D299E04AF8B390@AM6PR04MB6150.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvXTeLRkIV8NWHPfL2WJk87X6aG4RGdtgtzsTJOuRM4auARmTjAcXiKjw4Wvf6ptHqXwSTZQ48gXgKa/UnufDzpRrbTMbqWp6NDXH2wJ5WDGS0PCGjeP9Ia6GldPMAONnOOoL4MfyzQ8FMTIreSqovLfcNiqkAG2KWFTYzICHN4U30RQxaHviZmsePPb596dm7n52H7gUFLNsGSdXvzsDX92LbakBalRVybyJ4wgIz1FU6ODJuVd2mJMR112F8yii/w2aZ0TA5dx675YNb6U+jDmmaEI/n3ORVURCoFW0CBjiRVXyuZ1Z8RQ2nA1pN590nEVKnAXxip17fnldezahA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(7696005)(316002)(6506007)(86362001)(478600001)(2906002)(54906003)(33656002)(186003)(6916009)(26005)(71200400001)(66946007)(66446008)(9686003)(55016002)(4326008)(76116006)(44832011)(64756008)(5660300002)(66476007)(66556008)(52536014)(8936002)(83380400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KNHCMHy6eTKL8KEgGfgXjG4YeuTHAeeAP5BASMQ1XmkfqBxC/hMTRYMlbcBUdwcDxGinm0gqKt4COZhzcnHzKzkE4Vv879NOePdyASF1BDnHmXXmwRYQR3yev7EImjuw1bwv0EmB0bTHMq8OIuzYSJrVLLrL1fOoaF5ltCTUHGitF304RhoaXbbHIncveJjfqpTJWnp7+vvS643zhmLyPM7OGOhhJ0IHcRkCqAIjhA9hD52OQm7kKmAXhbp4yNg4oKgsw8mIreEt6g/loPAo7U+5o9sk7VWtkG5fsw/fcBkPfwZDXZFAFEl5GGmY9ut9sZtC/3iyltjBDomUU4JxNlUi6hAN6++C37uEit0XJmhe+wY+M5Vezo0yRG+LjeeSUtjm2wqVq7XNQIZ6HLM2aHItAGiuq1He+y+rm0PLaSSyKkqq3Afq74uMHHqP6IS2DU50ETe2fWWifZznH6WK3uoa136RevrKb81AxZe+VaQ46TwkY2TnTjx1LDN8tjNPmKTZVVfDpTgnBvV1Fn50iXmFXnVMb3g9t66bGAEQSqFO6LW4yMiE6KuD3EdZesGXh8c0gIMju3XlteJRcBVR0Zev9ibyomtjQUQo7meNcqx39n8BNCrJp2i1kF26xOVwvPscHAhTa8Rb7efNSyPSig==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa183c52-bb99-4232-3a68-08d8606cec8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 09:33:41.3772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6Elvss6MH/UV+h6OG8wYOtGgYZtX1aYBzNdVlWEhG5vUyWf7ZgGrRygTcQQ1gKKIB7mHEg/0kWEoRDCjG+uLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6150
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > It needs to use request->num_mapped_sgs to indicate mapped sg number,
> > the request->num_sgs is the sg number before the mapping. These two
> > entries have different values for the platforms which iommu or swiotlb
> > is used. Besides, it needs to use correct sg APIs for mapped sg list
> > for TRB assignment.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>=20
> fails to apply to my testing/next
>=20
> checking file drivers/usb/cdns3/gadget.c Hunk #1 succeeded at 1099 (offse=
t 1
> line).
> Hunk #2 succeeded at 1165 (offset 1 line).
> Hunk #3 FAILED at 1176.
> Hunk #4 succeeded at 1221 with fuzz 2 (offset 1 line).
> 1 out of 4 hunks FAILED
>=20
=20
It could work now, I think the possible reason is you have already applied =
other cdns3 patches during
these two hours. My git log likes below:

ca71afbe0c52 (HEAD -> felipe_testing_next) usb: cdns3: gadget: enlarge the =
TRB ring length
50599e28f626 usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
ed1e5b0fe5b2 usb: cdns3: gadget: need to handle sg case for workaround 2 ca=
se
95c952507262 usb: cdns3: gadget: handle sg list use case at completion corr=
ectly
9d45b67cf0c3 usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
28e5fd2c3fae usb: cdns3: gadget: calculate TDL correctly
f57692f1a9a4 usb: cdns3: gadget: improve the dump TRB operation at cdns3_ep=
_run_transfer
5f94832916b5 usb: cdns3: gadget: using correct sg operations
bed7c9e9a5aa (felipe/testing/next) usb: dwc3: gadget: Rename misleading fun=
ction names
3d7ce113c2d0 usb: dwc3: gadget: Refactor preparing last TRBs
43365b1e90af usb: dwc3: gadget: Set IOC if not enough for extra TRBs
ea52ca3fdefb usb: dwc3: gadget: Check for number of TRBs prepared
e6ccecf58b1b usb: dwc3: gadget: Return the number of prepared TRBs

Thanks,
Peter
