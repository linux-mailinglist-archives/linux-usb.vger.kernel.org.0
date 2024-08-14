Return-Path: <linux-usb+bounces-13459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04500951C22
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 15:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683B51F250AA
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C4855897;
	Wed, 14 Aug 2024 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LSrDSVhr"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DE1DA4C
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643335; cv=fail; b=dhHbkUjIa25j0KvaGuZM04RvgyXiL7daF9mUAE3n/og66KOMINQwcON+L1UVWz5UqezKUSqkYZHdNFSJnzjOpTXxE5YB4YWhUzvUxz9GBlzUfsXlWRlmoTAkApbS3jf4ZPUEdkJ50pTegmooi9XGBky5v/tZga1c53B/GRJwVck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643335; c=relaxed/simple;
	bh=ZYU0xA8PtjbLmN/Vfa8bA3DhSv2ySJL9F9OMf+ki5nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H+A7FMXdRy4deaUxwxudkjIgFTf6si+SHNu5GcakYS04srgtAKFL5QSEvMy7ER9AOCJJFkiIk2wrmQ2H5ev9ktNSXV4MQ4SCMP/2kPKq3teC/ZUfY6gjghlcYSdZFq28gkP99WFpvvpeWLB/7AT1o5U13aqA2p8x9qqrxyGCzcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LSrDSVhr; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9Og28lomds7ewI8msqexVxgy3Ek1QFrVr3ubtxFMA6lTzPSqT+JuDbzHamuBZDA/Bs3QhuocXB3TUMaFwe59w6XAd1poZiiVEjTaCphIe1/zM/VFYPVgeHsigb5b1lXe1MVhF/WCLzmYdv+id2UESDNRj+PESKzhLovg/tCOIdRUIYRkHo5DMh6l+rCBR/KqU4D63rWYItTR+CWzLUrWKYPDZ9XZu+TtFZHI5w6HJYNiXG7UGjHlbdgtAjgns2LgZIliY3i4JnjId8AvKDmSAc1owq3nnQa7Ac8rUp9z4s2j1cKRVoV0szy04ft19oucXAGBMdblnz0iHtfQstwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBBVw1VlMLUNoeKlwnCA++tP3MKuTBdbUSlI4eri2Uc=;
 b=eUYsLpOXfNfxYC9sI+LL7O/ubkvdJelq9i4mhGtidpavpsGZSZIaxWt+NJqOhY/MxE8G4UrdZAv7LH1lg3l7IafPYiqQtqPhKbY/kDm36L6NBJ1PF0HTxyoANfs4vDv2ylTMVsiSEHvUg32NW1WVuSR8RyenxwlXdqeM9oc32vih91KBpAneYtYsh4p84FC2I7N9qySzZ1xWjc/CEEcuxUXJT+ZGY7TCoNFz1ljaRyiiMEiveqW7gBvvd5g8mu87i7EZXwwC9ifSSnmve+QgnObXyDDbaFJHK6jCq5vwudLST4hlb3w8wD3Zce4FYGtFq3ulMgPw51dmrYQXmWhzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBBVw1VlMLUNoeKlwnCA++tP3MKuTBdbUSlI4eri2Uc=;
 b=LSrDSVhrRtq9FHWryef4MIsIV3TIHghLI/qGdSy4ZnwOgVwVIj3OBsIDL/NxKHLSoXao0m2L5Ehtww/gNSlen8eKhYNmFMkMU7W07ry+7eR7sWOyy6iiemE3Xh8YYPyglrVURhA7NxWC2e0qwmc8XhSd98+FLKAqPZ0cXXERxypgYr0HqE7ifyf6H9wGeCuoiKtwvxHUooyvRESrMNfCBhEjSB7tRVKI3M8pcCVjvwC75S+t7xhZOZCpGsXRH4rfdoanuKkblcIzYYWLo64ZkNP1/1kXeVsYWqnZ7X8xUXztozieTtnwqAlZuhmRcuvItC6uq1PzznAtgIQiu7VC9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Wed, 14 Aug
 2024 13:48:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 13:48:47 +0000
Date: Wed, 14 Aug 2024 21:48:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	m.grzeschik@pengutronix.de, jun.li@nxp.com, imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [RESEND] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Message-ID: <20240814134802.tksdhu7yexuuknqy@hippo>
References: <20240814112537.2608949-1-xu.yang_2@nxp.com>
 <2024081405-sample-duckbill-ffec@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024081405-sample-duckbill-ffec@gregkh>
X-ClientProxiedBy: AM4PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:205:1::26) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebb5cd0-fdae-4e81-a866-08dcbc67d1e9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PBd9PkqCZsM+4m37RElOfJMqYqYaHnp5XNj+ePWc7NcOtkvYhnqvAGKQ5fCq?=
 =?us-ascii?Q?ZjEVn3xMZzd7A54ZxScedUL1jaZPMz3FriOJ9WUclnmzEtQOCM5qeBb8r4sL?=
 =?us-ascii?Q?hkQpy5L4OwcZGgQgu2avPrA9bKgRFGur6JDsV0vRofFrY+bxMI6lSXkbgLJl?=
 =?us-ascii?Q?PDOXmtzwJ2OeZVJRW5gwFg8Uibed2YGSqVPj/Y/0YfPyRlI56/nybMSzez6+?=
 =?us-ascii?Q?yFEpbADBXRcY0EAHnQvppdY/7YjkXBpB7/Nw/orTR4RnNgcilf0RYBg+38xh?=
 =?us-ascii?Q?xOdzEHYclwsRCLSqKOvxzvmJbfTcKcbHTE9jepDRIBpjS+M8jWZo2v8keKvD?=
 =?us-ascii?Q?XEKo1j8XvRM/Tnm/PcQ1cSJgGvXcA2zIxWbq/TW0QLqdFqhPatmr7/pnWidW?=
 =?us-ascii?Q?O9xP6CEnbayi3W2en7UyDQMn+7GNpFB/wZFufwudnPu3jZlLWFn4k8v+R7gg?=
 =?us-ascii?Q?CfNMrooKh5sWtpOBN2/Bp0bSolyjkZsw7Titu9EBA2t/0D5+3JqoKTGsmalA?=
 =?us-ascii?Q?hPbi61Pz9GxasTqRWrvTgp9VbpL3ot+mFsgqisBNWVxQSZsM1Rvr9iEkeGUw?=
 =?us-ascii?Q?3+I/PfF8yhHlpeV+/MnjiHqyV9DSVBvulH3LFE6Khj0/3yk0PYGoEvY75cFy?=
 =?us-ascii?Q?coZLw/fM2zzWah/J5FP5T2+Tew+uRb0bzzwXjZHLbOhyF6XXCMYs+bCmsNhC?=
 =?us-ascii?Q?O+VSOC4iRlCzY99vZ+eKZNpfb8Ft3/J6cMXZQUb7nnfKw2jL00vawuVkZ5XY?=
 =?us-ascii?Q?8jLbwl7jQZhkLSJmADau4F8t1qBCpVrZP0ZYYweM0JmDgoPGF+/ByzZ/KkXc?=
 =?us-ascii?Q?S3owbFvX24iCRLRYe0dwOIWv6W2t/gvOFQ3ViCkd5N4mDIyWRLQiAyLyeCZb?=
 =?us-ascii?Q?qCj6Vne1LSRmwf62agSgv1NFeuhTTMiabn03Bm4PMrN4LEof538G4b092Dl+?=
 =?us-ascii?Q?KmnRk7rd842wi+kGlc6VvusfFAxtMhileeQHeYbAluoPFgshzOClI1joxwCx?=
 =?us-ascii?Q?NGpYvKpf71kuCb8/Ub28HxwuZHZpEph3T2tpQ3OG80C67lt3cmWMRumBJlZo?=
 =?us-ascii?Q?mxyz9Vai4uLs3Sb2W1VkRhYF2KMTYif5dZ1wwm8xS+P65LYuHoROTKwTgD0T?=
 =?us-ascii?Q?PGernbHTyeRQ9UcGkdjwKJeiA4X3zAyySPZKMJTnHo4x+wBku3IKmPQYsCnl?=
 =?us-ascii?Q?crePhLwFRodn9d3900AGInmSRQzDawYGwsphMnWgCgW4kvLFZKjpTq8sChSL?=
 =?us-ascii?Q?DBfjG3GYxyTXgXA5yQ8thDLuJP2KZbqyhpe9VhOj6m9QU1o54WFikkpNBnUY?=
 =?us-ascii?Q?zqhp1BrOmIP7JSHK0dlcVFk/tzJrhEKKFRYpdO67/mnVVuGjxFFXPSFhTBpF?=
 =?us-ascii?Q?TwvXLuf6xff9tY+GLMK8SCRha8ZckYIISj96ZboFjALkQfA0Ow=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5qwnT24R6BW9YVS8VhNdOKiIKq+hVRLP5HpBnXG34e7ceDwqzfEbSbgE+0OK?=
 =?us-ascii?Q?l5C+ZGuoXPdE+Hcy/JDL1otnPCV46q2Di/6GVoHIdYfHI8rAltZOAdTr9Q8Q?=
 =?us-ascii?Q?f28S0OAe3LI8R0/K3pGWOmPk7EyFl/1pgzPSLM1Z9MdFnsYkowa15BDEf5qj?=
 =?us-ascii?Q?0lzUUIO7XFqD1LNRPtS8SonhmS1WOFt9iP9XGqX2GiCerGa5BiQuv1kSKbfT?=
 =?us-ascii?Q?zrTVx/ZvwSy1lHgWhnfen77KIujHgItECRqI7XAeZ2NcbefnufteHtrfUgXx?=
 =?us-ascii?Q?LFmCFWyz7zHlvJeZZTNDpboG4PcK77yYXl+tVeF100Jk5dft1MKEjTaX+Jxf?=
 =?us-ascii?Q?w80cViBZe+5vMb6P06skShWsuI/Lo7pWMuTkfua6ic0tzcJD0iOWNzPpyL4h?=
 =?us-ascii?Q?2ATo8kf7ffW6ta2Xsny+LH/wH5H7VJ8YSuvymUlu/KQk+7z25SvVB4YSjg1E?=
 =?us-ascii?Q?NzDKAvAnIAoEtZPXNSIVYAh6aLMYU+yq0OSbGjtLEL5dAe9H8g1Yn4z+74Ms?=
 =?us-ascii?Q?kBVqrkLAYREjeJKaWynrlMcyGnVpr32M/3NmSidz1DPMwiwzvGGp9PzXUH1G?=
 =?us-ascii?Q?N+NA8CWRsgpI8sKA8q7S33Q91dpvyozYpV4MPjK7T+w5S6TEnOgpf66Dhalr?=
 =?us-ascii?Q?ZI5VPZEUCjWVSYnxm+5nAPGmwFyXbzxm54ytQzFisXVgS0yf/Df0fkMwfTBP?=
 =?us-ascii?Q?TIJhokKQ2R/xW1g51ZW9nOoW9q8tEZ8jLhKP2ePEgfyEU9L1Trg7JG6LH04V?=
 =?us-ascii?Q?vgEcFCygnY6YTsSiT8iOPTIuFbk5etu++cFVXcsRA1nDHcFDmf03tOYJTNFW?=
 =?us-ascii?Q?iqM0dx6sODDAoMTY7SWhPr1cXsGlgvTW2QvYqCj/mone9LrRSrsYIc/Pjatu?=
 =?us-ascii?Q?OJVNu5TJK9wcwJu6pWakYcygTnraaQIepNr7Q1ICofareq59mfI2v7ha4xO2?=
 =?us-ascii?Q?EDJH4Kgb75Lw8sAt1nDiJDUJqmL09wNBDEi93Nmxb2rcxcFoadxIr0TVLhsX?=
 =?us-ascii?Q?Shox7E1E8+I2HiG5seOQR2DeggU4tGEq5BVg/DTKAlDiVObn3QczMaDFz9Pl?=
 =?us-ascii?Q?RidI3s6gd6sg0N6sFTYA1e3iabEE/uvAUJkBGosl57PMFJDG5K9x5dnvlqjC?=
 =?us-ascii?Q?ARiAZa1skgLSZFhrGwjKl/7bRSn4zIF4iW/VFuMbG4MitwgVxDuNgvDCQAAQ?=
 =?us-ascii?Q?mQ9zQkf80+W/imVKjKTWMlgET1M7yR3/d37O4zTOKuKw1gNaMnPWyNKWqqss?=
 =?us-ascii?Q?Uw56csPQfDzGtmLzHWMjFuuvWB7jArHQRCTbe0JlmkYPH4aHu8/yje39lofv?=
 =?us-ascii?Q?1jm9ribw/ZuGozpO2itz3BdXMJBZRVnCHdn6QRpxIPUEMian6KSMStC/a2a2?=
 =?us-ascii?Q?KOTUxvnMUF9k99NUyhXm0bVoZD5BLO/jwUD6/LANUVEpZO4UJP7GoBzQf1wi?=
 =?us-ascii?Q?MkHPNN7egKZzME3PCZKjLR+bLoL2nJ5ywmiyf7h+6ogmlJltthRikcHLTS5k?=
 =?us-ascii?Q?iIdCnWMNW4JW2SsuP7FIXhQ61/ylwJiEhCJGxVOJQMgwHlxzByGMaPVgt+tm?=
 =?us-ascii?Q?funYUVrnfP4XTjx/9wgzM9zBdUrv0hVu0lJDtRFe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebb5cd0-fdae-4e81-a866-08dcbc67d1e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 13:48:47.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7k0Sr+ex5ypd/3IW8Wio3kHqVF1xzwBIi2bzMlB6ekGQYhh1Jn0uS0gdwFjPhAVx8AH/V8iz8zfb99LGU06vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135

On Wed, Aug 14, 2024 at 01:47:23PM +0200, Greg KH wrote:
> On Wed, Aug 14, 2024 at 07:25:37PM +0800, Xu Yang wrote:
> > Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
> > isoc usb requests", pump work could only be queued in uvc_video_complete()
> > and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
> > we can only depend on uvc_video_complete() to queue pump work. However,
> > this requires some free requests in req_ready list. If req_ready list is
> > empty all the time, pump work will never be queued and video datas will
> > never be pumped to usb controller. Actually, this situation could happen
> > when run uvc-gadget with static image:
> > 
> > $ ./uvc-gadget -i 1080p.jpg uvc.0
> > 
> > When capture image from this device, the user app will always block there.
> > 
> > The issue is uvc driver has queued video buffer before streamon, but the
> > req_ready list is empty all the time after streamon. This will queue pump
> > work in uvcg_video_enable() to fill some request to req_ready list so the
> > uvc device could work properly.
> > 
> > Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/gadget/function/uvc_video.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Why is this a RESEND?  What happened to the first one to require this?

I accidentally forgot to cc usb maillist in previous one. So I resend it.

Thanks,
Xu Yang

> 
> thanks,
> 
> greg k-h
> 

