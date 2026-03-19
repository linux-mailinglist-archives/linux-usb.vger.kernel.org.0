Return-Path: <linux-usb+bounces-35115-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH2mJQrFu2n1ngIAu9opvQ
	(envelope-from <linux-usb+bounces-35115-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:42:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE62C8E16
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F280312A913
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7486A3B6347;
	Thu, 19 Mar 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aaLSbhrJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971A3B2FFC;
	Thu, 19 Mar 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911694; cv=fail; b=ObjMoquazutsskjOx0RuEakZfmFP198vUnz1YAzKeBJklrRh1WWRvNcSFTaf/bxICfXa6ip9u/N6K4sZHqgLMtDiputzxhcUN2vteG8cqK01kq2jn35yioBk1v2ygIygHgbWlzOoYagV1urOLkVzfutfWpztJqDiVRFRB3wuFBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911694; c=relaxed/simple;
	bh=UkAJkESbL8ymPIzjiMd/CTFC1/0iPf009LoB+03SfYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RNA+f0CVpPfsxpQrczEgqyp2hjM/CJN5yhUXxvZAdklgpmzQmr7XaMD44JPecsa+VQXBejDUSAFQDbuVcl8d9Detir1av/vFtV3P8uGvJxLw47eNn0w2Gbzpp8w/vSc7UEYBTu5l4WR7rNXaubZEDMvJAtnzRqGMtAJWhLpRnQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aaLSbhrJ; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAGzDd4LYIwY4YMnZB6t+O1F5SZKQD7NrGu0fq7wisq2ubX67jJPkv3IZncFzkaQHeoi2Xc43sjRlLq3Qpqx0AK/xVnow+4MDcrFaUSfpsRRmjcelO1Wo9usedzwihl8IeeFozhYaNb2VSqRklNHKUIaCuLkuStKCnGaIwsNpmPveFFGMD3up+VTZqC0jQ6afq7xDjAEEKAKahBbYiHCtSyleDe0Et5Sy4g1/9NT4BPffFl7YZDphDoWWK/RzSKAsO6o1CbhaRdtGOgs3TueGAa9aNLql1wEiVBh+T4zI72RpDRzUwLxTGFq4yOBa/bp4dwL8+Sg263OxoJ0Pnb0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9JnZOrWwVmCXYuTIISrDwf85N9dDWobwgGTD9M78+M=;
 b=v1Dic8QEJUUsDyarFk4Fdgg8oanf+2HxaxnrUSUtc2uIvfSrlBMHodawk9odJnBBaa1JsHi230+N2xZx+YrvkyxbkGVxNzd4CD+mm/EeE9kXQqeioELVJmTBQfLJ5e8+uQ484aq6T53AUfROFlZ2RLl4HIQ4x1IGhAqjbT4v0c0XM8vaLVDIR/hXo0+NfiJ9O/jE91GZUqZJgb7itg+SIkAknkVfXNXa3NJ5opS1Z9PStib6l2AiV+7/10ZYbsLPpIw70Z0Veo2PAr3dg6HGoqaRKt9PYHjE1tCdA4KH4CFRYJnmslHkyqWdgXAx41jP9sDQgC8976tanLfoD2bJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9JnZOrWwVmCXYuTIISrDwf85N9dDWobwgGTD9M78+M=;
 b=aaLSbhrJOQ8l8JjsgklOM86y/9gMMTYG7noKhmOTMT1A1b362EPicIbnYwUlq6363z/NtSwIa5DAol98peLy8M3E9uZeLlLn6Ds61OB8McivZs3UNudkf9DaP9sUgSQGINHcJ2eebv1UCrqZf5MmZ+V3u3lvFrtMjsTw4ngWSxEBVTuXJIuLlBpglaGYiAF10xlLKzQ3mAHO1HYO7vvxx2NKXEHtzazuClhqj5yherwdoMMXJI0SOXddLcu/sXv+ALCmcwtSLZwBI7Vy9DRdAyBrS+rhexswTCgVLgEvzM3RLMZl2N/mhMJcziqC5tIQzsbbfNSkASkOlZT0uigg6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:14:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:14:42 +0000
Date: Thu, 19 Mar 2026 17:06:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <xhxmqikxhogfjqlkijj2ile7f3gld3txg3wcpryvl4cds6trmp@bekc767bb6cp>
References: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
 <20260316-support-setting-orientation-use-gpio-v3-2-0e6622b00dd9@nxp.com>
 <abqWGW8vimyIq7hi@kuha>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abqWGW8vimyIq7hi@kuha>
X-ClientProxiedBy: SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) To
 DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 070d15d4-f943-4d29-767f-08de8597f490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wLI4zDl1grOOE0gkEo8aVm4ZWgkyqfV4m66/XA6uNS6oDoPb1VwAq/ZUuMeTHF1ZqeOXII2HHnd037yDYK3QbvbrlOwQEOflx089b4pB3CGqm4RYu2Vrn0fEzcw/d/+EScq4PeaR8As5j4aiK6b/t2kgH5ybRW0djcpkSfD1vZqrcgfMA5U3Xq9WzNvtOr6kFSUBNSKZ3qMCoTiXXX02KfjwCVykIKvpwjeYcBQgJIeX7CcEo6h8G3X7qh+I0AEEFlA4MFWM1Y/hQV0g13sDkIrBpn26NZMh1O5WVFv9/cPqrI9476RvtXGrB3YbV7jJs1fTzufg2W2pcbpTMOHcWof0FsADoACY3PjwPktCWCB1v1wz5gP/+Jl6OgPZlMC5NgUXLcr2wRAbZaIBxgIYYySMelXlM3MxBmkUoS6ijyEV33QVn0uKiNrxrLlPNizB8Drliohgtrm9kFjONzmlQURZa1NqLqXmRfRBTo1vtRIyMgQPqfl5db5cUqON75ld9uG0KatrO1N2kAFFAxBNbide5EEphAaZnAbMk7o3UfTDZI9wveHo4bGY8MEM7p98n1BPlrHS7AAdcdBA3Uew2RK9/PowDTxqLqtXO0iRFfE90VE4fzYAVm1ym+EuP/Ds6qRRY0kMtG7KDfUKZCsF0UeQNGTRQNcsH3VCMRXaYsaJ1d18rbwZfgU7liwuRQQqxrAgQR/xQ3wXPCNVHgewu17B1gJmeYwF0lJ7EicxWPVCWsLZ1xlvAIQAkK/SHKPGm0OCB6wyq/WvUabztrCEn0RIZERZNUcWDVwJjw/48Jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aHNLwGaJpxEeAUa6mH7HR9y6xDJuyuFoVxB/CRS9vT3SRdzExZmTdatD2jtA?=
 =?us-ascii?Q?JmptD1UZ+8t6Q2ErI8htJbec/tDQE/vNQ3ce0LLQ89AYwXybl5RbPV7TABzn?=
 =?us-ascii?Q?SzxZG5qTfp6E2vX1lWkJGkD6zQQKWHi4zO8S5d6an7FBsv3SDruW/hygn0bF?=
 =?us-ascii?Q?UxMLoqFnti20SxTki6K/JnEURUgmjbUrB9tBZSOG5nrZ33V4N2n2LNKUyVRU?=
 =?us-ascii?Q?ut0ZaPou9o+zFCeJ4OaSgsPKRspL/QQm4Ol76j2QPIRnRUEVFX6VlNDat6KZ?=
 =?us-ascii?Q?RBdqriz5IhM1x/zNBR992JtW7oBOb2CoKUx6O4dPKW40+pjeRGckWWtP+rI5?=
 =?us-ascii?Q?p6GqCx4S0lbLusWFTRmi4iq0Ehns++nNrACh7Dgnrp4Qd8ttN2aZhr9W5DKB?=
 =?us-ascii?Q?ojidib4mBXxg5v5rRLraZQh0Hh67cFF0pR31Ef/d67x0Bn0cyYunENoP4+Yn?=
 =?us-ascii?Q?U1Y6oLQL662ZTF2Ihfe+EBni0FORoDXgaN9V4ZND5VLsZJdy0rn4+LGdk7+S?=
 =?us-ascii?Q?f8FgUX8CCc/Q9rvVK2WnH1YD48F6ye5b1Uzc48mnV531MslrfJxN5sDgC3kn?=
 =?us-ascii?Q?uJ/XT1HTsRgYguTOtoF+Njmghw4gcWOX9I/q5XMk8xobo+KY69mhWxA/g7F5?=
 =?us-ascii?Q?IOHaM/dle0O1hI3jiOuNDOWkAbENviyX7VLfEmbDOsqNRlxU6tOYaoWKCpff?=
 =?us-ascii?Q?UEkgV2vt70/epyvTi2YDsM9rOpiaQwfcLYOys5+nQyhRbSCpt2B6z5xCkQob?=
 =?us-ascii?Q?wuCHtbGGUWAP/vwUEPYGQTvcJLZE3Semw5LIqB6+hrf2OqvR65rpWJVXRNTq?=
 =?us-ascii?Q?WXFbe43/05MKK9Ppz8ywP4btM7PjwPL4ny20F0BkuCClLmOGU+uLNUZAyVj2?=
 =?us-ascii?Q?Pt7Qd0KDd/BKLHEYHOwpQdtllb9v5m5aCpQ9coOSooi5NYRmG0zQ/oTuE67D?=
 =?us-ascii?Q?bmFBn1Ois894JB5pKY3yaZPgsGbvfjYuIA7MLux0VTc2/IR1bIUzxgGkWlRI?=
 =?us-ascii?Q?Om839ttOXd2Y4oq1wZ0EmBaKqqp+eHON9Q4QEKz6kZ5L3b4byENX8IGRUxFV?=
 =?us-ascii?Q?bW6EAoOQmPXw1Upg2b+6o/YQ34Y9j10dB1ewsQTE/O8OGK4L4E1uJWE6Ilqr?=
 =?us-ascii?Q?N7Qh5oIrKIhdcsQ1VqEg//8KbxnJ/wK+CtWBwUyDU3zOBH9tFALWVtuVA5Vh?=
 =?us-ascii?Q?TxMKRzNtADGkRho0EfWQzx7gPGMMKbcnWBKETQmpdY9NhK8Ua7cyrwxPkyHo?=
 =?us-ascii?Q?h6u8aBZoIayPVRn6X23ErwSaVn01VmhdDlJOOd8gxpsEwNw/WS3NWyQ97VT6?=
 =?us-ascii?Q?pgutT0NF2orxtDH4NjECRUrteM/FzQDFhx1XQKCPF+MWU7/eTCJNOXLsVpMK?=
 =?us-ascii?Q?ZY2YuUDqLLcuVseCrRS24E7Rc1SSPyESE1/r0qRlsK/fT+9TF7Yv/oflRvr/?=
 =?us-ascii?Q?MscKfCWuxkhRaTleIMrWkcT0m/4Noc7YZQjrANPG70r7z8nvRu3XG6b4x8/2?=
 =?us-ascii?Q?HXOviXtouGVdENVBeud06VHo7loWlIfwHUcadW0YO/2he8qCjoL5tvE0NSqS?=
 =?us-ascii?Q?CLA6mtBD7JtAZv+YngNRuz29hheNP3JDBjlY2kppiguPDF0PCI0HsEXv+ZhD?=
 =?us-ascii?Q?KHjHpSPWwVLFAwctKdQYxqxDYmUh1mrwFiHB11IrJYYY3PHQIG6fV/HsMXWO?=
 =?us-ascii?Q?PbQk2LLJ3KxHZPQmZSdLivnF/DwRMIyqCYp54fJV9/z+Rqv5lWCvlVPrghEr?=
 =?us-ascii?Q?GsNQdmk/BQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070d15d4-f943-4d29-767f-08de8597f490
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:14:42.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3dte08BK9EYgUCq71DCm/22MnVqR3f/Z/P6yAReU+j69NZZKl6zASNdPiSqvCwr36n3xw3UTiNXG6R1VhePdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35115-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 8EFE62C8E16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:10:01PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> Mon, Mar 16, 2026 at 05:41:56PM +0800, Xu Yang wrote:
> > @@ -316,6 +318,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
> >  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> >  	unsigned int reg;
> >  
> > +	if (tcpci->orientation_gpio)
> > +		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
> > +						orientation == TYPEC_ORIENTATION_NORMAL ? 0 : 1);
> 
> Sorry, I though this was covered in the last version. The condition
> looks unnecessary, so:
> 
> 		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
>                                         	orientation != TYPEC_ORIENTATION_NORMAL);

OK. It's better now.

Thanks,
Xu Yang

