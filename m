Return-Path: <linux-usb+bounces-25278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60775AED86F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 11:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C001899839
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE29323FC41;
	Mon, 30 Jun 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LjegT8O3"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D996BFC0
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275106; cv=fail; b=pWWY4MgVu87X5DpZHytX5vhB+DW2T+unuOegIIZawGFJktMKjRDcISOmUrLwvrLxlRqvl2wvUPtvi8cQL2sTPM/as4sNuinGrsWo0QHhnbwzt/g4lnWUp0WKhfvGIU+b8UsQh++W/KjBZaVGsdi9rfmRt0jhH29Q1U/gbz39oWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275106; c=relaxed/simple;
	bh=cokV70N2fAPyqKboyNBf14idkfJipfp8+keJxF1qYCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Idoq2hk7HylfQi7QYAGIO2DY5F7rLALrl9jtDw9sMLJ0N7QuVn15+6/tDu+Wvu3JukjzfCXmKegzQ+nZZ58SDkGi+FJvLx1tr7R0Tw0RD9QshoNbvMjUtkpytfRepcWFpv3vTdqNxI8fjbBV1FdKdWoVYWlmYBPaKyg4kW1+0q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LjegT8O3; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnu5VDgeKEf/eW8i6fbMDyR3fxu2gM9Sj0yHTL41PYG55uvzj07iZgx7ta6/0KhUOSTMqSZipkD5c2nnqHzWrP9BUDMexiGpvaus37dZ6qabZLm5fL1M5ZudJkX4C2+uLOn4HQP8ZBKNP6Zz49+iZwVcqIqXWaxfWk61T2NWuuQoWaFEAFR6uy5o7RMnha+xS5yfZ+tFM4KjtWPWH7r628fUFfJyKvwfCoQpMeDx7bZco8lnVEnOxOQlgukLJCorrzpq8zrcPxvdgW/tosUPoYPSdF7BuK3LMGREUVR6/uxFw+WfFE21NN/v0A4BQ1Es238wQ0hL9oWs+dwKRT4LGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmylQMMn3+sIrGZfnW/X+8JDw81cc2kIFAar9VzKfwM=;
 b=Aq8A8TjA3bbxUdryzf0dRiQoPmkmKAyEjLsr+D09LZ9nbFz6bBlwEaqkFORT1i2f0fW1eCUHnnr49f9LGhWyyPPuDNhYzWgaiFD1Z3bkZRMIiASadlqnNiwYJSc2WgsXTiV3RtLX32xeDx614Qe/wV/ynmsM5xjmJ4mRrTe2SRnhAxuVnVuSAmxEAHUfPQG0HoNhNlE69ym/7EP8GixSLB7SwfDU5MDOgmRu2hiWor/OcN8FB7v4wkqS2y4j8f81DX+UAuC+6jKhTp+GRAjoSr2C/pVdJN7f75i0tQRuE7h8e4Oc+E5D1IPSFr2HMTxHxynvu5DfnxxliRYRYpPhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmylQMMn3+sIrGZfnW/X+8JDw81cc2kIFAar9VzKfwM=;
 b=LjegT8O3PHj/tsNzeQSIuBdFcFATD2l2iaVF/dwFAdNrJv0YJG4/hhikP0Wkv0Cl0T+a/Id6RfLFZQxBgjJAJqthkNYMJqXg4mTZNgmxh+ue5R3G4f8XBKgRl71ROPqQnslyM+mII/GbmP/ScYgEYev/8l3l4sLCdCxAlMLEmVplQV2F0qqyAlLe0orrVtxSyQzJhUwXJuRjY3GJsx1wtak94rDrxc//NwvCHkOxtErcWLhhLWz+LqD2Wm4HU6vqAqWnZFi0b69OKJsxJkW3aVT03PpqDP1v73J2x/NAKz1k3/TUPhSTfjEPIGeBPEDIqziIzW5IIyE1rUtzDPLjAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 09:18:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 09:18:19 +0000
Date: Mon, 30 Jun 2025 17:13:31 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cbf6f6-3fbc-48f6-f881-08ddb7b70dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLWV1a/Ob575f8sdCU0rPKpo7s7KiMlCoKlsfmP5+pumB1Wotvz+VbVQ+WKy?=
 =?us-ascii?Q?hCZOU7/Y6BmZ91CIQXLB3lF0b1lETdJvUn8rMz+WrjkKd4Gs9kcW1Dz6RBS5?=
 =?us-ascii?Q?ukiivAJPxwIT7jLDyP2C5zqKuj5poPhQ8qt85foID0RhB+EkBiW8JpxQlhSN?=
 =?us-ascii?Q?c5PuzA1h6IqYphMXNNCosf1H3TFbRbUcfjoF7qnMASVjEiRg6Vx74Ts1BKmB?=
 =?us-ascii?Q?i+SZmso6thVC+n2S5O5CCNmwLaPA3o++7mShILtqdZ1XGRqPkKq+cfaIxkoL?=
 =?us-ascii?Q?3TK/dlO2cyYSewTuB76wKO636HEFNqUIl62Xn2BHo6+YmvRDDYCmHkFDpO/a?=
 =?us-ascii?Q?i66C4eMEy0GRsYl2DnKqMjIdh8rEP25Aa7yzbzvIEZWF9YTCH7/SwJfc1XHM?=
 =?us-ascii?Q?MeNLxiugiMjH7Jd9KsV4eZDOm/khM/p5iGzYjiGGrOsOrCAc3/FFRgGD7apN?=
 =?us-ascii?Q?38Zubg6mmwKJxd30ipIkWoirFD1e480rhpGSrZz0hGsVDjpj9lykGqSn5krq?=
 =?us-ascii?Q?+xzl0SrqFnuYV3AxzTydQuzoFe7WkPaDsaebrVLxX++BOqKIgCnGP/dqBGpE?=
 =?us-ascii?Q?9pmKhO54wM6QKogx32xtFTsEnz05yfPUAJdwuGka33jMpeDC3OdhICrPZRf+?=
 =?us-ascii?Q?DAeS6HXgACw00ObnJa3b1WgsVybe8ypAqTQjvxBWfDuGl8Yk5aqktAjkvnHs?=
 =?us-ascii?Q?DEWtnkkEcQJKhW2rUpykbx/vGecFvSLnXlcy422Qg1WrQmnTpG2iOOBFXmgi?=
 =?us-ascii?Q?PTNZqj+xOuP7mS+pQ3lkvfLwvg0tMFNV1oXvVKW37onGdIFQcCOvO6c5XoSU?=
 =?us-ascii?Q?TFSfC6I7heRGa4li84C0CVQFD5he+IIQNucXSQSek8schotwVdETJszaXO/S?=
 =?us-ascii?Q?7UM+5Qlnxw1t3Ji3UGyjE24jYhxxnQHlOSFYros649X23o/rXH9M+t4sQ9Jd?=
 =?us-ascii?Q?X4jsc3OvISuOc58RYv4UZHbh4iYmmJYrK77Ewdf3IqE8BGeQ1dlmwfqcTRwT?=
 =?us-ascii?Q?mqlVOV8BKMEafQwO2+KuO2ZS2lEZvWQjm21OqcC+bE24S0TA+Cart+dzaqgZ?=
 =?us-ascii?Q?q1LAfGlPZkOI0ikd1Z40gBbjZ0K035+njU3dF6MA3F5WoJXnFxQBUv91g3Wd?=
 =?us-ascii?Q?Q4pS/YpIQZX7vTBoVjGZAle4jBKK6NVEYLYY0WZkTtRghOVLFrE5gQGmqeJO?=
 =?us-ascii?Q?h1ksjAHc3YWWq/hTv4Z2fA13r+CaZjO5L3svaoBosZzGso08wVBgLu+1SXTd?=
 =?us-ascii?Q?YmcfGXvPSTNd05yCgWf4nnR7tkuwR9om3rF66iUkzatVchVus9BNa0IjaCze?=
 =?us-ascii?Q?RpDgvVFDXaUizJIDdx2oy3f6PpjbchYsnXxK/WnU5bc051Y+WCa3SH8xUfQU?=
 =?us-ascii?Q?BjNRq5TQVF6BZW76oMVkRH5SUl1SfFeeKLGh5XjkzN44WJkDlV0wCkPbJ1N4?=
 =?us-ascii?Q?HJiWiaEvlwkYE62DJkpCbFkohQ532yjBUXweZrzdoqxEkFktYz7/VQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hC6/ncTSbqH/X6fRNYLZZBlbQ6Da0Il5PbWuTuuQCy8A41eG1/01YAo+A9/f?=
 =?us-ascii?Q?Bz0cNBFzurtoChIojte/JjHwvExIW9X6ASUhZxXKyh9FwSsTN6hAi5T09Xgm?=
 =?us-ascii?Q?69XIqsPJsldMZvm3GWOiqlaBUBNoTiTINWi5maSGE1taYHEo2DFBQ5WTvmGZ?=
 =?us-ascii?Q?EKRJhp8/K9KUv2gNC0ng+WRg6urDU5XWJXXF88jZ+lMYiggDV1q2xKuGOIHc?=
 =?us-ascii?Q?SiuKDZtbOTymYT+JnhXHAEhItLdNeDw7HF7rSw2BIQ9OjfzKvFej/svMubDO?=
 =?us-ascii?Q?T8HbJCg4eEliUSzhPiZKaBW61jc5WThWbU8yal7I0eYPZhv8VPp5kbM7CLlh?=
 =?us-ascii?Q?6x8dkEns6JcgMYtqSNnreJtOruejTBf3cNUxwIPHvrzFcMKnxhB73tM+eVyL?=
 =?us-ascii?Q?sAFiQBG7+bp2d2LcKNfc85IHy43Xe650qjs2rB2z7ZibkRYg7a2b7hg0L5Py?=
 =?us-ascii?Q?4pcpgB7Lcv/6B/9bi2Aw84VSvyMXbyZoOxODN6M+bHMx0MHAk0y0425dgLYN?=
 =?us-ascii?Q?hDrcX3OzlU56bcD7tSZioMyo/Q+AeqypNswpmddVHgWU+5D8xiY4ur9aV1AT?=
 =?us-ascii?Q?mcp62q5iplxVGifq1rLF2aTvGUADl4VbZOx6C+47sgbGOet4+yGKKefbdjfY?=
 =?us-ascii?Q?NAf3HE0reE5MPieNG5N5CRjayt4Fy3MW14Fh3Wb9xm6Ue2kkloBLL22Ul718?=
 =?us-ascii?Q?EbB3NtlQ1Wc2zqjTgkil3oLtteVssdiZN+Lvm5Wc0c32wab1kkV/m8p4ovMv?=
 =?us-ascii?Q?CQ3NNzkhy9lmn1s08oHOXzhq8TBhnnCO4qck3bsUPrrMStGjGBOxBE89Tgsp?=
 =?us-ascii?Q?8l5n1INbZG/BtJwOhrHM2BzpemIN0WjJtlR9M/92tjXTWTk1zvo9CEJ82EHU?=
 =?us-ascii?Q?LYSdpQJl9ZGnniaMlSlLIBNpW86/a91llX3AUH9l4FutYgvqQCvbrWYCiJSs?=
 =?us-ascii?Q?o+GuXzpk+NaTcYUnR568O3YrbvQIPEfnMrYv51MSjNDNEvNxA2RxhUDviZUR?=
 =?us-ascii?Q?UvLBkfs5MR+0NU6SrUl0SzRBNgYgV9NYiGBjbCNG83+/AldgSOdF4SP4sYDb?=
 =?us-ascii?Q?gfmXGfTZGrQfBTXBy3mNHguI0osR7WAvf7kWwBSZ975LyeL0byQuAUZoFALL?=
 =?us-ascii?Q?gV9VAYnv0Kwm7kMhqX9W0baWbLUOsf1M+4tYCx5Pm/U83xxf0LpR//7jPFDZ?=
 =?us-ascii?Q?wOFCI2lDRqK1FogwzDX/QMIUCNZfHCe60zkEt7WoVmHyN3MNyYoyVcM5sHDX?=
 =?us-ascii?Q?BfRx2X7pdG3pI38Znb7JhsXWTl6wGeVvpnFfhmmstG9mfcDydtXDmHxTv5Y3?=
 =?us-ascii?Q?ksJuBj+0+ouYN9U2kzoMle5WcjcDiXC5m6xAnsoes0oHNYNNMqYXLOJ6H7US?=
 =?us-ascii?Q?D0n9/VwrTAt2kh1tZ7+cvzmVOlPlKrbmQqYygDc5E7RUHzfbZnfPOmRwSrWv?=
 =?us-ascii?Q?TKDK3FaS9aG7YefFjRB+s7CALxxajGDa1Kz/d6M05smQuh90Qy9djysY3ns9?=
 =?us-ascii?Q?MrDD6OzeEJQxMdslMHlNHipsTTuxakCrtaTtDiBfc9SaqMdee3717y62uGj4?=
 =?us-ascii?Q?Mw2O8/OBdIlg2Y81tXkQU38bY0GmPihkJqHyIYpr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cbf6f6-3fbc-48f6-f881-08ddb7b70dd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:18:19.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91eK6ZnP0VHRUwi13cwr7inBQwGkyM6rgJZEmDZBvVJT8dKT2V+AEdr+ty0kY928rnH5seEUtZCq8IPuBd97pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204

Hi Alan,

On Fri, Jun 27, 2025 at 10:28:53AM -0400, Alan Stern wrote:
> On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> > The valid data doesn't always begin at the buffer head in case
> > iso_frame_desc is larger than 1. Otherwise, the output info will be
> > meaningless.
> 
> Not so.  usbmon intentionally copies the entire isochronous transfer 
> buffer, even if only part of it was used for the actual transfer.

Ah, I see USB monitor only copies DATA_MAX (32) bytes data for mon_text.
For mon_bin it copies entire transfer length data. So I think whether
the data is valid or not matters for mon_text.

> 
> > This will find the valid iso transfer frame and return correct start
> > address offset of buffer.
> 
> Even if this were the right thing to do, how come you didn't make a 
> similar modification to mon_bin.c?

For mon_bin it copies entire transfer length data. So the user could easily
find the valid data from the results. I assume that the beginning part of
the data will be 00. But if you prefer to make a similar modification,
I can do it in next version.

> 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/mon/mon_text.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
> > index 68b9b2b41189..4929c7f5abd0 100644
> > --- a/drivers/usb/mon/mon_text.c
> > +++ b/drivers/usb/mon/mon_text.c
> > @@ -145,6 +145,8 @@ static inline char mon_text_get_setup(struct mon_event_text *ep,
> >  static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
> >      int len, char ev_type, struct mon_bus *mbus)
> >  {
> > +	struct usb_iso_packet_descriptor *isoc_desc;
> > +	int i, offset = 0;
> >  	void *src;
> >  
> >  	if (len <= 0)
> > @@ -160,8 +162,16 @@ static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
> >  			return '>';
> >  	}
> >  
> > +	if (usb_pipeisoc(urb->pipe)) {
> > +		isoc_desc = urb->iso_frame_desc;
> > +		for (i = 0; i < urb->number_of_packets &&
> > +		     !isoc_desc[i].actual_length; i++)
> > +			continue;
> > +		offset = isoc_desc[i].offset;
> > +	}
> > +
> >  	if (urb->num_sgs == 0) {
> > -		src = urb->transfer_buffer;
> > +		src = urb->transfer_buffer + offset;
> >  		if (src == NULL)
> >  			return 'Z';	/* '0' would be not as pretty. */
> >  	} else {
> 
> And how come you didn't modify this branch of the "if"?

I looked into it, but didn't find any ISO transfer usecase using sglist
to manage data, so I skipped it. I'm not sure if my understanding is
correct, do you have any ideas on sglist?

Thanks,
Xu Yang

> 
> Alan Stern

