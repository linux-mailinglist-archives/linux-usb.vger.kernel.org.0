Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542AF524C3A
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 13:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353480AbiELL7N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 07:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353467AbiELL7M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 07:59:12 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACE1ABF4F
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1652356749; x=1652961549;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=stqiX5+hZGKz75L8kFEGlGYdqwBTfuHiEoMnc0hH8Io=;
  b=DigIt/OgI7QX3gYks3lIKpNvP2p7XFAS+pv+HbkNGxzHAUSHqJqBvShk
   ZBxrBOC1R5G/95GD5P7wSS2BAvoy/jFoLkpK9nddWBe/omvukJe8EcX0Y
   P+HUiDwy9aJRBncs7T2RReNgWQHwApENzNWS5MJvGxblYDilnNzK18hhf
   0=;
Received: from mail-mw2nam08lp2174.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 11:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR1OTEdphHY5HA17f5o//6kdIULIofr5Coj3z7dEvA8fro5fIleILyTs1OdJBiMW9pIvXFvEOtbZp2/381FtwuQiGFCgvGhvy9FeZYF/N0Zm6v3wPE7O3fucfcV4TCtEnLI2BFKXRguatQXKtmlKP2iE3NFGKj9zDXQXyuNMtAOoeBs9QZ/EnmGgkUr3eLPkrz2r7UlilJKD8xb2h7+xa3+11rIKbJEBIPrkb87x+KxZTy/UsOPdijzpgfhYZ7U96qeQnBZcZuVgvQE0nMNKcGM3P/avQ1rwIzTA5a7XtVNXzYa8gzdGwEbsRXupDaIjZqKEwP5yhYKrQJBQq1Ru+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stqiX5+hZGKz75L8kFEGlGYdqwBTfuHiEoMnc0hH8Io=;
 b=VuiUn2CMxfU12e9V0oW9Ds2FMG+w5NCCVeR7fmRJS+hDE4h1D7fxuVZw75OU6xNnpq3VCorpHyrJLzRBornCkeEw5y+Ai2MVEjuNHoGwyv2pNlzunr4o1EZhkKUxbIiehSt4YLvbzRWdgEK4Kd/yftektmUURQHQk/zHSVypktOXgZ0U1XNCyDsXtcTWerhAI7l4Xmj13sK2IBmJ09b/SFFLc2pZnI64FQ13DRYwknjaoIJz52DuiyB7N1L4d7kBOyxjusgxyjUTq/56ZoUB4nNHHau+gT9gZFhib8UpTCXMDW900tQIcVKXo7O1tgg1naGKnXpa3E5YLYHT/lu5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 PH0PR02MB8842.namprd02.prod.outlook.com (2603:10b6:510:f5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Thu, 12 May 2022 11:59:07 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56%8]) with mapi id 15.20.5250.015; Thu, 12 May 2022
 11:59:07 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Topic: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Index: AQHYZacDmvusFTBKzEu4DnNOtnZgTq0bFmIA//+VYhKAAARFkIAAc2Ig
Date:   Thu, 12 May 2022 11:59:06 +0000
Message-ID: <DM8PR02MB8198838296A9EF799506533BE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
 <YnyIok/ezG9csdJV@kroah.com>
 <DM8PR02MB8198AD3B061872DF43801E1AE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YnyRljpA1nA7dH/B@kroah.com>
 <DM8PR02MB8198FEBB06CFCC64CB7121A9E3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8198FEBB06CFCC64CB7121A9E3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2b3fa46-2a29-4f7f-8c9b-08da340ed137
x-ms-traffictypediagnostic: PH0PR02MB8842:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR02MB8842AB121A1CD1FF750842229FCB9@PH0PR02MB8842.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vlVFIyz78QY1FrVWORT8zZCWlNW74u4roIODhrvI8KnUu0NdFCJayenj8vYlCsQ9b0I1l7SU8ofdl5TznaUv42B3EqSlu3GlPJYke7j3sVVnEjeaihqfQx4hXz9+DshhTa/R+FhB2NY9SyK3JhW3VdAWbK4KPwGZigUMwoeCdXAYGBxCDwATrBtUnKys23eQ8WUSMk2D//dtw5kWJ1YjRrRveeoz06UXsJwBrd+xyYtxqZDp4Af//pjHeDxdZH+1EzRaQX4ZjGmSHyot+kzSFkUGTcndeJqKhxRuUBDAKZ7VKpH4ys0w90ObQ3E+e9wLWF+vs1HBvrMqTU4YxsOdrBS9g7hRThxUj3+BlP2pbDPKEz/it5BkF68Pv/DlMJHj75QRajrS+QIQ8rgXlbQqLzIfUw8KkUYAX8QtDcEueDrPn65KEVbqLI3Uh7uFmpT016jG1Dl5ohTXPUaioXpZrWbw8D9Ig3cIcSj0JXivZRJf4z8R99qO5MOQTKwV3qOSExiFeTV+TVSqWD019ExVWaKUdJZztr0MgoC9HIOOi6VUwb9k9fhYSR2pKZ4EXDpdMjqltjHTZWKgGVyNR2HZNOb9EcXYCAFrUvZQFuGAzQGDKN68LZoRt83AeaAJpXd4eJge9BRxjWqLe8sy71aiDrCCMtGvXOxzd/zFb4S872db8P0suU8O830bSoSDtvDSc7CHcH0JjAHEQc5H1Osjmw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(4326008)(186003)(8676002)(53546011)(86362001)(6506007)(64756008)(66476007)(66946007)(76116006)(66446008)(66556008)(508600001)(26005)(33656002)(7696005)(4744005)(5660300002)(2906002)(316002)(9686003)(2940100002)(8936002)(52536014)(122000001)(110136005)(54906003)(38100700002)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i8rie0XOipw3JcjmtQGK9rbANV4qmIHi8FuTeOVkNcrTtdNKgcMIVzZmY21D?=
 =?us-ascii?Q?Ow6uVRDisW6g16mx8kKo8jI/u+xlIQtYsF6pBUYUV8olWukc0Wqr7Z48vkzH?=
 =?us-ascii?Q?AxiO6HCPd/V5bsgllORpgTZok7PSqAO8cNxfihJ2KasaGmqO4mg94vzG0lK6?=
 =?us-ascii?Q?S9/hitVw6Fyg2ah+ABDcQIgWaMkyIxrGLCSsXEibqN3ZTmaeyXfnvIwejB62?=
 =?us-ascii?Q?MaSu9Y8RCdTcZDNVcZdt7tj/+1zREmmE0G5ObKY7a/jwq5qAyiWusw+izoC0?=
 =?us-ascii?Q?5BDgiFn8efInWHRzg0y+TaZSMITrbkOigEv9SFX80cqDBYkmF77UOSujlVh7?=
 =?us-ascii?Q?irrViOvqVVm60sBjPL2ZOI0imEaZnvQ2kjm5RK7E/8clHunRdTYkJrZ/PolT?=
 =?us-ascii?Q?13+HgsBYwSQNmxlwoQco9B/im4KrtzZl1gMSykbIfIjiYOljfcM02sPm8XvB?=
 =?us-ascii?Q?RagKTf+HFzCDAKywasqewFQzBOrXaeh8j0cG3t7/5wIuy/khXjKt2fUsoD/h?=
 =?us-ascii?Q?63wypTxYpeStATO5OrmEqpnbDjga2d28X56JGcru4b9OE9fRjM8zOMaKZUtJ?=
 =?us-ascii?Q?YmhPAGdx4g+wZRIvIZ5SZXLGvyAqXrDBLFjciWKAlZpFLNEp5c+2mPdqT0l7?=
 =?us-ascii?Q?mugHhST0UFs9UhVVgoCDzfjmFpWIvel8P/2/ungmv1aEfiTWjE02KYW9sVGW?=
 =?us-ascii?Q?CYT3t3DH6PLlMYriDAGvmEdBHyvcG/2jktwXg8sw837HCiOF5xuV0a/TeGZX?=
 =?us-ascii?Q?r6SI83c0z5jEyO6i9VtLRat7chSU8B7zZBkhtwNGQiF/dq9G02ugTqQAKyY7?=
 =?us-ascii?Q?bDWV/S1WOJqbqAmaz1j+kQ8iVkZid7RzPMSsruEMHiudGTESC1xuicWhpsel?=
 =?us-ascii?Q?HUgL6izI36vJyRMZDmW58B0h6xij2TOJnnBMDrOCF/hA++6dv6T4OHEHF9Wm?=
 =?us-ascii?Q?J4S3Hc67cFKhkrYb7BrDrup0O20L5zix6mJ3uMy+ebkfvT8VBzc66c2FNP6D?=
 =?us-ascii?Q?uoltN1dNfLQZMTKFDthW6uBdPMnT8tFXR3+JXv+rSVDlf2AyoJMBRSM4THzz?=
 =?us-ascii?Q?u85v/oK7xN+0xXmU4ZzoCxMNtJBP3SovEnUMrj8ACkFGC5AO62p3AO/kTGYX?=
 =?us-ascii?Q?3NplQ2nQNTwD7+Ak8uwknQoJwfqX9hDr195SRm881gSvhwPKtR8nQYrVEYjx?=
 =?us-ascii?Q?nbarWgb7H9pjJIHF3nID/EywMCVMN9ARMUmVplJC6EQR0k2147M2l6mv0WoB?=
 =?us-ascii?Q?f2K/2/D8UcihkoEgoWbHzLw3pVuPh0EbhOgVirGgDczTkVKNI9UOy0D8NYjL?=
 =?us-ascii?Q?4mgTWMp4IYD4MRTcOjfGTnxDtZ8h75e7STgSbVGOfLXZKKRX/6/NztMwhID0?=
 =?us-ascii?Q?n1uCxQ70cxUhJConu0mjvJoousPP+odHsDxFuA/+1bVbliEphrMYF+7Ar2Nh?=
 =?us-ascii?Q?LqOtXKvFBAmy078law0ZZiWrixwPCJSU/evoEJx8oFvnlvS/uc2sFWtjrB/0?=
 =?us-ascii?Q?uo8Ei0JSSnyAmbkA9rXcoAl7eXZglLf9ksiSDVvlvWSSMwBtUs3nFejs25I5?=
 =?us-ascii?Q?xU+Am5A+XnFeYKamfCRvhmVbPnK4EryFyo9wDh3IYfaa6CNEAdli0ECv/M17?=
 =?us-ascii?Q?XtMbxqn8x+wxdduWHLoYz5X0fSa7Sv2yOGd+aqh523rBfRlWu2FmUqx4EeQu?=
 =?us-ascii?Q?FmCLPi9vwAa2xhYNTseWxwj/UXQnomzTyvbv62+e9z11ic4J/ljsAYaat5tv?=
 =?us-ascii?Q?O5B+rkhngw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b3fa46-2a29-4f7f-8c9b-08da340ed137
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 11:59:07.0455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ALB/j7F95dnc4eLr5VR+hwnNmY/EQYaXfZ7cUxD3V18UVcOxt3sNSuPTZLj/sK4N5snRuKDU+cthA83seJWwcLjjnEC4nOJxLb4FfkjtCOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8842
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Sent: Thursday, May 12, 2022 1:07 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Linyu Yuan (QUIC)
> <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: RE: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
>=20
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Thursday, May 12, 2022 12:48 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink
> standalone


Sorry for this noise, seem when enable legacy gadget zero, it expect f_loop=
back/f_sourcesink design as current.
