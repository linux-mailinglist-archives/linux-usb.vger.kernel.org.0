Return-Path: <linux-usb+bounces-14270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F8963FBF
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 11:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426931F2149A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 09:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FE618DF97;
	Thu, 29 Aug 2024 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ckk0ZFn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5418DF7A
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923120; cv=fail; b=l29ZGXJaIDUCmauBmM0oeiGqXVh4hhjlnmymavpUFpC0/VgMllI0Zo9ErGUV2DX4nJmYWnmKWWduy3EBOotnCaVw5BOxe8vaHj4VioraEHPtgSh1Yq1nNyU8q1QXgJ6Xl+P8frKPjLNCU5X7l6fKvRSh6u6q8sQd4i3Qnf4Jy9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923120; c=relaxed/simple;
	bh=uwpocaIrjl7eOV6aOkTEhAXyyv4rIgl2Fj19AnTGp0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NXyt8Ud4ifhOw6G+8gNZwvcEpPIFFaMDAXN6hzRdNYEeKnC4WMGm9XdcwG+EXnbQJ8zI8LouzbbyAug/b61sTKZyerQlei3q68gjptDhMibycJoDU2DYoJ5HTRgv/BTsdODFrDUAdRo6OiHCpeLPTo9K8rmb52D1juQqAkEBqVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ckk0ZFn9; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4K1ZRWxU+RweKYDDE1fDprXYSKBkz+bUAI6ztlBGdukjHxEPWq5nAsHY9ym2V/VFp197UnKi+LVB4KKWsf61jdxYzB0YJWxZ37u0lQTA2oESm0Ivj8AhkFBQ4Lse4QbeCmuZlTGLefXaWLbRh9lLS7XKbM8bNBmrYNF3hYswh/dZyMtta7rNqPZi5a9maTUmDp+vnM13I46zqGtWgK2wgTpHbO7ateeK5UxpPt5efxY5PyScIkSRO1eVBDq+HWib9sai0yTC++5RMmHh9eoV4lIqDMyA4puT7AIu2Dlx/VT/N5h8ESKJFvdnyyKpCfbE0fjXTFT9oGaWep/+pSZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDxLltLxS9C5SdGf1ilXZc0ZhkUQA7T4iaik/riCWwU=;
 b=RKlMfURgPJAyPAxrYTT4B7VQSouVFrYxEbJHM2mKGmsU7vsK+KES3LIP2fQtGDlaW9Pelk/QKR9gQss41s9LI1GJZQw0vstAEsMaYQm7AmzIGqtAGgoHsPJGqjK8awHK62pmBIWhUYXopqT/0VIvgRmvd6aAfaDkDZvIDQe95k6BO/BYHErSwcEGU+U8Ghqul+e1NhB++7ZelP7tON0raDSE6i1Qi5iG/AGpCv/LhsoAsAqnEaM33ChvmG7cGekCaTGKP2udvJIVrXpD3YP7a7Pa1BH6X75gMkPq2YrKv/j6S0A9uhlvSMqRn8jSnz39g0WcG/MkRP/nOCNg4K3DeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDxLltLxS9C5SdGf1ilXZc0ZhkUQA7T4iaik/riCWwU=;
 b=Ckk0ZFn9aV24ppjsFpvs1rpTuJG6lW2rUMP5/+akuRTcTW4OGyI8T8NXJhwePl7gAsohJskYI1/OplcGUSaFSX3bMvtsNDLJ4HB+izHe8T8eE/sxVLrs3PtiHp4qEKqjN8NvjXaml2d/0fCmjgDFDGQNjOHRLW+BzK7EKVS/mRmxUl8rZUzDkCyzOqGbWpVmwrDhMDEWO8Ddh6WPcJkPCv0xvcKtM6aOYLTGe3os1Jo2jTJRVGVziS8zDf0ODQRt/npcM6tnsGoyqMyROPDtG3GrdTrg+jNDvKoUYqXlNm1FoJNh0JWZjUKXdxchByRAb1LcxthHsNSp3xVZ8+EZlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 09:18:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:18:34 +0000
Date: Thu, 29 Aug 2024 17:17:27 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Pu, Hui" <Hui.Pu@gehealthcare.com>
Cc: "peter.chen@kernel.org" <peter.chen@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"balbi@ti.com" <balbi@ti.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"jun.li@nxp.com" <jun.li@nxp.com>,
	"Ray, Ian" <ian.ray@gehealthcare.com>
Subject: Re: [PATCH 1/3] usb: chipidea: add USB PHY event
Message-ID: <20240829091727.plsxzsvkevziitfi@hippo>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <PH0PR22MB3884EF3CBE887E4CF59654CFE1942@PH0PR22MB3884.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR22MB3884EF3CBE887E4CF59654CFE1942@PH0PR22MB3884.namprd22.prod.outlook.com>
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e2281d-51d2-4ab4-defc-08dcc80b8ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?khPW/3OKvBjEPKRO6d43j0vz265diwqKx8VCeb1OALFdL5rOCJbRqJ2PlXvx?=
 =?us-ascii?Q?N3eUuVlyGpbSli8f0QGpK+VQlvawc7kXn9BzBiOpaLWg+Q4Z6qI4P4137CbT?=
 =?us-ascii?Q?kGo11D4NNeN0qzsdpELfU9idJUt7hUsjLoS6SrGf/te/0sMaylwoVurC933s?=
 =?us-ascii?Q?YOoyo+neljJ3hm3sAAY3WSo5pKOBihI/6H11F/kZUFokHa5fbu7hNP/lORI+?=
 =?us-ascii?Q?E2zPRmE0i1eZlWhyJxdFAvvD0OLXpS+Y29mujwiSsWKGCYPhJ3M4TBLAq0Hp?=
 =?us-ascii?Q?Oo73+EHyjYZwaWWlnT6FeTZ+ky5wdX+cwFHzMs0sD/JCRJpVViE+IV2j+osf?=
 =?us-ascii?Q?8id+Z7J/zWGsHykBILbiVvn/VKoqWXK9Apg12+Dy7+ahSxGS3oPPBgUdx3ji?=
 =?us-ascii?Q?clO2O9dptGw/448T9A+EkkhdtEDo76NSnps/W791CqGVfwx9FQuDB+5qJK/q?=
 =?us-ascii?Q?CKbOTqpiLaX3zvrZ/ycHlehJ6YM2uZw2pKy8OMu3EJAcDfw7fNPlrLbpetSi?=
 =?us-ascii?Q?bSZtteaYYNWZpmcm8/w39yHEtFRDn3bLMYWGYqrDJM/GmOJDyexU0oYRyaTI?=
 =?us-ascii?Q?p+q05UOxU7+AJp8l6auBR/1BWBB+/LSPxVpnKNOAAg5frSUqrYu50yMNoXuv?=
 =?us-ascii?Q?1z82oPiqGFGIE5OugtV3MkM3eXdX2tXPr5jsaOFC0jGW/26Xzth4/x9ZZ+RR?=
 =?us-ascii?Q?dxEOeIkuH9zNCc/GYPXQXJtgrS+HT5gHLAZ1Ss6qPx8wS16NBX51a9W2G94g?=
 =?us-ascii?Q?PhwoMfUPeCACsd+VSwke0QBYiE8ahGweoUqGA354j4qLMuhJ8I/KSU2z7z9g?=
 =?us-ascii?Q?ZnXXRloaL7VYrcX5c+gTGwj7lL1fxkM1q0NE7kXfKVq5NaVGNIYMPWaNA/0f?=
 =?us-ascii?Q?HmMWyQvwhBRGBSfK3N8+s1hXUNnAmys9XgzMKo+S2JrnWPHRKdp3ELm5/PtE?=
 =?us-ascii?Q?avnB8+DxJrrNFEgihiWRvOY1tPQuRfpDQTUOuKf83LguM0T0TCG6cy1lbsWS?=
 =?us-ascii?Q?cGB99ZGm6QzShIYa2CNjsYzHEGUs0uVOtOL4kRdIPfMwVtYVc77XDjMz5Lw0?=
 =?us-ascii?Q?lr8xKOhBDaBg+QKamRSQMDRT/jhpHHyetBbSWtdgWB56vXzDAspQmCh7It6T?=
 =?us-ascii?Q?h8vbz3AEuBtaShG3BUBe+PlQg4Wgdjl5Cd//NZx3KjkpSN4Oxd91SdQIlOr6?=
 =?us-ascii?Q?Y2EOa8xS6Qzn6bxOebEzFHVUOQe2PjiWPlzJFjdorRI2XkNLYV9kS7aXkKcl?=
 =?us-ascii?Q?UQ18/ZA2ElTB/aBsNPeUO9yFxr91PyCjWNrRL3TH7+9PnEVw8bZ/Kg0gBsCv?=
 =?us-ascii?Q?BjjgDS2Czd2eSTY6/xJj8Miif4fRb6577N7UyVhb/EXW6WWJ1dy6Z4g0eW1E?=
 =?us-ascii?Q?/MitX0/vdzB/UgtxqNxjCvC+fd2cK4ZgeHxAVupZ9wa5OMq41A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t+WWmrUMaG6GXJ/qg0jZWNTrkt6NQ/etDXvGgPWpL/rd+X1KD8hQgjO9302U?=
 =?us-ascii?Q?LBElfdh/TVxxvWdveFIGUrDypc+YVpHifSlC+YZiP4aTHPgFcc5Hs5GRJjQD?=
 =?us-ascii?Q?19LjZUuNngEbE6JbrWiKLwga9Ple1nH7lX/HIZVdsmIDLX+4SfH9MKX4d+Ga?=
 =?us-ascii?Q?QgoBCHIleKkQLx3WXY6Ib7m0TjnuDv/oojcumIMpHWpacdaTCykw9qiU1+sL?=
 =?us-ascii?Q?ZxNXGVbuOP18jC2da4pXdxmhBTUHEwqD4KstqjxtOWkh/IUSJV2Lq885ooVI?=
 =?us-ascii?Q?wZXUM2rB0qmGu1MnzbVQiKyGUFF1YH3lUpC/M/bT1zfnPDEeyT+b3HbNmKEL?=
 =?us-ascii?Q?Yt3dW4NSkAjlbvSu4/WB8/ooDJ4VXWDWtq15+bgtyCdArDHV0Pb5UC2ZsjSY?=
 =?us-ascii?Q?g98KjAa1wxU8fJTvsilzvY708zIN7inAZ4x5MYMav2DkuPLD5eZ7+JhP52zZ?=
 =?us-ascii?Q?R1QQLP/pO2l0behpHcPJGYvwF7GhtQJxebi9qct2jD/TZ/ggwNoLQmH4m9Ti?=
 =?us-ascii?Q?O7IAybwmbuunmarCGmRpAY4lu4mA5lC2N9gobOr9lG8RGJ77N2cZM4oHHlCg?=
 =?us-ascii?Q?/v1SGB+FiFlyJUEUSoo2g8KLXZsQ1zWSss4Pno5w693pv1A+oNri3Yw0obKT?=
 =?us-ascii?Q?pPE63iIXncK9yX+lcVzol6b0/smy/tS8jYSFVy4ggvVPRwGBPOOMf/ynVoUU?=
 =?us-ascii?Q?oCv1vhlMI3P4KrTxsQ7VRz/NOu7lyWGFl1coUMDAoZ9HCFPBqPwMpsxESoZV?=
 =?us-ascii?Q?DiJiDHbq/2O2puelEsBwz0576WVxrowUcZgEIl2qZQuOo6rlqVQAemtD2sAN?=
 =?us-ascii?Q?sNgs7hIexmR37P5/ijuVhDzkhPum7ZtK861u3J8Voyncx2O0q5PHddAQzHNb?=
 =?us-ascii?Q?QHChLzJTFsc/lCj6oz7kSCIX1Mq7Gx7VpyrW7rNmuxN+p3/Tli2Rr8C53nI7?=
 =?us-ascii?Q?GkLxS08w6JDZnBZA+n9TsRGaVz/eKHLVlv4f9BxwgF9CfRNsHzCCfl7m9IQ6?=
 =?us-ascii?Q?9qkqe6PokCzG2vX0csF3mS8fRjflAXWqEKOhkoKk8d+lM8VLVIZP3feec82L?=
 =?us-ascii?Q?YC2uBpTHq/swtA7pmV5AjozCLpUvD80nOVUsRsCZ+6Se9vRIyP15Ql68uF/F?=
 =?us-ascii?Q?GB1X5wMDnU/KziVE8MVMQ459lZEZEdECJS04e/Cge+epgW0PO7w5DS78wz2l?=
 =?us-ascii?Q?J8+bd/da1j3RN5PIZEBoJ9szlMd1W2/nykLblKySgeA03cLP8yMGsT6NKH/q?=
 =?us-ascii?Q?D81F8BFck96QW0o3IPvydZlVTKKNQjnOaeP4kBvftQ8G+IfThXEVwUanTtRt?=
 =?us-ascii?Q?2w/pcKos/k2nvkDOU4jCMU7DEOoZzKKEMgMeSTQC+iyfYMeNFWWHcY/J7zrN?=
 =?us-ascii?Q?cAlcO0G462WVSm9/pOMrnhSm7uZJcv2EwSotn2M0jVM4STj9IdZr735KPp6c?=
 =?us-ascii?Q?cZMQNRdalLJlLiMfSCBbknear4yQU9adYvmNeIi8PT8x/m6SGMNMnlenaY/L?=
 =?us-ascii?Q?b/EoRFC+EOu/92rni5DbSRdKKF+2TGXJQG7Df9FnCQP94ux68gFBjZaFKV+n?=
 =?us-ascii?Q?t1Fp/W07RMGHmhBVfo1E427TkszE1U37lYdtg+fc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e2281d-51d2-4ab4-defc-08dcc80b8ec3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:18:34.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDnVBsZ1p0o7CJ3ibvEpyENez1E4teiMu4yaNXtoWKOps1nuwB0EDHOwPYWY5ekSLulAmlLe7Z54K3mLnFq79A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331

Hi Paul,

On Tue, Aug 27, 2024 at 06:10:09AM +0000, Pu, Hui wrote:
> > Add USB PHY event for below situation:
> > - usb role changed
> > - vbus connect
> > - vbus disconnect
> > - gadget driver is enumerated
> > 
> > USB PHY driver can get the last event after above situation occurs and deal with
> > different situations.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
> > drivers/usb/chipidea/udc.c | 10 ++++++++++
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h index
> > f210b7489fd5..d262b9df7b3d 100644
> > --- a/drivers/usb/chipidea/ci.h
> > +++ b/drivers/usb/chipidea/ci.h
> > @@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc *ci, enum
> > ci_role role)
> >  		return -ENXIO;
> > 
> >  	ret = ci->roles[role]->start(ci);
> > -	if (!ret)
> > -		ci->role = role;
> > +	if (ret)
> > +		return ret;
> > +
> > +	ci->role = role;
> > +
> > +	if (ci->usb_phy) {
> > +		if (role == CI_ROLE_HOST)
> > +			usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
> > +		else
> > +			/* in device mode but vbus is invalid*/
> > +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> > +	}
> > +
> >  	return ret;
> >  }
> > 
> > @@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
> >  	ci->role = CI_ROLE_END;
> > 
> >  	ci->roles[role]->stop(ci);
> > +
> > +	if (ci->usb_phy)
> > +		usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> >  }
> > 
> >  static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci) diff --git
> > a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c index
> > 54c09245ad05..d58355427eeb 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct usb_gadget
> > *_gadget, int is_active)
> >  		ret = ci->platdata->notify_event(ci,
> >  				CI_HDRC_CONTROLLER_VBUS_EVENT);
> > 
> > +	if (ci->usb_phy) {
> > +		if (is_active)
> > +			usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
> > +		else
> > +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> > +	}
> > +
> >  	if (ci->driver)
> >  		ci_hdrc_gadget_connect(_gadget, is_active);
> > 
> > @@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> >  		if (USBi_PCI & intr) {
> >  			ci->gadget.speed = hw_port_is_high_speed(ci) ?
> >  				USB_SPEED_HIGH : USB_SPEED_FULL;
> > +			if (ci->usb_phy)
> > +				usb_phy_set_event(ci->usb_phy,
> > +					USB_EVENT_ENUMERATED);
> >  			if (ci->suspended) {
> >  				if (ci->driver->resume) {
> >  					spin_unlock(&ci->lock);
> > --
> > 2.34.1
> 
> 
> Hi guys,
> 
> I'm not sure if I'm replying correctly, please correct me if any mistake.
> (I didn't find the cover letter in this thread.)
> 
> This patchset has been merged on master branch, but only the 2/3 patch on linux-5.15.y and linux-6.1.y.
> So, on 5.15.y and 6.1.y, there's a degradation on the i.MX6 devices that the usb hub cannot work well.

Thanks for reporting this. 
Could the usb hub work well if you apply patch 1 and patch 3 to your kernel?

Thanks,
Xu Yang

> 
> - Paul

