Return-Path: <linux-usb+bounces-33486-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKRKGP2Ul2nO1QIAu9opvQ
	(envelope-from <linux-usb+bounces-33486-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 23:55:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D909D163665
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 23:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A869303A137
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 22:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBADE2F3C26;
	Thu, 19 Feb 2026 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L1tzD2i+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ln8Caj8B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jmMRuZQF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F332D0E7;
	Thu, 19 Feb 2026 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771541740; cv=fail; b=iL+JKlajSIbFyYdomOcLwFcN6fQ8jg50bM4fTmFHKVnmFPnm4VYKhcgLkmyBs62HZkOX12bdgRaJ2S37ewcrfGvoGMsq/Y5jzYvpIHUWHDNh0OY6Etxv270sTUUMUk8Cr7GEn3qUlYeDjeYzShlgKEDTQKiW46iyRWHEE580dWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771541740; c=relaxed/simple;
	bh=8G+KScPVy7w2k3eNMZoF8uGQFFEauMpSX6q0nKUhLdM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TEFOr41AZ+sbP7ApIOAxYfuAXOLhO3fUr/Ee7tj6XeBHnW9sMfqLYnumR2tkHOdvMz+1+qYLSq8Ti3GbhF+ggY+y2/+FgcidPR3w66jFdy16KfHN2zgB04XYX1r63lLdTjyOGw4PVZluzke5+t5f2Kd2WR7bznUor+40UPQcD4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L1tzD2i+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ln8Caj8B; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jmMRuZQF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JK0Ajn3140866;
	Thu, 19 Feb 2026 14:55:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8G+KScPVy7w2k3eNMZoF8uGQFFEauMpSX6q0nKUhLdM=; b=
	L1tzD2i+d4VB2XEI04BQDHDGx6JGHvxYWCVjg5BO4g+1634FtAX9dXNc3kiDzrSh
	m7ZQmxs8DX1ED3Tqs/X2huoBCDQsxit5mh9BZOCGJgJBuKZ4Ir+e/lTRoU1c4/Qj
	hxQziH6fj+V+sxopKmwwUtCddz6zn5IYY6UlU7++JkpFL5KgV6XUfmRqSTn/omId
	9VKaSKs3pHCVEav39y/N4II3XCgHWNZa0T21oYTpdgGYCf6stqdfhYAsqpZeroeP
	vkqNzX6vMtft567wMQQEMjDb9Yv3MWrjjfuuxZ+pfiPg/jUQ23oxIXlUR/RFnoCW
	KzB/t5OaEUjcM+KKS4eMOw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4ce0gp4v6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 14:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771541735; bh=8G+KScPVy7w2k3eNMZoF8uGQFFEauMpSX6q0nKUhLdM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ln8Caj8BxO8L7BucVP6DNhPx85T7Z9gH/uTyrL/d2xx0xotdWkCdD1uWH4zwuFVLs
	 NxvfrZXoy1cwu1DQ0NTEsyf2D0CyE+BjVMUwBRutPP02KA4v+7RylcH5/AhUwm/AdO
	 dI0p2AKqFOJ7m1Z/RMgzNcmH3+YQvjWRjC/7Fpybw9Q7uSrwS5rPMkjzQytB0+ttq2
	 gbrc9LrCiGaPP2c5XnRXwFvN+aFeLcif16FMpUWokzQvfvH52XJCpiOjTbO5fcctKV
	 d3gxOGSwb3H+PvpLigWvvhtLbzlgjXW3bUbwutjNkfD7Hg3yQlYjktGwuj9/xuS606
	 bcLmP8d9r2Trw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C683F402B2;
	Thu, 19 Feb 2026 22:55:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8E8BCA006B;
	Thu, 19 Feb 2026 22:55:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=jmMRuZQF;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00303.outbound.protection.outlook.com [40.93.1.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1C987405EC;
	Thu, 19 Feb 2026 22:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jk8crrzt5kHVAZhkVKBPf+un7JHuTWPaogf4tZ8uCG8r4spgR8RQsft8KXrn2OdQj/BO+cMH5XNTbzpsQFDVoCm0qOcZ4JsoilYrK8IMSK2/WjUjrCGd9LcyvVUF3LgCaefZXPxYLGKClPq/phEWwf7VNDuQ4RPGwfCNc/s5YatNsb59ZpBe/Jf5yfcRCBW5GBNzRoHD4GpkNZ7K2Ez51t98eDfB47EnEyHN2cha4guTki3Lspl1FMal0mAyjvx4fjZybvjry+sIaaYDP3LVwz2GFQzymCnEQ5tIAWfT1z6CUA66QWynuJ8a5cdqEEQ/rCIGZOG2Rt8k6+3pGm2rgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G+KScPVy7w2k3eNMZoF8uGQFFEauMpSX6q0nKUhLdM=;
 b=hBAaIm6OLzM3s9w9mczr2+nk4kAq6uVVeqW+bw5IULuVSuAaXLZHBORbM6da91UcGDF/Pd92rnLL1qgcBaSNoIsoL0epZ2Pt0NlHHDVo8Xw5YJqIHrztKjY2UaCzdaoHOrJWfftpxCE2jgIVU4nbudzkSzT4awq1F+/XPwZ0RynStWHrl5DGdEQc8M4rYRxgylrFXMxSag54eD9C+O3SzBpqhtA6QhPRiwfLyHgRDmuUZyInq13v4xgxumLjk7xorO9n1Q027oUUC0TBmYVsSEayY8WTvnqb/zMz9/HtcS0jWYnW+T66jsx+Uv8XoHjYI3rgKWdhhtPM0b90lhGd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G+KScPVy7w2k3eNMZoF8uGQFFEauMpSX6q0nKUhLdM=;
 b=jmMRuZQFOqf32jY2jgb5PICM+CZf0w6TaJA8h8nXnqH0AYc9pdnMB/gl/cLBAxcjnyLa80nXHoliNnjOJnnqpPGCasm/6ZIYlHJ+KX+VCYm43+cjnDZEa4pOrD6gwa44C1q86RhUiiqC/0ZGIWAKf/SXXOYNsv96Oyj864LP22g=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 22:55:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:55:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Topic: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Index: AQHcoMX/Agr/25klTke/2w2+ee9zjrWKpCIA
Date: Thu, 19 Feb 2026 22:55:29 +0000
Message-ID: <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>
References: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4084:EE_
x-ms-office365-filtering-correlation-id: 1ff31076-9b6c-4e05-2198-08de7009fa94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHlHZzZkaHMyY2JWQ3dUOW1YRldGaTlpMVRRcit1aEhWc01SZEpWWlpkTzRo?=
 =?utf-8?B?NUhlOUdMcjFSUTRNcTNKM240ejU5eHBJWUI3ckNjaStFZ0RQVk94MjNzWnZk?=
 =?utf-8?B?aGJHelYrc3E3Wjl6cFBHSVp6SjNzTDZDZGhzZlc4MWdRbkRocFRhQmlIMDdm?=
 =?utf-8?B?NVAwaFUwNmJRRW85dG1iWmczc1ZFSld4NVBhZXZDbmJtdTlQb0IxNHNFcGJJ?=
 =?utf-8?B?b2x0YWc5MWhobkdPTVdpT2luNVlRWUdLd1R1eWwybUs5OTdHeVZiejAxUjd5?=
 =?utf-8?B?YmVraTVnNkVRYzhMQnlmWmp2YndrbTBrNUF5aHZiS0ZmV0F5SGJtUGZxdmdC?=
 =?utf-8?B?aWhvTmpGOFErL1c3OWNJcHdFamdOYjZ5VDM3ejZDeWVDdy9hUXlrT3ZiSThS?=
 =?utf-8?B?OXg3WXB6Q3hNR2NmaEpva1ZYN1c1a0RUYmRXOGhWaTh2d1JxNzRkaDRrdzdV?=
 =?utf-8?B?ZlowVmQxU29QempNQ2I3L095eThIaGF2cTk0S3NsWlJ3aC8vazBjc1lQUW9Z?=
 =?utf-8?B?QXNWTVdCd25KNTNpbHZWOUpZOW5EMk5PVTR6SENMVXNoRTF0VXRuWEdRMlRi?=
 =?utf-8?B?ZVpOcjNRNVNpdmd6ZFlBbjJCTVUxTWc2aHd5SnBPclpCV3NuRkpGaW5HMUEr?=
 =?utf-8?B?MmNpOENxMXBHZ1hjMEhMcm1Ud1VRd1Y5VXluZ2s2RnFJcDMxMmVKRXY2aWps?=
 =?utf-8?B?bkRhYzFPQVpRRGFhdnFFZTBBdTdhM0ttZG9USk5ob3JBcjhsbTR0Uk01ZVNB?=
 =?utf-8?B?Q0FuSHA1WlZtcnBQb2FsL1BKNHBBaEx6UlFhMGk2djlCeFdoNFdyeXlWdkdF?=
 =?utf-8?B?Z2dQQVIzYVMzZFY1YWFPWmVRcEhQV1N5aS9WdCt5eE94MzJpNE9qMkQwb2dP?=
 =?utf-8?B?L3lUWWFVQkF4eFovMnI5SUJxNDQraWd1bEdiTmZXNGtpSVdzOXB3SWVTdFRL?=
 =?utf-8?B?cDg5NlJQdVpEQWYzRGRoeDcvUWpkajcvUmNvNWJvWEVPODZlcDdrek1zWXYz?=
 =?utf-8?B?MkNSVGhybDUwcDh5d1NnM0RnWTdCNXI2L1dMczErSm44L0d0WHE0VXNWcjJj?=
 =?utf-8?B?blpQVzM1bzFIcTlLcUdBLzl4czhYQU1YUytiUmtFazBjMGNZSG9WZCs0Ri9H?=
 =?utf-8?B?U1dwQjRhQVNBU1dJRHJBNk5rSU9yWFRKSTdncGZLQ3JhVWptU01nR0lqTTYy?=
 =?utf-8?B?YnBsQ3FVZmZLVlRTQVdmQjJPR2hrQVVNaGN0S0g0dVM3Y1QyL1RmNlRHVDVS?=
 =?utf-8?B?bENLRktoY3pSY2VUZ2V6Ui91YkwycFQ3WXRWcUcyTHc0dUQraTIrdjZibThN?=
 =?utf-8?B?aUFlSjUydjNadHowVjM1QUhFZ1RnV3ZhMFBjWHpNRTQ0eFNwNlJpMmtNVjFW?=
 =?utf-8?B?enZMRC8zdUZXTXR5ZVh0cWV1MGlpZGxWYUJnQzBSTmE4eDc1VkJ0T1FxZWpk?=
 =?utf-8?B?dmljNk1TOEo1RCt4MTE2UnQrUW5CSmtnY0JiaXRCOWp6R0RFTkdnVWIxdG5O?=
 =?utf-8?B?QVIrbS9XUWpOa0tjUmZrcXA3d0F6d296UXVGTHBhRmRnczdYa00yKzJLNVhU?=
 =?utf-8?B?V1ZLZEpFWkgyUkJ0WHptYlNBVk84eUR2UnBZQVpvOVZJS1NDSnkza2VVOGE0?=
 =?utf-8?B?OHlyWlI2Q3BvY3BNOXpoWGlFeW5rbVVUL0lGZnFNNHNXMWpGZ0IxTnFxMHBr?=
 =?utf-8?B?VW1DOGNHbHpuaGxlZVFMWnkwWDNtbmU0WXl3ZG1EcnRyVlpnM0RGTjBJMlBO?=
 =?utf-8?B?NXZBQnNCRHJEemorZy9EZCt4WWRObEo5bEEzdUxxYVk1dXIrTDJGUHhEVXYv?=
 =?utf-8?B?a3FZWEh3WGQ4K0ZUazZWVTI5WHczbGdUd0RzRFlOTHUvK2IvYUErWDNMNTFu?=
 =?utf-8?B?ZTVSTHY3ZnYrNHF0SkROVCtJcnd3NzFHdTR3VDRaOGxkVXlId2EvV0pHRVc0?=
 =?utf-8?B?K25nclNjY0x6MUVHS3RIMklzS3ZCUmhucEhTUjJkUWt4SHpiUElRUTdzd0xS?=
 =?utf-8?B?Nmx0VFNWWGdoQmxxcGdxQjBiUlBTckRiRWc0SUFkOHBEcHczQmkxTi9RcFo0?=
 =?utf-8?B?bUNVZWo4bWNINXkzVFZmUUdua3dZN3Q0ZTIveGEwNUhpcmtiV1kvcXRWcTlZ?=
 =?utf-8?B?bHpXUXc0R0RJR3o2Mm52SUJLb0E1QWRuMTJqbWs3eVFkRU9XTHJYZTRuc3ZQ?=
 =?utf-8?Q?iCHehPkduSs8SR+BRoS5zM0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTV6NmZxUHpTNTFtVG9WdVNwUXM1dHZCYnlxcFRpZTVLT3BWbmsxdG9LdCtZ?=
 =?utf-8?B?NDltVmI1M2xIaVNRVXVVU0IvbjFaR0pKdi9XZnRBU3dqcVFvYUkyMnp5ZjNm?=
 =?utf-8?B?bFp2enJ6MkVmKysvMG42dmFFSng3Yzh0NCt2ckxqbmwzTEdBMkRwdDNhRVdu?=
 =?utf-8?B?aVNOTnRUMXlRUFAzYjQ4OThidW9UemRNbVVhUHlScllDVzdTTDFVYzd1TUsy?=
 =?utf-8?B?a0xycFI4QkJMeWlaNlJSZkxHTUxiSlJQMkJoazJhMk9OTlR2UHZMU1UrQmNS?=
 =?utf-8?B?aElkTjQxS2dHZDJsR3VLVWhZY3VCRXFvWWRBR2NBb0ZoNmtKcnkyV0hpUCtm?=
 =?utf-8?B?NFd2RU1mSmREbk5EQ283OVlzN1I5VFhjLzg4M3I1aXYybFN5eUhUNmU0V2Vj?=
 =?utf-8?B?aHRPL1FDSVE2ZG5PM1dMVmd0eUkvSEQ4OStuOFJKeHBNR3UxVGYxNWw2bUpC?=
 =?utf-8?B?cG1QVVVCMEovZ1lKWWdjTFp2MTAwdDdoRk1KcVVNVzJhV21TRzFzc1JNYnVp?=
 =?utf-8?B?cUtwa2lFZm5qY2l6NllHUkl1RUdwelArZm9YOWFnckZzYm1KSHdVVWVkWHlw?=
 =?utf-8?B?YjdXTlo1aitWMTJ4Z1o3K0FwWExhM3ZyVjlSR3RUbXFlVlpPL0xZb0FLaXpZ?=
 =?utf-8?B?cFRqSUwybTBPS1o5VU56enRWR3U5M1ZmV21ScllHV2poa2tZaWZtemVUQUdJ?=
 =?utf-8?B?a1JjaDgrWVpzeHJlaS9vNUsxNHQydmY3NjhmTDhvOXF3djkra3Q4eE4wemhU?=
 =?utf-8?B?V3EyWHVCRmg4Z0FJWW5PTDFFUmZYcGhoZ1FvanJ5Z3krbDhFVHZSSnhMTGtz?=
 =?utf-8?B?MUZ2YzAwd1pnbk4yanVPNHV6SkhYbFBHV2pVeXpxMUR4R1Qwb3ZVZTBVUnFj?=
 =?utf-8?B?QkNpNmVHSnpHam5HK3NBNS9mSkoxQXBIUTA4YmRONDRpWVhDMkJSbkVlaHBq?=
 =?utf-8?B?SDljQzJ4cjlpRk85S1ZrQmROc1dNUGRiT0VIdGwrUGcvajBhRTRwY0lBdlZD?=
 =?utf-8?B?UFdZdUhzbDJVZmttamlWSEkyUFFValU2aXR4aktmSysxbEhpamdDdkFRL3dF?=
 =?utf-8?B?QXhnd3RCbHB2S293dW9LalhXOHBqUkM3SEtoTVQ1VjBFVCtvQ252dmIyS2FP?=
 =?utf-8?B?eTVManFPQlI4cXp5NmxhelJ0OGZkQW1XZVVGVjdKK2NjNm1FZ0tjNTdSMzFv?=
 =?utf-8?B?eUVoWWhZRDZyY25BMEdsRVk1dFB3QjNmRVB3eXNkaGVXNVBqNWxJZ1A3akpV?=
 =?utf-8?B?TUJTMnB3TmVTSjM5R3FpWG15SmgzOGIrRFVTei9NWmwvQTI4T3E5cXgvdEhB?=
 =?utf-8?B?QncyYnlQek9Sb0dqNGgxMUlkOG9ra0g4ZGl0WFNFZmFKdDNraUJWZUlHRGdL?=
 =?utf-8?B?dzZaTTB1b00vQmRZQmkzZzJIUVNvaURoQ3p3TG5WRG03SFNmTzlxblhVYlkr?=
 =?utf-8?B?TTNQMDkrNEtId0p3N3FSTW5pRWZNbmg0Y09WWTZiVzVleUZiSk9ZU3pSTlhC?=
 =?utf-8?B?VDU1Vlo4WWlTQnJXQjB1Ulg2djUvWjM4UUt1c1psK0l5bU1KcjZoN2Y1YTlW?=
 =?utf-8?B?YlpnTEQrcXV1cEg1QmhNVWRMOUZJNk1xaVRzL2o2OVVSbTdWQ0VsVzFuRDNB?=
 =?utf-8?B?ZUdpRk1jdUt6VmQvTlBlNUE2L2NoR0lxVldKUWRFbmF6ZENUYURzalNUUHp2?=
 =?utf-8?B?QngzZXBxZ2JIVFowR21CUDIzSjRVZlZEb0NFRktNMnJSY0VuM0NwdWN3bFA5?=
 =?utf-8?B?VmMwTVZDQTNjWWxJaXE1QmNZR1NpNmZ4WXJqSUtFYnlsNzdTMWlQRCtkcmpl?=
 =?utf-8?B?YmEwMWNKSzExNFhQRkY1N2RvTDU0NUhZWUxpcFJPV0l1RGE0M25EelBmRzN2?=
 =?utf-8?B?WS85VlVLYkJSOVprbFFWSmYzd1RZSm5QLzFjVUdDcFVsczF1cFVncHVLcnJw?=
 =?utf-8?B?N1pRQ3FESUNoRGlQbUU2L01ESmVrV3NmZXBmS05Oa01nQ3ZLOUY5Z1hkcGNX?=
 =?utf-8?B?OVFmT1VDTzVjL3JUb0ptZ2MyR0hHVldzTDFrNGhXby96eHRjSWpKUHlzT3Vy?=
 =?utf-8?B?M1ZwdjVBNU51MEpKelJLZll4SkpOZ0QzQWM5ajlXSG56Tnp0cnhBL1VMZFJ3?=
 =?utf-8?B?ZENqY2xiVVljUUtQbnZZanBnSjBwTjlRNHMrSkF4QjVmMFhkTmphRlhxQ2hB?=
 =?utf-8?B?YnA2WnhETzdJMDd0WUQwSjkxTGV0MFFUcHhNemdvQTVKQ1c4c0lUU05MZGsw?=
 =?utf-8?B?MFl6K2tKbUd3MmpzYmdhSXB2WEZqT0VyTHhrbStXK1h2VWhwZllxTG9yTWEw?=
 =?utf-8?B?R1cyb0dyS0l2c05udGJIREM1TVhodld1S0dUTmJXODU5RWlFYnltUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A8F3D16B457914F9EF035BF357BC255@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8e9JzZB3RqVyn/gHLxTjZ62+5kwnqZCY3gxl0cWeyeIfPb9WdCBeGz/qkd3nhxB4y8jbeOvgvtEMSMArT6s/J5YmaNMTlCwDVwYuvmuKt3+Ew73qcysEKzmAkTo4zGigzgwZzlDwAZ8VGN4+4OyZSms66133RZ7JkwGi6NXE7mPLMT9hHau8SrH5UXkGtUtndeNzlM91haFGNrM4YGj+f9AoSQnGxIa2didye+BF+zWiNgh7bx2EFJMl2xqNQFzOa6xvAtLxqQ0XcnQii29FFfUokSIJn5GJzahR935QEfMA9YhNw6ElXqclosOZ2XDM2RN+iHORK1i9PhlHMmyxjuLRtsD66ZbZMlSHYnOfJk7lIUeyU4wxVYZNMQVhgXpQi1wtSUqgGd1XUc7Db+GYJenq5NXTdZCxY/QjvlKSEDLLuP9vBSDUuDuoJ/5sJGqqAIf+Tin2fMnGO7wBtAvgNIxG25FiWRjLkvNwD69q8MgsEAECc7kRtsSM2ZvbjV+oG5VMtEvSG+fMcHYIGw7DmYMGFzDH5Mo5wnqMQxsaqtf0sMGapIpM9hN22e8WNo76ItbVUbW2MBK/g6GiiMypIHN/YmLsLVUVn+htk2OP7m7J4OyTPaJjYb+O+2qiP+ZfkxXBPSdmVOL1IGVBXr92MA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff31076-9b6c-4e05-2198-08de7009fa94
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 22:55:29.3767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iRH9HPm7pQnjGZQchywY9WSm6NEJZH6PXyxE7+6gyLk3Jzs8BBi3YGP/s/p5uECwNfk9nxESWJy04Ij3hvA/1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDIwNyBTYWx0ZWRfX5yORzFdhHqU9
 DEjH+FJq4q3396vy5OxI5+f7rQGw7ppv/PUpkusnoMS01M1A0XFsW5yaj4w400rcxomRfaIMgdb
 sk+5r4Ip/qZU5Cb1y8SPcDFAQSuVDfJ2f2RE/Z+6wBJVih4Kxggdpin9+xk9GMpHklZcwa9KYau
 9LvUsvx7tgu2a8X5Z4QfQcTNTarymbVrZkUCJ0aIwJEnC/FkQKeCw3V3+uTbaSdLEdHQ0D9n2PL
 odm7tbEemLzWyVbjDg1UCfeoWXlp85nXyLC7SE+P/jMNX2eiBO2BVNs6eDUhzs33XV7LP71pAZ7
 TjEKrISQI7hyeUd6eEoKv6rKK1osknaDgsatChqwh5GZASeFFPN6eBj2QUuM7zhkHwOdf1rZzBl
 4GYkBHFJBrAmbXoGElivpZ/ndyK0pofP3KmxesSWb9wa71i3q8fP9+pZZJg9fXNXk4bDiYRKNsx
 4yEyBXIoS4TqZJCbvDg==
X-Proofpoint-ORIG-GUID: s6Znrl_6pqqMYdIkZWJS6zv7EpmIZeBt
X-Authority-Analysis: v=2.4 cv=L6oQguT8 c=1 sm=1 tr=0 ts=699794e8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=wJsTCoZx-lLAaHN8n3UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: s6Znrl_6pqqMYdIkZWJS6zv7EpmIZeBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602190207
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33486-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D909D163665
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMTgsIDIwMjYsIFplZXNoYW4gQWhtYWQgd3JvdGU6DQo+IFRoZSBwbGF0Zm9y
bV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbCgpIGZ1bmN0aW9uIHJldHVybnMgYSBub24temVybw0K
PiBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWls
dXJlLiBJdA0KPiBuZXZlciByZXR1cm5zIHplcm8uDQo+IA0KPiBUaGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiBjaGVja3MgZm9yIGEgcmV0dXJuIHZhbHVlIGxlc3MgdGhhbiBvcg0KPiBlcXVhbCB0
byB6ZXJvLiBTaW5jZSB6ZXJvIGlzIG5vdCBhIHZhbGlkIHJldHVybiB2YWx1ZSwgc2ltcGxpZnkN
Cj4gdGhlIGNoZWNrIHRvIG9ubHkgbG9vayBmb3IgbmVnYXRpdmUgZXJyb3IgY29kZXMuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBaZWVzaGFuIEFobWFkIDx6ZWVzaGFuYWhtYWQwMjIwMTlAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLWxlZ2FjeS5jIHwgNCAr
Ky0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLWxlZ2FjeS5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20tbGVnYWN5LmMNCj4gaW5kZXggZDNmYWQwZmNmZGFj
Li4zNGM1NzgzMDk4MDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29t
LWxlZ2FjeS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLWxlZ2FjeS5jDQo+
IEBAIC02MjAsMTQgKzYyMCwxNCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9maW5kX251bV9wb3J0
cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWludCBpcnE7DQo+ICANCj4gIAlp
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbChwZGV2LCAiZHBfaHNfcGh5XzEi
KTsNCj4gLQlpZiAoaXJxIDw9IDApDQo+ICsJaWYgKGlycSA8IDApDQo+ICAJCXJldHVybiAxOw0K
PiAgDQo+ICAJZm9yIChwb3J0X251bSA9IDI7IHBvcnRfbnVtIDw9IERXQzNfUUNPTV9NQVhfUE9S
VFM7IHBvcnRfbnVtKyspIHsNCj4gIAkJc3ByaW50ZihpcnFfbmFtZSwgImRwX2hzX3BoeV8lZCIs
IHBvcnRfbnVtKTsNCj4gIA0KPiAgCQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRp
b25hbChwZGV2LCBpcnFfbmFtZSk7DQo+IC0JCWlmIChpcnEgPD0gMCkNCj4gKwkJaWYgKGlycSA8
IDApDQo+ICAJCQlyZXR1cm4gcG9ydF9udW0gLSAxOw0KPiAgCX0NCj4gIA0KPiAtLSANCj4gMi40
My4wDQo+IA0KDQpTaW5jZSB0aGlzIGlzIG5vdCBhIGZpeCwgSSBwcmVmZXIgbmV3IGRldmVsb3Bt
ZW50IHRvIGJlIG9uIHRoZSBkd2MzLXFjb20NCmFuZCBub3QgdGhlIGR3YzMtcWNvbS1sZWdhY3kg
Z2x1ZS4NCg0KVGhhbmtzLA0KVGhpbmg=

