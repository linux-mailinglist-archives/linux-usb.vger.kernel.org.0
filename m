Return-Path: <linux-usb+bounces-33764-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEN0I+/coGmMngQAu9opvQ
	(envelope-from <linux-usb+bounces-33764-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 00:53:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFC1B10FD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 00:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B09C306C443
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 23:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CC432ED45;
	Thu, 26 Feb 2026 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nu11Ip+2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DZUBcPqE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C44JbBtp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9446329C56
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149934; cv=fail; b=qnNN4vJbL7Vw60iW1d0GKS/skixbRBs+fPHhKoIJmz2qhnEFoVTaan6K7pM1LD2qtCP3kU3pUhh4zqOfheVOvJn53Uv0+jomE6sFWg1R8Hfw1kVz/BavwABaO3eZN7AxdWfeM+K5mejyNL6hMMESChXYhxsRwUwDkeFqZTaMV8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149934; c=relaxed/simple;
	bh=AQqwHqq9GIIn8yUFDq3SGKhFJO2I1Ve8OrKsIly5tXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lP+fzc1v1ydonqrd1WSW9nQJaL2IJyTf28pVlBAzaiXlPgv+Ou9rpLXqciofr6mqopDihgYpphLNWcNvZtFnVFP8sJH1somh+wxWHx3R8b4nFb55CW99RjSU5/H1m5WamxYYHBXjba4Rc27Vwnk6A7UkZcEFZqiZDPOg93hX9xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nu11Ip+2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DZUBcPqE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C44JbBtp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QKKHAb3712675;
	Thu, 26 Feb 2026 15:51:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=AQqwHqq9GIIn8yUFDq3SGKhFJO2I1Ve8OrKsIly5tXU=; b=
	nu11Ip+2/unlOlflng+yyRJrI8QmnbKo41+81/BAXh9OJB35TV0w1p/oG5il+06U
	OmQcs6KgsB3zC3jJQ0IgJi9yTByNIvU5HDevTGMB3oZ2oQ/lLkcCNg4RAIsUWKct
	fQkoDw6qwyGEqW1xdDHlBejzs7rtn5fcEz0MLQt6hYQyyaxHLZQhe+WtLq0GOfhN
	GGVCulSxn+e5id502iiW5ujKDWmwj4AVtD2qIfCFC/WeEYWlygN/1laVQy26LGeY
	FnhEZtWQp/4lMkQ7vQEr8gb3B2ZTQMuYw5Ukrqw/7VF3IhiE7kptN8aBVPxX9Yo7
	S2qL3zF3Ft0/AjrtPtG0mw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cjkgqd9xs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772149902; bh=AQqwHqq9GIIn8yUFDq3SGKhFJO2I1Ve8OrKsIly5tXU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DZUBcPqEshp+wKLJ8y/y9LvlKSth5UZwELiv3oJoGNlxb9wNx/BlHliHlId/p0tcJ
	 rTVrD9zFy0d8JDq1PfCrdGWHQHgg0vD+z9OsT3uBcIqFdprFet220Hnqj9a2+kUQ1V
	 yUlPM+eLAr8VF/vqR+KmRmaJ+3N62gRZe4TWw21Y4HaBFsnXL/NhJa7jlI/GhN2et1
	 Haw4L5k8GZ2PiCPTrAHidxj3QsCT9Tr1tgfNOoeRJeICYR4ohc2jQz0ajqEyVL3AYY
	 3vAMq8ZOu1b7HakVaxqYKr3fnAy0taOXCjztitFhjZ1Fdfj/d7DJck0bpalW9KA14n
	 tSGl26lP2WoSA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8385540346;
	Thu, 26 Feb 2026 23:51:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5E812A007A;
	Thu, 26 Feb 2026 23:51:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=C44JbBtp;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B0C33405EA;
	Thu, 26 Feb 2026 23:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUd2awOobZwaUdo0Lxks3/MTodrEQGEj9ihvBbcrnFQ3cG7U7oEcbCwk5oDztJHNMt/GZdLrtjkcRvG2UE8gdkkQTN2r2ikKdIWcH7wWbDvY/wcQm7p/+RPiX4Ai6yel+yJYq3o6zDgkq9o6HOLzYUxG5wh2J6z6gEYlo0iUod8lqB8mriKRbrumSRTLbD/Lg1GtUvMS12okQ7dZHNtWRcI1bZgBKUB+b5cpMNSFk23Oi1FrVRuFz0Pv9B8FT1VfIoey16VHYVBil3Kbjb1zH/SbiYf5VXPes+W0CWmGkQTcbvhvXz4qTHiH0Ea4bpOmGTr7BiknNbewzKfn6EF+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQqwHqq9GIIn8yUFDq3SGKhFJO2I1Ve8OrKsIly5tXU=;
 b=cx/K2PX2RQuO3SPyCY2zDH5hWNyPw5tciLBZ7m3MuUMCWz79rV26uO7zySIwlBJEOkFmx4oQGDhB/U6IRYXtVzOFRKYcl4L2ZH2xIZRGS+cD8HUK3uVuKl4wysnA5/E4AZO56/UjHcYS/I3ZK7E1rl65szeGZAngHcPMn7ny4LIQwEVt2WyHHyM70lj21GSaHt7sCQwpcbXzA1aG61gq8lPgCOZR4DJKWtM46PDD2Uf2m//XaTOGfsyhqU74p/w2Echme1wPa/M5t0g774A/m4jXJzzLMDxHYGql12HxQMm0ySCrplwP/oFsvuLk0p+VP3mBStJAzkGpjH3zEMlDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQqwHqq9GIIn8yUFDq3SGKhFJO2I1Ve8OrKsIly5tXU=;
 b=C44JbBtp/zY9ErWqIfAXDiocMNzd685aKUhkVfwEb52SKSh0NCl1MsS3SzzSkr0ziKNvpiDYi6dfvYw15pGlz4Qti5+DXqCG+ER0inq2vnjpCcvCaK/I4xO21UO7MgRg2xEWoPvkLOj5o61PsgWvZ9eGgZ+qXOYywuMmHb291nA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB5641.namprd12.prod.outlook.com (2603:10b6:303:186::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 26 Feb
 2026 23:51:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 23:51:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Topic: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Index:
 AQHcpZf4208n0sWyuUS9s4MYOirBG7WSiaIAgADVroCAAOfJgIAAlMIAgACEpICAABENAIAAONyA
Date: Thu, 26 Feb 2026 23:51:31 +0000
Message-ID: <20260226235117.xzljtnilcemg2mgc@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
 <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
 <20260226023935.ge3vlasodrrnhq6o@synopsys.com>
 <20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
 <20260226192645.aban6dcocehjq7ra@synopsys.com>
 <20260226212746.7a4b95a6@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260226212746.7a4b95a6@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB5641:EE_
x-ms-office365-filtering-correlation-id: 8b60c9d0-759d-419c-683b-08de7591f756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 iEJksJwR/g/TehKbWcf+71XX+1pKK/5KMCxGzP0OzAVCdnwuELJT3qk8zb5JNQRrJynwgerR6LYYKnKHbath9+kEXqXFgPVR1KGCWh8px4gVSbVxwZ3E6LKHbpxU68JyskC1klYGm4w9LRZQ44JDLulOz9YuM/9C1K4T+H3GJ7rKTdPuac/N/j99SX4moX664s85GaSobyaC81yhu7zUkEQWlj9y1+zGya4btKMi5sf87X2vj83rFIDwgKcpR4dSGO5VNNGVqPrrut8nrSKgVWzYUrTtOo8FjbsM2wO0N5xYeSo2PepXUNXqhmh+t9YxaqOj65ruoMnanWUvdMBuy9ld/nX8ZWXQW/15XNJMJIKeGw8y7mMSCtsxgt0GZyYrnPkEmHNEXpLMc0PiHHLLB5fSw/qbPyaZ4J3gYc15dJ/YxvKywWUsMeVeOWxLUdR6DA6jhbQruMhcwwPONc6Slzps4vC60xRetlkBmQ5FN7eSat7dFX3vGQUHtZZ2aUOqydQSiwshEKL/pASvHQSfCS/mr45f5ImaHHDJlV8ZN01aMVDKyUh5+4E7d4Hg0srhIK7sno5mdE7Pydzxpgph4lDgGB2l1OFeJWO4trqSdTLQFBV/Wu4JeaUxqcmrbWKurB+Awjc0mtYnDR1IkDF4RKXQ590BzGOlrZMsL0rKDXLh8vFNwIasNDKJIeQHcFyHNTAMNsyCG1j2HD1MAQrsFGjoNLnGFnpPRJK01wJ52WCN2cIKh+l6tNRNaDrjqsMdWT/b5r0vOzuTFP0zWYtWY6zNOdvBO3rc8qF2BvdAmjY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZURLbGF1TktkeTVpbHpyNTJzY2tVdmd1N1Z1WnRYZGl6L254cjFnR2JzNmNK?=
 =?utf-8?B?ZnNJRFQwRURxOEVqUURoMFNKWUdRZ29sVU5hNEZGVHgwcUVvUGJqbHZRZEJP?=
 =?utf-8?B?TkJUYW5HcVB4SEMyZXh4VSthRkhacUtQSTUyYUxPSy9lRjJhMzArWkVnQklX?=
 =?utf-8?B?SjlOSG1Kc0tZazhES0cvOHcxLzVwaEJJQVF4NkkxK0pJMXN2cmdRaHFhSjBR?=
 =?utf-8?B?dGVscHhNUWdEZFRJVDVxRUV4dHBRL2RmcndCV3pMaFk5SVIxWmVlZ1lqd1Ni?=
 =?utf-8?B?dlZFRjZzd0NtRk52amN3UVhHNFJBeklVSmRrdjNqMDhhdGZZejFGOURHc201?=
 =?utf-8?B?UzF3QVp0RVNQNy93WlpyTjVWaWJ0RkJRY0FTYWFnODl1TUJuamswOXgxYTFV?=
 =?utf-8?B?eFVEVEhaWGZjMXc3RDdnU2VoVllJZnRVTWFTeVllZ2J5NWpLNDlKZTZkdTdz?=
 =?utf-8?B?V21MQnF0Uno3SHdDbUlBaUF5QWorbmJnWVQwQjFTcFd2YjUwTko4cTlscnM4?=
 =?utf-8?B?endMSzk0TENDYjZvbzlOOVFmWHhmMS9zcmFqOEdXUXY1Vm5icXJEQXNSOU96?=
 =?utf-8?B?b3Z6d2Rtc3VrTlljOGVYZGdYVGFheE1GenA1Tzl4SU5KcnFuVVhOZTQyNzdO?=
 =?utf-8?B?eWN3WnNFbzhPTDBlL1d3cTdINWlPMkI2bnA2RWNrL3h3M2JiWkFiUk9pVStq?=
 =?utf-8?B?YWd3TDUwMERETlJWNmpWVk9SUXdHVUYvL2phZGQyUFJJNzZTQ3Fsb29mZUlH?=
 =?utf-8?B?dUhJSUxDSEZtSEhlaWtpamFzZ1dSY3ZHUUplVlV1aklQVlVjQmNvTUFBOHEw?=
 =?utf-8?B?YXNVZi9uUnMwdldSQTROQWtwdnc2cnNOV3VueDlKbFFlbjhsdmZkQnFSZEcv?=
 =?utf-8?B?dWxGbFJNNHMwVlNoSWdhVE5LMWgvejVRU09hY21SUGZnRUhaRzJuZGUrcXdF?=
 =?utf-8?B?OElnUXkvMmxuUjhiN1JIa1NZK1c2ODVKeFc2VVJWSTgrNk5PRG5JT2NPWSts?=
 =?utf-8?B?eWVXVFlGY1lxL0JGZEc0TmlKMm9oQlZYd1BxcUdCYVVlZDlWcnR2TDJHQUta?=
 =?utf-8?B?cDhjODVLOTYvbEtlV0FDc1BPMWJBWFM3V2tHbm5wVVdlQ25pMXovelo4SUtB?=
 =?utf-8?B?UzVFaDZOdFBWU1RCeUpBZDZ5NVdYV05CRkVXZUtROHdCNjIwei9EZ1pmbmpP?=
 =?utf-8?B?RDJubEQ3SzhqYmF4NmFTQkJ0Z1JpblU3OXpmckxLeGZLMC9TeWsyRit2VTRu?=
 =?utf-8?B?MVJGMUtRSkp5MGc4MGtCZmhwYzcwbjJ2ZGFQWVZGWmVPaTczMnJyemlTREYw?=
 =?utf-8?B?dmZBTWZ3RFNxWDEzbTdyUWJGeFdxclVqWm9MMjRmbFJGcVlKSEM2TUZyc1Nk?=
 =?utf-8?B?aEtSTHQ2WnZIMElOaHJZT0JWTU0vRURjV2M3UmtSNlBwT1JLSG1nd0s1Yks0?=
 =?utf-8?B?T3lFWldtdjlLUFpxU3VlQ1VoZVJNVFU4UTQvUm1pYmpydWMvTnh1R2hJUklS?=
 =?utf-8?B?bk5BZUUwalFBNEVLOHQrMk9jOU5aSHdqK0JTYUo5SmUyRkZKdWRmMGlFZE0x?=
 =?utf-8?B?S2pPS0hhM3RwKzlsVFdEQWw3eFgvWDByT3ZMMUYwMDcweUd0b0U0TUhJZ0tN?=
 =?utf-8?B?VUIvU0ZZci9qaFc1MFhUOFZHTS9TQnozRmlBR1AwdEZRaU1qZlVSdlFQMzhS?=
 =?utf-8?B?eVl3VkxIUUk2UThURnVZRG9FY2tnek56dkJtcm16aUl6dkxwTzFJV0dHSGJh?=
 =?utf-8?B?WkYyT295ZXNMUnNKT2laUlp3U1Ftd05LdFhoVnBPbWhxNUJsRy9XN0psbGhR?=
 =?utf-8?B?MHBZZGZsZXVTTkZURDhONXE1dFU2bzRlSExCOWVrTXRrS3lBMEZwSHRmMEw3?=
 =?utf-8?B?ODVUUXk2NGRERDVnWTBkQ0lvRlVhQVd2TEN6UXI2a1p1LyttZlBHdEhTMlBL?=
 =?utf-8?B?eVpwdE9KWWd1L2ZhUFlwNStwMndCYlAySllhTDdIbjVKVUZLYUFmT0dROXIv?=
 =?utf-8?B?dzV0Vi9oVEVlU0x5QWkxK2hWZkpRV0s0RFBwVVBmK1NsbzVKMmJSdDV6TllX?=
 =?utf-8?B?cE8ybk80N0RaZkNMdlhZeTR5MkdYNDE1OGl1dVVNWnhrcXpXVXpBWnFmTHJU?=
 =?utf-8?B?aUN5clp0YVVyUkpJdStDUjJJaGN0bnhBc1lSdkVvSVpuVUxsV2NUcDlOL093?=
 =?utf-8?B?TlRwSmozN3JMVTZJNURHM2lLMUloSmNJQ0pPSG1rcnhFUXhvSE51bGFJdzdk?=
 =?utf-8?B?d1Y4VzRnN3hlQnNRLzhxaVUwWWFESGVqSnVZeHd4MlQweHB0bDlSZTR6VUt2?=
 =?utf-8?B?R3psa0VVaklEdjNBYStsWGRSNWF6RTVST1l1S3ZBYjcvdzc1QmVKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD5A394455EB4D4E8DA02A9986D3B013@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lT0Vg8Ga3MrinHDcx7toJEbvD9KMN82qyozpTmhVx4+Tv3ucaTl4hR8J5yHQx/D3gOOSuOoGDyrPrijfFBs1e4EnINAWsf0YK4qewMEZe1uNifFERR6+gLDz6oUNqUthjgY/oGxNfzwSL/lLRQxrxekvNEwBiN5oGqRFZMMn+h4PUOQmsJuabLmNf0cqEyVTaNsWrCwRbQZ7U8lp6IBq49fuUmD4ESA+J1uAngEk4hWLZUuVsI7LkqNW12Q1xVkwq2TTxpz6QvSLSkbvmeLwBAU12ieaCTHS0/yPaHbFmEM6rtruRtu7z9nWqz+iSTZ6rOUm2Mdn1cXVklpokD+OANLr043bYaCZ/7mPDdm1INuha01/yYw/8jqvsPkzecPE9TlF0jF5bKJB9B0lcspGSADocbWTFIPdQTJSGPrJaCanpJribfByhEfAXFbuXqhmtCtOCxE+HQNfHb3HZRwQh9jf1tIta5kLNCmiqEZU/OqhABb1t/WD1cyUK5FzhygVXZ4QIaQQITDYcC/d4734tJUgJdrzZiv/ou7Brz6AejWWSpxDZL3IUgmEnmFooxQBNajj0io3Qusp4WcX/3KfVduRIqKFeQBbhnMk80Wh0O502DCabigOkz8umOEMGfxjMB5pUjaFPJZVuyt9BPc/mw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b60c9d0-759d-419c-683b-08de7591f756
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 23:51:31.3255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSuv709KbS3qxB3Vh5qo9S5FQPdb7hug+yeWWSKMpKVPYyTWZWrBYFhHfwOncfYqeUIWTzTp3dbKDD8U7vSBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5641
X-Authority-Analysis: v=2.4 cv=V75wEOni c=1 sm=1 tr=0 ts=69a0dc8e cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=6cANCfq-pMNqpqmEzoUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: FkeZgbp_4Dz4p9dW_Urqtxt4JBSdS3Mc
X-Proofpoint-ORIG-GUID: FkeZgbp_4Dz4p9dW_Urqtxt4JBSdS3Mc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIxOCBTYWx0ZWRfX+/fIAybPM4Ps
 DbuAIvek52W1JRFBw0hz2AIAcegFzvmsgJBoPo1mIIThEUzHKddomAjUvMInkeNdyhoq+2prC6C
 hVnEFF00ldIN5yaVl3baR2clYLCTE/91Khyxo+JJS4TwMtHCpc0EGO9yXjipxVAOnjHITwoSthi
 z/RB/vgb2j3iYWik3S9fCvfGv0Xf3RAashdKeXz7V2I+UnxJi717YhoCFgYT3t1Pk3vKyEe/c+r
 dSxwZmtEyC4dcM6ECbWBqy1HTtNBpSEETSZCjnVovA5M+VXsJ1xYpseqO2ker0QmXZghVZXnUNZ
 PoCLMO8wiky7Ju+Dt0JF0QXhMEBKodD3SuTb9p/JcbfEl47yZxIw+ZTnsx8+/rZ/nq9Fiyziwt1
 VDlT0Ghb9g9Vj9HTZwWl5J61J9h28/ySyNwhVt3ZG3jxMc7jDNHY2LJ8jLOq4DtHPllYoDhXsMk
 0A2pPiUEORnKm7CQ3gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260218
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33764-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0CAFC1B10FD
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gSGVsbG8gVGhpbmgs
DQo+IA0KPiBUaGFuayB5b3UgZm9yIGJlaW5nIHBhdGllbnQhDQo+IA0KPiBJIHN0aWxsIGRvbid0
IHJlYWxseSB1bmRlcnN0YW5kLCBvciBtYXliZSB0aGVyZSBpcyBhIGdlbmVyYWwNCj4gbWlzdW5k
ZXJzdGFuZGluZy4NCj4gDQo+ID4gT24gVGh1LCBGZWIgMjYsIDIwMjYsIEluZ28gUm9obG9mZiB3
cm90ZToNCj4gPiA+IERvIHlvdSBtZWFuIHRvIHJlYWQgaW4gYSBkd2MzX3hsbnhfZHJpdmVyIHNw
ZWNpZmljIGRldmljZSB0cmVlIHByb3BlcnR5DQo+ID4gPiBhbmQgdGhlbiBwYXNzIHRoaXMgdmlh
IHNvZnR3YXJlIG5vZGUgdG8gdGhlIG1haW4gRFdDMyBkcml2ZXI/ICANCj4gPiANCj4gPiBOb3Qg
c29tZSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSwgYnV0IHRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3Ig
eW91cg0KPiA+IHNwZWNpZmljIHBsYXRmb3JtLg0KPiANCj4gSSBhbSBub3Qgc3VyZSB3aGF0ICJw
bGF0Zm9ybSIgbWVhbnMgaGVyZToNCg0KU29DIHBlcmlwaGVyYWxzIGFyZSBleHBvc2VkIHRvIExp
bnV4IGFzIHBsYXRmb3JtIGRldmljZXMgc3VjaCBhcw0KZHdjMy14aWxpbnguDQoNCj4gDQo+IE15
IHBsYXRmb3JtIGlzIGEgY3VzdG9tIG1hZGUgUENCIG15IGNvbXBhbnkgbWFudWZhY3R1cmVzLA0K
PiB3aGljaCBpcyBwYXJ0IG9mIGEgcHJvZHVjdCB3ZSBzZWxsLg0KPiANCj4gT24gdGhpcyBQQ0Ig
aXMgYSBYaWxpbnggVWx0cmFzY2FsZSsgWnlucU1QIGNoaXAgY29ubmVjdGVkIHRvDQo+IGEgTWlj
cm9jaGlwIFVTQjMzNDAgY2hpcCAoYW5kIG9mIGNvdXJzZSBtb3JlIG5vbiBVU0IgcmVsYXRlZCBj
aGlwcykuDQo+IA0KPiBUaGUgZHdjM194bG54X29mX21hdGNoW10gaW4gZHJpdmVycy91c2IvZHdj
My9kd2MzLXhpbGlueC5jIA0KPiBsaXN0cyBvbmx5IHRoZXNlIHR3byBkZXZpY2VzLCB3aGljaCBh
cmUgRlBHQXMgZnJvbSBYaWxpbnguDQo+IA0KPiANCj4gCXsNCj4gCQkuY29tcGF0aWJsZSA9ICJ4
bG54LHp5bnFtcC1kd2MzIiwNCj4gCQkuZGF0YSA9ICZkd2MzX3hsbnhfaW5pdF96eW5xbXAsDQo+
IAl9LA0KPiAJew0KPiAJCS5jb21wYXRpYmxlID0gInhsbngsdmVyc2FsLWR3YzMiLA0KPiAJCS5k
YXRhID0gJmR3YzNfeGxueF9pbml0X3ZlcnNhbCwNCj4gCX0NCj4gDQo+IFdlIHVzZSB0aGUgZmly
c3QgZW50cnkgInhsbngsenlucW1wLWR3YzMiLg0KPiANCj4gRG8geW91IG1lYW4gdGhlc2UgZW50
cmllcywgd2hlbiB5b3Ugc2F5ICJwbGF0Zm9ybSIgPw0KPiANCg0KWWVzLCBJIHdhcyByZWZlcnJp
bmcgdG8gdGhvc2UgYWJvdmUgc3VjaCBhcyAieGxueCx6eW5xbXAtZHdjMyIuDQoNCj4gDQo+IEkg
Y291bGQgYWRkIGENCj4gCXsNCj4gCQkuY29tcGF0aWJsZSA9ICJsYXV0ZXJiYWNoLHBvd2VyZGVi
dWctdjEtenlucW1wLWR3YzMiLA0KPiAJCS5kYXRhID0gJmR3YzNfeGxueF9pbml0X3p5bnFtcCwN
Cj4gCX0sDQo+IA0KPiBhbmQgdGhlbiB1c2UgdGhpcyAiY29tcGF0aWJsZSIgbWF0Y2ggdG8gcGFz
cyBhIHByb3BlcnR5DQo+IHRvIHRoZSBEV0MzIGRyaXZlciB0byBzZXQgdGhlIFhDVlJETFkgYml0
Lg0KDQpObywgZG9uJ3QgZG8gdGhhdC4NCg0KPiANCj4gQnV0IHRoaXMgcGFydGljdWxhciBlbnRy
eSB0aGVuIHJlZmVycyB0byBzb21lDQo+IGNvbXBsZXRlbHkgc3BlY2lmaWMgUENCIGZyb20gbXkg
Y29tcGFueSwgd2hpY2ggaXMgbm90IHB1YmxpY2x5DQo+IGF2YWlsYWJsZSAoZXhjZXB0IGFzIHBh
cnQgb2YgdGhlIHByb2R1Y3Qgd2Ugc2VsbCkuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgeW91
IG1lYW4gSSBzaG91bGQgYWRkIGFub3RoZXIgZW50cnkgdG8NCj4gZHdjM194bG54X29mX21hdGNo
W10gPw0KPiANCj4gU28gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRvIHdoaWNoICJjb21wYXRp
YmxlIiBzdHJpbmcgeW91IHJlZmVyIHRvLg0KPiANCg0KSSBzZWUuIFRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLiBJIHRoaW5rIEkgdW5kZXJzdGFuZCB5b3VyIHNldHVwDQpiZXR0ZXIgbm93Lg0K
DQpQZXJoYXBzIHdoYXQgeW91IGNhbiBkbyBpcyB0byBjaGVjayB0aGUgcGh5IGNvbXBhdGlibGUg
dG8gc2VlIGlmIGl0DQptYXRjaGVzIHlvdXIgVVNCMzM0MCBjaGlwLiBXaWxsIHNvbWV0aGluZyBs
aWtlIHRoaXMgd29yaz8NCg0KCXByaXZfZGF0YS0+dXNiM19waHkgPSBkZXZtX3BoeV9vcHRpb25h
bF9nZXQoZGV2LCAidXNiMy1waHkiKTsNCglpZiAoIUlTX0VSUihwcml2X2RhdGEtPnVzYjNfcGh5
KSkgew0KCQlwaHlfbm9kZSA9IHBoeS0+ZGV2Lm9mX25vZGU7DQoJCWlmIChwaHlfbm9kZSkgew0K
CQkJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKHBoeV9ub2RlLCAibWljcm9jaGlwLHVzYjMz
NDAiKSkNCgkJCQk8Y3JlYXRlIHNvZnR3YXJlIG5vZGUgdG8gcGFzcyBwcm9wZXJ0eT4NCgkJfQ0K
CX0gZWxzZSB7DQoJCXJldCA9IFBUUl9FUlIocHJpdl9kYXRhLT51c2IzX3BoeSk7DQoJCWRldl9l
cnJfcHJvYmUoZGV2LCByZXQsDQoJCQkgICAgICAiZmFpbGVkIHRvIGdldCBVU0IzIFBIWVxuIik7
DQoJCWdvdG8gZXJyOw0KCX0NCg0KQlIsDQpUaGluaA==

