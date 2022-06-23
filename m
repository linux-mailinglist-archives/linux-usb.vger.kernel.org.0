Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3A755759B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 10:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiFWIhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 04:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiFWIhl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 04:37:41 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C671548E67;
        Thu, 23 Jun 2022 01:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKaj1v8PkKaErXp+RIKVP7gqQCQ6krptRgUyUz0kSAdUgo2f0QaKKuAnNPhnmRWrtyNKm7loph1wafO1ZBt0GuOU1tOLg/bBxnabhaKnpFjRSlrJpdl4mzPQ2KwkD88ydalZsBcx0n8CndfyelQh/69WVg0L6M8phgP60HitwsEtEe+tDbbyu/LymgrfQr8TNs2W8rTje6ay3YLyMOWhhmDcfs78PK0szxRmG2Pt5xvumtLmJ0QfTDdZC90QkgjOOF+t1xkn0Tcd9ROsrAbDUCAZ2hEiO2qyOi4iwf5y/U/W36FwYSWaLg+aNm8HLYGBO2qHjyP3R4zsQ+49v0IOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdP0GXQLCTQDxK4EyJopFjAxZIWe8pVKDpv+7EsNGFI=;
 b=bNYV7DNqNvH2OhwVL4ncrz6lhYxDN2WMJCbOnY0s8OdmJk46b/j/jQFNXsDEwZNDuPO2hXC8KxyddBNWm0JlEYA69vdPo8fJsG50ysH/qDIv1XyZ5HJexQMGyngq1YE0UBrUk+JFuWjLY+ja0SPwB6d6FgbB55ibQAYQfJPf07cYHumB3VfHqJswNt9gdVMVSKsxSG5ckJ7x81s5Yw/NbVVr2t0TMy9VwudGd8a1TyTt72dGfg5rD7AXhhs6bL9xlD7CRDPWVEOW0suX0wBg0uAy1KR0y59s5GWZG31S3CmLDvyKThx0Mjd6C3bKgHWdU6jDauLixjRIWGz6uv1OCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdP0GXQLCTQDxK4EyJopFjAxZIWe8pVKDpv+7EsNGFI=;
 b=dtgpTAhPaZUvJmpQApD4etVVdC2dpl5gFKzim3qLODSx7rElfkpTaqRuzo+ACQyCdGISKGi/1SSYgbMk5HVd4ahzPTUlTjqGFqMyFWK8G44j7JxoLJbjGto1a5YRmW6fRd3odbDfrBR/GBoCTxN1pWI6PsbJJR1gzu9FbcTROGz0iZY7MsL8Xtdez2GUKKTAgc0x498OOAcTSUUakNudnKpovnCl2U+gYLT1/4+gaVn1+lMmGd52UwIW26QZFvGxJJEHu0HrzzTLZUDEou/A9RaSh8+w0smeE+kHFEKhYwSYTgw+DBbHh9R9vHuIITSH+bhzXKtX9lZ7ENEnYGoXvA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TY2PR06MB3309.apcprd06.prod.outlook.com (2603:1096:404:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 08:37:34 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:37:33 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYhkeMr7IZN0wRcEahtwSU6oJwdq1cN3kAgABVBQCAAArhAIAABqvAgAACfoCAAAscsA==
Date:   Thu, 23 Jun 2022 08:37:33 +0000
Message-ID: <HK0PR06MB32023509F00B62CFEFF0EAC980B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623064320.GN16517@kadam> <20220623072216.GQ16517@kadam>
 <HK0PR06MB3202379EBEFD773974832F8080B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623075503.GC11460@kadam>
In-Reply-To: <20220623075503.GC11460@kadam>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90fe4e25-8d32-464c-1d0c-08da54f39e68
x-ms-traffictypediagnostic: TY2PR06MB3309:EE_
x-microsoft-antispam-prvs: <TY2PR06MB33099941278A0D03F775629280B59@TY2PR06MB3309.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TgmJ7evE5nDmnoeMYa8Xu1NB8giNokg82SzqkcQg63juBYXLe/diKIjq4QqIDR6h849VWOay6TjeKL570XQU4WSi4p2r7jZKJEBvKJDUtMQEAuSq0DPovis491sOixzqcZ77/aYAnTnrAQTKyG9AU+qsyri9CUbCP9j3mJJnQcJj9PSkPlZYL1DENNnp81ZJwtkHFw+XvMAF6XFaX5XWStMTFddipEO3r0q0ypfUJtEWgbyutkwJo9shaXGk1D4EalxWgbSVlUvubQ8gDkeFZxSdJFnfX4NCybt/3LheMwk8rc7hsqu3dYtVkAjW5woUsT4lldlc2qP2WFFWgfNxOtHNFaPR295VGh+fe5uh/UiIyYWv7bQ3KIp5lL7SaoarmV6OSdTUynngYzTnkjpJ1qYNdKxuPThWmTOCETCSaoXB/VEbeobA0cfNELeQXKVQmPqjwMqp7G0QkYWrVSaWEB/4NKqztqya9E5yUzL56eZeN7p9galKrETxxhi0owUBFpvtBVitDL1FgwnWZQtF6br0Fp/3NK9xfBfvZypS1HXMbt5PTtF+nm0truP3ZG976GYTFGxfJpUyXZozZT3SyWtNW7pvaIl2vR7SSdUTn2Nl4/jDLCZu269hUJv4DRoqoaLC5v6+x249OM3LGy0SLQWlErNRShacXYPQztSiYg+HakUNVp/ri8j43Gt38v6v3MML4VQRPlA0F8hBka/8ImNReDzBSTam4XbLcWR5WPc305Q6IGVWVhyfc+rRMzWcUS2hPvte9IH44cvVeTbug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(346002)(39840400004)(136003)(83380400001)(186003)(9686003)(38100700002)(86362001)(38070700005)(122000001)(4326008)(66446008)(66556008)(8676002)(76116006)(66946007)(316002)(66476007)(64756008)(55016003)(6916009)(54906003)(2906002)(5660300002)(8936002)(41300700001)(6506007)(52536014)(26005)(7696005)(33656002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gq4hJcNpWKgUcYZ8/IUTU/O9UYKFjJOjimnjrBdcuO9p67NsNr9Huuc6nFsf?=
 =?us-ascii?Q?2GhSZ5vwSLXxGxGnyC/HAI8ak5Dx4NJR5ks1DZc8IAgkhf2a1lovJoqEpnzA?=
 =?us-ascii?Q?u+frN/AIGcmigLix3MYnA90SoQH7+TT1jdnlvhymmKg5bUPbCzatkawDH38j?=
 =?us-ascii?Q?OgdlXeScXAGrDRcdYTmAfvAT/U2l/+A3CTC85MM2JPBEnYXaCeoqF9HT+JrY?=
 =?us-ascii?Q?hNbiRSRSEwMX7XSmw//awzMeo2OqSbOWzMWEP1lEQZ3Txe+V6oeL/iHWtKAt?=
 =?us-ascii?Q?xemxkEMD9GXaiRWEKpwXJ096pOsH76wRqgrjOH4eUAeY1R1MnKTnqjAxBR0f?=
 =?us-ascii?Q?6manTHahL2ZTcvLul9vGDDUBs/7uKsyX5NRX19jk5ky4CyngptNrLjdkjGIj?=
 =?us-ascii?Q?sZul7xRLt42jmAx3dIxAubrbCb7rT7rRV35Nfptk6hg5vEK3QkkY3nF3q8Jz?=
 =?us-ascii?Q?E++mr3Ax6KVlGBtXhoYItRKU9U7JSAA8jFgAm8bjjqH+iBA37jpKUtEvvdNA?=
 =?us-ascii?Q?9dOcqkW5DxfGjRk+9VJ7SjgU7cb/oUOmUeAhNagDh2EvsU9SpJPNUpirBLIQ?=
 =?us-ascii?Q?GHeyUFc8Mtq1FCA9+L+8Ey55REDQTEJ5G+aV80K9igGofbw055DMEE/55hII?=
 =?us-ascii?Q?2lWSNjqTgI3lau4E7/cE/pJJMakyK7ULltA0fxyy75I9oOzr/vQHjAUQv7yV?=
 =?us-ascii?Q?pTsHHHoFXG4WK6tVnUrAfH79D33OdQMhKPZ4oiQY7G3LhnbrsXYRcfmzTyXL?=
 =?us-ascii?Q?RZCeEFjqfBxLJ06RSTOmsOLfWFKyCbytdpxsnB7t6NrkKlZY7AZ2oVz7UjjI?=
 =?us-ascii?Q?TfLsqupMEn2Dku6E9BIMqrlicqYWIGtOau9zM962OMy52/BnFM+MG5bB884N?=
 =?us-ascii?Q?d724wtxWG5QXDw/eD9+9RkmAW7lIGj5qTI4MdPvwhxVgYHdOEEWrNS/e7ZK8?=
 =?us-ascii?Q?dbzcXu3YTh+23Oi0Rw6AEh0BRq2LdqmweM8b3FchMvz14q6Z4t2BwwQCpv25?=
 =?us-ascii?Q?IyAxwCNavmmnKWs4ikVPPKNvmT9Py6pkSHfMEuAXxZq49VofQyhRW2egg0bK?=
 =?us-ascii?Q?Ul953hGzkoxt4H9q37vn2GXSbd06hZYtagegmk7U+RovO2iaWgsWA6basAkJ?=
 =?us-ascii?Q?4oqUeeeplhKvUQI0m9Pm/lTmL1JtAH7czBXMjMpWlHHLad/QDISEkJlIcFnx?=
 =?us-ascii?Q?HN42AZ09jgBdECDlxEpkBqP5bSw0mOjmglaTlEaHpIqxaHeOuw4MBfUFAI59?=
 =?us-ascii?Q?CTZZjdejcp7KtO9H2NxidRO6JybBegF0WgJINFaprHeXpmsxBNr5nfnK084q?=
 =?us-ascii?Q?32RDxosdmuQA3FhuEamYFkwpq8t50J9BMONJyqhhMlxZx+tft8NsQr0V2hQI?=
 =?us-ascii?Q?E0TZKzaZE05D9eFWIDhgMCqCe6bmP8aRkFLy/bf372wACbM7pchbdRanYAHd?=
 =?us-ascii?Q?uMvD6+3zZOxh3yzmet3/GonOaKH1hHY8wuZtRFYAmqLK8C1j7Zv+PMnUxgoo?=
 =?us-ascii?Q?1WGBSgOHnbBsAJwIcC0r1Q9skpbLbn72q9W/2h5DOM5IxQguAlJ30Hv2wuj1?=
 =?us-ascii?Q?iET2PlMOct3MJ1YtBqt3nKTGNcifeId9I5RnQpEo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fe4e25-8d32-464c-1d0c-08da54f39e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 08:37:33.7599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwfIMrUPAeNgK5X9jREr51K64hBt6WgyD2E3rbl96KacjkvXA4PUzGwse17ckdJfFGCNTYnNlsI9Q33K8xL8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3309
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Thu, Jun 23, 2022 at 07:52:28AM +0000, Neal Liu wrote:
> > > On Thu, Jun 23, 2022 at 09:43:20AM +0300, Dan Carpenter wrote:
> > > > On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > > > > > The bug is that we should still enter this loop if "tx_len" is =
zero.
> > > > > >
> > > > > > After adding the "last" variable, then the "chunk >=3D 0"
> > > > > > condition is no longer required but I left it for readability.
> > > > > >
> > > > >
> > > > > Use either "chunk >=3D0" or "last".
> > > > > I think the former is more simpler.
> > > >
> > > > chunk >=3D 0 doesn't work.  last works but I think this way is more
> > > > readable.
> > >
> > > Fine, I can remove the chunk >=3D 0.  But you can see why your idea o=
f
> > > removing the "last" doesn't work, right?  I mean maybe it does work
> > > and there was a bug in the original code?  Could you please look at
> > > that so we're for sure writing correct code?
> > >
> >
> > Why removing the "last" doesn't work? If "chunk =3D=3D 0", it would go =
through
> while loop once, and chunk will be negative (chunk -=3D ep->chunk_max).
> >
>=20
> chunk -=3D ep->chunk_max could set chunk to zero.
>=20
Looks reasonable. Feel free to add:

Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>

Thanks
