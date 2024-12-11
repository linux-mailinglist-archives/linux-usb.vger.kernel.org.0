Return-Path: <linux-usb+bounces-18391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 681779ECB7F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 12:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE029188AC67
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B21B211A04;
	Wed, 11 Dec 2024 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RM/7z92W"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2059.outbound.protection.outlook.com [40.107.105.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73175238E27
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917420; cv=fail; b=XqAyv7ZSL9ylzskx+9fdr/fWYBlhQxqr+w3c3/La/RMRVAHtmPTSKpEuEBF3olWXsxRG9zQElqqBl/DVL/jw55YzLh1JmD+EnTtelCf1qDrICfESiFgmKfLafloDoiAeEdHiYfJUvp7VcAbq3Yo/J9uIMM9dswNFr2vtCVGN/3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917420; c=relaxed/simple;
	bh=WTdH6F44E/o4JGOwtMJJtXoImjSt0GKa7c6Fa883cCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mKEsqFC34ZbYzwVSZ7yJSpOkN03ySSgqC3mA/0YLwvje3ve+B6scqNfLcJ44zwSH2JH04KkO2AvCTpS51takqpI9SMvLfFbAlBSoaqgi9zJ4muYViAmayMif7BK8T8OYrwGpmPCfFbdG2VoOoNt5iRnpRC50J4EaZ9IZ0RPy2yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RM/7z92W; arc=fail smtp.client-ip=40.107.105.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGHLyJD9Ev0oyszdysMvCIGTM2a0bFyfM1VqbGtAC3rzJth6VjwV78VvvMJHF7ATCLamxudgEdbBjiBn8Nzch8M7HQBFPljmL/T10ciMAGm/mMJd090oxBCz4En4TRczsFhU6riZ0wGqUqaqyZromzjFBwSk8vJw5vQ39PstwWRnXDXOUdvYh4S+F8XxbuxMvGUEh/PzymG6psw4CsC0d/pc/3SFm1NGry2TySR/EH1TQl96wOP1Yd2uD9D5eo2FQxYkfXb2Z/nBGVaXM966o43RWDS/FyniUqbF8oq/3otllsg53Le4BZwakuMV4AVGLvzceutXWTk5nfqNsSGyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfN4D2XBEq3Hto8WGUrRqiUM/g2Y6eJxudjdmyCpAnw=;
 b=IWEhPx9KKIzCsITFUU27o885hN+yDXA69UZWmzwoSWuesskA9KqjA7Lx2itiAhR7m4R7rMt9nXbzWFuUIZmddF8dT0FS+yEW4WXjMdWL04ShfVsBZM/WTfUYTzBquM0oyekK7J6HaXb2egNZ4eyI/xBxeGy6vmvcfDfcd80rgQmevQNkh2TicQ7NFdRLo6QZTYm99brFk4i7bbGjXsuFfWj6GVklY3glHtF6hVINgS6ZTQN6dnuiGDgr5sOaZ5JjBN1uXju6ZZKl8ZdIO21J2cTCElmn+3AB/USgfN1zgvPSh1QIhQj3959IGttXM/FzmOH44LHCeEk1C1pq+JH3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfN4D2XBEq3Hto8WGUrRqiUM/g2Y6eJxudjdmyCpAnw=;
 b=RM/7z92W8PzW80AihXBKsZOCkmiTdN7MSWZD8O1cAZrOlRDtwLgiNmagRo+UgS3xfSRMIi5jR5eNFlDRJTsTYa4wnMBYfcuNMB1g6XbYP/j1U7BzsZCfQrlSa8HsV3tlovwfvlAwZyJ9px1ziobflxCakS5/6vbHEvaKhknYg4o5dvW364VKgKS0ixDU2ctrTsFwVuOfA+QTAfnr+WeEe2aANqDgsOyPcHslsG3YFfNKTH6XBD/QS5U0M0wrwcnaH4Chbsl5WjRAFQuLpJ+yEJt+AI3jB1lb+sSOG64zP13BxBdSyaaPcmDknJdLAX9lEK9tl96dcYZzjVgTB3CmrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6932.eurprd04.prod.outlook.com (2603:10a6:208:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 11:43:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 11:43:34 +0000
Date: Wed, 11 Dec 2024 19:40:51 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq
 case
Message-ID: <20241211114006.ebrut7rvmixznc22@hippo>
References: <20241211105953.1205343-1-xu.yang_2@nxp.com>
 <20241211110928.GA25492@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211110928.GA25492@francesco-nb>
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: ba71cbde-b12c-4d69-28ee-08dd19d90b00
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/vamXWdBDWs1xGqPmjkAYjo116ZHYQWHVlK/8aRdbjlDNG4ADP88zyS+X8a9?=
 =?us-ascii?Q?NZuyB5lyPQQ0TjONehNNIKQYzjYIJYvWldNN8u5l+wT/LW3mSv1jqeQwtxhd?=
 =?us-ascii?Q?gGiICa534YcwHt3AF1SlY5eYOMqGng6mYSNHh9200inokj5t1N4JtOPcf3Ie?=
 =?us-ascii?Q?FQ3hNsQHdgUJOI0A0fLblenVW79kedSqUh3WVs+1yFwSon5AOnmgxX0vhlKc?=
 =?us-ascii?Q?q7UK4Z1rC4IlVi0K0XYWKgmf9gT3FtpZ9Puf4ftfE2SXPfUjlnj+EYstOa5C?=
 =?us-ascii?Q?cmekKXV68uVQ+/TYqp18FOEBopMQNpBYGNRIoZYxzhRwC5rXjqc2HAQod1YR?=
 =?us-ascii?Q?NfEpuwPgLpkxaJBGRFC+ZYRWGQ31TMbljg6XLb7SBe7OYouSfyJZQnXqIST+?=
 =?us-ascii?Q?48TQsW5rxam/URrlNQlSZqrjgufr1HdQW1XrGtnUvtDMjRyQ96D2sm/Owo0b?=
 =?us-ascii?Q?0o8LkfYwiVdHSpPoUO8MWHaT6mSHQpbZbu/+2EhFYWQ+qEeHmzxeoKSwRpBk?=
 =?us-ascii?Q?eqsk70QKkvmIysBTbK1D0nrSxrCnT6pDjegPItg+c4sAA77ohDVSpgAa6r35?=
 =?us-ascii?Q?0BveJcme8tYZhOS92Xsryp8SUJwuNEW165hNtxfpcIvdz1cEl1pNYA3Ztsc5?=
 =?us-ascii?Q?HZhGrIpRjLSoNBSS/ExEuojzA0qhXkmUQUwEi6/eYfbLtyscH+AQFac7BPpY?=
 =?us-ascii?Q?va7nEXa4IUBEy/0/SeIjq5I0Ao0wZU5Bc4h9Bx/E+h6Tj/M3FVRZcxIm+w9J?=
 =?us-ascii?Q?bKxnldkR6J0AEj6kqQKXBLvMpN+ts1uUsE0fi5mOyPwzgMboDKvRBCXpXR7h?=
 =?us-ascii?Q?fnrel9bfrYSBeRVeK9GOFzU/t7rXjLsphENUCuSIJ9oTzjtp2NyhODD/sEv7?=
 =?us-ascii?Q?Be9B9VxxjMPT1ncZAsE3F8qTioNruT+x2Rz8Ot/XmSFyt+GEkPH2zVIwHLs8?=
 =?us-ascii?Q?EOIkvLZZdzkC6yXivKAwcOgWO2Aj1D8BeUFD8PBW2hJhZqsCiN2q3EaiCnY4?=
 =?us-ascii?Q?DUr5g3ax7wYB3zz6lbKNrswP1CGsWkvPUF/J3v/FX63GJR6LLXIfS5WJvYOv?=
 =?us-ascii?Q?/sW/8z4kU+MQ6O9JDgvd/2eNIKT8FXFI3R2tSgY+8ZPkJcnrAKxRSURlYL5R?=
 =?us-ascii?Q?ZOTQOiXzUONgbMcAWxGGrVZqY5lliNiAUxgZwP7K3k1lpT4PxiRpDu8/n/Uv?=
 =?us-ascii?Q?QcgE0VZRK6cRottQv5949qB5MW7+5zJR1BRMfkhFFrIOy+jFAdwDBkzmugAr?=
 =?us-ascii?Q?gTx2YH6LBR++wZZnWcXXOdBU6n3iMrJPlojh6/yGyDOTSKZpkjASR+M7yC3e?=
 =?us-ascii?Q?+GF6BRzlXemxIwBZpOCl6jETeiuKcB7BbUI/rG5Ty8aFq3zR/h4YOYdDMNGk?=
 =?us-ascii?Q?eNz2XpEK+7d8Kml1lMjsKhZb2b8nOWxF753wko26jAXo/y3vmg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oxzmOgQpgLzPU93mXophwKj9lneovwzKmHljaaNptMcLMyXTMpcR56UI02Og?=
 =?us-ascii?Q?OCOOtZzDl3jzm8R/bZqKPNQ+DpL5LjVAGOS1H3sewDP3v+/xXJHvmW5PH9xk?=
 =?us-ascii?Q?pZMFqlq9l67bgOotz6UdHy90/RYFWIvAIIlPMIEQzR2kS47uQiWykDeXzmIi?=
 =?us-ascii?Q?WXcWuuCbNX4jBpGVqCUxrdeq9oM3ypqe+RuWcSenEAAPqOs0LPdQV6MpBv/P?=
 =?us-ascii?Q?1iI5t/GD1UK9gxX6wZo4+a0wFhm4faxnRZyOTxdsNKz5RSU2Q+Q3933CSnyD?=
 =?us-ascii?Q?flhVF3S8mKsHzy0XyTkIAQcjycphyj1t3BK4gzRnHPdJf+I6FjK5Klk8xUa0?=
 =?us-ascii?Q?Zi1fgndKYof3EB8GnG8Te8OC0syZPuKpFnic9ymzXAWRMJ3PnC/GD9r5fnC+?=
 =?us-ascii?Q?34Nm+6AEFTHgiPPpPUIb9senqOWb0f0zip1R1VFJdiZUBiJ2o+N0/4/j45v2?=
 =?us-ascii?Q?6yVZ0ltJXKSlnN5CrbbxWJqEEktA/VxNOnVhJENljRhqU8LurhBEcxL/QnjB?=
 =?us-ascii?Q?hpeK7dyIQSwmdS/1g0gWXSzAIeBFlPLa0qDWNUoxpsYj27ra9IWvT7Taudzf?=
 =?us-ascii?Q?Bb8eZdqxvmPFoPcItCgFs7Os0lpUajwVJjF5nkPb343+JU15rkS1rvGrEOmx?=
 =?us-ascii?Q?2AtUvwayhaG4Vtu4F238TBtqyKFKlnzkt3/HKzQqaK9hsTpeSVmfVnWKwmhY?=
 =?us-ascii?Q?s6BjdNn6Sj70u3OtqCwcDL9Gwy8zc/05KXoYEPRURAAzk9VoPdCVG++Nk25/?=
 =?us-ascii?Q?GMtnATt5F8R1fzxPmUgIYC7wQRy/k2NRwUNi9oe5HxQknr8k82aP1QNI2TN/?=
 =?us-ascii?Q?Utuo5YerK1cOb9P+Rd2XmxHxgdQbYgYNkICzLWUebwdxarCtZhEuF74Pwp5y?=
 =?us-ascii?Q?qZJGp5iLlNHMTlx0oUERVF0SyCXcNX4K20XyqXX/MNoUFPHj4G44AE9pUytA?=
 =?us-ascii?Q?ZdLk7HpynMIjDXTVyq0a3dbKspOAeFuo5bBSZbT6euvvY2Rd5CDKvcTyw6az?=
 =?us-ascii?Q?e9uIHi0M8JjbzhpD4/CQyiiDVUOA3S6tzbYA55oYNlEECy0cz2EyYNeWx6zv?=
 =?us-ascii?Q?q86zvXTRHq6MV/BQDs/q91FuF9koUQ9EBNZk9r89ANiq3BOw8J5uPw0T1wk4?=
 =?us-ascii?Q?9PLwn/rxSBe2AKZHxp9C3KLxm15LM04TTrYS6UOjkAXkNTyMZsFO8FEilEYO?=
 =?us-ascii?Q?4N5RxnGmP781jn0l0LEiYYhJRJH56jS01Ex+mUGof57+V0Ryrfl83l5UqH+n?=
 =?us-ascii?Q?fD2QTjSceRx+RJT89KeJOtzkdqeXU2wnKRNMbYzLHH+0EKk/QjedpQ9x+8SQ?=
 =?us-ascii?Q?6oVPXVbBG/UWfaTyhsQ24sJc2fc3QOdg/a9rBUcUmnOyPTyfWQG4lNT79m5y?=
 =?us-ascii?Q?yefZLK14U6ACfB1OzIXxKZ2DUxfMvuVoxY4naJDJBUBzx634ZSNYBN4NOXjn?=
 =?us-ascii?Q?UalYoPrKm/spL2sV0inKE7XUHUTNeZEDWVJ6bPPPvkA6o1yi0QjEsV6O3/xy?=
 =?us-ascii?Q?mbx6omODf2/lRtUjKVG/XzozgBghW4ny1vBstJuq3UMZDDUXD8eCKswNBcFn?=
 =?us-ascii?Q?L8JxoCtx9AN74jmSPn8796z2dFMu5v006VAcJuDF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba71cbde-b12c-4d69-28ee-08dd19d90b00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 11:43:34.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH5k+jd7PwbFnMs0WpsXd0J6qO6X8bg6KyCT1ciZu5D4jsXMS66Fs4qFwKBrj+J5rp+HH2fW3hGoUFVvQxVDtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6932

On Wed, Dec 11, 2024 at 12:09:28PM +0100, Francesco Dolcini wrote:
> Hello,
> 
> On Wed, Dec 11, 2024 at 06:59:53PM +0800, Xu Yang wrote:
> > The tcpci_irq() may meet below NULL pointer dereference issue:
> > 
> > [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> > [    2.641951] status 0x1, 0x37f
> > [    2.650659] Mem abort info:
> > [    2.656490]   ESR = 0x0000000096000004
> > [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    2.665532]   SET = 0, FnV = 0
> > [    2.668579]   EA = 0, S1PTW = 0
> > [    2.671715]   FSC = 0x04: level 0 translation fault
> > [    2.676584] Data abort info:
> > [    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > [    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [    2.695284] [0000000000000010] user address but active_mm is swapper
> > [    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > [    2.707883] Modules linked in:
> > [    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
> > [    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> > [    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    2.732989] pc : tcpci_irq+0x38/0x318
> > [    2.736647] lr : _tcpci_irq+0x14/0x20
> > [    2.740295] sp : ffff80008324bd30
> > [    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
> > [    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
> > [    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
> > [    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
> > [    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
> > [    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
> > [    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
> > [    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
> > [    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
> > [    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
> > [    2.814838] Call trace:
> > [    2.817273]  tcpci_irq+0x38/0x318
> > [    2.820583]  _tcpci_irq+0x14/0x20
> > [    2.823885]  irq_thread_fn+0x2c/0xa8
> > [    2.827456]  irq_thread+0x16c/0x2f4
> > [    2.830940]  kthread+0x110/0x114
> > [    2.834164]  ret_from_fork+0x10/0x20
> > [    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)
> > 
> > This may happen on shared irq case. Such as two Type-C ports share one
> > irq. After the first port finished tcpci_register_port(), it may trigger
> > interrupt. However, if the interrupt comes by chance the 2nd port finishes
> > devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
> > first. Then the above issue may happen.
> > 
> >   devm_request_threaded_irq()
> > 				<-- port1 irq comes
> >   disable_irq(client->irq);
> >   tcpci_register_port()
> > 
> > This will restore the logic to the state before commit (77e85107a771 "usb:
> > typec: tcpci: support edge irq").
> > 
> > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index 2f15734a5043..db42f4bf3632 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -923,22 +923,20 @@ static int tcpci_probe(struct i2c_client *client)
> >  
> >  	chip->data.set_orientation = err;
> >  
> > +	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> > +	if (IS_ERR(chip->tcpci))
> > +		return PTR_ERR(chip->tcpci);
> > +
> >  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> >  					_tcpci_irq,
> >  					IRQF_SHARED | IRQF_ONESHOT,
> >  					dev_name(&client->dev), chip);
> 
> I do not think this is the correct fix, what about using
> IRQF_NO_AUTOEN ? Would it solve the issue? You need to adjust also the
> disable/enable irq accordingly.

Not work. Probe failed directly.

[    2.646391] tcpci 2-0050: probe with driver tcpci failed with error -22
[    2.680086] tcpci 2-0051: probe with driver tcpci failed with error -22


