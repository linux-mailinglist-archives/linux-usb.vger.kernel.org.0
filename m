Return-Path: <linux-usb+bounces-30215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F7C419FE
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 21:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B71033B006F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 20:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DF4262D27;
	Fri,  7 Nov 2025 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jET92F0T";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UpsW+hWc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dX6cBhoa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67A27FD45
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762548395; cv=fail; b=MbLEDfAh299nc/dIsStE8LhoTkBXycyKwMnT/zrcAORO27WEQmLO/1wBejt7LlFd1L2MMSvsk8Jrq+E/HcuT57XLeEhe5AugV9iulGHkP7oqitCRWHV2hdsmHqeFr7l+dTJKbY9IItzhSgUcFMZgTqlqkofK/Sb7t8GBRwfpzlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762548395; c=relaxed/simple;
	bh=FIcuJtHan3Cz9EcxTko9ULpF6F9neihGL1C7oDo9cU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ePkGzId6vi/f4aR3aozbIUp5zgh3GS/6R+i+r/O2270WodyqyGfaS+3rP/3dEHUZkDXKl8xxonpC4QNgSXzUHIl3RbwJ2MMSEM3HhZ1kbLy0g9HnJJInb64ZO3AjkB7d0gEh58y+oRqojvFFVlA4BiRqVMg+n3SYOacptDfyzck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jET92F0T; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UpsW+hWc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dX6cBhoa reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7KAKVQ3130450;
	Fri, 7 Nov 2025 12:46:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FIcuJtHan3Cz9EcxTko9ULpF6F9neihGL1C7oDo9cU8=; b=
	jET92F0TNoltr1eZVTNzPV0jLqacpdX+3fKoj7DX5jpIAhMw57Wx6uA6x89xtHIP
	Lth2N+/dLcAez87MQxKF/V9CobGg54Oi0g2VOOpE5ZjKB5ppgLT1lNGTtN0nrnVp
	o30S3pM3K9uMs9GoV639NA4UUM0Q+xjIvAq3Z52DjTbSdoNOXLUyGbtC2fRPUSe4
	UgL9IDeUYW8HcRa9gxlSckJT1uIMvBSTNdC5mMMpam9LrAiiI05eowNZlRFE9rtb
	Mn7TpkDH6ZVCcsnyhm49reoh9Pj5ChhcYQ8QzW0DFor7LN2wcYBV5qk1pLBxstvk
	23rQNeWgg7X0iHQYElWRjw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a9mcmh028-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762548385; bh=FIcuJtHan3Cz9EcxTko9ULpF6F9neihGL1C7oDo9cU8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UpsW+hWcWiz+DNDukFYY5Oky1cAG8lTrFTGDXRhPobV9Tz1Pq4w0xQFC1YZaNOaLM
	 BFHwT/LTkBz5zyWXN60uElIN2lQ2gDa3xA43FVeelFYq9SBpRKafGGlYJvcakYUHpa
	 fqpiXIdP6ZvltvddpJi69KJShToaake0RoySxLss+o6eVz22w4q0344z1JZVFBjG+H
	 iMSVECosPPEsne5tv2QFaZrg8DzHPlmauyjCk8UkSn+VWuAdG9UUOwQhlrXC/IYT+7
	 gjj+lDUGlpXwGHC/Vj2mjxUFDNZFgAqs60UnNWO8qjQP70iK9MwX2+R46eiv+qdpW7
	 snASkVP59kWwA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0CDF5401D3;
	Fri,  7 Nov 2025 20:46:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B3716A006F;
	Fri,  7 Nov 2025 20:46:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dX6cBhoa;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00104.outbound.protection.outlook.com [40.93.13.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 22D1A220473;
	Fri,  7 Nov 2025 20:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8DACPDJ7OogDIw5KPT9LsFXwVthJdfmJ5Npsdjr/GySjLtsiAW15gUWguUhlYukSYjrhxH8Va56Tqwoa5xlQAtaZmPjk/PU2hq2fUwrccJW0O8VBoO82k9MGNkYZS4F3KQUVCeAVylwwPLHSlpG/pZIpgszQcDLMPzEv0CqiPekoOaflbgd1B0GcJ94bZlRwxBFOxH9VEa1CNYZ9ii4SdkrDpmT3gFLPDd8QUzadYXSz637mp4i2fcBuXYrFHaXpdjFLqxbsWp260Ayi1tcWTmNIeGAvsi6fesiARDZ/dUXghs1EJ/uZWPCju3GQ0HfF1bojZxSIhheU3M6TmuNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIcuJtHan3Cz9EcxTko9ULpF6F9neihGL1C7oDo9cU8=;
 b=TAAcnGYgVo9s6mAM9gzmlkUOPNsJ+ZtnDEsZ/aGyPz70ssV7oSaswNTOTaMUZGu8udChXj03lhpWVMnohkc6nsKBRJ3E7UhHsWq+HlQ2HpFZTlOgqG5pBCz8LA+tGeMYhszuPLO8tW1z+PQ+t28XluYW0ArTAHKHmD55kgNxrIqFmtk05XUebm1SdTCBsqWikN/U23779H4lWyyP9uCFppMccKBtTaBugrBqINDDkK7wvQHym93Y6ZaRo61PPk62yOL98yTvBLKx0UUrkUqxJbUCcrAfSWCnOLQcO+c8vEjy2udR+HqZZnj7UioOpbe8An70kpkQSfac7DVOFL1mNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIcuJtHan3Cz9EcxTko9ULpF6F9neihGL1C7oDo9cU8=;
 b=dX6cBhoaAbxfQEbXWZrB+CAqoPNjYr2nnSRBRyxGNC19+DImjmnICYJuOqkeclGeC+yv6LjQWEYNSe2eeaSxzQUZaL1dJkWgE5MXtRAhK4uKm3LqPePSzFJ9zvY/4T36f6ClbDRJNtrvSnRbgHP1KkJRj/SSo22VECvEhVKvBis=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB6793.namprd12.prod.outlook.com (2603:10b6:510:1c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 20:46:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 20:46:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: pci: Sort out the Intel device IDs
Thread-Topic: [PATCH] usb: dwc3: pci: Sort out the Intel device IDs
Thread-Index: AQHcT+BEyFM7p6jZxkyWqQaxNvtqCrTnr1SA
Date: Fri, 7 Nov 2025 20:46:19 +0000
Message-ID: <20251107204607.36br5xmai5dy72ft@synopsys.com>
References: <aQ2q4seXxTnDnBIc@kuha.fi.intel.com>
 <20251107121548.2702900-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20251107121548.2702900-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB6793:EE_
x-ms-office365-filtering-correlation-id: 594fe951-7c19-4b3f-ec83-08de1e3eb450
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlJoYWsweEFLRFE0aG1zd1dlZ2V3MkI3VGpjV1ozQlVCdzhRMHFXSEZlSlZS?=
 =?utf-8?B?Q1V4OHY0QXRDbk13aW9Dd2JaTzY5Q3gvaXhaZ0xtSkJycUVLeGdGLzFsellF?=
 =?utf-8?B?akIxaXY4QVN6ZzBzLzBQcFdjejU1eDUwczdNNVRZRWl5RThNUzdnYUk4azhG?=
 =?utf-8?B?TXUwZ0ZWR2d6NlJtN0xrc2hlMFdkTHl2Y1JORXNLL0dsVzduenZoVVdiNGxY?=
 =?utf-8?B?TTFVcGZJL3ViOU10L0N0N0NaQ2RYSkFEcVNDRkVRZ05ZUFk3WUd4UlJmOUR6?=
 =?utf-8?B?MDdKeHNoaWExVCtFU3d6ME91enplZVhyNmxRR0RMbkZjbDVIWmE4Mnc5cmg1?=
 =?utf-8?B?RGRyVmU0R3FKbkh3YmQyZWd4RVFRVVRMdlp4b1Nvd3ErckFtS2xaSmpOZkND?=
 =?utf-8?B?NDYzcFRVUkVEU1ZUMnhvWVZiYTFlY0tXbUlWUEtwcWNwZFZ6RHF6S3E2TGtj?=
 =?utf-8?B?R1BVZnJZZytLK3pMSnUrRkZhUG5sYkR4ZXdiY3E5M05NWDZvdlRKY0RhVWVp?=
 =?utf-8?B?VDR2OERJdHpocGNHR0VWazlLRmx6VVV2ZlI5UjF5SFRxM0Ztblk1QWRIOG84?=
 =?utf-8?B?cFptVG1COUZodzdCOU9UVEpTMjJsdmVsYXZHb3l2ZXlFWTdSclg3S01UUFlp?=
 =?utf-8?B?eXFDeEcxR2t2bG52SDMxbnphS3IycTJmME56UldkY3oySlBhN0RSQmZpakF2?=
 =?utf-8?B?ampXNDRvSDAwRklGQ2E3UkZvS2dwQ3I1dlNzVnNIR2FVazJrT3NDaHl4ckkw?=
 =?utf-8?B?bDlGTXNxYTFmdVZPclJ4UWd1eU5aWnJiNDl1K01RZmRPOW91aXBwYzRVQ1lS?=
 =?utf-8?B?VUpTUlZZanFFODFsamtBbWMzbnQxSGM5T2Y5Ti9TcEdIWXRjQlM1TDVTZkV3?=
 =?utf-8?B?ODhxdWhRd3UrVXdwcUFzVmphNkVRNkZNYTZXQ256bmtrazdQV2ZLT1ZNdzhv?=
 =?utf-8?B?UGhreU8vb1lhNGZBWEE1MFF6Q0Mwb25TcUxrVkE5aDgwbFpjR2FrNmVoMXl0?=
 =?utf-8?B?K3FRSnhZSDdVdjg4T2h5aGJVL3NPMkV2cHVCbUpsN1F6UUlucEduNFhsMHht?=
 =?utf-8?B?b2lHVGxnbm9sN2hTK3pHcmR4WlpkbXVya1ZXYjhLQ21JR3lFa2k4RnBiMFZm?=
 =?utf-8?B?Nno3VFcrN1FybEY3UDVKbWxxaDV2cWtUajJWVUlpMUx4NkJGVXhhalZxdG0y?=
 =?utf-8?B?U1IxMXBabmlwRkRWNnZVNmMzVDZKdnNNcXN4Q0xmRFhzU0twbC8xaVpQZEIr?=
 =?utf-8?B?azJ5RjNMK0F0Zi9yRS9yY2N5VDVRZU9JR2JYcGRvQTZLRHo5ZTFrSnhhSzFS?=
 =?utf-8?B?dHh5aHVkUFJackt4WmVkM1luaHpMZnJMWjhMd3A4VjFGdDNFOWtTUGhlRkpT?=
 =?utf-8?B?aDUva2JvbVd2SEFJMkF4R3grY21vSWsrTDd6dTN3UXZDT1krTFhwemhwODdX?=
 =?utf-8?B?V0kxU0g5OGRyaFUyZERxZmFZMUFZaUlnVnU0SzNmdEVrdUZlcFl3aGwwZTBv?=
 =?utf-8?B?ZkZKNllQYjFBc2ZndzcrdDd2YkthcFRSOVhDVW1tQzBnZnpNSWVNKyttTE05?=
 =?utf-8?B?WksycDI3dEdCUHFwekZ2V0tGNzNkTUh6OSt3Tk5RbEpueFRjUnZoVGlNVDVN?=
 =?utf-8?B?ZGZ3UTY2Y3VmZGtCSFpBU0NQN2ErRE5Ka081T3FEaSs3amZxWkRHcVM5SSts?=
 =?utf-8?B?bHdCczd5YU1DbjFJWlpXWG1tUW05djB6RkQwTVc4N0loQytmRVNJVGZPRXQ2?=
 =?utf-8?B?QXkxSTBlMnZXcnlZT052TUV2Ulp3UlFjV09ndmVyWUdHWGVFTzFiclZJeGQw?=
 =?utf-8?B?bm5yQ0xvQy9HU3QrS3hwSE1vWW53TWZYSm5DblVOVXhtU1JNZmVoS2RhbENI?=
 =?utf-8?B?eTJGR0lEZFBvTFpoU0NweEljSmUyZkJaU2Q2bThVdm9pcGtnM3ZaWHR3dmJW?=
 =?utf-8?B?bVVYTTZMTFpZOFhhWGcwREpLUmZRbkFEak1jczN1SFk0VzJGeEJNVXRKUjA3?=
 =?utf-8?B?aG55ZS8vK2huc2ZmQ1dYOVBtRk9OOHdTRzFXVjFLV3ZEcHNtWkp6bW9xN0NS?=
 =?utf-8?Q?RubYa/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXBpQmtWQ094MGlydDVuakJsSVFzMUw5dUI5QkhpV3B3NWRTSHVCQWZiWTZF?=
 =?utf-8?B?S3dkZDlhY3Z4K3JIL3pHRy9JS0swd3RNQUdLZXVGeG1CdEY0dHN2WlhJT2F4?=
 =?utf-8?B?WExBSnByRmt4dCtZU1ZhdTQvWXVvZjhUalVBdFN6Wms1M3lVb0lDWmxiUG5Z?=
 =?utf-8?B?ZmVsdlB4S3J4TGphOGhuUGpockt6SXY4Y20valowQWhFM0huMXpUK1lOR2Fa?=
 =?utf-8?B?Z2ZEcnNFaDA4SlNuSm9INjJXbHd0UVFGaE1aeklDNTRldFpnTTN6LzNjY2tX?=
 =?utf-8?B?REZJMTJ5Q2dYWnBSNjhlVVkzSHlQSjhqNE9wQTl0YktKdm4xU2ovdE9DYjZI?=
 =?utf-8?B?RzkySml4MVpvQmZPWm5lcHgzYStuWk1rOTUwcHdlWGNoYTgxOG1HN0t6MSto?=
 =?utf-8?B?amR5YjRJSGZiZC8zQjdjck9ZemNCVjF6OHovMXdPa29GajhUaTdhaTVlM2Ev?=
 =?utf-8?B?K3llZHIwV1JQS0FzODBjZVpXUDZmLzdpQVJXSkxyNkFualBiVURTMVE4UkdK?=
 =?utf-8?B?bHR4L2VPNk1sdVdnM0VhTCtUSUZ4MGNmQzFRUG9tbEx4TTlyQmVraU1RcXZP?=
 =?utf-8?B?L3UxYW4xdHRtc2xZT2JRajd5NlFIb2JMb2NoaDRqS0RZZTUxWCtrWHg1ejMy?=
 =?utf-8?B?aUt5VWJEbFBUQnZjcUtFZkNxdThJWTlYS3R4aUVER2JCNGVKR0JUNWtLa3hV?=
 =?utf-8?B?UTlnZ3dUUmFrTENMeWZ2V1QvUiszQk5id2c0MnE1RUNuOG5PNHFEUUliMjVu?=
 =?utf-8?B?ZmFpU1NjZXRkYmFSelREY2NJOWJrRnZMNlczLzFPL0hOaG5oNDdFd0tuSGoz?=
 =?utf-8?B?VU16OWd1OEM5ZWlXL2UyZTN4bUlkQlpFdFJ2c1VHc3FnNUo3VmJ0alVOWGxK?=
 =?utf-8?B?OEVXcHBqcy9Lc1NTMkhvSEx4cEFLSk9wa3BBaFlzTS83Nmx5d0JCOWl2aGdD?=
 =?utf-8?B?S2VZUXY1clBhSHM3RURDaEJJb2NuTElWdmQ2aERTckJLTk5Eb0hWSFN4N3BH?=
 =?utf-8?B?dnZmNHkwbjZyeWdrRHZYeThXemtuU29hcERRVGN6cFQxdHZOZ3BLTENPQzFs?=
 =?utf-8?B?TDQwYm9uYkVycmdLZy9JRDRLK3RHVFI4SWp1eUM1aWhUM1I3ZUdWUkVSN0t5?=
 =?utf-8?B?b1BoTmtlNUVEMFc0YjNtTmhGSmdFaUxJTi9pSnp2NjZyaGk2bUlXMENpNjZ3?=
 =?utf-8?B?UkZOb2NUSkJyeUxvNUYzS1c5djF0OU80NTNIWFJzSE1PVTdRS1pVNnFBZnpx?=
 =?utf-8?B?eTBxdlBmMHY0aG5GRVhDbHR0eW0rU0VxVS9qTVZZbFNnaWFJSmVHSTVhL2RZ?=
 =?utf-8?B?SWt0WVFHKzlMZk1KVG85eWxIRVFWV0tIZTZ6bjJscDNpb3lqSGRuTFlyU2cx?=
 =?utf-8?B?aVE4OTBWSGQ3NzNsclFNK2w2cXRCTHNSK3UxVTZSUnM3MXprRmhOQkFBdXBM?=
 =?utf-8?B?VXdaK1dKaXNWVUF4VWlHdWxLTlU3RDNqL3hmSHU2aWo0dHFDK2g5cWFvRmFj?=
 =?utf-8?B?N0hLbXhpaE5ncEFxMDFTa2phQlhKVGxyYUVSMnNySG5HSlY1Qy9iREI4RG54?=
 =?utf-8?B?anJDZHlVRzRaUkhINytWbWZmRVBIMjJ3cUg2SFBOSURrNXJnYWRxZ0NSQmIx?=
 =?utf-8?B?aCtJQTR0cHhsTUt6ZWRwRmtlMVdkV2dJLzBGMzVPdG1yWEZNV2wzckFjWVh5?=
 =?utf-8?B?SnRUbm9Xalk0UmE3L2FRU3QyNW1mTG54bXV1c1owaDFkV1JSTGpRS1JPczZ3?=
 =?utf-8?B?eXhxbU51VUpTTzBlaGpBTXh5UGhOQUlIL1FyWG9JWUxxcFdzYzJ4YzNuQVVM?=
 =?utf-8?B?VktFNFRWaVNlSlJndEFYUmdWSVVLVVNQTlBpUk9hZVRkWDBNM2lhL1YrSTFs?=
 =?utf-8?B?QTZzRlZRbU9hV0xVTUdUYyt3alY1bzBDUXY4OVA0Y2JwTDR6Ynk1WXF4SzBz?=
 =?utf-8?B?b1FnclN3WXBVZm9Kd0ZDamVydUw1N1Z3UVZ0VW0zUjZyMCtoSU15eFN5VjBs?=
 =?utf-8?B?NHdRK09RUDZtKzJwenIrSlcrT0dXSEMwV2h0eXh2ai9KNExZRDhPeGhQM3JT?=
 =?utf-8?B?QmRBc1daRDlrdHhFTjNTY1VvTUt6dVlsYUpiV3dpcm9rUkR2dWVNWmttVm4w?=
 =?utf-8?Q?Jas+cjyUqPdcIrhHoGCjsvXA1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A090A57DD3C3E14A9F7E6FB22DB07F03@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	79W1Le81EQsCm99d6gumPzOLiEmXvsInMj1aymhCNbsfXj1cIcruOUBFSKTVkYNL9I5E4/VapnH9A/jbBrL0cQ3+g2S0sjW9n1SIyeYLMiDMx53Qx0a5FQLchCEn9T3yhfqEeNQ2QzlOjtFwWdXJmxZXHlJxllQEW+nmtB4DnzSFkhaqcKqgByxFwhPfudiJh3BEOX2GQE+Yhm+Zbt92GEpGOkC0SpB+VVqRzggzHZCdxCQc2qdrPvRdLEj2GWRL80QeOu1D7lcrnRNoAIWY0izgLGV5GL2gDx4HltcsHV9AXPvMUQ7CdxnD953oqEja4RYnzstNa2GV3BUf+S0TWOxX4qRM2ozKT/Q3OL8uVKfsx2OLWidGeEDFz4mIX7nGXE35Di6qVyPGLI8IIkOJgQlJAbcBgHKD7CLqsiI6YsH5Lrpm8g9BMXWToggZJLFYhMzS4NSiqsSydp+uLpfuFa+mKeAC+nCRK81mnseQaGv/wOs5Vt0xp68iBQ7SqMGxjnuN7bGz0KmJDx0sGF9DTxiGaIjiUndroZkK94jme+vKmGkxB5BlP2r7XL0n6H8f7Ld2pYXzlWSty1r9uo5CifuBxvtKnWKyYVQmhyARc9f1xB/SISfN+B8tYpY5qourW4M6WUcFhRf5O4EGsq64lg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594fe951-7c19-4b3f-ec83-08de1e3eb450
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 20:46:19.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8xHnurqPUdd8egp4huLxUu+fAxa2KcG7RFqN0pkcrx5EauALEWLxYBDrpDffScXPtONDMP/ecYejr3L9QH5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6793
X-Authority-Analysis: v=2.4 cv=TubrRTXh c=1 sm=1 tr=0 ts=690e5aa2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=QyXUC8HyAAAA:8
 a=CHz3s4ZTwFXatohXrlsA:9 a=QEXdDO2ut3YA:10 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: hVMiqPSmufEzSSxgvijuiWI4j-rEfsxa
X-Proofpoint-GUID: hVMiqPSmufEzSSxgvijuiWI4j-rEfsxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE3MSBTYWx0ZWRfX1BgQhiJt1h+M
 n8NsIHPB8RJ45Jpvy8BKA2eIJv4tF0ouJ1WJFVqxrd2o/uH3+HRxI5FKFn1o8szm+983pDb37/J
 jBYxcyn1e7gObzSTRv30/sGMjTyFPIKsfvGeRBCYOqqbOSLqzAPn8qrAnr8HzyBS/TQ5m+O45YC
 6pgrYNx7iWwJMM9+ZwS+MafBekUfJoENFS9IAuPEF2EW7aABqCluDbDS8SXQIryNWlWkK1Vsylr
 eUhCvD97QcQ/5Ds8luT5TnwO7FyRITG3ohdq8Jc1DohzeaUGeN+h10EDHOal+0ZqWd8MXmanM2H
 TUD2YI2dA7rGlf8cz6NqI+AGXK4PIT78Y0Kz9LMek/0izZPaYHEv3nZwRql7ElIuLxmTjoPjtlT
 Egzzfl3Lo2mOh0+aRt340i048FrYPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511070171

SGksDQoNCk9uIEZyaSwgTm92IDA3LCAyMDI1LCBIZWlra2kgS3JvZ2VydXMgd3JvdGU6DQo+IFRo
ZSBQQ0kgZGV2aWNlIElEcyB3ZXJlIG9yZ2FuaXNlZCBiYXNlZCBvbiB0aGUgSW50ZWwNCj4gYXJj
aGl0ZWN0dXJlIGdlbmVyYXRpb24gaW4gbW9zdCBjYXNlcywgYnV0IG5vdCB3aXRoIGV2ZXJ5DQo+
IElELiBUaGF0IGxlZnQgdGhlIGRldmljZSBJRCB0YWJsZSB3aXRoIG5vIHJlYWwgb3JkZXIuDQo+
IFNvcnRpbmcgdGhlIHRhYmxlIGJhc2VkIG9uIHRoZSBkZXZpY2UgSUQuDQo+IA0KPiBTdWdnZXN0
ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29t
Pg0KPiAtLS0NCj4gSGksDQo+IA0KPiBJJ20gc2VuZGluZyB0aGlzIGFzIGEgZm9sbG93dXAgdG8g
dGhlIE5vdmEgTGFrZSBJRCBwYXRjaCwgc28gdGhhdCBJRA0KPiBpcyBhbHNvIHNvcnRlZCBiZWxv
dy4gTGV0IG1lIGtub3cgaWYgeW91IHByZWZlciB0aGF0IHdlIGRvIHRoaXMgdGhlDQo+IG90aGVy
IHdheSBhcm91bmQgLSBmaXJzdCBzb3J0LCB0aGVuIGFkZCB0aGUgbmV3IGRldmljZSBJRC4NCj4g
DQo+IHRoYW5rcywNCg0KVGhpcyBsb29rcyBuaWNlciBub3cgdGhhdCBpdCdzIHNvcnRlZC4gVGhh
bmtzIGZvciBwYXRjaCENCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5
bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==

