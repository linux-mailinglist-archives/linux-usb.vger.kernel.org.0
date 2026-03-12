Return-Path: <linux-usb+bounces-34656-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNePHeF0sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34656-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:10:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAAB26EAF0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33526303F454
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A58318EE7;
	Thu, 12 Mar 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="je1fWX5l";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="OJoIi6IK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091482D8DDB;
	Thu, 12 Mar 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302870; cv=fail; b=MB6adZCewzf3syUfAf0WWLf5ypMcNPxngfSNtYyHdNJaEv0VUIzkbkGxys9jGyiDE7GRnHX5yAEMn+Fad+XArXFtI4OVVEqnc36pkI9rNbdloPhTzeVARBkKr9n6l+OFNP/LQQSm7dTXiZ9E5N5+zqL9HoVNLGgjbB/NEI62J6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302870; c=relaxed/simple;
	bh=uVo7oZI2iPR2NqS+nmO9OeaA6bVALYL2VudJJ8cEssQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LD5H5qvsgY9zr2NK1TBU4lp85gDxDF3tttqOc7EMIc/fRGZ1fji4qhRS3J5U4J+ujus8JKH1jvM12dD5hPLEhf88qTpII8cP0FWUI47u+9Iogp7atoYonhE6F9WTfbGX1QduvPUQyOmL2vMcWBs8WMclTpnK4dyzcrKO3BOR14E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=je1fWX5l; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=OJoIi6IK; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7ClU53556133;
	Thu, 12 Mar 2026 01:07:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=uVo7oZI2iPR2NqS+nmO9OeaA6bVALYL2VudJJ8cEssQ=; b=je1fWX5lu6j9
	jZNNspfD3BL+OIj9LD9Bp93AB0MIBIw3XOsfyiDRmx3Lq9qWwVt7mR7bLzjvufHt
	7jkeda3iWFcUS1PPr7z86Jt3d7dvgyRR9YKGOm/NxjCqw9NSvTRDtMQaBiWnn5eT
	DP+tYaQRqsMrCidYW9vdsLfoNAGmoRIdDXshp5L/kgSsbWu1GN7QPyFkxOsD7LBE
	7oYyFi3zwL/Ok4KVuE5rBZunKAU8XaoW6FrNm5Lg5kTNC+/8jZGpK+FACK14x/XZ
	FHNlrvT0mS6VfBnmcDk92cqrKIYHYq+mJFXw3SH1rl4OsEmAFgobNg0Qv17/7F42
	6F609T2GOQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4cuh77t5hn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 01:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUvzR/IWozZyMIiSiBN5ZFa0xqKQZ214TWmDkqfGvMllMgtxGptVtbCbMJJpcfb1v7I44v0tyV++meenHIubIjBottxQ8O5OdkQ3OucWxIeZQziAHrVMt5inQ0wH+6VepIoiILDSazBcAhyc5++a5ROtr5lh0LdBXmn77bl+1woYbVB0m6kLlXiSVtkhmLYpPBlAAWIqGeg1z+tpCnkdhsegmQfjl5CDRI5aQvUjZfoeXHPc0VdePa2aetsHxB+oRxfAuJ+IlctzCg5eHZvRB1G2P3hHEF3NTx8pquvfDOwF/Cmj61zdXjnZD8QuDhNt1z2gEwsAUedzUxEo69q/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVo7oZI2iPR2NqS+nmO9OeaA6bVALYL2VudJJ8cEssQ=;
 b=lQUg1kR6F3fV0XF9td7lsSP2gOHz1cfOdoyAELQmzFGVfpC+FXLhpDzduM5gZdMw+ndIfLlhatWQlOTXWN9RoJo9taQgvxb/GlIdbopTRuIPyS3bXUXyVeFyD5reWtkIuRtA2qsCi5I/Ujmq8MYF8bxLT5HP/bdP4kxiGQpAFJ84+FmqYt8Da/Iie9m2RxZzoZjyo/gPA+eeueufD3gUhhKyONl80wJaNmJ4b798q26iuHSrx23b5dYNuquvuIcAgw4/TtgOXMwqRiSjIYUtseffCgTNx8Fm8zSs1rjpo4+LWI8aTfq1AFzadYh29EhPv7EOkL2xCJDvweSjRgtjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVo7oZI2iPR2NqS+nmO9OeaA6bVALYL2VudJJ8cEssQ=;
 b=OJoIi6IK/jl4A77RCyFhPxyKz24zT9nRuJBevEAKFkQEzPcXsOcwgdmEgb6hrFxzO7wZ+tOuTn43mvdPuSLg+OSIwwF1Y+yWgzioxFOCqO9rzn17WtltlkF87Lj5TxpRQOaLzV6MUUR2vOKdt7VfKxZfYK4bLJCUUMifad1eIeBjTU7RNtpio3gj3bCl8u1qh/bJLFzYPyeRu06JK0FRuecLmXfn0+zitOU4ts0m3jpuFoy3XrHzDQ3TIlip3jQqVCIIJ79RqymejmJHhvlU78MOYL4ByeCSttGJu7b/MhjKgVGhAinNLDYUakbjFzknJgTBQSU3THkEZWVCp/uyow==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by SA1PR07MB8434.namprd07.prod.outlook.com (2603:10b6:806:1ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Thu, 12 Mar
 2026 08:07:22 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 08:07:23 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Peter Chen <peter.chen@cixtech.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Topic: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Index:
 AQHcqfEzqq3AzishPkyu47OHwJ3jnrWa2FeAgAAfqICAAAGdgIAAGbMAgAMTr8CACyL2gIABTo6A
Date: Thu, 12 Mar 2026 08:07:23 +0000
Message-ID:
 <PH7PR07MB9538AEE24820029A2C59EA53DD44A@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
 <aaVWlfMPSZgy55Cc@nchen-desktop>
 <81c86ce7-0c55-4c2b-8956-cea4c63351cb@kernel.org>
 <aaVtfpY1waI8yQOf@nchen-desktop>
 <PH7PR07MB9538DCBF95C0C77D150E2D4BDD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
 <abFZz0Z4-VBhiYF7@nchen-desktop>
In-Reply-To: <abFZz0Z4-VBhiYF7@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|SA1PR07MB8434:EE_
x-ms-office365-filtering-correlation-id: 4ea4741d-57eb-4ecf-0e2d-08de800e645c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 oFNQUll5CNKl9sqaxvIAyOpFZgxOIfXwNK3ZPSCqlnh0O6yqpKVhJ6N4Rzb77gAKtfbPcCnoElsHxHd4b699h1i48n8DOp3t38rkhevp0sPwTDvZQl7UrV0MwK4dEAEmrnCiA00Yi2DdMXn0ED/8BZM0cmY1YR9YOH8L6oiDqNGHfAQ5HqVTm9mRYpH1Eo+NIgoPaqljmJ1qMbKSb+mfQEM3Mx+2Z5ClEsxxBTgdnZnBk13hLDRdQGS+55XfR0kHMCTWL3ALnaS8Z7acK+3r5LlW0VIdAXmGmE920xESrdH4gdWjaWWKDBhuJsGuPTfTqE6DuW5kfKa1bnP+AGETLjL7Hqwmt5/9Y+fzLHyf80uOb0BPyix1onUVmP3ebMMKY4rX+TLd3kh/n3GGl4HzEyGCDxo1XGB+Moa8ZSCxgMEM9hOqGSoBD8Fevv+W7ZNV7XYrzUtoh/JyFJ+zedQEifaIbhaLmkuJs0PzPhxDBOi+YdezwpaeDxA3r8c+7iNQBDMlsox0tdSx6NMUhYAvCl10dTfdzydGwJIJ4+AdqFn1IXN6oE8Ifyd273KfJ2481IkDIijOrJnb8JIPuxaKsxtDY+xPnf+0FLSeF5wWphundv+3c6zhjqJz97mGqMk0OwhGaUYz/+FQpjRZlJ7NtfoBxb8hPRp1xbetPkiUXDAUHewibMMk7lL9je2OVZYi9ozBdPTy3u7G/zsXW/0HhyLEj6l8ky1s439u0Ut8cpK5mgnQbwk0O+pdIrZ4CvYO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NG1GRFk4dFNsMS8xd2NCR2hIMWlLR1libHp6MUhKb3NKTDZOKytTb21DTDZR?=
 =?utf-8?B?ekJjVHBkV2ZoUFNuRjFaZkVzd2tZanRRd1JUazFrMDRjcWF0VXdhaGJhZ2dG?=
 =?utf-8?B?S3o3K3RwcTR3NnNoTjQvRlRYekp1bG1hZ2JuLzJGazBKL0tnL0oraHYwK0lt?=
 =?utf-8?B?NWxBQTBSbHRYWlRiaFJWeFdTOWhCalJvcjNZeVB5SHdxR0dSM3VIVWM4cVFE?=
 =?utf-8?B?b0R4ekhsakxCWTR0UEFRQVFkKzAvRjZKREpPb25QNXBXb2hEWmNGVDAzdDZs?=
 =?utf-8?B?aGR1UjZYaWdhMjdTbWdHMHNrazVFNHhnVmNGOXdwOHpqRmYrVFVaamdDZ3FW?=
 =?utf-8?B?ZzNla3ZFZFczMWJ0V1BhZ0JjVUIxNWlRakZEcTZtOVQ4bmRJajBLZDh3QTdB?=
 =?utf-8?B?SHl5RUpMdU9RS29lWXV2WGkvODdzdnZTanZvKytnbkFYMjY1RlpjR1BZS1hk?=
 =?utf-8?B?RmIwazFXakRScEVmcCtaYWdocUZVNnBHdTB4RmJlbW1pYTErTWE0Y1hhREVL?=
 =?utf-8?B?S2hjSEJWMEpyMkNuN3BQZ1pSeFp1V1ppNksvVCtvZFB0VXlPSHZDNE5KSWVJ?=
 =?utf-8?B?NFVwY1ZiYk45Q09vclBDeTh0ZkFMRUJHaFBXalJEb2xKa3B3d1dTbXE4VkJU?=
 =?utf-8?B?bCsrN2orOERaUnVGTVpuNDVYanBIWHZvNUtWNDBFbW5tbUdhZ040ejUzeFpN?=
 =?utf-8?B?ZWJiZ2tIVkVUYmtGMm1CdWx4VlErYWY3Mk8rZzJzMkVjZnJRWjRCTzdsM1lJ?=
 =?utf-8?B?QXZ6QXpJZ2dBeWNaNFk5d2kxVEZnKytOejNMUGRyQ0NVbE9PTHpZRm0ybUN3?=
 =?utf-8?B?ZjBIZHQ1OTFPMEl6ZUZ4aTJQTVM3Tkl5eERFbXQxOVEyTG1hQjRpeURMOFhM?=
 =?utf-8?B?dnZ5czRVM0ZJWHE5c1ZMcjRyZDAxRjI1MGxtK3dNU2lFdmxlN0JNRThjTW5C?=
 =?utf-8?B?RVB6M0VoYzh0SWVBbzQ3ODlkNForalk3NEhnV2d1NXB1d0h0MlFpNlE2dzls?=
 =?utf-8?B?VGVXT2FXSW9LdGVUamlVUi9oY1pOczJJWkNoQ0lmZnhuSm9hVEdoQm15NWtU?=
 =?utf-8?B?aTQwdC94RFZDZGkvV2d3NzFpV2wraWx4TkdIQUlsUTNrQUlqZ3FFWWtnT1ln?=
 =?utf-8?B?bThZNzZEc3VmWHpRTzlZckhER3RRdVRQTEt1RlVOMlhGMlFCWThNVnR0N0Zw?=
 =?utf-8?B?QURtRmlaMjE1QXRuKzhwQ2pGMGZla255R3NqTzJNc0Z6czB2aEx2QnJuSHdT?=
 =?utf-8?B?dWVTSTA5SnpBZlVyR1V6b2F4L3lTY3E0RFhNSzFOYW50Z3NybERtMkJqMzNB?=
 =?utf-8?B?ZzVFQjhyNzcvNFlZdTNUTHRhY1paYzRob3dXRjdNMVpCbG5TMUZpQXJ3WTJq?=
 =?utf-8?B?MDdUYk14UENFNjM4Qzh4WjhNdm44b28yT0taT2Z3VFFwY3lDQ3U1eUptMW8r?=
 =?utf-8?B?cVVycnFSVDFFNFozWmdtNG45R3lCZmNnUUxLRnJGekRtS09xSXFROVRCRkkv?=
 =?utf-8?B?aFVRNit2MnVYVU5IRGtCbjZoRlM3L0pWV0F5TkVBZHFMWkVCRDlJeXJQWEZP?=
 =?utf-8?B?Unh6VklZV1g1QThTTGdGWWpvZFdRNlFuZlhWSkg0bkc3QloxdGY0dW5kTnNC?=
 =?utf-8?B?bWNkZ2haWmZFN0pFRFlIQU93Q0ZiT2xOTFc5bXVlUHJUTzdFaUY3UzFrZm53?=
 =?utf-8?B?RjQzT0JPWnJycUtUU2IvalYvMHVUd1Q0WmZXMUVBNjRsMmFoWmMwVVZSL2JR?=
 =?utf-8?B?VUp6OU1KMXd1MmJYQmZIamI5U2ZTZGRQUndKWVpvUmt2MXdMeGJwaXFnaVdm?=
 =?utf-8?B?ZkFyRkVCTUxYanVoZ0JrMWZoRmRaTkJ6VUUzNTlXbnJsd0hTZHY2OGFkeDRQ?=
 =?utf-8?B?bmJvMlUzRVZCWTV5U2tKMWpJNEtDRUtPdUVhQ1BYemVPR0pMUVBSMU9GbWRk?=
 =?utf-8?B?OFAydmtUZlRVTjRJWUNLQU5WbHVTblhIZnIvZHRkcVJJc3FUNDlFSkZoa2ts?=
 =?utf-8?B?MkIrY0k4cFp6b21EeDFtT1hta1VuL2tjOFBLSUxuRmxBa2UveXBvTGRUV2o4?=
 =?utf-8?B?UUQ3dERZeDB4RW9GcGc0LytwMmtQbTZsSERnQTRnaDdRZDJKbnA5YUJYQ09T?=
 =?utf-8?B?bDB1a3FoM2txOXpUbWVVQ1Q1ajg0TTMvRmEyUmZuSy9NT3FRRWJLOU9uajFv?=
 =?utf-8?B?cDZDK2djS0d3aGVsaGZaU0pucjFxZG1DSFU4Ymd1WTJPeE5tVktjTEJWa2Ro?=
 =?utf-8?B?a3pOMmdXN0FNNjIzYzJ3c3pvclVkMVpoZ3ZTa0ZoS0VLUDkzZEFCcmt2eUtJ?=
 =?utf-8?B?OG5nWmp6bWwrcVorRDY4eUJ0Ull4eVlnb25Oem9BcXVESVNvMTlIQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	NEKYoN7AkHlT/IoIShc6ZBY5ee++5BCPXusTuWMivjgRSjMkiEsnUjAKKJJFWiRQLzKEYYKFh5qylmgj1fiWcwCNoLSaIf6j/kCqSy9oJVzXMxHlTdI6p9NjBMo6VJMk0zL2chGS5KsCfhr81IEvRcR8HLGBpv4U2ZvQ0AVD00SMaAtXHHXFpHUvWHXCvIwc+OiBEYM5oMGiiYHH1YEGbm1cjlJGVC6k+vSc649G09NjMXGjTALkCp/1k7HOifDWQJKFJRQsClFXK16YzovKzhVrkGsRsleAwT/E8pWl4Z1VffZbo7dl3DSorSscRN5W61syvHpUADfxAFeV+XQgMA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea4741d-57eb-4ecf-0e2d-08de800e645c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:07:23.4348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihJtb6Ceb4MMs4juJbBai6mwXSREHkTv0dvjoVb8ch84U7cYh4TOCIZj4zTiyvZQspvIlhaEUqatFROYNSBhXQC+Wqm9rW56PcOn+YW3FIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR07MB8434
X-Proofpoint-GUID: jCa0nRG7VbktqdhXev1UgztQEh69KxPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2NCBTYWx0ZWRfX5WlySec2+Zwp
 oQNvklDcm1TpfbMtt+mkTyYD5pThiTjwnV2vXG4gG1JyJ6cKbEYW6Ne/KVl1im/wqTECNLvKJpY
 WaiULxdhZjhS3ecQd2hutpm42oa5GwBEQvJiLQvcOJwS8XNHksuPVa1+HgewuxSRxvi7OjrN2ME
 KJf33FO0OWzb5jYsMW6B1MSaFOu62rN3wd3KGGwDmsmbWDWR1l9s+RD/+TJZMKYaa14JWMX+6MC
 NIlwELKodRCbNHgedtFyKF6DPiyuPHmnOjTBNPsfmCmQIuBZbngKLiAcvqmt7vgcYatwa3/vQO+
 bgvOx/Q5v1nmRXHSfvy9uueFw2/5XUJIeTKym6wiXqsKUZVV6u0c7XIDkZ/oEZVlurxG7ohKFzG
 9cuKKT9Q2yzPxIIGPeLL0BHK3HHOKYbAHA94kB8ecKW/XsdA5iTIgk7YD8BlFafiU11XokA6KQX
 gYviPzKO0WmLH1zhztw==
X-Proofpoint-ORIG-GUID: jCa0nRG7VbktqdhXev1UgztQEh69KxPR
X-Authority-Analysis: v=2.4 cv=fJQ0HJae c=1 sm=1 tr=0 ts=69b2743e cx=c_pps
 a=espmfoAAVKQgPoIy+vmhGg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=uherdBYGAAAA:8
 a=_EeEMxcBAAAA:8 a=Br2UW1UjAAAA:8 a=klBAjmabWCr7PT3a6xMA:9 a=QEXdDO2ut3YA:10
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120064
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34656-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[PH7PR07MB9538.namprd07.prod.outlook.com:mid,urldefense.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cadence.com:dkim,cadence.com:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DAAB26EAF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pg0KPk9uIDI2LTAzLTA0IDEwOjAyOjA3LCBQYXdlbCBMYXN6Y3phayB3cm90ZToNCj4+IFtTb21l
IHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBm
cm9tDQo+PiBwYXdlbGxAY2FkZW5jZS5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBh
dA0KPj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYWthLm1zL0xlYXJuQWJv
dXRTZW5kZXJJZGVudGlmaWNhdA0KPj4NCj5pb25fXzshIUVIc2NtUzF5Z2lVMWxBIUZmQ0FZZWdh
SlljQUdOdXBETFp4VVRPS2dMaUpWelpNZE1lNXBLN19XdHhxDQo+a1RNDQo+PiBQWmJLUW5UXzFG
TXJPYV9hcjdkcW9xdHBkRklmcF9fRmhYbjlhJCAgXQ0KPj4NCj4+ID4+ID4+Pg0KPj4gPj4gPj4+
ICtkZXNjcmlwdGlvbjoNCj4+ID4+ID4+PiArICBDYWRlbmNlIFVTQiBkdWFsLXJvbGUgY29udHJv
bGxlcnMuIFVTQlNTIChjZG5zLHVzYjMpDQo+PiA+PiA+Pj4gK3N1cHBvcnRzIHVwIHRvDQo+PiA+
PiA+Pj4gKyAgU3VwZXJTcGVlZCAoVVNCIDMuMCkuIFVTQlNTUCAoY2Rucyx1c2Jzc3ApIGlzIHRo
ZSBuZXh0DQo+PiA+PiA+Pj4gK2dlbmVyYXRpb24gd2l0aA0KPj4gPj4gPj4+ICsgIFN1cGVyU3Bl
ZWQgUGx1cyAoVVNCIDMuMSBnZW4yeDEpIGFuZCBYSENJLWJhc2VkIGRldmljZQ0KPj4gPj4gPj4+
ICtjb250cm9sbGVyLiBCb3RoDQo+PiA+PiA+Pj4gKyAgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXIg
bGF5b3V0IGFuZCByZXNvdXJjZSBtb2RlbC4NCj4+ID4+ID4+DQo+PiA+PiA+PiBTbyBhcmUgY29t
cGF0aWJsZSBvciBub3Q/DQo+PiA+PiA+Pg0KPj4gPj4gPg0KPj4gPj4gPiBTb3JyeSBmb3IgdGhl
IG1pc2xlYWRpbmcgZGVzY3JpcHRpb24uIFRoZXkgYXJlIE5PVCBmdWxseSBjb21wYXRpYmxlLg0K
Pj4gPj4gPiBUaGUgcmVnaXN0ZXIgbGF5b3V0IChPVEcvWEhDSS9EZXZpY2UpIGFuZCBpbnRlcnJ1
cHRzDQo+PiA+PiA+IChPVEcvWEhDSS9EZXZpY2UvV2FrZXVwKSBhcmUgdGhlIHNhbWUsIGJ1dCBy
ZWdpc3RlciBjb250ZW50cyBhcmUNCj4+ID4+DQo+PiA+PiBMYXlvdXQgY2Fubm90IGJlIHRoZSBz
YW1lIGlmIGNvbnRlbnRzIGlzIGRpZmZlcmVudC4gU2FtZSBsYXlvdXQNCj4+ID4+IG1lYW5zIHNh
bWUgcmVnaXN0ZXIgaXMgYXQgdGhlIHNhbWUgcGxhY2UuIElmIHlvdSBoYXZlIGRpZmZlcmVudA0K
Pj4gPj4gcmVnaXN0ZXIgd2l0aCBkaWZmZXJlbnQgY29udGVudHMgYXQgZ2l2ZW4gcGxhY2UsIGhv
dyBpcyBpdCAic2FtZSBsYXlvdXQiPw0KPj4gPg0KPj4gPlNvcnJ5LiBJIG1lYW4gdGhlIFVTQlNT
IGFuZCBVU0JTU1Agc2hhcmUgdGhlIHNhbWUgcmVzb3VyY2UgbW9kZWwNCj4+ID4odGhyZWUgbWVt
b3J5IHJlZ2lvbnMgZm9yIE9URywgWEhDSSBhbmQgRGV2aWNlLCBwbHVzIHRocmVlIHRvIGZvdXIN
Cj4+ID5pbnRlcnJ1cHRzKS4gQnV0IGluIGVhY2ggcmVnaW9uLCBlZyBpbiBPVEcgcmVnaW9uLCB0
aGUgbGF5b3V0IGZvcg0KPj4gPmVhY2ggcmVnaXN0ZXIgYXJlIGRpZmZlcmVudCBmb3IgYm90aCBj
b250cm9sbGVycy4NCj4+ID4NCj4+ID5QYXdlbCwgSSB0aGluayB3ZSBjb3VsZCB0cnkgS3J6eXN6
dG9mJ3Mgc3VnZ2VzdGlvbiBhbmQNCj4+ID5kaWZmZXJlbnRpYXRpbmcgVVNCU1MgSVAgYW5kIFVT
QlNTUCBJUCBhdCBydW50aW1lLCB3ZSBjb3VsZCB1c2UgRElEDQo+PiA+cmVnaXN0ZXIgKGNkbnMt
PnZlcnNpb24pIHRvIGRvIHRoYXQgYW5kIGF2b2lkIGFkZGluZyBuZXcgSVAgZ2VuZXJhbCBiaW5k
aW5nDQo+ZG9jLiBXaGF0IGRvIHlvdSB0aGluayBzbz8NCj4+ID4NCj4+ID4+IEFnYWluLCBkcml2
ZXIgc3R1ZmYuDQo+PiA+Pg0KPj4gPj4gPg0KPj4gPj4gPiAgIGlmIChkZXZpY2VfZ2V0X21hdGNo
X2RhdGEoZGV2KSA9PSAmY2Ruc3BfcGxhdCkNCj4+ID4+ID4gICAgICAgY2Rucy0+Z2FkZ2V0X2lu
aXQgPSBjZG5zcF9nYWRnZXRfaW5pdDsNCj4+ID4+ID4gICBlbHNlDQo+PiA+PiA+ICAgICAgIGNk
bnMtPmdhZGdldF9pbml0ID0gY2RuczNfZ2FkZ2V0X2luaXQ7DQo+PiA+PiA+DQo+PiA+PiA+IFdp
dGhvdXQgYSBkaXN0aW5jdCBjb21wYXRpYmxlLCB0aGUgZHJpdmVyIGNhbm5vdCBrbm93IHdoaWNo
DQo+PiA+PiA+IGdhZGdldCBjb250cm9sbGVyIGlzIHByZXNlbnQuIFRoaXMgaXMgYSBDYWRlbmNl
IElQLWxldmVsDQo+PiA+PiA+IGRpc3RpbmN0aW9uIChub3QgU29DLXNwZWNpZmljKSwgc28gYSBn
ZW5lcmljIGNvbXBhdGlibGUgc2VlbXMNCj4+ID4+ID4gYXBwcm9wcmlhdGUgaGVyZS4gQnV0IHBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UnZCBwcmVmZXIgYSBkaWZmZXJlbnQNCj5hcHByb2FjaC4N
Cj4+ID4+DQo+PiA+PiBHZW5lcmljIGNvbXBhdGlibGVzIGFyZSBhbG1vc3QgbmV2ZXIgYXBwcm9w
cmlhdGUgYW5kIGRyaXZlciBjb2RlDQo+PiA+PiByYXJlbHkgY29udmluY2VzLg0KPj4gPj4NCj4+
ID4+IEJlc3QgcmVnYXJkcywNCj4+ID4+IEtyenlzenRvZg0KPj4NCj4+IFRoZSBEZXZpY2UgKFBl
cmlwaGVyYWwpIGNvbnRyb2xsZXIgaW4gVVNCU1NQIGlzIG5vdCBqdXN0IGFuIGV2b2x1dGlvbg0K
Pj4gb2YgVVNCU1M7IGl0IGlzIGEgY29tcGxldGVseSBkaWZmZXJlbnQgSVAgY29yZSB3aXRoIGEg
ZGlzdGluY3QNCj4+IHJlZ2lzdGVyIG1hcC4NCj4+IFdoaWxlIHRoZSBIb3N0IChYSENJKSBhbmQg
T1RHL0RSRCBwb3J0aW9ucyBvdmVybGFwIHNpZ25pZmljYW50bHksIHRoZQ0KPj4gRGV2aWNlIHJl
Z2lzdGVyIHNwYWNlIGluIFVTQlNTUCBpcyBhcmNoaXRlY3R1cmFsbHkgaW5jb21wYXRpYmxlIHdp
dGggVVNCU1MuDQo+PiBUaGV5IGFyZSBkaWZmZXJlbnQgSVAgY29yZXMgaW50ZWdyYXRlZCBpbnRv
IHRoZSBzYW1lIHN1YnN5c3RlbToNCj4+DQo+PiBUaGUgcmVnaXN0ZXIgbWFwIGZvciB0aGUgRGV2
aWNlIGNvbnRyb2xsZXIgaW4gVVNCU1NQIGlzIGVudGlyZWx5DQo+PiBkaWZmZXJlbnQuIE9mZnNl
dHMgdGhhdCBhcmUgdmFsaWQgZm9yIG9uZSBjb250cm9sbGVyIHBvaW50IHRvDQo+PiBkaWZmZXJl
bnQgZnVuY3Rpb25zIG9yIHJlc2VydmVkIHNwYWNlIGluIHRoZSBvdGhlci4gVXNpbmcgYSBzaW5n
bGUNCj4+IGNvbXBhdGlibGUgc3RyaW5nIHdvdWxkIGltcGx5IHJlZ2lzdGVyLWxldmVsIGNvbXBh
dGliaWxpdHkgdGhhdCBkb2VzIG5vdCBleGlzdC4NCj4+IFVTQlNTIHVzZXMgYSBjdXN0b20gRE1B
LWJhc2VkIHBlcmlwaGVyYWwgY29udHJvbGxlciwgd2hlcmVhcyBVU0JTU1ANCj4+IHVzZXMgYW4g
ZW50aXJlbHkgZGlmZmVyZW50IFhIQ0ktYmFzZWQgYXJjaGl0ZWN0dXJlIGZvciB0aGUgZGV2aWNl
IHNpZGUuDQo+Pg0KPj4gVGhlc2UgdHdvIGNvbnRyb2xsZXJzIGRvIG5vdCBwcm92aWRlIGEgcmVs
aWFibGUgd2F5IChlLmcuLCB2aWENCj4+IHJlZ2lzdGVycykgdG8gZGlzdGluZ3Vpc2ggYmV0d2Vl
biB0aGVtIGluIGV2ZXJ5IGNhc2UuDQo+PiBXZSBzaG91bGQgdHJlYXQgdGhlbSBhcyB0d28gc2Vw
YXJhdGUgY29udHJvbGxlcnMgdGhhdCBoYXBwZW4gdG8gc2hhcmUNCj4+IHNvbWUgY29tbW9uIGNv
ZGUsIHJhdGhlciB0aGFuIHZpZXdpbmcgVVNCU1NQIHNpbXBseSBhcyBhIG5ld2VyIHZlcnNpb24N
Cj4+IG9mIFVTQlNTLg0KPj4NCj4+IEkgYmVsaWV2ZSBQZXRlcidzIGludGVudGlvbiB3YXMgdG8g
dXNlIGEgY29tbW9uIERUIGJpbmRpbmcgYW5kIGENCj4+IHNpbmdsZSBwbGF0Zm9ybSBkcml2ZXIs
IGFzIHRoZSByZXNvdXJjZSBtb2RlbCBhbmQgcGFydHMgb2YgdGhlIGNvZGUNCj4+IGFyZSBuZWFy
bHkgaWRlbnRpY2FsLg0KPj4gSG93ZXZlciwgZ2l2ZW4gdGhlIGFyY2hpdGVjdHVyYWwgZGlmZmVy
ZW5jZXMgb24gdGhlIGRldmljZSBzaWRlLCBJDQo+PiBiZWxpZXZlIGhhdmluZyBkaXN0aW5jdCBj
b21wYXRpYmxlIHN0cmluZ3MgaXMgdGhlIG1vc3QgYWNjdXJhdGUgd2F5IHRvDQo+PiBkZXNjcmli
ZSB0aGUgaGFyZHdhcmUuIEl0IHByZXZlbnRzIHRoZSBkcml2ZXIgZnJvbSBtYWtpbmcgImJsaW5k
Ig0KPj4gYWNjZXNzZXMgdG8gcmVnaXN0ZXJzIHRoYXQgaGF2ZSBkaWZmZXJlbnQgbWVhbmluZ3Mg
ZGVwZW5kaW5nIG9uIHRoZSB1bmRlcmx5aW5nDQo+SVAuDQo+Pg0KPj4gTWF5YmUgdG8gcmVzb2x2
ZSB0aGlzLCB3ZSBzaG91bGQgaGF2ZSBzZXBhcmF0ZSBEVCBiaW5kaW5nDQo+PiBkb2N1bWVudGF0
aW9uIGFuZCBwb3RlbnRpYWxseSBzZXBhcmF0ZSBwbGF0Zm9ybSBkcml2ZXJzIHRvIHJlZmxlY3QN
Cj4+IHRoaXMgYXJjaGl0ZWN0dXJhbCBzcGxpdD8NCj4+DQo+DQo+UGF3ZWwsIGN1cnJlbnRseSwg
dGhlIE9URyBhbmQgaG9zdCBzaGFyZSB0aGUgc2FtZSBjb2RlIGJldHdlZW4gVVNCU1MgYW5kDQo+
VVNCU1NQLCB0aGUgZXhlY3V0aW9uIGZsb3cgaXMgZGVjaWRlZCBieSBydW50aW1lIGFscmVhZHku
DQo+QW5kIGZvciBkZXZpY2UgbW9kZSwgdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgZHJpdmVycyBm
b3IgdGhlbSwgd2UgY291bGQgZGVjaWRlDQo+d2hpY2ggZHJpdmVyJ3MgaW5pdGlhbGl6YXRpb24g
ZHVyaW5nIHRoZSBydW50aW1lLCBhZnRlciB0aGUgaW5pdGlhbGl6YXRpb24sIHRoZSBkZXZpY2UN
Cj5kcml2ZXIgKFVEQykncyBiZWhhdmlvdXIgaGFzIGFscmVhZHkgZGVjaWRlZCBwZXIgSVAgKFVT
QlNTIHZzIFVTQlNTUCkuIEFyZSB0aGVyZQ0KPmFueSBleGFtcGxlcyB0aGUgY29udHJvbGxlciB3
b3VsZCB2aXNpdCB3cm9uZyByZWdpc3RlciwgZWcsIFVTQlNTIElQIHZpc2l0cw0KPlVTQlNTUCBy
ZWdpc3RlcnM/DQo+DQo+UGV0ZXINCj4NCg0KTm8gc3VjaCBjYXNlIGNvbWVzIHRvIG1pbmQuDQoN
CkFzIGxvbmcgYXMgdGhlIGNvZGUgbG9naWMgaXMgY29ycmVjdCBhbmQgdGhlIHJ1bnRpbWUgZGV0
ZWN0aW9uDQoodmlhIERJRC9QSUQsIG9yIFBDSSBJRHMsIG9yIERUIG1hdGNoIGRhdGEpIGZ1bmN0
aW9ucyBhcyBpbnRlbmRlZCwNCnRoZXJlIGlzIG5vIHJpc2sgb2YgdGhlIGNvbnRyb2xsZXIgYWNj
ZXNzaW5nIHRoZSB3cm9uZyByZWdpc3RlcnMuDQoNClBhd2VsDQoNCj4NCj4tLQ0KPg0KPkJlc3Qg
cmVnYXJkcywNCj5QZXRlcg0K

