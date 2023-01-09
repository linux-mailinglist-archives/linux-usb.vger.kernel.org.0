Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F665661C83
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 04:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbjAIDCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 22:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjAIDCV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 22:02:21 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0692160F2
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 19:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LejonUjZ1+aJIwGO3+w02WNZRndF4Clw5JO5P1/JvbTzXzl6wv51kz9j75bcOduQs1cozT7fxj14zbrkYTtSKuQWS/6usFlsCZ6DAbLd8YCodnp9idv6kAteQGsQ9nl1zBGpYgyicjlSjjFGQBfqOY0zhBthRum7Bnt0OXpJjYmwLOSGo5A40xIiAJ7SK4O1hHiXHK2n6XK3kqzecaGQKZvvJWIjfGPG7g48n0IN7edEQUyPqJvWZdDQS/fopO/OIOxlVzrCMyKLDbrsLLbYuId+w+ceboOUVshoaY86XTF/noApZRvozaJYDUr7fB5k4jfocyvOmk57LjW4C/gfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8jrITFWEGgaf3dBv/VoChHd0itWCpPByNiV0GQwvvs=;
 b=grFKLx/fX/T1ry2UAeXCVDOu5H+TagBMgvKmwkGfmkpxaf+hRlb2N+H3GYYhrTfn4QnEW/cx0ku93t/tf/w5ECgaCWRJCZcokB4JKMvG2Jv/t49owZLLg7R5yXg+sW6uYCYN8sSqLOLdL6DmAqc3oc/AYTEuPsfHxSSw93FOrolEFhnPDdD9ga7c4sgGEycqwErlZiRZVlXAGZTBXB1CccXIVzBXESsD1ESag+OJmS0ziqH/G2YFmKUIche9GPO8yHgQMBfrPMneU+y8XCjrILCm2V9Xb96+eJXn5D6O74FlyxXd+0q3BR9+1HAIamyqOBdhj9l2GERX5vv3qMhekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8jrITFWEGgaf3dBv/VoChHd0itWCpPByNiV0GQwvvs=;
 b=hYTGb3t2qXSOjIOId9wUPruaG69bF0tNAOMqI6ULtLzGhAWQrhWcttSkm65orqM+Y7ju02SVrMqdA967ie6EOejSO2+XnUs/SvGYbc0qERwdspgFw+zgbLQWw5TxXWH3ZQg3dX948Epm3HOHayT8RbbqRFZP1NiY3k4Zf/yrhMM=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU2PR04MB8903.eurprd04.prod.outlook.com (2603:10a6:10:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 03:02:16 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 03:02:16 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: RE: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and
 dwc3_writel()
Thread-Topic: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and
 dwc3_writel()
Thread-Index: AQHZIbEBresvYI0TfEi9xzZn43RMUa6S1kwA
Date:   Mon, 9 Jan 2023 03:02:16 +0000
Message-ID: <PA4PR04MB9640F0C12291662301F793AC89FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DU2PR04MB8903:EE_
x-ms-office365-filtering-correlation-id: 2e880d16-2c42-46bf-dac7-08daf1edea27
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /J8vmo/6UXV//3AiQjy19RGjaVhmV3w/gzBFy5aVZ5XeawWOUEmwpl43YbHeh0TKFvKC+348jrn0czdsVt3IA3BftxayB4Lten+s8wHH9s/ewiUSmE/w4k6WagCGK/pFVmwEfvrxvZ9df6lhCw1PUQV9dkodv5Nzbk7CR1dn4NFIFwqa37WmNhgGEv4wU6QutA9USPkyoVh5iTF5/drRwzuJxiNgSIH6fK1IemUb7uq0Q3meNqMeXhHKUynbPOW0yeGwwjnMgdhlLnr2mnvv+54EIR+zaomp8IO4tB4Kx4r3nxjruH8Pd3li9kGs4OcmWq/lPZWSvUDcieEEcdQ4N4+c5DbEAeso/zcDGknDECVkZh9v6wTlo8jMJDjvNCT+Lxi3b9k9sxFLlMUfIAM26EdA74aMFaHY9in7mvxb7J4ZLUkdkfOysamTsckG0Iw/+tIyoauk/1RisneNN5qBENbb0A9hEV7DvA6X+mcFMtNaMeOWO1Zqzz21P9tcptghBjh7s6X7qK2KmzNBayKxtRko9pEzzPIZufHjV+uuZFJ7tTtDJSMLe4xxpuOTtm3Z3Cpi0z7izaQXTHAb9yDqGPVAeTt5XFyJHBWvbuSd77zQ5eMhL42mMKJCvE0Wqt3YrF/GuJhbdtfUS/99Ncrl5rhChIx0/crKODJjwKX2QBXu19uyy+2dv1QN6+XyfFgCd3u17tU4V4Vr1CTcXlLLUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(76116006)(8676002)(4326008)(66556008)(64756008)(66476007)(316002)(66946007)(71200400001)(66446008)(7696005)(38070700005)(110136005)(54906003)(2906002)(5660300002)(8936002)(41300700001)(52536014)(86362001)(83380400001)(53546011)(6506007)(478600001)(33656002)(55016003)(122000001)(38100700002)(9686003)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u9hTaiENl3eTydlBXtWZxJYh3jSbiEfVqPuxjp95qMyPyReWQtTJXN2rywnI?=
 =?us-ascii?Q?8fKIRtOi6peCBK9F6F4LNmmRdXkSjMrnf+afNGKi7xZLYMo0HxsdLi5u/B6W?=
 =?us-ascii?Q?IexeAHbihYfNTy/C2iKLA0V4fOOcZ3bfVrLpCgFxp5ukvIns0efRm/NA2gow?=
 =?us-ascii?Q?vA6tVAOjIh+TVJOKZelcjCXzUhI3W3Pz5YfytJyiRfREPvaLjlYlHqhJWIBo?=
 =?us-ascii?Q?Gdyr7h/3+AW7I0G4EJJXdGzSxzzB+v8X1f+eLzrSxQhH4XrCIto0Ezt1c4kL?=
 =?us-ascii?Q?aDBMLWoHKFdxnA404Kct5J0AhG3pw00HzVas/v0jRVxzPxGlXZ1sWk6MYdh7?=
 =?us-ascii?Q?tJBRUciR+DkhA7ZqR7U5nd/3/sYPwTaP7wTTPkkompWBYjlnA8sgUBLeArhJ?=
 =?us-ascii?Q?Unv72hg3U4PoSEhK0PSWO1ePHxnde1VoLdyOSfT1pRnfdy9IKKUFzkMp4Klj?=
 =?us-ascii?Q?Biq49AUEo3j1CgqRiGHMnK/ySZX4V4jeHnoQkWmIr6lBhrIQYnGUwUqo0pOI?=
 =?us-ascii?Q?dSSw+f1q2Kk8CmB6AihXlii8bsIRWXox+TCpdox4m+K4vMd2ANk5vOPCofOF?=
 =?us-ascii?Q?lRP7PjsEAzD1gnmu08sHigI9IcGq43ZWGo4Mtdk1IEP15lMHYx5heyobHuZ0?=
 =?us-ascii?Q?VRQwswJHGQG1+PakgLkAsD5aWrF89VkljWLUmEcZnI2hCPMVbiQzibGCzT8o?=
 =?us-ascii?Q?STzVCG9E/8GZK176RcaqKvci1PKA1OT9F0UR84YuYrXsenXWYsNZz1tmrIXq?=
 =?us-ascii?Q?nnZ8mSzP94o3KhoHO0acXSQvBNEP9xkyKXb3rrnXkihKtfo2hgGmrME1JYpa?=
 =?us-ascii?Q?C3l9USYy41nbr9Mc2c2V4t5afJPViCcjn7zj8hS2lTUpp6y2YS1fs/7+lmaR?=
 =?us-ascii?Q?EyFOMBHPUCxr5PlUOXyKLscC/3KRj1XbZ4agjNaIfV2U9GsukysVI05C6jum?=
 =?us-ascii?Q?2Kc91uqB3i6jTjbNHEeoahY26bLuqfzoUagaZ/HHxtuoXS+iJGjXqLQZYf1i?=
 =?us-ascii?Q?1dzIkyqNfRhSEtiwRVtAfbs25cMkTot8CIm8caATv5Tc7hVoOtOXqZDshzWD?=
 =?us-ascii?Q?lp7d5yz0a8r17Jjr+dNC8hym39Qg9tsXRlPaZcbIypep01OAzgSFYwPB/vOm?=
 =?us-ascii?Q?1qyXz5goKW1Yea1FKwoPMIUX1GeiSBWCtRwKNk4+H8VInSoASt/hbrQxwMKt?=
 =?us-ascii?Q?FoEY1BeR055w1K4BlKyXBIknpQlaeyw/LWEJD8rLuLe5NZEsW0LhysEJqQgs?=
 =?us-ascii?Q?cs2Mq01+kwwAqE3PCOzMS3aDt/u5IhQ75NiZOfHnnpNjb9f975R7DU2goWh/?=
 =?us-ascii?Q?AUSA14hiuTVxvKx5YrFYEROvF77oJ4eVmSrzbJHCSGRHnLhBpJQVtrMJYPjS?=
 =?us-ascii?Q?uz0xu5/hqOd/zBADFIWqLRdyUCY3IQza0n6andl08HDhqRhgqbbeq8xwQIdL?=
 =?us-ascii?Q?ZIXuEAUVUWDfBbS7/AuAUxR3L61qgxF6cYIfrE37/e/yCQHIYBhQTxVYnh1G?=
 =?us-ascii?Q?CoxMPDmwPMAUYb1P8g+qshvX5SBBs0g+UcYs53keZFP2/iT0FlwffF5uEcGA?=
 =?us-ascii?Q?tiPbVZqNTixcmvEXdo0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e880d16-2c42-46bf-dac7-08daf1edea27
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 03:02:16.4057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWeH+FUf3V7VuolyChexho5spqA2QTSto3ctIDpbFh5Sd6F5PmrIesoTxFYn/ViH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8903
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Linyu Yuan <quic_linyyuan@quicinc.com>
> Sent: Friday, January 6, 2023 5:22 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Thinh Nguyen
> <Thinh.Nguyen@synopsys.com>
> Cc: linux-usb@vger.kernel.org; Jack Pham <quic_jackp@quicinc.com>; Wesley
> Cheng <quic_wcheng@quicinc.com>; Linyu Yuan <quic_linyyuan@quicinc.com>
> Subject: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and
> dwc3_writel()
>=20
> when dwc3_readl() read register and dwc3_writel() write register,
> it will run operation 'base + offset - DWC3_GLOBALS_REGS_START' to
> calculate register address, seem the minus operation can avoid.
>=20
> the original register definition is offset from XHCI base 0x0,
> now change it to offset from DWC3_GLOBALS_REGS_START(0xc100).

Is this really can bring benefit? With this change user has to takes
care an offset, looks to me the original definition is very straightforward=
,
use the offset defined in DWC3 Databook, user can directly check each regis=
ter
definition by offset (not just by name).

Li Jun
 =20
>=20
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/dwc3/core.h    | 150
> ++++++++++++++++++++++-----------------------
>  drivers/usb/dwc3/debugfs.c |   2 +-
>  drivers/usb/dwc3/io.h      |  12 ++--
>  3 files changed, 82 insertions(+), 82 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 8f9959b..3af244e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -85,90 +85,90 @@
>  #define DWC3_OTG_REGS_END		0xccff
>=20
>  /* Global Registers */
> -#define DWC3_GSBUSCFG0		0xc100
> -#define DWC3_GSBUSCFG1		0xc104
> -#define DWC3_GTXTHRCFG		0xc108
> -#define DWC3_GRXTHRCFG		0xc10c
> -#define DWC3_GCTL		0xc110
> -#define DWC3_GEVTEN		0xc114
> -#define DWC3_GSTS		0xc118
> -#define DWC3_GUCTL1		0xc11c
> -#define DWC3_GSNPSID		0xc120
> -#define DWC3_GGPIO		0xc124
> -#define DWC3_GUID		0xc128
> -#define DWC3_GUCTL		0xc12c
> -#define DWC3_GBUSERRADDR0	0xc130
> -#define DWC3_GBUSERRADDR1	0xc134
> -#define DWC3_GPRTBIMAP0		0xc138
> -#define DWC3_GPRTBIMAP1		0xc13c
> -#define DWC3_GHWPARAMS0		0xc140
> -#define DWC3_GHWPARAMS1		0xc144
> -#define DWC3_GHWPARAMS2		0xc148
> -#define DWC3_GHWPARAMS3		0xc14c
> -#define DWC3_GHWPARAMS4		0xc150
> -#define DWC3_GHWPARAMS5		0xc154
> -#define DWC3_GHWPARAMS6		0xc158
> -#define DWC3_GHWPARAMS7		0xc15c
> -#define DWC3_GDBGFIFOSPACE	0xc160
> -#define DWC3_GDBGLTSSM		0xc164
> -#define DWC3_GDBGBMU		0xc16c
> -#define DWC3_GDBGLSPMUX		0xc170
> -#define DWC3_GDBGLSP		0xc174
> -#define DWC3_GDBGEPINFO0	0xc178
> -#define DWC3_GDBGEPINFO1	0xc17c
> -#define DWC3_GPRTBIMAP_HS0	0xc180
> -#define DWC3_GPRTBIMAP_HS1	0xc184
> -#define DWC3_GPRTBIMAP_FS0	0xc188
> -#define DWC3_GPRTBIMAP_FS1	0xc18c
> -#define DWC3_GUCTL2		0xc19c
> -
> -#define DWC3_VER_NUMBER		0xc1a0
> -#define DWC3_VER_TYPE		0xc1a4
> -
> -#define DWC3_GUSB2PHYCFG(n)	(0xc200 + ((n) * 0x04))
> -#define DWC3_GUSB2I2CCTL(n)	(0xc240 + ((n) * 0x04))
> -
> -#define DWC3_GUSB2PHYACC(n)	(0xc280 + ((n) * 0x04))
> -
> -#define DWC3_GUSB3PIPECTL(n)	(0xc2c0 + ((n) * 0x04))
> -
> -#define DWC3_GTXFIFOSIZ(n)	(0xc300 + ((n) * 0x04))
> -#define DWC3_GRXFIFOSIZ(n)	(0xc380 + ((n) * 0x04))
> -
> -#define DWC3_GEVNTADRLO(n)	(0xc400 + ((n) * 0x10))
> -#define DWC3_GEVNTADRHI(n)	(0xc404 + ((n) * 0x10))
> -#define DWC3_GEVNTSIZ(n)	(0xc408 + ((n) * 0x10))
> -#define DWC3_GEVNTCOUNT(n)	(0xc40c + ((n) * 0x10))
> -
> -#define DWC3_GHWPARAMS8		0xc600
> -#define DWC3_GUCTL3		0xc60c
> -#define DWC3_GFLADJ		0xc630
> -#define DWC3_GHWPARAMS9		0xc6e0
> +#define DWC3_GSBUSCFG0		0x0000
> +#define DWC3_GSBUSCFG1		0x0004
> +#define DWC3_GTXTHRCFG		0x0008
> +#define DWC3_GRXTHRCFG		0x000c
> +#define DWC3_GCTL		0x0010
> +#define DWC3_GEVTEN		0x0014
> +#define DWC3_GSTS		0x0018
> +#define DWC3_GUCTL1		0x001c
> +#define DWC3_GSNPSID		0x0020
> +#define DWC3_GGPIO		0x0024
> +#define DWC3_GUID		0x0028
> +#define DWC3_GUCTL		0x002c
> +#define DWC3_GBUSERRADDR0	0x0030
> +#define DWC3_GBUSERRADDR1	0x0034
> +#define DWC3_GPRTBIMAP0		0x0038
> +#define DWC3_GPRTBIMAP1		0x003c
> +#define DWC3_GHWPARAMS0		0x0040
> +#define DWC3_GHWPARAMS1		0x0044
> +#define DWC3_GHWPARAMS2		0x0048
> +#define DWC3_GHWPARAMS3		0x004c
> +#define DWC3_GHWPARAMS4		0x0050
> +#define DWC3_GHWPARAMS5		0x0054
> +#define DWC3_GHWPARAMS6		0x0058
> +#define DWC3_GHWPARAMS7		0x005c
> +#define DWC3_GDBGFIFOSPACE	0x0060
> +#define DWC3_GDBGLTSSM		0x0064
> +#define DWC3_GDBGBMU		0x006c
> +#define DWC3_GDBGLSPMUX		0x0070
> +#define DWC3_GDBGLSP		0x0074
> +#define DWC3_GDBGEPINFO0	0x0078
> +#define DWC3_GDBGEPINFO1	0x007c
> +#define DWC3_GPRTBIMAP_HS0	0x0080
> +#define DWC3_GPRTBIMAP_HS1	0x0084
> +#define DWC3_GPRTBIMAP_FS0	0x0088
> +#define DWC3_GPRTBIMAP_FS1	0x008c
> +#define DWC3_GUCTL2		0x009c
> +
> +#define DWC3_VER_NUMBER		0x00a0
> +#define DWC3_VER_TYPE		0x00a4
> +
> +#define DWC3_GUSB2PHYCFG(n)	(0x0100 + ((n) * 0x04))
> +#define DWC3_GUSB2I2CCTL(n)	(0x0140 + ((n) * 0x04))
> +
> +#define DWC3_GUSB2PHYACC(n)	(0x0180 + ((n) * 0x04))
> +
> +#define DWC3_GUSB3PIPECTL(n)	(0x01c0 + ((n) * 0x04))
> +
> +#define DWC3_GTXFIFOSIZ(n)	(0x0200 + ((n) * 0x04))
> +#define DWC3_GRXFIFOSIZ(n)	(0x0280 + ((n) * 0x04))
> +
> +#define DWC3_GEVNTADRLO(n)	(0x0300 + ((n) * 0x10))
> +#define DWC3_GEVNTADRHI(n)	(0x0304 + ((n) * 0x10))
> +#define DWC3_GEVNTSIZ(n)	(0x0308 + ((n) * 0x10))
> +#define DWC3_GEVNTCOUNT(n)	(0x030c + ((n) * 0x10))
> +
> +#define DWC3_GHWPARAMS8		0x0500
> +#define DWC3_GUCTL3		0x050c
> +#define DWC3_GFLADJ		0x0530
> +#define DWC3_GHWPARAMS9		0x05e0
>=20
>  /* Device Registers */
> -#define DWC3_DCFG		0xc700
> -#define DWC3_DCTL		0xc704
> -#define DWC3_DEVTEN		0xc708
> -#define DWC3_DSTS		0xc70c
> -#define DWC3_DGCMDPAR		0xc710
> -#define DWC3_DGCMD		0xc714
> -#define DWC3_DALEPENA		0xc720
> -#define DWC3_DCFG1		0xc740 /* DWC_usb32 only */
> -
> -#define DWC3_DEP_BASE(n)	(0xc800 + ((n) * 0x10))
> +#define DWC3_DCFG		0x0600
> +#define DWC3_DCTL		0x0604
> +#define DWC3_DEVTEN		0x0608
> +#define DWC3_DSTS		0x060c
> +#define DWC3_DGCMDPAR		0x0610
> +#define DWC3_DGCMD		0x0614
> +#define DWC3_DALEPENA		0x0620
> +#define DWC3_DCFG1		0x0640 /* DWC_usb32 only */
> +
> +#define DWC3_DEP_BASE(n)	(0x0700 + ((n) * 0x10))
>  #define DWC3_DEPCMDPAR2		0x00
>  #define DWC3_DEPCMDPAR1		0x04
>  #define DWC3_DEPCMDPAR0		0x08
>  #define DWC3_DEPCMD		0x0c
>=20
> -#define DWC3_DEV_IMOD(n)	(0xca00 + ((n) * 0x4))
> +#define DWC3_DEV_IMOD(n)	(0x0900 + ((n) * 0x4))
>=20
>  /* OTG Registers */
> -#define DWC3_OCFG		0xcc00
> -#define DWC3_OCTL		0xcc04
> -#define DWC3_OEVT		0xcc08
> -#define DWC3_OEVTEN		0xcc0C
> -#define DWC3_OSTS		0xcc10
> +#define DWC3_OCFG		0x0b00
> +#define DWC3_OCTL		0x0b04
> +#define DWC3_OEVT		0x0b08
> +#define DWC3_OEVTEN		0x0b0C
> +#define DWC3_OSTS		0x0b10
>=20
>  /* Bit fields */
>=20
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index f2b7675..ea6c0e4 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -908,7 +908,7 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
>=20
>  	dwc->regset->regs =3D dwc3_regs;
>  	dwc->regset->nregs =3D ARRAY_SIZE(dwc3_regs);
> -	dwc->regset->base =3D dwc->regs - DWC3_GLOBALS_REGS_START;
> +	dwc->regset->base =3D dwc->regs;
>=20
>  	root =3D debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
>  	debugfs_create_regset32("regdump", 0444, root, dwc->regset);
> diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
> index 1e96ea3..d9283f4 100644
> --- a/drivers/usb/dwc3/io.h
> +++ b/drivers/usb/dwc3/io.h
> @@ -23,16 +23,16 @@ static inline u32 dwc3_readl(void __iomem *base, u32
> offset)
>  	/*
>  	 * We requested the mem region starting from the Globals address
>  	 * space, see dwc3_probe in core.c.
> -	 * However, the offsets are given starting from xHCI address space.
> +	 * The offsets are also given starting from Globals address space.
>  	 */
> -	value =3D readl(base + offset - DWC3_GLOBALS_REGS_START);
> +	value =3D readl(base + offset);
>=20
>  	/*
>  	 * When tracing we want to make it easy to find the correct address on
>  	 * documentation, so we revert it back to the proper addresses, the
>  	 * same way they are described on SNPS documentation
>  	 */
> -	trace_dwc3_readl(base - DWC3_GLOBALS_REGS_START, offset, value);
> +	trace_dwc3_readl(base, offset, value);
>=20
>  	return value;
>  }
> @@ -42,16 +42,16 @@ static inline void dwc3_writel(void __iomem *base, u3=
2
> offset, u32 value)
>  	/*
>  	 * We requested the mem region starting from the Globals address
>  	 * space, see dwc3_probe in core.c.
> -	 * However, the offsets are given starting from xHCI address space.
> +	 * The offsets are also given starting from Globals address space.
>  	 */
> -	writel(value, base + offset - DWC3_GLOBALS_REGS_START);
> +	writel(value, base + offset);
>=20
>  	/*
>  	 * When tracing we want to make it easy to find the correct address on
>  	 * documentation, so we revert it back to the proper addresses, the
>  	 * same way they are described on SNPS documentation
>  	 */
> -	trace_dwc3_writel(base - DWC3_GLOBALS_REGS_START, offset, value);
> +	trace_dwc3_writel(base, offset, value);
>  }
>=20
>  #endif /* __DRIVERS_USB_DWC3_IO_H */
> --
> 2.7.4

