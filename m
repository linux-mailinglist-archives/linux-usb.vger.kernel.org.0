Return-Path: <linux-usb+bounces-34375-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIp+BTGIr2lvaAIAu9opvQ
	(envelope-from <linux-usb+bounces-34375-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 03:55:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC642447EE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 03:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77B91301706B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 02:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7A93B8933;
	Tue, 10 Mar 2026 02:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JZBZ+gAa"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F593B5314;
	Tue, 10 Mar 2026 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111340; cv=fail; b=hExgeaO7qqvhHStp96j6thgFfLU0r4e/S5SAywV4lFtoBPx0FJVyse+lorEg5/UEDWiaMBPYrASIftAmoBnO8j1xamcBFKQ60KZdjVypybQtYpAGYOyo+JrDgZ8TpvPIKFYMYqNqmB9drf+T0ofieSiksLFPXUqNC0otXWvdJjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111340; c=relaxed/simple;
	bh=qWMI+HIET51qc9Gau7yFEvJZBfCUkG1CWuMKP9QPLJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FrpRMNQntE1Kfag8F1YQf4gwuWzH3W+D2zE1wUxfPWq4u1RhWApej87ga6Z1xpiyjaPY6ES4IZHHXjvEUQt50tUF8rdn8sxAIMiZGArUapwuWqvVhK6RINumTYtKaaJmshIHHQCwiEoyvwiHildPIR6H+5YZLh5CzPruTWHLAOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JZBZ+gAa; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVdJunJc26OFGVMJRQqY2ny9y6B0garylXHwj47UvtyJZGhinV8hfzutM7ZvIiHGCBw7SSNQHr0eHKEK4kMJRRrBGPvy0PvIKF7ZEFCYxe3AkKR8mJjUrBX34ITNvC/ouPY8j5Rour2f8kggEi4sSV/KQXwk/dGyFZDypmAlwydiJCZk3QIFmXDGBW/8ie5RB2poqVwAEd7DWkm36UAGKPXWWBGV9H0v80zT3BbJ4/qglBD7PNsoLKUMiW9cxhOlX5IlskjDfIsb4FF1PUfMdh7iydU98jQhe5qPx/8c8GZtdPjyEngBco5ajEVpJ+hQN845Ki+dNplcSgAw6iyloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBZyKZshpInKXhw/hKhGkoRx2G15wuPBm48FS1He7SY=;
 b=abP+AEQIvhm1sT1pDvESTB/LpXa2HuoOLwMKoPFaQFDjCWcRwlXBY382WzifSpZkAezuFT6rnDmxo6Qwze5WMHyqHW1BDEvUITN/r3TPJn54APWoCvSwvXp69AI6OzbyBo7wKsS9jlrKjIdU1UtDqoZM7srOiM40Q+IpIkmBD0iWs3/aFzjNcb95iphW5i/FKNgkcDHcD81HamZosfhUHjlyhiZeJosYFWDHYN0zs+RgQ03BNpztCqizW3xnZmLfHMEV1wu3XAaQF8Bua3GBpv9yWd+e8H1FKsCmPkHfE9kgni+3DlbCa29RHOmK2SYmtv8SkZ6PfO3wF8elC3b20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBZyKZshpInKXhw/hKhGkoRx2G15wuPBm48FS1He7SY=;
 b=JZBZ+gAah4DGknif6nGIjp3vQHp6WXkRBpKfh0dCeJv+2MljDZh4RCpwKdZdXpcR6DZuBO4ZnvKZL3o49Y6pf7Tf0DXbnASCPienkzeUz1wiP/tERbuqc/N4GpgiGxPsE/As0mgezGhte/k7ntq3GH6JUvAAzAn0DJA8ppv7lYUWc20opZEFGuekUViNzl+oDq7t5+A9rGrz9H4uKj1nd2H4v0CHl+ebrjXnUUGeKwb5gFqbACGy0ZszG2ExoN/ayXeIRjO2+to2g+f460Yb9qEKh3vB+joovEQiTP3L44RY7oBSkH0wTgJSl4uZmW/swRNjYx6cQdqlfIY5xi0Rzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB12265.eurprd04.prod.outlook.com (2603:10a6:150:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 02:55:35 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 02:55:35 +0000
Date: Tue, 10 Mar 2026 10:47:51 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, arnaud.ferraris@collabora.com, dsimic@manjaro.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Subject: Re: [PATCH v2 2/2] usb: roles: get usb role switch from parent only
 for usb-b-connector
Message-ID: <oep5avs66onfozfbffb2z7l5jkrrtw5j5fq5z2dejgowapobk2@7vjajlqfg2uo>
References: <20260309074313.2809867-3-xu.yang_2@nxp.com>
 <20260309194902.1785552-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309194902.1785552-1-Frank.Li@nxp.com>
X-ClientProxiedBy: AM0PR05CA0096.eurprd05.prod.outlook.com
 (2603:10a6:208:136::36) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB12265:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e3dcd7-0270-4968-9f17-08de7e508052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	6ZI1s3QD5wPCCJVgcoqPgpJnC2vZ21WftP1Yanpbqs5UO8BqfDdU047z9wVn8Je9sDGvpgSDBBMuWlRq5l0/0Lc6QRpDrLN+BLpGHf/8Muv5pcKhbsXrnpxurpdBjIbRZZpoh8lB604VnGPfNSDW/ih2kN8chORt7VOSLvs8Oqm50HQyqlR+cA97zS+BfEbyNVnvtuh1wvHG6Bnjluza+CPL9wABBpHRPRJPdXtxaNOVW1NLNJ6b/6SDsJcK9Ea0Y/hkU4jqocIvAKgx/U8LJRR4bYvdE5XaJZRq1gojDdZVgzi2jiA4OB4uBXqqv3JYW1eR3mM5OR9fVQJjdSWmmgCVEfjkGbtHJfZuF6fBFDKg3iKWInVToaAfdBoggRDJXX1F5X9LpiSfhGxzNFMcbIvz+kUDBG5knuYrszJPsU1Rkwv5xlsfGRqDyTflOMCXFRAoEmwKnqZSxPgIiE892vLXzRz3X3Z4zVRXjcLhnI0jt1qGBTXSR7zNXeSwZPwtnhaX5x/Fj+BeObpLfSA+hyWdzbWKOEGI9e9dBUICT16SNGp+OQRe+STaSDBCFe1bLj8YkEAizE9mYsVvmTk4g9Afj1tBTDzaAz5YrD7V/yuCHhN1JQ8vrd89lPdUSyBrMa6KP+jzRVqOQEwKVPLxCUmWhlXfW2ge47zVX+0CHI9HyMgKRKzniA8rbOvvdm1YamwZrpmp+8kLVu/eaAI3rlIAYjOk6XGxtEjcaHFGEnwE2iMtByEVugJMWhdGoa+UrRacyniGWbxwmqScsJEhpGIXE1fQog+cTd5K2bOoLZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4WXxUUsdYrNeOCdK6hPw7dIuNCdbK0MSxgft/vF+kO/0PWD2NMu5K5y9Mg7z?=
 =?us-ascii?Q?9Ey6ZYadgJLQAuGsNA3xLwR47daTJs4lYM+dUW9ylpDAipjHcTHp5QxWM/AT?=
 =?us-ascii?Q?Tc1ZZB4lDJMkGQzCi0Qwwrigwe3aow2zsibSTl9xEJTWGPmkjqYZKbLEqXMU?=
 =?us-ascii?Q?mB8u66s+WdMG9v3OkPFmXShmzrF1wlY6O5pwJ0j4Qvc/TVdjL6rODSOno9BX?=
 =?us-ascii?Q?44ofmwx89f/QdbJh6mvVSVQuhZ7L0C93iEnKM8E5Q2OGt5Ao1839adDb5LTB?=
 =?us-ascii?Q?rOn5pPUvpMAx+J7ekBE602+uNnKWm5h/k42t4UD3Um+1bHiMMM+xacC5Jzeh?=
 =?us-ascii?Q?G6wpxIHMjVsrSz+OhVLig8+3SfTbOsOACRzSjkrXNZp58ANMBkc0YLj/oJPB?=
 =?us-ascii?Q?0pvt1gGH1A74beru9jK3QbDwfetkiASmRa6f8R9QB8vdsCPE14A4iUpgm/9P?=
 =?us-ascii?Q?QTGo12+UNFdEGehRuPt0Wwy2lK36B9djsBzwqCbd27lBdx/EpO7ODtJvPkiR?=
 =?us-ascii?Q?IKWU1pJILlzuHUorrXAYZ3MWY9lmT4TTAXAr4vrnKEwOF91ddiAMDnUSirjw?=
 =?us-ascii?Q?3zTfWUD+YG6UqksnPwEXhd/A0T6GoBk0qRA3Czs40rC9tSU11QnmVZlalVZP?=
 =?us-ascii?Q?lThqFYxymA0LI6EVCprdmWo2kyXPnKywWCEUA2fusaueLAbl47d5U9jtKtn9?=
 =?us-ascii?Q?4KsAEbOyN+0zAr0ty+IYffTpRIGQkyzWIfyt4CT4yQZBQ+/bxQlXynEFaUmP?=
 =?us-ascii?Q?NFo0/w4Ig44yTiwADc0wta/YgOvsQOXLQnQqnmlYCL8+9tgiR0gVoghOAEx2?=
 =?us-ascii?Q?7iz7QDsiy0ClTZC+fn09fpR+5gFJJGNKuHUddNKqP6A7rJJsQiV/MTZ78ls7?=
 =?us-ascii?Q?KIi+robSEplz2MOnF/bmR4fg5PHX7G/2v8lHJxEH+anhpQHznQTnGhz+1nbm?=
 =?us-ascii?Q?hTx9gef7yitjXAP4xta4Y6RysBt3/9jVHcC6Ptr1WoWvn30FDbsdyM9I6oil?=
 =?us-ascii?Q?UIOHhnU29TkyzUujhbKzOX0NKo+U1orwr0IBH/KnXzu+5n1KT8n9kEw85lXc?=
 =?us-ascii?Q?Db2xe8huXN37ZdFuxmADwFiKK3dggtXBDcwCvJxPGQmgoiJySH8UiFGQLpZy?=
 =?us-ascii?Q?xfiuMRDHUYOo2ooZi8jM26D8s1R5RlYhDtH0t8G+T+TMNUQcKltcPvj4uRah?=
 =?us-ascii?Q?DErJvqMMnBYCjv15yjhA6xATijVDFPgAQo2jh/+FMiccu+as162G+h2UGwGy?=
 =?us-ascii?Q?BVhJQoWXsB34nukuD8e9RmZUoUUwgVoIeZ3N2d89ALmAUTIf4AfENLjomWMj?=
 =?us-ascii?Q?iBs3sIKlDGch2YXyY6WV/qF9mP6N4vWwDfEBU9jvuAjxIQh9Zbq+0awm1S34?=
 =?us-ascii?Q?jjXcH+WPzlkpa0+GSrrc17oq7QgQRVF1c+uwenW/0P1yOLzNJoqgHX5f0qFI?=
 =?us-ascii?Q?INvk6oJA8rTRfBzse1xlP/NVmtY+d6T3ak7V/vHzmzwPsTc7OWId7RlNW25i?=
 =?us-ascii?Q?Zz+RZxca3bggHLb95uF5ACds2upGGlBTyyYKVyjqQv4t7cfkSaJD5FhXnHXu?=
 =?us-ascii?Q?W2ZJBZncqV55vyBUDip2gCJkdFBcOxxpDsWZAM+MRXrYg6bVmuX9uepeopCg?=
 =?us-ascii?Q?ePpQpt7e9kb7hAQTxkm66KCbIlZcqYFQ65SDIqZ94R6Yu4tk9PF1TYkvZal2?=
 =?us-ascii?Q?zFHNenUA4pS9fe4oS/1JKnLpoyP3kE1GrSMDQN8knzmHIQAh+ei2wO+MbM1V?=
 =?us-ascii?Q?BmyKBBcwvQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e3dcd7-0270-4968-9f17-08de7e508052
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:55:35.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQuEStTPVtSHEs2BpDftFp2+yH4cBoAu8PnhOokJrfje1xOSJ6b3p9jy1JF6lGtTR6dw7C8ObJUMoBRUCk9vrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12265
X-Rspamd-Queue-Id: 7FC642447EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34375-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,52.101.72.58:received,2603:10a6:102:20c::17:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

Hi Frank,

On Mon, Mar 09, 2026 at 03:48:59PM -0400, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> 
> > if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
> > 		return NULL;
> 
> AI: Nit: inconsistent indentation. Should use a single tab, not two spaces.
> Use '\t' for the return statement to match kernel style.
> 
> > 	parent = fwnode_get_parent(fwnode);
> >
> > 	if (!fwnode_property_present(parent, "usb-role-switch")) {
> 
> AI: Missing NULL check on parent before passing to fwnode_property_present().
> If fwnode_get_parent() returns NULL, the next call will dereference it.
> Add: if (!parent) return NULL;

Ignore this!

Both above AI reported issues are false-alarm. Please refine the AI-BOT.
And the message he sent didn't reach to me (I'm not in --to list). So the
issue may not be resolved timely.

Thanks,
Xu Yang

