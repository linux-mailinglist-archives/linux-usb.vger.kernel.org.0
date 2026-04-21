Return-Path: <linux-usb+bounces-36384-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLaSDlpD52n55wEAu9opvQ
	(envelope-from <linux-usb+bounces-36384-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 11:28:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33306438DEF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 11:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50883300533D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 09:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F8B3A5E7A;
	Tue, 21 Apr 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mlwmsUiI"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B0A384225;
	Tue, 21 Apr 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763732; cv=fail; b=T2wjZTyP0SAzMD/3bO6wPEtZSZVjUTGVmmuHoeLnozG24rfycB21BgMjill/9Ezj0SFB3jbRE1FVq9xpKRtUMrtlkECd9fdQEY0c+SdQ9SvaWer9LRxukvMg5B+luwkDtJDEWi2wwbpsC8k4jrph7vFeV2OJRnSU3Dg2nudKQ4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763732; c=relaxed/simple;
	bh=ZxMftOFjC51ecUaLCGZhzuqPT05Gi66bdr1gPwPdbTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U02qiAPk72vq9rLoUqud2tFZw/0FPFwWAKNu5RjOa0Nhkg0hM7wGyT8wwXXib9yAW1+bkH/srOdZ7GEnB+dF7Rd0pVAnPT+InnKO3azFl6XYLTh54jBkFcgdPrK8rwcVFCKY556+d3jvaWQPLvsuX5gQ/VJOuhBetBcKbv8seb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mlwmsUiI; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS+6RkaunSfYPuIpc9oJcCAaozlnaxf9xsLzaRrcBY/0uTAXLCLauhmQQoXfF88KeG7RoFUkrZ3Zo4ILErJPkSjuzINRLFExeaS7HHOv52AYZUzehL8pChU/h6zl+idKjJam7KfaCNXG2xQjZg/uRA942yfh/cwxzAyU4tgdqNk/VSeqVBpMLjugDyD/E8U2BfQi0KqMGJej9EV258tjuuVlyOE5xj52dXB6KKHFAqC3ksgjg41aSUnDWZ6SA7ayBd9nCoy5/C6C4enAptS9yHe3uTxgke7hvqEouwRwtomk9bhyIZd+Fpjb+P2mxcnIoQ/e85gkf0mriCf3qbOC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqSvnVPvup36jyNlGbG5SPtbVIOXr+rpm7I60QK8aTE=;
 b=IU2jvO95n0kDyc9sxmARgQzEOu7UPVH/Xt58LCcJ5Xa5zbz7q/NClQJdzVH/YCI/zT/wRd2GSe+ghQvVqGfO3gtcax0nVoRBtgOb19F0J/38r41NC/eELnZPvy49QpqhRbYe0ta5iOgbG08ExWXrKxP2LIUI4wNr8b2bcDKC94BTUi8U7lD61HsDb9x57ioBRkzc6u3XNVV4QRr2YcLiDNmh08gEE39e3R037bXwenAu5qXlmgjBb9CPznMiQTkoaM2xEDD5+j6CGImWa3qH0edDjpIWw2PpEGo55yjekQnm2FxrC4zUL8TGGD9XIIoBBuXku5Wwmhi2ceT+xS8+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqSvnVPvup36jyNlGbG5SPtbVIOXr+rpm7I60QK8aTE=;
 b=mlwmsUiIrf6y9m1TXOwtFGoTXjnqEI3xJHMNaqP7n2/eIc8II9i+jEJP8XpJR6MRthXFnM4qdj8lFqzSVuV39vV08YVgE2Ja4zjmPDlPEoR1we7b1IMKEjJVuwa4E/ewQcZYtmK4dZD4BFAj/k5qfYaIwJ0SF6tQQUfclrJak4h+2R5K4gRFLoGT4SUWn5fnQdlW9t3eOmYQ5Y7CuYX3l7zxmyBcyTL28LPgTOkHjpuK/qcEvXtR/5QzzA2PZy/oinNv6dV53IGm+KcEORv2WGcfPGCD8r7qMdqOj2zkoUEJixfV0OT4m4Z17mHAq+emO4aJEYND2xl2G9FzJX4kJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6957.eurprd04.prod.outlook.com (2603:10a6:803:135::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 09:28:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 09:28:46 +0000
Date: Tue, 21 Apr 2026 05:28:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/3] usb: chipidea: udc: add a helper
 ci_udc_enable_vbus_irq()
Message-ID: <aedDSLDZGg9dQo2Q@lizhi-Precision-Tower-5810>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SN1PR12CA0059.namprd12.prod.outlook.com
 (2603:10b6:802:20::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1b7a5f-9170-4236-462c-08de9f886336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ml/FpzrTWED61hMt427gdHtTRloc7wG5/wBtfCfVBFuQ37jWzeJWTJUBUtTx/sRYsukQZ+F+weCWbYYeuEqGuVqrVtP5E6PIllpO7gnqTquTD+6admdRL9KScVffuOx5twtrNnyzjNPDGqdTvNKB/vgSGkE8U01XNR9U3o8eoXq2JxDsUkYORKVqLKyiQ2SGGf0Jua1tjAVCfkIwBzvhscp+C6teNx8924pLVlHDM59TPMp0dLPonc1M1AyOdwrDm4uHGS703UFxk+0zokG1GiaIIPvDbNOHyGMzO6jdq6Y7Rrx9tGvHXguE+1brkGyc9NfmPWlJ2wXoZwM//ePijcKmwKTnh5xxVbcqdPtcXGSwu4hxd62Zb2X8nnf+FXck2cVvhLjgsVVDH3rH5KHrpFetL0x971OPaFVY2pDilPLhPjc4uyUSYOIz9q7eDhI1i1Un+xKfXgxsLserrHIqKkjzXcNUl8/pQovN6+/6FQXOFwhY3L2BWVX8lGlLssRfMfNFj55osgV/36Jk1HDMMvITCPSebiD7v0ShSwFhgLDJjao8I0HePtM9Cv1t8fhagYtdBd2+RkoSF0fSSHktp1ccGbBhUqUpPX7w/V2LF4cgg9d5cLDXUjOw4x3WivC6f3YPG1X8x/OrSf9dMIueyWkOtA/2bkbL0VL1Vhlr+frD1nXyA8sdIBUTpu2JH48OWirzFATJiHUphiGwYt4aTfpm+IIX2JngyNuw0uIzLgvUc3oH5pcqA/GQjmdAeQPO/N2GsA+qse9c5w9fX2ZFaCFCuveJpXL1HOr0i4vDFB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JYrduCMkc7Wu1FfWcIJ1BOipG2iN4iv5sL1eTbVuBjCGz5EhkZPdEHS36eLE?=
 =?us-ascii?Q?e1c9AcXM6pNn0jIdHnVGE8v3WnoVJryXzx4umVSjNQkAgjejOBbiLJFKs/tc?=
 =?us-ascii?Q?ynAEektIFrdzUkl1va+8JT2mNTa6YB+oWQ5S0AYtVIwiexCOMWWIM4uP4FWn?=
 =?us-ascii?Q?qyJaYSjBH5JiV2Jib+oGgLfdaIqJxDRJcSBz82ngcTZlBtW3k4wMRonkpyVW?=
 =?us-ascii?Q?cIyn2rPEJa8kQn9vAROOKACx/JS8MpxEuPFOmSFaLCAXqc8YPTi988x7FqIU?=
 =?us-ascii?Q?3OeMpCP4JfkPSnZ3tdlgT/C0ozfhvHJ6k8LiIF/RrDgiKBELkQ5HbttzSwYX?=
 =?us-ascii?Q?RTbbpPhihyJlEYw8O6TvyU59rvt/tf6mZXJjDchAmwCfN0DIEh0sm+gojSe1?=
 =?us-ascii?Q?cFNFZoxt/LT90NKbMeDup+VdbxD5AMOJGNEzYx1/Jk5YjiYQ3b550hw0od14?=
 =?us-ascii?Q?iWfXBKQPnBx5kujTlgRnSiC8JijzHJwJ3ojybxXhzGNcq5d1gEUYmmoQempQ?=
 =?us-ascii?Q?4NOTef0wV5c1JMGG+Y1nufzT/l2vTJMEIcSvneHkTJuYqZzHgFhSWWyumWd1?=
 =?us-ascii?Q?yGKtmmy4Fpetj+o/Hpg9Tx2bBedLeGM9+Uw69Z5Hr1m2luS5X2OpZ+exX+A+?=
 =?us-ascii?Q?/uxoqRNqQaHpsqm0bnNSi3aVYYR8+QVBf3kxqOTS2PMSC5aS7fLIEGH5du96?=
 =?us-ascii?Q?QFlmjphAvsenw3RPYlQrJ5HeCk1zDFuqF0NQta53fbHPFPFWwbct2K+rE3a3?=
 =?us-ascii?Q?zEgVZEQyB9ubsJhEtyqyaHiww8Ewb5jgAjexTSzVqyw9getMFLZdf4chJunA?=
 =?us-ascii?Q?4f7a7rxIfqL54uxOKP8DPEuFtP5Zfp0sJ3fdGGGuT9hEV4NIjUrAT+qpXq4F?=
 =?us-ascii?Q?sMSgON+Q9eYCIVRgMFLGQMv5hHAu3n4ekGNTubPdiDiREvFdTHHMcl0MDXux?=
 =?us-ascii?Q?JsGbHhPrDYdBdCkvOImXDdRNnKt9ENvqUhJDQ4Od0ByvGSVaS6ssEO7i4NuM?=
 =?us-ascii?Q?1rCumPZS2uR97trcB1FkaoR7VXBzr/iBcljdHzSMZO0B1VAOdsh+pplAFQ3r?=
 =?us-ascii?Q?eCqzzKPIsDiRI1U0d5NDn0IvhAJkHWeGXtKxYLjgI4XZeVfkNI4F/klSWrdC?=
 =?us-ascii?Q?mG9qePKMu6uLKVPQVBhqqNqOyGyFd8n9Z7b5FMOpw6X2485Ef8Kd0BEcCSzt?=
 =?us-ascii?Q?B6JBrT8n3XBHfwhr1Oy8KfQ1MJCUZI49D9UB/J2BKIZkhqgzP9/ixOzAmJH5?=
 =?us-ascii?Q?ImLUfiX95LtkWMGbuSPRAFON+pSfdpWkWGmEIO0TxSZ+XHJdCzNemsA+GIPp?=
 =?us-ascii?Q?QW8uviTGNC0c/UIdAq20QAsTeRXZS/b2ojprVlUsoltFI1GBR4NWYJEVQh12?=
 =?us-ascii?Q?HRmUlz1ccPxHCiZ0p/Nuhy+qwfzXoAP3UmUllIjrA3X7+cp8Di7u5tjj7SuM?=
 =?us-ascii?Q?j2zJpDAvfm0HKT7owxUsVt8MRWSIJqBW+FQ/iaQ4W/IsZvzRIh+kxRb4njrv?=
 =?us-ascii?Q?iC48jbOYXYIavd7j4PCEYoF26UUSV+LjMd1W11JLVFNBiujQdWdWMf0qIwc+?=
 =?us-ascii?Q?iWg19Y7JIZw+33Q3CLmskYRMonNHVpcJHz6+pYptSjFAI7HOruKKDNEB52Ge?=
 =?us-ascii?Q?ZWsEpOKyvyUP3qotPJ/HEdf4Mat9N5Kx/saD6UUJ28WCvXwiTtElXAZLwUk6?=
 =?us-ascii?Q?6uiVZA6YF6hptblLzpgOWhJg4DwqbhGfVLYIKHWdRF3czeO5daL/hVrWMXNO?=
 =?us-ascii?Q?hmWnpz7B+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1b7a5f-9170-4236-462c-08de9f886336
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:28:46.6867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVgnI2mgLBIl29pbsYO+4yocg4ucma8ECeMj6/j619ZvX7uq83r5mUVg/eUlaOPuejCKSlZtbo0FuL1WaXsOjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6957
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36384-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33306438DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 04:24:34PM +0800, Xu Yang wrote:
> The VBUS interrupt is configured in multiple places, add a helper function
> ci_udc_enable_vbus_irq() to simplify the code.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/usb/chipidea/udc.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index f2de86d0ce40..d4277d6611ee 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1835,6 +1835,20 @@ static const struct usb_ep_ops usb_ep_ops = {
>   * GADGET block
>   *****************************************************************************/
>
> +static void ci_udc_enable_vbus_irq(struct ci_hdrc *ci, bool enable)
> +{
> +	u32 reg = OTGSC_BSVIS;
> +
> +	if (!ci->is_otg)
> +		return;
> +
> +	if (enable)
> +		reg |= OTGSC_BSVIE;
> +
> +	/* Clear pending BSVIS and enable/disable BSVIE */
> +	hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, reg);
> +}
> +
>  static int ci_udc_get_frame(struct usb_gadget *_gadget)
>  {
>  	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
> @@ -2352,23 +2366,13 @@ static int udc_id_switch_for_device(struct ci_hdrc *ci)
>  		pinctrl_select_state(ci->platdata->pctl,
>  				     ci->platdata->pins_device);
>
> -	if (ci->is_otg)
> -		/* Clear and enable BSV irq */
> -		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> -
> +	ci_udc_enable_vbus_irq(ci, true);
>  	return 0;
>  }
>
>  static void udc_id_switch_for_host(struct ci_hdrc *ci)
>  {
> -	/*
> -	 * host doesn't care B_SESSION_VALID event
> -	 * so clear and disable BSV irq
> -	 */
> -	if (ci->is_otg)
> -		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
> -
> +	ci_udc_enable_vbus_irq(ci, false);
>  	ci->vbus_active = 0;
>
>  	if (ci->platdata->pins_device && ci->platdata->pins_default)
> @@ -2395,9 +2399,7 @@ static void udc_suspend(struct ci_hdrc *ci)
>  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  {
>  	if (power_lost) {
> -		if (ci->is_otg)
> -			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> +		ci_udc_enable_vbus_irq(ci, true);
>  		if (ci->vbus_active)
>  			usb_gadget_vbus_disconnect(&ci->gadget);
>  	} else if (ci->vbus_active && ci->driver &&
> --
> 2.34.1
>

