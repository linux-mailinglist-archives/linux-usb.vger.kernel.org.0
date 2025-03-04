Return-Path: <linux-usb+bounces-21336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1999A4DF96
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 14:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B7E1897C23
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADFB2046A7;
	Tue,  4 Mar 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L1OEAW9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E71F5845;
	Tue,  4 Mar 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095959; cv=fail; b=oIgUe85j+KhKVh0d4+9Rxe9WuGdrpsPs0g30/eRMe025RYL4woyYzbMaEqOKaKAKnPXUFY/JI+su/EZjUdRdJmztdqFqXa8oEuqzUSZsfYXTB6HeX/YXwY4RZ9s9gOhi8Q8cejOGuiRKvydX9vmLrCwN7WzjAUrfVZ9CU7SyoXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095959; c=relaxed/simple;
	bh=jlYd9sgsVhXje5esDv+WaoA71xEWt1XZwx0BY+YOi+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LRyrbdHRUXLEZgLdweP53MnRhC56a/lU7z+6DkIzmSD31wzoFcrK6fEoO06PyS1j6Su5skQWA2QkklzGfson36LqcKhc4bbUvB+k2gxfF4O+syLISBgJv1WFUPIEeBy7jZE8+WiSvS/pLgW/UOhB+qEhPkg0wDa2TWzlqQknyV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L1OEAW9i; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcGBAMVE7OjVIYksWoE/dUfDFksEc3HUeh0Pp9qmFnPkWE3VspZyA+CnZ/I5iBZ+QsRlLUkfOcSlhMT6zgu+zeAfF9MEiN3swaOIJdSTfDh9uwzHvz0Qxp3jPGXzre1w9Uuh7ngZCQflseBLUos6SzQ7xmMXJqjfOGchKub7NRyYYiLR9U1UlhuxeKjuUhC0VYvIUJ3aGIWQ1TAEaKnT3crukhLfz4pr0gH22849Y1u7N6v6CTLb02wNbk9TBe3al7+q2pWQq9Bp4zYr5Rzm/m9338MiGaR3dYonJPnhYZ7iU2/Axebqo9Q0M1EUj/OdxfV0VrtNWnnZjaxlVkdxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6f1kIsXQo0UDulFkCe0NQecJEtM3EN4Fgi6foFDvhE=;
 b=w0O1lhSFlUJ2RUZo7q5AUIzrtZ4jy2JTJ83bqfHrIuoM/3s0wbF2NMBeXWvsJHO/jedvAB7113menjmd+h4tQ6Tp3PDS0uiddu0ItGUYH2Z2MFC/sLDTEU9pGj7xVbobJDNnJ5QDQw+KssGTA7B9lr5cuVI3cWJffKzxJnZbmRDj+9jNhJSaOgNuO2n93w/1QIFcC1PT8pXxuR6OH77/qcBv5Ga93SUIYq2q3K8yYDxUT3k0s6MIIslmYJo6Goobaoth4gunxjnXFgOQ6ZDg4H93y/4M8UH9Up7/yTTDwlTAJlSYf4VLv2ZyNGdKyJkqbbkvPtZJW6Zhco8OUYbYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6f1kIsXQo0UDulFkCe0NQecJEtM3EN4Fgi6foFDvhE=;
 b=L1OEAW9iKHudhvziG29NVW5Qx2NfGGeqG2jyfcpmZhRLNC2inmo+ilbOXC2B5hQJ7owERYy54IvT/Yy5SmVLbqdoKa7trXf/NqoRsJmvr7ga2OXKf2PPxsNMnxMN8gTcYVZbrA85OBektt2FARbU5SsM0UtUfuzJxe0iQeNfSoHmmT3NwvE+mYx3lmlJqS0k65j8S3JvlD2pHZBOvthJwkGIwkiXTWvTl7w6nqW6SwyUFqBekCYvR+BPFXkMWBEX1RAz8ad82Tow1EiCt/RQCoPXqco+opbUX1HNfmBZaqpbMMEhNNGlu8QXsnEgSatThkMYy1TNuSuPjr1877ZyDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6973.eurprd04.prod.outlook.com (2603:10a6:803:13d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 13:45:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:45:52 +0000
Date: Tue, 4 Mar 2025 21:42:21 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250304134221.s7wlfauibd2gc5zo@hippo>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
 <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a52690d-9033-43c5-19c8-08dd5b22e150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LnOeY5UCJJCZE+mQqH358RfGMHMH2PiR/v8KmefXyPlw0FB/Vd5BNgwHmoNm?=
 =?us-ascii?Q?U6H8kR/xhKjhTzUJtLMRIOULRh/WwBvaKkVFErlrNqjFJfLKtETTM4LJW963?=
 =?us-ascii?Q?Wxpk7Sgw9P/6ZH6DnRAxij/DTBJZNnafIAd2iQpwOk6P5UXGAAUVgtLYf9Hy?=
 =?us-ascii?Q?ySStv2+NvHEb9mGECd2z4fZpxZMUm7InZwFsDiTe6UJshvfwdneqzbpPlByS?=
 =?us-ascii?Q?Yd33QC4It0O7OzrZWPfnguksatSVLBkNhbGrG78WkrYBusr+aR+HwWF8PBAX?=
 =?us-ascii?Q?ry3r2WsLJAJPBhRZv4lbvn8udC7w44tsOBQk3u75jOkOcQK1eQ4NJXSPY2H5?=
 =?us-ascii?Q?0lBgdyVsyxZlxU0XoFVYWKiiaI/8igmM4tJ/di1yfdoMkMOTb/zg/2VIX5K1?=
 =?us-ascii?Q?Vwn+MUVnUo+jhsQmXOVQFWxDOKxskIbh22KN2aOD58qUeHAAM3UEQqbgLoge?=
 =?us-ascii?Q?bO96wEC2mkUO7KcdAeONWEcgfRmTSKueosd2eMQtDilpSMext4xLttLQphWZ?=
 =?us-ascii?Q?anbkO+lBZ6du1bvdY/HI5sMXeBch0tS9S/H9gdR3r4rMWlNq8epmvhfOZ4b+?=
 =?us-ascii?Q?mDs4mZdM0ZtC9OSxQhIwsnM3Y2NuR60Ihs69iTUmgJaLOnf7G2sxo8YgwTh8?=
 =?us-ascii?Q?ai1mCoZbKJpgqSyKNpvKpJqsIR1FnienCW8mn3waeTJfZaUnb31CRJoXZvlh?=
 =?us-ascii?Q?OejvX4KxDzs8eXviNXQBIpTGuPIUUKWz1sraDpx7WjvLRothqj1r8JjSjqE3?=
 =?us-ascii?Q?NR1NcH7p/m+II9gkdzd1KAiSplwY82bYDEH/9pLNWVVj1R/u5lru1qh6oZ5O?=
 =?us-ascii?Q?A+UuqNbDubvEhvAnl+0uMwO1vca5CiYxCvXBGWP2ubs6FEibpZpqiJS6RN8e?=
 =?us-ascii?Q?lbA2XzxMYsHUIVVF+U7Qti+yono6ab98Evn5G+3argwyZimvauCA8ALZnjyN?=
 =?us-ascii?Q?usUD4N92BGuHDydJJPIozqcziegYrjSCd0tfSBovySv9rPlT1hvpVVGgCJOc?=
 =?us-ascii?Q?o3Ad89XEwipUFYLyi6X2tcMURe1qchVtmaHiPtSimPZ+UjHBwcuBdJmBMGt4?=
 =?us-ascii?Q?B7acvIRc9Td90yyRPXyexZoLlaWAkKRlySA0ENm+5kznJm2FDepzkgSgpc40?=
 =?us-ascii?Q?tLAqcXoPM0Z0EIvIO3r2+slVMDP1E0h2eQbq5/RUBXSJmQWhb9yyVOW96LwA?=
 =?us-ascii?Q?QjUp/uirOoNuw8+n+ig/equbfQpkpMdq7TVkTvEFjVX1X0Ee5blBz3BJr369?=
 =?us-ascii?Q?g7eZYCPCMKAbDzChDPGTId4ZE1ppIYSSLtYjrqBdK+5oLXh2LrmKAUJpRj4s?=
 =?us-ascii?Q?dEnqmrhrKK3rZxQWY+acV1iK6pbt/K+lgaShvtFRW0FOmol23ZObQaAALBXW?=
 =?us-ascii?Q?e7mWXhlrWUgP9EvTIwQsYRokRqP93+TRAhn14WPMjG6lqBTHmWnxhVRvQmIO?=
 =?us-ascii?Q?ARalOynt6RMKZvNYU4VlDjv0yX6b9but?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQUoVOR2pfYTAXKDEpVbqTCsfzwOqAoThOosT3/P3jpM36M5pGnvlKmVn4mz?=
 =?us-ascii?Q?/y2f5LbCcAQ4ILJi0Dw5gzCIy5lBgsrXPoiZ5VssSp+FRPivujmczcVLNJx3?=
 =?us-ascii?Q?z9bTmGIharhCO/ZTsWNb4RpMam15nfItCRfbZmTOHRZzGqwecGOOTK2l/Qwn?=
 =?us-ascii?Q?kKU5+KSR1eBZozqSt2k3fwew+rJAH8dvxLlnuIbcwyLPF9JJAJTdmSwE09dU?=
 =?us-ascii?Q?helXtk6Q8ifMAiGTl3CBmJwY+idxZWZqSu8bfqvnmdVQMCBmcSHk71ICW3pG?=
 =?us-ascii?Q?nohyHyjUruESa27HG8cXC84HWTULz19+CRH0mh7AHixsRw54BAJ7PVxeAmk+?=
 =?us-ascii?Q?/sCEJBCjvNNXBTslqTCd5a+EDxdytN7KBM5LafP6vEqQViMAeGJlK0utNz1i?=
 =?us-ascii?Q?HLINY3aeI1YWfUQleF6HvHxMhRBzVfB0ROyXwCKh54Pax5ynM28IJivxCI9q?=
 =?us-ascii?Q?8WIjNS+k9XQYRghMr2e2OAKSclw/P+q3UTf9wra9CUCQ3WauSd7wb/NXLN5h?=
 =?us-ascii?Q?q8HVjofFEd/x/gPDahUgisYu+QYgK9hHS8YCvF4W8jw1zbBqYwMJjGAIYGzy?=
 =?us-ascii?Q?6v3fBMUxshubX8KvtukgG8d0F7zXJHqtTOIitgfIOpv5gWtILykZ5tkQyLmN?=
 =?us-ascii?Q?rzr+/ALR9bqYK1b2IsgVXmpHEC5G6FQCfHTuFwOfeMQz9g26k6ZN/Tn6oftm?=
 =?us-ascii?Q?ln/FHkG+x3KGjtrvt7vR+x25zvMVTLFqtlZv6qaNk2iVzb8KAgolm/gBoU3r?=
 =?us-ascii?Q?eJqaBx8fj6S3/LlsvOaW/A04cO81kmeALgBui2kTquCwcrKPcBiZAU8pXqiy?=
 =?us-ascii?Q?htkKtKxQJApS3yzi12kkxyHTqAErnhqeTgg3JigDbEjsy44I+/4NhkQJyIJ8?=
 =?us-ascii?Q?7P4g19dj9FfIBVbE3MS76M8fpKZ4UsYZDHNNkg+Tri3KUEs3mJto/Fdludss?=
 =?us-ascii?Q?rqW4N1SMbutQ28xnXtlnP7AuvPYdwko0TbdB9YJJSuIfMI4+Og3eWVWhkLfA?=
 =?us-ascii?Q?nErGjCQIdJivkCHSXeBfrJhiKR1c1mfIHktjCRBLt92UcoE4dnnAKCLNyjOz?=
 =?us-ascii?Q?FkdXMndZl7g0Bf0Wy59p72q33lxDJw1/JQHZEfxKChXdBJ/NOSlgumTmMZ7W?=
 =?us-ascii?Q?MIEajJbA84CUU7WJhIl8GiQoSC59tuUasdi5kAZXYcCorLRUiEEQx9Ak+Xih?=
 =?us-ascii?Q?Lln8tfOX1aO2mHydOyTnjPuylqwyrL6oZKdzqdOkXf2x37rkhFEheqUuX1DJ?=
 =?us-ascii?Q?IAPlPCJhdSPG0rkxYpakr9bqs9w5ZDmQMTHoWVt+ztwsNbVjaxNpIGH3WKxL?=
 =?us-ascii?Q?RP5nSWEY1xBF01kQaVQkG93UNGWfd1xzGgeNuuLU/mS5SlDxSzV9F2mKFsPL?=
 =?us-ascii?Q?2PWU6edVPO1lQdGiHiS9YsApzWtLooKNmE3hXUEuH7TRfpDqIcdtomQDkWJf?=
 =?us-ascii?Q?yqkPAa2ET/qB3n/kg/vRCmQ+Tl/lDYQi25S6xHBVaUHLcoc9Fsxz/PQrRhzp?=
 =?us-ascii?Q?EUqcNFBqZc/gXaGzbN5nmJ8w5oq59yV3Yp2dDUbkqlXxtg0BbFnKkHue+b4X?=
 =?us-ascii?Q?tDw4+jq0esN/x2NLlQK9X3M+5Q7+DbihoZDBmaK1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a52690d-9033-43c5-19c8-08dd5b22e150
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:45:52.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obzF4+cN/6TMICvWhARCWvm670ATS/mupJaq2i8pGtTY7beHW0G2VZ4N5a1CXUi3vyfO9cs1e1p62oZd6V2bxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6973

On Mon, Mar 03, 2025 at 12:13:34PM -0500, Frank Li wrote:
> On Mon, Mar 03, 2025 at 11:33:41AM +0800, Xu Yang wrote:
> > In previous imx platform, normal USB controller interrupt and wakeup
> > interrupt are bound to one irq line. However, it changes on latest
> > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > This will add wakeup interrupt handling for i.MX95 to support various
> > wakeup events.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> > Changes in v4:
> >  - warning if no irq provided for imx95
> > Changes in v3:
> >  - include <linux/irq.h> to fix possible build issue
> > Changes in v2:
> >  - rename irq to wakeup_irq
> >  - disable irq by default
> >  - enable irq when suspend, disable irq when resume
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 1a7fc638213e..2baae9e6e673 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/module.h>
> > +#include <linux/irq.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
> >  	struct clk *clk;
> >  	struct clk *clk_wakeup;
> >  	struct imx_usbmisc_data *usbmisc_data;
> > +	int wakeup_irq;
> >  	bool supports_runtime_pm;
> >  	bool override_phy_control;
> >  	bool in_lpm;
> > @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> >  	return ret;
> >  }
> >
> > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > +{
> > +	struct ci_hdrc_imx_data *imx_data = data;
> > +
> > +	disable_irq_nosync(irq);
> > +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  {
> >  	struct ci_hdrc_imx_data *data;
> > @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> >  		data->supports_runtime_pm = true;
> >
> > +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> > +	if (data->wakeup_irq > 0) {
> > +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> > +						NULL, ci_wakeup_irq_handler,
> > +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > +						pdata.name, data);
> > +		if (ret)
> > +			goto err_clk;
> > +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> > +		dev_warn(dev, "wakeup irq is missing\n");
> > +	}
> > +
> 
> Suggest add imx95_usb_data, and new flags, like have_wakeup_irq.
> 
> 	if (imx_platform_flag->have_wakeup_irq) {
> 		...
> 		ret = devm_request_threaded_irq();
> 		if (ret) {
> 			dev_warning(...);
> 			goto err_clk;
> 		}
> 	}

Thanks for your suggestion. I might have different understanding about
it. I prefer to not add flag here. Given the following points:
(1) the wakeup irq is optional, the USB controller can still functional
well if properly set. (2) I may need add imx_usb_data for each new Soc,
however, it seems like unnecessary. 

> 
> >  	ret = imx_usbmisc_init(data->usbmisc_data);
> >  	if (ret) {
> >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
> >  	}
> >
> >  	imx_disable_unprepare_clks(dev);
> > +	enable_irq(data->wakeup_irq);
> 
> Suggest check data->wakeup_irq and other places.
> 
> 	if (data->wakeup_irq > 0)
> 		enable_irq(data->wakeup_irq);
> 
> And you should check enable_irq()'s return value also.

I just find dedicated wakeirq mechanism (drivers/base/power/wakeirq.c)
basically fit my needs. I'm going to switch to use wakeirq. Then I'll
needn't to do such thing manually.

Thanks,
Xu Yang

> 
> Frank
> 
> >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> >  		cpu_latency_qos_remove_request(&data->pm_qos_req);
> >
> > @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
> >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> >  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
> >
> > +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> > +		disable_irq_nosync(data->wakeup_irq);
> > +
> >  	ret = imx_prepare_enable_clks(dev);
> >  	if (ret)
> >  		return ret;
> > @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> >  		return ret;
> >
> >  	pinctrl_pm_select_sleep_state(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		enable_irq_wake(data->wakeup_irq);
> > +
> >  	return ret;
> >  }
> >
> > @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> >  	int ret;
> >
> > +	if (device_may_wakeup(dev))
> > +		disable_irq_wake(data->wakeup_irq);
> > +
> >  	pinctrl_pm_select_default_state(dev);
> >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> >  	if (!ret && data->supports_runtime_pm) {
> > --
> > 2.34.1
> >

