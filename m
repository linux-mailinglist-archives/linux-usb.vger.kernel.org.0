Return-Path: <linux-usb+bounces-27857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55CB51461
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 12:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D5E4E2176
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 10:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6000F317703;
	Wed, 10 Sep 2025 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N6awD+PH"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D1316919
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501287; cv=fail; b=KO8bT8iLcsw7YtF2EMOW/h6kNXutyLo8+7pb+EIWBusIGjByGlJcGL+4SOb+90I9klDI+JlJ7xwQdWEYuwDaurfgDMh0J2fc+z+RYJi9TYddaU53dT6yNy8HdoARlELTtJppEr0sNgep807dorJo47cqwpKtWco6LLKiw7VyzRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501287; c=relaxed/simple;
	bh=eAXJ79bRVtoFlV3/e8HAdWpzCbe4zbgDGven4N2Z5RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MNdwsw+8vzeRSxuW+rQiRzacZyxHGBXkXfXQ5fB4TsaA6GW/D/O1sDOCH59fLJlkI4ZLfALNS1+56GC4zQC/0724TwMU0s1fhBclwk5WHbwsUkVYL97mFyvPihL/x4j1aaiVWceC/hpNRigF2+Uifqta6aXABHUnA9T/SGrm8jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N6awD+PH; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rq6PGM42FUsOFabfRBR+72QaOdToAql53ET1kVF+WgVKQTpS/PXsIkoi2dIX86g4C7F6zd0k/6uBYXBIU5S6M3Qw5TWjj8thggjHorWeKvbR/lY/mrKRCwr/3C2zz+KbZQTM7Gkqe4CAhr82Etg5XM7tf3YWrdn/XOp5T7AlFdc/4otG62zDI4ZWbNAJrHNv6GKgFbvrJp5cJVIHA6Bpb5ydNzo1Orr7h2C6xG6j5eOYFGvrwhlXEEANFB8xaZ3n6BU0buKv3HDZL0ggJOU+LVl9nbqU+Z7zbmY3mxSSo6n9QviPZwj7WzaVRvn4/K/Y9DRemwXNroNgelLHkaZJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m+A9NDxERyZIRrdw9IFGmmShapRtVAFQi8VvHqL2hM=;
 b=i4e7n47eNcsb8zdmWXF5J9ezjqZl0SoqHAyMoRqrOP6IIjPw4sLObnA2rTqy8Gtx11yk5a6zvXJ4g6tFVQ54QyOl5BSdeyooqZkhowZlaptlsg7prYysRSwy838TR9OXZTbX8rUuJYl1Ag7jxbqKM7yYtk2kF1JRIPVCQXWs+yLNUEIBpfnEyIToSqgxNWr0dE4DRZeYf2XyL7UM/ykaXGDWnuCHTjWZUwfj2B4wSQzEGhFfPDKiX4q/AOVkJfjEm/NZCC1/00I+t6LGJBWZAdnznyYVS/B6+g6SaP+7UABXtUO/hGvCbFrqkwjEEwavMIYfSZwiziBG43RO+P9Q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0m+A9NDxERyZIRrdw9IFGmmShapRtVAFQi8VvHqL2hM=;
 b=N6awD+PHKwTalFb9M2gIlizgkFw5JnBEroJ01fP+zesfAE4vX3R2BfGc3ZT4AAbZsGOt0Z8eFFmnbhtwYrVrFjftyPqvzv8aINOJU0R9eqDAS0Hhy4hf8HOA9kLGM8YdxGG+xI3o5WcUfexdc8tsfVm96wTO+HAtJMitTBNTVTcT09Pg2D1z4v1h19eaEPUYHkVSdD8BpTLjfGnkWKnL4bv6TdtLOrh3bXUUlLcHJJkykyQlUB/lGFlw0IyMGJ177P7j4KgnX7U/xV8lm9NXZoCEHlGW5VjFw35zrctREL0aYqIcl+U4FoL27iF6mrEoVQxE2EEXwxbI8yJZzUQFKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB11698.eurprd04.prod.outlook.com (2603:10a6:800:2fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 10:48:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 10:48:01 +0000
Date: Wed, 10 Sep 2025 18:42:06 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: add wakeup support
Message-ID: <ffdfsz6fnrk4krseavszxmi2444vbcrtl467ctr3fzokf32g7z@vy6bud7cpmka>
References: <20250909080733.567796-1-xu.yang_2@nxp.com>
 <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB11698:EE_
X-MS-Office365-Filtering-Correlation-Id: 304a9a52-9a96-4453-ffba-08ddf057834d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FyvOx7rNTAuGI98B3WCQiVpo8xSv4MSJbRJVRVkONmxGfOr6UqJXYt70eZ9R?=
 =?us-ascii?Q?rm0ebJ9HLEPDEc0l3hqFxNApDVlz4q/OVPWF7mpmPJzLpHOQvZg+AZ+HFPSU?=
 =?us-ascii?Q?nUnUcn1OgAGixfZmIm2v++CuglB1LzH5mGQtS0rIVI1D5aIg9A6U/Zhqh3u1?=
 =?us-ascii?Q?ASOO/opLjIKVyvt0Gk7zvyC8EbvdAeLDgVrKyvdqKUTPK1OhZ1MAx0pYk6J7?=
 =?us-ascii?Q?4oirykTd+5LdFJey7oHc+g4hCDuWxMRZH/QFBUmsGilJu24AaeEh/DnUh0db?=
 =?us-ascii?Q?wctuitKE80ZV1nde69v5N73D66u/EX6qJqDxXuBlq2pfPb6kM0bRKWZp+ruQ?=
 =?us-ascii?Q?z09z+4HeoDDVS4BCnBJjGwIZAHbWcadIeWbjpFJ2gf7uBSyekpNPguzA2u/t?=
 =?us-ascii?Q?MAj2czeVfUXz7dbe2P4rn1FoPOzoU1VPVI1i5QO+1XqJPANK71Iu7Sm3hLav?=
 =?us-ascii?Q?rgmPxBWdyFOItArFyFBj6Ev8ygOr0Hg8EmsruyguKnOwpsrFSBs2d8CivpHv?=
 =?us-ascii?Q?3RvoOqFnISU08HusJgvraDTVFBJMy4PN/SNxmV/hNWLWriu4FpkfljEuOR5n?=
 =?us-ascii?Q?wPq4xUpC8oqIYFzlWygAHPxKQuv+CJU9VCMbWsvQgfWwGuEoEIZwUHjv468y?=
 =?us-ascii?Q?BG8bMw5q408SmZNKBafdSPMxG958BmDSoOqAiVtfMg2lycB6SlPYj/kjhtyy?=
 =?us-ascii?Q?AROvdQJO88PvMhlDvCAC1UTrh/V1uyRcKGQeSp5ZRbEIyWS+/cXAgs0SX4zB?=
 =?us-ascii?Q?ybhjkV9cplGPjQLY2Oe1WtlsobMy7AuZIXsQOT/a9EdCVOKgqHiekdQAf7xu?=
 =?us-ascii?Q?VOa8rNGE2DWcVIcJPTv5Nc0NCKc4kEvGvUW3LivnQ+eFyCbHqDjwmrVQwk17?=
 =?us-ascii?Q?qRmnbij6I/E6mK40gR65SDu5oAhCe/R70PGn6XujJZHJ6aLlsVuoPs56OQvF?=
 =?us-ascii?Q?8UutiyAoPz/liCQ6L7PQHOl11bYcu6vIyc3jzHfyn+/95WOqLBYMHnagVxq7?=
 =?us-ascii?Q?NmUNMwtBPM4lDAIM7Cf6mmqXGEzebzmNKHdD3NGINZm0RgLGVL33dJf3Gkk6?=
 =?us-ascii?Q?JOPC400uRRauFkDHv6QgwLttjpuVTrY1rzvw7BWt3rYq/qDErSmSzI5SNf2T?=
 =?us-ascii?Q?wxtr+dtrTLbVRRg/szJtbEg/SnBZGrZhvF+ZVPND6gyh3W5OdMaLpV9n2926?=
 =?us-ascii?Q?TMnN6hb6O4qJCDTt67pTNpE5jL8FQ76oZXgnyqmhtqhv00exvfQMnrhdgph7?=
 =?us-ascii?Q?nFqRpHLHnnJO43mg9lpBKBIGrGW4NXqlopQnztPClmlN7HUxjfe4mqzv24hF?=
 =?us-ascii?Q?Q+UXbukM1UbEa1JNJnF0hBR5y7tORLUlLCflzRQkgyhigq1jy8TljTLta/iW?=
 =?us-ascii?Q?bttIZ7yf5Ucw9XwhAC7wggn2MAnCaq/Qt1f8JvCR4Xqc9MMHBHS8Am59arIf?=
 =?us-ascii?Q?FGBF+2pMRiVypQT9wc6Z8oTwUh7hAZjwEhdhg+jfAXzYLJOIseO/rIP1sTyp?=
 =?us-ascii?Q?DCytRMacrvqo1AI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fTkkMBAkTF6u/WAHwSWafRIlhu5QnOTiQeWfFTU5lNEsZMWWrR0Q46QYd3jP?=
 =?us-ascii?Q?EkmdOBeD1Wr1YLv4lgOd+qJq6Vw9nbY/2LsCyjeCvrSQS0XO7kOIRX02Ez0m?=
 =?us-ascii?Q?+5K2huXcRLqvYnWQddmCRjOS018h9PTvEXRK3mLrCVjFs4gOf3SYleltxo4X?=
 =?us-ascii?Q?agAzB0s+epfpS6c0o77cYgpUM4E22qWOEaCGF340X6wSV/Sn+H5qz+o0FHXU?=
 =?us-ascii?Q?m5+bsov2nHVIq4cFBH1vKH456mJkhDce3zwBSJ4nkIci4Yp/t6a8OAiQkH0y?=
 =?us-ascii?Q?gc/R0cgLRT6Mreh5CmZ5r+s3JA4Huz7D+P3YNIXIZ4gW1vKE1U1VNeMyAU0/?=
 =?us-ascii?Q?6T9OuBf3dy3pQeCifYHHkINC2imX7mrNTvtzRuBLklox69Ebsluc/mFwTbXV?=
 =?us-ascii?Q?wlH99KLA5lpzgCtNtUo2xcN+wIZV2OaxP1jy/OLy72j5XYeeyXHxSFJ3bEde?=
 =?us-ascii?Q?349Eb/ZO70onCZzVJaQ6kIvMDdxpFN5q+7ss10tAv1hWZnPEgwh4lVteLRx6?=
 =?us-ascii?Q?1vrvbSKjf4d/rLseTtJsb7CuX9meS0YAw1Lp9iPZQpYACvo/iFbKkhTGF3Ak?=
 =?us-ascii?Q?0JE9JtiuFWGNLHS12fD3Cf/aVvCBuTarfi+3dXIhGPk7dTT9k4ueBzCYQzv8?=
 =?us-ascii?Q?JkRNROIXvxHtME6eFrAyoI53D/cq0ciJQCw0LFgLh6Jc836HJQNqZpfQJ9sV?=
 =?us-ascii?Q?9GxTzviOPt4lllEoEv5wNB9OeLLXAGGz6fWOLQ0mkP8aS0XGXWMRejAxnrq9?=
 =?us-ascii?Q?xj/Vjrxx2U6jmVqeaioRE39D3lCoDGTl58GGhM8xFYm9jk2g0GPc7T7ujezX?=
 =?us-ascii?Q?CDwt93Jqs20zm9BDLZnvg66L6iHuWc3JpCXh96AgTxp9HHpV9UC3DIXe8L28?=
 =?us-ascii?Q?I/DpmpVxmS6ODkITRPtCHGYsoqQ1DYBVZHGkwVFT0YbLFavy6C4RdVBOohp2?=
 =?us-ascii?Q?EgKXu/+ppgUwYZV/KturXMLAFDC1h2lyLzD1sCGETZIZv8GZfzNDk903wKW2?=
 =?us-ascii?Q?1tvEZ58w8szWhqNs9K1Z7WA/EAkPjAickACQH8aq6Ljtpykfz1VcoVMlSc++?=
 =?us-ascii?Q?ZYVJx3ZqhKY5WCbBaN0jJHj1SCl/UdN58oRxR+TcdX31IbcdMuKio8qVTSEM?=
 =?us-ascii?Q?T8js/Mlq+X196ws81/FXgbckCcOnGrX8uNXE7NJCjRSigAAL8yU1cOkTiDmH?=
 =?us-ascii?Q?MGDmZMQ/fwng6vp4NKEEVq2sQIbc7S0kEzZ6J1Id3qloF+8RQ9vYBlyxzO8v?=
 =?us-ascii?Q?VwAHghxKO0Cf4EdK8W7XZ0Njh+bqjR+B4SJYnBr6r63ZFAgchpnzIZ0lKsif?=
 =?us-ascii?Q?yPqMt46xCWH0X5ApuUkkhv0F8aYgson6ol0oYu4AAEODS4tLCVW9Mwn62wtE?=
 =?us-ascii?Q?kMDyu0tgx5EWq0a/5n26LUmZKBPfZX8HExaT6FKiEjOzZkMzIm2N8N9bMd4i?=
 =?us-ascii?Q?O08yR2RrSP0MgnqtcUcqC3odifkDG0Na1E4eVj3yqqNIpJSgls1tPOO0VuAM?=
 =?us-ascii?Q?skEaE1aFyxDnxIaG49uHW3foWM45v78c7zTNxYIiy//VveFgwCD7B4yx40u5?=
 =?us-ascii?Q?373p2qH5CkEhptPvz+vZWAezrKUZgwrQzy1+W+XY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304a9a52-9a96-4453-ffba-08ddf057834d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 10:48:01.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMqzz/7pznSMkgCBG7H+OPJztSCu6YDgD4R+MFrKhR9PkYOqDG09BfTQXin9DnwLbGoV70GIOSWgoNrBMvCGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11698

On Tue, Sep 09, 2025 at 12:14:08PM -0400, Frank Li wrote:
> On Tue, Sep 09, 2025 at 04:07:33PM +0800, Xu Yang wrote:
> > Add wakeup support for tcpci, so if the user has enabled wakeup file,
> > it will call enable_irq_wake() when do system suspend and call
> > disable_irq_wake() when do system resume. Due to this driver supports
> > shared interrupt, if the wakeup is disabled, it will mask the chip
> > interrupt by default to avoid affecting other IRQ users.
> 
> Is below look better?

Sure. Thank you! 

> 
> Add wakeup support for tcpci. If the user enables the wakeup file, call
> enable_irq_wake() during system suspend and disable_irq_wake() during
> system resume. Since this driver supports shared interrupts, mask the
> chip interrupt by default when wakeup is disabled to avoid affecting
> other IRQ users.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index a56e31b20c21..2a951c585e92 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
> >  	if (err < 0)
> >  		goto unregister_port;
> >
> > +	device_set_wakeup_capable(chip->tcpci->dev, true);
> > +
> >  	return 0;
> >
> >  unregister_port:
> > @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
> >  	tcpci_unregister_port(chip->tcpci);
> >  }
> >
> > +static int tcpci_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *i2c = to_i2c_client(dev);
> > +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> > +	int ret;
> > +
> > +	if (device_may_wakeup(dev))
> > +		ret = enable_irq_wake(i2c->irq);
> > +	else
> > +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> > +
> > +	return ret;
> > +}
> > +
> > +static int tcpci_resume(struct device *dev)
> > +{
> > +	struct i2c_client *i2c = to_i2c_client(dev);
> > +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> > +	int ret;
> > +
> > +	if (device_may_wakeup(dev))
> > +		ret = disable_irq_wake(i2c->irq);
> > +	else
> > +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> > +
> > +	return ret;
> > +}
> > +
> > +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> > +
> >  static const struct i2c_device_id tcpci_id[] = {
> >  	{ "tcpci" },
> >  	{ }
> > @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
> >  static struct i2c_driver tcpci_i2c_driver = {
> >  	.driver = {
> >  		.name = "tcpci",
> > +		.pm = pm_sleep_ptr(&tcpci_pm_ops),
> >  		.of_match_table = of_match_ptr(tcpci_of_match),
> >  	},
> >  	.probe = tcpci_probe,
> > --
> > 2.34.1
> >

