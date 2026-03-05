Return-Path: <linux-usb+bounces-34041-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLvSIScwqWnM2wAAu9opvQ
	(envelope-from <linux-usb+bounces-34041-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:26:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67B20CA16
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 763753022F74
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 07:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68852318BA6;
	Thu,  5 Mar 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bJZV+P4R"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C230FF27;
	Thu,  5 Mar 2026 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695583; cv=fail; b=FNMpcU82xPQmkmGdXPt5TOwGX1FXu+dIXkGJ1yq1P3BjpcNog8nLScjFq+mAKXZjztg90KklfZx92JYOmYzdO+1ev2oqnO5Oqa5sKmZZCvkHSXikpVbG734dSkvlJcKdtlBaMMbbNju9Rw8BzjxyRoynowoT8HRQMB8PH59pQJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695583; c=relaxed/simple;
	bh=CZNDdmgEzeWPEYKgJehFVgvWZ39aa3XfQkc7FgNuos4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCC5hMb4CHDw9v0yzY/f7NJw7+5KXZoJ72tAN/1lv1mwRPgIVlhoiXnq7jRDwv4kUzfldVEWP5trTBShCLBC6MzL/S8OksWHA0nl16yTsNyUMWxcrK0QqVieR5sABC1Px4gtSDzOYQCZdJUxwTJ0oLzQIY35W1bIFb3BmnXRp9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bJZV+P4R; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Asm02ui/67bwDfoQWO+qphwRbFWrk62kLJKB3gvWmmHWPbmdCFPhEJh96uvGjrviShnmFn15LzN5gKZaoX6yEYy22zTSn84IqFMIhI2DywYgqKD093BuqF40r/5YBOIBGf3Wh99yrQmmQVzZh3fn+2HhbJhiiw3jibEpwmiwuyeo3HBkyoDECGJvLk9ij9FWG3p6WHiftFV8XfYuDw7WEpVqGt2wE8yvhuYVQvcso8y6Muqz/fH4/ttqswspEjPn8UZOfhXVrS/o8F43iTAuP8A1xQ8VBG4Hc6Qgt21V7nF9tK1TBfVpE/AJZnylAoiRv1SldUKEiMNT4pFtMUR9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRF9jEkwT/5RVZR0cX00VEsHHHFVgLEdV4/op8o1CK8=;
 b=gvaBB1MiDVTW6S9vOd+e8FXRDwHN7Gr+A/Zv9934ZjHPypFSIwPiylrZVGGrrAWR1Yiu7OWVJW27myx+FhsrphvNL3Ul01noZY3vnxwU5AgTFGNfTLYsit0WwrTTGN6QVzQG4j3D91/BCNrPLn1228hUucy6j7hAMwAohzYq28OfpjxrrR1W0SnkfldD2fDLWfqy3x18baPTXA6YbWOM49RsCTxf9jszW0TzH+7ApwyTZCLUOmFvWmwnTL/Q3siYB/NXr5RbcD3iH6UWHD+WLD6YMvd4N6xbHF4tJGXrHqL7yfVUfENv/HrZbs0mgHeF6lwG2VLV8jrgjnwiAwZDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRF9jEkwT/5RVZR0cX00VEsHHHFVgLEdV4/op8o1CK8=;
 b=bJZV+P4R7ksbLpGQ2nOcCAwVHoIYVpYFx57O3oTgK1Bki8gXTaFTeCUPEHEr4IIsavIxMekhWffQAX4MPYsOQ/qc4LECzgx2x3fqgFnUzlid28DJKHJEmR2WIc6I0iW3hxvo9pKnoD+sAVrXp5k7lMNllIs4wshe9JesuJevbwQ7mr85G8fepNEN/f217WW0jU+wCwuVu+XHJhOj9UGFEovwSJqGvOYWQ+WrkXzXzOlq9wzYV7zVGyE4OtD9MNXK4UdBJwj1JyEXw2PrZsEBjgVPc8jE9cu+0wizU7lBG1c/jGegBpfPRcbx7S4vPP3AlI/oGWLZVzTn7a2DcqJ24Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7848.eurprd04.prod.outlook.com (2603:10a6:20b:288::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:26:19 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 07:26:19 +0000
Date: Thu, 5 Mar 2026 15:18:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@intel.com>, gregkh@linuxfoundation.org, 
	tglx@kernel.org, mingo@kernel.org, claudiu.beznea.uj@bp.renesas.com, 
	kees@kernel.org, bigeasy@linutronix.de, ulf.hansson@linaro.org, 
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
Message-ID: <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
 <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
X-ClientProxiedBy: FR4P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab0d2db-38ed-4475-48cc-08de7a8879f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	G8spS4LGvJ5HkqgexK8TeyvRGj2JT4fNJQFtQkmFWnCz0zOeuSu+kGARZm/dPEMaeBN7NAwZWA6hZu0eQWhTOPvGxt7QOVzi+kUG9x63L0qww+S1aX3qpmT/gFNDNtgy14NTwkCJ3PAB25fCpsKZV7MrKGbsCTwSHoJmTBvi3DhGwBvtfPNS6SWRdmIZT85lenYqUB98JRAZfEd+PxspvHro02cs5JEi8ncA/bxKNn1DTQhicn3dcoSKPnJVhtYtd7WDRBm5D7X0VJsqqZAVV14ULsVs87P++HTZhm+ZXu2xsB3uJDDd9orX7J2TnEzfEJIARB//tR837z+3/n7mogzfxaxYRxuX05HTBIqmQYkYz6UH9kx8wjLjQL+XUq/3+aSRFV/dGpk4Uz8L14JPRAVt62xrqGmobq8N2e2AKpx59IJ/DoftChNDcLW+zbVrlbYoK2JG166jhdgo/Bo6pCZLc4pfrDoLgjoNTL/s7r/M5O3+Ts1mIVIcv2PVovXI5xrMBLZPkCUY4ulC3PKCgqbLM2fzECiW+K8OK2GnpUEiKWrMrTfsPIVwXJKLioxmXKzJKkXefzEH16Z6FvOdZiS6N5kgVp5aMvgfrLAWYGtR7FbIB6y18Nx3+VEzE5jMtwuwA/PIT6VONVxke0QMKPVz8MuSMvr62RCVyZ1Fan+FLkuiJqUxgQ1FEGKwXT/tnDnUVr7+4Jft8QP6sCTes11297bKXYzh2o5UrkUWRHHW6g7LjglMt6i+rDejM75dx5ll4lDj0YksFPcnXN/NfmWkTAd8Aq4NhS+2GkKZfeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ty20KpgL92g34kIWeXR+vZ5r/CQIOIBnkaT1O8w/wVqJ7TEm7OiBGjtnFzTJ?=
 =?us-ascii?Q?RlPZAG4uysJezqOna7HGsF64t6gcwWZnLJlLrXgDlvYlT6OTtyl5vFbXApRt?=
 =?us-ascii?Q?mF+PzN9g75p5DmgOLMIvul0q5u28lSBItvxNFUSSA0RsBq0IuwNQB4XZunSN?=
 =?us-ascii?Q?K3mcbFL9lImxBIbxv9pmhzu0IksoB3/Ukf9JMh1FKoze7nLNAzDum21wwYzI?=
 =?us-ascii?Q?fbNniw1J6EycrbQqN/68ugEGyp8sm04SYZpUyS3jYKFcN8xHHtdAYfzRLxuZ?=
 =?us-ascii?Q?zNQ5Nxmts7m9JlaLvEa95XlxcLDc7ocGzMbTAsGM7vfxlnLMyPOgVe6j4K5x?=
 =?us-ascii?Q?aV4HvEs5XUkNc9S4hd31SCvLIDM9ErtuIqKpqf0daTAwPcRElf5hNDwOv1bR?=
 =?us-ascii?Q?N5ev/LbGbm8YtRaDtO0NbLZgGtCyp+JqfS8IQeaYUftxmNv/SNE9S9Ql+9nK?=
 =?us-ascii?Q?JGarLRFSVfeGTN5SjJYFTBU4VbfGXcZpxaFnVeHEZHN+IeW2CD/+GBJL12Jh?=
 =?us-ascii?Q?+KpWejfJP1gJnn79RteRQbGRTFGm+za+acLb5Tevff2Sxp6WV6o8mic5qOfz?=
 =?us-ascii?Q?EidEIJHftkR+0uTi6HybquqIzBvHVchPzHj7MAc5i7P0Zd9h02vjAHXJd5vr?=
 =?us-ascii?Q?fOdiTxDKpxh/1fQp+VNCoZHj4ixB2fELN0vyEPlpwuiiveP47E/nqR++N8/g?=
 =?us-ascii?Q?BG1niPen5KofnnvBtOAvtKlDJSc6odXxYasKINyQIoEd+zQiBqIQSk/gW38L?=
 =?us-ascii?Q?2gQp4WmdtAee9xOf2zfRJhmdabRZmF8089nGTgTw+u2qm6spfMUWmtk9cLmz?=
 =?us-ascii?Q?Hkwz+PuvDwx9Ss8DXcyUQU5BOLyIbw1pkRJxeqNP8FYT1Qb8r3qxes/fHoGO?=
 =?us-ascii?Q?zO9lcYZMhJzT9dFb5nalGHRJEcnn/mP8ifFu1WhBJ7JoKMpUihxtYPUVRycC?=
 =?us-ascii?Q?XMuRJNLCxvEmjbrR/YZKwLjsLPjDZpK5tsenk5cXADWvt4HuogQ71M5R+tAx?=
 =?us-ascii?Q?JD8zzzGw7Qj3XPLb+omUexiX/7dfTk3GPQmF71rMvrrYRQuBSrhmqDtDhym0?=
 =?us-ascii?Q?cpM2NyB1fhVKQaPNIKxzkCvk3jcdKbW3x8vS42ohTZxg5lFlZy7uEbJnllij?=
 =?us-ascii?Q?YYvu5iU/2dFlXNJ2leDZPtNUka0/59z2lN86ogo9G7Q6zAkPq5FGJCoB/rxy?=
 =?us-ascii?Q?sr1a5C5nA7Feru8xOOqE+hFtNYEHTwm8CUlniSALx2siRwWgydx2JiPLTGd3?=
 =?us-ascii?Q?b7W1x2FllbnAaKHYrjwp8MXiWTwJ8xo0iqTL/NGRLlzTr51pVsAc7l/X6woX?=
 =?us-ascii?Q?T7TnykQomswliA+3NHVio5GEQLzdNss38d0kdkrSuY6GxYv7tBA/m1AoD3i6?=
 =?us-ascii?Q?7/cFDtt+LC8cZ04tJ/wcyEYynm4ko4sPFpiRqnZmsLaBIWLVLQnvN8QKIcLr?=
 =?us-ascii?Q?V/K+XXZSdSO0vswQhTRDr0Za/C2aeYYfMbz2damun3sUQWf5btNWMD+3RcOX?=
 =?us-ascii?Q?hZ/L0PMDPWzsvpcfTM+9w7DeTpa57ZgWsjAD3531YSwGW0U6G6ap16zpMsVv?=
 =?us-ascii?Q?hp6OnrLfQJzNsOfB1wjGVLKJg9taQXyEFwsO+bWSpZtcsBoSdAXgLOUyWwND?=
 =?us-ascii?Q?Bu680mX143TrkwQlMefVcCrGWQKgkpNiZb6maOZ1qOLIov8t7sqjBYo7KrzL?=
 =?us-ascii?Q?6FmtOShQPlgK6PeYIqsE6wqdU5U6bJSploxMBA+m2imY/Icjkn8xX7x3jyk1?=
 =?us-ascii?Q?G9ArNx2SqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab0d2db-38ed-4475-48cc-08de7a8879f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:26:19.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBR5WAFZIwpj0RmtZzoHYOXMzPXTgCpuBjre2YjUTkQiaiGwoQYrNAhGmEW2Kgd+AOnxm9kCJiy5jW2Qqz7rZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7848
X-Rspamd-Queue-Id: ED67B20CA16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34041-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:24:09AM -0500, Alan Stern wrote:
> On Wed, Mar 04, 2026 at 07:57:29PM +0800, Xu Yang wrote:
> > After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
> > as freezable"), pm_wq workqueue will be unfreezable during system pm. This
> > brings issue as below:
> 
> ...
> 
> > The reason is if the host controller resume routine xhci_resume() call
> > usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
> > Then usb_autoresume_device() will be called and usb device will exit
> > runtime suspended state (if it was suspended before). For a hub device,
> > hub_resume()/hub_reset_resume() will be called accordingly.
> > 
> > After the host controller device system resume is finished, the root hub
> > usb device "usb1" will do system resume too. Then hub_resume() will be
> > called again.
> > 
> > Above sequence will cause hub->urb to be submitted twice. To avoid this
> > issue, restore the previous behavior by queuing wakeup_work to
> > system_freezable_wq workqueue.
> 
> I don't think this patch is an appropriate fix for the problem.  One 
> indication of this is the fact that you have not considered the reasons 
> for making the runtime PM workqueue freezable in the first place, as 
> described in the 4fb352df14de commit.

Making runtime PM workqueue freezable is to prevent runtime PM tasks from
interfering with the system PM tasks. We also don't want usb wakeup work
to affect the root hub device system resume process, right?

> 
> A better question to ask would be: Why does xhci_resume() call 
> usb_hcd_resume_root_hub()?  That does not seem like the right thing to 
> do -- at least, not in this scenario.  The proper time to resume the 
> root hub after a system sleep is when the PM core calls its resume 
> routine.

Good question, it seems like commit 79989bd4ab86 ("xhci: always resume
roothubs if xHC was reset during resume") is added to fix some issues.

I also find ohci_resume will do the same thing: a8b43c00ef06 ("USB: Fix
runtime wakeup on OHCI")

Assume the above fixes are necessary, then switch to system_freezable_wq
should be a proper fix. Because this just restores it to a previous state.
Otherwise, the fixes need to be implemented in other ways.

Thanks,
Xu Yang

