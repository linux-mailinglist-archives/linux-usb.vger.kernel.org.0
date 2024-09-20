Return-Path: <linux-usb+bounces-15258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971F97D0CA
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 06:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0EE1F22624
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 04:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691C22A8D0;
	Fri, 20 Sep 2024 04:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KCusxvT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BF1F951
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 04:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807920; cv=fail; b=MLHRcOrqDxfgjyaJR6gjEuGhdm6XM1J7WS8tgJ9ZhCXN50Eap9SJIlqfR3k27YSaB/01/FiPdWq7JiVhhYvUgcJhOymF+PR64rQRvR6N1J8a1YWbzgD1boG8F8XGogBV/Gr1N3Ldmw0LCAZtbo+bzfmyqx5NBpW5Xp/zBLPEOPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807920; c=relaxed/simple;
	bh=jR65giJ/OE6sUaBuTfxvgueMiivb6TXT2LfapRwyE80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lChovQJg32ToQNu9FYOK1ThFZBoYN2AE3QhX+qu+wcf/rw1eMPyWybL7ctEI3ZgdDRkeadqkYoNmKlEhDzfEINEF322jSp53DRk6VP6WhjmgK8QTQDcE+E/uSwXQKBahFmttjMztI1mdU8FRfYpzIhXB3bFbIBORmK1uSh84g8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KCusxvT0; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMQI/04RQhKudRFYr0/SPPsCLqocSD9MjYNLufpJQ8ulHpo7MjT3KL6UlxL6iADibaGxiQkNyZgNmAjl/BCJVXjWCDlo36H6ZfBpZ459vcmM6nDhHCi47nkfw3TDAds62KZbt2zKR0sLjPgO4rhGk5k2Jfl26ei0XuZ7nDN8/Rg6WSEFiBPwplbNCvtrQkhttWA08PTEp7kzzXNzu5K1dIJN7Ro0+kSWpJS9ZJIlLfw9fNjXHs+QTJPMOlNyhbqzJpahjhLKqIfTrjRFUdTCniHPqQWiS3DZWv04sLsZkKh7wZxwWW1ze3xpZySCGRimWjGzB6uG+K0HXLu7T790Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpskU+rCFdDXhht4H3itdHbM6i1BjPoyMVAzmCtvTdE=;
 b=aaJxpgogZ73PtYOGpZI/EaQJqRRHU76sRI93oeQHG7rpkck69EmSo2mYak4BKz1cRKmEly1FmmkE/o3j50ADegV+i5GzaTpt03U2P6RZGyQJ+BcUh2FaX18cFsGFqdUeT5lZraLFqgOpDFdCe9FWRE+6c5ZdsnkXAku6yzggDJ+XxEirVPEnAOpRpt79i7aEp0IMDpygKOBr/K13a6+9MOIgAdgaIMcx45atwJ03g+gGrmX+52zJwWsC2o1obDSPxzGeKrTviPlb7yl/SJ53HPzJubNtoCy8cuPvxBa0j6JCQ1416Jk6rjsbV6ZSriImyL9YwAU2po8stcyfK/bizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpskU+rCFdDXhht4H3itdHbM6i1BjPoyMVAzmCtvTdE=;
 b=KCusxvT0ZMEeoshnFjzi+tv7AkW4wNdQ6xhV4BQ9loMsGIMSQAzpbWlN5DZLKPS0xzU3mTLDwKsEY5rviZciO8bQbPHHiCelfV83q0/UUubOMia5GMy48YHTh0emtwCG5C4UwZkwQna2+tcZkgeHmVXbUl60TX4P2ppZC1xOMyjnWj/ueHvnvORWIdmcaNTWprDQVwlwrpIabqqOS/0cGX1rhkuBj2GaS1LwmNpw0oONsrbeFbgnweZldwrWRY/LGDOAf35nbqcTZDPksacvxxIjH2/+tkn+UkpNQ3yRfdlb5nJdjGqvWJUC9d8R3BY6lnPdt1MtnuylEYtufJ2gfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9641.eurprd04.prod.outlook.com (2603:10a6:102:23f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 04:51:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 20 Sep 2024
 04:51:54 +0000
Date: Fri, 20 Sep 2024 12:50:27 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240920045027.ts3spzblqpds4vcn@hippo>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240913012045.GA320526@nchen-desktop>
 <20240913071133.pstilja3z25yey2p@hippo>
 <20240913095344.GA321485@nchen-desktop>
 <20240913152513.uxgwkedh5ryq5ktl@hippo>
 <20240914020414.GA2887@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914020414.GA2887@nchen-desktop>
X-ClientProxiedBy: AM0PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:208:154::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f99c28e-3c0a-471a-c39f-08dcd92ff2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EWUcdEwGpUifK5XpH5biuppuyuVieYfSrLhLjBiWqjI6KOnl+2OId6Xi+cvB?=
 =?us-ascii?Q?3kDWQEEm3KisFX0ulnEDjfNmovwEtJvWX6vwPfdL80QfVHxw2qArVJOcfwGo?=
 =?us-ascii?Q?FaLN2Xh6wjEch6ZjyMWkAxyOm1TWBcQcYd6yLvaps8lT20VNhhvyp4ZJLZ4b?=
 =?us-ascii?Q?44ugmN/r88VjO86YzcQ+bq4hsXaipLIIRjM1NkIx0Pm9uev6x0nzvvC1RTLv?=
 =?us-ascii?Q?mq1XGcyznUUaHD9bElN31tZRKGURGo0/yANOVuFLyVX2YVaKd+fNVg9KmFYA?=
 =?us-ascii?Q?qOcuLIUlEAP2oRrj23vMajTOx4bqB5Uf2ezn/GqvC84vtlhz0y613Ets+rF3?=
 =?us-ascii?Q?uel1M9Fgz8k9Qdjw0/9MDaX98JMlhLrdhom3OpHJ0hoBvWNC3qkt/PaP6NtY?=
 =?us-ascii?Q?gxVPM/WNowFy0QrSfeO9l9NrBU93zs5gnyilYO2ZX0VE2SCVm3tubOljfVOR?=
 =?us-ascii?Q?kSYjLr5c/KT1JvSbY3R/ST0gwygK35bauZpzIuStzqs6rr9VVYhMB7rfAnZZ?=
 =?us-ascii?Q?ZuPwy7ezb0cQo5wxQsvlJQzJ5gSwrrLSFAg0QVNGu5LtRQ3pqEWwNv11Ep9D?=
 =?us-ascii?Q?Zkwt/rIUfQoVhCQ846GUqZTq4Q0tS/qhWX8DHgO+OmMegvjBcCzWKw+K4qvE?=
 =?us-ascii?Q?Km19vbktxYvOAew9E1VN+mS1hWrBYfQmphpuXr/txO/5xNBgIg5CpNuTnCrN?=
 =?us-ascii?Q?guMFXlGmK2Spy/jJ572ud4+qxxk4LUWF+BzY1QBeOS9iQJ9I3g3eOEeTOz4G?=
 =?us-ascii?Q?yLsiJXQRNaNqkk4nGCnhThBGSNb81xfUiLNhI6EsTdm4DVuMkpAExYmB4bEn?=
 =?us-ascii?Q?3Kp8JMagypLQjTC7o+clqOfASErGIWtkiYQQPQRF4NAcVX484s8orkYnzhbj?=
 =?us-ascii?Q?QNgAy+0qpCpxKVZBOE06RSrgBGQyFjuC28G+qENFw55pK5VrGaVaed7jKST8?=
 =?us-ascii?Q?CoOlU/VAr0SG+Ko3tDoybrKM/jgGnhYRApFFYHq3qngPeAYZTXCXq8clJnep?=
 =?us-ascii?Q?nc2IqBlQxHwXbl6XRJ1gWxnXteBeTcWzqEqJF8ut8BxU7cn/Fm2HXyvAX5Ke?=
 =?us-ascii?Q?/Lj3Z6Kwf53UdV1SYSQltmA7mOi1jUNlylDU54qtTktlCkJ33ttCljoLmbUz?=
 =?us-ascii?Q?yBZj9IvnZeOC15g+zB/K+Zceh4dbEg+hLju6A8udmrHMV09qJWHrKkzz1GKs?=
 =?us-ascii?Q?aiNEnzRjjs0AQYab+UYZDJc8YOiOeVPT4ln8KEGjOX4UiUDhqFmhjgJzY5b4?=
 =?us-ascii?Q?spuCX3Of1LQRbJp/z4DJwh7FHMyQeSlFT3xV2l4BDfG/SR2KGtRENX/fs/12?=
 =?us-ascii?Q?kpM5AIOYXZCgy97s3/2kdlmFCfAovI7owUbNC+IUv7dXftWgOc47vKQCjc+y?=
 =?us-ascii?Q?08Ksd61O1bBn4Mwl6pBYeUzJ+JzQh6HdW7dScyD7GMEntr7Ybw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?czTseWgxQ2fIwLRTnMz9WIDg09+zdRSDdrgNydj9cJLXZnTqBDnaJg9hJ8LY?=
 =?us-ascii?Q?k/5K3F0Gs/yW+SSenwx4Lg/kwa/q9mhV0pOwdgDQK+/s/ZP74nCday7fL0HM?=
 =?us-ascii?Q?MoEe83IkRrRJ8pXdeIeGVvq/ABmANDkhD+7Rs7M2sneV8gg1vWKKbVVt18EJ?=
 =?us-ascii?Q?Xw3k9SyDVF0anF7KqItPgHWKCutUigT1IagPad2Tf3tIstepIIq68xKbR6hI?=
 =?us-ascii?Q?WWZIDXB11jYO30MkxzYCwU5LCveZrdZVAz8XsrpgDqPLXz6N5N/fZXZ9Oa52?=
 =?us-ascii?Q?qJ58pKLDkFtsFLOa6EBVx6+o/42CAO14a8YpZTu1CDZk4soVyuKgNLSE5tkn?=
 =?us-ascii?Q?Kms1Hfo2zMx2qpnt/MR85nwTDTHkWsTONGOmEGe6R4IPcEeUGpeD4z7e3LM4?=
 =?us-ascii?Q?mrcF6suNOuXvIAFUy+MqLcv1hqTZWOObuxtS6nAglALVfDG5SnyWT8CUFl7r?=
 =?us-ascii?Q?0W3YcWFo2Le6j5wmiAaVCYpFU8tkIK9pZaTBs5GuICDFx6A1NMZ7hX/16iNZ?=
 =?us-ascii?Q?8BpH0SsnVpzPtHSzDghFgwdQXdVtNvjyJ3vf2s+yOK4587QcFKnCSpRnysaj?=
 =?us-ascii?Q?rIzwU3NoPyBNP0uraX1ATi6TLxyrwfp6kMDRjyvp7CN/wi34iXa4SEOwdWLA?=
 =?us-ascii?Q?D2A+xBDiHnmw/27+MxxIDZsCzRXbxFz6NWj7VpCLUuRWEA/uD8Fghp01yF7G?=
 =?us-ascii?Q?o+wz2gHnI+IEYfjTKavkVdNfExUmQf3HaeZLMzhLq7n49Bw1Wjfeo3sMCzpw?=
 =?us-ascii?Q?rpvtTqojNFBvS57eT7VkUTB74ye2hvZzfIdjVXq02QyjJoj0+LGt4gbXnCV+?=
 =?us-ascii?Q?HVqqW5M3RSZjiCgB9rncDswJOC4ctppRuhvGHEzwdh/UNi/IZLX7jPHLdy4V?=
 =?us-ascii?Q?kol1v3slN6OFJp4Ada5CthXm0Gp3freC2CaKF8nm4b9I25MZUyDMUVqPhJu8?=
 =?us-ascii?Q?XBa4i0K0SVz+bvFSYFoWWmnowZZuVxTz9H18aq8gdCMn0U0iliSTSV3ZtAlh?=
 =?us-ascii?Q?R2sduhsqS2YJm6DcD6xYqRGf0jQDbaJGj9AeW021keLfvUUmMvsqIQDB3G28?=
 =?us-ascii?Q?WzkuAOHl2VmZL1MpXx51yWJsYya76J/2fy1mEIwJLnm0qbRblhCh7mWuSsz/?=
 =?us-ascii?Q?SLiecblIrSOf1XDW1S7bSIhdXJ51gJlFGrnrHsy6MDNQ2grpNd693s6OxuKC?=
 =?us-ascii?Q?CBfDwVMVxyAwSn2FtNFZSXqpFRXwSjbMP95hEvOMuD5MhT9B1Dhshe2b/CJA?=
 =?us-ascii?Q?Ozs+13xyviRPzUwz58nyelPDolFGFPXwSQuCgfC6fe80L73Np6Xq8hlhD3ns?=
 =?us-ascii?Q?vXde0l8PRzGi13oFhSsRVaTBQLZEcK/QSpIQ2/W8VBZPou/yt4d7tP6XjwWU?=
 =?us-ascii?Q?K1DZiCExbYquiJfgvUtOfJ1ohKusg6mMID8m/II4/mkC1fb/Ltr/c7I1Da89?=
 =?us-ascii?Q?eB16U9nfCLygZ1khSoiomWQEkWAuDCbgrLpETTfMNz56H6HHWuRqfggW3fmj?=
 =?us-ascii?Q?cKhKz3t+dE+24CnRyZ3K/hi0HVgkrNZ9qEZNy/PZGz/eY+Y/XdShcwpgNKa7?=
 =?us-ascii?Q?V++FXeGySztb22K3anbcJEO0cjLzxRR9mFYuyb+B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f99c28e-3c0a-471a-c39f-08dcd92ff2f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 04:51:54.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpaZMefoRKT7Q8HTgJCyDwvCIJ59owS4LK9xvUzZ6NJfFPQWePhS20R8T/gtwdVJiXYf15BA4DZkvaMR+x5dZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9641

On Sat, Sep 14, 2024 at 10:04:14AM +0800, Peter Chen wrote:
> On 24-09-13 23:25:13, Xu Yang wrote:
> > On Fri, Sep 13, 2024 at 05:53:44PM +0800, Peter Chen wrote:
> > > On 24-09-13 15:11:33, Xu Yang wrote:
> > > > On Fri, Sep 13, 2024 at 09:20:45AM +0800, Peter Chen wrote:
> > > > > On 24-09-12 12:51:49, Xu Yang wrote:
> > > > > > Currently, the deivice controller has below limitations:
> > > > > > 1. can't generate short packet interrupt if IOC not set in dTD. So if one
> > > > > >    request span more than one dTDs and only the last dTD set IOC, the usb
> > > > > >    request will pending there if no more data comes.
> > > > > > 2. the controller can't accurately deliver data to differtent usb requests
> > > > > >    in some cases due to short packet. For example: one usb request span 3
> > > > > >    dTDs, then if the controller received a short packet the next packet
> > > > > >    will go to 2nd dTD of current request rather than the first dTD of next
> > > > > >    request.
> > > > > > 
> > > > > 
> > > > > Are there any IP errata for it?
> > > > 
> > > > No. It's decided by hw IP design. This old design may not suit current
> > > > requirements.
> > > > 
> > > > > 
> > > > > > To let the device controller work properly, one usb request should only
> > > > > > correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> > > > > > support up to 20KB data transfer if the offset is 0. Due to we cannot
> > > > > > predetermine the offset, this will limit the usb request length to max
> > > > > > 16KB. This should be fine since most of the user transfer data based on
> > > > > > this size policy.
> > > > > > 
> > > > > > Although these limitations found on OUT eps, we can put the request to IN
> > > > > > eps too, this will benefit the following patches.
> > > > > 
> > > > > Since IN endpoints have not found the problem, please limit the changes
> > > > > only for OUT endpoints.
> > > > 
> > > > This 1st patch is mainly used to serve the 2nd patch which may impact
> > > > both IN and OUT eps.
> > > ...
> > > > Because it's hard to judge whether a request is
> > > > suit for transfer if it spans more dTDs. So it's needed for both eps.
> > > 
> > > Sorry, I do not understand you above words. First, you may know this
> > > request is for IN or OUT, second, according to TD size and data buffer
> > > address, you may know you use one or more dTDs.
> > 
> > If req.num_sgs = 0, then we can know how many TDs need to transfer data.
> > 
> > For example:
> > req.buf = 0xA0001800 req.length = 40KB
> > 
> >  - TD1 addr:0xA0001800 size:18KB
> >  - TD2 addr:0xA0017000 size:20KB
> >  - TD3 addr:0xA002D000 size:2KB
> > 
> > We basically won't meet issue for non-sg case. The only expection is that
> > received short packet on TD1 (or TD2). Then the next data packet will go
> > to TD2. But it should go to TD1 of next request.
> > 
> > But if num_sgs > 0, we need to check validity of each sg entry due to above
> > limitations.
> > 
> > For example:
> > req.num_sgs = 3 req.length = 40KB
> > 
> >  - sg1.addr = 0xA0001800 length = 18KB -> TD1
> >  - sg2.addr = 0xA0016000 length = 20KB -> TD2
> >  - sg3.addr = 0xA0028800 length = 2KB  -> TD3
> > 
> > This request can be safty used to transfer data. But we can also meet
> > previous short packet issue.
> > 
> > req.num_sgs = 5 req.length = 10B + 20KB
> > 
> >  - sg1.addr = 0xA0001800 length = 10B -> TD1
> >  - sg2.addr = 0xA0016000 length = 6KB -> TD2
> >  - sg3.addr = 0xA0028800 length = 6KB -> TD3
> >  - sg4.addr = 0xA003A000 length = 4KB -> TD3
> >  - sg5.addr = 0xA004C000 length = 4KB -> TD3
> > 
> 

Sorry for reply late.

> With your the 2nd patch, you could make end of sg1.addr is PAGE aligned,

The 2nd patch is used to create a liner buffer for rest of the invalid sg
entries, in this case, sg1 is the first invalid entry and sg1 - sg5 will
be bounced together. So it's not what you think, only sg1 is bounced.

> in that case, the sg1 and sg2 could be at the one TD. sg1 is at the
> first dTD, and sg2 at the 2nd & 3rd dTD. If that could be done, the

Yeah, I have considered this way. It could not be done. If only bounce sg1,
the usb controller should only transfer 10 bytes to/from sg1.addr. But TD
doesn't have a param to control it. As a result, data may be inconsistent
since usb controller may transfer illegal data.

Thanks,
Xu Yang

> host may not see short packet, anyway, you could confirm through
> analyser.
> 
> Peter
> 
> > This request can't be used to transfer data since sg1 + sg2 can't
> > form a data packet. The host will see a short packet (100 bytes).
> > 
> > req.num_sgs = 5 req.length = 20KB + 10B
> > 
> >  - sg1.addr = 0xA0001800 length = 2KB -> TD1
> >  - sg2.addr = 0xA0016400 length = 5KB -> TD2
> >  - sg3.addr = 0xA0028800 length = 8KB -> TD3
> >  - sg4.addr = 0xA003A800 length = 5KB -> TD4
> >  - sg5.addr = 0xA004C200 length = 10B -> TD5
> > 
> > Compared to previous request, it need 5 TDs even though req.length
> > are same. Most of the sg entries can't share same TD since their
> > address is not page aligned. For high-speed isoc eps, sg1 + sg2 can't
> > form a 3KB DATA2 + DATA1 + DATA0 data sequence too. 
> > 
> > Therefore, it's a bit complicated to validate request if num_sgs > 0,
> > especially when req.length is larger than 16KB (1 TD size).
> > 
> > When add such condition, each of the sg entry must follow below
> > requirements:
> >  1. the end address of the first sg buffer must be 4KB aligned.
> >  2. the start and end address of the middle sg buffer must be 4KB aligned.
> >  3. the start address of the last sg buffer must be 4KB aligned.
> > 
> > So it will be more easy to validate the request.
> > 
> > Hope this will help you understand the motivation of 1st patch.
> > 
> > Thanks,
> > Xu Yang

