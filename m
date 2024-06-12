Return-Path: <linux-usb+bounces-11171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38398904BB5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 08:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A88BB21AAC
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 06:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAE116937D;
	Wed, 12 Jun 2024 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="N7w5ISch"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2135.outbound.protection.outlook.com [40.107.215.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2036AF8
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174007; cv=fail; b=aXSOhYnudiZ2vOeoL9t+20OxdAO1x30eg7zYBLRH/0VJPBMhL2j9tWcRq9Lgs6uwcVO+K132cEdwHf2p07eR5+5938ivEx3DPj3KFyBRTFf6I0mfNO4n8D5VKsxyiG6b3yRHISadJuhQZfeyE9PHN7UKyvu9bAlJmPG/uZvFlgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174007; c=relaxed/simple;
	bh=y40NEpv0liIrzYM4C6+IpjWuvzDaitsO7nSKj9QKyv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q9ZP77+TUGVYEpKDJCVtAtp6NvDcKX482sdMAgyxdUU43aa8Sh+MlCjE/JvRhfcHxFtWL0kt/2MA1rtFJqxLQPBw6oYewddLXl2j7A5ifjjrtSNL0SngC/+dxAJar0/f9ijGI0Ws7eqfl6IijUgS0HtsTw1H4gC5DFl0bHOYttM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=N7w5ISch; arc=fail smtp.client-ip=40.107.215.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA+HDqvhfkQlnK9Lr7GQOSV+53YfeO8MF7sygf42RYAkwrN2DlvjVmlGRoyJ1OkjFHndy8fcj0fmwqJkGLCnYr0jC83knTIAC95TRdUTpKlWqRDu8CO89VozJ6xgo5/dy87lhqpeCxXQOBQ72PVe2WcPJg8S7RTybHn7g9Vfd0KAwd9m9a4JAqXXYjPz1tl6B64R5vp1a39bwG5Ci6M2wt4ZQu45o7TVNRb4fFtDvlbjOMmMtrmWIZrD6JRtEbs8D43TKnixN+lBI5qwf3t/4cBdOTKG9ZljsXTbrjI4/5cQWl7QHmD0yZLGkVYhXa8X6GWWlesiMN26zLLirMU/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y40NEpv0liIrzYM4C6+IpjWuvzDaitsO7nSKj9QKyv8=;
 b=E0uu7dIBML9sEXj3t1ImyerCaJzAAp5jtrRc6hfiML8HBBNHkbb8IM5wKF1MU+ZLf0kbCCjEvGv5CZ+7eXrQLF91FU6ShBQ2rHxmFrYQC4qOYpW3WhmoYD5RXC95XjEt18acAqUkkTJUZwqk9huZQKm3xh02dizRMWH2sMpFRgiIgxNiIcG0gQIhCbYiWlVbYDXD/zXPHDg9MZTz4tfwDFg1ohplwqBHH0oL7onbqUJ/iabyxsjy+/1bfd4rJhOSJxzzKK2f8i794jvW+Apw8ylzgkebSojQdyG5qPjzkTYijgA97+CdAdjQQl5NiFoPDMHyAbtUqH9+GJz8730tEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y40NEpv0liIrzYM4C6+IpjWuvzDaitsO7nSKj9QKyv8=;
 b=N7w5ISchqS2Wf5IiuOFhG/kQ9HV8HUTmCfHInhLGUs9w4h+L9dXTwJnYGcTRNhRbvtMJMJOo3WkTnvjHv62gPzqD+KpHXZubwT7MUNdw0eEYpP41wZ6CIf1VncFo4fEgd/k8sCpcbSKU9tk+cwt8tPPVrjiPV4ob/sC/lhasaSMwjNMXGy53mVvdGyRKX0Sf6tEjJ5b7NSJGx5lBSmJgwST2JH1nMWSeh5tqZSSCBvSKhMae3kxeq2M8Ir9o/f2JqNAxCxhIFu5VvzrdCZMBxLrhyGn3Awp3MJudBNxXdxhBLyTA2cqEWA1DhblCDC3AXbFOdLWB4jMRaRXQ+An8Rw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB6771.apcprd06.prod.outlook.com (2603:1096:400:459::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 06:33:20 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 06:33:19 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix device address configuration
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
Thread-Index: AQHavG6mQz76LN84vk2D73DjxbU1NbHDnsOwgAAKdwCAAAKKcA==
Date: Wed, 12 Jun 2024 06:33:19 +0000
Message-ID:
 <OS8PR06MB7541F4003E379A5EA83A8613F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
	 <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <9f2f14979faa5a6d0b17601cfec4988a374ce0c8.camel@codeconstruct.com.au>
In-Reply-To:
 <9f2f14979faa5a6d0b17601cfec4988a374ce0c8.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB6771:EE_
x-ms-office365-filtering-correlation-id: a8f9cfbb-a697-4825-36ad-08dc8aa98ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?WW9Qdi9XUitmMkVoVnZqMFRZZ0RzR1FWSUJlczhYY1lSQmpuMjArQVBNZEpx?=
 =?utf-8?B?dUFQQ25HQ0tKb2lqbEZicWF1RVlJRFN0aVhjNjBRS1Y5M0JsR3YwOW5yVWM1?=
 =?utf-8?B?ZmJuVzQxOWUrQU85WUlVMXkwKzY1cjQ4OWVtenNhS0h0OFNFUDFVc3NvSU0r?=
 =?utf-8?B?Mm1xM1RSNWVnamE1Q243T0JTTjdYOWt0bzRNOGxRUE9BQlkrWk5VWENzZTAw?=
 =?utf-8?B?bGFNNjhWaWwrNE5vRlhwRGZ3SG13RkQwR2F0QXBoL3I5TkRUa3ExT0RGRzNh?=
 =?utf-8?B?R3V6cHR6TnVKSnRMRFFuZXVRVHBaV3hMWURDQ3h2eGRRSE84bGp1aDFuNGNE?=
 =?utf-8?B?V1hGUi92Snk1VVZ4Z2FGVXVHYlYvZW1lamFoaUlBNXdOV1A1dXNXT0JjZ2RW?=
 =?utf-8?B?a0hHNUl6MDdQOGU2U1Q3MVE3L0NDWnhwQUhSZlg0UVFGQ0NORXdySW5WeElD?=
 =?utf-8?B?Q1JuYXVZbndQL3FMbk4vaXN1aU42cThGdGVFU0p4a3luYlBaVlYzUUxuQkhm?=
 =?utf-8?B?L21yNWJ1UlZ4dkRraG9MMkpIcXRieHplSmxPZm11Smx3MmlUdDBOMC9SMTdy?=
 =?utf-8?B?dlRXWGVtVVova3pwZ05yUG9TVUpXRklKU1JRS1FJSVloVFgwV1RuVmRUbzJm?=
 =?utf-8?B?Ri9lcmlVUVVWTjNnT1Rtdlgyb08xcGg4WDdaUmI1TXZreFJwQ2lONk5jYnov?=
 =?utf-8?B?bEV2WFdYMTVLZnoxRlRPM3dRc1NIcDBpSUZ0QUc0ejVhK2daa2JUZ1hKRTE1?=
 =?utf-8?B?SnpsS2cxaUxKTlZ4M0JzSHlCdW1IQlNEZTQxZDFvdnFFOGIxVEsyaXZlSFB0?=
 =?utf-8?B?MUQ2b21kTjNXOUZKUW5Mb1ArZkZRSTdWQWxKd1d1cUt0a29vR2J5UzhJMW0w?=
 =?utf-8?B?a3duUWRkWFU4bU9EeXh4bnBMUml3Wjh3dG9aM3VEWEJTNGlNQkRYeENLdkla?=
 =?utf-8?B?MTI3QlRTendnNFZncjl2MFhJYmFvNE4xeFZHOGJMbXo4c29Md245enQ4UFpn?=
 =?utf-8?B?bHVVOU9SdTNhRVBhVGZQSnFnZUN1TS9QaThXakIyZFY2dW5QdEJ3c0hOVmFh?=
 =?utf-8?B?ajRuNGtrUmRWbFJYMWIrM0pZaFlRU0JpbUVHWitFRldaM3p6MkZLMzVpL3JG?=
 =?utf-8?B?UUp4OFVqd2YzbTgzU0FUNTZaYnc3YlJPaUVJb2JLemlQQis4Z3M2Vzlvb2dM?=
 =?utf-8?B?R1p3VXBjeXEvaVZ1TEtSQ05uU1RZVENkYjYyWlNnZ0s5ZXRLRFd3ODYwdG1w?=
 =?utf-8?B?ZHZ2YkpWMW5rYTliNnF4NnprNDFhU1Uzd01iVmQzY2NGZCs4MU5ma0ppd3dW?=
 =?utf-8?B?L0ZEaWZHbTh3aTIyM21FU1NwTjBYeWpNcHR0d052MXZoeEhjbnFJUXQzM0NS?=
 =?utf-8?B?VmRJdmk3TWlvcVZ2dzcxNW9IRUc3Mkt4RE5JeHVObTR4WFhNRFR5VFpSSWVi?=
 =?utf-8?B?NDIvVitITkRYZG5wbW5JaS96VncxL0xqVzVrUlRINUVYb05rbXJGMzAyS0tE?=
 =?utf-8?B?YzNNZ0pRb3VVSmsyeklHRkxMTGNyVFdHS0N2OGp6YkxtSU1FM3NxbzhCNERE?=
 =?utf-8?B?Ym94Y3RBbFNnNkJSNVFielpzZVJvSzdoV2tjVDJ0MHorNzVDZFZ4UTE3YnR0?=
 =?utf-8?B?bEwvY2VLUUNUallsYTVkQjQzVzFCNmMrVkNhQlM1empYalNSRUV1U2NBdExM?=
 =?utf-8?B?eGdBTVRkK3ArdkprdHpnQ21jU0dFSDZJL3lEQVNPRDhoNEhjczN1aDhSUnAv?=
 =?utf-8?B?ZmMxeEN4TkZ3TmpxV3E1dDJNWUhsYm5OWXNGaVZ0SzJ3OUdHRjhOUDdXYVhl?=
 =?utf-8?Q?wS3kXYPqrm/7xNfRvk4kAA7NSDPA7ptZtU2Aw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEVjSEtNa2tWTTdXRzl0NjZnR0R0UG90M2VCSTE0bXpvREQ1WU43NEVCYVJ1?=
 =?utf-8?B?RWcyVlUyd1E1dEFZZTBMNm5YcEI1UHU4Um5WbXptMDRxVU1yZzRvUENCam12?=
 =?utf-8?B?bmMxTmUwNFpuTFgxMksyWHB6SDEya1hMb3EvS0tqdTFnSWk3R3lnS2VjS0pP?=
 =?utf-8?B?YmtRWFhJWlp6UGhuK2hSWmNTQmQzMXlHRDZLRXhWcDJnTlVkcmNzVzFTTXhn?=
 =?utf-8?B?N3RXTDlIejRlMmpHSU9zbmx0SGZJMU0vQ3hQcklpbnJLaVlzazJmdkhENUNt?=
 =?utf-8?B?b2NWZDljODZTNzJsOWQ3cjRhUEU3MjVkZE5iUFNUdjNDRGZZdDVDWlIyOVZh?=
 =?utf-8?B?ZFlIdmFFd2c5SEpQWVl5ZEpaYi9tUVdYOUI0di9XdTdJNUtjM1kwSkNGb0tl?=
 =?utf-8?B?bnhFOVVWLzR5T2Q4eXZqN3ZwSC94REJEM3pQUnZMeDFPZkpjTlluV2dxa3hz?=
 =?utf-8?B?c2Q3azhCSGFNRDdQSkpxMFRCYi90NXBxbVBNd2ticGVBc3dzczcxWjB6eTU5?=
 =?utf-8?B?Rm51V2dFRDYyN1JUTkFVMkdhRGlUdHRCVG0wZm1pZzNSd2YzZGxoR2Yzd09q?=
 =?utf-8?B?RzROUWJ1ME5IeENYVU01eDVVcFA3amx1NmQ0R05NMWYyWHczeEhQS05ESUVX?=
 =?utf-8?B?K2ZxdXc4ZlRGTHN0Tm9LL3ZqczhEZ1hlU0x1K21qNUsvcHV3ZW55YlJyWVNl?=
 =?utf-8?B?WGRRSlcvOTNkVUpzZjhDREZlSUhKbkhKOVgyNWtWTjhkdG1ub2k4QWJYUUdI?=
 =?utf-8?B?eVF3MHJXV2NnQk5uTktKc1M3aElrbXJLazRraHlDYkNxWnF4QWgxemNyY2Ru?=
 =?utf-8?B?U3lJblgxS21kRlFCc3RDZ0Y3c3UrRU1YMGo2Qi9HYXc5azBqcFU5OU4vd1Ix?=
 =?utf-8?B?U1IvcXlWNGIweTNsNVRSL2FJbGlvNUpUUHJ2MHB5RStBZ1I3UlQwbEpSTnFu?=
 =?utf-8?B?MFdXYXZqSXg3ZGU2NjVITlo5MVc2NVk5MGdBUDF0ZjNkRndtSFludlFuOXhh?=
 =?utf-8?B?ZGpwektkQ3pKa2VlMHd2cDNJbWVIK2dnWENhNzVWOExyS0luYmZBNUtSUnZZ?=
 =?utf-8?B?aTJ3eGdETjdYNXI0S0dRVGx3OG9CUHcvbExIRzRwSi9HOVFMSmhvTFNOUVR1?=
 =?utf-8?B?NG9nU0ZOcW9WMjZWd0F4RlZUeTFGWVE4UHk4eE9ESlM5Nk4vZlF3YkRSTkY5?=
 =?utf-8?B?KzB3cDJIMTJ4L2dHRnlXYzNwOXNuc0gwMVlseTR0UVh2NGpCUy9PdnFYdkFv?=
 =?utf-8?B?eVd5ZzF3TW9TREdhdEdrZkEwdm1Qc0VZV1lLbGFkMDhENFBEVS9XMGdOQWpH?=
 =?utf-8?B?S3dUai9neXNmYXlDbnVrNHNBcUlpSDd1eCtaQVRqOXNaRXVhUlk3STBGZkw3?=
 =?utf-8?B?MzErWHoyLzNka3BMZEZrWHZCdlN5S3Q0MW5QRFZqVVRGWkV5VlBXZHdRQU9X?=
 =?utf-8?B?Q0Rqd0ZORUxtQmYrRStDSC8rSHVLcTdrL2tyQVlWbkZLdnJtMG44cFNyeXhR?=
 =?utf-8?B?eHJFMEVrc2hQR0I1K1BRaUNETkdGc1FMcnlHb2lNSCt3SDJiN0NvZHUxUDYy?=
 =?utf-8?B?ZnZBMUZxam04NTRybkhQRDNSbmY0bmlMMVFQQXhIUGN2UTZReXA2a3Q0cEJW?=
 =?utf-8?B?eGp3R3p4WHdoMTFWZ1pucDNFNEladWI5eWFjakpLQXhEUHdGb2REU0Y5U2la?=
 =?utf-8?B?K2g3Y1RoVUlMY0EvNmdTKzNLZld5M3NyWGlNc21WdmorbGR3MDdzSlIweHF4?=
 =?utf-8?B?a1pBdDRyZ1dDZS8zU3c2ZjhBQ0tTK0Uwdy91SVhCNU1kcnNnVWhkV081QkV4?=
 =?utf-8?B?L1N6dkcza1pCbktDQ0NwUElYc3Y3eXRhM3BGcXkyd2dDWmp1RXcwaTR1aTBW?=
 =?utf-8?B?eEFGblpBSENqMnJkMy9YdTRPUGFldUxybHdhNXk2OTNabk5hU0x2eTQrdWFx?=
 =?utf-8?B?dTF5UzZxRW5ZbExwWlFNcldZN2REOW4rb1dwZWFKTWozNmxxYUE5SEhsK1ZN?=
 =?utf-8?B?ZFZPMGxkOWo5MXpya3FyUlpXSkV4Y3JkWXAvOURSZGtid1Y3OHpINEJvQlEv?=
 =?utf-8?B?cVUrUTJPcVpqRmdhalNSdVZmK1p2aEwxekw0M2IvbnNvWHRrKzljS0xaSkhB?=
 =?utf-8?Q?ho7hsRUxGNo8gouFfh5r+syCF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f9cfbb-a697-4825-36ad-08dc8aa98ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 06:33:19.7135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70AXiIJXZxyo1tQ+mVvvNauHnER2XcSerZbBMP+I3IREelFIeT3YkVtXk1N4UwECl+bhwL0yeOP+8X28h4YAGBlJfmEKDNvYZTC9QCat+3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6771

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bj
b2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEyLCAyMDI0IDI6
MjQgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgTmVhbCBM
aXUNCj4gPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
OyBBbmRyZXcgSmVmZmVyeQ0KPiA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0KPiBDYzog
bGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdXNiOiBnYWRnZXQ6IGFzcGVlZF91ZGM6IGZpeCBkZXZp
Y2UgYWRkcmVzcyBjb25maWd1cmF0aW9uDQo+IA0KPiBIaSBSeWFuLA0KPiANCj4gPiA+IC8qIE1h
aW4gY29uZmlnIHJlZyAqLw0KPiA+ID4gLSNkZWZpbmUgVURDX0NGR19TRVRfQUREUih4KcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCgoeCkgJiAweDNmKSAtI2RlZmluZQ0KPiA+ID4gVURDX0NGR19B
RERSX01BU0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4M2YpDQo+ID4gPiArI2RlZmlu
ZSBVRENfQ0ZHX1NFVF9BRERSKHgpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKCh4KSAmDQo+IFVE
Q19DRkdfQUREUl9NQVNLKQ0KPiA+ID4gKyNkZWZpbmUgVURDX0NGR19BRERSX01BU0vCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgR0VOTUFTSyg2LCAwKQ0KPiA+ID4NCj4gPg0KPiA+IEl0IHNo
b3VsZCBiZSBHRU5NQVNLKDUsMCksIG5vdCBHRU5NQVNLKDYsIDApLCBhbSBJwqAgcmlnaHQ/DQo+
IA0KPiBObywgdGhhdCB3YXMgdGhlIGJ1Zzogd2UgbmVlZCBiaXRzIDA6NiAoPT0gMHg3ZikgaGVy
ZS4NCj4gDQo+IFdpdGggdGhlIG1hc2sgb2YgMDo1ICg9PSAweDNmKSwgd2UgZG9uJ3QgZ2V0IHRo
ZSBmdWxsIFVTQiBhZGRyZXNzIHNldC4NCj4gDQo+IENoZWVycywNCj4gDQo+IA0KPiBKZXJlbXkN
Cg0KWWVzLCB0aGFua3MsIGFmdGVyIHJldmlldyB0aGUgZGF0YXNoZWV0LCBpdCBzaG91bGQgYmUg
MDo2Lg0K

