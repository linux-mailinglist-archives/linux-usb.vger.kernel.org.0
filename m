Return-Path: <linux-usb+bounces-9734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952D8B14C6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 22:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46FE8B28373
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 20:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCB6156961;
	Wed, 24 Apr 2024 20:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="TWtaE1qk";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="TEK+fyt2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70D156672
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713991185; cv=fail; b=uNIuoQbqO9QljEzH1Kt/z40E1Kq/mCTQctpCj1Jvwa7j5xFCMr2/q3OUqS171uoZNCDkY6WuAdrCjHajqGFfdLqya2hqQp5XNr1A+Vgzg5//kOsZOR8fMnXBfNrluxUHqPrXWj23/KkCEUyW1zY4Qi2hEI6VficjJCO5MFr5xd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713991185; c=relaxed/simple;
	bh=y+1iq3AU6B73T9+Bg3+28XigtAZQFlRqKmsd1+fK4u8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ELfaJWMsSvi9xcKHeCPD8zZCXzo9bleDstsF3Gg2hrk2zEFZTVUvfje/AX5iV2twl00aa7hmdfQive37J0IBPy0GMi05MH8INJPV4qxYcIw6X25d+Knm65ibcaKKttQK3UnC/F4XmSi00GHSTZigqHVwttFaorwznbfG2PFToPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=TWtaE1qk; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=TEK+fyt2; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OBIVGP016790;
	Wed, 24 Apr 2024 13:39:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=y+1iq3AU6B73T9+Bg3+28XigtAZQFlRqKmsd1+fK4u8=; b=T
	WtaE1qksusTXRZartb/ucUKtOaaikwz1eGpxGItMGPFHyys6wrMERyN1FUMW9xUB
	AIoSzpj73A0lqTbB4ogAlR1pJTGp2WGthhLoPMOtvwo2ruvCowUd7zjNWWClSRbq
	avL7JGyJhxqHy7t6K/eSuktvqLLWGuGvM/VlFb/v94WwfdFLhRffW72PlhpqE0ag
	l2qMDOiEdU3Ak/Vex6d1F2icSlJCUE1ogleOsJwHOeenT3dIXPq3fal2zwdfjC4w
	4ZLftbi1pjgQBOpqokZfLYQ8nhOy327D89e/JkXx8wZB+g92kJeg6QeMhmqcWEMD
	L7seVpZ50ML1Ah6dVQvEA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xmadvk8sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 13:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuswhV3Xe5YS9TJFA4IiczRwkd9JJbMrcwUFaf1ZAJg+fZXgeY6imCqDdxjv9HFhAPpKfk0aISkGsayfGQp9Pzz22zSO6qdNVs8gu8w9SVPI18AWfw4NM6KMut5QLdnLmozVb2P8y7Ymenz6sVjh7e1g/Nshvon0f7XNRwKPXHfo81uGZsBKIJVYVcCvcnyIx8IHQLR8BR0PWhyFXi+kzKr+kFQMNHVtleRlQ3n8nBGH/f/5jk/A2Sr+Hi/q+MC1cChA0lFmtqr61NnHclK6SqGhK4M0D9AxHcWktXnkfFfJlzzPs4RYvdELEgeq2Ut8issAWdWTW+GTPHa2b7j5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+1iq3AU6B73T9+Bg3+28XigtAZQFlRqKmsd1+fK4u8=;
 b=ApUl/HEknn36r2fhv5t235B12a80ypKkWY9KJ+nzMcurXPxHDyWRUiLmoZ3D1ZDbE7lVL76gggrZLExHlWdwQZI5J3yW1AB0iYd9NOZmlwiMuWGtpFj3q/CstcKJTarT06m9pJIq94FC1dEhN1hTptyncru53tFeKLvd6U9h7qhouDDu/doB2Rlu2H6mt8yp4wGx4Pn6UfzccmX+Na4QSIYyQ3wP/2nHcwoTsqsqSyG16R/1YHbVKbwLV1vv8IaUq30RGqplUkbi7vSv8OFd6LVYeZM/3Va49bDUPvYI3WxLUXFN5uRNPQExDqa9sIn4cTASDry8pKgoB+dKNn9TnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+1iq3AU6B73T9+Bg3+28XigtAZQFlRqKmsd1+fK4u8=;
 b=TEK+fyt2nboU7INH6e77slkQOlmNFVFHgX1q8b1QF/ENWhuvI6uYOq8NIosYYU44DJRiAdWJVS6K0yjJBI9QHtwIL5VougqVMI7OI0mR1Uy0JW6rQtUcG1Zq+sQgJsXuSzfQAHE7g1OBRcoLadpFUbrwgagACuLRECf9SxjbstOMyEweIEZa34Yql88VbYflQvKF4iXseBvQCLdZabcqGVCgNKEa3y+Ya2ufmgD/+iJ4TUabq0e/4JYWPffP2pBS2UlHJ4JZghNH1m9eGN4UeC1TW0drWlkwUBwBRLxDLVWhaa9KTUDOGMh62NqwbV6HSzqaNx/9QNH/1ou35yUBMA==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by PH0PR17MB4685.namprd17.prod.outlook.com (2603:10b6:510:83::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Wed, 24 Apr
 2024 20:39:37 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 20:39:36 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Topic: [PATCH v2] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Index: AQHakdAF2mrm4jxc0ECnggSkCs40SbFyiQAAgAVN9Ck=
Date: Wed, 24 Apr 2024 20:39:36 +0000
Message-ID: 
 <CO1PR17MB54195AFDA60BED290BFE9F46E1102@CO1PR17MB5419.namprd17.prod.outlook.com>
References: 
 <CO1PR17MB54198D086B61F7392FA9075FE10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024042153-timing-sassy-eab9@gregkh>
In-Reply-To: <2024042153-timing-sassy-eab9@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|PH0PR17MB4685:EE_
x-ms-office365-filtering-correlation-id: 8bdd01e5-ff9e-4586-db8c-08dc649ea7e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?KepEvvACMF7MznL3738WYKTEA6fQwoT4pGzpmAJdNm5GdKQ3BlxuBc4ChL?=
 =?iso-8859-1?Q?0vlLVXzWs/0Y4ihQz6BsG9UBrTbhb1aod3Hmpj+QCZfUwJrTM+/+Y5DGTw?=
 =?iso-8859-1?Q?ns9ZpmcgKqY/7qUe2Hnl+1yrb0jN/8Q5HhJ7AIF+BBgmsSn6z11352ATg/?=
 =?iso-8859-1?Q?FnUzbKO2/OzWOl2SVCSTFsN86M22hg1SSVWsvEeFQoOuHPTj9Ui+7DsTOW?=
 =?iso-8859-1?Q?H4JbwkIDyJJOZTr1YOBA4c0G1/cGyBXL7N7+dpv3TrY9cic4CWOTIN5ggs?=
 =?iso-8859-1?Q?rQ8uynEnVmYHqiR9H6slJZpVlUFNrlNXcUjg5Q38Rt859M8oleeGOPYn5w?=
 =?iso-8859-1?Q?XxkKXR9qLFck7aq70tr5Qk+DsEECdfc4A9vhY8RGz7WjGt7MahzPfPYHFz?=
 =?iso-8859-1?Q?0rpdnz8ldPQfBl7jzsvOfNNRjbE2LzNeHeIG9e9/6/eqqqu7zD8zPiGEdB?=
 =?iso-8859-1?Q?E8krsIRh/yynrNL2HfNKUsv67boqstQE5Piee97ZRefJ/31IN4GAahwP6g?=
 =?iso-8859-1?Q?UgePIveP3cRSMtNbqyXCyxjxZWkoPhiBMIJ7JzG6ZXvVNEWacgPSRVchLb?=
 =?iso-8859-1?Q?ItBlhwyVmZ2OomKeeasY8EiHSq8yy6rXoJjm5FL2jzq4y3d66AsgvTh8uN?=
 =?iso-8859-1?Q?kc98Y2Ajpf1nOfQMLvM/prPRqop46Xqzp1rvvYVjNFcEkzgcE0b2/RjCp7?=
 =?iso-8859-1?Q?6srnodnUMum3/4e3voF1gjlRSg0BmVs4jz5KyF5kbUUDwTXUj+ynrxAQSg?=
 =?iso-8859-1?Q?FRJx2mK4HqtqcJJ5HfAWHkqExLENfMwKDw5FORNE8OAzlQLF9NmrTLQAne?=
 =?iso-8859-1?Q?S7IL+gz4bttdjpglhxrbsCqYNw1JLUCdn3NGqKts4daR6BW3xtL1rR/M7S?=
 =?iso-8859-1?Q?3y15he21h3RbM01wVY2Quz9c1BooCYaHfv+NbvGQiFvFGslR+xr2tUV8HH?=
 =?iso-8859-1?Q?6LsbG/bDLMQhujrTqrJL9Y0sxW6L8g08r8BzMtWfuMDa+sHunrQWQW6qcj?=
 =?iso-8859-1?Q?dzMB5Bw6AfoF2Jz+DVk7g00A8Xx9KZcE1bxzkQ6eLitM0WLxDB2zRvEovH?=
 =?iso-8859-1?Q?d+Uq6R75oAmP+U2/+8veEv2snk+lIFi26ytAAT2C1HdnVjN7qBHOEm66Uj?=
 =?iso-8859-1?Q?bcqN29Tzl5vH8fUagQfAO88EFS412O7sFQQtJ/bOTG696X8QtFzUIbrz7U?=
 =?iso-8859-1?Q?GBvAgzwNUxapgQDmJR+QdHmTfPC/7srRmoMFo0XzMJa/OscoBWYpWfFFuS?=
 =?iso-8859-1?Q?QqKvfUhF6pd4hq6Ql8QRlrlT5WCPI0RWY20zIRJIxY32LxFqF2Z3iB0zTU?=
 =?iso-8859-1?Q?Y9bNuYmkTDbGXYsEDsnUaZxGhcrL+ROKSAvcx87Sm++jzxPvnL1zUf+m3A?=
 =?iso-8859-1?Q?xo5pt0zFDbOTH4zKrsWJaHdFxGVBEzXw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kWZ5yYUj3HhFepT9Oq/KYVlw5AefGiHjyQ8osPQQi2zs8i05mxpKsW6r87?=
 =?iso-8859-1?Q?nQwiNNTRuLlmd4i860FLhLKWEGdxloxRsEjvMV7/g8/hvILjeiF7GwtEgj?=
 =?iso-8859-1?Q?olmpdQ6b1dTDcMShiND/Y49p29KZkTjA9MzsGiPwXbjz4isjeL5x2A1cMI?=
 =?iso-8859-1?Q?q4C6kKu78bIePcdYLBvBJZ2w0JMonh0uBYUCjbMDsI7OG3M9Pain/C2QBN?=
 =?iso-8859-1?Q?D5p9bXptClKZJ7rq6n4rr7D1Pl16Shfkq63joqV5DlkI83jywQnLh5PLuR?=
 =?iso-8859-1?Q?qewnlkGrL9ATnx4x8tLAiUZ/FvHl2FOrKqa+lYxpSblFaBefqg9EAdhHjQ?=
 =?iso-8859-1?Q?7KAafW+sh4swS0KzMIGrRCjEh+21+GHaGTDiRHkXJ7+lcp6SE0UPv9byId?=
 =?iso-8859-1?Q?wDpMj3FKXGi6v7kyWGFC/LT6vwGZteUNfGeaESG7GjQVV8doknEUe29bki?=
 =?iso-8859-1?Q?sdTBKhb6hnEnXzada4Gn1qf8lI3sW0yirvvKjsstH2OH+RAieYaVYPuqIH?=
 =?iso-8859-1?Q?iup4vZ4+hjKFbkZ756FlPWxL68ZoaIm1TmB3SJG7AVLatDEEi3cTJSs1Q4?=
 =?iso-8859-1?Q?VhAMgzTqUC7Es5dlDJOlySaJvOBSIunSvGQThjj7yGuaKPIT35z7YrZYQI?=
 =?iso-8859-1?Q?VEvd+5jwPcdU+pliJddQuNwiZRR8yQmhh6JTXPYESd45L6IEqhkP9HnJKx?=
 =?iso-8859-1?Q?VVXdh5DQ5S0swZL0LJP0K9Kvu2GQVUhP2doZCxqKVnF6K5SMjrVmkg/SSg?=
 =?iso-8859-1?Q?iPaVQV/C7mdXYNEgZlYNhFx630thUBBnyO7orFHDH96YQ7WHzoBlwh679G?=
 =?iso-8859-1?Q?50Nz3X2RN7HAPJXkbOkySbb23NUMcR3mxZifc9YaAFesRCga+TOkFx0Ckm?=
 =?iso-8859-1?Q?l9eX9+lhRtR2bq5NPjji6gXQikAvZyVxkHllnYopdUAUseiWzQRwTrjTm9?=
 =?iso-8859-1?Q?fgfA4TK7c6sgTZ5uqtgSnd+nso51IP53yHdRkCpRRkv6OXJR3CWwXF7X4L?=
 =?iso-8859-1?Q?5g1ktLFR3BJ6aYQ1JQN7oL5/NWqnrVlaoJaAHfCcBFih6XllX7ZYkEah4C?=
 =?iso-8859-1?Q?WUxtxKM7JSSDJDl+1nWoDdCGSRO8eMwPL+JpcxHaXQEcc7M4IPxpY94gb+?=
 =?iso-8859-1?Q?v839Djdwj0QJKEJpufz5Gk54kxQ2mAeZoUhZEvg93nLU9QplgqXz7A7KkM?=
 =?iso-8859-1?Q?fO6lOEpuRbrAEulFipLiX05dIkkBHb6MLVaTFRxe5LRMmPvqhEYknctnqi?=
 =?iso-8859-1?Q?RJvKtcO0h4/mik3yg3UNorB7PxKrcYibewaBgN+KdKWziDwihIcvtI0Yiu?=
 =?iso-8859-1?Q?Ge+GidZrQIomlJogfhxBx19qUr84CwjyEwoxHv2ih5ajx0lDxBJq6izNHa?=
 =?iso-8859-1?Q?1O3+6xpFnEDdTget35wt7BonfOexUzi37P2Ehwxqi+i+2c5o4vgyhB7nJT?=
 =?iso-8859-1?Q?3TVCB1j9de/TiW+R3HUMEd//f4RkFEZcm0l4eE1s6laJcCuHqbgw5oK6m0?=
 =?iso-8859-1?Q?tOcK4ruzU4uCdLutuUGSb94Mpt6cOZpxwKx62fixnqWrxeXvNKGIM9W+DC?=
 =?iso-8859-1?Q?ukgSSP5Ci7SvNbD6iUCGukn67OIlCNYzYM7R0Rzf5oeaTJvShD33M+dlAO?=
 =?iso-8859-1?Q?UwF5bxSnsnR78DCyZBMC7UdQgGaxbd/NOX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd01e5-ff9e-4586-db8c-08dc649ea7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 20:39:36.3869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oh/MthXCInCZrR8RiCTWqH6qozCNYl7PKc+CKL3iS2hKkjBTYEtlV1GVC6HxNdzfPMnj75UlwYrI1iDCcvV6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4685
X-Proofpoint-GUID: 6pqKu9CTb7gXAv9M33VQ35NBJAeTGRQ4
X-Proofpoint-ORIG-GUID: 6pqKu9CTb7gXAv9M33VQ35NBJAeTGRQ4

=0A=
From:=A0Greg KH <gregkh@linuxfoundation.org>=0A=
>>=A0 drivers/usb/gadget/function/f_fs.c=A0 | 11 +++++++++--=0A=
>>=A0 include/uapi/linux/usb/ch9.h=A0=A0=A0=A0=A0=A0=A0 |=A0 4 ++++=0A=
>>=A0 include/uapi/linux/usb/functionfs.h | 10 ++++++++++=0A=
>>=A0 3 files changed, 23 insertions(+), 2 deletions(-)=0A=
>=0A=
> Does this require a Documentation/ABI/ update?=0A=
=0A=
I haven't found anything in Documentation that talks about any of these str=
uctures or=0A=
constants. I will add kerneldoc sytle comments for the fields in the usb_df=
u_functional_descriptor=0A=
structure though.=0A=
=0A=
>> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h=
=0A=
>> index 44d73ba8788d..dcd962d1a75a 100644=0A=
>> --- a/include/uapi/linux/usb/ch9.h=0A=
>> +++ b/include/uapi/linux/usb/ch9.h=0A=
>> @@ -263,6 +263,9 @@ struct usb_ctrlrequest {=0A=
>>=A0 /* From the USB 3.1 spec */=0A=
>>=A0 #define=A0=A0=A0=A0=A0 USB_DT_SSP_ISOC_ENDPOINT_COMP=A0=A0 0x31=0A=
>>=A0=0A=
>> +/* From USB Device Firmware Upgrade Specification, Revision 1.1 */=0A=
>> +#define USB_DT_DFU_FUNCTIONAL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0x21=0A=
>=0A=
>Why is this not in sorted order?=0A=
>=0A=
=0A=
I will move it up so it is in order.=0A=
=0A=
>And it really conflicts with USB_DT_WIRE_ADAPTER?=A0 That seems odd given=
=0A=
>that DFU came first.=A0 Hm, it is that value, odd.=0A=
>=0A=
>> +=0A=
>>=A0 /* Conventional codes for class-specific descriptors.=A0 The conventi=
on is=0A=
>>=A0=A0 * defined in the USB "Common Class" Spec (3.11).=A0 Individual cla=
ss specs=0A=
>>=A0=A0 * are authoritative for their usage, not the "common class" writeu=
p.=0A=
>> @@ -332,6 +335,7 @@ struct usb_device_descriptor {=0A=
>>=A0 #define USB_CLASS_VENDOR_SPEC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0xff=0A=
>>=A0=0A=
>>=A0 #define USB_SUBCLASS_VENDOR_SPEC=A0=A0=A0=A0 0xff=0A=
>> +#define USB_SUBCLASS_DFU=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x01=0A=
>=0A=
>This should be up next to the other DFU stuff, right?=A0 WHat about the=0A=
>DFU interface type?=0A=
=0A=
I will re-group USB_SUBCLASS_DFU so it is associated with its corresponding=
=0A=
class code (USB_CLASS_APP_SPEC).=0A=
=0A=
The DFU interface descriptor just uses the standard usb_interface_descripto=
r=0A=
structure so nothing new needed for that.=0A=
=0A=
>>=A0=0A=
>>=A0 /*-------------------------------------------------------------------=
------*/=0A=
>>=A0=0A=
>> diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/us=
b/functionfs.h=0A=
>> index 9f88de9c3d66..cf3f55234a5e 100644=0A=
>> --- a/include/uapi/linux/usb/functionfs.h=0A=
>> +++ b/include/uapi/linux/usb/functionfs.h=0A=
>> @@ -37,6 +37,16 @@ struct usb_endpoint_descriptor_no_audio {=0A=
>>=A0=A0=A0=A0=A0=A0=A0 __u8=A0 bInterval;=0A=
>>=A0 } __attribute__((packed));=0A=
>>=A0=0A=
>> +/* DFU Functional descriptor */=0A=
>> +struct usb_dfu_functional_descriptor {=0A=
>> +=A0=A0=A0=A0 __u8=A0 bLength;=0A=
>> +=A0=A0=A0=A0 __u8=A0 bDescriptorType;=0A=
>> +=A0=A0=A0=A0 __u8=A0 bmAttributes;=0A=
>=0A=
>Do you need #defines for the different attribute bits that DFU wants=0A=
>here?=0A=
=0A=
I have them defined in the associated userspace program, but I will include=
=0A=
them here instead. The kernel doesn't need any of those constants, but I se=
e a few=0A=
other structs that have bmAttributes related defines below them.=0A=
=0A=
-- Chris Wulff=0A=

