Return-Path: <linux-usb+bounces-32469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2260D39FC5
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD6F7305D92C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EED2F6591;
	Mon, 19 Jan 2026 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Ycoa4NbQ";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="UFaynvRS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32B2F28EF;
	Mon, 19 Jan 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807700; cv=fail; b=D6dBBy2UyM+FSsVEdFgumN+5XK3mNtzyofbSJg5DawJxwUAfg1syMC2eAJOZjjx++uicAUAf+wWNUT5EqRdrXkayJKOm/JhAqRa4J4ANc1UrFxCl0y+/jmcE8xwSVSh+hUAFUSzjvB9bnKeWICb6iJ0sV+L3yw2w6bChjr227Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807700; c=relaxed/simple;
	bh=XOgE4BtWGAHAGD/CWgtZUqTz6CE8l5s8dBEYZvLNsBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ysu0qCKCV1BsofHodgY9uJUevzFt6GUwfz+1kpVyz6co1UROFyl3MSq+4CsKsHhEOTabXu92mMN8Jklr4Tz9tzY1PZhVbDL1Wcgy1BOdOTYxpYMKGfqKVo8CwvLlzjmJl22l2kQRqJfJS8WFIz2OSMX0MZMi745wq1LOc3+I0/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Ycoa4NbQ; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=UFaynvRS; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J4SO8w775079;
	Mon, 19 Jan 2026 08:16:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=r49JQFp9KZFT2+Rqwz6jl9xV
	eaowtlUbM+7AQnMzOn8=; b=Ycoa4NbQlEHdLSLfm5kPYhdcTo42adoT2f9BrhOO
	CWFjUKcyqVmvlL4jcMLOnPwG8/AmFyOzIwnATprUo30EpvXPVWHXyh/Vdn8Gc32c
	J29zp1uyjs6DHZ+fIWDXqQPgyD5KpBvkiS+p8OG9k+P8S5S0Dh2E8JLMsRtuQ55M
	PsXtyszg3bWxnIwY9o3RkelkbxKZnbaON03osE3gCJVWPLFP60CahwdPJlk0ocFK
	buf9TLMv9EE7JkN4IVg5sIjmzDs9vBauqNNikP1nnIL9uv3pgoKqo591qudlSBuR
	N7xKFUNFIXZ8VLZbeynfraj0exY5VyjnP63bibZI8wy32w==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11023107.outbound.protection.outlook.com [52.101.72.107])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4bqync9k5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 08:16:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+70jgRx1EgJDJuYGgUlB7DKnRgrRkjJ5BI/F/+NdfdDq2G4xbs+xL3GDUfizFpBx7WSUZUv56UbDwwlS2wcbNt4cGwQK+zd99VrphnWQoCO+1+yw7Kh3ldNMoJWLgHGhDf64LvchYHI9XD7HAkJvzuZgmds3RMIU6LObavtvvAOlyyHqgG2ExXlok/X/80FUgESZuZjzGbVb7Z+LcuIuWlLcdC4/8ZtIlH7YiU28bweSaGCivnV/vTXJMgA+pPH8e0r48RxfnAFqbgHzwV1aYw7/M9CyipzH6zefqOKaZ1YN+cH2YbhXEFwGpSpgywZRDcoQwtKjmzM+04FkHRozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r49JQFp9KZFT2+Rqwz6jl9xVeaowtlUbM+7AQnMzOn8=;
 b=qMarOp2EZgc04Nce2PrgNqUVgCUJXE1K6u1ljCh2hSU4AsFmHzN/gJsQ/YhuVIoFdJKpKUKe8cP6Wj3yUWvX09MtPvJXTW0Rkqf7HTkePLNWWLcZZ6Kv4U2Cz+vsPHEP8VhCMusrL/I0DVB6r7fxsONGCypGxLC6MWSX9agrhYxL8KV0pAjYApQyHiUDNXqDHQ5e1ZRqUpwmb+DxeRBzvW21HnsFw0IC3B/sHVqwZJoh88OZtQPn80A8LMAIdUjqsuQjmgbNW5zV4TfBtI8KqmRqN3yRWftcxHLZsUrNfD0Oel91lv5PrvUvjbm/PXUHma7Qwm5KyJRjAdoIfda7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r49JQFp9KZFT2+Rqwz6jl9xVeaowtlUbM+7AQnMzOn8=;
 b=UFaynvRSjcbCaBTxVusC4pgSus1YmqiJV7cWpTolYC6ag9oDkj316r5+k9HtpPfzdaUvDI0Cq817tu5710nAH1kQ3ANxM5YbcujTG2prTCO2jzvhnRpdRqSG73JGX33bHy88HFjbGG968TzB6VnQEWoLv2PnklCEwD1aVXVSLBc=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB9P192MB2030.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 07:16:32 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9499.005; Mon, 19 Jan 2026
 07:16:32 +0000
Date: Mon, 19 Jan 2026 08:16:26 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usb: Error while assigning device slot ID
Message-ID: <aW3aSrF-ZNk3FKSU@FUE-ALEWI-WINX>
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
 <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
 <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
 <b8947ce6-8e34-45fa-aaa9-262ac1232bcf@linux.intel.com>
 <aTkvyXSs6_lChFdr@FUE-ALEWI-WINX>
 <52ccfa26-4dc7-4832-8f73-ead5d6c3629f@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ccfa26-4dc7-4832-8f73-ead5d6c3629f@linux.intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::7) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB9P192MB2030:EE_
X-MS-Office365-Filtering-Correlation-Id: 555d1e6e-ca73-4661-3b53-08de572aac73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vTq1aNFfmRMhfmUtlLyeNcNt6k6Ux9iSDeUkeDYo2f5JIJtMgpH/x0UTaENm?=
 =?us-ascii?Q?UG4OoI8+JwoJaN+FNiBDax13eUTI49zQHRyRIdizXVkwj1VdHE7M/yjk5lcL?=
 =?us-ascii?Q?NSIrIk92JkGKgDWsH5dpRZMSJlHMsfz9+NDF8u7kZz7tpzh75VglDZdDh7vX?=
 =?us-ascii?Q?gURjtL2gj0q5fhWmtVpaitguU9pJg+yeTs3u4gYAmEP75OgV6HQ3o61wl9ET?=
 =?us-ascii?Q?aM4Trm7xZHmxo4FPOfUASCaDGr91pSoIfARohMfToFi6sRXZ47Zm7C8WsHf8?=
 =?us-ascii?Q?C2CbQD05j7mN4SL+bZ4+tYUEZJsB+9VMfZyBu0iFanLfL4bsUCJDZJvAslNz?=
 =?us-ascii?Q?cF2SmQOVHJKp0YQLKK4+97LQ3G7awYXXF4fnXUeSZvJVvK4dt0uhDtFXW/5O?=
 =?us-ascii?Q?6Jn8WJNSpYNmeUrurbumFQMG+XOPYmPbg5Tgtdnox07pNE5xVstN9OIAowiQ?=
 =?us-ascii?Q?jZQHDn2TFbdmFWmTNOOQI4MVZD7VIkKBYfB6KNI2xUH9EBSyPKj5dxkDqDZt?=
 =?us-ascii?Q?shEgjHyI2zBO/eLoEK0v2HU2D+2LYQDiUPQSa3d34+kdcCPAHFeyDjSiLcRz?=
 =?us-ascii?Q?uASn4/19N3g1leJQmvTjbb5egBo3+weSNftjyJlEQf1i+0Twq8vLhoL8QZDI?=
 =?us-ascii?Q?WAjfux/9+iKWG8cgWHpJ3w3iomOGvWGAZfByFNfZxQH6b8wZFr27dPPuUFs4?=
 =?us-ascii?Q?6+XKabCJvG31MoBj7brHiZ0O9FeApD21mq9eWkzNdBkV9c9Xfh9wGCqeusUs?=
 =?us-ascii?Q?/nTnKh2++mKw0CAb+ikGeU84cVUQOXYDuhBucH+/wNzmuNudKjv0eGEjg3Av?=
 =?us-ascii?Q?69XA8lgO7l5a+hrnzy/E4mEyieD5xdYw2hyEiBzGJzU7Ev/TVaSef+VGk1TC?=
 =?us-ascii?Q?GNYW9/al0ZKYFcwvJlfw9a5si4VLHq9/OSRzMcyE/GXmsfzHQhNrGl/pK5mi?=
 =?us-ascii?Q?Ts3lMTgRWtv2Gm6FuTf3jjautktV29IIsMNyDdRuGB+/MWA1iPVXJ1gHaNi6?=
 =?us-ascii?Q?IbARhgI3MzZYlYIlYYTaAc+sshVcWziY5Sc4BauaHZPO+2JHPPosGr0GQh2x?=
 =?us-ascii?Q?XpozK4f1g89RCvo5L/6BLKrVG2TegZEgmeOvr2+Khx2JtQ6ApWNNr5nnQERP?=
 =?us-ascii?Q?MBPvGDR5aePHF1MDLggLlSh4dJ+idyG4G5rrQFUgMWWB6RNBefZkl6bdD1ph?=
 =?us-ascii?Q?MIQNPj6q2Jo7ccnUncNP58UL11reg9eQv31Or1I19AY8vhKTQE/B5RagElpj?=
 =?us-ascii?Q?ScLXdjRJHpegO5ivUmMv66YrID2w0SbqimZ5MiarqXX2p+O+PZEIBw5xvCfm?=
 =?us-ascii?Q?vbE3Ilu5TSsfkwBMgCghwG5wxd5tOsSDEXLqCITbWI5zTas5DAsIgdM5rBhS?=
 =?us-ascii?Q?ky63HQ67uMRjdfD+2KXi+AXiIyl8fn909KQTGGnkkeM1+EGyoTXKq++Hn089?=
 =?us-ascii?Q?B8kBXd9wjQ2+fMQ/c4wz7o/CUf786WCjxajwtXUsFIbJifaa+PLz2hDR7Y6x?=
 =?us-ascii?Q?neIcuw/sVQUELxznstfSF5PzqxvKuu2vFglc+4DTx1Ze3gfuAYRE1O3VmB2z?=
 =?us-ascii?Q?lZUX75/IMBlgq5yFqsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPL9Lij7kT3nMqGyPxIsOxCD7gGYIP6l3y0CVrfL7R2VQSKYwKhMWL50jngq?=
 =?us-ascii?Q?zC5lGpJzwSLLvC4G5TFui8O2RiG7vdcwbCKJ2I/wTSx1jIpS0vzZFcom6QE5?=
 =?us-ascii?Q?u5znGpb+6n3E/h/ZkG+4mTPGYVZpl4apFVU3y9fI3X8bUTs05HokqO8QfTuk?=
 =?us-ascii?Q?bHi2cDVZzYw8bVapcNqapPrmv893CsRzRePyMc2gQW3MSq4DNguCVWw0xFV1?=
 =?us-ascii?Q?HeFnR3DTk9JxRf2aY6gboLKJK59vIOhZizG2Wk/0cAX4mIhYE5GSc+bLqo9u?=
 =?us-ascii?Q?bFINEcsS4l/+Zvh3e/tqcII26Y/j/bI68JlL40syeaax9BDx3bT9SyxVvugC?=
 =?us-ascii?Q?xoaxYLkOVRXohw4tkDtwKMSv7S2q6Pi+GTtw59uj43u4u/eNfAtoZZFB+lqA?=
 =?us-ascii?Q?cqzWB/9dyX+xh7MckBgLFTXYyzeYhxb6pglUPxK7WuZMfG3ejRmdu+tWhanu?=
 =?us-ascii?Q?suRqdRtCcyTGQTwqEV3Bs0iHHTC4xrBTIgqO5yzNRfiEDdXVKRsCQRetbLJk?=
 =?us-ascii?Q?pM+qm0ytJV9HwlVDCZ8zb/c6/Il504atVh204W3/Ao7x6/FMdjSCRrtihNMP?=
 =?us-ascii?Q?zFgln9PffXedm+zBUd4ava/bnP5MgdRV9q33zTaKq+EhS613WwHTREniTUBy?=
 =?us-ascii?Q?329dfB0kca0wT2uwe3wrs//HsqBOqwQgzKSmXOB96JUsxMysRmKlRx5uYtip?=
 =?us-ascii?Q?Z0YPz8WbSTjH3qCQnp2qA0gLgTPBZ19RjhZXUsg0NFgQRPyVPaMBenTNNy3r?=
 =?us-ascii?Q?xpRUi077Q/FgxtiX7u6otpB4Suh2IXHzHeB3zRToZaZsGq9zQcHS/EiCqPyx?=
 =?us-ascii?Q?uNFpnfdQvFAmnttgpYXq4D6BV2A2aUdDOVcA1qt1UCF9wQAsetm9PZsX9S/d?=
 =?us-ascii?Q?WtdfEojYOzQSOt5CwliePoEkRil+f0aglLm5OkOIYV9eXQo+cMrd0tLLBqSZ?=
 =?us-ascii?Q?gSMTNDWPrF0QZXvL/eVHqR4YIi0QCbX583xyTNG5Uu3sqO2JAXIj0/REcyD8?=
 =?us-ascii?Q?/BDIfugeHsAyx6vRjbafDniuMvZTUGwLI+FEwKCslZbkP3EC51VD78S0ExBD?=
 =?us-ascii?Q?h9edrIx1keIUbeUGOaDXoNirhG0MYXW5RohMCOq5yit6253bXXVI2NKrb8y+?=
 =?us-ascii?Q?c+t/gqrU8aIKMRxB88pHsBKt11x7dveMapEeDtRJByX2GWV5PHxGCGjX1fP2?=
 =?us-ascii?Q?K0iUxs7OZ5eJS198Ow0W1TL9l0KfoYudB275ME+sU8H8wgqng3DgQpOmiwSL?=
 =?us-ascii?Q?FjJswtDKIm34x44Ue7uq7daH9H6GyCEFa3FZa4re7DP++2T2ABrqADrKTHde?=
 =?us-ascii?Q?pECoqPbWof1aNUxHHw117E36hcg+ujZIZD/6a7NFN43SajTKYko2ai2QpSgM?=
 =?us-ascii?Q?RK6lYFc8SD7wQ00Ks1Ez0vlr8VaUnnqRWwWoXv3rZ/w+w9tYoHl7GsMTecYE?=
 =?us-ascii?Q?sjboll5mn25f2EyM3kPXqKNGlD7dIWV/AHfckNo4ECdE+rKvXRQFjf1uMr8u?=
 =?us-ascii?Q?pHvsLshUHG2uCaIVhHTyBCeEQ2/c6kSf54Br5jwmFglLAou06CDEYAedLqkv?=
 =?us-ascii?Q?ubm/M1/KarOgVedO55pGpN74U2gx7kkDJ7Vqwxbr/4b9/bm2JYT1hk8Bswkn?=
 =?us-ascii?Q?qyZ7buw5kPDFPS0+68xDRPnvq8MIxzgmo/eRyuyWlACBSl+job6b5a5nDntn?=
 =?us-ascii?Q?sNHbOYboHwhJNrYhTJPc5sAZun+BR5L0+Za6fUzZHNk7DQlN4iXVKnZYVo+4?=
 =?us-ascii?Q?jWVDLyDhfA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cFVOv7LewE5cfZHKEvF4qKz2dWhFNWt4p/Sr4iTWxPhuoPCQ4czy9flAzX4AWvBjhobvKiikbwrARGOGxS6xnA9Bk5iPVQ5tp9AI99g20LvQPQvjPwlU+OeLAdRgqzp8CpC8fxbXYZSK+D/drYf11FZgNqRElXw2YulfIPTNjMHhGqSLW8vrQcydn12vQwQMgN3FUx6EWQVOSshNfakMwriA1p89Uwj6hSP+0aaqqOL5EhdihUzUsA/Th2/vLlWaBuJ39RJMGKQIPOPz3qTEb6V56X81ReEECghIdDz9uFine5rRw/4jW6YMvz9gqEJ6ZBIvuqWAzSMr0Qva3iPoquyOq4pisNdwcMzzegCbitCF2iCCT0SeCwDnOgU2yQajO/d0PLJajl1L7VZ5OUwAS9BE1gk/bEc5aISBVwdACNFrv0J320Ydg4g1fhqs9eQVkn50sDG6yMLTmp5C2LqHkFm/UjDO+ZT3g8WWBbkMSruIkBg7atJpspDTtyvOlYMtzMndb+tyeoVbsRPrf9MClhrnbXPdyYBdxRpvSeyWoMn/9CRYIhA6zFYVLuau5ptNzwUEUWjEhkZgqJkQvL89acKf19aLJjUsgi9Aua4egiCce9V866YysQpUaAO+qrFH
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555d1e6e-ca73-4661-3b53-08de572aac73
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:16:32.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpr0A+SKAYYAPjn6vTFcZZU81ww96xwQRwWSKybK2CgLMdk+3u8C6aekp3cowvxSUKo+PXIAbhYCRDpmRGFVCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB2030
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DB9P192MB2030.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: hoBy-Q9U78I_MY_M4VfkBFJyFZkywej-
X-Authority-Analysis: v=2.4 cv=PabyRyhd c=1 sm=1 tr=0 ts=696dda53 cx=c_pps
 a=oTgmz5M7iGHgK5AbJqr3ow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9WPMMlLBqVzNTA71IeoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: hoBy-Q9U78I_MY_M4VfkBFJyFZkywej-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1OSBTYWx0ZWRfX4ZP4Uz7K4YFS
 XoKxZsvMC1/dX8jbguCRfdKC95KU9DWFKQImlAvS/xlJi+mhZMXrZwRTRAr7MjTIdpEmWvs+gNo
 1G210W35nXtBjQXTOQj2iMKicCKmJ41QdDzLvcWQth8cGzWdcNDuJiSlF+eyF85ZnawJZqzc8IN
 /KaY71vW1FY3H9eBSrUcCL1VgblSvt9/XE6GG7rQZzw36kwY7qEyHtqeZvTTKcnbmMTA+qsI94L
 6cXL3NKdZPk1Exaj3Ez4euZs7ETf/0WVgbb20hoA6b6vsz6nqsplL+JTCY7wfojhVRpLBQZAUTL
 4M1CdDkHMg51MxqB85FvCQQVcx4+r+5B3Set3nkBEreaHmiGcKTvm8hVyks12cv4T4bhI/cFeUg
 sdL5jx3i/OLMEtTQZ+jMa0YZbqveHWoVN3eNhQSWImLQuTRc2RVP+OJXRlgrbWUcA635R6WRXaA
 1OfVhkGlFYmyqthcACA==

On Mon, Dec 15, 2025 at 01:40:08PM +0200, Mathias Nyman wrote:
> On 12/10/25 10:31, Alexander Wilhelm wrote:
> > > Flash driver appears as a Full-Speed device. Is this correct?
> > 
> > Yes, that's right.
> > 
> > > Does it work if you boot without the drive and then connect it later?
> > 
> > If I do so, nothing happens and I see nothing in logread, too.
> > 
> > [...]
> > > Could you add xhci tracing, and dump the command and event rings after timeout?
> > 
> > Sure, here are the commands and their respective output:
> > 
> >      # tracer: nop
> >      #
> >      # entries-in-buffer/entries-written: 103/103   #P:4
> >      #
> >      #                                _-----=> irqs-off/BH-disabled
> >      #                               / _----=> need-resched
> >      #                              | / _---=> hardirq/softirq
> >      #                              || / _--=> preempt-depth
> >      #                              ||| / _-=> migrate-disable
> >      #                              |||| /     delay
> >      #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> >      #              | |         |   |||||     |         |
> >              modprobe-20491   [001] .N...   242.678069: xhci_dbg_init: // Device context base array address = 0x0x00000000813f1000 (DMA), 000000006440d11f (virt)
> >              modprobe-20491   [001] .N...   242.678079: xhci_ring_alloc: CMD 0000000099949093: enq 0x0000000086616000(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
> >              modprobe-20491   [001] .N...   242.678085: xhci_dbg_init: Allocated command ring at 0000000099949093
> >              modprobe-20491   [001] .N...   242.678090: xhci_dbg_init: First segment DMA is 0x0x0000000086616000
> >              modprobe-20491   [001] .N...   242.678095: xhci_dbg_init: // Setting command ring address to 0x0000000086616001
> >              modprobe-20491   [001] .N...   242.678101: xhci_dbg_init: // Doorbell array is located at offset 0x480 from cap regs base addr
> >              modprobe-20491   [001] .N...   242.678106: xhci_dbg_init: Allocating primary event ring
> >              modprobe-20491   [001] .N...   242.678111: xhci_ring_alloc: EVENT 0000000069cb484c: enq 0x000000009dd65000(0x000000009dd65000) deq 0x000000009dd65000(0x000000009dd65000) segs 2 stream 0 bounce 0 cycle 1
> >              modprobe-20491   [001] .N...   242.678118: xhci_dbg_init: // Write event ring dequeue pointer, preserving EHB bit
> >              modprobe-20491   [001] .N...   242.678199: xhci_dbg_init: xhci_run
> >              modprobe-20491   [001] .N...   242.678204: xhci_dbg_init: ERST deq = 64'h9dd65000
> >              modprobe-20491   [001] dN...   242.678318: xhci_dbg_init: // Turn on HC, cmd = 0x5.
> >           kworker/1:1-54      [001] d....   242.695620: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> >           kworker/1:3-20526   [001] d....   242.699424: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: CSC Wake:
> >           kworker/1:2-82      [001] d....   242.699445: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> >           kworker/1:0-21      [001] d....   242.775417: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> >           kworker/1:0-21      [001] d....   242.779413: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> >           kworker/1:0-21      [001] d....   242.783420: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> >           kworker/1:0-21      [001] d....   242.803419: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake:
> >           kworker/1:0-21      [001] d....   242.803448: xhci_queue_trb: CMD: Enable Slot Command: flags C
> >           kworker/1:0-21      [001] d....   242.803449: xhci_inc_enq: CMD 0000000099949093: enq 0x0000000086616010(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
> >           kworker/1:0-21      [001] d....   242.803455: xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
> > 
> 
> Command ring is at 0x0000000086616000, crcr register is set correctly, cycle is set to 1
> Event ring is at 0x000000009dd65000
> 
> Driver correctly writes the command to command ring at 0x0000000086616001
> 
> > even-ring/trbs:
> > 
> >      0x000000009dd65000: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
> >      0x000000009dd65010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
> > 
> > command-ring/trbs:
> > 
> >      0x0000000086616000: Enable Slot Command: flags C
> >      0x0000000086616010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
> 
> > 
> > It seems like the TRBS output here is not very useful, is it?
> 
> 
> It shows the enable slot command was correctly queued to the command ring at 0x86616000,
> but xHC controller didn't process it at all as event ring is empty.
> 
> It behaves as if xHC isn't really running at all.
> portsc registers can show port status (connect) even if xHC isn't running.
> 
> I guess next step would be to bisect this and find the offending commit

Hi Mathias,

It unfortunately took a while to identify the faulty commit with the
bisect, because many commits on the master branch did not boot on my
platform. I used the `stable` kernel repository and narrowed it down to the
following commit:

    136975c33894e7b48a6007af0f4c25f423bbd1de
    arm64: dts: ls1046a: make dma-coherent global to the SoC

As it turns out, the problem was not directly related to the USB subsystem,
but rather to the DMA changes on the Layerscape platform. When I revert
this commit, USB works perfectly on my system. I have now CC'ed the
`linux-arm-kernel` mailing list as well. Maybe someone has seen a similar
issue and could provide some guidance.


Best regards
Alexander Wilhelm

