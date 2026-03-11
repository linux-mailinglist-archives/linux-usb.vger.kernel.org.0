Return-Path: <linux-usb+bounces-34590-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNZ0LjyLsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34590-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:33:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62E26698F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE71830A5CF1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A85D3DEAEB;
	Wed, 11 Mar 2026 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G3dW7vqU"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0803002DF;
	Wed, 11 Mar 2026 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242816; cv=fail; b=c9eL0AhiWxUAVU80Y2jsAfxhQwz4asp5Vy2thB5ZDgZq7F4zYWSTJLEsDgpGHARbGe5BMt8k8onOhVya0STwJ8hjBHHRewYYk4RUewZTYxRzdQLeK62oEogRAIzECR/L8hubQC/Vp2W+jE62DB8qso6uoHxEy2foNVrtA9o6naM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242816; c=relaxed/simple;
	bh=sZZTkmvHA70ND2ngn6jmSKUBjZMc61gKQnKtBgur02A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mP6OMQugIJ9uw9grXpf5yMcgw6McdnKXgxJtl/bLVk49M5Vhp5/lZfOoW/Ci+ymIeCChgFyUsJQCOcZwuFX2izlE52l/CDY0gtJeXO4t9KF7xY1TCthbGvqRKK/IQkNLs6ykQ2JBDkdLQBsz+vFzm6GbsLcu4/L9C87GLoS3OZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G3dW7vqU; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBUoZIxCimPUDEWlGlzSh49nw3K6VuXjHGxg0CTW2KW1DzeTeusixOMAhSUI1Tvs+Xb+fwX3YSlgQB0zzT66LNjWJXswAiVxx9hHEw7C7Pc/qzKUF6yAZPUu5mayeFkzlZG7RIH4FYCRLu/tU+H1/q4VrDCeoePdXC1Uo74lp+yG3H3ZCGCu7H4AQm3NKJY8xlNygOMsXbmbm/NmiQJtKlMDQhPdSPTzGLE/PzBfgkEPnISyQ0b71+hN1P/jG5/41PH9SIdnqeQJbraP5baAPgd3L9dsLNKCuyHwDP8FvjdNVPKH0Ofvg3FH2InaCzNYl+pwCkl/Fnd9wHwmQyG0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03bN75yQWGe0ivr1tldZHU5DhpIcPPIT2MuQhrgwfPE=;
 b=RLmArTJouhvH8+Bg2KV4qA6PYzJCQb3FvItz8JfA7A2Zctu0niezH2YDui0ssePfseCXDSCqi/d67zjHcpbhi2guhHIKF6K21klfwLzgUbMB9UnnU+y1W81zRhFcMNKxUo/P8jhji0rRWoJ5wUOnfSi0YXvbcnkpc/asE+lVgVPMb2e0nfRnrJFM9mXZQQh05Kp6D5Q7RidhjSWzdlQCkfapRHRe1P4AiIYbgznG9E8rtoI08RlOlrfOwWiBJpRQAQKDLyJuwTEFXllp+4izozqCSEd9cRnl0BICYD3onN4sxqHxZfgZPY2ualsNFGWbeyzZujIqL7ysb8cSevF5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03bN75yQWGe0ivr1tldZHU5DhpIcPPIT2MuQhrgwfPE=;
 b=G3dW7vqUlq5z3Y2BByiM4vGUhH1Nj470/fVSvWUdr379tSeQDBfqreJBj78JEiqyKgb+Nqhc8Fp5T9OMVuWjBIov/vzOrLtw5iSMTBf7EsZMWFei+LpdUjpPISckd0XmDiGG8wlUlL4fBBIY7oF8UpPNq5xl3ITyUIf9pAm0DhpLDVsBZYRvswdBFSIXMvZr7rSIc8YB75URtCvk0lgGteB8TgUU5nPkId3eTF8Ihu+lrNb/Qgh5BrHRlz+shyEp/HNzdMI/lTmFDtrbwhgM1l+6RO+16wJMDrX9Mi9b6gRkutUqrQ8TtGAgRrvlDU2P0ELDTmMcYTeH9QLmBzhIbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA6PR04MB11830.eurprd04.prod.outlook.com (2603:10a6:102:521::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:26:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 15:26:52 +0000
Date: Wed, 11 Mar 2026 23:19:09 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpio property
Message-ID: <xx5k6awqdaffor2ajb5jth5m5z6xtv4kb4wrma6fmk4pukb6a5@pelngr4qjgov>
References: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
 <20260310-support-setting-orientation-use-gpio-v1-1-da31dc6cd641@nxp.com>
 <20260311-spry-honored-sheep-de9d7a@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-spry-honored-sheep-de9d7a@quoll>
X-ClientProxiedBy: FR4P281CA0329.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA6PR04MB11830:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d796c8-d008-490a-6a9b-08de7f829eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yYQbVua3LJJc/KpqDqzUkDz2PmolT8TTCLOtGXF11QQiNqnUhrcFC6ybXh6bFBNmuzzCE2scuxvu7C3JNinfO5OwdGxLuI7lgO4QfZ1ObEKwMD3kdVg9Q1LyIfIr00+wLpra5X8WL1P1gJ1FHfQnpGXGuXwxcfwq11eR/BCWYvcObVJWhiIfyGUE5GTOZWnSReSkDf6+mLqbCd6KuFC/hJiAIW5Yp35G9DihgXqHpJtEPuZXWYiya6qMBtRHyAzHpU5ahQte33tKa6cYgneQboGUYWAdhL/N8qV6pbqj4pX0RlO3J0WNSS3QaAOL3Kcat7RAD5de992/L6HB3IAFmeOsqsyRosbAvjPnu1gkQtLu1361inTgvBh/tmXlUGb6ytc/81wbU2o5EsNFnMgR+RfzcAeWYa/02RBCJQ+nyQdQzBZCAJ9EJjUrSta38Uj5vnD9iuJ3db/lrIEY5UtRGp6N1DYy6WvHI/pJ2pX0uE0qptQ7JLPE2Xso1+WWknvaqVbbYEOdUPe6ulrGaCsYDAF5z/L2durkYBgAu7VfKAVv0Gr4IPdj/BMIb9c3t8PVYdR2p4YRyDDzbmO0E4ogxiy0Zyba1i6zi1sJC955IHislC9HCRtgW09aXKj2R3oFxdCaCwP71Jxxf6RGcr2FMjymyQWVEvIIx6Saf5gNtTlBFLfnao5Em2mFtTm4zuahYwY11AKXP3+M2mn/DbZT3KHFiSVKfO0ZsxUjS1R5qrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQv+hHkvWV2+uRYUCIvIoSJNP1hkxoy7Ec/eoEqJy60avdZoREBJTvzilkMX?=
 =?us-ascii?Q?GeDQ3Fa4SrVU6Kb+tWkOdcObLkyymcpgXamMNx5cIja8DrorUt3IXGxrqhLY?=
 =?us-ascii?Q?hjdOTGYt595aRGFfAwlgqPU+IAYBgEJTFxvIFQlXy4beZKb6tLhqAUv3XejZ?=
 =?us-ascii?Q?jsqg7nKUMutJptihuQidrlsAAkU/3Z4uapRmplo6Pz8O6N1tlxzh4y19r06v?=
 =?us-ascii?Q?y7qfRA+tBCm11VcoSIXRH7ycpgCu6r1elRHl1bSfMFwNRsp6t20c0F61h8xc?=
 =?us-ascii?Q?i9AXElkVEwy4IW9flfypFqm+w7tN8FbUHM3l4qdwy+Co1rLI1PrVuhhiRsm2?=
 =?us-ascii?Q?zo/TXU0gxXwLMoOqmqWzBeW/eTF4IXNpqBIV6xHT9C3tE0C514VKi3gWny+u?=
 =?us-ascii?Q?rCkUSGGUaGc/bk0mL7Ln3nhFbz5LumsYpvcybxpJKWyNbE2FrPmCcJ/RITd/?=
 =?us-ascii?Q?/sHMJ0ieLB8O9sukGPawy31qjGeE6br1jWOX/sO0al7FJsrrMYhCwCJmF8Hi?=
 =?us-ascii?Q?mMgfalniWc05YhzVwVQRulYyeQXSpWLjp6lAsW3I3GynIxrtIqJrNuEx4Dd0?=
 =?us-ascii?Q?0ZJbiqTh5J80/Wl9jXzlsXQXGD9ENECTrQGtpYBH8K/0Ygvrm3/+CKm7OJGW?=
 =?us-ascii?Q?faLTlHL/YiME1fBBSQ23uZUugKPcuAmSu+zEL/K8cCQL8HwY7mjFS6EHW1MS?=
 =?us-ascii?Q?tD3PsK78LbgmR2iiQYNxGy/j1hr5TSl0dqyBCuqJjcFBKvBHvvchbMUniAMi?=
 =?us-ascii?Q?zcGTo0IK1hZSUrynQJzIoF2l0MiE5pHgdYb8sq/NiVXh36r3R+OWoL6c8+oL?=
 =?us-ascii?Q?4nWh6fWS2NO/1lddZ7Duv+0zDQqj8+bSOT14ycQMwUACQ9huidO3yb2yTLjK?=
 =?us-ascii?Q?ulXr3EL8SxQkd9WFL/myqxC1BsiJZ7v8flJca0JNyc9ClvvVw6AVMUNgMzDp?=
 =?us-ascii?Q?0JUvh7NnVFerJQb7O9zJu8XEbm9KaJm4PXymjMleRoCO6YZtDDLi7mlCdr68?=
 =?us-ascii?Q?koGDpWBbqFrAZsmFpoSZWt5blOrRx3di7oeB0YVu1/9zjoM5N6KI39gur2It?=
 =?us-ascii?Q?2Stdb0JuQ2IZaxiiliAmJTCSA3pu0LBtCM7xKuk3y4D4KsxMEVxdrYfcRQLh?=
 =?us-ascii?Q?XmaMQs/gNOSdegNG2U/YCKo7inJ+jwL6a47IfgXyHCmK0sQAJClKoz78wqgp?=
 =?us-ascii?Q?UoyFwCwsGSg5RrGsWtOsTUvks6MKKNoef2MPwmlgl79bXGsr3lAYkSHQdzOH?=
 =?us-ascii?Q?vvphBfypqzOXL7ETJ6QUw/F+VfYOH55D3ws/+H82iMAE+STe1AxY0Z88b1GR?=
 =?us-ascii?Q?Et4vLkc6v0toXd6iERD8qalJ8HL29BrSlPAgm3ZtbVP0oKWCmIXUva/q06Aq?=
 =?us-ascii?Q?BLUSu4zyXaFRBnretZcNEef3sPVe9muRAktfYOEMlghCqOugJCygePrfH8j0?=
 =?us-ascii?Q?RbgNivcszyzHyrevclgFhMuSJHIbx/hdqjT/sdJy3mX7fFIAAlCHz7jyTdos?=
 =?us-ascii?Q?o+ft2F7o+yoTDlqMYXrrmxggPSHu1q/FlGuyhDb3bIO2RZpdEncP2a9oxhfc?=
 =?us-ascii?Q?ZjwSo2V9mw+0evCe3/+0FDx7x4Ye01O9N2cQKMfMh4BZ5Qw9jBaJGO72KTyJ?=
 =?us-ascii?Q?Pq/MZAFVC4JTz0qVnDeObkZZischMGKd9ACsZL1P5hYnqVta0Hs4f5XbaR+b?=
 =?us-ascii?Q?6Hbqnc1y86TGH94lm2iCib7kUM8MgS2b6VToZiS9MMhmYH+G41RkaqP+rrbh?=
 =?us-ascii?Q?F4Q3hmBnYw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d796c8-d008-490a-6a9b-08de7f829eec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:26:52.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WeNkHNlWdZaqpXPYCvaQEg6FP2Fvykc+IbLvay4sKyO65yjejgGwoqqYPg8SW+4IRpThbNGjvaQl4kv7CIy4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11830
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34590-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 5C62E26698F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:00:21PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 04:13:56PM +0800, Xu Yang wrote:
> > The Type-C chip know the cable orientation and then normally will set the
> > switch channel to correctly configure the data path. Some chips itself
> > support to output the control signal by indicating the capability in
> > bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
> > CONFIG_STANDARD_OUTPUT register. For other chips which don't present this
> > capability currently there are no way to achieve the orientation setting.
> > Add an optional "orientation-gpio" property to achieve the same purpose.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > index 65a8632b4d9e..866b5d033f4e 100644
> > --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > @@ -26,6 +26,11 @@ properties:
> >      $ref: /schemas/connector/usb-connector.yaml#
> >      unevaluatedProperties: false
> >  
> > +  orientation-gpio:
> 
> Ah, and you cannot have "gpio" property. It's also typeless and
> constrain-less, so looks like you create some random code here. :/

Thanks for your correction.
After carefully reading the doc I think it should be:

  orientation-gpios:
    maxItems: 1
    description: ...

> 
> >From where did you take such syntax?

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml?h=usb-next#n61
It may also need improvement.

Thanks,
Xu Yang


