Return-Path: <linux-usb+bounces-36502-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL5wJtkT72mU5QAAu9opvQ
	(envelope-from <linux-usb+bounces-36502-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:44:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9C46E889
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8A033008D2F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2FD389105;
	Mon, 27 Apr 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BNdCPjAY"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E338238F;
	Mon, 27 Apr 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275835; cv=fail; b=kaD4EzTYiHWufPB58Zzf7bkWqHLOkiyDOU+BYNADeSApNZFm06yiaSNKPsGMySglXDaQpnGap01hKNGaiPUoTYK7uZH34V+GiVHhtOK87WQbr6eYYuMMH6FhtUqHwzubiVZLQ0eQRVEKdol6l3FXu4YRSG3b1otzO1BRcNW09es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275835; c=relaxed/simple;
	bh=o4Bs+R7QN6QD4ZQBvHWyFJo+D1K6DeutAyTtXMpuvSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VjprwjlIpK0s+A2X/+2Csv1pgr4G9Fo6xpiG9BNRrBp6FUR97RoKCOVvg6fWAQ2wove5UJClHiuTGVKWZ88AaRRXNpWQjQU3XappJv7YZeYVedsa/8Bv4uNc29MU4eUzHTcR91i3CuZICMAVS84trE/RnnzecNqrnDmiOm0hMpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BNdCPjAY; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV4SiUHuJ34kgaSfK5uUEQlDXfh99EDXcaBKVjYI0Gp2767fO/PzCc3qFNJmQlU1+nrMWR7SMqXHzngUhMfDT1IRhOIT7fz7G/fjQPiB9fyE2qDQr/LXqiHohU0V7Zze05Mw6Fiypa75izwsshmZFG0zoYJ1NRGCGJcQnK49z1XYQWkSzSXjyB7WUZyLgwydjeeI6KeHAFZ6uwzvZtn5BGgJu/F9CDeVNqGpOqz7jwaM09aNk4mdhEXlpRYi8dZvyeXEraavJBjrHrtQaznQf2LsWKAVFISh/WjIOHppxENhaCo3jBdPhT+V6KVWyRkQac8mOhmTnbPHY576pbQ5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6cMkbxXEyjDe1kHhBWlVve0ErWrIigCbrGP1uR3v80=;
 b=mNizZmLFgGxYMpU+uCoePBMVcvwewr7NwOFH8YF0eQRNdWehVm1Z8BHPbvsZaHPwetI30aJT1FoAQll4yDeaVi6wKrR5HowsiX5p9rkhAIj1nOGkjCQwZSmxJ9Rex6rnVFFnTihS1O0xJHKLk/kEXUkOBjn8bTfpW4TkjfpP/STvvHbJCgKPKjaHDxmcc/kzevollGkg9yQ/E5ekXO1UivFrfZNRmAUef1InxVZlV2RbFbtC8/mq0/8UQ+f+Ee8N+WMRN5ne6uL5omcd93MYBJMPrpdZl8WV4ylFjjAMlCNI9VvdNdn7fh6BzTTdti/I4BWcexRNUcPVH4uqUfMBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6cMkbxXEyjDe1kHhBWlVve0ErWrIigCbrGP1uR3v80=;
 b=BNdCPjAYfYeLwgwznofa/qz0hXpMkJk7qWGgUKvP7wygsiTNL6zE6ypz5brhVtIzxvai5WkrdXxmxCtjNCxjEcvn4nDoyNeEjbcs5OmRp6iTTv2wm1za5e7fmkSNrJdUmiu4j3nm3ZE0hEY3ixUHxSwzVFVHCsvZ1+5PihQJBXwcjoRY8Jftf08XVCEa2yFQeq5R82jEuY3tR+t8MzojgWLiz6aS2xxzTkxst8j87vYFkFjIdG3NlcP7YR7NOROCHvt2H+gJEkzgyvXD9+eL67s/3OgLQydFIXKHifFqsbosDFuCgOyPIZhyFeLE0LmuTc9skGdTvZljM075HQyxlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:43:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:43:50 +0000
Date: Mon, 27 Apr 2026 15:43:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 3/3] usb: chipidea: core: convert ci_role_switch to
 local variable
Message-ID: <vnkggcmla643euhgiunhdpmxepssylvb3g4o2upn236sgbfbbc@445rsbipmwro>
References: <20260423102002.2675414-1-xu.yang_2@nxp.com>
 <20260423102002.2675414-3-xu.yang_2@nxp.com>
 <2026042606-plaything-elusive-592f@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042606-plaything-elusive-592f@gregkh>
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e74085-a8a5-4a8d-abc7-08dea430b8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	cwY6li9l2VVGkCbBBILULNgY+K3QS9RE84Juuuur530/B5hawkmzZu2dEgIjRYF0X2t4A3e7sBKhL/JBmVtfPLY8pj87bk0TzceLW+OHeIeXzroVewh9C0qxqMcjv1eBcbNEYY/oqDostzuuTaJ1LDM8700EA/C/5kZ4m3PvMxtBBZBcRTrR32FjLeqL4gzm/pogAlBEAtqqvohFZHjQSxz/UlUzmE9dbayjXx+cxYftXfFwYtfw9Ns8pLR6e6PXwAj3tGTWA9BpaCsAyaaPfVZOUGWyBe6isJnHte3IMA13SxYRC9QJISjSAmmePyCQ4AdfuP8TI6OFiDHpohRNqLd25E/9WLjB1PBgEuPtwRqa6+KPkovMeEgdEi/SSeJd3RdGcYJ/dFW3EjBLcrB2S8SEkdBB1guVJHivEWWYC0U1BKbWs66J0dRZ4IZ66KyaRhClJkGCTMQdIlwYGLlMtK8Afz3iPKGtqD2yKmdEv9TfOj3AS0TQ0FOgO9i8inWeK17SryfqMSwfWy+tUrYqCEaLosG6nQe0bUUncmkVlncNH1ERpAVB1TzKZjNHLKDX+Azoag7xKELCtL029p+s5+TnZbW8MW48SUy8Rr4rC2pM1tqEvWwTom+KIZaNs4GWH0mRO3VfZx45cUhAiDHgC0x3upcJa0YN7e+u3+CfK/j592+tq539sFVpMLbDGqni9v3oTcCMUVRwJXPVQr8IfNHCnA76UM7MPVOllsL5IUdqhTQ20OliAtFiVBeYRWaOj1zXROlJtuf0ZsN8o3Krc6xZIkWA9+Hu4iwk7uAIfFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixTjH04DUBY/Xa9vvXJHergTndMtXn8IsWCQC9FMFkv0wIFDyMh9c+Rr6TUg?=
 =?us-ascii?Q?aswok6K+xQ3rLUqwBmCapBDAzZ+oULIotCCHqssDOf6SPoOgeROihc+zv/Pt?=
 =?us-ascii?Q?jibiRYvl1yZM+pSV34THfsnwFR0xyU5DzKeF5a28s/wmuzpjpGkyMI9SVI/F?=
 =?us-ascii?Q?2dlsBkNB4VoXAZ/TVQeSje2kQDdztdlWOEWePDX/GcLu8mfhyzelp/L0PCCh?=
 =?us-ascii?Q?0D0Ltza/fpO9Ma5PeExQWGmW3lcuSEbqJO08nOENqTkwM66H9EEsR+owibxn?=
 =?us-ascii?Q?E2HcUn+28M35bJN0VVteW2k9nEWrDj0b9T9X8XAX15ov2fQ6ig9HXiswDYjA?=
 =?us-ascii?Q?O/yMQ4GpWF8frZyCVmEgtFPN4rvR0gdy9WBpUGcLIspUPZnJlaSEnsKWq3+Q?=
 =?us-ascii?Q?EIUY6MEtEjuDVr0VTxQmYIvFoyPpY4G26WXgquxSQ3IG6YAlRHb9PFYMmApg?=
 =?us-ascii?Q?sohuOTOF2JjZCyqB+yl+rImTQbwW0Fu8KxSYGbnuEQb8udbyo/335CsgpUMB?=
 =?us-ascii?Q?L8nsVOTcFrUfeqvvfgzirVYUUMFXt3S63AhEsEQMrH7bLK6cch4QBqb/ez/J?=
 =?us-ascii?Q?eSWaZCWNoFcaZwH30y9Cm20eT4QH24jGMXvneqy+ACfbV4JPkK6tlJj2qiHX?=
 =?us-ascii?Q?k6eqnQSe9dQdmIXxadsYPyzjhXmZxwYpCMIl6DA2Fzvk5KkDuasSbx8HSRbF?=
 =?us-ascii?Q?9a6snEbUdLXb2SRGzntEckUJ35mmSI5xabDMhAYU/FNICWnzHfb8fjScnu+Z?=
 =?us-ascii?Q?seZyPu5hdFgaV3s2UAccrfaxdT5PL+bQmocAmMB26XQZ+I1Lt5Bptx5o5ddP?=
 =?us-ascii?Q?mMBWkA9hzv1zl8+MlGXNva6HfNv//xkxvfFZuios9SOFF/go+v4Goi5LEolh?=
 =?us-ascii?Q?wUEzSXWOvIwtzPIHN6H8NFWBZvev7oyJwf3FFegGK5jlQLYxIVCCyV0ClYJW?=
 =?us-ascii?Q?1rJXlVcVoQOall+LxkXWCvt5drI6JpZv4E4rLSeQpF6Es5Evk6/KiQZ46buR?=
 =?us-ascii?Q?75MBx9hrogT+flopBzK77BDOe8kFPItnPZaAUH134GgQP+i/7kmtuVnAyDei?=
 =?us-ascii?Q?HmdpzGBwtvQj4iGYE6GyQUGgVg62fPaVauOZ5JCQEnXInU336976xUfY4ge8?=
 =?us-ascii?Q?bBgArVDpE+zGYVYSCnuD0KQ0czo/DPM8/5yfvi0IKi0hYQ4vLpgLIMYB4LjH?=
 =?us-ascii?Q?v262Ca4VBWeKJKGRjCgbuSwvbz6vrxjEBAZBKQ7eiiCFtd6ZnUuPEuDv5DAa?=
 =?us-ascii?Q?ANHIva0m57VzNAEJsfEQ7FLsMPakMGPuYzMJBvCT3ujVuTLrjpqsqy+jfV8I?=
 =?us-ascii?Q?wye7NQGD2w7FX4Mh+i4RZldHtRfYO2oJ3kKPMMtU42SaW0Di8V7ItRAABXLQ?=
 =?us-ascii?Q?YafQhFOabHMZi6B0XIdGba7p4IPU/+QUtdZV3j9Kt3YkyM+eL+RUMVmEI+gD?=
 =?us-ascii?Q?Z720dkuU9ZDYZCdPnm3QRDSP5tAEfPDsG2dTLgKZpaCE/eeihjwvcpUXF8Cu?=
 =?us-ascii?Q?1lXyOId6mztG7n92c2Rae2YbBKort49eyZspqDQBBoLYF/H4sm6k2h9tLa6Q?=
 =?us-ascii?Q?d7KqsXX3pUZ8CJspOyzzwXjzKrR+n2f6hSflSW05CUQVbygIlSCl/uAWrrUV?=
 =?us-ascii?Q?cTUaPQj32eMpff3tnh/pb3MkpR7gNCe3B6D1bh0822GkpUezu8X2s+HLHh0P?=
 =?us-ascii?Q?IeJ5sCBaXINgxmZioP3UbSlEkxNYXjmudtgdWsVcsT8pvnZ5xREV7vMNQiuf?=
 =?us-ascii?Q?Y9jMcnXQUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e74085-a8a5-4a8d-abc7-08dea430b8b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:43:50.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEgCgd43QgzLgUc31JMVG7DTSLJIW9DmwhylhX7OFEH6I9ioik/Z0fULVbS0pGlzclAJnJZtPVuy8rHqPiHq3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
X-Rspamd-Queue-Id: B6D9C46E889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36502-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Sun, Apr 26, 2026 at 10:29:44PM +0200, Greg KH wrote:
> On Thu, Apr 23, 2026 at 06:20:02PM +0800, Xu Yang wrote:
> > When a system contains multiple USB controllers, the global ci_role_switch
> > variable may be overwritten by subsequent driver initialization code.
> > 
> > This can cause issues in the following cases:
> >  - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
> >    though the "usb-role-switch" property is not present for the controller.
> >  - When the ci_hdrc device is unbound and bound again, ci_role_switch
> >    fwnode will not be reassigned, and the old value will be used instead.
> > 
> > Convert ci_role_switch to a local variable to fix these issues.
> > 
> > Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
> > Cc: stable@vger.kernel.org
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> You can not have patch 3 out of 3 be only for stable kernels.  Please
> break this up into 2 different patch series, one for bugfixes to go to
> 7.1-final, and the other for new stuff for 7.2-rc1.

OK. Will do.

Thanks,
Xu Yang

