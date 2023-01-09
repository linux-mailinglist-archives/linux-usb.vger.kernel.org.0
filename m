Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46C3661CB4
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 04:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjAIDd2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 22:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjAIDd0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 22:33:26 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B0D1176
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 19:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLCHd+H+jf1xWx91euZCjNP52KsOLpfObneGjcWRO3cI2hfFCqJWEaE6moXa8kY88s4LOY5hIJnt3JxV6O0CErQFtqyu8W/Exn2pcwdkcqb7iOcbFvugpJV+7aovgU2fzVq7/ZvXqdxHPwB4Z7HKV6RPrsemoUsDzp26DEto41FIk5YKTU1i08woMPru6Mx1FeP3z5ptpiHLBTww2oc092wHEZrXoHR+JSf3/i/NqH9Nf97uaLH7C+NqKJJ7ayTcbxTSU/q8P51sBpEQHmrrioQ2GM7XvftjChu5ICvnj0iqscmeMSIZB3oMoarDjgnOZ1O/iE67igEhMDIBxkyn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsLK6bwpwh0q3yxFCsBVhHYxVumGNg+1VkCZlDQq79M=;
 b=gPuWhn2SkcxpeF2DvXQ63uBxN07cMyBa64Y0Jw14CQkwnOsU6G0bys5R2t0VtIs+/EP5E/LMA37sVMJBFVsprO9w8x/S+Yc+0GcxY7xl4K5LNUzaIvqdC/6vpME2xTqe0gio6vQQoQcMxCHHTg2zVylZstCGCGId0jYO+Xzaok1aN8Jz0xpcDony1InBHiAv9BwXql4/IvgRSjzUBXM2AlboBFf8fbC05CPgUxM1BM1oZZ/RAy27h9Dl2HL1EGYEuicff7jZ8Nqsdf3V1B4IDLPbJTcnsPPvfoKcxnV8+k0O5Ba4/1a+ifvYxOu7++CBYpiX6hqOsSl+t9FZMTthHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsLK6bwpwh0q3yxFCsBVhHYxVumGNg+1VkCZlDQq79M=;
 b=aMYn6dL9sSjAfNBGnWvQ9116FGH75GoPA7rJtnHyBZCi3Ac6rLIAuDhInaboJNJ2FZCyB7v41qgJyxdSfa0vFXSjl+4P3Vfovh9MKUvk7yutijHiQXJqs0GZkZrJTf0CN+i3dgxxiHL7ZfkZ8Z3ALd9jNb8lu7zFjBJGLxQWi2g=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PAXPR04MB9518.eurprd04.prod.outlook.com (2603:10a6:102:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 03:33:22 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 03:33:22 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: RE: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbEr2/jvbCt1nECnl7W1DJIpla6VavjQ
Date:   Mon, 9 Jan 2023 03:33:22 +0000
Message-ID: <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|PAXPR04MB9518:EE_
x-ms-office365-filtering-correlation-id: e427c5b6-b3fe-43fc-78f8-08daf1f24278
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNTnzGSxKW+TGynzWBj7AwSBLpqYIOXesCiA8G2GNsnEIOwKh2u81WjUOkpPFPJZA8/nAg5ZD/h5doxx/aCsVz8FGlHkuRFUPhTROmIcKbBMxCYWk/avrj+FGizH1R1VI7lIjBPGdW4a4tSqilTWgTCRDHfMo018RRh0+5f4OBgiOBaG8R4HtbpG7lFT4JS0iJRkfz6vXhhP1hDYdMveVrTfUwwTpEaLeFLpyJDHZ+w2ZPh8VCuuFlBHRNa70EC0CALOngXcAnW+a8A9S0VCFQBshlGiTK/8n5JV3dyy4U4eZ8MBDXtKXoe2sA8XfaMl73eIPBIvWZ9zA49Q/Ie08Q9NKtudRMpyHy/12pzKYNTJFBcMFM3pDzvufgksTW/GQ7p++R8voSftNivd0eHDE5freSTHPDlsyJBJylkF0tMGmV7uqNB/uXa8cIc0DXDjhlG5qNFK9Z3DjHtURz+463/u0aeC//865dZWupNe8PFUz1HvXjdi2GQ+VD1Tmsed5i38Ytbj4ylEpX2G+n43SfM2uoktUk6E13Q8ieMoa8K0k4byIncISNB7M5A9fP3vrRTFLd0p1vuU9moESS4/KDxyGpQHsPDvI7AQxW7F65+73UM9oxMLvTYnMGrdQYMohJ8Re6iTf503zZxjlBmMkQeAV16yksouetyHGNvHvUP0stxY2T1b2aAXOB+ZxLHLeh82JcSGPIxgqcuvoL68oQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199015)(55016003)(86362001)(33656002)(7696005)(71200400001)(316002)(54906003)(38070700005)(110136005)(478600001)(2906002)(5660300002)(66446008)(64756008)(76116006)(66476007)(8676002)(4326008)(66556008)(8936002)(41300700001)(66946007)(52536014)(38100700002)(122000001)(53546011)(6506007)(26005)(9686003)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SzDBjdTC1cEm2xJ9JPMLihhtlDDaFd5aJsdmsQSxziSmtSXfPHn4qBfY4Tds?=
 =?us-ascii?Q?GtdRXLBkyx6Vl8wNfYtFN2WdDGD8Of/Kq9glfZPCO55nuq/15Rxog7IkzMc9?=
 =?us-ascii?Q?EXzO9Jjv3Q9TvZpqL09BX2PWLq8XzhIqPmrMZe6UPGO/EebYi87JRVX2He+M?=
 =?us-ascii?Q?2/7T8l6BgmLAFhfwi/59KtnU0jNsyRVipubadsgaxX9bcDp3a9rvO7NwDuGF?=
 =?us-ascii?Q?pxWYMO7q44wZOJzX/ZU0gjchxWzP/UIS9Xabvy/T3QNxShDULl0x1zwC01hv?=
 =?us-ascii?Q?v911FxMmfRqb3ObsPviXgemR3oqxU+noEGvqeFucsALvrnoId0D+F4ydvDee?=
 =?us-ascii?Q?DGeWQ/mLIpY1Ug+pofhgesNIf7fkrvDlNwBgVOscd+7CqA4q3AMHdY8WMEuw?=
 =?us-ascii?Q?DSVcUmdMpJ2XUsJs9biOq/L0PK7Y+mVgMAUGX0jVxh/Q0vjy2KXNjlt4gyY8?=
 =?us-ascii?Q?cF30bEJRNVVRhkWiPquF/oib62tGx4FyVIFIJEXAxwm6Z914NJxOMEMdmz+N?=
 =?us-ascii?Q?NeaL3p5Emqc6DmQ/xU3yJ0Ioy6slH8LXxsvJJwuJfcfxEiTwpjWbe+Y5rXlC?=
 =?us-ascii?Q?rePBxxHuJNhv983XzwIW933d0MfscCqU8aYK8k4D4juV3aWDQlX0IxRHi5Ds?=
 =?us-ascii?Q?5ONLqBL+70u3baq2lTERejmf6//8ZkeHJnp3G/UsqfedLbhp52jTwsG5alhK?=
 =?us-ascii?Q?fqpO2UCVvDKnoE5X5aoTDVVGsM3Awch6SMLa1u80jAskl3LNYLpvQezQAMHY?=
 =?us-ascii?Q?uDFF8iRUmrafTuxoER2faqGZAQcXnJer5+orL9z5R1eBlFHXv5bRG9Wt3bm8?=
 =?us-ascii?Q?YSaVxQTIAN7I0HtpjUctExSgsy9H4Tdlvsd0bwCUg5VdfVvGn93qIt/dJpbF?=
 =?us-ascii?Q?bP1I2qbIA0EBJ6/vIqdpr8HULxQpLQiBNqaC1o/q/E86sdv88B/h6PfXRTN1?=
 =?us-ascii?Q?Mok9FEbzcsyedSGgD9lqTG7oCJGpgtivyeZ5LqzYJRG7rXsd66WyhzVzxSw6?=
 =?us-ascii?Q?zwqQoKy1dwZco7GjBJBmcp1TTOgunUu2JgrKaWDvgrijGJ0UETsnFtUxEVoT?=
 =?us-ascii?Q?aWhosFIBrhgzmDAFENUne7QPp3Dzx8QqdVFkWwqDWTrJhwp+PLHICIeaGO+6?=
 =?us-ascii?Q?9cYkppyHOEON721bA+/EGfzUZLItxP/prVm4AdX7+LW6yJGAL3OG3JiH47h+?=
 =?us-ascii?Q?rguNRt1Uw7G382oPGGVCoGZJGwqgWYHbMaP53Pl7cnX5Us79CH0FpttwtWx9?=
 =?us-ascii?Q?rRdLv200YYgR4zSRrBk/+qP7ZBEZLd5ApWpdZYAMspZmAwvlzd5O6le2fmMr?=
 =?us-ascii?Q?7QQ9R+YicIb0lklIynWjSBuXpTWbvxF+HF7+DQF1p0zDQBt3HKSkkiRheQ38?=
 =?us-ascii?Q?aRsyxbVGVnvKZhXmPcUPYK10+rmhwI57lbJZQXk68BA0SoX5rz5URZtrZxmM?=
 =?us-ascii?Q?6O+FeUkGQVO/MKHFg1uiUfjy7iEhJ8qVgIuUXawejnR8iGeQrR/YNQRGsg2y?=
 =?us-ascii?Q?73t2rkmisejH1YPYYd4Ve+rD8hi23ww35O7dYs3Pssb8i+N94rzzT34xDf4X?=
 =?us-ascii?Q?hYVyzvg21BAuyjOweWI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e427c5b6-b3fe-43fc-78f8-08daf1f24278
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 03:33:22.5761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQXBpixOX95ZOH3JNKNpuDGm4i0L8ZbZihWv2amgDEuCiDl9xvq7rhjtzdu7b/s3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9518
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
> Subject: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
>=20
> There are multiple places which will retry up to 10000 times to read a re=
gister,

It's "up to", I think at normal case, it's a small number, if a large
Iteration number is observed, probably there is something wrong should
be checked? =20

> when trace event enable, it is not good as all events may show same data.
>=20
> Add dwc3_readl_notrace() function which will not save trace event when re=
ad
> register.

Simply drop part of register read is not good, this cause the final io trac=
e
of dwc3 is not complete, I think a full/complete foot print of io register
read/write should be kept.

Li Jun

>=20
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c   |  2 +-
>  drivers/usb/dwc3/gadget.c | 12 ++++++------
>  drivers/usb/dwc3/io.h     | 10 ++++++++++
>  drivers/usb/dwc3/ulpi.c   |  2 +-
>  4 files changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> 476b636..550bb23 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -297,7 +297,7 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
>  		retries =3D 10;
>=20
>  	do {
> -		reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DCTL);
>  		if (!(reg & DWC3_DCTL_CSFTRST))
>  			goto done;
>=20
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c index
> 7899765..f2126f24 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -97,7 +97,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum
> dwc3_link_state state)
>  	 */
>  	if (!DWC3_VER_IS_PRIOR(DWC3, 194A)) {
>  		while (--retries) {
> -			reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
> +			reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>  			if (reg & DWC3_DSTS_DCNRD)
>  				udelay(5);
>  			else
> @@ -128,7 +128,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum
> dwc3_link_state state)
>  	/* wait for a change in DSTS */
>  	retries =3D 10000;
>  	while (--retries) {
> -		reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>=20
>  		if (DWC3_DSTS_USBLNKST(reg) =3D=3D state)
>  			return 0;
> @@ -239,7 +239,7 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc=
,
> unsigned int cmd,
>  	dwc3_writel(dwc->regs, DWC3_DGCMD, cmd | DWC3_DGCMD_CMDACT);
>=20
>  	do {
> -		reg =3D dwc3_readl(dwc->regs, DWC3_DGCMD);
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DGCMD);
>  		if (!(reg & DWC3_DGCMD_CMDACT)) {
>  			status =3D DWC3_DGCMD_STATUS(reg);
>  			if (status)
> @@ -375,7 +375,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep,
> unsigned int cmd,
>  	}
>=20
>  	do {
> -		reg =3D dwc3_readl(dep->regs, DWC3_DEPCMD);
> +		reg =3D dwc3_readl_notrace(dep->regs, DWC3_DEPCMD);
>  		if (!(reg & DWC3_DEPCMD_CMDACT)) {
>  			cmd_status =3D DWC3_DEPCMD_STATUS(reg);
>=20
> @@ -2324,7 +2324,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>  	retries =3D 20000;
>=20
>  	while (retries--) {
> -		reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>=20
>  		/* in HS, means ON */
>  		if (DWC3_DSTS_USBLNKST(reg) =3D=3D DWC3_LINK_STATE_U0) @@ -2510,7
> +2510,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, i=
nt
> suspend)
>=20
>  	do {
>  		usleep_range(1000, 2000);
> -		reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>  		reg &=3D DWC3_DSTS_DEVCTRLHLT;
>  	} while (--timeout && !(!is_on ^ !reg));
>=20
> diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h index
> d9283f4..d24513e 100644
> --- a/drivers/usb/dwc3/io.h
> +++ b/drivers/usb/dwc3/io.h
> @@ -37,6 +37,16 @@ static inline u32 dwc3_readl(void __iomem *base, u32
> offset)
>  	return value;
>  }
>=20
> +static inline u32 dwc3_readl_notrace(void __iomem *base, u32 offset) {
> +	/*
> +	 * We requested the mem region starting from the Globals address
> +	 * space, see dwc3_probe in core.c.
> +	 * The offsets are also given starting from Globals address space.
> +	 */
> +	return readl(base + offset);
> +}
> +
>  static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value=
)
> {
>  	/*
> diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c index
> f23f4c9..7b220b0 100644
> --- a/drivers/usb/dwc3/ulpi.c
> +++ b/drivers/usb/dwc3/ulpi.c
> @@ -39,7 +39,7 @@ static int dwc3_ulpi_busyloop(struct dwc3 *dwc, u8 addr=
,
> bool read)
>=20
>  	while (count--) {
>  		ndelay(ns);
> -		reg =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYACC(0));
> +		reg =3D dwc3_readl_notrace(dwc->regs, DWC3_GUSB2PHYACC(0));
>  		if (reg & DWC3_GUSB2PHYACC_DONE)
>  			return 0;
>  		cpu_relax();
> --
> 2.7.4

