Return-Path: <linux-usb+bounces-34265-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CXjKGV7rmnoFAIAu9opvQ
	(envelope-from <linux-usb+bounces-34265-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:48:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893423500A
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97FF33049273
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 07:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD2D368979;
	Mon,  9 Mar 2026 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OJPNr/ts"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55521363C56;
	Mon,  9 Mar 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042281; cv=fail; b=iy7g/w2hATMLdTUX+63famLbErqy1OFFM08d5UQo12lKxRMjG5p4NmAkPDBYxEMIv0yqC8gBavTCUa5KPp5MJz/GcyfQuFriqL+7b18/3W6CXKiSUsg4Ivf0+IfAXfllPx4n5rqGc3mISVSUVVGdnY41CAgFXG09VIBP7w02kHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042281; c=relaxed/simple;
	bh=0MMX8eYBn8+qFXwNo+w7NCJx0ueYi8svH+7EzM2vefo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m/KSKt58TWympMTUKEcmPLfuFNeyXd6CuzjxblY0DEOEvYonDwgMwereWqtsASzYT6hkHTtDeS4sMsQO7DYFRljF0kKc7cOQc1/KEQWgC2nUFTsxkKYUZyQeSecb+tbsiXGlyejpWyBhGZOOb2TXXRVCncpFwne4UuHaTJVon0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OJPNr/ts; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGxmImrMdzY8aT2vDigvkPhqpOJzRtFaX0ICMf20qLoNlmGhISPlFvWxIXSsnmV9shUG0jyOnsFXY8uPNboLcjIlMrFp2q9a2JqMD8xmE999vZ+T1Rv1CRAboJrG1JRkGxXEweipifoyxyTC8lqnoA/yGo02S3D/EfSZYSUOjjSk5qDnfIUC8Iw19mqQPPWe1UuojFLvy6Jc6+sdvIBz/hBfT2hPFNPThvG0/uC/OSNNobjnajMAgD6p59l5bpDTUwCjMBRoZnfoM5o1a6rYMLDZbGOAQwPMg1G1f2qYmllZBk+VkLWfiWrmphBT0AQmLDjzeZI4OE4UokhK99dIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvAzH5MpVxwk41RqEXxpF9xNyzb/HAHzINU47nhPaKc=;
 b=Z9tugwf1BdygLLqrScIX+4q1bd61Hq1DXlGxJtuwgix7xK2mAztEYohlJIM06/1bgO84SUezB9orOeCxsRKViTdzHk1XwKqXa4hZJRfdaCWNFQVAgXh+jAV9KP+J1hOuwG5DoAiamyV95+XGJ5uFJ63WoseuSnPF13U+IkNmppVJOrqKkYxpKWHKxFpCk33s5z+6Ql2X+uS4YuyxSXB8Ed+uIdJJrrGJereV7EmmYSON6tGQEOTUW9qDdFeZo2SUlbMMvv8Wtz9Sb1reDelyJk61a+7+kTVp7Ic8opEAAnwAEErAygGhJsd91IvP1SVAB3oL+cCyFaC4oVCNQbyK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvAzH5MpVxwk41RqEXxpF9xNyzb/HAHzINU47nhPaKc=;
 b=OJPNr/tsPBla/MClI8vYPcBZ2mgIwwT2L1ak5mxl2QJ8nKMttTPq98Wy8cqIzwMIhBX2HsJWwaeYnj9Z7QZHx3xmhvZlUCUZkHW1U5/wyI8t+SnyPtb17EaajVrzca81G/MFIUgkJI9Fl4rXoqoYDviB7JBpzOeFsSvULYW21d5YKm546rmbq69D2jWe9RLDNG+3zX3mOTFNBhJWo8qxAWU4uD+mtdi3PsQqnMpxPvzgWKkY6h6x7/AZwWi6MALt7hiVZ/nBhn9QLpdKRutEuDGtV+OSOrCUOfhxWFcEaVntri4VVZJUxLwlP0Gu6HT690ABMrl3W+cRiRCGgqzmGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB7602.eurprd04.prod.outlook.com (2603:10a6:20b:2db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 07:44:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 07:44:35 +0000
Date: Mon, 9 Mar 2026 15:36:52 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dsimic@manjaro.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] Revert "tcpm: allow looking for role_sw device in the
 main node"
Message-ID: <adoe7tscjhofh6vihvwnqlplk6abdmbppoxg4mqraxetupi3rw@7xomn3qx3mrp>
References: <20260224110139.3812757-1-xu.yang_2@nxp.com>
 <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
 <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
 <073cbeb3-04a8-4b26-a7b6-ef0b7654c34c@collabora.com>
 <xcfp6d2ma2j2xnsmifpvufofovqixwije7ld6332hg3zeeyxip@mocrjvsmjlqh>
 <cb73e1ac-649e-45cb-be5e-3fdd73dce7a0@collabora.com>
 <46zvnvkhnoa5w27o72tkex2rw6ha3fuisyeomhmsl5s5453x7b@fib4tezyywke>
 <736aabca-e39b-4cef-b914-a894e0867bba@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736aabca-e39b-4cef-b914-a894e0867bba@collabora.com>
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a4d543-1716-4026-25fd-08de7dafb53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	DoAsDjvi2n5ahbh1VSmRAVr6ZTXjmKE8HBsi+8O3mByQorNeUsqloKvyGRlqvqJpSOZQAL7ESRYbw2xTOnfT0PsuFKplUiz4zJrz9+IwPCXzGJWtPd6botObHgOxLOToL0lBwPPUjG/T7x3nLG4l3KK15LERWSgFOcuZPmFGLImi840JKd/JzBsrTXLpUsRcdFItodG9lXEDcTg6h1SxufNRD+lxY5/qbtykjTJAEivhqICdOl1enwWqWJnsy8la9RdBh84syCEiKQzrdooGMihI687tZBKE3oluxZG1r2FaKSWm8RSf4lLQ/pdrG1e0CrM/NHNSx/8wdU3PwU4uB909DabfQzxEi2kXutfH7Drfv6Mh5Q5lKnkEzI9HVPztLyHtlIcp8TwIAC9pFzEZq318ShvcfANQyUi2K4+WCDCaEnnQo6eukOO0tBvi/nN55Ve0gZAPDG2Q/Wd1Qd2J7bcwJZkbEB3o8tTcKdNaE1dfpPGWKXDQnMXllBEBSXIv3UfWk6ifjG4q9dxGUdCX5T0Tp5al6ELYVaOUxzHToZaTThWhLilnPCST7MoZ6uqlFExZF+ItXBuLJUcBZfr4HMU7n8tY9ZkDedO2iAkJFMfTG7WPNqJmjovJ4qGkojQutfJdMLCxhDTR1fJ6i6BkQJ9rxGHRfxhQDrIWm3Stc56f2RYewsHpsb3+PZJk00NV193Qtas/yAtz2tRcn8hEZsiqQmo0w0o2X7HEHY4L7XeX4gtT9h5FA91hQ5MeREl3zcn+8QGMjxeTa++HkZdrLycjyTm+32cz4gv/EoacLNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xl2xDKAV4X8zcCJNr2EAYmpBhOYOyYy9TT7fUTKQPheyYB90AuAYk9zPuS23?=
 =?us-ascii?Q?P8pcW6GG30VWSQkvdRUgaXZticxP48uBtQJRC0pRY/7X1DeqgsctMRmOP7Nw?=
 =?us-ascii?Q?VQArfeVFL8RmOZ40LTP5syrYXQZJAYpWzZIRYmiIfbvEJM1wd/eD/lQA26JI?=
 =?us-ascii?Q?Yu4jiz5zjFBYY3JIJhtZ2pqGu6/jgM8kobw64SLJ0dA7kNpYb9KpnmfoWOIa?=
 =?us-ascii?Q?jTazSpK2o88CmLIaJF0A7AbUcF3qZZwkrlWSFB4Ia1bUPLBQmeq9oor8fXW6?=
 =?us-ascii?Q?pNfCKw0jgeB2o26slfnoVoKwaYSqpGoyliXNPkNTYx+RFSLM1qdFuhcGdzFI?=
 =?us-ascii?Q?0OpdHWF2KHmJASNkT78j7uZ0GeC2K92aJzoVcUhMmcHKOyDGSWbHfMau3wMT?=
 =?us-ascii?Q?btabrLniFATOLGnP7v4v7t5amUOXPw+iDL9HBNuL8Akp5zRpAULd0Htyec3L?=
 =?us-ascii?Q?aoKi3ZAllsJHqggr82COeRXlxTH2lD/GWSkvrZMh/kQ5IK0KNxmaxFAuaqlZ?=
 =?us-ascii?Q?xf8fdxgSt0ID77QT56WcNCVg0nfxzeascMnxKou0adA4pXq8aY33p5PRSZNh?=
 =?us-ascii?Q?n6KGQao5Gz62sPl+EpG7VOmxc1nB5dZD9D3c5c0okRHXQq8ea4tm67lZ6BTT?=
 =?us-ascii?Q?L7WrFM5LWOxyKR8oo9DlK/Jk2WPzH9VQojhz+x2egogBDRMYRt1hQ1kYX5pB?=
 =?us-ascii?Q?zEzC+bKJiqBB8jYqh7j+VEatPI/wuV3ECl2sM+feqPPddHo74oJKb3eI1/4U?=
 =?us-ascii?Q?sjLf7rfv6q8RW8I0z3uBnGtUhmqFnJtg4VC8wiOodwDXIluxSW0HjkhoPT/C?=
 =?us-ascii?Q?pPc+ubZdn0sS/h38GXw0Cpgf6gSevokFSEZ2ms9IO6bMo7iN0G0DJ3KkCttU?=
 =?us-ascii?Q?SDE/6CllMuiEWBrQ9evuZP0Q+5owObox6zyhHi4wT0X51epEmqMYt8wTS64c?=
 =?us-ascii?Q?nsgiqXyNSVeRLJ0q7kqH3lpDFlfB7qrXGEhFy8+ZjHohKrqB0GbNrht0IEwW?=
 =?us-ascii?Q?2LZQXi8ala4M2L/T0CWAjY1Q77ulY6Dcer5piWhqd9psLn3YERTdlqEmgqHI?=
 =?us-ascii?Q?fv9/KRFII4oKl5Zex/3wUTR2XzdcfEqZmfZXkZlzwKquyTmXIT1hzTHKJWpg?=
 =?us-ascii?Q?GzIo9tkuyqWX1eHFYAeljGfaLFTVjU7btg2stpgKtiIndGvnVieH33u0eOSk?=
 =?us-ascii?Q?P7QUbp6fU4dVIKbLzB+Jk4cQOEo0wZZVhQWVmH9Eg50MeTJre/4tVlyaRE1z?=
 =?us-ascii?Q?aWnYIouItkHN2XSMe5rRW9glFaXahQVPdFK5yEVn8nMCPrmHPA6Q6TKZY4MN?=
 =?us-ascii?Q?djICP8Bi0oyIRzpxKy+c6r7HwbESyXzxLLMQXj92HH0cO5zc3TsRaS55JpHv?=
 =?us-ascii?Q?Ewnyx3s0ZN+c3h7vTbY0TCAxSs5Iqx08SL0kuMmnYiOdTkAPb+WBLIgWCXbS?=
 =?us-ascii?Q?ogoEnmZlT4qaIgWsfF9KmdiDpI3VTs1e8S0tb1XB8XHceCPvjQeChxpzpeZa?=
 =?us-ascii?Q?DDzv3OFtSHrTy2Op7XPVnyEDsh7aiqIPdAObf0gPxt9j10Oluha1O17URDJu?=
 =?us-ascii?Q?Gd/kgJF2/lK9dkE8oi9ipI+aVxv8VJ3T6Lcao8pT2nfW3M6LHy0lKiT52gRe?=
 =?us-ascii?Q?qUXokYf1vPmJqrNgqk18NcaTqhqyFDKnxWJ/klBFwCrUCp3dycWrFvugMr8H?=
 =?us-ascii?Q?sIzFFOqQ3Yvp2iQTMGoRtbyFc70AtBL/qTIRe+6VfVmvEwPDXd9tuwoX4pRb?=
 =?us-ascii?Q?jOqwpBrdNQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a4d543-1716-4026-25fd-08de7dafb53c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:44:35.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIcB5wn1sNlZLO7RE8iIqVD+uBd8p1UrdlJK512cbLhZ6GxPSwv7AFS5Kjcw9L02EJchvhS5LGXBUZ3dICLsGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7602
X-Rspamd-Queue-Id: 0893423500A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34265-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:24:43PM +0100, Arnaud Ferraris wrote:
> > 
> > Anyway, it should be another potential issue. Can you test whether below
> > patch fix your issue?
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index b8e28ceca51e..edec139b68b5 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -139,9 +139,14 @@ static void *usb_role_switch_match(const struct fwnode_handle *fwnode, const cha
> >   static struct usb_role_switch *
> >   usb_role_switch_is_parent(struct fwnode_handle *fwnode)
> >   {
> > -       struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> > +       struct fwnode_handle *parent;
> >          struct device *dev;
> > 
> > +       if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
> > +               return NULL;
> > +
> > +       parent = fwnode_get_parent(fwnode);
> > +
> >          if (!fwnode_property_present(parent, "usb-role-switch")) {
> >                  fwnode_handle_put(parent);
> >                  return NULL;
> 
> I can confirm that reverting 1366cd228b0 and applying the above works on
> this device.

Good to know. 
Thank you!

Best Regards,
Xu Yang

