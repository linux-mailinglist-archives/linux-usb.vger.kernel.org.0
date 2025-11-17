Return-Path: <linux-usb+bounces-30545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACBC62883
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 07:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BFE3B3D5C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 06:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79DF31576D;
	Mon, 17 Nov 2025 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ML7+HSuX"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677531B4257;
	Mon, 17 Nov 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361387; cv=fail; b=CQX/sFMayPy7mH7ZbyZCKfKs/5TUJKB7f08nO91xBY8Ei4C8EmtsL7jw0m6yF4H5NMYuvk1pSX/5tjIcjHVRc9Pkg5newHiiLpmrJPTn7ATmqzUjZyMm2Y02scprciv6SuvBcC42UsLicwCM0SlMxvBqWbghhcSAvhaXCkYapK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361387; c=relaxed/simple;
	bh=/VlL+lVxJI2oGChTGBAXqM6DRZW9BgLpvLORxxB56A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dscGkYKJUbn7J7wPGYRqVce9KOpL968gLnm0ofLepGMhRoOQrN+fnT9/vzMlXJAJgeGZit5XrYWlEVNpJMmsDsNTUeNcnm/3OnTDqFbIPcV6ibNrrZDXA9AIZpM3RMxlFKO48FMPlUT2mxmUm7kz4vJP201PQkESUnXsLrrsZsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ML7+HSuX; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuMAwVRoERuWhYpUz8eFFTKfWrpw3UfF6SZXFVPVUo7LEcxk0hAAQuGflSBMzQ4LUq4RBdxXlO81CBg/NKB72pzsqi9ExfDPDkz4QDYABWqXWSQIdL1xFSekKTBbU4Z1PieQf9WRaYvBwUiPUjaDq7t0TfTbZCTrWE/gc9FzaiAXJ5rEcI5NNLDEodxwYQE3J6JexLaZSjpZQzzuukR0VyCk+fuC0rg3Cawv3KDvWCgDD/BXJhR/mCxy3x/fg/yfJRIKMs+n4whHzKemhhafyR3f4SEwRxXTpxILjUcU5HtYSVr4+mtejtXVhg7hxyFNuwYKlxyf9HUXzmrpEtEULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSV5bZDLt8FUT61N2mMJWJ6ZazyojnFb8FlMmbb//Rc=;
 b=UPecHkhbAs7AzqBxqylixXcEDkStUwTZySxrkEzNatARB2pQgsS3E7mTj2IMKGY7fwuFGNWN0tGSYUEwdu/o5kl6WJ9CjoUN/ke7LeL1ErLDTKDICjqWNwZXecZ7WEjEi7xDoctgwDSYYaxLZBaAmLKm3aIOVIpuy+knm/X1qP5Ozu4xyPtKiQ3ri/JmZAdfUjvT0izVsHqn1lGy032v4Z17ohYADrEpP44lK0tw1PeIL2Vy1aCjeRoNSbPZMELnHvYC1hF5fmo4g3NfUPee5jY04XqQDbtGvXYV6g8B+ciD3WVE/1snuqUHqSm5WomHyR9+CBKSzvAKHSHhbpOAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSV5bZDLt8FUT61N2mMJWJ6ZazyojnFb8FlMmbb//Rc=;
 b=ML7+HSuXrwI8bfesmfqYI5U3Zcmw38bTL98OV/5E49cvtY3Soe/kaLMGkOAkIBwf3KY3QQalMOedGOgO/yF6+uSF2roT0WhS4HNj3F/ZCxp0w5Ccg7G+1UmVWUBk61CrNRWVmB8qOWsKKTn7g95dFdAZukpFVH+NF6LAU91o/+pPLNFJdXU7J2DWYzb+5CqDkKG61wsCi6IJ4b1lCV0Bp0Cvra/bqOCapNXZtpda92To392P6wSJHS4YMFs6CHpiUTObG0iDh5pPl+Lmyw/+YV1ad/ee+bai5Jw9IoFyo2LISdQfL4zjb+0lnhN1Kxf5Y0Is9hBX4UIy0T0RVhG4MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 DU7PR04MB11140.eurprd04.prod.outlook.com (2603:10a6:10:5b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:36:22 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 06:36:22 +0000
Date: Mon, 17 Nov 2025 14:29:41 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 1/2] usb: dwc3: drd: extend dwc3_pre_set_role() to extcon
 and otg usecase
Message-ID: <f4oscoeoxen7cfmuhbrsnmnccbmra3gx7tgvm5gjn7gq4egt7x@5lsb44wwlqwi>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251113223739.akelb3tke24gpjpq@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113223739.akelb3tke24gpjpq@synopsys.com>
X-ClientProxiedBy: AM0PR02CA0137.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::34) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|DU7PR04MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bc0a97-cc97-4c93-52d0-08de25a39f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ArOy5wOWE/FWcN0S/oFrGxMcRyshxzvxWc0WCCzpEr/eYvnIJQCQwpbn+hMs?=
 =?us-ascii?Q?DCb7IoPSYfnMRW+9VD/ggCGbjg43FFXPLbNdvqhrcpD9qAoeCCkFhks7Z6o2?=
 =?us-ascii?Q?LHffucqMIMaxn+cXrXwzWufLJDrWnw6BI+R5PuCMNOaXsvq/t0DCrpU9XPpZ?=
 =?us-ascii?Q?wQqUPJSJ8zDkZq5WCyfQOoN67VKiF9AkHnasFi+qiL+JhGlRyqZWfQg3W/83?=
 =?us-ascii?Q?8k1JoAiryx7JaKwnbu6RMmPSNQ2IkM4y0d7vIitFLgznWoKmmcv8umYWmD/S?=
 =?us-ascii?Q?rEctd2IVYpUrwcXl+XA6CukqMTlbYapPhvxUEWe3I+QRIxofKn4m3nDvznL9?=
 =?us-ascii?Q?C1uWQCA9cbLkaE24SFH14XgFk+wIDGbYWNh3VxherXYBPsg8tgS0PMUxIGj8?=
 =?us-ascii?Q?tyBhpL8uWIv0Wml0HHc/GNeCeOw7X25h0MndwBwZwqyCZWUdm7Zt1AVePeuF?=
 =?us-ascii?Q?d5jf8+boG6IgiwDeRbFo1ye49wQI30V68v+rhAyDtgypoWyACvpcSnyo5YRF?=
 =?us-ascii?Q?XAiXGRMnuDCBSBblyhnkAdeSUBEwyfXHhE+xtM13p4xu7RWBQgDpiM+3h2gh?=
 =?us-ascii?Q?l751TJS7jW79WNHVL3HDGDyEN+7nYQetJCLLrfPcSHfznbe5g4t60zYLZyJI?=
 =?us-ascii?Q?miQGPaiTI48Wrry5EbI8DAyQA4jzHobx4SvRlhl5N3/U17epJseuIlKzvXF0?=
 =?us-ascii?Q?V95+ZJbpufvLMBtJjB+DmUZuCPC4SUQAe48+BDwG7rdapIWWNsp8G7I4sLSI?=
 =?us-ascii?Q?ciM8+pSRL76CS1KZyB6E14NC6G/67tO74NTA+Duk+fBPkCFr0GBIGL0n1x0k?=
 =?us-ascii?Q?+HZpv5NrGVtbFjbvm6wJyKV61FywAOLImyf7OP4OLROc9LHE6UK8V/RPT2jb?=
 =?us-ascii?Q?0voM/oY+Rt+o8ND3qWpJaN06uYziwisJSvWFQxxNU3mpC52HIEetze5O/USj?=
 =?us-ascii?Q?KFqNAcEfcPhqMTP8pHEflw80mcxtxpHWQ5jR7ie+CFWN4JwoRtdocgEopdWB?=
 =?us-ascii?Q?nqK5cU6S8i7DZZC0vWKcikmTMZefehSHiKHdbB68lb0GW9ZiMq0j0eXDrUm1?=
 =?us-ascii?Q?UaFjeV/12hbLZde3BCypvpcL90egQC0PeUWJVE9dUfyvBeftUANXeztEfHKe?=
 =?us-ascii?Q?GNTpMpmhDtySf/C7P+ZDQf8iUODS99yuqfXwTRjaX1UXMcUMaqTnfaSnc3uE?=
 =?us-ascii?Q?daEESumZf7N1p66KfU1Ja9x7lIowWqdG0GU/gSTEGkh5+xUDLByUliUfNY8j?=
 =?us-ascii?Q?R3CFFB/Teilohd0KHikGyJI1MiUfsvUer26AiYbKo3/9ViYqlDlzYi0z4hHZ?=
 =?us-ascii?Q?PoN8wa6EOUeNHP7d/lRlmhUL0Bf6vUSYlBdUciY9BF6le1z35r6XJ9UstWBE?=
 =?us-ascii?Q?gm1RfrEEJhMpqxPixt5UifmFMiVTbVOOrBmJ9GyS8kx6lKI5MHKR66gqU0wP?=
 =?us-ascii?Q?bNo8zrxs7JwqthGEUi5yqCDC3yqX1j45AtRSMgPxmOyLv2VTjqgmBe/bsp52?=
 =?us-ascii?Q?73QBLfhIwUja6EP5/59jYPn+Y6QmcQwPBiRI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLgu6dNJRKqvxqq1KOerdizasS6q4lRCWSnNpXTBmJYQUX1dhAebMqEb+9FN?=
 =?us-ascii?Q?L3oMUSa55wlaUwZUqgN15VAI587ZWI7KTPjehtC8CqwnY8seWA6o2ud2Q9Va?=
 =?us-ascii?Q?gUFzemZWrbYXp9zp/XT3UJivJ6tyFolUhxfIbLQWjHJ+jUPqf9u6fvnYJ12F?=
 =?us-ascii?Q?jPk9iQUUdwf+0dmqMP6yg4FrKaN3QJMWPCx2rmsCpKo6wL4tvDZZnw3SwwOn?=
 =?us-ascii?Q?Ww7ihO/hg3peOyOeznJYIjwLD/tic460YUgCHd11lEK2ayX6sJPDA5CJw8Kn?=
 =?us-ascii?Q?ud9EbP4mBNpa1jg0x4beulZZ4mLSAIpk6QnSii6kPwsAl04oM21cpcRAbrdV?=
 =?us-ascii?Q?J0xl9nm1EWHRbnRl/gR68ZaPFbA5M3unFUeJvWAAKd1Uzjvk0W1pfEc2h+SZ?=
 =?us-ascii?Q?Rl9LD1c07PA3cvHdhOVwe6gUCECH05E+XePnalMK+OUQ83aMcNpbXWMQ86NF?=
 =?us-ascii?Q?iTXgyDeHRKIsRz9JTWE5MOpzColyY0dYtuquDufqnX+Q3Im1zk+OmwqR1F2U?=
 =?us-ascii?Q?hIouqaIXNH9rSAMr8CmGR9zG3xsnJAA70qv9YlgkXm6gZClowrOnH8X3wM5i?=
 =?us-ascii?Q?eWYi5pXCZ9EqcB8xMif3itiJdnnDS1k2WmIphqSphlb91vo06hHnxnmZQa/F?=
 =?us-ascii?Q?hzWH8GzGjtZB9HLIF/f+dr59SE9VqjlVuqAVRO2RFWBzQlF9OkrfZ5FS0Ppp?=
 =?us-ascii?Q?P1c/b+LmOzSz0UMVLoEkYlIyNTUvSveoI3FU7y4i7lkOqW/X3MZo1g6aTVhi?=
 =?us-ascii?Q?EVohhnaQQWD5H3ovTEMfj5m7vk+LOgRyAgFNx3sHV+1w+GC3zPWNHdTaCTM0?=
 =?us-ascii?Q?/g5904pZEAiErgQtwEPyouFvBe7R1+7zsrMxghSZZTVM5KhODxvkHYyYGOla?=
 =?us-ascii?Q?YBjS79p8ro1k2tQzb08krMOVxBvYLJ/I2qwHp0sp3rbIlOBrcbvdrJW+suTL?=
 =?us-ascii?Q?MlOAa0eMklwknSAp3uxJMyJFO7IRsCkIvsAiMaA4pZpYRT9abtgojDJPvBSn?=
 =?us-ascii?Q?D0HA2vuFWzzg0688SZlst4gWk/hfFlFmA37P9UBSLJvoVPfacS5QpfIN18SE?=
 =?us-ascii?Q?rIK1v6kYtvF2MGPNIywRtamL0AIh35JlTwpsIDrwBN2KhRMXBO9fH3OCvFEJ?=
 =?us-ascii?Q?xH+jt+bRsOKWXvFts/Nk+fiA388hDXvjAeake0lGSEW3DvRfwpqlVUjzS1E7?=
 =?us-ascii?Q?htwa48lxbK9bfuzKgx/U1TKQ6mvE+GwYSY+OMp4zijoYh6Z83zo0Kilo92sv?=
 =?us-ascii?Q?8Elhw+pMIodjWLyVvlWCbpc/tdtqFB6Saamxc5Zrcbi9CHZWsqNT/+4Uj9TI?=
 =?us-ascii?Q?s+vlwXvO4a1SkgYEf1afkNij6Y+WlaNrP3N9BulAqEJdiOSUMfDFMSlNdJ2U?=
 =?us-ascii?Q?LIeofbDdJtmTiHX8eT9FK0pehqan3waUbqZ2IsXzBo24tU9YQKbGg/A6Rr0r?=
 =?us-ascii?Q?PWZha0c8VEk8MH26p75Z+cHr/YGlX3J4KAlCLy1wFDI5pKia6o7hT/xQvAX2?=
 =?us-ascii?Q?jQ00NstKmGZujvAdpjuH4kvW2J8eEjPzZXQmbpXrlhApDN6NBewc288GtRDT?=
 =?us-ascii?Q?Hm6yb2jJO/ueq0e8jIduRuGgzF5SFU3DhXUjLCw+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bc0a97-cc97-4c93-52d0-08de25a39f9c
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 06:36:22.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIvb/AuG1RQ/S7r6WvVKNBB2Ccv6UFAkgiBmZsgr1EEG2738Aqxfk3RFEXp8WFqu0LA7Inunm8pOLGNOxVXCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11140

On Thu, Nov 13, 2025 at 10:37:40PM +0000, Thinh Nguyen wrote:
> On Wed, Nov 05, 2025, Xu Yang wrote:
> > Extend dwc3_pre_set_role() to extcon and otg usecase, so that the glue
> > driver can do proper action in case of role changes.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/drd.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> > index 589bbeb27454..031cfd12300a 100644
> > --- a/drivers/usb/dwc3/drd.c
> > +++ b/drivers/usb/dwc3/drd.c
> > @@ -381,6 +381,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
> >  		dwc3_otgregs_init(dwc);
> >  		dwc3_otg_host_init(dwc);
> >  		spin_unlock_irqrestore(&dwc->lock, flags);
> > +		dwc3_pre_set_role(dwc, USB_ROLE_HOST);
> >  		ret = dwc3_host_init(dwc);
> >  		if (ret) {
> >  			dev_err(dwc->dev, "failed to initialize host\n");
> > @@ -406,6 +407,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
> >  			otg_set_vbus(dwc->usb2_phy->otg, false);
> >  		if (dwc->usb2_generic_phy[0])
> >  			phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
> > +		dwc3_pre_set_role(dwc, USB_ROLE_DEVICE);
> >  		ret = dwc3_gadget_init(dwc);
> >  		if (ret)
> >  			dev_err(dwc->dev, "failed to initialize peripheral\n");
> > @@ -433,10 +435,12 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
> >  			     unsigned long event, void *ptr)
> >  {
> >  	struct dwc3 *dwc = container_of(nb, struct dwc3, edev_nb);
> > +	u32 mode = event ? DWC3_GCTL_PRTCAP_HOST : DWC3_GCTL_PRTCAP_DEVICE;
> > +	enum usb_role role = mode == DWC3_GCTL_PRTCAP_HOST ?
> > +				     USB_ROLE_HOST : USB_ROLE_DEVICE;
> >  
> > -	dwc3_set_mode(dwc, event ?
> > -		      DWC3_GCTL_PRTCAP_HOST :
> > -		      DWC3_GCTL_PRTCAP_DEVICE);
> > +	dwc3_pre_set_role(dwc, role);
> > +	dwc3_set_mode(dwc, mode);
> >  
> >  	return NOTIFY_DONE;
> >  }
> > -- 
> > 2.34.1
> > 
> 
> I don't like how the ternary operator is used here and how we've done it
> previously, especially when we're treating the event as if it's a
> boolean.
> 
> Regardless, it's a minor nit.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

OK, Will avoid such expression in the future.

Thanks,
Xu Yang

> 
> BR,
> Thinh

