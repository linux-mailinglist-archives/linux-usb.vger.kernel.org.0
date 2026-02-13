Return-Path: <linux-usb+bounces-33333-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AExjHq5xjmmrCQEAu9opvQ
	(envelope-from <linux-usb+bounces-33333-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 01:34:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A1132172
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 01:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B462730601AA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 00:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899151EDA2C;
	Fri, 13 Feb 2026 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rzsyc1E+"
X-Original-To: linux-usb@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9371428F4;
	Fri, 13 Feb 2026 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770942875; cv=fail; b=o965RN8aFs47s5b+r03Lk3TKq6GhtcyDKG3JjnmDQlx5rPZJJkGfOvzZNAQCeEbmqO+p5k9pGgd8F5h29E/0jLxATVwxuzJ5T8PLeJsSWImaduOZoPlVQgB4pSqQeeXWmYSLJ61pE33QZFDPHTticCKRG9RKjwMaFFwmV2efGYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770942875; c=relaxed/simple;
	bh=K+T+pG6uQR0lVfdQ/gf0PS5caIF/1TM2rSEt2+HmSEo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CjZWWgKtwLQ+hEdmyffWkxuKGQr/MEdMVoZPXEjHqL5xjGWnwI393P48MbLZWXR/Bp7Be+X/prXivdcSgDyjpkghFknqYDz2t0F3iZdtDqceUzyHF+9QxfG6hQKSKoFCxd1LenOHVfYP9f3fIRLqa1B2v4KEsBfz2ve+MnkFsmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rzsyc1E+; arc=fail smtp.client-ip=40.93.195.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoIbl3dyNW2JrQcdnpGcbuuTU3F49VM5dnyZX+pYCGz/apSXGv2yBvGmwvVl1XPAYm+m9B8PynE2+CsTziezkD1/lTxA/75wJjQ6nGe9mmY6GfQMQu5ntjpQYEUOwUedmeohJc/UegRkmHH3dUiL6ZM44uCultM4LatxtToAutbmPYYQn8euluzTQQEupY5T68HoBB5b9zR/pBDswyCaggBxFcH9Gg5iQEtiDKSp2Jrsnhpg/yMhh11zDb4KzhZkZ1CrpjutGKUbzFVG7ySsQmN6Xo3Is7v2LD4rHXRP/rwZUbwYkFbim7toFBnKXUJRdxoYpiJB8D2L3uEUbe2jDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjBENqm59RBUCVL5v0rXJB74a/pjtJXpky7sB3NUBvQ=;
 b=C8L083fGUeEF8IG89qZ6Zk584+dTZJ6//zWUYtpi+91KaGMnginHtVxjlnZPpUde4mARVdG1gwbiNj4MGqYF129J170ZQvDRW6rHeXsPwxN4u4cDpMSzfGWssD3P5NIQFAopicFgc4GwH4e1l7CixCanMlMMnfLRbk7RTKqpK/yppEU+YfRyCtO3oD3eglKFEkdlvPZkbshJHZJej71hMB5aPrVeMAWapXNpM5bdAPRwAb3+T7p8ESvjvlY2rYhthgONF5Q/UU6WJ+gXBrTnnXZdtCSb4Ifcbp/c11EjnELwO/XmJxiF0+2a7KNqUxrMNQesKzaPZ0V1XFbuQu1Mdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjBENqm59RBUCVL5v0rXJB74a/pjtJXpky7sB3NUBvQ=;
 b=rzsyc1E+CGMIrm7IgGyL+p1BwzCS7KT7TYBrG6MnajxyA31TiwNDATr2wO6uaPhCPA6Lo/zUacN7memLAzUN8rNEgbCOTN1iQxHXV+lkWmdK/pXBFr1py/0tdlvLFybDbaxnT8u91NNRq+DbrInx9W5/Qo8D9TJo8qUX9VgW1NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 00:34:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 00:34:29 +0000
Message-ID: <651677b6-bdc7-42a0-a568-6a81761ceb65@amd.com>
Date: Thu, 12 Feb 2026 18:34:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
 Sanath.S@amd.com, "Kovacs, Alexander" <Alexander.Kovacs@amd.com>
References: <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
 <20260212070754.GF2275908@black.igk.intel.com>
 <20260212073419.GG2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260212073419.GG2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: e773807b-9e68-4981-3294-08de6a97a652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk5wMnI5amRZQTcxeDIyMmhSNWVxenI4Rlo2S3ErcWg4Zncra2pva29ZWTJI?=
 =?utf-8?B?V3hHM1F2N1dSTk5lZDIvVzdLRGpaQlhRMGc1UXZkNzBMeG50bXMyUlgzckFJ?=
 =?utf-8?B?YnRxNUhIcmNCVnF3SDh4RmZ4cTR3YWFDTHREU2FOSWNpSE9NRnJ6QXZOVFlm?=
 =?utf-8?B?SUF5UksyNFBWejFHOFJxNk5tQmJZOW5naU05Y2RtK2JFK3RXdVEzTEFYMk9w?=
 =?utf-8?B?d1R3dVdFME5ydVIydFI0MVdsbk01SVVRRERCRGtFaEozZlYrc0lRVVh1YlF5?=
 =?utf-8?B?RlM4TlQ1S0pkOW5DQUNJYisrZk9Ed2xhZlkzS2phYW5ldlVFVVZaR3hZeTBH?=
 =?utf-8?B?Q0VhcmlCSDNvemd0YWpGYzkreVVNNWgxZ1ZqVFBMRmxsOGdnZms2eGRudGJu?=
 =?utf-8?B?ZlhKWk03NjlkTTA4WVlnbVFZamtKeDc4Q0NYVTFwRVhMRHhkQzB0UmZBVi9N?=
 =?utf-8?B?YitnK0xqV0QvTm1FcDMyUzdka0dDWXdyODFPaUZJSmZPOGF3Y0JBYVROSDRZ?=
 =?utf-8?B?anR5eTRIelQ3TnNRV3AxL0M5OVNKRHkzdzN1NWhldklpQkdUN3ZvcWthMjJk?=
 =?utf-8?B?cWJMV3dOblFUcUplbE03aSt1Mi9lMG5JakZUT3UxZHFpc1hmeHRZci8waWVW?=
 =?utf-8?B?eXdSdlhyOGphUEdDN0FBQkdhWktTZzh2QmpSSFRqVXBmenZwTWZNMndYSHlw?=
 =?utf-8?B?NkdOazFvZjB1OExSZXowNXhSeUJVTW03M25nTWJ5RVlVdEw5dk1wdjJlTG00?=
 =?utf-8?B?aFB3YjlQWG14WnpzSDBUcW1zTzc5VnVCSlBsZXNwaTBWQ0Y4VFc0dTFqMDE2?=
 =?utf-8?B?RzVFVjFGWVEvUWRxNFQ0UDNzS0dscDFBVldsWDFSK1ptb2JkQWFPNFFISzBM?=
 =?utf-8?B?OWtoZnFQSnZsNzRDVFJYbTREeEltZ25yQmtNU0FYUERLN0NPVWhxTlZmTFU4?=
 =?utf-8?B?VDUxbjlSZWFpd1hMNEhJbzVrVkxJSUZEb3l6MUNaN1l5L3NLVXJIUTJCVmpr?=
 =?utf-8?B?S1FReVZDMTFXSGxTTFVKYVZqanZ4TWY0dE5yN21ZbXhVWXljN0oyckNLSGp4?=
 =?utf-8?B?VFA2ZEVZcEQwdCtCNFBzMGhvc29QaCs5eW55Q2QweEQzdjlxTGxQc0wyWnZL?=
 =?utf-8?B?R053MFNubG95aHAxdWEzR2hHc1k2alZ4MGdPTys5WEQ5RmlpcWVaTHBVbFhD?=
 =?utf-8?B?MDM4bStuN3RHK1F3djdPSGRDa0N0WnlUMm83K3NwWEtGV2piVUo5Z000M1N4?=
 =?utf-8?B?TzV1MzFOVUllbXZRZDAzbmJFM1lGeW5CV1l1NWUwYWdCOHdxcjJIT3lnU3Q2?=
 =?utf-8?B?SCtPRWdBb3VCUVlQak5IanhqVlh1S3piRmliaERhQkgxRERXdzFCc2svcjJB?=
 =?utf-8?B?bkZnY05LNDVZNCswMUowNnc1OHVMeDh3ZHNUZWZzbktXaXVLRjN4NHR6cE9m?=
 =?utf-8?B?NGY5YWRIeXlnaW9MYnFKOXo0dEZqNXRsdkJBQnF3SzUrdlRkYmQ4ZThIWllP?=
 =?utf-8?B?aHRkUDN0TkxTQnYvUHZ1STFDdDRmV1M2SERJeEhmOVR2ZHVrdGJsczJEZE9G?=
 =?utf-8?B?TWNDRXVod3JkYnJwTzNDeFlSVDhDRWszMk1ZSCtyMGR6eGZKOU9KZjh6Nis3?=
 =?utf-8?B?RmpSUkd0dHVOTjRKTEJKTmszcDZXVUZncUNKVnd1RlFXanhoWG5yVjhwZXZL?=
 =?utf-8?B?aGZOVENCNEFUZ2RxMnlnUGl6a3FrL0FFc0I0V0t3Nm9ZY3ZBUjR0L2RnaUlx?=
 =?utf-8?B?QUdhdmNZR2tjVTRPWnkwMGEreU91dkprdUtxTU1sWUxGQ1VxK0psdU4wVEZU?=
 =?utf-8?B?Z1RBeUVsQWlEYUR4dVFxMmRyUVM1V1VzY2xVQXFQblZMZk5SZzZmMWNGMTVP?=
 =?utf-8?B?WTd5MWd0S0NWblVDeXBmVk5vMG56RmMzdUQvbkJ4VFRjL2NhNWZHWUdJVlBj?=
 =?utf-8?B?MGdibU95Z0FqenlGaGtQeklYRWp4QlRCVm85alB1bW4zSWNISlp3WUN3VnJi?=
 =?utf-8?B?Z3pIc1I4bDhHY3RJYWlxd2RGc3UxakNCOWNoUGNyeE9zT2tUZUFzNHAxeXk5?=
 =?utf-8?B?RmZDZlRNbDcybVVCdGhQdmNKbkoyRlhtQU1UNWJTK2Nsa1U0U282RFBIMThM?=
 =?utf-8?Q?1hZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V24yREN6c0Ryc2VUckw4ejhZUTQvRThmU0F4bDBZTTNhZmpWc2U3L0tIbWhI?=
 =?utf-8?B?SHNiRHZQcXJCZFpROEJqMGZvd3BqQjcxYmFzVVhMWVdXb0RmNWlyZ0ttVzRJ?=
 =?utf-8?B?bk1nK1JTYUlOWUxsbTg3UTN0Ui9oME93dUc4aTkyaC84Y2UrL25rNjF3UEY0?=
 =?utf-8?B?UURGaDhLN3JVT2lQaG1IVDdWYUdKUVFpK0FVUXhRalZRTDNrRG1YN1JmTjVY?=
 =?utf-8?B?QzRQRU1aSmIxdkdUdHdSeElaN29zZkVMQ2htcXhSQ1NxR0R2QTZQalcyR0x3?=
 =?utf-8?B?L0NUbmwzRXN5Nkpsa0lKSDhma0lzSzkxcDJpU0NZb3JsQlRMV0Fmck1xSlBX?=
 =?utf-8?B?MEFRUXUxc3Fnb3dDTHdOTzhjZUQwd01iSU5JMDhXMVNPa3Y0SGZWL1IxMUd5?=
 =?utf-8?B?RzZRckRPM0lPSFVjenJmM3l0Y1o2QU0wUWxtS2ZFb0oxc3BSTVJILy9pa25K?=
 =?utf-8?B?ZTk5azhBYktNeWpLM2ljUUJ2dFB3UXE5YnlPWFdUL096MkZNYnp0SFpZYmdk?=
 =?utf-8?B?R0s0Q0xXcERlYUZ3TjBVOXBPUzJRQ2laZHBibDloTE1EMHA1cXl1Nzh0MjRL?=
 =?utf-8?B?S3oxMVdmWnh6RmpEdW1BeDVZMC81cWNJdG84am5qb0ZoNldzb0svRmltNkF5?=
 =?utf-8?B?Ry9rbTJ5M1ZwRFlRb2JRazVkelZRa3dxVTRTUlMrOEVTU1E2SzN5VG9tNk8v?=
 =?utf-8?B?OWttOGZMYm9VUUZHenhQeW9sZE1keTdrcGlBMVh0VmJ6ZXYwZHhTcHF3aFZj?=
 =?utf-8?B?c29PNmpQSnJHOWJDV2p5ZUNrRzZidC9tUUZvVXJ6L3ZlRTQzR2x2T2V6cmxB?=
 =?utf-8?B?RVFuc1JQd2hqbWhUeFRJRUhGUHNGd08remNQbzlqZ3V3d0JUbmsyeEpEL0cw?=
 =?utf-8?B?bFppWFVOYlQ2MGlzbk1wYVhwTHdjVzJFSjlaQWtHRTNtTWIzdE9VTFN4ejhY?=
 =?utf-8?B?V0lsVVNKYXlZUFNPNjlsVE5SbXN4bXBhbW1JUzc1U0tJMWZoYzRMdHNVK2xL?=
 =?utf-8?B?eXJBWjhoSlg2UTloQTRheWxHT3VrQjhvekQveVVmT1BqUVFyUGR4c3BSN2ZB?=
 =?utf-8?B?YkMrNUhzU3JOYVlJWGJUa2RrSno3QUdtN0tQSGUwTjM5STRWWHM1d0s5SFg5?=
 =?utf-8?B?K1FTYlp5ZXI1UjBmejFJZkIveEZ0TnpnNU80dm55SkhUUGdsUXlPY1ZqaDhT?=
 =?utf-8?B?YzZrMkdoNDhlUVVUTzZYL25iWUNETjNYSWFDQW5WaTROZXo4YXBFSGRNOGFB?=
 =?utf-8?B?NlBJaUREODF3dndZQnlYdVhiRTBwdHhJNkh3NDQ2b3IvMGpyYTNjTm5XYlVN?=
 =?utf-8?B?REpURWZOYVlqblpCS1h0b05YY1pMNkJHa2hTenZSaHBKVk1iS0FDYktxMnE0?=
 =?utf-8?B?QXRTOG0zbEl5enVyRis0b3NkQlhKSkdLdXdPMnI3NUJIS0JBNHIxcnJzT2FO?=
 =?utf-8?B?eEhQdHIvNjZYRFB3WDhWUHJxbVpXdUgzWGNoR3lEbXpWNDFKUU4wckNWQ2lM?=
 =?utf-8?B?WVFQem9iRTR1UGh4aWNuR1BHdkU4ZXU0RHMwZlRiY25PYU1Xck5ZK0g1ZDZa?=
 =?utf-8?B?SVhPYXhSM3dsSVQreUxUWDBHN1dQZGg2YllHTmNzM3RzTFh0MGdlVWpOYkZE?=
 =?utf-8?B?aG5XeG4xdjMzTGovaTdieVU5VVRLK00wU3ZDZU1lWitMODlxZThZVloxYUhs?=
 =?utf-8?B?QXFDQUJ1dEd1aWEwUDl0Uk9xQ3ZKVmpXWnlHcFZKWk5uSG9aRUU5dXhyNk1l?=
 =?utf-8?B?dUF6eVRSVUp5a3FnRFJ2ZlRqRGIrNHlqYTNjV214Zm9iZXRFRzhuM0NFUXR1?=
 =?utf-8?B?MVMySUFTMlU4YWdLNnRGWERqcFZlZXl3S0lYbWZ3M3FYWnJzMlo5dUZvYW9Y?=
 =?utf-8?B?d0RKMU9CSmFaTjR6dUh4cFBOM0YzT1dIWnBRTUlVSnpoS2ViVjZpRUp5bitT?=
 =?utf-8?B?K1dHYmVxMVZ3ck1XaGlHc2FwQmExaDM1Mk9Ebk9xbUo2Z1RJenIrbGZtbFZ0?=
 =?utf-8?B?enFwR3hJbk92SUNLUkh4UGJIU2g3dHdqcllNMGpmS3pNeFhCNThUa3dkTWdY?=
 =?utf-8?B?aGNoRnJXaVpUYXcvZWVJMERjWjdzRFJldWN6bkM0N0FTZElRVzYzNG5FZDl3?=
 =?utf-8?B?b3N1WVliSy9ncVlGelBCUlZENTI1enFLL1lyNUtSbTNXN29PdXhqRHZjZU5m?=
 =?utf-8?B?WmlxRkxWSGIxUEVROFRCUVR2UHEwWXI3NFBXUGRiUWRaRkQ4V1VIQXlPMWdE?=
 =?utf-8?B?RmZXZFFVTkM3MGNWV3h2ZitncFF2OGdvMTVUeTN5WFBUYVBucUorTkdRR1Qz?=
 =?utf-8?B?cklPU3RETG9nbU02dXZqTys0VDBld2txYUo1UXJqTk0zdGVrb3dBdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e773807b-9e68-4981-3294-08de6a97a652
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:34:29.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIBCDHs//iKniwrGaGVHBVUnT8qphweaByltldFYzQA4fC113sVkSUys+iIXVOenEmpCRbBqS3J00cBVOW9dXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com,amd.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33333-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 0C8A1132172
X-Rspamd-Action: no action

++

On 2/12/2026 1:34 AM, Mika Westerberg wrote:
> [+Cc AMD folks]
> 
> On Thu, Feb 12, 2026 at 08:07:54AM +0100, Mika Westerberg wrote:
>> On Thu, Feb 12, 2026 at 12:16:03PM +0800, AceLan Kao wrote:
>>>>> Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
>>>>> 84:01.0 and 85:00.0, and then the tbt storage is recognized.
>>> Got troubles with mutt, my reply got rejected :(
>>>
>>> Using gmail and copy/paste the content below again.
>>
>> Okay.
>>
>>>> Okay that means there is nothing wrong with the PCIe tunnel itself it's
>>>> just that the PCIe side either does not get the PME or does not see that
>>>> the PCIe link becomes active (e.g the PCIe Downstream Port runtime suspends
>>>> itself before the link status changes).
>>>>
>>>> PME work so that there is wake first on Intel it's GPE that wakes up the
>>>> root port and then PCIe stack wakes up devices and then the PME message is
>>>> sent to the root complex.
>>>>
>>>> If you do this on Intel host do you see the same?
>>> Intel host exhibits another symptom, I think the root cause is different.
>>>
>>> Plug in the dock, and then plug in the tbt storage to the dock one by
>>> one, both storage can be detected.
>>>
>>> Plug both tbt storage to the dock, and then plug in the dock to the
>>> machine, only one tbt storage appears. In rare chance, both tbt
>>> storages show up, but most of the time, only one tbt storage is detected.
>>> In this case, none of disable runpm, rescan, or lspci work. So, it's
>>> most likely another issue.
>>
>> By "detected" you mean the TB device is not detected on TB bus? Or it is
>> detected on TB bus but creating PCIe tunnel does not make the content
>> visible on PCIe bus?
>>
>> You can check this from dmesg, the driver logs if it sees the plug event.
>> Or run tblist (from tbtools) and see if the device is listed.
>>
>> I suspect former and in that case it is likely a PD/retimer related issue
>> rather than software. I see these once in a while especially with new
>> hardware where the PD firmare is not yet stabilized. If there is TB/USB4
>> link then all is working from TB/USB4 perspective.
>>
>>>> Right at that point the PCIe Downstream Port probably is already back
>>>> runtime suspended.
>>>>
>>>> Here you could try this:
>>>>
>>>> # echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/autosuspend_delay
>>> No luck, I enlarged the number to 1000, but still can't recognize the
>>> second tbt storage.
>>
>> What about -1?
>>
>> That's effectively same as blocking runtime PM completely so should work.
>>
>>> I tried to wake up the PCIe ports in the beginning of tb_tunnel_pci() and
>>> it works.
>>>
>>> +       pdev = pci_get_domain_bus_and_slot(0, 0x62, PCI_DEVFN(0x02, 0));
>>> +       if (pdev) {
>>> +               if (pdev->dev.power.runtime_status == RPM_SUSPENDED)
>>> +                       pm_runtime_get_sync(&pdev->dev);
>>> +               pci_dev_put(pdev);
>>> +       }
>>>
>>> But I can't find a generic way to get the bus and slot number, and
>>> would you consider this a feasible approach?
>>
>> No I don't want any (more) PCI related hacks in the driver.
>>
>> This is not a TB issue, it's a PCIe issue. I suspect it has something to do
>> with handling PME/GPE on AMD side. Essentially when runtime PM is blocked
>> the PCIe hotplug driver notices the tunnel just fine. When it is runtime
>> suspended (e.g D3) it should send PME to the root complex that the brings
>> the topology up so that the hotplug driver can detect the presence but this
>> does not seem to happen.
>>
>> If you enable dynamic debugging of pciehp, do you see anything happening
>> when you create the second PCIe tunnel? I suspect not.

 From what I see above I agree this does seem like a PME delivery issue 
of some sort.  Any chance you can put this on a PCIe analyzer and 
confirm whether the PME was ever sent?

