Return-Path: <linux-usb+bounces-34053-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPZnNp9SqWm95AAAu9opvQ
	(envelope-from <linux-usb+bounces-34053-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:53:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8C20F0B0
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F27131190DF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 09:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CB636654F;
	Thu,  5 Mar 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=est.tech header.i=@est.tech header.b="hbJgWFSJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BDE34EEE2;
	Thu,  5 Mar 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703938; cv=fail; b=dwhfpdJxcUldouDkb+xzvIzhY5exLk1TiwgV6fo7g+VXswPbIfLsBHanc2vX9OQfxXhJ2aKYQp17BuOxwNrZ5E+bA26aFJcaogz/EUmX24YR6kC7pEgpbcOlXID85KRMU8hvaP9cMyUKWGmlWoVqPuZYSDqrT5/hKJFuTbeD5mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703938; c=relaxed/simple;
	bh=YDXodeREeoZBXiudKjM2+ffQ4epdBdlEfrnMGr+U/n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HIWC8arSEDAFSTHjs8exm2vzjO9XNieBtAzbjdVlavm58VzRv1i2U8LjmUsrrHryt5Y6dh1JsO3SOU3uhRwu/FuafeiuH2xdeypHaSW+nHikC/a0Qu7MiMonEKS0J2vxxULxpMrff9A3CjS2GaoSpTaPq5nIW0Pg6c6XLVCW41s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=fail (2048-bit key) header.d=est.tech header.i=@est.tech header.b=hbJgWFSJ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpgsIcFWM7Qns5MfyMf2ItV4LJIEZe460BUGCEvQugHMlAhQFIAQjvRme2PxqM98f752jGhun37q6hwAkS/glFfbgi0zZW/xEwgVG7nuC3Ong1XKajE7+eNblzjbVA996I0nEsfym6lYqBu4pvNRlbSbJCw4vOsAw6cEAvjzeUPzxF73vae8uVqcixgZq0F5rSaH1AG5Uc5xWyw4tF7EZ+laY9QFc8RMT65KuDe7vvv55H3pX0DpSkb3TOQe+j/DDjxfqt83P8Jeso13HOnDy5DBN9dwnxl0HQnUjrxHmw3qTYGr+xiRyndEkrxf9lDUHn8PBruKA/HncwyBkBNPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rICrF1WaucgmxWPRx12C5aCjvqAwYMUihBK/qX2DUUo=;
 b=SxsuqMC47eMnPSo4UnKtebwut3t/+zbIcyFXTqIR54tigaVsd3nUemGMwcMoCixAJnOpDoyVNmenWpV3k5sGAedNsyfotd7IGsKm4ztQznHvYzFYlgf9KLU606ZPzPGwxBFnuxGMmTv0oVUCoTiPd+4Zywm7yLy2hKkrIChmof9YohKtAxM1uGEBjO88SgsFgVSsAejc43zbfYNHl8Sh2/97a59SrXGgHp587BtY3Y1vVt6DOd0/k8ZiDKh+Ojiv1+YTv2V2dnit+E2ZU0mxX6tmYl5f1PpKcFrqcVxC60oJZvnw8ZIdKlvz+A5LARlyxc1UXk9141iTKlgbcmhl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rICrF1WaucgmxWPRx12C5aCjvqAwYMUihBK/qX2DUUo=;
 b=hbJgWFSJ27iHs7sIY9jJF+6hUgXlMNqX7vF+rUJPQlhIyEVGYhgDhdIbfWNbXAXcDPRz5V/dsmp9MfAGZTnK4p1nNK16cNWDA1OuFEQdWMI0mp8lBbCs6hUWcuxnpKY6AbtzhvOzpBYGTu9WcTk6EqJLW26HKByAEGLOl2faxU/nPDoNuTONiVjQ4l489r+mA3jFaWot5iHmg6iJd3Hqj2gG1eq9Rcf39E0oIZt8gfipTcS8oghjFw+xb8BBR5Ws845ueHsInBBVqGTwW9oxo7Kskk14mb0bq4iiyFJ6Ejj3ThQCa03uWRq4qtbzwMJmXG6dXpoK84NH8qdGUssZdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by DU2P189MB2541.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:494::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:45:32 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 09:45:31 +0000
Date: Thu, 5 Mar 2026 10:45:30 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jura@vukad.in, malin.jonsson@est.tech
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Message-ID: <2j6o5atwkm5wl25adcusadiadme7gqpx4vqmscl42wnxgjyh7b@b5om47iesajo>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <23bf65a8-b3b2-459e-bee7-ca7c4e4993de@topic.nl>
 <20240606002909.f6a7fwfh7ccb6pxq@synopsys.com>
Content-Type: multipart/mixed; boundary="em3xqypvsvj66tfm"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606002909.f6a7fwfh7ccb6pxq@synopsys.com>
X-ClientProxiedBy: GV2PEPF0002395B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::355) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|DU2P189MB2541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0c7bfa-8c80-4ebf-d1fa-08de7a9bf107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|6049299003|4053099003;
X-Microsoft-Antispam-Message-Info:
	H5OiLP5d9KzRTJeRPY/rxq2e/4BGX/nEHKqqqwNRUYaDKfc4hw1cZxhCvK35j6vY7NFyTlAnZVENv7bBn4StEjWB/DJCVyPpl++1EKN3vh3zmsFRkb2A3VRSMWXzWS/ZQagi0ZXcFuxoyfyhEO0zTlKj7uYGjcNvlOyftQHsHEfHR5Jxt8c4KUyYdfE1KJ483TCzZvhrSu12+a2ZEmxiTdcJ9U5kXAk3TJrYRxKnBD1jhxaOKo2ajfwxcw/7mt2aGmt2ZPig8wPlawx63EhHrPZMwlA1HguRc3+L7e5KxPEY7Zp/7VTfrvncgnpTUdzFKFudAxNo6XJ7DlJKef+BLFnhnCM16rF27Ev1J66kAJYg460EsB7KZm/sJl9kX9ijfuiwAD8HOm14nxPRRSbMyP7JXmmCoK0sIUdkrqjrLY3o7zDgquSJsAfoye6mm+5ceB4rc3MnAveSShdUKRYVn8y05pjjufwr3EeOiaRD9UcDeBFO9iqoCsNS6E7iuf4PgRDNmiv9smk35ERQg7xI+B9CLO/wOPML2gkhP8raYQ+TdS63K66i53cslEktn3AQGnHig6+14jONOd800veWk5J25ygYvOlYzWcvxILIR8ieY8V/oOBn4JSuXVoOhH/xJWiD294FiaFuI6A8DioU78BGPTL3aXxION4/N1nefcnLzdT/QaWyNyWvSXbuGX8+MVDi8AuwdJZURsUgbGaaQUu26fWQxY/eNn4GpNDvjizdjGTTVC6+B9nPLzkT0/UT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(6049299003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?xSe6zPq/Vbs/4ownFLq1QL/rQCKNta94vA2U+K6OTKlxQaIl+gN6lLcZSY?=
 =?iso-8859-1?Q?erzYP+imI0eiyGWE6BNACpQlSXkk6NyOASx1YSKHZT+hbClq+YWhRZ2C6Z?=
 =?iso-8859-1?Q?cND0ln9RDTDJjG7+fpwmZUZq6edy0nOKoVgr4EumX7l0pKP7ZpAcDnxLXw?=
 =?iso-8859-1?Q?OuETq+jym7BFGoXLPrceAqG5O6jmWpRJoslX8YX8wvsV+vDuIOeeLS0iIQ?=
 =?iso-8859-1?Q?L7HeEeAXYgYrnMVIc6UgQnEn4NnKiXLErVBPiPQq19IRGz3sGRRquE7+kY?=
 =?iso-8859-1?Q?2ooD2Rhh7MrjmovDCoQkDXQNvOBBPac4UQHVOYx5LfC231Csh7k3V1Rm3O?=
 =?iso-8859-1?Q?5Trk0TSFIAMK+pBM9+jcXK552vLFKvTcKDVYyp6pNFu2FkTC93dBlpNo8o?=
 =?iso-8859-1?Q?BWqCx49qohV9mMHWYad9kkGqgkC7HKD4GOK24vfTUSWQg9sBEPhDTb3334?=
 =?iso-8859-1?Q?Cf9gZHI55vEL9HrwuTGRwNmg9UR08VznzH0v7DHnPvP0qn/U6vZTOQrcPU?=
 =?iso-8859-1?Q?Ic49+naCdmZ3efko2naYEoPxRtFEpbLCMPPgfB9U9dgBtKlsxrUzdmwVrO?=
 =?iso-8859-1?Q?VviKt9revsMjNb2dnUk3n8XKyCuef6CCFuF1t8jy54KW8PK6GprvN6U29+?=
 =?iso-8859-1?Q?6LQbL4/4U1sAU/M6zriXmlemZ1VZxR4IhNxZHpqVoBoKq2QziT+kGwWzAE?=
 =?iso-8859-1?Q?p2/FNAqrGXy3tlR3cFjrSfObZL1HbRkSUsYMjKEVjC3ig5R25fA7vLCzri?=
 =?iso-8859-1?Q?gdtKfV61/ts73rW3ZIpgamNO4C5ZHWPxOzliXzgGSZEZpv/p1fbRtV0/vq?=
 =?iso-8859-1?Q?z0v4YpHTwYiBz7wCUubmxiyIVn9MFUObYpABKodRNO8kBY4DqlZh4eNgCm?=
 =?iso-8859-1?Q?qOuAftInHeOFc9uLSz4aS3VEB0VIEQmcIFZKMLepEqMMxja0wtnKi/4bL7?=
 =?iso-8859-1?Q?wYw5dnVSGliDbaiXRjlBoa8xoEqJvzCuI7wNUzs82dqzSuKEjG0ccwHL+F?=
 =?iso-8859-1?Q?l+080YycSVptiQdwwgq+SUzvD9B/lry90/ZSz6Rwu79unmdpZ+nFTMbCbI?=
 =?iso-8859-1?Q?++MdaMWhQc1oPjGZbqm9VAE40HV7an6sMNslXS/aGYk7zZbAEkPlbONgOp?=
 =?iso-8859-1?Q?g+ZznntH88NHFQiwOgzBfkGGs3EfbsqUENslJE0UuBCSkg9f2U5YzhWJmk?=
 =?iso-8859-1?Q?3/xwOo7jLGGPjQRVkQuJ45aesYHNIf4qoIU906JXGeyZbMzIl4JhUYcLOE?=
 =?iso-8859-1?Q?m6GwPOeGKgQaKeIzc85si/2b+0CvMLrValBES23NLvTTnTyr7rqOroGjN/?=
 =?iso-8859-1?Q?WkGgOZKBBJmxgIGNRP9Zg4njq6WEO6fGICLhPWgcay46IblYmgzr2DJX4M?=
 =?iso-8859-1?Q?u9OK7TzToXTEIb1tvdGk0k82myxd+SJY9eV4w4QOggNkRAmW82fLVOBSgv?=
 =?iso-8859-1?Q?j7cJyBddl//NMy7thExyvY6302QfoAGai2FiRfwHT9zo+dN77QkEqR8fD4?=
 =?iso-8859-1?Q?YcemE150tRfLEZASI0XfVurlCzcQ5idsXpjbTk9FD6oDsQj8TDL1TW5qgL?=
 =?iso-8859-1?Q?WmGUYDIFBGZQAdqJDeTFQ+VNEa6ta9oqYe+v3iRQCOfAR/HOYonmCQwTi6?=
 =?iso-8859-1?Q?oFQHDYSnV5FkjHW9cRfBWOBjOlqBymjPFJGzXnGDC6et+9xwMQSgT4WaRo?=
 =?iso-8859-1?Q?+MfuPg8hzRnQvPZt9hlH0tgVN6ujaCXJFV2qfZVEo22oZwYe837T3V/Hl/?=
 =?iso-8859-1?Q?DMvxUYWlRhUirlUh+mAFiaRpfr/R7zuzYYsAt0W0x9E1dR2ryFE6OPIurI?=
 =?iso-8859-1?Q?f/8XW4IreVEyiCDmMfmKltV0o/JpkwMBE3ynKGOeoLDOz5+DWBcc?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0c7bfa-8c80-4ebf-d1fa-08de7a9bf107
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:45:31.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3m5fDkS+bDTNWTi6wztuDiTXjcPV7GWVjDYtftoUEFQu7fzFBc+kzTQUgxcDijGPhXQG6vWqccqaQSwQGTs/R6U5xIaZJaTyp7hY+r0qt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2541
X-Rspamd-Queue-Id: 3DE8C20F0B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_REJECT(1.00)[est.tech:s=selector1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-diff];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34053-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[est.tech];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[est.tech:-];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ravineet.a.singh@est.tech,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.810];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[est.tech:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,urldefense.com:url]
X-Rspamd-Action: no action

--em3xqypvsvj66tfm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi.

Sorry to resurrect this old thread but as far as I can see,
this issue was dropped.
As we have the same issue, not receiving a disconnect when cable is disconnected,
we altered the patch and this version works for us.

Any thought on the patch?

Regards
/Ravineet



On Thu, Jun 06, 2024 at 12:29:13AM +0000, Thinh Nguyen wrote:
> On Wed, Jun 05, 2024, Mike Looijmans wrote:
> > On 05-06-2024 01:06, Thinh Nguyen wrote:
> > > Hi,
> > >
> > > On Tue, Jun 04, 2024, Mike Looijmans wrote:
> > > > On 04-06-2024 03:03, Thinh Nguyen wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Jun 03, 2024, Mike Looijmans wrote:
> > > > > > When disconnecting the USB cable on an LS1028 device, nothing happens
> > > > > > in userspace, which keeps thinking everything is still up and running.
> > > > > > Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_SUSPEND
> > > > > > in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one would
> > > > > > expect. As a result, sysfs attribute "state" remains "configured"
> > > > > > until something resets it.
> > > > > >
> > > > > > Forward the "suspended" state to sysfs, so that the "state" at least
> > > > > > changes into "suspended" when one removes the cable, and hence also
> > > > > > matches the gadget's state when really suspended.
> > > > > On disconnection, did you see disconnect interrupt? If so, it should
> > > > > transition to USB_STATE_NOATTACHED. This change doesn't seem to directly
> > > > > address your issue. Can you provide the driver tracepoints?
> > > > The device doesn't issue a disconnect event, I didn't have tracing enabled
> > > > in the kernel but added some dev_info() calls to determine what was going
> > > > on. Added this to dwc3_process_event_entry():
> > > >
> > > > dev_info(dwc->dev, "event: 0x%x type=0x%x", event->raw, event->type.type);
> > > >
> > > > When disconnecting the cable from the host, I see this:
> > > >
> > > > [   50.841411] dwc3 3110000.usb: event: 0x6084 type=0x42
> > > > [   50.841457] dwc3 3110000.usb: event: 0x4086 type=0x43
> > > > [   50.841494] dwc3 3110000.usb: event: 0x6084 type=0x42
> > > > [   50.841534] dwc3 3110000.usb: event: 0x4086 type=0x43
> > > > [   50.841571] dwc3 3110000.usb: event: 0x4086 type=0x43
> > > > [   52.650990] dwc3 3110000.usb: event: 0x30601 type=0x0
> > > >
> > > > The "0x4086" and "0x6084" messages are endpoint events that occur all the
> > > > time while connected. The last event is the "suspend" one. After that, total
> > > > silence.
> > > >
> > > > If you need traces, please point me to a description on how to obtain them.
> > > >
> > > >
> > > Let me know if you run into issues following this instructions to
> > > capture the tracepoints:
> > > https://urldefense.com/v3/__https://docs.kernel.org/driver-api/usb/dwc3.html*required-information__;Iw!!A4F2R9G_pg!epxtPmXHiizMg5_5igEYiKU483OZb1zcYK1M3afqXxIfgsw_cU_kdz9Rlpf1w-30JF0v4UUkxBViJtx4Prv3ZWchjKNHkKE$
> > >
> > >  From the patch you provided, you only apply the change for the usb
> > > suspend. But did your device go through system suspend? If that's the
> > > case, then the dwc3 driver will cause a soft-disconnect. Currently that
> > > will not prompt a state change. We need the tracepoint to know more
> > > detail.
> > >
> > > Until we have the tracepoints, you can experiment with this test patch.
> > > If my suspiction is correct, then this may resolve your issue:
> > >
> > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > index 89fc690fdf34..29dbb889a0e2 100644
> > > --- a/drivers/usb/dwc3/gadget.c
> > > +++ b/drivers/usb/dwc3/gadget.c
> > > @@ -2682,6 +2682,8 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
> > >           */
> > >          ret = dwc3_gadget_run_stop(dwc, false);
> > > +       usb_gadget_set_state(dwc->gadget, USB_STATE_NOTATTACHED);
> > > +
> > >          /*
> > >           * Stop the gadget after controller is halted, so that if needed, the
> > >           * events to update EP0 state can still occur while the run/stop
> >
> > I tried the patch above, but it doesn't work. Apparently
> > dwc3_gadget_soft_disconnect() doesn't get called when I unplug the cable.
> >
>
> Thanks for testing. There's no system suspend, so that's expected.
>
> BR,
> Thinh

--em3xqypvsvj66tfm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-dwc3-gadget-set-device-in-disconnected-state-whe.patch"

From a689256e5d6cacdea09299014746522ae928f7c5 Mon Sep 17 00:00:00 2001
From: Ravineet Singh <ravineet.a.singh@est.tech>
Date: Mon, 2 Mar 2026 16:44:46 +0100
Subject: [PATCH] usb: dwc3: gadget: set device in disconnected state when
 unplugged

When a USB cable is disconnected on an LS1028 device, the DWC3
controller only sends DWC3_DEVICE_EVENT_SUSPEND and not a
DWC3_DEVICE_EVENT_DISCONNECT.

Set device in disconnected state by issuing
DWC3_DEVICE_EVENT_DISCONNECT.

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 drivers/usb/dwc3/gadget.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6e90f2ad0426..94e191a9ceb8 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4440,9 +4440,22 @@ static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
 
-	if (!dwc->suspended && next == DWC3_LINK_STATE_U3) {
-		dwc->suspended = true;
-		dwc3_suspend_gadget(dwc);
+	if (next == DWC3_LINK_STATE_U3) {
+		u8 speed;
+		u32 reg;
+
+		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+		speed = reg & DWC3_DSTS_CONNECTSPD;
+		if (dwc->gadget->speed != USB_SPEED_UNKNOWN &&
+		    speed == USB_SPEED_UNKNOWN) {
+			dwc3_gadget_disconnect_interrupt(dwc);
+			return;
+		}
+
+		if (!dwc->suspended) {
+			dwc->suspended = true;
+			dwc3_suspend_gadget(dwc);
+		}
 	}
 
 	dwc->link_state = next;
-- 
2.43.0


--em3xqypvsvj66tfm--

