Return-Path: <linux-usb+bounces-36407-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIe5HSo06Gk6GwIAu9opvQ
	(envelope-from <linux-usb+bounces-36407-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:36:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6A4417D8
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5CE3055EA2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 02:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FCD36E473;
	Wed, 22 Apr 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SxLAhONE"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0738B36167E;
	Wed, 22 Apr 2026 02:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776825009; cv=fail; b=UpnWRX0g2Xu4nGMxNmN0dNir2h0a2glhMVW+dsg+zkv3nnujtmBp49YIB7LmL+t4ExEDEuYWXdio7uW9yehcl/M8c9mt2FDIeAUvaVYbMffrCGV4rTaq+e1wnn26MmxBcz8a0XkMLJLMmFGyrmD6AleSChtYgojcq3zwYa2g0s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776825009; c=relaxed/simple;
	bh=Ac2/Lh7oKlytFYhGUDk7MXRJALKnKR7DpM4A4+gxw+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q0TLrDnVGwQdEqZ1vV7fZdTraiTimL8fbq7jgtoq2nFPLpO2EJA4QQl2bB6qrNQMLKizAEu8a0maGH18lr1xhGqbRestwZKAO8yqBhr+QoNMpXJoiwfYPsKH2tkM2yOXN6v4/aTuQQm4m6oMnAEkAt5PSz3JaDGeDpa04IcNkYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SxLAhONE; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmxp+Q4xnCsfc4RPWDBKsR9oGLl8YOABR5Szzumuz5PSqPIe6s47cjaIjEedrrQ/Ju5C0H0AW13zLu4SBtbyjvrSv1lAps1jix/aTntV3sDU01zhNzA6neGGf4WvBAuI2JBTB/RSYCPkMriHIEE3PynhG3SwiIEri88gig9mg9WI7YzoF+0rgRlqgBeuua82zjw6H+PIPjJZZR1KZkakZ01ETiDSRb4dMNU3JzYlVsyzKfhgH5eQlTFTNN25lalQVWZ54A3yJaBvHtuTht5o3Vlfuph6pKQUO7mjhhrRo8SFhEtwT1k0U3CdqT8Upkcvm0uzCV5h6YROcCZhcio8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgpM79U2BzpzVA8aZWaa3KBxiO/UrmFYx6aoUmp/vJ8=;
 b=sY+KgMb+QpjXXHoAvQlYXjFFiwc3RYr9U50ftWyCUqmWoUwvxHn2JlZElogAsAMHo01jv8yV6v98LZVzhQiWIBoduHf40d9nzHhJjZHh4K9SsGxoBy4jWdDL8/mP0be79A+GMyj5ATv5cgZkPm0pYtgXY+ZNQfVdCny3XzDckIht5z9zKTgrFEOX4p6AQOpHIezQJkbwl+rHOL9lg2VXit5m2iQPOD4EwsV1nUJU1W5SXftqKXX0Ed+QzS4lLMGHJ2K3bmz0kulROHP/lK+O9U6aScrCe5HL8YogWfgOGbEMwsKZ2m9a36ba7TzdV7y1oqECEKeBtaTSmBQQrk8WLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgpM79U2BzpzVA8aZWaa3KBxiO/UrmFYx6aoUmp/vJ8=;
 b=SxLAhONEolNtLt08CWZuLytzIIp/Z6CmUJ2otjpm9ihKHcOcnywTD8YaaN0DgFIKYpBJVKWTk5e2FbDggcAg1pWVGyZsx9McD5CDaiB9yWkP7OO6rsngHW+yDXdvCM27qVReuT+cbiH0Db1et9Ap/LHhdfg3Z8P+RAxBgvHqi+ze7Pk9rdax1EnfSFgWdGCUPi7nfLCikoHHtJKGSFSQCNZI5cbWVCMMS7QIqrNpKVmDHxhpDhcxR6RRCzCkjVu8sorFJEGGC0AZDQInE1NzXVIJV6TuXum2qB5848mAMuz4DAAD1/NJAfZGPS3XbN1q0lLq2XU34fH5CW8d3W+h3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:30:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:30:00 +0000
Date: Tue, 21 Apr 2026 22:29:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/3] usb: chipidea: core: convert ci_role_switch to local
 variable
Message-ID: <aegyltY3LiX7YU0T@lizhi-Precision-Tower-5810>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
 <20260421082436.1264442-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA9PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:806:27::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f15ea22-adc9-4c02-a482-08dea0170cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BVBQQ5y63g9O7ErdSkOHhAhAJPDUn3zPNf8GmT0KDXQTL8vwSOMXUuGzdMaHmpDuPla+fFPHIBGgBhRBJAafJGX+YRX4/mvIIkoYPUuN50FvbdHsjbzDRbfvvv5LkLx8qxxv0wDqiNFdHoafKPrD6GT9e8yVcvowOu+DC0uV0e0Tdlekb/QpRC6/qlWei1YPBsppXff3D45vqczTasX4Gu65rzXgbQ9dCYIW8UO0lyBa2RnZn70UMJ5QGmkG3NGXMdmm7b8qfTHqC3PAGFfqitZa7Ak+Pn7mscnrSJFjSt2vMwxbud0z3r2v+XV+YTEjd0uvPGvA6SvG8Y28XnxYGJcfEpNPt2V1kWDyZAxM761KtghrTntWBHhV+XGQkOibcmuvArGRbaSPvonFtWJeOQR07iT6j00VyuDo+sWTMb4pp8XK0C9aFC4PccOBgqOeN/y4xIXi+vTCtjESvI0uB1EXQ3XzSo9G5uMoVIUWeRshVSxMJGOBkECVhQIslxc+zCi8Oc61JFUj7PSsduXjRkEpSVbuS7AXvLubICKAzN5PUXn9Dy6QQmTBHru1PLBD4eImk25iQ6Ca3aayv2GRSGs+m8hHZlCxGg2Epax79OH0ouQq3Et+JTjCMjJ0Bmrsbz/oBCq+AtiQij9FCi0OzTNrGHBqxgawRJ8HqqHM6I7oPPRyczRKw1LnQheu0HXiANbWPWG+ungSa5tbobnaw6i4MTADo5z5louMC+HgrNn+XBFKTddxmmPs1I9qUn4FEIhfR2f39NtVPoOnlM+ahCOwzXD5bGLZLScxZ37RJP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h+F19K+Xs+rnvJ2VnIsYzMinPF1avbEEJSoSDgtUSCYLQHUazAYZOM8u8Ei8?=
 =?us-ascii?Q?u5cZM9dV5y2uR/wxLhWBp4Kdi4oxdJ0KatqVyRRhtcB2JuH1N5qcyEbEwEOv?=
 =?us-ascii?Q?bzDpX7QlHqrmr1m80jhkaUwHd5wU5kgMkn3uoCi446hOnOF9PIGGJ8YUEgRi?=
 =?us-ascii?Q?u6NmTO55pQNHg0t1XlgXoHKe4M40Nq+XCJnbn+0ol6Me1Jr7neu5M2gdgloQ?=
 =?us-ascii?Q?azbnNzoZSafgnciXuFSk1L2IzQefGC3zKmEAkbzLBTD5UX/39woudsWuBfos?=
 =?us-ascii?Q?xi3YhgbCaIXAm+Hpahpjmrl+IPIvI+a90gZ7ddMrhA+VSOtioQEX83iRkD1G?=
 =?us-ascii?Q?sdcxCo/Zp/hvpLkRxjDirhjgCoalMjTSxgjQwKqBMh7snz5C03czljGzLSAi?=
 =?us-ascii?Q?PlmEdpQGHCEvgbPvQzkevh/PD0CJowoyV7UXOIu6k/ZHydS034MbnrL0urQR?=
 =?us-ascii?Q?K57VluU5cmO9SdjDUPqRIhfpHz1hI2z9xMERWePtzJj446WvoqAG1GH824oL?=
 =?us-ascii?Q?XwcuM3bWJ68Y8+GXZ1vRjJaxEkjCY1YiKv24y42+YD3frJHKcHyzZBL+Z+7S?=
 =?us-ascii?Q?+pdL+ELMBvocrZhXpl1/g783qR+3ol/74vEXyoQiYSqKNAaE0zNs7mtC2zQ7?=
 =?us-ascii?Q?DTZSYmkr3XFnvGWiXJr/LPab0fjYzAYYkcKUVKntuacQ/Z24eMAqYl84NsGh?=
 =?us-ascii?Q?1mOdfv7FxrdC0wGesokNS+YwyrLcKtENO0WUJwrm12pXMa/aJNZoIfhJ+nQA?=
 =?us-ascii?Q?QroMALQIr9q0tiFpp0BazzhEwCoo2OOOUA1Ip+la30Ioe8FOWj6WPENDgoQK?=
 =?us-ascii?Q?juAiPn81vuTAR3HJ6e3rI1qkBTiTA+nvR8VP9E6UvK7Q7uIdc+w4Zk+JSWzX?=
 =?us-ascii?Q?fhXQlirk9D7yqvmMcpcOPQo98nXDdrrughJ5SHPRpDmiXz8QlfcQnPDcYzYD?=
 =?us-ascii?Q?tTjYbCeSjw1vqVrylRxEed2/XVrFiUXfqGKNvLr96JDSvcBoLdEj3qD4mtgr?=
 =?us-ascii?Q?qqROqh0CMGFf+dz/EsNLWV03mngDjaiJenXSehm1s012qbhGvFqgU4m7WKaB?=
 =?us-ascii?Q?+x8OzOdP0DOC5Z3JaI/O7p6zA2dgFIhmLquvONXyCHvJd3CKV/fROI8rD8wX?=
 =?us-ascii?Q?4mF4infRfDy+aK143EhJ3VZ4lm6CS5D7EdsXN4rCtXxbLgmKWsY1vW6qPvYt?=
 =?us-ascii?Q?4tRFrpWkqZ45nFcCnPHE3B/TNJNmFQg3WZLW9zY6/GadWCCcKcuQM3/fr5Va?=
 =?us-ascii?Q?f3OpIQsEzxuBa+AJNEdqre2dMaH4pcmOs6ThfYYpjfEHaAuLK/Ottzhl3RiA?=
 =?us-ascii?Q?EIcv7syJtCjImnY9zIc7Ssb1WFlS4tRvRnOPAljtl/gQ82Q8CSIaI6MxtW99?=
 =?us-ascii?Q?pp/IH/1kA4nAaNvzjfdLhO902ZEHsWS+JwsoO3cbXbPr2729zfGIVT2bF91x?=
 =?us-ascii?Q?AtT5ljhVO5z+39t6/q3XymLffzZ4OelIzeT/UP9gP6/DvqUYPIyZon0YpJwt?=
 =?us-ascii?Q?ykO1/ZHbQsiiq9LMLk92bQ5Zyd+chxZvOi1Ewnk6ovXjmzgSSJbiyYpjlLD+?=
 =?us-ascii?Q?ylWqXaP9puvAk8DfMPlVEKnYCPvDdtmo7ZZe5SbdaLQzecQvVSDij/A72FHx?=
 =?us-ascii?Q?DLFxGSe88xTHWtg3z1rUqtV4KJ/eXlor8bugzQXlNGTKs6CCk89WCdejvM/l?=
 =?us-ascii?Q?w/kS9OqKFt5BM38Sfwg3ozPCwpFGbr1cjW/vg5VdPcssMpTwDFAibJYeV7KG?=
 =?us-ascii?Q?b/rCX3gvJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f15ea22-adc9-4c02-a482-08dea0170cff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:30:00.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXrvA2xl1cRYugo9+vl1TEREqkXtkdKi5pFaAEKrBfLIEKN1O2T14AP4T3Mvl/qgzmf0wDlpz6WR3nnz+yg6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36407-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CDC6A4417D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 04:24:36PM +0800, Xu Yang wrote:
> When a system contains multiple USB controllers, the global ci_role_switch
> variable may be overwritten by subsequent driver initialization code.
>
> This can cause issues in the following cases:
>  - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
>    though the "usb-role-switch" property is not present for the controller.
>  - When the ci_hdrc device is unbound and bound again, ci_role_switch
>    fwnode will not be reassigned, and the old value will be used instead.
>
> Convert ci_role_switch to a local variable to fix these issues.
>
> Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/usb/chipidea/core.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 95d9db159ce8..07563be0013f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -655,12 +655,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
>  	return role;
>  }
>
> -static struct usb_role_switch_desc ci_role_switch = {
> -	.set = ci_usb_role_switch_set,
> -	.get = ci_usb_role_switch_get,
> -	.allow_userspace_control = true,
> -};
> -
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)
>  {
> @@ -787,9 +781,6 @@ static int ci_get_platdata(struct device *dev,
>  			cable->connected = false;
>  	}
>
> -	if (device_property_read_bool(dev, "usb-role-switch"))
> -		ci_role_switch.fwnode = dev->fwnode;
> -
>  	platdata->pctl = devm_pinctrl_get(dev);
>  	if (!IS_ERR(platdata->pctl)) {
>  		struct pinctrl_state *p;
> @@ -1033,6 +1024,7 @@ ATTRIBUTE_GROUPS(ci);
>
>  static int ci_hdrc_probe(struct platform_device *pdev)
>  {
> +	struct usb_role_switch_desc ci_role_switch = {};
>  	struct device	*dev = &pdev->dev;
>  	struct ci_hdrc	*ci;
>  	struct resource	*res;
> @@ -1179,7 +1171,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		}
>  	}
>
> -	if (ci_role_switch.fwnode) {
> +	if (device_property_read_bool(dev, "usb-role-switch")) {
> +		ci_role_switch.set = ci_usb_role_switch_set;
> +		ci_role_switch.get = ci_usb_role_switch_get;
> +		ci_role_switch.allow_userspace_control = true;
> +		ci_role_switch.fwnode = dev_fwnode(dev);
>  		ci_role_switch.driver_data = ci;
>  		ci->role_switch = usb_role_switch_register(dev,
>  					&ci_role_switch);
> --
> 2.34.1
>

