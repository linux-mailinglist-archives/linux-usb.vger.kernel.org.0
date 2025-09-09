Return-Path: <linux-usb+bounces-27806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B60B5023B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 18:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 724ED1C6194D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BD036124;
	Tue,  9 Sep 2025 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jojeDFtz"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E833594E
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434465; cv=fail; b=DmpuM/sUhqAiAYRXfBj6BD8M1ssiEzA3emyMwYtuIigYMrXoAZU4ouysDn4G9TMKbB/O05SArx6nSkCLZopwOaG86sv41jeQoN5EScWMkgGtMONXyAhzoiFRewLAclmd9Wb9h4G4Ov3Lo4fQElvIENHzkvLizh8MEHwZxq2A1pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434465; c=relaxed/simple;
	bh=n96s7IhyMiQIXoWIBZ54HubHtalt48OQ+jmgmKrOXts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sTVye8WvHaVrbxgkbieG5PL9v0YgzFck0jVO2/3airIP7BT3aX+vHtrq8ATP5p/7rHFfuoONtX3g6enTtJvo69rex2vOe+4I8R7KzUbAi82p8N8h+S6lK6zh8j1Jke/FrWhQjrNXG+GV/C4TcSB4q6YeetyIc1w35R4pVvUnd+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jojeDFtz; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBBh/7B1cCAbxJlCtRnRckGqfn348N+x+n5p2zdyR8xkBbkW/T1I22VnI1eAnfgS5cHfa/DsWEiqiGIZuxXnMCAkFpZ3/nD24SfJFJriz8UjBoTA/4Usut96vJ9blSfgFq7+qBX0sWXx2giYP2YVQ+7Ww3raC3t59eIGuOSZNQbybXdgp2ASC+6hxMVeFwus991yI3h8+Lp9hcgibXfSWHPmThGJnNbQ69LiGGQncLM+aCl/bdX7Zr3/bTjesCh5Q58UDmhgOuc0OkVQfywXSYqzoz1O1M2/kSTEApZkJVI5cEYURqLyViX8Kx6FXhN0tRor5yOep6UiORW7midraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMKB/bhu+SOqV+WL9b3m7p8FK16QIaCwQFZaS0aMxVA=;
 b=mKGcZje8DwrfiUHvGdH/tFKFABvaO/j1Wu+9bMjQ3hRk23yO/XzJhoG2NnmJVjkkiDAu4W81RAPZYlz2a7UnySYQ+STYHdyZPTDR1Ex4crHakCaks/xhXXi60Q3SoaGTwwfYXjjMwb3nWICoPYKdKlm1oy0beK1mMggWMfFQ79S7oofWkCNFAO6zGpzh2lguwWwW+MFXwZvYicirF5SZpiwUu2nmhyU2YyM2S+6V+3TpzVxC7Z4Zw8PixV0S4i+8ocDoHimScFVkYg3JTCvSpdPU1D3sc5dCieQ+whfhZxmR05kL3SrkmTCMbX6gSYQ5wWAIWIb5rqVRtgYY8mJISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMKB/bhu+SOqV+WL9b3m7p8FK16QIaCwQFZaS0aMxVA=;
 b=jojeDFtz2H0HmEPoVT+Ab8fVpo1QxbTWl/zb3+3YBFOyUefW2F8Rvk4lmX5H87DLiHbzPCX/xeUOTWRRtqhvchmvPARGhwukAY+RCL+DTPb1ETcgjcbU1uUL8SEZiMfSdPZHP+oTiJ71Oa+EKmBM0NGw5yQTMDUhgk4risrdJRYnAidPUWC+54JzzHUF0PAeyLM6mCTJCHa+ED2hKtlkYLzs4U3n9GQ4aeKU2PdCKkga3vehPKV1mBcHa5XTrPA2vjHCo+ppKknGgETKVaYK/eyaKT4N6GFbZ3XWSz40EXG/P97di/J+sCRjftl2iSjWnMYquQrXKUFDjfCuJlLhlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10784.eurprd04.prod.outlook.com (2603:10a6:800:266::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:14:15 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 16:14:15 +0000
Date: Tue, 9 Sep 2025 12:14:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: add wakeup support
Message-ID: <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
References: <20250909080733.567796-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909080733.567796-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH7P220CA0042.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10784:EE_
X-MS-Office365-Filtering-Correlation-Id: 824ad4bd-2921-4c16-7438-08ddefbbebfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYfRX3F6SVNXDWnfaeFbVey416CTLeE2fMbji3/wxtALGIP0JpZyqo8FCXGj?=
 =?us-ascii?Q?0PkPmc/8U8g6AYaMDUz8DzpG2Zv8cp2xE1WPDvr5nbyhUPGF3XpochXK4Cj+?=
 =?us-ascii?Q?+c5n0WZXMTt4g7QqLgtMX3KZlIDjxCzpTr3jJscY+EYUjBDAGLv/CHrYHvw6?=
 =?us-ascii?Q?rDFFWCJQcsj8CKnlhKQ/Cd3PQC60VjA5pYeHhhXo+jWp/+nJoozSNKpTXga6?=
 =?us-ascii?Q?3eDbibG2tt4rGc1TeNFkeXVj2mWOEJcpUe0wOdaT40tI3I+oafg/MxcXukYY?=
 =?us-ascii?Q?i536o1Va3TYjpm1SJ4X99u61zlo1gVDG8iA5rf8wFyzTwPGdG/M0dm6x4dDO?=
 =?us-ascii?Q?FSTTfzPVnp+p+uh7HZHIoL1FCVZQPbAWQGYEx9iWT6p6pZeN6Yh1HKdXwpRT?=
 =?us-ascii?Q?Dd8CSI2OxQvt3v8Sacw9xrLVhOXQW6U0js/pFEBGwCHczcNs3u/of0rVeFnJ?=
 =?us-ascii?Q?eg6sApxQmq5FZCrQbf7Y/JaEiNBxiZfJXdLvalm+xjMDzWKf++Scs96djDdy?=
 =?us-ascii?Q?3rkfXd/iPmeADFQMBoxWbW/lt/W27Jk35gE0smb5v+nxutRcxOsq6kVu1Gnl?=
 =?us-ascii?Q?mbIVq3qCw34Ic+xh8Jy5h4cGSuHV5KoHD/spiWiXAj/N5/PzYSGPOdO0ilLr?=
 =?us-ascii?Q?ehIwSAExSlasTCD2l+Yx3AirjQ/uC0U9P7+6+1o0HCmF5VwEKtGyoKPsilqw?=
 =?us-ascii?Q?RSmw4SAm4Ikxu1EAQa5O2hNFNPTm+Lc2ufiEeWvKxbQZseGU5RLmEkekKI1+?=
 =?us-ascii?Q?0VuKvKTth1OqQSt1NUXQueram+WKDy4B5xq7oK25hBgNIYc/3/V6F/1qczW/?=
 =?us-ascii?Q?u3IVsSU3xw01gj8dcaVuqWyasm9ZZrFbLBhTye2gJwC5c33B7xTmZEatGy0O?=
 =?us-ascii?Q?4MaFusqLFImYWdasSMEapkSuIR1JdsS45XbV1+QkEHOp6Sv+LRTehZN669G+?=
 =?us-ascii?Q?i22feGvxDpSZIaDSQ8xgXPOaUYf9Y9eKvLdzPb7bJbWw3yx/gOXFEbfno0u3?=
 =?us-ascii?Q?yXLHTS0yUvYsLNgp0xAmZqkNWBPvvthzj7qnttslX2Cu89woY64kZL7Zs4vK?=
 =?us-ascii?Q?H9z/apo7MrZQamCo4qw33Tv9Y7+OYIK4PpP9yEIa2InuSaOW+qjxyluFwFTZ?=
 =?us-ascii?Q?4WZRu3hIV4A+Kv5pChJioEpZeFq70VWrBueJeuevzc1A7/WY9vRL2OxrrddV?=
 =?us-ascii?Q?c08kGDXB8mMcj0HTGuTctjc1wMbKUjWcf6EYjBAh9G56emZG/qVxarN/jdrT?=
 =?us-ascii?Q?uYAZ4u7eH2L5KIvfDsWF8A6YsceTIoghYb7eb+1qLHjm8UFfVUIYDF/A428Z?=
 =?us-ascii?Q?jfXNvHZUuwUq3JDsAg7BGE7dQEICs3PILZwhNjmkEt2NpoIf1rQ33lUB0LJy?=
 =?us-ascii?Q?PVGESNODmAsCiBtxRxugH6DKUr8OBjZPhnBfE/Vh3sNyVUcyuWdlO5umtIGu?=
 =?us-ascii?Q?cFOQQPK3YmI1tX77DljQVFcbMpgp447AtZLuQtVhIyHbzLZjA1c7WwafxaCp?=
 =?us-ascii?Q?wTQrLHvCkwymu/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DML+SSL0yTgX2IT9twPD+tYnA3/8alcKJKhMJuGUyhnkx/PlhhuY5QaD4jMO?=
 =?us-ascii?Q?mIEEezZ7MZHNltcZ+f2nz+iHMibk00FFI6HJ6APuwCrYRFno86tf0xBRbHv0?=
 =?us-ascii?Q?CHG7oNDEYk+XQEQZm79197OT6uGOc0m2rA0T/RSslt0MwZXZ7o5AWs7+Lixn?=
 =?us-ascii?Q?0NUXIokx0e0SMiWum27q5YjPxVA6mAZUdExEzEN3e8Rgy4QChvKsvr9ZUiki?=
 =?us-ascii?Q?57aC85KVBD34WUd8CGYgdX2ezAcPgPP/x59leb8N1YO8mySUB87swcIDvFBD?=
 =?us-ascii?Q?V/fXzgLz7Bx6QFWMSbnCZP4886QGiQ7lXdRS9e8yDIdyrXHJxVU94eb8f5xe?=
 =?us-ascii?Q?tVYPU2zsCFip2Ka9J+kGLj7FU8ZMGP+BORqD8nuuMtjoqbH5wg1hX1M1jIzR?=
 =?us-ascii?Q?p4iA3/6kzJ5dOBSLNfxzbJPHSvd4FNazYdsJRbHgXn+1LlpoTrOIrVFj0RSA?=
 =?us-ascii?Q?PIpLgioOizAlMra4byQVHzXf/M7Ssy72KxD5otCkcfVCn3Yi6BNmn8gMP9kd?=
 =?us-ascii?Q?o8R58EF2jWv4BuCPrM9otvmuXox8ibOyQiAEu9WaX/p+QKk3FcgkBVzL4INq?=
 =?us-ascii?Q?R3HEssIa8Ip/uLy0AUP1nR7fLDsC5bMU/7XKU7g+4mFIAUuEpPa9mX2XI5zH?=
 =?us-ascii?Q?MRGYACitE+pn0n6eG4uK7Lng4LVZ4sIwZecUSUmP7KM8/xW7OzZ5CRBciEG3?=
 =?us-ascii?Q?76Swehzg3lUMnXRFgOpyclHP0plK+vND5pJvbCLCs3OPEb/WfZDy4eCt+JIb?=
 =?us-ascii?Q?eqjnQO1tkQ0DmVh2V6OKB4S8FUzfAC9414jVBPZqJ0JB769bwkIrLIciUTbA?=
 =?us-ascii?Q?56QghA68kP3FXKAE3Tk+oL0LfEd5WdcILWtSUjxyCzko4vxlO/NGcDF6qjUq?=
 =?us-ascii?Q?kQ7zU26zZqcfy8fWqalEf6ojOZW6bYvbILqKZ+4UdS9PBxqPCTJDSLT6AI9q?=
 =?us-ascii?Q?DbZ7aY3TRGu2ci4hyD4MA+1D4lhF3lLXuih6ntfASBc+vslKv6maJYUfjo4c?=
 =?us-ascii?Q?lY8lyR28NA647P2OZ0lEJONjyuEZgknTb1c4MEDtM1baqaTjWMnwdeHC+aXE?=
 =?us-ascii?Q?hFKg8u2Z5lNLw5Qks+UAeWKfaGEJDhljV9XmRzasjzbaavZgzWAhP9p7ALDP?=
 =?us-ascii?Q?LB2IEfDM9B+1wy0PAxpSenoW5JQltR1dxCZXBmTrrmj3Bo8c4VqNuZWDXtE0?=
 =?us-ascii?Q?6gj7UHSXpo7gqlNNMlAk/OHlCjVJZbopf8yakzZJIoY34t+AUMHKnkst+P/M?=
 =?us-ascii?Q?PEqSOA/MeDFACO/u6hTEhSzX7LK7ZghPD4xZRy0RM2bgOpee2+G4reFvYl0H?=
 =?us-ascii?Q?KGvqfO96/2SKXglJGTkm2vhvPqiJaXiSgt7Z6w+3hDj/vhtzXcWnGdIvBokt?=
 =?us-ascii?Q?0+LKWPsAh2Jqe6k5Tvqv3hoXXXBd93CmNJXsLv6jZp5jsrncP3TIfgiA/ZEc?=
 =?us-ascii?Q?vPXH6o0X0dEBAF8EuGcx8d1rm+dkcFTV0VE/Rk1rGKzeiSe0gecuFRWQG9EH?=
 =?us-ascii?Q?mDg2RP2epp/wQ7amAodfTzowqwiGAJtzuF+CgQw3tIuw62jUfoYbeosgJnVM?=
 =?us-ascii?Q?nx4h2NXH4kcFYp0Jpv8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824ad4bd-2921-4c16-7438-08ddefbbebfb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:14:15.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FO/Oc6rHDtrStTf5lWTO30BpI1wNNd0nertk0+7g4FhwUGmIaStp8lxZBjQuvFNNrGaJbxtMxvDdDAfKRDBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10784

On Tue, Sep 09, 2025 at 04:07:33PM +0800, Xu Yang wrote:
> Add wakeup support for tcpci, so if the user has enabled wakeup file,
> it will call enable_irq_wake() when do system suspend and call
> disable_irq_wake() when do system resume. Due to this driver supports
> shared interrupt, if the wakeup is disabled, it will mask the chip
> interrupt by default to avoid affecting other IRQ users.

Is below look better?

Add wakeup support for tcpci. If the user enables the wakeup file, call
enable_irq_wake() during system suspend and disable_irq_wake() during
system resume. Since this driver supports shared interrupts, mask the
chip interrupt by default when wakeup is disabled to avoid affecting
other IRQ users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index a56e31b20c21..2a951c585e92 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
>  	if (err < 0)
>  		goto unregister_port;
>
> +	device_set_wakeup_capable(chip->tcpci->dev, true);
> +
>  	return 0;
>
>  unregister_port:
> @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
>  	tcpci_unregister_port(chip->tcpci);
>  }
>
> +static int tcpci_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = enable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +
> +	return ret;
> +}
> +
> +static int tcpci_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = disable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> +
> +	return ret;
> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> +
>  static const struct i2c_device_id tcpci_id[] = {
>  	{ "tcpci" },
>  	{ }
> @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
>  static struct i2c_driver tcpci_i2c_driver = {
>  	.driver = {
>  		.name = "tcpci",
> +		.pm = pm_sleep_ptr(&tcpci_pm_ops),
>  		.of_match_table = of_match_ptr(tcpci_of_match),
>  	},
>  	.probe = tcpci_probe,
> --
> 2.34.1
>

