Return-Path: <linux-usb+bounces-17853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA79D907A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 03:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 263FB2867E0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4722D282F4;
	Tue, 26 Nov 2024 02:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aR4ykFtO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8617C96
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732589366; cv=fail; b=Pd9QrBDm2PUYeGL0r0eibkzMZOIwM+MyHig5g9Pd0TUprWPgDDX4AChfMeTsvOT4KXBT1O5Z/7idJh3c91IMSTank6eaf+TbNhFKT/Oq0hYJ6JItF3BNfkTmrp5yHCOIBRKLRtlTYpW6wBRuNWjaPnba2xz3Xh97txNYqlh79f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732589366; c=relaxed/simple;
	bh=Dug9+XRV8PJBlRmw5mPwbNgm0fJOm1LhLq0eb7uK7lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CpMUkckfmrBTYy5Z5oDYjItJd2/BVKjArg8C8HTvA+ULOcletKBYX7kieJU3xo5wvFtZf7ChOSJpYH8JpeJ7tITMIyeMnyFsrllidpVrhRT8Al2SEYx7G/UjT0IxCd+mmlAHAS5cUvLvLFUzgUN3MBHnopVSCqJKUvDtoOOQIfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aR4ykFtO; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+FemsCzUmdWwZndgzMh8sF/AeUwJqkWNPpN6xL1s595c20GtRklLMOwsJtYQozRb7pIAozbDYLD413q1wcoCTgTcR+ZtoVehKWSnph/FKztYixZDkVid5WpaMZCIsCB4k3QIqIwVobMOwSO/ZRFWeZj+GYuC0Aj44y/tO9bqXi7oRH62g7kT+7dtssQuCN2K7iwYwqEC8KzJqNCWmQnOxLwmoS37puot5OQjWYiQptR93rcsiSkJfEjpNEduRASXqPh3GCeFlQfVdS596427We+PuStfdXo0LlD1FVAq5OrkqPLJXuXmKDgBaBK7E/PZXjNA8f7eCK+xqm37yFLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVZZ/9RZkUJPqPL9fJsWenmAST8405vRMZUPBf09HPY=;
 b=xdAgVuv4N/9OH8EhRjPB4LWffXkIhnN7c6EPU4g4KtGEqUY/7alMqhCdDiJWJpw/M10hxOZI6tqgsTMiA2MiMCpitzplOryaEsAwgnlbPeLhMH3tYduHLG9lPHC2ZIlw+CXCkTMoQHTzhIlzkh4zlwIW1DcW7PxlWNBb4lz1b4Cj8Wmoem+SabYoac3TV/AgK1Mbe0Ebt/5nHtPEk4vUQaY7zk2SQnD/V7sUQJHsWJrv/p51Ay3dKcDPF2KxehXJD+mWwx55UesEYJ3IzK6DBSXUDxiwo5zScgdlAS/0wxiL0ye6XIkudlTeYuGmDuIzkCA5Bk1zCliguig/CDQGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVZZ/9RZkUJPqPL9fJsWenmAST8405vRMZUPBf09HPY=;
 b=aR4ykFtONEIUlcG1bu4O7scNaBm6NeqG3Z94v5PO4pGIHbpeddOiIr3YDVIy+pMzkwL00GPTbOX5rXpdHNS7xVufH6P0hHJjh47cx78RXWHSgT1LjQ8IrjS0eaWs9diw4M88gRg20Jmt2GE6DJRM+dvJUkLUbE0FfiJb6WmYzc7G135M10QywV4UFydPpoSOWdc0pGi/vQzQs0pGeoZSV9I4jYmCWwWsLzqxOhOL6uFcWKJwPLtMaEK75Lk79u4oW8ykLJek4c6ciTiRHeeXUVwiguarjiKPsW3vNseWi+dLrHStb8z+wvoWbGiQlCMh89K+LKp03kYQgrHpmvalpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10151.eurprd04.prod.outlook.com (2603:10a6:150:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 02:49:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 02:49:18 +0000
Date: Tue, 26 Nov 2024 10:46:38 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Message-ID: <20241126024638.t2gixbuztm465ndy@hippo>
References: <20241125101017.2398904-1-xu.yang_2@nxp.com>
 <Z0S2GtHltFC08Fui@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0S2GtHltFC08Fui@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BE1P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bafe485-7e9e-45c9-b783-08dd0dc4ec0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pmfWxH34Rq8Byoq3bBpqC4DTMdrsQidgIHnm/ZeEFKE6B8f5LXWBsEa32pQ7?=
 =?us-ascii?Q?rGjKFT43WX4IQ+O9xsV8xQyHFH/Ds63eyjqWT9hCce6XCfpIHlctT2R8xoqb?=
 =?us-ascii?Q?rVrOkMXYlLU7R/dLpdloDuvPijD4GJnxK9A1tyqjODwoZ9Zm76EcNmLqQcQd?=
 =?us-ascii?Q?ZgLMa4TQx/otUebOVBgwLeNhZGtQ5rbudD0vXoZ8TEEQ9hMVeWCj0ePOt4ye?=
 =?us-ascii?Q?Tz7ArXJFo+mN16np0WMF/yx7KZz/mBYNxEotWSuNCTCfW1/kPL1FnvNlu44G?=
 =?us-ascii?Q?ow4qirovWRd9vbk3/jcLbXeOne1h9PKAdJBF60f8ubVptPDTiBPHs0tXxYI5?=
 =?us-ascii?Q?Ji2uStWkoPy+4co4/27YG5PCmRGiUHNKaFKgFcAGpKWhbchQotDwL1JGy76E?=
 =?us-ascii?Q?uiWh/zSXXSRzzZECfQZqETn3i4fHRkUS8RvIhirBz7MYUnIa2qEoyInLvw2b?=
 =?us-ascii?Q?k4k26VCnKElBB8VKxmIjcRe5uUwyemltyBJ+7Vw+kLGJXq3ULf1fv+qTxVym?=
 =?us-ascii?Q?Ftto8BHd8MRHNEK77B7scDZMYt2JvTy6bTNQd76q3I1MJETwZY/bUq7d5XBT?=
 =?us-ascii?Q?BLMbZt/oZvfCUut6pUde185KTij3MgT1UQAs23wqhvLzjyEUbYaDSF7bhWs4?=
 =?us-ascii?Q?U9HizuMel3McO+i9lkucuGfrKd/QH9xQv8fETi/nElzy2eJm5/sv2MiG62Go?=
 =?us-ascii?Q?fkSqScuC0t7GPoUo417kp3aMAzqTLw/1cnt9dnzUQxc/8RtkcjoPBGlNk7Yn?=
 =?us-ascii?Q?jQ2Lr4f+RfLtQMlng6QDIE8cRfOG0VIuyr0hUB1UAIBQr7ZivqxIKb8ekBF7?=
 =?us-ascii?Q?qFEC/2mzqIJZY0v702kHvHDTnw1ICRqzyEvvvVOIqLtrpH2KS568SO/67/gL?=
 =?us-ascii?Q?q9nzcGRLm1VaR4uipJVCswQvbS/PMzjCrIH20QADsrXoD9eMaqAmh7YCzDol?=
 =?us-ascii?Q?2Hpg9U73LoWiXLLzcIQNH1F249WtwIA2aP1Ievjw5MvBNXcJv1lRfXx8nEVz?=
 =?us-ascii?Q?jIUBoSEMuJTde3Qu2H5EB0sMJAsTUKw4wrQgKAYCfLfhfFE4pdqofp9T4a93?=
 =?us-ascii?Q?aGbdrgzifYbsJ2MSUzaEWIW1LOlVdKsrjCWJIye4oarCGGdxOXpH0r2D8CbG?=
 =?us-ascii?Q?cJqB6PoF+pyK821Bo8sMMXQE5/Y0jiXUCCr3xgHx6rMwCUAFGkJES3vJUguD?=
 =?us-ascii?Q?g4eHoT6e9+ILyvagOUTjtowe0BPPd1LQpIw9k+Bcm0gznAPCn1wIezYob8jc?=
 =?us-ascii?Q?hnpbX2bQDY/Cvt23z056mOzPJkIPPaBUCivIYmbGhC5QlhLZzC48MsHZquNP?=
 =?us-ascii?Q?CXd2OxwUoxvmrTHkLaNhR7D/Udjz9mv//Rc55WTURDS7DeOXm3vyeTSiScJH?=
 =?us-ascii?Q?rx9BVmCZMre/NRKAdjMVBW4LIWJVn/1dUI1AcVlD6k/cMrsc9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDj3a8gSurHOIxp34vrX4VPsNkXJjzvNGDaBQmAsSacbNLP8L1pHLshKrGnm?=
 =?us-ascii?Q?fhFKhDMq2/71YjtOcrMbn1XifbLN+EvZyF1dIob5yjs41OonhUU3bUR9Niv0?=
 =?us-ascii?Q?3A9ycAl5S+nXHaZjHcJa57BT5WgPyNsnqgd5ZOfSK64EqZs72AXmvVww5KkB?=
 =?us-ascii?Q?ZF/NFSrfyY3fT0fHCvu4MW89on6PBg1iKwI2yKsFtT8ZJDqCfBaXHztLNDkm?=
 =?us-ascii?Q?j2G4s6kkvgO2VYJnA7EYU/cHQ9mDqZqbJYFOchLS1Br7u0XLiSeRzWTb2VZn?=
 =?us-ascii?Q?R8cGqexpfWGeVCqe9xbr5gJbAjTzeyeIqW6S1vfW2cD4UerqGKocNTv1vbMx?=
 =?us-ascii?Q?s95KR2crtKinaON6PxsxMtEUYMO1VZDRasYY4rxCDxAtZF11Xz1e1aTKo7uw?=
 =?us-ascii?Q?WZHxS3a5jrLmyr7tSRNJoZ7kj7GpuRy0YDL7KI6xg+HigkkP9SQhznevkwil?=
 =?us-ascii?Q?AIe5W0RBJuX8sHzsiCzURo3YWhCzNPuCGHJ3dHBirpTy7gW1QRgwP9wBrKKa?=
 =?us-ascii?Q?cBXPlE0itk1a/Hh2oe1Q2b7oPZImI/y627xdtaUXE+MCrL7TIy8MHkcGmtvR?=
 =?us-ascii?Q?jnF0mmrrYbJaL6tpm0nRs8ZVbtOmfQ56Pq4UND1rxOa4Fkv/TPUtUXpadp9w?=
 =?us-ascii?Q?jf3mhq7VH6qPg4eoQaHvBfjCAdQi9eYmChoud7badxr4Y83c6/W900Bw5p+D?=
 =?us-ascii?Q?4PbjvjQo4tDoLKd4dpwXm23pvBYKRrVpGBVAkgJtT6ByUkxdfGLDxVLSpOIT?=
 =?us-ascii?Q?ZQOXCMd930XF+kQ+o2VWXd1IOVwS14EGI6NZ3XdBpp1MPPYk/EOhht/FfYzF?=
 =?us-ascii?Q?OKZpfpwGUkYuyyFXt9uyC3bCd/WDSuUwizU2pGK0REknfaH5PGrRbIovk1HL?=
 =?us-ascii?Q?m6qcke7Xb/tAtepeX5NvdvqVGtjPJAHRU7E8VUDjtnmwqonIx0N2yq3qk6M7?=
 =?us-ascii?Q?nzLcSzE8Z02bwuy3aycXmEt/l9kajV3jMWQ8S23tl9vcML/W6AedU9s02Ter?=
 =?us-ascii?Q?fN/hFzjkxUqi5N7FW7JGLSkC3ffsTqKHq/kQU1MU8hF3p0BlMkE/1qXIpcE2?=
 =?us-ascii?Q?mozj10WWu//bNxaDan2+c1cqFAY9XaIp9dOCHxUFufGNmbhio1AKlXtYBdg7?=
 =?us-ascii?Q?LNaZAAz3oU+ML3332CjoJH3l9vVP5ESjHXc/vvnVUDIPvZVL9yvaDpaFZRcU?=
 =?us-ascii?Q?b5WBKcRIaddmWxMCEf7lcTJu/ejqa0o1Po/7BVxwK4m0Zb0eP6ejqzxkarYj?=
 =?us-ascii?Q?G/a6RrDG3yauNsYTlW3whSD/s9eBPxuYtEckIVqG0B0QW+f9EgrE5deGi88L?=
 =?us-ascii?Q?xDFxy381f0YLEnkL5AxoOq+obauSmOmErjL9VUkFZLmNTZcNWin+hA/BWpEA?=
 =?us-ascii?Q?jA0OycF1Ga7wV6qCCNdEmRmud049fCMVUN8zGl+9nh+4xYneyjotZemX5cB8?=
 =?us-ascii?Q?Oq653ado1c3QOb6+7ECr3ylKbnrom8jhji+wU0rKnL/9EmOIF8qxIeNZJ033?=
 =?us-ascii?Q?tbUFfxH+TuCOMllXxcrlUOJks4tl0cIpzqcF68diltrGJuHMWXZGlkdNLyJo?=
 =?us-ascii?Q?9lBdfJJvVOeqKVM4bpgWANnuKUVlVbRDNH1tsefX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bafe485-7e9e-45c9-b783-08dd0dc4ec0f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 02:49:18.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWBX5wGoe5Tx17eZf23+byARummFRNfGExKnYZVVkeJRY0BRZX2XSLGSAkO4+knRuQRl6Z7PO0J02sIau85AQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10151

On Mon, Nov 25, 2024 at 12:40:23PM -0500, Frank Li wrote:
> On Mon, Nov 25, 2024 at 06:10:17PM +0800, Xu Yang wrote:
> > When unbind and bind the device again, kernel will dump below warning:
> >
> > [  173.972130] sysfs: cannot create duplicate filename '/devices/platform/soc/4c010010.usb/software_node'
> > [  173.981564] CPU: 2 UID: 0 PID: 536 Comm: sh Not tainted 6.12.0-rc6-06344-g2aed7c4a5c56 #144
> > [  173.989923] Hardware name: NXP i.MX95 15X15 board (DT)
> > [  173.995062] Call trace:
> > [  173.997509]  dump_backtrace+0x90/0xe8
> > [  174.001196]  show_stack+0x18/0x24
> > [  174.004524]  dump_stack_lvl+0x74/0x8c
> > [  174.008198]  dump_stack+0x18/0x24
> > [  174.011526]  sysfs_warn_dup+0x64/0x80
> > [  174.015201]  sysfs_do_create_link_sd+0xf0/0xf8
> > [  174.019656]  sysfs_create_link+0x20/0x40
> > [  174.023590]  software_node_notify+0x90/0x100
> > [  174.027872]  device_create_managed_software_node+0xec/0x108
> > ...
> >
> > The root cause is the '4c010010.usb' device is a platform device which is
> > created during initcall and it will never be removed. So the software node
> > will never be removed too even using device_create_managed_software_node().
> > This will use device_add/remove_software_node() to improve the logic.
> 
> The '4c010010.usb' device is a platform device created during the initcall
> and is never removed, which causes its associated software node to persist
> indefinitely.
> 
> The existing device_create_managed_software_node() does not provide a
> corresponding removal function.
> 
> Replace device_create_managed_software_node() with the
> device_add_software_node() and device_remove_software_node() pair to ensure
> proper addition and removal of software nodes, addressing this issue.

Okay. Will improve it in v2.

Thanks,
Xu Yang

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> >
> > Fixes: a9400f1979a0 ("usb: dwc3: imx8mp: add 2 software managed quirk properties for host mode")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > index 356812cbcd88..edd544c6e1c1 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -129,6 +129,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
> >  	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
> >  }
> >
> > +static const struct property_entry dwc3_imx8mp_properties[] = {
> > +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> > +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> > +	{},
> > +};
> > +
> > +static const struct software_node dwc3_imx8mp_swnode = {
> > +	.properties = dwc3_imx8mp_properties,
> > +};
> > +
> >  static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  {
> >  	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
> > @@ -148,17 +158,6 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  	return IRQ_HANDLED;
> >  }
> >
> > -static int dwc3_imx8mp_set_software_node(struct device *dev)
> > -{
> > -	struct property_entry props[3] = { 0 };
> > -	int prop_idx = 0;
> > -
> > -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk");
> > -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
> > -
> > -	return device_create_managed_software_node(dev, props, NULL);
> > -}
> > -
> >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  {
> >  	struct device		*dev = &pdev->dev;
> > @@ -221,10 +220,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  	if (err < 0)
> >  		goto disable_rpm;
> >
> > -	err = dwc3_imx8mp_set_software_node(dev);
> > +	err = device_add_software_node(dev, &dwc3_imx8mp_swnode);
> >  	if (err) {
> >  		err = -ENODEV;
> > -		dev_err(dev, "failed to create software node\n");
> > +		dev_err(dev, "failed to add software node\n");
> >  		goto disable_rpm;
> >  	}
> >
> > @@ -268,6 +267,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
> >
> >  	pm_runtime_get_sync(dev);
> >  	of_platform_depopulate(dev);
> > +	device_remove_software_node(dev);
> >
> >  	pm_runtime_disable(dev);
> >  	pm_runtime_put_noidle(dev);
> > --
> > 2.34.1
> >

