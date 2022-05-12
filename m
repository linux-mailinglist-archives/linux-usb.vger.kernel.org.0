Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD93524406
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 06:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346751AbiELEUg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 00:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346696AbiELEUf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 00:20:35 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C1420790C
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 21:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1652329234; x=1652934034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oUahRpHne2qhH1Bn+bHMWYG6m6ktw6uF1dMw7K0oy14=;
  b=JTJJUU5F51y1/E9asI4+9Rex+6oXVQRzzcne3qvoxy+5GUbE31ooNrvq
   qU9SVwULq7hdBHgaPQRuUL4u+K0z0HmFGcsyv4I7AQbS4UTGBmp96sVNa
   DQyw5Vi9GlNsfwyViDsupvR2iLWESscmahJ/ZTTCNA1S6idJS9DicGEgG
   0=;
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 04:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkoxKebhPongEO+OQeR21B9jo3suWMXmAP2J7iJ43M/+fXetdhBBzMwbPaCbENhQUZhcTyQwrKnrAUWltip2p6SYVCWSIliBPPKNgDFW/iuRiVsN/uVcX5t3wDAwYCQ2mbeRLfnDSrBkoAvXP4AQxFusnLsFE05qMxAiEDt08yKMD0m0V4vF5GxgAe+x5ghBArrjz9slEoe+o0+qlcEwvm0NSWadGkAbThPYlhBI/QH9s51SHIw3xmE4nfcsWIDtBUEJnzvfkusJmwlanoHH2aclg1hh+v9zhB4vsYInjsjbvywSMA/Vodab9dqZVUHd5z5xa2asz2zgCDouqkgdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUahRpHne2qhH1Bn+bHMWYG6m6ktw6uF1dMw7K0oy14=;
 b=a2tUIEXqEUoHgy5WUeXBCsLqT2sW/t1X6aSsQRS7iE9baTmScF2RwyjcH1oNMaTsAwrLFjgzYUToS25ZZMG1pEEaX0uSc2cuBFgk4ZJVYsui4uI9yBN1NDH/I3CBZGaDGdvk05k4k2W9GYjkXFO+kOu9F3ZAT38UdrVugHv9lxaFq5hDfX8toEEd6+h3Akgz6bLQ72kgX0ysdVvlwUFGH+bD4xj5bClV3voeW/RP1bGBkjNi+Dxw5Q3eE8C+gagmYBr2/3GD4h4ijHKXndbi6ZyR+HuS+kjtVkWWaLhEGkaMJu5mhcMl9SXbOIgORB+tzPfw83aRi53HXWkEOCGVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB3945.namprd02.prod.outlook.com (2603:10b6:5:95::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Thu, 12 May 2022 04:20:32 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56%8]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 04:20:32 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Topic: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Index: AQHYZacDmvusFTBKzEu4DnNOtnZgTq0bFmIA//+NMvA=
Date:   Thu, 12 May 2022 04:20:32 +0000
Message-ID: <DM8PR02MB8198AD3B061872DF43801E1AE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
 <YnyIok/ezG9csdJV@kroah.com>
In-Reply-To: <YnyIok/ezG9csdJV@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5eaa9ccf-b823-4fe6-0338-08da33cec10a
x-ms-traffictypediagnostic: DM6PR02MB3945:EE_
x-microsoft-antispam-prvs: <DM6PR02MB39451D27960254F2276C53219FCB9@DM6PR02MB3945.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GlIDY8Zq8lqUaaJQOp80PQICTqtsxBZkL1Ao+vvf5jsbOCaAIS3LCZrWXKWOckA7XE3lOpCo6x4IGjHoqwLOGHS3MCPcE4E7bE6QeHM8q3zSf74gyVITs69d4xuIkklPHKT9RtdYzW58sP5DcxTZIZBYg1yp+TcfmlKSKT84nWCeYMBMcA5dYTEHZfa25pbai6r91yJWRXJB7gvH0tZsYaLmTVAnHnahLYq4LMtbIIwyFHwYXKEX6HXYCd0MZYwVjBhwxPNQBhHidAd9xVit56R2iM/HFFlpVTSEn4AdRUlURguq3vOfFfLJqoNR1Q/awbcJtnIIf78Fr0AlEF1+6M/265AJjKBIeE+mGc0YxlNaj6/XrS7JzoPlG0NY5VcOEsjN7wypP91bqtNvNBhLR8qMIRGoqyKiBWDEUiDMGX2O5gsz7Uh7m7fAEA1dgjlCr8eaeZmyf/RuyTm81IgVgoJ466Z7XJfOql/WN2pijz84HvG7NBPrVP7yBwxB81ooGuKo2FyvcDQ1+c4tYxyaCI9LG9lDNuEc0de+tROOa3meERfJzVrKO7sCvwWty7vJeibPZM4vrlfF451j0pweaOwpdLNUdPaAo6PFU+q8iuTcRtSwzDoXErOmCTdW2J3LS14YjWTPDquT+L13xDS0xTvbCAnZpqadodyaaf29OltA1oZnPTN+QZ1b5z632k/P5QwfJRA58hYSJVfWPL6gjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(55016003)(53546011)(52536014)(8936002)(33656002)(316002)(76116006)(66556008)(66946007)(54906003)(64756008)(6916009)(8676002)(4326008)(66446008)(66476007)(38070700005)(38100700002)(9686003)(26005)(71200400001)(508600001)(2906002)(5660300002)(86362001)(186003)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GIioRndyMPUv3omMtEkPzDxDhobnk4QcSUJEOFmeNy1XDbNl0HhcAyx8BH8h?=
 =?us-ascii?Q?aXhs1CgzmzGvc8JFO00ougIR8y1R+3zsElX+PO+mlAFHHuqwUh3CZJn7rbou?=
 =?us-ascii?Q?hKVjv4vXfWnS1PbTTUPACXrSfi0DO4eW5CNSn5/ynR65BL2i9iXJgICCKEh1?=
 =?us-ascii?Q?ZGDnE8Cy3Eie3e05SCzJtMccYDQsVczxqYDVh0OoIf+H9920NscOcygOahPN?=
 =?us-ascii?Q?HcuzJiA7jwqoNQ4ASdcRAPJcjXGzQDbZ14PpwvJ2AZWizbCUpi6uKW9HTGes?=
 =?us-ascii?Q?j2TdIIdBznf9HdZ5AGdBbVv667Tv5lScjkKPBTf1xMiqKu9ny34YfZCTiM5N?=
 =?us-ascii?Q?P0gudWWQggWSrIdCGPPvF4twOMz7wKl4kYOLkAoJBvTT7UMztlj3zUEdINds?=
 =?us-ascii?Q?19Ki7oqmGKBfIw0l0lpoKMqkPNpKl0XLxRePZv99b7DOn2Jg+eN8oVG95f8q?=
 =?us-ascii?Q?9hrMQpyXvM+QEyMvsChluP2h3AsuMKhqVzzBMr71q9tf1+uuu6c6xZW5wLC8?=
 =?us-ascii?Q?r0LVgqX3lGtbvgdgJQirNQ8Vp3wGLRtQHlaWNGmxvoWovh87xrp1WDzIE9wQ?=
 =?us-ascii?Q?L7uqjPad24j3DI15WEyZ05VGQg963TNOZNffoRqY7SPgsxAGi39I6KjVssfS?=
 =?us-ascii?Q?OTKFMzUoQ81ejhPOBxszO9sY6U1BlzDQ6BjO4kcG2U4JQ5spUuF0u6MEa/bP?=
 =?us-ascii?Q?AuX/yxKbyMzqXfGVY0t4Re6pdFQ0D8ZnKAK+TfS/K8rjRsNHAkGbDV65g6AC?=
 =?us-ascii?Q?I0VZS978RYcU9183+nvRF5IWvYofTZusNznuoAb3vldd2kLz6zlAJ4+Au4Xe?=
 =?us-ascii?Q?3QOX/yC+I/BQRN8g4Ytg4LQ98DrbSVy4fno+8DqVjnxjV6HXBAZpIrukj0oo?=
 =?us-ascii?Q?42rAtAYVZqiMlRpae1Syr7wSXALnhKzWWOA3/pykMfkLWTuOZTlNkbD6vZUK?=
 =?us-ascii?Q?dmJi/uZPKPZxb9tr2HHYHNGCOu0Iu1axOh3LF0GmYcq0zo248egIse6Wk41v?=
 =?us-ascii?Q?+pnPzCQrEVRy5TAoH9UBSPbus7qjVC0Z54SAbQvjQCDamhXnMGDhQ2ULfFt/?=
 =?us-ascii?Q?lXp8BbVwgXauA8MfR2lb+fzdscf8f63H6jZ54e6Unf8sHJ+l+Am6fEqftTEv?=
 =?us-ascii?Q?IvRibsm35wJVEr4a/vs4yteImJKO08NGnAHPS9vhrswHqpYOHcrk9vQ/7suj?=
 =?us-ascii?Q?OcD/2tMwzwW5U7N645zC9knCGv+kYNDh+sV0VWFMEfFCUKf6vG5JwxVHIWWH?=
 =?us-ascii?Q?g5P8RSAFWFWVLUOKwORMMjQIT/GwAdWYn2XyIy1Z2QCu8KYqu2VKB6TD0MGp?=
 =?us-ascii?Q?shzWYjNY/lDK/TCWDDnL2KUjiUrcsPskDQNSk9hczVTOQ7EcpfJSxz2cAFNJ?=
 =?us-ascii?Q?Ox6V3rfcTheiWjWfR8yzwW9KLaqQXYXqwn1nELNSy1/R6lEGipC39zxg5qLk?=
 =?us-ascii?Q?ilqjdQINfqpXe3dEOTHqsxENRfrbFldFTE0ughm+W7vwWcV9I35JH4LBk+lb?=
 =?us-ascii?Q?LAFTy2d2QuTvTJluSyNVApSahbsb/akj97+dDPZrYXD+SmcAWnUK0cqT1ozF?=
 =?us-ascii?Q?N8BA0KFQxhORGnBmKWoB948rXAhGptkHzKN5asfe2CnMumDDT+Yj44qXT8Ci?=
 =?us-ascii?Q?L5hMNW39+wCvzzmqHY5j6rmfNHwOWHZYF/1PgVGqZzLQTzw7AMwdzmr3c114?=
 =?us-ascii?Q?ldpxbPPS9Pz+7+/+XypEk5WzJq4FFYOfQZ9ctTGB9RteipEmHOK9+pCKWFUN?=
 =?us-ascii?Q?w96iCa/plA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaa9ccf-b823-4fe6-0338-08da33cec10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 04:20:32.0971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eY2SLBglgdvU1do4Vrssmsz0LATEQAD+mvW0VxSZGIulH+IkDUhhTlsLn5payTUq+cn/KGXmTC8ntEgJXtwNNBWURXLXUbRxBIm5P4pDqAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3945
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, May 12, 2022 12:10 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
>=20
> On Thu, May 12, 2022 at 10:21:34AM +0800, Linyu Yuan wrote:
> > First remove lb_modinit() and lb_modexit() call from f_sourcesink as bo=
th
> > function belong to f_loopback.c, also there is no need to export
> > disable_endpoints() from f_sourcesink, change it to static type.
> >
> > After first step, we can use DECLARE_USB_FUNCTION_INIT() macro in
> > f_sourcesink to create module init/exit function implicit as it only
> > register/unregister one usb function driver.
> >
> > In f_loopback disable_loopback() function, just add two usb_ep_disable(=
)
> > call, it will safe to remove original disable_endpoints() call
> > which belong to f_sourcesink, and it also safe to use macro
> > DECLARE_USB_FUNCTION_INIT() for module init/exit purpose.
> >
> > Now it is safe to remove function prototype of lb_modinit(),
> > lb_modexit() and disable_endpoints() from g_zero.h.
> >
> > Change Makefile to build f_loopback/f_sourcesink as standalone module.
>=20
> This describes a lot of what you are doing, but not why you want to do
> any of this.
>=20
> Please read the kernel documentation for how to write a good kernel
> changelog, as-is, I do not understand why this change should be accepted
> at all.

Can you share more about it ? is it description reason or code change itsel=
f  ?

>=20
> thanks,
>=20
> greg k-h
