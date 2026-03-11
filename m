Return-Path: <linux-usb+bounces-34612-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPDML0zBsWkwFAAAu9opvQ
	(envelope-from <linux-usb+bounces-34612-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:23:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1CB2693FB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF6B331544B2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E1D3191D8;
	Wed, 11 Mar 2026 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iNbJ3Ary";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lwJjuM4K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e7pzjf8W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244E30FF30;
	Wed, 11 Mar 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256925; cv=fail; b=nHBVM0MUPNvbiqOPGYOnRG8a4uSKL0syqwJegLt2vO2mkAPrRXFNx/Ww1HsUFNuojwJTSncquF0VlEj81c7VMUi0WdIjmpLbO7FRaR3XlI6F1xoQ8a+jTrnTBEOrue+hkYepASM9Vcb44056G1+Qu2qmCzsLiFaXTZtfXRmY4H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256925; c=relaxed/simple;
	bh=v23bbkgpy+9gKYPy4LWzDDfUNEiBBhEfgg4pDG+Tff0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JisskQXcTKsYwrdeyOtDjdCLAuXGiaBVD52n7xG23XT2R77XgLIvtmN19zYreBp2pPThbqXoRGrOH0XMFtL9gnrif7Yuk9mxQPRR9T2YH/Y63MAPmhkRptpZ5YtT6ikpzrYCIYJt5eXHo1j0E88NWyUMlUBVPAwHY2pqJtCIifA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iNbJ3Ary; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lwJjuM4K; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e7pzjf8W reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BIuR9f2352746;
	Wed, 11 Mar 2026 12:21:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=v23bbkgpy+9gKYPy4LWzDDfUNEiBBhEfgg4pDG+Tff0=; b=
	iNbJ3Aryi18DUKjBKFL+IbmpkKShtMzZqwBh5xUQQSjlgjRnVTfqsojKm5PbCugZ
	Cu+2n3h8AInsM6aKonDg/CacOi1VW/pnP+gDyiBu8eH8C8YB6MhfWpNdYJtKhZNn
	JRRbx21uRFmMYH5XlkPg3Go3fgPpvJYSsKpPZCnBT/jVz334UOf+nKRpH5Ouwyzl
	B4EM68x2ywU4+NnxjOocNTsCoOQA5+7t1hMkHptmg4VqVD6L4sg6Fuhrk1Qcpqx8
	S9Y/hoUpOl2Gt8yMSRTNEC9C/sjubQl+eQMy1q9E1gJ3xE9AREYewKEhhr9JPB+v
	L16qr1VHlO16cbpBm964Eg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cue4605vy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773256895; bh=v23bbkgpy+9gKYPy4LWzDDfUNEiBBhEfgg4pDG+Tff0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lwJjuM4Kv/8RDQWSg0bUKfgdTTwXbpEr4byvAdhFiw8fqy5qj+mdqT69WoiDV/lqy
	 W/+GzBgUSh3+ztdLDCR3nv4coXQnVnGsazAqgiblNcboG0YXTQgOnSttggKD2NQHUt
	 RGmI12vsexxK4/owfP4JkJ4aI+bZJ0WOVrogkcbrZ5sGRTNQFg8RGOKhYxXZiVjvDR
	 LAm2Mw4bQwv7oh2dbHV5cC6Ls0FUO+CpFHjCtffqdXyMaKGoCnUkL4wBMnKEwLZcwb
	 Bbo0tUnNMPNc7dyL2M/iHvzpOzJ0JrTpP/d4yM1AJEfxnE3HVEHy0JK8KySNpviaNw
	 6ckDUKNeHdbXg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56BEA402B2;
	Wed, 11 Mar 2026 19:21:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1BD4DA0063;
	Wed, 11 Mar 2026 19:21:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=e7pzjf8W;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00107.outbound.protection.outlook.com [40.93.4.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C666940533;
	Wed, 11 Mar 2026 19:21:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRgg/YUsk99K/hoxV0BxszZMQy6g3RcpzBREOb8zU+m+8L62htj/ekzrFxc9E8GxdyA+kI3mgq5TRT1rz4m4ejK/fWsAewzC98VLPGnbvBZnEGCm8lixmSRZLtCaJxvmdX6WTT9q8esrSoB01L6/TbkloK+gAkuI0GCQ6vmVdKHQQ5up5rF6JQ4GVFFv2Xo1FWedcI1MZ2iB1YaRtXqSm5QV9XhiYmY3EMWsqFMJjpmQfcuusxNaAzXEtJR/qgfMsLtYtpWMqh0QjijCCTocjgGizGONarbIpcTJTDk8ed6WWKNP6UqqG16I3c3dMbJgi4D3O3Qa7cJIt+cQdj4utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v23bbkgpy+9gKYPy4LWzDDfUNEiBBhEfgg4pDG+Tff0=;
 b=SltQoq7lkMeRUysw8e8xmyHqGzshCVEOmBVPritrhm9DRyjikWyH4gDFbxss/qqchWO+4qmNFnnfTr+DY2e9X6C0pHt8qKfS2EDj0vhRExmuUqygFJVTRHGfFJBu43mnvUruWOnJ1yPtXJMQMZd3s6BvDCR5xn4OT9b/iWI73PWcuJTWrTt6b/o//xKDYFze3U0q/jcuw+btMz8NcBU/P/Psx4/08K0B/oncTiHF+K++GZdTmkspCigWlc22WWaHBPnzczFfZvPRgHIvWzxqBWtG9FALFlw16j4dzU31eozxoSubCTXjaM1HW0hgbiNCQ2O3bG/S1p+PmlgyQQZXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v23bbkgpy+9gKYPy4LWzDDfUNEiBBhEfgg4pDG+Tff0=;
 b=e7pzjf8Wkjpiel0FgPBh3e5ONBj5KeBprzRDLBZJhgMYfOvImRsZBJQ/uaFH+z769IZwCix90KSLQrJUYzDy0FPuu9JYNKVv92b6b3uh//0mQxkOMEO2A5llFXrxltorKtH7f6Y/nFuFu+jAN9c0E9u1bfDwXQwE1D2L3dQRRxk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 19:21:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 19:21:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Johan Hovold <johan@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: grumpy DWC3+UCSI, usb-role-switch semantics
Thread-Topic: grumpy DWC3+UCSI, usb-role-switch semantics
Thread-Index: AQHcsVQ5avbxwV9e70qm5RMQkhVPMbWptdAA
Date: Wed, 11 Mar 2026 19:21:23 +0000
Message-ID: <20260311192118.hpf6nujgikytngvl@synopsys.com>
References: <8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com>
In-Reply-To: <8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8078:EE_
x-ms-office365-filtering-correlation-id: 78a94542-40cc-4194-af0d-08de7fa36262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 SpO5wxF+O5IoocUpjshqPcPQVJIqf6UCp7XNgSoOEHtm1E4T3QD3Eyf46CZmxfHHMaqSQpwdRx45QlhOup3ofyBwh0TSXyRRtoiL4LljybWXc1skP+FZ/fmKltqQTsQnTfKdvi0y4lFtUPvRVHCEn2Kgl6xPF7CiE3ZEc7c4ycIsfOezy57DINHV7usp/x+9grh+DYhnJE24M5j24HuejU0mKhMpFPzJm6SBvGvGwdIgUFg2X29IuEcGx5Wf2PUQTPmlIaft7JPsRiA7TZJG8FJPhhZQn8f/Hw9p7C5QksO8nIWNo55Q2F3n7MAZCmhsMiF/5RzHH9vKKs+N5jfBtgV0u8FT/eld73m7NRBSdYfEctbbMTetOBqykTn8jlC5ip3kKEF+U06i3I2Qg72noi5SjEOsEK/g6d8CQkEEp5h+oo6CIw70aNAJRG1t6s9X99WZHtmMWPfTp65NW9vCDqzJCueKDvvGRYAjQUdq5HmFRA0GvdfXPMS08vVPa5OIGZ57VDZRaeOiUge5WbIUTGS6hSr0btJLU9WEtRRr1uUMdrpj88+RdohkOsZ/yFlV1aJlibZQo0o+R0GhPz3DCJdI+dj5RTD4gDHlL8h9lPmTp6wZqp9xvGudcIkOBitvZUIrU9s7mgWjpUfvwm0jbT12cya+tAminzba3IIZ8ilu9aGKP3hvaspOGuHqAbPPIytU3esZxzKMHN9ELTOdG0tFz4meFroQThgfnxaQ/YusWqb4E4tXPuc6kerdcGaWZzkxkgDumCDdLk+A1SiLhaCPT7Bz9LHfUUPBmAomPdE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFJOODNQbFdobHY2Z3ZLU2gwVjlDcXpxS1ljRGpIK2dxUjhNUFptRkJ4N3Iz?=
 =?utf-8?B?cW1VUzBNQ3U5bXVzdGxaVXpnR09LbDRqQ2M0eHV6aGt6dENuWkFYdXFtV0Mr?=
 =?utf-8?B?UDlEc3RTMFZLSzJYaGwrVDRkQUtBL3MvdHVkODBhYWQvWlM0L21nL2xlZW8r?=
 =?utf-8?B?R05aZ0tidittbmlCaHcxbnlwc1JPVVlnUDlPZFphRmVyd29mZHFuZXlwb3Iv?=
 =?utf-8?B?QVBBR1JRcU9MVG5CSDJKaHB6Y0R5dytqYnlWV1RhTHJLNW5jRmVjMlRLVmsz?=
 =?utf-8?B?MnFURkdDVmhPZXI4Wlg2ZEFaR0h1ZkozakJ1SU5iMTNzaVk2dmlLc0d2T2Fk?=
 =?utf-8?B?N1BvbldJNk8wT0JpUU9IUWI5b0FWMHk1emtCVnh2WGxQWWlVRE9uYmMwN2Jw?=
 =?utf-8?B?ZGhuSmh3WE1QdW5ieW1hSThqbHZON0VKUHpFRmxZL0pkV3hINTBkKzVDUk85?=
 =?utf-8?B?WUd0YWxaU0V0WENwUzVxY2E0OFZoVUg4RjlpTE1BL1h6UmhOZVA0WFZlVU5M?=
 =?utf-8?B?OXAzck1IQ3B2Q01vd2ViWFJFTHMybS85azVvQmZaQmJQdHdCV09TTGhxOXIy?=
 =?utf-8?B?R0szUXloL0JyaTBvcG5ObjVqTGQ4eDJEeW1nQVJUb3BZenV6ZFJsaHJVKzBV?=
 =?utf-8?B?M2xvejFYc2c3MVhSTHdwSlhyckJHK28yVVcrSWY5M1RUWnlicm5CZ0xpZDFF?=
 =?utf-8?B?L1F2bHhWS3JKZXFLOXpXZ1RVRTZGZU9WRktsdHpBVXo1L3l2eHhxMm85bEg2?=
 =?utf-8?B?Vk9hY0ZRcmdkbExMTGRaWDFHNlpuNlBYRDFZUk0rTVB0dVF2NUNTR0FFeG1X?=
 =?utf-8?B?eUw2em9QZnNGa0VLK0lDdEtHMkxsLzlwR0Fka1JLVDhrWGZKMmJnTlVqRUt2?=
 =?utf-8?B?T2NWK1ZDK2tCb3psNzdSQWtYQVZOM2FBMUhBNmtBWkxuREhHcmZPTU8vcUdR?=
 =?utf-8?B?dm9vdkY5SzU1anQ1NUEwUGpSRGg2cEgzQXUvVUVTaGl3V1pieHFyUFZxTkFr?=
 =?utf-8?B?RHB1QUhMSTZSanBVb2g4TjZkcklBYUo4ZTBETmZEUkpPbS9RaStNV0lHTm9o?=
 =?utf-8?B?a3hjSUlheEEyOFRmekxVK0N1UDBCWkFtalJTd3ZvazljNEJGaUhpMmI3VUYw?=
 =?utf-8?B?a05GTk0rSU5qZVBFRHhjbXFxMjZTalIzTFNxYnNlQmswUnpIbHd3K2hkU3ZY?=
 =?utf-8?B?cEptZTZnMWdyT3phM05zT3FYRE40aVlpcm4xZUxUSjJwMnVwNjNsYkdhMHlt?=
 =?utf-8?B?K3VRMjF4akNGM3BISkVtZEh1MGtLQTlKQ0ZiUW8xckdQb2dRa3NndnE1OWVD?=
 =?utf-8?B?bTNya2U2Ukh4eHE4SlFpN09vSTZxNm12Wmw5cVRPUFkwcE55QzUxSGM2SDZo?=
 =?utf-8?B?cFFpOGphQnlWZFVSNDFudm9PcUR6VGpscHkxV3FzOW4vSUtscVZaU3U3WEhS?=
 =?utf-8?B?M28vaDBKckpWUW9MUjUvTXhuZ29YQllzYXF4NVFUM3JNdDVIb0dGa1FRbWFB?=
 =?utf-8?B?dmVmNXpaQnlPRnBQZFBETE9KUHFTOUJtNGUzc2dnNG5GUGN4dWE0VTFWazRu?=
 =?utf-8?B?d3NIYWw5Um45Wi9WdkNLZjByamIwWU5iWGxaSHA2NWNDU1htZGJqVnV5cXNm?=
 =?utf-8?B?alZRWkxGdXB2UFhIS1NLRkoxbUExRmI0NnQ4OHIwSWdCTEZmdlNXM05ORnlX?=
 =?utf-8?B?ZGZzV2twVDNwaVIraW9vRE1IRkExYzZnTExJTDR2SlNoZjlaaWl0SHZTNjZO?=
 =?utf-8?B?YzUzUlNkOVVCaS9wRVByZVBkNFZIeWNMOVg5RUh3RG5XTFFqSk83WU5JNmJs?=
 =?utf-8?B?cmNDc3psV1FPSWNkeUhVeXczdnpCWGg3VGpRNjRRcklPbFQ2bldjbGVncXJT?=
 =?utf-8?B?akkzUUZUdVpTblV1cHhpamlHUXkzSSt3bDY1V1d1K3J6WFdscWpZdWwzbXdJ?=
 =?utf-8?B?YzJ0azlDbDdxYTVBaFNPMkYzM3d2azJDeXplTFF3R210bWtRdlJSK1lTNFo4?=
 =?utf-8?B?ekpYWUdoSzZCR1dWZG5SS05mdDdvYmJtTTlacHJ0UTNvT0xBaDhVVURCK2ZW?=
 =?utf-8?B?SnJoSnZTSVlaZUgzQXpaQ3h4WkFORDRubXpEZXFMSGdpQy9OL0tmY05tbUVR?=
 =?utf-8?B?Y2NUWVpJNGxScnNUeXJZVkIyOVMvejZNUGhoUE9ucjFMOERYdFkwSHB3QlF3?=
 =?utf-8?B?eUl3aWR5c2IybXhicE15aUV4MXNFTUlZR1ZaUWQ2OVRHczloem1DVTVCOG1G?=
 =?utf-8?B?dFJ5UjVIdmJmaEhEUjdlajQ4dU40SFpmRFFZdzJLa0JMZ1l2bG9aUWF3dTdH?=
 =?utf-8?B?WnV3dElOMGQyaUVMUHNZTlQrUWxOUXk3NWpDeCtPTGNJV05FZVFMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF75B23AC8D22E40B5729F8F2F1F2AB7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	L29OYqhnNVCeaxK/NVzAQN5N4kG/PKxN8h7wYHO9dy/dnG2NK8tRgCzfrNvVMkkAyLRBODMymYiRGAYPT6XT4xBmmRvg0U8/eumV+Zq7zqf2YZRo8UyBwQj144nN2yrFUxFt6oIAsdnLz/FACk9L+bbfIpWDgU85RML8kw3xfK6xKFaScjSOWrITJjiG96II3hVlpSU4zSHi6xed86Pp4plQH48WBXx/ZPWrQJUEkXXr/ih0RSfFczobSODSEzHTCNi2m3dJWuxhELevthKlxXX+3hdI6ep6CdNVpv4xRQP1wqnKpkFdatFE0w/3zLQQNnw6Qs5Qpmk8ZLfJS0ulQg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YggTFhjFMT+WthLslVpwxCvR8j4bEXEoocdM+PUVGSUqYKhoEQB5QKvUYuH3fV4BOYo8KKlzXhAj8Z8/IPJeR/OE9u6svSWiQOBQcvR89HYGV0MJCvrHt5fIWFUN58sA7ksLt8wy4gHX48VpNQiVV4Yy+W/wGxZ2dDMvn82asTVa6Wl+PY772eNm3IPVPTRBJNQv0VRZLwpYWlE3OcQ/VTFXMKasaYOFaKQoVnFEFjhyxFPx3Ron3zBcGNRHHYLrxXXuWchx1zsgck+qdMENVeDtPqENZl6BJNCt5+BZPhuZ6BPD4Ox9RP+m9f12buT9oScC1ZCg2u2AHjas2CRwzoVvptwKA7+Ek9XBnGP9RoHCgAB4PDQLOd8MNqRIHTNFaQUmLYUPFPMA8EYHwj+OaOqbgavP8wWNCMCok5QhL40V70y+LJdZ/CzAuUQIjHv3js0IXWi89Y/v/gOiVmdlY2GRDXIj9cYaYg3ZLuhxdWU/KJThQjEpG5/JVu2vJ2Nd+a2i4bhP3Pdy53B9mHg2Qs4YRPOVDNsxWuEgHL7jXC4B/hBVWKBLI+RMN5h+4hXXK5i0Z4Djg77Wdi10PO9VEkSesiD+HwKm4Un4UisKp1+tHI3RPDD3sVuP3h+qzWZTkcY0tuSkb9Y/wVv7WAQx2A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a94542-40cc-4194-af0d-08de7fa36262
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 19:21:23.9645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/xH3VuTQNcRUtcJNp3nAEpJP6HLntmsEmPZqQqnpaRfUe6ciPMVl9qctLzA034bXauKsVl7Sfg38sYVnOvz1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
X-Authority-Analysis: v=2.4 cv=fJA0HJae c=1 sm=1 tr=0 ts=69b1c0bf cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=fDU5m9OU-pYm6RBVWXkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE2MyBTYWx0ZWRfX6maOR2EJrfoe
 3R+sYz1IRY39pLxmSD7sVhbF7C45xnGa82V4Fi109qGJzAiRXo/PotNIE8Ul36/z8KgmP4FrgN+
 wqMbxoL9kPlk4C3ySpEyVW3kj+IHUoR4bVfPiLWSUZxkoGMw85zbHVGpbWHTw/+53ECI82sgGwx
 G3ilCssW53GN/AH/87IS6S3+STuKU1bNVtUXarR7KPU/ymgls+YF/VmEcVp7aJwEBhQCJKh/YsT
 njEpNpahs0xFC/E2PlJ2qfsiis3NM2fxDN4QerrWVy26vJBlMFdwLhLGMtuCDfYOjhZfH0tFSmU
 ms3fWdq8DE4dOHByuDGTXhaiCjXffPOzd2HtXY8xt0C8yvZG/XLoNDqbjB+z5TcAoPXqG8RN3Yy
 L2T5wcVulRCklF/j09gHjMFTfbP1pHT/RLaNJ7xUipQOig8qtHD/xdFsCcE1h7X5RkbhxX+Yhpd
 YNkqRavji44FmVMTboA==
X-Proofpoint-GUID: DP8PXg7rax-eAUyzx49h6snz6fzbRI8q
X-Proofpoint-ORIG-GUID: DP8PXg7rax-eAUyzx49h6snz6fzbRI8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110163
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34612-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5B1CB2693FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEhpLA0KPiANCj4g
VGhlIGRlc2NyaXB0aW9uIGZvciB0aGUgdXNiLXJvbGUtc3dpdGNoIHByb3BlcnR5ICh1c2ItZHJk
LnlhbWwpIHN0YXRlczoNCj4gDQo+ICAgSW5kaWNhdGVzIHRoYXQgdGhlIGRldmljZSBpcyBjYXBh
YmxlIG9mIGFzc2lnbmluZyB0aGUgVVNCIGRhdGEgcm9sZQ0KPiAgIChVU0IgaG9zdCBvciBVU0Ig
ZGV2aWNlKSBmb3IgYSBnaXZlbiBVU0IgY29ubmVjdG9yLCBzdWNoIGFzIFR5cGUtQywNCj4gICBU
eXBlLUIobWljcm8pLiBTZWUgY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbC4NCj4gDQo+IFRo
YXQgdG8gbWUgc291bmRzIGxpa2UgYSBkZXNjcmlwdGlvbiBvZiB0aGUgY2FwYWJpbGl0eSBvZiB0
aGUgb24tU29DDQo+IGNvbnRyb2xsZXIgKGkuZS4gc2hvdWxkL2NvdWxkIGJlIHNldCByZWdhcmRs
ZXNzIG9mIGRldmljZSBzcGVjaWZpY3MpLA0KDQpUaGF0IHByb3BlcnR5IGRlc2NyaXB0aW9uIGlz
IG1pc2xlYWRpbmcuIFdlIGVuYWJsZSB0aGlzIHByb3BlcnR5IGlmIHdlDQp3YW50IHRvIHVzZSB0
aGUgdXNiIHJvbGUtc3dpdGNoIGZyYW1ld29yay4gVGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRo
DQp0aGUgaGFyZHdhcmUgY2FwYWJpbGl0eS4gVGhlIGRlc2NyaXB0aW9uIHNob3VsZCBjb3JyZXNw
b25kIG1vcmUgY2xvc2VseQ0KdG8gaXRzIGNoYW5nZSBsb2c6DQoNCjQ1MWQxNWExNzMxYyAoImR0
LWJpbmRpbmc6IHVzYjogYWRkIHVzYi1yb2xlLXN3aXRjaCBwcm9wZXJ0eSIpDQoNCj4gaG93ZXZl
ciBpbiB0aGlzIGNvbmZpZ3VyYXRpb246DQo+IA0KPiAmdXNiIHsNCj4gCWRyX21vZGUgPSAiaG9z
dCI7DQo+IAl1c2Itcm9sZS1zd2l0Y2g7DQo+IH07DQo+IA0KPiB0aGUgcm9sZSBzd2l0Y2ggZGV2
aWNlIGlzIG5ldmVyIHJlZ2lzdGVyZWQgb24gZGV2aWNlcyB3aXRoIGEgRFdDMw0KPiBjb250cm9s
bGVyLCBzaW5jZSB0aGF0J3MgaGFuZGxlZCBpbiBkd2MzX2RyZF9pbml0KCksIHdoaWNoIGlzIG9u
bHkgY2FsbGVkDQo+IGlmIGRyX21vZGUgPSAib3RnIiAob3IgYWJzZW50IHNpbmNlIG90ZyBpcyB0
aGUgZGVmYXVsdCkuDQo+IA0KPiANCj4gVGhpcyBub3RhYmx5IGNhdXNlczoNCj4gDQo+IHVjc2lf
aW5pdCgpDQo+ICAtPiB1Y3NpX3JlZ2lzdGVyX3BvcnQoKQ0KPiAgICAgLT4gZndub2RlX3VzYl9y
b2xlX3N3aXRjaF9nZXQoKQ0KPiANCj4gdG8gbG9vcCBpbiAtRVBST0JFX0RFRkVSLCBzaW5jZSB0
aGUgJ3VzYi1yb2xlLXN3aXRjaCcgcHJvcGVydHkgaXMgcHJlc2VudA0KPiBvbiB0aGUgY29ubmVj
dGVkIERXQzMgY29yZSwgYnV0IHRoZSByb2xlc3cgZGV2aWNlIGlzIG5ldmVyIHJlZ2lzdGVyZWQu
DQo+IA0KPiBOb3csIGl0IHNlZW1zIGxpa2UgZGlmZmVyZW50IGRyaXZlcnMgZG8gdGhpcyBkaWZm
ZXJlbnRseSwgZS5nLiBEV0MyIHNlZW1zDQo+IHRvIGFsd2F5cyByZWdpc3RlciBhIHJvbGVzdy4N
Cj4gDQo+IA0KPiBIb3cgc2hvdWxkIHdlIHRhY2tsZSB0aGlzPw0KPiANCj4gRldJVyBJJ2QgcHJl
ZmVyIChmb3IgbWFpbnRhaW5hYmlsaXR5IHJlYXNvbnMpIHRvIG5vdCBoYXZlIHRvIHNldC9yZW1v
dmUNCj4gJ3VzYi1yb2xlLXN3aXRjaCcgc2VwYXJhdGVseSBmb3IgZWFjaCBib2FyZCwgZGVwZW5k
aW5nIG9uIHdoZXRoZXIgd2hhdGV2ZXIgaXMNCj4gYXQgdGhlIG90aGVyIGVuZCBvZiB0aGUgVVNC
IGNhYmxlcyBpcyByb2xlc3ctY2FwYWJsZSAoc2luY2UgYWdhaW4sIHRoZSBjb250cm9sbGVyDQoN
CldlIHNob3VsZG4ndCBkbyB0aGF0LiBUaGUgdXNiLXJvbGUtc3dpdGNoIGNhbm5vdCBqdXN0IGJl
IGluZmVycmVkIGZyb20NCnRoZSBkcl9tb2RlLiBUaGUgdXNlIG9mIHRoZSB1c2Igcm9sZS1zd2l0
Y2ggZnJhbWV3b3JrIG5lZWRzIHRvIGJlDQpzcGVjaWZpZWQgYnkgdGhlIHVzZXIuIEZvciBleGFt
cGxlLCBmb3IgdGhpcyBwYXJ0aWN1bGFyIHNjZW5hcmlvIHlvdQ0KbWVudGlvbmVkLCB0aGUgVUNT
SSBleHBlY3RzIHRoZSByb2xlLXN3aXRjaCBoYW5kbGUuIFRoZSBkd2MzIGRyaXZlcg0Kd291bGRu
J3Qga25vdyB0aGF0IHdpdGhvdXQgdGhlIHVzYi1yb2xlLXN3aXRjaCBwcm9wZXJ0eS4gTm90IGV2
ZXJ5IGRyZA0KcGxhdGZvcm0gdXNlcyB0aGUgdXNiIHJvbGUtc3dpdGNoIGZyYW1ld29yayBmb3Ig
cm9sZSBzd2l0Y2hpbmcuDQoNCj4gaXRzZWxmIGlzKSwgYnV0IGlmIHdlIGdvIHRoYXQgcm91dGUs
IEknZCByZXF1ZXN0IHRoYXQgd2UgZXhwbGljaXRseSBmb3JiaWQgdGhlDQo+IGNvbWJpbmF0aW9u
IG9mIHVzYi1yb2xlLXN3aXRjaCAmJiBkcl9tb2RlPWhvc3QvcGVyaXBoZXJhbCBpbiBiaW5kaW5n
cywgc28gdGhhdA0KPiB0aGUgY29tcHV0ZXIgeWVsbHMgYXQgbWUgaWYgSSBvdmVybG9vayB0aGF0
DQo+IA0KDQpUaGUgZHdjMyBkcml2ZXIgY2FuIGJlIHVwZGF0ZWQgdG8gcmVnaXN0ZXIgdGhlIHJv
bGUtc3dpdGNoIGRldmljZSBpZiB0aGUNCnVzYi1yb2xlLXN3aXRjaCBwcm9wZXJ0eSBpcyBzZXQu
IEFkZGl0aW9uYWxseSwgdGhlIHJvbGUtc3dpdGNoaW5nDQpjb25kaXRpb24gd291bGQgbmVlZCB0
byBiZSByZXZpc2VkIHRvIGVuc3VyZSBpdCBpcyBjb25zdHJhaW5lZCBieSB0aGUNCmRyX21vZGUu
DQoNCkl0J3MgYSBiaXQgb2RkIHRvIGJlIGluIGhvc3Qtb25seSBtb2RlIGJ1dCBhbHNvIG5lZWRz
IHRvIHVzZSB0aGUNCnJvbGUtc3dpdGNoIGZyYW1ld29yay4gSSBkb24ndCB0aGluayB0aGUgVUNT
SSBldmVuIHVzZXMgcm9sZS1zd2l0Y2gNCmdldF9yb2xlPyBJbiBhbnljYXNlLCB0aGUgY2hhbmdl
IHNob3VsZG4ndCBiZSBhbiBpc3N1ZS4NCg0KQlIsDQpUaGluaA==

