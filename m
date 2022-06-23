Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D05557486
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 09:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbiFWHwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 03:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiFWHwe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 03:52:34 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2105.outbound.protection.outlook.com [40.107.215.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175D646C9E;
        Thu, 23 Jun 2022 00:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPZbh2kyDT1rZOSPKJJMbzTOwzYDlI4cxTXpZyfSAbMDQRxsTYE8D6Eiu3ly+7HoBPX9jQKS0Sl/PibbAeGbt1rpv94B2Wtku4vZXJtGqkDVTHQ20+QYClYv2L4LGJ3eFTuhVnamVnNKZ/KlfMooYSDy+4DLNfJDIpUn15qxI267nzZ1M7hEhstbWZNldftI+jGOSN06jxNxFuUVEdqbaouwCxnqiuUlGdnHk7UIAAD34JZCwUfhSm9ZhVabL8BSK9FsogwGDWbO4i/M2ss4lF1wfThNSrt0btLogt26pgC3CojOmAil09044NsbCQIKe9feo4ZX1EdVrSl76RsExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlTCDLij7CW88kaBAxOv8yyb4qsa2dkiYwYSl5XyZgg=;
 b=Vvj+h9mODQfZXLe/ezzze53vSQMUY03gEN1AJIN3ZvFD87LJpWMqMYWIZMqxoB9yLO6I+BfLm86Vy/I5dC9iibUIGieUZeDcVUEF5JrJUQ7GZ320kWbiXeSNQKOBZYp+FwEpcH5F3+jcyVIqH1PK007Q42I7wETmPOQ0B2pVi912uW32ri/Bk+jOTotm9GFc341j/CiL0xiEvpzoXytYa2peiJtJQuBs79begN5KWwMhzX+EaXisLyVWZ4+hEJY+eTDzGDg8L6+fQ14HoVgMv5KrPytHMFk+LFXjMaFMLVe0RLdlffka0Wv2ZiG2bn5j1Nyar7x5iC4SWRPbANHtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlTCDLij7CW88kaBAxOv8yyb4qsa2dkiYwYSl5XyZgg=;
 b=F/xBBQ4T3XGyG/7nr7USEJnA3OV78lWUQ45LBiABEOrRf03T6aEmEBffxGefq/XpHmJIPCd8s2teVSjmgjzTloXgd3wCWCFx6UDsi4uOylFu5ieTKlPE35mwaelaTNZZb/T5aF5eOFVlJJ+ImYJwCcNB4Sd0VqUAZ3KpzuEc8Z8jR699tQdJ8SFwBLjq2Yat7K5YMLu6WWgHVeROxw7d+CNJGpL7FgL2WuS3aMp3aBw29w120+EW4f1eUH5mk3PAWCL34hlqrZdxdXgKZ6dr9AYVlMupUVlYJGGfC2ga4vkQ/aTpL6mRxTA+RdI5az0NqT06cd/iSgkt4+0i0GUDaw==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TYAPR06MB2349.apcprd06.prod.outlook.com (2603:1096:404:16::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 07:52:28 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:52:28 +0000
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
Thread-Index: AQHYhkeMr7IZN0wRcEahtwSU6oJwdq1cN3kAgABVBQCAAArhAIAABqvA
Date:   Thu, 23 Jun 2022 07:52:28 +0000
Message-ID: <HK0PR06MB3202379EBEFD773974832F8080B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623064320.GN16517@kadam> <20220623072216.GQ16517@kadam>
In-Reply-To: <20220623072216.GQ16517@kadam>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5301177f-c70d-49c2-74b5-08da54ed51e5
x-ms-traffictypediagnostic: TYAPR06MB2349:EE_
x-microsoft-antispam-prvs: <TYAPR06MB2349F33F1316AAB0A14FD06B80B59@TYAPR06MB2349.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fve7tPtbJkawxIEdvHeY1FlSD3zFdESpoV9nSpfTm+w5p5sDTQgBDKCPj070oSpIBbeJG9aHdLIMkuZM65CELLjc28+tezFEKcgPZmPR8sPXqT+BEPmZDnTWpq8jAtbLbbNrQLYYPFoNB0vjira8BI204VODIRU5DsUZGwaKYEPudSA/aDfqXtDItFpk6gcTVM9jxr8kWv4T+QWqxYbg0HSi5jUq8oZKydN2Kh/JBnLmJQdVt2qpni9iEpbkgRfCQTZhRIX2in9dL4uAQJoef+lDymGEu7LP7PWM4K18X4KA8qtPXyzUNlpnfzbspUSEPq4A6aYbSA8XB7kaAyU8x3bjGdr0F4r2eh2e5eW+SdZUu5ct1Ag+tEnwGOdlEu/y7KmCzmTpQWeYHuQlaIueYfAOvAQZooEvpBkxYTTEcmQyAjiM/2/2uXs3sXEskSDQ7puFcE/Wg2GbEuwqZuzHlJyNftB3FEsSwiOKwjcMV77ZYNCH8oqegAULhpv7THUIvSJvGYQeibspXWfVrtX0a5C8RVLXNRoKJXu+ZxHQGDLzvXX77FdJ56+iSE9W90+fT4BT55A8KsYxPdj4aoo5e8e7z9B1fPB4OKDBkT4m1/aCltzKiDAssHcrViFkRP7QpZY/7KnVFd41PWfsObeUv2YoP3vcI84+QeYJtRwdsXYSmLa4DAEJkaHfHd7Er95dNq2qZ2UYBL7aGSD6wHGH+vLhLbjYflthTzj8F6p7RpKlOlqwMZSxbXX0GlVAykqCgYPHXiWp+h9bh30vJC1y9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39840400004)(136003)(396003)(376002)(346002)(7696005)(6506007)(26005)(9686003)(5660300002)(41300700001)(186003)(86362001)(4744005)(71200400001)(2906002)(66946007)(4326008)(8676002)(6916009)(64756008)(66476007)(66446008)(54906003)(8936002)(316002)(52536014)(66556008)(38070700005)(38100700002)(76116006)(55016003)(478600001)(122000001)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e70/hIDeiqTRH/eLp2NtAVycrS9v7uGVruKoCiUa23lGC+cl8yiYQWxKa+zW?=
 =?us-ascii?Q?OKIbeIAy89+hoc6kamNZ+CpU4S9WJEaPuUkRe87N7SOZq5gNB/r3bHokntbQ?=
 =?us-ascii?Q?+g1nfDx56zAAbX0uKOkRRVU7fqU72WWwGNuuhOUCDUAddh4DC/rxptCl/xYQ?=
 =?us-ascii?Q?+pOgvGXc3AsnXXdMTCoWxGK2I08k3MtfuGKD0KHHG/UPHHTBA825SfuGKmAx?=
 =?us-ascii?Q?viK+U0hhvU+f8BAOq6T9n18LT6BEhDdTdOz+uYRIpxMb7GlOQ4vV6Lx/jUwH?=
 =?us-ascii?Q?xBIvyz4fW0BLHrc3wkDFmrWvILAa8Q6tPnGKfLT3XnjQqWLUrHD65T1+I2my?=
 =?us-ascii?Q?z41nQbPMUeb4p+znO8UdYLiZ+j2L4c2OaTNK4+7kB2UOe1MsgEfaWX2FBOTY?=
 =?us-ascii?Q?oIfnm5wc2/NgRzR7FfP71jwUM1FVf07OJPOys94ceJVXtclfJcGm834NcHOi?=
 =?us-ascii?Q?oIOayj0t+/2cJLeVake8JaLSk99FaubMcVtB6SHTvY7tFrwPC2XBy/C43maq?=
 =?us-ascii?Q?NT5QQnpzQeYvlmRfRw0N+jFj5eMe4Gx3vTNfPZNimxTmuGT0/EOogNPUh1TB?=
 =?us-ascii?Q?A2nfzgFi3iphScCyLvFUDJr4/nHvibxtklxb/iVmMFJtEVzVOzvtm5xV8iGo?=
 =?us-ascii?Q?6VLQQdZH7Lamqawgo2KaqCG1JbuaFgUvQnClKJuFcNriUdE+ao7gYJoBg7K3?=
 =?us-ascii?Q?CCy08c/WtVUfA4A4+wkm7DEyOGJxffZJ8vzciP2XXSTrQ0SVdGFOlI9YNTbj?=
 =?us-ascii?Q?MdVyByWc/FP/puk2OlcTPbvtcRAlOZoUgrdrShmjaMh9VURHKa3j0OG1B6nU?=
 =?us-ascii?Q?UvA4cZ0fr3fQLixXZaw+4pGRHtV9US0E1NsXL8+TcLe8qDNq/gAY6lu12wzU?=
 =?us-ascii?Q?qifjWa/gl8RnMYAtUFvd8S8uu22zKiImv8nD6JkxDdDMMgYw3KYYdvbkedxS?=
 =?us-ascii?Q?UlPW+oPlG2K5U9Kre0OLjPXeUgQYoJ2I/5kB9qcHx+/YJvoXIn2DUNzQV0xA?=
 =?us-ascii?Q?rFKxlWxG0X9rByUehWjV6Z32kn2d6sh7xHV5tMnXdTFCi3ujVXrHYX8sl31n?=
 =?us-ascii?Q?GdD+R14YatHBkJhLA/h5XwdHiNu8xk/1VlscrsN7XMNfIyGt4tVDttMzdDM+?=
 =?us-ascii?Q?Zd3aS3D2iBLOt4DpZuQ/0h6Z4A/L9mfeav10l2W+uY7HfI8oYpwljp7g3b8L?=
 =?us-ascii?Q?4yxPVEdrVsMLscYL3NviqAPEF6CMcfBa7JQTpE67OWLi6/fGY3Dj0JNw+6Hx?=
 =?us-ascii?Q?hE8oB4WJQQmLoFBxEcGtlJmjfsb8gE880nw2SSaCf7rbe5WXEFAuBXbvx+DP?=
 =?us-ascii?Q?19TFtuDe3ZzJhrvl7WWb/bno7C/DUh1HtwGk30ROaOrgXycYBG25oiUJJowS?=
 =?us-ascii?Q?wPIfllSXJAm42r7JqHyjjjZTiqjRisk5pTNgoBneaGd337otyI0byhwmS1SY?=
 =?us-ascii?Q?THIDBzgpKNmipisQvXD2uVagkc2TLluzmnvs34VRPndnzNGsdECwy96bxDVe?=
 =?us-ascii?Q?ynWU7BHuHT4RtgaIz0UI5XDeo0QrK7Uz56LCfR5CGzA1D7mQRIySUZolHzJK?=
 =?us-ascii?Q?KjIwPXGU/34NgY3TWe5QlKABchbVbGXznVvQiecI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5301177f-c70d-49c2-74b5-08da54ed51e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 07:52:28.3695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52Dfrv+C+utZxZ5ewk6oXsZZCtq2h9yI/+1xeP5m0n7qb5qZqehz4kKVxWDJQ1Rf2tTKow80iPr+xLBA29WK8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2349
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Thu, Jun 23, 2022 at 09:43:20AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > > > The bug is that we should still enter this loop if "tx_len" is zero=
.
> > > >
> > > > After adding the "last" variable, then the "chunk >=3D 0" condition
> > > > is no longer required but I left it for readability.
> > > >
> > >
> > > Use either "chunk >=3D0" or "last".
> > > I think the former is more simpler.
> >
> > chunk >=3D 0 doesn't work.  last works but I think this way is more
> > readable.
>=20
> Fine, I can remove the chunk >=3D 0.  But you can see why your idea of
> removing the "last" doesn't work, right?  I mean maybe it does work and
> there was a bug in the original code?  Could you please look at that so w=
e're
> for sure writing correct code?
>=20

Why removing the "last" doesn't work? If "chunk =3D=3D 0", it would go thro=
ugh while loop once, and chunk will be negative (chunk -=3D ep->chunk_max).

Best Regards,
-Neal


