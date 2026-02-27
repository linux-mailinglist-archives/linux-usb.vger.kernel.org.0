Return-Path: <linux-usb+bounces-33765-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA09Fz/foGk4nwQAu9opvQ
	(envelope-from <linux-usb+bounces-33765-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 01:03:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB31B11CA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 01:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 494D0303004F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 00:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AD31DE8AD;
	Fri, 27 Feb 2026 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZpraHOp4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ht61jYb5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EJqW+tPg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74C2A1CF
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772150575; cv=fail; b=BotEhOkEyu1bjeMwUDXcNu7iv2lF1C/m3I+urKltfq7lJm2THv5gppyjnANkMO0YDdR4iLXvyXKaeWMQApGPwz2cuz8+YjTsTFc76AjM7deK7KueXhiDHrcExu9IY2Vl+wQb+/CAd6X8S5g44HLJLTMUe56Tvk8QzhfsvUlF6Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772150575; c=relaxed/simple;
	bh=YUyveKSmnF3/FJtRJG5Ij7fV6C6m/53GmJQaCpdK8qA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MSexlxrb0j3ykEd6R76u75barnPF64iLa3yUD5164ZMlPAupcsXIslWK5yJCctz4Z9X9pjzmjuDj6yCJ+I+EyrJWMCBx1TLn9PP1ysN/mYFeADf+Ph9dltUXco47cniLAOQCzIIpk1jPQdRefw5VtKTZzKbNIliiSbIl54+2GnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZpraHOp4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ht61jYb5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EJqW+tPg reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QKOOnp1690949;
	Thu, 26 Feb 2026 16:02:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YUyveKSmnF3/FJtRJG5Ij7fV6C6m/53GmJQaCpdK8qA=; b=
	ZpraHOp4j120nEJa245l+6txbCTdO/TkCpUL5iI/IOdAewXncF8qCEPDHbodnWHH
	Kol8+3NkrNI0YrZVCif40aFo1HvJXD98urra9PC5SiLB922H2q53RfYChdEVSOnA
	EVN0D3Oj/I09Qd8SYIa6NSpDQmFrJYk+ZZYKeIXxpIgRcWGK0vJIB1j8L4Z52e6i
	PQY+0ZWMCZhV2lWeE/1VVMwPPRc+1cFCFaIr2SA9wZtNvsWkQdeAGVwngaaSs4Za
	JU1FIZBB5q7K8jWFSMaRC+Nl0QIR8YL7qGK/lJe6nbH94aMBx8LccmuC0FSE/WC9
	KqmFMr2DZ82Vp/nWumv9BA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cjqjrbqfa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 16:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772150552; bh=YUyveKSmnF3/FJtRJG5Ij7fV6C6m/53GmJQaCpdK8qA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ht61jYb5Yh/bi6uDBEsHnsUe32sylExszma30cRzo6k9QMobI0vNrPym/HJeCl0iY
	 nthwdpbYZELDBGholUFfxbyIhppaHwDLrAEsMiaWEROBltbF/eobQNruS62I+3IFZu
	 8JihBdXyuV+eRQ272VJI4s+HKXHFz4G6jhdivB7opQj7q4bwr2haZHImBee4Wc+6tb
	 xr+XoIEBRUhhUpkuDHNF+xkQYE6D+UEo1YT2BKm0uNa7+5bsUC4sUqZagFP1SS11V7
	 omyOBu+8Aap1QMyEVFWMo9CiIb9Nx/fbtWVlo9gPoL4/emHOyZzf2pHOmT7MPIYc98
	 M8+8lc/0JgUuA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93F70401D3;
	Fri, 27 Feb 2026 00:02:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 60C14A0070;
	Fri, 27 Feb 2026 00:02:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EJqW+tPg;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00302.outbound.protection.outlook.com [40.93.1.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DCA4540599;
	Fri, 27 Feb 2026 00:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7MRurCV1CjXL+QpTXEwpSCJ3rGLPtjWTQOQ4nuH7zp5PcSQEuwj+rAOO1ydHKGad5zvOt3BoN3u8yPyydwLnomGrIYPKT7V0hjXUqqsHHuusNkNfhYymQPwZWKfwgRGUKs8LlOt4V1g+ayVOHNs5xFp2MXkN8O+Zn3FAu719hn4Y2jkNn/UPFqkyUj3YH8ycXurZDoK6G49olt6olfXGEoBlRsRxrFxHltNKqZtJVQE63x0xzdF+jSAoHSwv87+kzQnK5VDImc2jaB4zs3HB6IrahcC2nM/t6EKc4XcXzeQs0j3OwOhAsVdxkSmb0C6XFRceKgzBp70g4Weg8ufVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUyveKSmnF3/FJtRJG5Ij7fV6C6m/53GmJQaCpdK8qA=;
 b=dZMioA9aQc1Dax47rBew7u7yiE1EGwx3w4bDPXDDa+a65DTFgWRIUHMg4VcWt9a10aL4QZYLp41mcW4m3yxmIQ0FvRPJ4laKNzoaeeWIckMXI5o3PRcrRVTXFhMEtQozPdU4A1I3847i4t+E23mBZm4Kig3alAlLAqpB3p4wQL9gwgszHVe6kVY395KJHSpJtY6iXOGQ76CTzr9iJgWFfs+mLmUYPf2DPzTV/uLze4RiJgf61FJMZvLH+1grx4Ooehvo1e5c36I+qW4movyq6rt6kECRFBmS0VYyZ86tz0skkHQMMDhBSQY64TgimugzVzvigcFzL6ad1oOO92hlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUyveKSmnF3/FJtRJG5Ij7fV6C6m/53GmJQaCpdK8qA=;
 b=EJqW+tPgWYpupgfmTdQWzH//6ezm66+xFnRyE/39SU/uAL5ZORvIoJrtDA5mzU+Gh8Vm5TobbDShYrK7Fzhd6/wxc0KIyk3nCpyVoa76OL1HcZe9MaDr1UhriJj8z7xMHJhVBheZlcBeB82YXRhHzJKAih+N/wYKkM9G+hXA2Ew=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB9274.namprd12.prod.outlook.com (2603:10b6:8:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 00:02:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 00:02:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Topic: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Index:
 AQHcpZf4208n0sWyuUS9s4MYOirBG7WSiaIAgADVroCAAOfJgIAAlMIAgACEpICAABENAIAAONyAgAADFYA=
Date: Fri, 27 Feb 2026 00:02:23 +0000
Message-ID: <20260227000219.unto5wiswjajix3w@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
 <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
 <20260226023935.ge3vlasodrrnhq6o@synopsys.com>
 <20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
 <20260226192645.aban6dcocehjq7ra@synopsys.com>
 <20260226212746.7a4b95a6@ingpc2.intern.lauterbach.com>
 <20260226235117.xzljtnilcemg2mgc@synopsys.com>
In-Reply-To: <20260226235117.xzljtnilcemg2mgc@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB9274:EE_
x-ms-office365-filtering-correlation-id: c0a24a6a-0e18-4d29-aa97-08de75937bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 IXqNhiOOMgCtd2lzjfkJEdlvK8zscCIrd99x8ii57UD8TSkAV7+hvQSRomvLkT7VeJM8rbh0zv1xsB09fmxwR51N6pha7fUhPH0vftkXgR/x7dtgee4yz38ko5+/udeu9HVeXR+jm/0kdqx4HXHk+tHjcRyOaqSttzJ6qNtRWiRCcputd4W0iiIpwWD6oUpsw3ph5TreHEmLAcZFJSOk//P0i7opkIYZIyHc9pVB9fDDSL7AYDJEoeW9SXQk21OPlTxSv2DvlkJ60kDa1SDRVYET8UQxFOb4A/QjhdpLgF6Tm/vQ4zaZNb38ckiMQDY5yZDNg3xUtyPGpHjI0ejlh9IzfRiRPxjGKIuYyaPat4hnD8QB6eSO2NnBPOfkzjDPIfAVTRfhqeCUU/uyhpQTwd9Zo7Oj7YHv+o0bS0isXtVUQq8QQO1lJ8CHt5Mr1vAz5d+g2dDSuJ7W1uSXsC+8BS2CxNel/q0W70yaS87DSrMeKztwPilCv/Nn/Uhqzi87SqmJIhFW0tvsxMS/TlkqPaO3NcUEuiKw2G/KYv60WWBDtxHzEQoNg6IGK5Qu/gz3NjvzOieeAeSk6aHbqk5IHbXVAkQ77guir6SQDDPaDSMeGeTHPF1TqkIPMyWWOxugKY8TYNvFk7KwCS4VxIpqou855+zyxVY5lMmv5cbMUUDhlo2NTuqniNwwLqTa3ER79elydaCswr0+UnjNGKilQ8KI/9SCGQbXESfkWO2zVKk/zN84mm2DABMeTv6IepRwVPdMH5qQIn+qqt8fcBhqY79cpDJ87u+ahn8E9VpENmc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzZmcDh4MjlPcTJwWnpmYTJVOTdzcDlONzc0U0FPMzBjUHVWSCtwWDJiaGNv?=
 =?utf-8?B?dVdsaVB0QkZVa3hIUEtYcTJBZy9ZR1pBck9BMHFuc1ZDQ0tSOXc4ZlR0WkFs?=
 =?utf-8?B?d25PSmFvVDdOWERma0ZlNTRaZ0FRS3VUNlQ4TjA4N3ArcmhoUUZIbTdKT2lx?=
 =?utf-8?B?VjU5RW92STE3V1NGUkFXUG5Qa0xJN2VCQUd5Z2FJMGdnaHlJSzhFRGlvR0ta?=
 =?utf-8?B?TFQvZnFhUTZMZE8xQU5nanNHajh0QVZvVVJxbHRZSDdFMmtNa0V3a3RKb0FS?=
 =?utf-8?B?c2lzSm0xTFR5V2F6YUl1b3h4TUYrdTVWek40dk1vckNMSGt6cm8vcndQZlBG?=
 =?utf-8?B?MFcrVzJnWmRkd2RoMGNVYi9Gdk1wNDhjdGV3RWh0VVhKNjVyenkweEdkS3lJ?=
 =?utf-8?B?VXZTcEFUdm0zVzk0NDRibEkxRjFWZUFvRnI0UmhrZUhTNE54dWhidFc2cWZU?=
 =?utf-8?B?WEYyRlpvUWRaODd6Y2FyenI0Y3N5bVJoWENSbHU0TVNKQkozZDdYdzl1bE1q?=
 =?utf-8?B?MDVCL0s2b29zSDRVTjRkckZvbWJUQy9oYzZ0V2YzbmVveUlJNnJmS213dHoz?=
 =?utf-8?B?eS9JZ1gxMEdaNFF6enBXaDc4NWw2QWhReHlrT1lUY1JPK1g5eVpXa1VmY3hB?=
 =?utf-8?B?SlNNU0ZoU3BBK01EdC9GeVIrck9OT1Q1c3ozQzIxVnFaSFpqdUMyWmpidHNr?=
 =?utf-8?B?c2xQQjVSTitSQzhkMzl2UjMwQVFYYVVGb1dVMUJrSmdsUU55Z1V3WEIySDlq?=
 =?utf-8?B?MjZnUFJZbjI0SzI5LytTNEMycjN1TnBQZW1UeGNsNUp0RitvbDVTMDJrWnpx?=
 =?utf-8?B?aVRDc0NvZ0EwZHE3MHhaTFc2bnpFSkRSOU53Y0FSQVhPWGhTdlo4VWs2OE9w?=
 =?utf-8?B?NnlFYjhCVWlYV09JUUdXUFdGaXd3VEV6Wmc2bGVhaFJydFYxQ1JwTDMzRlk1?=
 =?utf-8?B?Z1FiYUxaMkF0N1Y0eUNucktUOUNoMTF0WW9zOWs3Ky92ZDhVeWZ5WE95NGlj?=
 =?utf-8?B?aGNMbEZMdGRKQU9pSmp3b2x3STRzelR1Tng4VVM0bnNVVGE1UGpBL1RNbDZX?=
 =?utf-8?B?Z0FvZ3A5MExHYjRiSmRCTkF2VGN3Qklxd2R1SThhOFhZTEkveDdPWkoxRHRh?=
 =?utf-8?B?bk0xMldyUi9TOGdpZEpsaHFKTHV6TlNtQkZOc2RCQVF2TytFa1FBczBldDlh?=
 =?utf-8?B?VVRjV2xSQVV3TCtrcXV2T2dYbzZRVVBiYlZqRzZKY01samlKcTR6aEpqWTdF?=
 =?utf-8?B?WXh3MXJRK2ROMkYzY3pTNzlOV1VSelcrM3NoNSs5Qlk1YWd3V2NWVjN6L0JC?=
 =?utf-8?B?d2tlUUwwR0cvRTFGeStyNFlBejFaVUVWZ1Bnd095cEttaStkN3IvTkkxSitl?=
 =?utf-8?B?K29VRlNpZ3UwU004aEVRRG84b1ZRSlhEaThEb1YxM01xMlkyYzM2RFN1eERJ?=
 =?utf-8?B?bUpXaldTYUhSSHlyaDlOTEJCR0pFai9YOUY1VFhjRmNaNk1wMFc5eXhXZWFt?=
 =?utf-8?B?aE1YNWVabUJlZDJIN1Z5b05JUE1HRTRxcncxQVo2Y2RiRWtoQlRIV25pSzJy?=
 =?utf-8?B?YndiY2dlWllZUzhhVHl3ZW8vaWlPWmpWNklGZ2xVLytHOGVFY2s3Y0ZIcld1?=
 =?utf-8?B?c25hdmpyZmFGdVRGeVRXSExVV0tCb0EzSVFoYmdOYm0yTkwxUHBrd1NVUDBh?=
 =?utf-8?B?STU1aEpjZFI2QlZ6RFo1K01kN0VZZkdHblJWZ2dMR2RJcFR5K2p5cndtTHh1?=
 =?utf-8?B?MGRaSGQ3M3JpaEptSGplOGlCK0xXOFBOUkorTDVWL29vRk0wTXQxbFRBUlkw?=
 =?utf-8?B?OFdIdmNFM0dYWVc5ZXlBbG4vZ1pDMkJzMnNNc1BIcU5ZanNkL25sOWhLc3hm?=
 =?utf-8?B?UUxYazBQaEs0UzN6cEFGM2RMZm1yNjRJdm4vWlNacHZjdFlaMEZRajQvU1Zn?=
 =?utf-8?B?dnFTN0I1MU1RQXkrcGxBNTB3Q28vMUxBV0oxL3VDRDc0WGRhU1M0STh2bXBC?=
 =?utf-8?B?bVJZVTN2V1BKZFlkOTlGcUdWZUJ0UFhldmx1T2NxTHhuVDVLOXd3RjRPRG1J?=
 =?utf-8?B?cjBXbFkzU3JzSStwZzRLRW92TzEzUUFpdGNNd2FXb0tCQUZEeTdOTEtaVjhu?=
 =?utf-8?B?SFZBM2dQWnBqSVF0OWJlUlRXaStTVGo5L1lYNUozZ1hKaHZLeWR2WU5keVpV?=
 =?utf-8?B?REFqdUUzemo0ZzBaNExJYzNCQzRTYkk0WHVUUEZlS3g5eXFQRkp2NjM1KzIx?=
 =?utf-8?B?ejRTcVMzcE9xTS9zQ2tOWW1Vdjh0emZPUDdIS1hkQzFtRXRXQXREaDNiQ0Ex?=
 =?utf-8?B?Y1J3TStRRjhXUGQ3a1FXNE44WHpBbkI5QUFJaUsvVVErbmRwblpzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E2B53DFF253CB4C83C6BFEC50E31410@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	taqfrXyiPp2xSFsr++3pbqF3UqDkHmwY5rKPx2/gzaFamXiEwSyt66o6xYv51lbbewWHOl6sow/MMisb0P2TI/eP6NDUXnO+rzJ8Zb4Abl/K8FfY8joLgx3UxzBKGPCl5SNmXv2LkK15whh7pAo6racnpdyxbdnSsheBlCKXb8oZBHqQ5WRyDfZRnuZFNp6cQ6KADB+0ylRV7J2zXffSdLx7L+m//mGZzYRwBRBKqsYdX/knqsTl9BQ/VxAo5+HstQ9VAvPwaCAp5L7c8RttYyd2qECRn78BPBFJtHOBrz94AqlSRsnNGi8VNTO0zpYxQIVf3Fjy4Pwic1ctAYJt+iMHlyarf1BdevL7Gi3hdVj+V9ipsUsjmo3SCafLeeo/eCefJkXCr0OeHXn1L4vRbSxu85kaknSSEUKWPzm6/wcCVsn1sxfrqfyDcYN1EPec437/b7KP3aqxxGfRw1dnRfvCiOSYttP6I/MTFc1dF7ivQL/icORYMI19ZfFaPgo2/k2bk4+x4Vpy7IX5ZtVR5UX5ftHMBDTzh/MZWNxFTd/hgoLuSRgmDy6AKYsm20pcGQZmPCMtUbPebOUBQCdKXJMxy1ahZEMtqUC6QpDX4qgRnUgRJxAc+RR4F95jhCE5NLnPUhke4tZhDBeGWg+GGg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a24a6a-0e18-4d29-aa97-08de75937bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 00:02:23.0799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 848zemmqIvgMw6fqAUJ6mp4qAct2D+k9DfhcOmEtz9Z7cRqHVpBydBqYgZJpLLFGqMH9F4xCbK87zu6kS/YxzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9274
X-Authority-Analysis: v=2.4 cv=LJprgZW9 c=1 sm=1 tr=0 ts=69a0df19 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=O7Liv6BKmeFuDpclPEgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zXB7PMyhUsm7ac1qQUlD_jx2YsRxAIPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIyMCBTYWx0ZWRfXwdaz4VEuzidW
 11+Ro46bp/3U3e7taykil+dr5VXVhboueOqv/FvgGPJH0sXDwnCiHXSX+bn7ayb0Zdrpojjaf+3
 WTXKQXuwGTD2vzGKj2BrmAk3rozs2LAaBOIxaxHxJ8TsViuYB47jlkr6hG7EMneqcZr7fpkCfN9
 emabkez/5NJpfY1h1KBLp5cJZCQ3VFe8IWvOep+R81YHn2pW8DMwLMNvzuEYjpV8X+EWkBTH6it
 2lMJjE3d3IfsWSnWNxDrQaWhCRCIShJbBgOV0tWakK5Gmlh9dHIG8feDsd0xuN6iezZ7A1JM4Gw
 vw6dz/OGMHnyBK1/Whz7QVPIu/7xsygcuwSlkUe4mdv9pmyPOheiVPOl306c87T5PKmhdkeRWPD
 XuldbBVWsE1v9Hx72nsJ9gzHMPXDbd8DkEUftltG5koQ9UKjPG3fT6HR6+hsEfvlEB9Cpv6SRDT
 9hXF1jqdOpfDUwHCBDA==
X-Proofpoint-ORIG-GUID: zXB7PMyhUsm7ac1qQUlD_jx2YsRxAIPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260220
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33765-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 73CB31B11CA
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVGh1LCBGZWIg
MjYsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gPiBIZWxsbyBUaGluaCwNCj4gPiANCj4g
PiBUaGFuayB5b3UgZm9yIGJlaW5nIHBhdGllbnQhDQo+ID4gDQo+ID4gSSBzdGlsbCBkb24ndCBy
ZWFsbHkgdW5kZXJzdGFuZCwgb3IgbWF5YmUgdGhlcmUgaXMgYSBnZW5lcmFsDQo+ID4gbWlzdW5k
ZXJzdGFuZGluZy4NCj4gPiANCj4gPiA+IE9uIFRodSwgRmViIDI2LCAyMDI2LCBJbmdvIFJvaGxv
ZmYgd3JvdGU6DQo+ID4gPiA+IERvIHlvdSBtZWFuIHRvIHJlYWQgaW4gYSBkd2MzX3hsbnhfZHJp
dmVyIHNwZWNpZmljIGRldmljZSB0cmVlIHByb3BlcnR5DQo+ID4gPiA+IGFuZCB0aGVuIHBhc3Mg
dGhpcyB2aWEgc29mdHdhcmUgbm9kZSB0byB0aGUgbWFpbiBEV0MzIGRyaXZlcj8gIA0KPiA+ID4g
DQo+ID4gPiBOb3Qgc29tZSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSwgYnV0IHRoZSBjb21wYXRpYmxl
IHN0cmluZyBmb3IgeW91cg0KPiA+ID4gc3BlY2lmaWMgcGxhdGZvcm0uDQo+ID4gDQo+ID4gSSBh
bSBub3Qgc3VyZSB3aGF0ICJwbGF0Zm9ybSIgbWVhbnMgaGVyZToNCj4gDQo+IFNvQyBwZXJpcGhl
cmFscyBhcmUgZXhwb3NlZCB0byBMaW51eCBhcyBwbGF0Zm9ybSBkZXZpY2VzIHN1Y2ggYXMNCj4g
ZHdjMy14aWxpbnguDQo+IA0KPiA+IA0KPiA+IE15IHBsYXRmb3JtIGlzIGEgY3VzdG9tIG1hZGUg
UENCIG15IGNvbXBhbnkgbWFudWZhY3R1cmVzLA0KPiA+IHdoaWNoIGlzIHBhcnQgb2YgYSBwcm9k
dWN0IHdlIHNlbGwuDQo+ID4gDQo+ID4gT24gdGhpcyBQQ0IgaXMgYSBYaWxpbnggVWx0cmFzY2Fs
ZSsgWnlucU1QIGNoaXAgY29ubmVjdGVkIHRvDQo+ID4gYSBNaWNyb2NoaXAgVVNCMzM0MCBjaGlw
IChhbmQgb2YgY291cnNlIG1vcmUgbm9uIFVTQiByZWxhdGVkIGNoaXBzKS4NCj4gPiANCj4gPiBU
aGUgZHdjM194bG54X29mX21hdGNoW10gaW4gZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5j
IA0KPiA+IGxpc3RzIG9ubHkgdGhlc2UgdHdvIGRldmljZXMsIHdoaWNoIGFyZSBGUEdBcyBmcm9t
IFhpbGlueC4NCj4gPiANCj4gPiANCj4gPiAJew0KPiA+IAkJLmNvbXBhdGlibGUgPSAieGxueCx6
eW5xbXAtZHdjMyIsDQo+ID4gCQkuZGF0YSA9ICZkd2MzX3hsbnhfaW5pdF96eW5xbXAsDQo+ID4g
CX0sDQo+ID4gCXsNCj4gPiAJCS5jb21wYXRpYmxlID0gInhsbngsdmVyc2FsLWR3YzMiLA0KPiA+
IAkJLmRhdGEgPSAmZHdjM194bG54X2luaXRfdmVyc2FsLA0KPiA+IAl9DQo+ID4gDQo+ID4gV2Ug
dXNlIHRoZSBmaXJzdCBlbnRyeSAieGxueCx6eW5xbXAtZHdjMyIuDQo+ID4gDQo+ID4gRG8geW91
IG1lYW4gdGhlc2UgZW50cmllcywgd2hlbiB5b3Ugc2F5ICJwbGF0Zm9ybSIgPw0KPiA+IA0KPiAN
Cj4gWWVzLCBJIHdhcyByZWZlcnJpbmcgdG8gdGhvc2UgYWJvdmUgc3VjaCBhcyAieGxueCx6eW5x
bXAtZHdjMyIuDQo+IA0KPiA+IA0KPiA+IEkgY291bGQgYWRkIGENCj4gPiAJew0KPiA+IAkJLmNv
bXBhdGlibGUgPSAibGF1dGVyYmFjaCxwb3dlcmRlYnVnLXYxLXp5bnFtcC1kd2MzIiwNCj4gPiAJ
CS5kYXRhID0gJmR3YzNfeGxueF9pbml0X3p5bnFtcCwNCj4gPiAJfSwNCj4gPiANCj4gPiBhbmQg
dGhlbiB1c2UgdGhpcyAiY29tcGF0aWJsZSIgbWF0Y2ggdG8gcGFzcyBhIHByb3BlcnR5DQo+ID4g
dG8gdGhlIERXQzMgZHJpdmVyIHRvIHNldCB0aGUgWENWUkRMWSBiaXQuDQo+IA0KPiBObywgZG9u
J3QgZG8gdGhhdC4NCj4gDQo+ID4gDQo+ID4gQnV0IHRoaXMgcGFydGljdWxhciBlbnRyeSB0aGVu
IHJlZmVycyB0byBzb21lDQo+ID4gY29tcGxldGVseSBzcGVjaWZpYyBQQ0IgZnJvbSBteSBjb21w
YW55LCB3aGljaCBpcyBub3QgcHVibGljbHkNCj4gPiBhdmFpbGFibGUgKGV4Y2VwdCBhcyBwYXJ0
IG9mIHRoZSBwcm9kdWN0IHdlIHNlbGwpLg0KPiA+IA0KPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCB5
b3UgbWVhbiBJIHNob3VsZCBhZGQgYW5vdGhlciBlbnRyeSB0bw0KPiA+IGR3YzNfeGxueF9vZl9t
YXRjaFtdID8NCj4gPiANCj4gPiBTbyBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgdG8gd2hpY2gg
ImNvbXBhdGlibGUiIHN0cmluZyB5b3UgcmVmZXIgdG8uDQo+ID4gDQo+IA0KPiBJIHNlZS4gVGhh
bmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIEkgdGhpbmsgSSB1bmRlcnN0YW5kIHlvdXIgc2V0dXAN
Cj4gYmV0dGVyIG5vdy4NCj4gDQo+IFBlcmhhcHMgd2hhdCB5b3UgY2FuIGRvIGlzIHRvIGNoZWNr
IHRoZSBwaHkgY29tcGF0aWJsZSB0byBzZWUgaWYgaXQNCj4gbWF0Y2hlcyB5b3VyIFVTQjMzNDAg
Y2hpcC4gV2lsbCBzb21ldGhpbmcgbGlrZSB0aGlzIHdvcms/DQo+IA0KPiAJcHJpdl9kYXRhLT51
c2IzX3BoeSA9IGRldm1fcGh5X29wdGlvbmFsX2dldChkZXYsICJ1c2IzLXBoeSIpOw0KPiAJaWYg
KCFJU19FUlIocHJpdl9kYXRhLT51c2IzX3BoeSkpIHsNCj4gCQlwaHlfbm9kZSA9IHBoeS0+ZGV2
Lm9mX25vZGU7DQo+IAkJaWYgKHBoeV9ub2RlKSB7DQo+IAkJCWlmIChvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShwaHlfbm9kZSwgIm1pY3JvY2hpcCx1c2IzMzQwIikpDQo+IAkJCQk8Y3JlYXRlIHNv
ZnR3YXJlIG5vZGUgdG8gcGFzcyBwcm9wZXJ0eT4NCj4gCQl9DQo+IAl9IGVsc2Ugew0KPiAJCXJl
dCA9IFBUUl9FUlIocHJpdl9kYXRhLT51c2IzX3BoeSk7DQo+IAkJZGV2X2Vycl9wcm9iZShkZXYs
IHJldCwNCj4gCQkJICAgICAgImZhaWxlZCB0byBnZXQgVVNCMyBQSFlcbiIpOw0KPiAJCWdvdG8g
ZXJyOw0KPiAJfQ0KPiANCg0KQWN0dWFsbHksIElnbm9yZSB0aGUgYWJvdmUuIFNpbmNlIHRoZSBj
b21wYXRpYmxlIHN0cmluZyBmb3INCnhsbngsenlucW1wLWR3YzMgaXMgbm90IHN1ZmZpY2llbnQg
dG8gZGVzY3JpYmUgZGlmZmVyZW50IHNldHVwcy4gVGhpcyBpcw0KZW5vdWdoIGp1c3RpZmljYXRp
b24gdG8gY3JlYXRlIGEgbmV3IGRldmljZXRyZWUgcHJvcGVydHkuDQoNCkJSLA0KVGhpbmg=

