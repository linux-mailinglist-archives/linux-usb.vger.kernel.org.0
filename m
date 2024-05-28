Return-Path: <linux-usb+bounces-10658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E228D2896
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 01:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD261C22736
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 23:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F3913E8BF;
	Tue, 28 May 2024 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RjBQm87A";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gi2pRQrK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m1fGvhJS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9589B17C6A
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 23:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716937813; cv=fail; b=jmk0x5b3Zt3+K7Ntdfa7XIEC/GhqHA2IycpDzzblYw9vM2km/qRDyJzaeHBG5mHj/7+dbVbyF3mbMBDNlf9dQFUktIV2LUVVVEkEEXWfdRaZ1Z4+SZ7yV+QcUpbPEKyVGcsSmFMfVTMU1gmoYrtLZXpryxrwPSZqawPNYzOgPWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716937813; c=relaxed/simple;
	bh=szoYCA+PJe9X2b/rt+GthvfRq4hfDkFnWPr05rOm1y4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hBOiYlZfHKNwFCM5GUrGJjw+OVfDAQaOtY8Ay/vM3tBnVcaOlIbmjtJL5nVrC1G4Q3HmK/R7rK26RwCVyml/TETGxsT3CP6QvOAnp+7Tt3x990t7oYFH6gL7o2hCi1gOSlcyauxdkBxC8VBL37qMdA8fUbcuflFuURj3Uw3Kico=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RjBQm87A; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Gi2pRQrK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=m1fGvhJS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SJ5Qlf015287;
	Tue, 28 May 2024 16:10:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=szoYCA+PJe9X2b/rt+GthvfRq4hfDkFnWPr05rOm1y4=; b=
	RjBQm87APOb8Gln6ra6u2NhFd4Hj7fB53u1VLOI6G+LR0en0K0oxRYxEo67o7yZL
	UhnhdliGbO66t6D5DhLnuf4638+HF/FUP52C7UPU/saOaSPPxScEGk3Z/Q6yDlf5
	7qANTk9WzUbcUAl50rk7IGHhGYuwuGxqVseePBifVwA2RmjcEVPWauzqXMdTUIus
	Fvn8DCV4lGRKyoFM1u3SqjxtGaNZlGuVlfI4XgseA6cWsf/d6zllgHTEjesdgjJY
	WPUETvXdYzbqjlBTQwx1oqAsndnXgiXhcODs8SmRj828ejyLdBH3FHpOERbZw95+
	QWf87MyJANwC4oM038Cjww==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ybemcdbm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1716937799; bh=szoYCA+PJe9X2b/rt+GthvfRq4hfDkFnWPr05rOm1y4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Gi2pRQrKA0r03O0Hc0qdZnN7xIQEYvsMRPrtDzHY/jIr4aDkCM/kp5yZBs5wkWegk
	 qX1DHL4Ih3KgVGIkBRiAC9AnA4gvZyCWfQAsbDqZ2e1XgYWZIPgPifCRJr3RUFmYUC
	 X7GT+Sv5fycZQEQdUFQZSf8701PSpuBm/jdS4W+XC+yuFwkZBvkP7eKUahwjGR5+md
	 59SNuuIOL6Um31DF9lM3aonToPgh6x1XyKVydj7M9RwC7cy9ZvZSFqy6om/K/zCHea
	 OShAR62c4/SXF+DAxT7wzZuh7+/hVmlcDYpQsf4aGZoeYGsw65+3jB42UDAwc9B4aS
	 2tyiFK0MypmHA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C90D440347;
	Tue, 28 May 2024 23:09:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4BFACA0258;
	Tue, 28 May 2024 23:09:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m1fGvhJS;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8602840349;
	Tue, 28 May 2024 23:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl+rNDPnbL4lNe1THc1HVcQrJmu0jZb0FSCrLVZcbkr4m/GGqinro7LdYc0B65621ADP/ejzMqxdUz17/0Qacbf4RCrmVeGEbfPKH9GX+wJVA5Tk6TKJytfk3nKXw2BhwZw9AUpbeMhmgByshe94uZwOiRMaPNcGTXtaowQxLi7bIfwW4b49sR+5Njen1j7Au3i1ByHRcn7KLVw7yCr2cH2T11n/bc3TIoD87Dh6YMCRojeOr8nWvzmc+WggW513kxwRvrbKHHtkxrZyxel/YQ93nvSbrBtiTUySJ1Wz+JEKbUOx1LSBEV8+QweEoQa/NYI+g1ld1ccYibjMIb2dOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szoYCA+PJe9X2b/rt+GthvfRq4hfDkFnWPr05rOm1y4=;
 b=VN9vV5H7IjYz/cbB/sCFP6yf1lSCHh6Eg5FwXh69wvblr2kOb0JoBeUvnDIWalFeCngV0UGtAXPBX5uyV83ZjQXaq5OdZWYDScxYB9kFyKE2SMP05ToJ6ZknoyEubUA3ZImzw3M3QE3R22MMhWnC9wf9eg1LDVehzKerR0KoxEQrXp5ntI9eGNvfFR3hwNumoxkqvPful4styaCbvWUMrX/Xw+9EUkhuclih3gMvH7lZlSjB85784hs1XUNtkgolWZvEP+x/v5+J+LDIhVolPVo8nUzQAlKxST8CZjnEBn9Tcfr/uDfJVKhO9sQ9ADvVyyZQQgqF6RGFoYXLympViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szoYCA+PJe9X2b/rt+GthvfRq4hfDkFnWPr05rOm1y4=;
 b=m1fGvhJSTQU4KYcqD9gn6bcx5fMkjBZ5yzfweB1s8kxLrgaX7d61eE2DFXtKBSMtDD0+e9b0BJzkn6/CXR82hoyx/RyuLJKmWiWQySBRHWFOHmBPG66G+Iv253L+6CJelcDgxbM9u+poH2LT3a+AD2Jp92QC+c0p/DkWijiYggc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 23:09:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 23:09:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] usb: dwc3: core: remove spin_lock/unlock_* to avoid
 deadlock when suspend gadget
Thread-Topic: [PATCH v2] usb: dwc3: core: remove spin_lock/unlock_* to avoid
 deadlock when suspend gadget
Thread-Index: AQHasBO8Fd0cR3pETUig5vMLfMQkWrGtSCGA
Date: Tue, 28 May 2024 23:09:53 +0000
Message-ID: <20240528230951.23ac5yqwkpalxdzz@synopsys.com>
References: <20240527170413.1107831-1-xu.yang_2@nxp.com>
In-Reply-To: <20240527170413.1107831-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8710:EE_
x-ms-office365-filtering-correlation-id: 91732242-2bfe-47c1-7972-08dc7f6b4894
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U2JtOUErMlduMXk4RHYxRnNXaERscG0vUmRsblZZcUR4WnptSlZ6UlU4TzBE?=
 =?utf-8?B?ZnA0YUIxQzN0WnBXOTc2emNzNDJGeGd6ZGE2cWo5Zkw0d1c2RDZBTlFQQk04?=
 =?utf-8?B?TG54RzM5WTJOb1dCbnViMnU0YStqYzlMNUp4TXlJQ2UweXJhN3k0bTgvWGZz?=
 =?utf-8?B?RFVnNk1nVzExVGtma0tVaWdTcHd1OW5IY0JxV2lyNGFtNVRyVk5iUnlQK0kx?=
 =?utf-8?B?bmcyY2tUSnZlR0Q0OFkvTjYrZ0MzbHE0aVZMQnFUa0x0NU9VZ3grcXREUkk2?=
 =?utf-8?B?c0F1ZFpwWlZYVWdmNUI5cEdGQm5CNUVDTWt0c2t3b1hkZzNNVk4yWVVuTFR0?=
 =?utf-8?B?Q3JyVjJqTFRRbWszRkJIZTNtNXRhcFoyVU8zb1YyajZVZjRmYzBEMGNaUmlT?=
 =?utf-8?B?MzlNOVZGek5KZ21obXJWL0JmQ1psb3cyL3NDbUJTMUpyc3FxTHZrekVZSVZ0?=
 =?utf-8?B?bXphL1lOb1B3VHlHYkh3c08xem9qYllMRjdpWVI1S3NIQzNnbzdaNklwN1ZC?=
 =?utf-8?B?TEdnTW1QQytUVmpRRUp5R2JLR05KQWNoWk9GckZIK1ZiSFUvaWpuRmt3cklI?=
 =?utf-8?B?K1hKckk1WW9USUswUlFzV01abjNDcU5LY0xndnlaV0Y0aXJ0NlBKMjJVL25N?=
 =?utf-8?B?eEVnbHhhQTcycGhsSlEvdmFNSFpYWVh0eTB1S2pIb0R5cE90VlVHazYwcnE0?=
 =?utf-8?B?TGpnUFY4M0dFUlRWL2ZwVmZiazk4SnYyV3dvcWQ1elhwdnZqUE81R3h5YlR4?=
 =?utf-8?B?bjlmcjFvZ0Rac3JFRzRxMEpoY28zSFdsMTR2Nis2eW4xa3NrcFREVHVGOGZN?=
 =?utf-8?B?MEVVQzRnMmtEZUFEaG1HNjFoNEhkTjZQTmdOQ1FQT0ROV2ZJNDl1dm9VSG1F?=
 =?utf-8?B?d2gwYUdWUGZOS1J5UGJkTi9SanVjZ1VpcklVUjRmRFl0TDhTQXFWVzRUcTFI?=
 =?utf-8?B?a2RiaTlqWXZ1NTNyZ3dHc0VNRDV2Zk40RDhQUUxpelBWbVozN0dLSWlHUm9F?=
 =?utf-8?B?alIyblJ1U3ZMNGNwSHJxSVUyZVZTem9ha3M5UmlsdmY1WHJPYmpjTEpvWGls?=
 =?utf-8?B?TUFvcG02dVZjMElad2wzRDQ3VWttUEFmUUJyNDhDTlVxaXpwdms2Nys3U1Q5?=
 =?utf-8?B?NFZhang1VVptQVFmQVpQc2R0WWVVTG8wZjVtZTRsOUJBM0dRNW9sY2oyRmhI?=
 =?utf-8?B?ZXhVWUMzOHczNEZTWEMwQTMybzk1Q0F6cUZGQlBoRVZHckFxdk85RkNOMVBj?=
 =?utf-8?B?OHdmQXhjUXJoUkY4YWQ5RzJHMVhTVWhmS2RRWWl0bTdUUjdhRWdLSHdOWmJp?=
 =?utf-8?B?TlpDRFNJanZlYkdxZDJybEtHUFo0djM5b0xsSlM5YkFML1d4dEpPMlQxNnBD?=
 =?utf-8?B?dkR2cmh4a05ERjliUU1nSENlWTdOV1ZnWFRNZy82UmVmdFdVMldrWGdTMEhC?=
 =?utf-8?B?cnV3aUVpcklrRzMrQjBWWVVrRjcvSkFiZXdsSk9nYTFJdzFpcTFvaUEzTWVP?=
 =?utf-8?B?UE9zYmdOa2JMNGRiMnU0a0drVEp2TEhodXgwbC8vRitRTmhvQWRrOHlWZUZL?=
 =?utf-8?B?QlVBbXVQbXdwZUhJR0diK1VXUmhXc0hYRFpIWlpqR0s2YllTZm5uNnBDYlJa?=
 =?utf-8?B?UXU3NGMwb3BQaU5yc1dyZVdabG1waUZzN09EWXZFRktBM1ZqMjRCOG9Ha0Jv?=
 =?utf-8?B?Y21HODZVdStpd212TnlnRkRVL2NZMDhlbzNGNmswcXZHVjltMVJTRkRXUklF?=
 =?utf-8?B?R3BGM1VudlBGTUFJYTlJVXVwc0l0a0NiZjlkS1hMR1licGthVkx0N0RmekRO?=
 =?utf-8?B?ZXh5cFpPZEhnbHdUZUxxZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VGZjSjVkeUtJTGQ2UEN3bVVESGw3TEg1MmlpQTFLcjZCL09WaWFLdGRHdGV2?=
 =?utf-8?B?QnJhblIvR0ZNYlk2WkNSU1h0bHZ3em5JQnJwanRWZHg5ejZIK3M5K3JrVllQ?=
 =?utf-8?B?dkhGRWYyMDF0blN4blVyK2FDK2ZZRklOUGMvcXYzRHFpOFh1dHRnZU9HU0F5?=
 =?utf-8?B?WjFBUThxU1huZTE1TTk1dXVydnBZbEFBUjFUaTEydkt0L2Zqa1duZHExczlE?=
 =?utf-8?B?eVZnNnE1ODBhMmVtdTVZTk5XdWV4aG9Pd2NQUSsvRFlzWTVCcDBIZGZYQUNV?=
 =?utf-8?B?VS9EejlMVVg4RFN2ZzBWUitRMDg3cTFJR25LMWY3Z2dVZk9rV0grTmtYZUlr?=
 =?utf-8?B?dklaYXprVHU1d2R2R3c3b3lUcGhJaWQwZTZlSXVCdVcxd2hzeUxDUWRpYVpB?=
 =?utf-8?B?RXJOUDVIUlgyZGU4YmRBY0tBdDJnSlo5ZUt3VG1VbEtzd2Jnb2cxeWQrZjh2?=
 =?utf-8?B?bm5xblJROXEyZXBSajR4aDB1WjhrYXI3R2lrZURiRkUrdGdEV0FoanVJZWF3?=
 =?utf-8?B?Ykw0dTdxTnd1UDMrZnNSSlNBNE1oQlZNSGNQQ0VnOFlXRGRyMnRubHZsZnB2?=
 =?utf-8?B?M01iTFkzb1VnOVJVaW9IUDJheFZrSWtDQjlqUlNMQ2lQeUQ4RmxYQUI3MjZY?=
 =?utf-8?B?V3R6T3VHWGhZNGJuZWRVKzdlNThrRUs3NkpkenJVZFJnMHlsMkRWcDBGQTJz?=
 =?utf-8?B?S1F4QjQxQVpwUTZscmF0RFpxUmpQcmhhNVhYYkNFcndHeHJhUStPR2h1UjVu?=
 =?utf-8?B?U0ZpbTUxdTVrQ2h3eWo3SThzejVRbytWNXB4YjdCYXQ1NmlrTW1BTWFYY2V3?=
 =?utf-8?B?L3owNWs4ckhTV3crOVA1ZDA0UUUwMnl1Nk13TmZQT2xlV2NsTHlxd2MySys3?=
 =?utf-8?B?bVZ3WHMrNkZmZ0ltTkptTGMxOVpWelpMWDhoWiswUWtjd2xVU1JkbFlRNXVV?=
 =?utf-8?B?c2wwUTY5RzFjNFRUbVV1VVk3ZUVGUkZVaEl0QjBnNjRTUWZQSGNWS1VrRGla?=
 =?utf-8?B?dDlkRVJBODcxUFNsc0ZOeDF1MTd2RDJsM0NWNzkrN0lZRERFVmNnTzFTNERY?=
 =?utf-8?B?UEtEUWE0Nk8zdmRFNVRWdjR5SXA3QkN2WGQ4ODZWOHVIb05EcGtUcWt5d1dU?=
 =?utf-8?B?Rm9EYXN1NThLK0hSK2ZteHVYUVkrWmhURDBuTlFlc3RDblNrZUdPMFBEVE1x?=
 =?utf-8?B?dk84TmpIakV6MEQ3MUh2bTU1OWY2Z1pkU0FhTDZtRktOUVpqby81c1pVR0NI?=
 =?utf-8?B?ZnpZb2Q3VFdRaDZnL0VBRkt0Y2Z5MXd1Z3dxMGo5a0VpL0h0R01XYzhiMWlr?=
 =?utf-8?B?ZkxiVGIzRTV6UHZxNm5mVVRRMnJvK1JKT1RLNU85aHdiODh2YTZxUi9HQkVn?=
 =?utf-8?B?Z1ljUk82YVlpQW0yUUFiNGw3OUduSmREWDZOdDFBOXFXVjAxNTJWUDV4TUh6?=
 =?utf-8?B?NDN1RlVjUHREYzN4dVIxZFU4emxEVi8rZUFTY2J4NjJWTEdBLzh5MWlleUJ5?=
 =?utf-8?B?ejdkczA5VGhtemh3UnVkNTBadmFMSTljRHdmUjVVTFl4Z2xJQktxajV1VWY0?=
 =?utf-8?B?YzhDR3pDUGVtOTExaWJMUkFSK1EzVHY3UlR0dXJTcnVDb1NYMTNoa1FibVlo?=
 =?utf-8?B?dFc2Zys1dTdaR2EwSnlCdkhYMTRScFJMUHc2MHdDM1F6QXZBTDZOd0RTQkRG?=
 =?utf-8?B?aWc0VW5JSU5NZ1RtczRZWlFOb2xqVWFBdVp6dWpldGhzWFRPWGFMeCtSZmUr?=
 =?utf-8?B?QmxJUzRBV2pDWGNIQWVTdGhkUUxxemhibjhuQ1NRQ29FYmNaV3E5ZVVhcEVq?=
 =?utf-8?B?NEIvN2JRcDJTalN1R0YxUUp5dnNQK01nV0dzblBDY0swYTQvaDNLRW9FUlhC?=
 =?utf-8?B?UVNnY2lCTVF4dk04aFVwQkYzaDBRZzlyNlpyV0lKZjdpQlJJNlM2dEFYcndW?=
 =?utf-8?B?cy85cVJEQThSdEhOV2czNUhqNEw2KzFqUWZBRENJSm5vL1U5YlN3bGlnVlpR?=
 =?utf-8?B?TnNObFJYVjd3b3d5citxSmpTRGdiNjRxTjhCKzF3SjRjSFY3QTZSdzFHSGQr?=
 =?utf-8?B?MXdmbitWVDIxd2MwUXJUanRQY3JZRFd4ajRCWEhqaDRhMUlzaG9MaHU1RkVG?=
 =?utf-8?Q?ERHWgsXCOi8Xo/iMAwsSMj5oN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0617D00276421C468F0C021F9739105A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pcKMrhSAurZ3Y1JWmVUjV7BkfsNSJgDSlanEJV76DJ7hmMsmP0SaOcDz9GnK/b0EDxTu2mehdp7IEpQYirzD0aSVK4fZ17ayWWiwzyiBMS7LGJ0BlprKrThYjy0XMesdU6zpa/0O6IZu6bI5xHiK/1cFJ+4mHHtnobBNSg/R1Xe01F3BNMVAcd2rOgYF5foagdDST6v9tnVFltxe0Aw+CA1dcd330YT85ufw693tKF+qH74qe7w+t2/VOhkngsqBIXuUh63yS07VssqD4UmMdeLJ5qSS4snQtPlMsoo30iLJ0yktZzE9KIll/KD7qgYRMYQ0gOhmloa6dvBA4AapWh+/mALftsTOpLZiYvKMfLt+5D6pS1p9Eq1ji4tRvNhnpFFeW6V9lpI5OUlvSlXIq+4ZoQNRecMAr7pmys1rMMDos6A+uDgwk78A8lZ1lmwf02tGJpXxviC89ne5DOl0MHw8TPV1AdoBO4Fnl/rcB7jkDjozrILAmXVwUKpPSMbJ4UKjo6OPrKjVGa4KJtK2BfPaSAi3WatEvGCJrQKnPZbNWPEjE3YJ2UX7EEiIVprMe3w/b+qMyeMgbMnLgujNO1VRzp++wD6Wqc4VOx/gl67qbbN2V6VUUupjRbXLNiZMK6Z8mUPmyyQJLrWqdUfrMg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91732242-2bfe-47c1-7972-08dc7f6b4894
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 23:09:53.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nd1ZMAl9cjjhNMp4JNxAJofLVdeCqPP9hnu6eRHWYnkq3QaI5IeKIgKD4YFZ+VkVI3NfqN7rEo4V0cWuZHEpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
X-Proofpoint-ORIG-GUID: aR7etJiuYIG_ZCnh5qZ8vxmnwIBeYNYo
X-Proofpoint-GUID: aR7etJiuYIG_ZCnh5qZ8vxmnwIBeYNYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405280171

T24gVHVlLCBNYXkgMjgsIDIwMjQsIFh1IFlhbmcgd3JvdGU6DQo+IEluIGN1cnJlbnQgZGVzaWdu
LCBzcGluX2xvY2tfaXJxc2F2ZSgpIHdpbGwgcnVuIHR3aWNlIHdoZW4gc3VzcGVuZCBnYWRnZXQN
Cj4gZGV2aWNlIGlmIHRoZSBjb250cm9sbGVyIGlzIHVzaW5nIE9URyBibG9jazoNCj4gDQo+IGR3
YzNfc3VzcGVuZF9jb21tb24oKQ0KPiAgIHNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZs
YWdzKTsgICAgICA8LS0gMXN0DQo+ICAgZHdjM19nYWRnZXRfc3VzcGVuZChkd2MpOw0KPiAgICAg
ZHdjM19nYWRnZXRfc29mdF9kaXNjb25uZWN0KGR3Yyk7DQo+ICAgICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsgIDwtLSAybmQNCj4gDQo+IFRoaXMgd2lsbCBjYXVzZSBk
ZWFkbG9jayBvbiB0aGUgc3VzcGVuZCBwYXRoLiBUbyBsZXQgaXQgd29yaywganVzdCByZW1vdmUN
Cj4gc3Bpbl9sb2NrL3VubG9ja18qIGluIGR3YzNfc3VzcGVuZF9jb21tb24oKSBzaW5jZSB0aGV5
IGFyZSByZWR1bmRhbnQuDQo+IA0KPiBGaXhlczogNTI2NTM5N2Y5NDQyICgidXNiOiBkd2MzOiBS
ZW1vdmUgRFdDMyBsb2NraW5nIGR1cmluZyBnYWRnZXQgc3VzcGVuZC9yZXN1bWUiKQ0KPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5n
XzJAbnhwLmNvbT4NCj4gDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgLSBhZGQgZml4IHRh
ZyBhbmQgc3RhYmxlIGxpc3QNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDMg
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGlu
ZGV4IDdlZTYxYTg5NTIwYi4uYjgxOTNlZGM0MWJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMjI1
MCw3ICsyMjUwLDYgQEAgc3RhdGljIGludCBkd2MzX2NvcmVfaW5pdF9mb3JfcmVzdW1lKHN0cnVj
dCBkd2MzICpkd2MpDQo+ICANCj4gIHN0YXRpYyBpbnQgZHdjM19zdXNwZW5kX2NvbW1vbihzdHJ1
Y3QgZHdjMyAqZHdjLCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAgew0KPiAtCXVuc2lnbmVkIGxvbmcJ
ZmxhZ3M7DQo+ICAJdTMyIHJlZzsNCj4gIAlpbnQgaTsNCj4gIA0KPiBAQCAtMjI5Myw5ICsyMjky
LDcgQEAgc3RhdGljIGludCBkd2MzX3N1c3BlbmRfY29tbW9uKHN0cnVjdCBkd2MzICpkd2MsIHBt
X21lc3NhZ2VfdCBtc2cpDQo+ICAJCQlicmVhazsNCj4gIA0KPiAgCQlpZiAoZHdjLT5jdXJyZW50
X290Z19yb2xlID09IERXQzNfT1RHX1JPTEVfREVWSUNFKSB7DQo+IC0JCQlzcGluX2xvY2tfaXJx
c2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAJCQlkd2MzX2dhZGdldF9zdXNwZW5kKGR3Yyk7
DQo+IC0JCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gIAkJ
CXN5bmNocm9uaXplX2lycShkd2MtPmlycV9nYWRnZXQpOw0KPiAgCQl9DQo+ICANCj4gLS0gDQo+
IDIuMzQuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

