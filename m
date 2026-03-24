Return-Path: <linux-usb+bounces-35351-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH0jHMflwWkYXwQAu9opvQ
	(envelope-from <linux-usb+bounces-35351-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 02:15:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 153EF300651
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 02:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCC5730185D2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 01:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EBE26B2D7;
	Tue, 24 Mar 2026 01:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XaRVW8Nh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cfN9crty";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a96wa11A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4519B5A3
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 01:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314396; cv=fail; b=JSx4SARyC2GcGZdquzUp3XZpBmxNlBgAKkx3flGFS6kq5G/TlsuiVs4H18Z4GlTGMs/C4IELRMmzKekpy/ThUJYzYAnlul4PgNMzK0/yxWx8uD86q2m6XB3JBf2lN+6TBmVh9bPugxBdbvSiaBIRVzECIfW/iuTQwKCnfWSbmQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314396; c=relaxed/simple;
	bh=68n72CzAmRComzzgoQg6kuCM4OvWAc+/rbwZqEAr29w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nurYj2d9hVX6MbxADKJdMND4mD2b8lnaRvuliO1IooOz76jJ0zPdSfsRZPSmUXElI6wHIgTMMe5AiEUtDqc/hOENqXJ+QVC3F4vDc+HQYzzlGit7NDejEzIvheSKdlx+c9Fi1Bm0N+zdAE0opYBzjMAObW4yV8QGCPpT1gtp9P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XaRVW8Nh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cfN9crty; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a96wa11A reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O09w0D1852608;
	Mon, 23 Mar 2026 18:06:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfptdkimsnps; bh=LRtnNlp8wpF/QKF2fhitR
	DOERNssC6hUclZgGs5TvsE=; b=XaRVW8Nh7huXmXevcvKgMEptWiY604//szaI/
	vs+fmiDldKu7woIwTamvU6pJ8XvjFrlHqrpexSF3QkiUCsIF1w1oIaHIjB8u6rka
	IDtBysBypzDsdScCQtETkUfEFnj7lP3LnYJnqeow6/aoOQpy0WIrzrz2RnBikINW
	SEg60CcXTZ9c17y7sAFGHnxnZE+uyrw06ouXcxbceS3zM2RiOoZP6EsW6C7gpJzu
	Yve3NK+qUPleRxE9Wj0fDDjmKifya879swlHtGh7zC0lYtPAmfkBZpT1+GPdkcJR
	Cf4fuM9mtTpwjJKAfPI46gTvaBModw5Kpy6vcQQlia7Wqfnpw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d3303wn2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774314379; bh=68n72CzAmRComzzgoQg6kuCM4OvWAc+/rbwZqEAr29w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cfN9crtyO3+GEmKcf8TjyT5TjvbctrU/B4tp52LfIyDlooK5P7VCrTCNueCVXiqcE
	 vuwTXMrKek7EPtZXAzXMsi1st2UzWeENW0ua9SHIVE5eI1thmnpkLHdXDtuvYVtSqS
	 GtDzMThIt8rsXS10jhA2ju8wCjXrU2GgT5gKQBXMARU6JBHQm0V9ahZtfyalUKHLx4
	 lT8v9wvXtqAGvYU22SMP0ShL1Jt8Zzy1pxrsIJVMc/+0d98Kgy9c8wbODf6YNopbYV
	 cV5MqfPIlr6WQcSzQ2njypCf2UEKfTwrQmFYAq111Hdz41aMQ70W3sKriaRJwVuVbw
	 diuApH/UNDZIA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E8D1401CB;
	Tue, 24 Mar 2026 01:06:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5521CA006D;
	Tue, 24 Mar 2026 01:06:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=a96wa11A;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00107.outbound.protection.outlook.com [40.93.6.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 03E22402D4;
	Tue, 24 Mar 2026 01:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvAuoG22aF2cbkpfT77Cs28ey5ivxTd+LQPiz5LTvJaHj6kA6MFE3v+cZC9/vzbMw+qnE6vFy01lb7ogte0xYb8by3gIHomsveVY+SY7mAbEnt8bsna7APPp3hlebt2Ghw4lCgAaqQNeprTzGf2KM1gV9MTLuLn7DZ+kO7N1qVPslbLBangSF5e+kJ6tkH6zmV2gNO6m0AiLShif2fZ4ZDmc6YnGHlwWdkNHO6kyYGk1KjXFPBDYX7uC5pP+LhEN2x72bak5rjZugx4l6nZhiUz+41H/w1AuXblaq64NXl8UXhFDPEcGUFOOrIJIYd8V/7UPlLNhoWb1+V7Kp+yQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRtnNlp8wpF/QKF2fhitRDOERNssC6hUclZgGs5TvsE=;
 b=CyANN96Gpft0lnyATlym6L/BhQB1tdSgdiIJv8RAdQr4Mn9BNpJp3amUUTGNqGKgR/uA1AjBKGjigZd1gFhmE2mqcH+MBXh5HuOCfhwZ4bTuY7hBfyWpx0iK6MJzSmGxGNELwumxv2GzH9VLxtHAfRKWAD9YhOkiy10+FYSaYCB8jGrhSxGPkhaFiYgbg8YbIJ+oo4xQ4EnUAp2O/8xxPawNtKMyjWrEh5ZHWV1MpEbuZ1UgE4I1xQqR35tgAf3Oz1LkoMA1aGSc9IQ+kzP7SNH/RbFf+Vt6xIl69QgpCTc6mJlDNsTBKAuW3XdRTbsR/8jPumox4PibILMQu3YtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRtnNlp8wpF/QKF2fhitRDOERNssC6hUclZgGs5TvsE=;
 b=a96wa11AIoA4M7MU7umst4em6tCd87bW/q2Di01uJ4DrLfpOqjsMTt6MFLB6eUtNCpvO/W59saYDFxVxQLNNAfeluOmeRSTbZUNi3oZ4AWhSjfcVyWOWLazGGVJr8IgwwKwRWmyXB2PcV4cb2JS1UU896RIsEBt+jMWCZzzBsS0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:06:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 01:06:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Pecio <michal.pecio@gmail.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAACdBAIAAI98AgAFicgCAAR4GgIAApiGAgAOuMYCAAPVzgA==
Date: Tue, 24 Mar 2026 01:06:08 +0000
Message-ID: <20260324010523.3ufngdffak7ldchg@synopsys.com>
References: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
In-Reply-To: <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB6834:EE_
x-ms-office365-filtering-correlation-id: fae856bd-7c3f-4027-6930-08de8941883f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|6049299003|366016|4053099003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TakDg83OQm9ecxpvt+v8gRqcoSvZ4L4QB0qn++dkha0IFpT7eVzRBwqZ4PioTRN8TKIGerDchsKx0eIwiWjQ+mgZEdvl6cKpKvA+n0bqADQi/THiQ4r6NV4yzLsnryquzwPlY5hfOcH19hgShbj414X0wRk/rSOTmNbuzjeZywGG1ElOQhmMqSxXU5EPU2nmZTmEc1HyybQ3brBwgkkJvhLRsgrdOeZriA6C5YBXW17211AZIAffvmxa7T2pNDkZVLBllIORODVaUobXAOIxgmI2XikVWdCk7l12Q3h5ugXwUkQ9AnEoIc6FSmTeuV2uEjqVUtG4hr1gvmX3NmboBwdU7OZnTJ9t63Wj634+7XxVbv9xM3IS2J7292I9+qkoG8jf6ncJhn4oWK58aQfZrBQ1tXWvpJOH0L239Junkr2SkoDOHK62kwn+Mng8EfQg/Byhvyx/05V3X1sF+Uz7VMmGrZ1yyLlyoXsEw9iLLCxmo35mzQ781oVY3D5JsJ7GSZPBJ4AfVlC+Yqi2Tc/tTdIaa/fOT+uM8QcnC9MiXb0GRg28mWVisLD5p6j24iJswMBEc49/iMTaFgFGf8j1G/GxZGiIqq6zqToGBZUBnnPEH209Sbkqv1sHdT2d/kVwR/B3LUPWXUZT88cq/CgiNnkKRo4CxlgavOj4I7SmU7eNFZN7Qw6H5NAeDDQeCVV+kSXTRuPcx0fWJt7tIw11ARz5srzbmyyWNgt5CsOs/QY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(6049299003)(366016)(4053099003)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WldrZnR5UHN1eGYzRjVLSzBRL0RRb0doK0FLVktsWHdxN2RJYll1S1pEbklj?=
 =?utf-8?B?cE01VmVONS81cFN4TEIvTHZ2cFhtYzBSVDRaQk42eVNKWVF4cDhSVXVlQTBQ?=
 =?utf-8?B?bUxpYVNpbDZoTFVnbkVuTjVvT0UrelhBenpJNTdnNmpjZS9KcE16bHcrSFVl?=
 =?utf-8?B?aGdxWUdwWmRtOWplV0tPeFdJS2ljVTh4MjFyUGdtSXljLzZzaHB3UHIzc25D?=
 =?utf-8?B?N3VsZUxMUW1ZUkZXTzc3eTd5VnNNYjN2Mnk3REprMXlYVkdIUDVvNGRaZENv?=
 =?utf-8?B?d3BFaGdsQkVxejl1ak1SL2RZWHBrZmpPeW13QU13czdBR0xVUVEvcWN6QkY2?=
 =?utf-8?B?YS9oL2NmUDkrdlJNcnFnNm5LM2VzK25QQjh2QzZxVHljR3VrTlpKK1N6WEhU?=
 =?utf-8?B?RG8ya1UxenRUUGZPalMwSjMrc3pPZnVYL2UyMmdTekdtS21VREFad1g4Z1do?=
 =?utf-8?B?VEgrWGV3VFRNRWJCdi8rQzNNSUhTVVlkSzJyUGdOcnFFZnNsTysvVVBZWTIy?=
 =?utf-8?B?Ty94L2RXakg2STRsYm4yZkJwM2VtWlI3WWw1MU5lOWYzVFlTNUJPWm1wbmRz?=
 =?utf-8?B?VW1lNVkvaXR0RHNuL05YQlZVOVNiWm44azNFcGw1N0NaZy9ZaExlZWxHNjIz?=
 =?utf-8?B?ekU0N1I0MUh1RXdLS1FyL25XY2tER1BteVNmOUNyREtwdUVLZEMwcVNNMEFE?=
 =?utf-8?B?V2MxL0ZzRmpCMnJYRENjc1U1WEM1czBxRGllNm50ZUhPREZaVUVGQ0tTN3ZE?=
 =?utf-8?B?eUpRNzd6OW5NUW40cG1rTHJPRlNyOGlqQmR6STd6YUdOWWJOVXlTOVRtTHZN?=
 =?utf-8?B?OU94U042WlJyZFZ4T0YvNmpNNmQ5L1NDcjRMTWVnclVQSmxFaFJ6b0V0Z3Jt?=
 =?utf-8?B?MkFWU0xYQnYyelNrMFdvd0dlZWRnWWdXaDBkYmR6M1RNUzk3eFdDTWFpa1BH?=
 =?utf-8?B?RGhLT290MTBnY00xdlEzUlJUcWsyQkY2Z3IwSGZPcEtyTFMrV3B2NjhncFNi?=
 =?utf-8?B?Qnl2a002WSt5ZzNSUk1MaGJTZDVNSHFLaWhWei9Kajd4RGJoVDRlSkZzei92?=
 =?utf-8?B?NmtTUFBxMGtkOWs4MkZxWlhqU1A0T3B1dFBYOStUdU0xcjMrelJKcmVJcVU2?=
 =?utf-8?B?TFcwUzBNbm1tT1I0WnJYZ2xHZHdTWWljSkFIc3Z3T2dWTzhyTytRcURhT0E5?=
 =?utf-8?B?UjFsTkk5MFg5TnFYY2phTmgrWVJFVkZ1azNKc096Z3NlVnN6V3Fka0hTQjRv?=
 =?utf-8?B?aG0xQmRZZUpGWXVYU0ZzeGxzRDA5ZmhYUVhSell5M1VsQkZVMEIwMWJRdUVn?=
 =?utf-8?B?L01yc3UydTFhT0JZdWpFbXNyTnBka3NhWkZkbHdDbWp4ZFJ1SVJlN0VBdkRQ?=
 =?utf-8?B?TG0vcUlZYUk5UmpIUVd1NFZDb21YeVY4bDZXWWNmNWZLT1B4dDhFUjFEV3Qv?=
 =?utf-8?B?Rlo3ejFTVGkrVlV4K1BUbmNUUkhtUG5wbjJCMXdYanI0Tkl3Vm16RnJ4ckY4?=
 =?utf-8?B?QUx4NTRDenRYSFVYMGdHWDVQMG9ZSUJXZVBTcExLbzlBcndwTWdKVCtYRnB4?=
 =?utf-8?B?azBCZVdiVG16QVM4Tk5WM2RLNURqUlVHN2NTNWFKUXU1d2JtRVduQ2JmcS8y?=
 =?utf-8?B?VnVaN2Iva3JkSGJjU3JmeEQrUk90USt5NHVieXY4cXN4NVJlQnRBcFlBS0gy?=
 =?utf-8?B?NVhuUUNjVjdKTVpza3FocnNOSTFvbXVHOXJjUmZkZTJJNG90dlhBMExwek9N?=
 =?utf-8?B?UGJkRkhBWmZXL2JmOWZnMVhIc1dwUkg2TmxPdVNiNy9JUlJZSDNBd2p1d2p3?=
 =?utf-8?B?OThWVnZBY2RITzJVdFdqMFBiYi83OUpDK0tOT1BxVlcwRXltV09FY0ltZnJq?=
 =?utf-8?B?WmplaFpPSnFxNkRUdG53eitpRzl5WU1BMitHbVFRQVRqdyt1dld4N2Y0ZEkz?=
 =?utf-8?B?YlR5OGVVZ29ZR0k2QTIwMHp6K2l1RkdrL2ZUakEzVHR1V3dPRTl3TENPZU9h?=
 =?utf-8?B?NkJpWFB3OUlTZGlXczYzbmRaKzNKVDJaQ2NIL2V0NG5UTWluZ1BSbUowQnlz?=
 =?utf-8?B?cjJzTkM5K2d2Mk1ocDZmQXkyNXlzYmNyb2R6S3F4QUd3UVRyMGVNVGFJL3Yx?=
 =?utf-8?B?cFo1eTU3YUpCMldnUmYvMjIyNWF4d2JKN3VTcFZBMVlNTktCUEkyT0RTUHQx?=
 =?utf-8?B?WE9wUFEwa2pGNHcreExrYlQyK1N5ekNlYWFCcEVxcUFDYk41TTlvQW5DZ2d2?=
 =?utf-8?B?TENVY052TzRSaTMyaExreEdiYThCcjJSRFFQQnVWaDBSOTB2Kzc1TENHSUh6?=
 =?utf-8?B?ZmFqdXJjdDR5NE51V0V4UG0vaU9JTWNqS0pwelZuOE93dDI1TnRFdz09?=
Content-Type: multipart/mixed;
	boundary="_002_202603240105233ufngdffak7ldchgsynopsyscom_"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lkFoR6hHZzDtJu/b1TdUv5msfrbUMq2ac1zAs+bnMXJvU4Ce96Fz5qpxvSmffaGY8Uf9qzDQ7npXhRvcg8EoiHZOBh0RH54Yk93WHqLVzrJh+n+2nKOiZuoEGDskNCgGWNjVR4PtxTzKbpQr4n60Y5IkxOjTiL8ulXSlIsR7YReBKgEM3ebx3wNqC+nPDskmcC5DqX2o8u/D+avNr4y6oli3IqVj1QPpbP0WQUpkHXlp5ZiTTa9um46VwAkPkxIxWYnUmk1EsXkZUPUJWyADn1VgdkKx4693xNO5Vq2UpVHSj9YMmxf+il/NVHz3D6SYa4IRG8dHwXmz7pcI0NQ01A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CjhY4SvXhB4EuRwi2wSNhRrl8laMnuGW+/6rCz8wYutxtXOfBApaYtFx7R33xCeT7HlBFmbMW6lD1fHenh80gRbIhP8GN7YV/FV5kOJi+m39uXa9mSYta9C06F5zKeWp37z1Reftib3c6CKmkw8RHiGQB8cO6qYxAWQB15XERC3/G6CYtPH5eXId5Dl9dAkwc5GpIgLwH/6dWqzIhoGP0O56IWsKW6J03dxtsGnRDsOnGPRhd+xp4qofGJvpvhRsryxK9lHNJU7DMdmKV4k8KQ7rQ+ck8SA4pVM5IImLYY0k4ISt7h3QLh5ZfujY6wQeguUxm5BBt5nT/3wdM+j04v5B2mjIGSZZlmCoNFv7oqsoiobXZS3NXAeAIt7T/rv/4xdTSsfHClF8ocC9Cd0usrC/fqPWGU1Un/gcs2yiXoizLlh5Cgmci63rH1O0J2WfDlVpRPo1cjPOk3hUJnvA9KsfIBtsJcm+GUzgFPpP1rYT/LenI3iK3c7j5KrPrno5p8M6ITkhWa0cbmSliHmD9qaMxbSTGon9i/BIaiSG8LoWik6qCXg7NnRfSAyibbY2BKWS7Dw5DrMMS1bLnwlcg7RF2a/s+B5/+uEGcVAqJZcRiiZ87hMHNHDOLP914Fl/sz6ODDL2znmzGPWR7M/JHw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae856bd-7c3f-4027-6930-08de8941883f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 01:06:08.4698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6hsjIwEwsMgHMaDIh8yr7p5imN/3uZDGzskkBbUS2wqVaHt01kgFbfsTdNCWdKUNPMHih2tfZTLOjrH4cvXHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
X-Proofpoint-ORIG-GUID: zE5X3mKdwa3eopbczWolCBdi14zhS2jB
X-Authority-Analysis: v=2.4 cv=VcD6/Vp9 c=1 sm=1 tr=0 ts=69c1e38c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=uQdwmWJC_QEpPUP1zwkA:9 a=QEXdDO2ut3YA:10 a=OL_InX6BFuYJ61MAG2YA:9
 a=49ladYHvHUoA:10 a=mpd-woop7mMA:10 a=HiLRGq3uS_oA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwNiBTYWx0ZWRfX1rONF+mxIYm0
 SqNgG6lNKwFYIQErAYx5Z2uhdIUWHKzfj1oczOT97Nh2IUCdqqcN67AV8rload9AaP+rNhqXXVN
 ZWeZjN+MuK4W+cHPTjdVurL/fzKzVhC09zX3oA9vDCZmncIDNqulk7yK9GvESJmRHJ/dAkyI2Ns
 m90oZFOvfTlBLVFBz5lkDQLchKBaw4BGUbgFxm9gmJ6Ej8eXtWsL61vx12axe8qceanyPW1n4tS
 an5y1VgYm4FkNgmW8M7lipFWlj+61Ke6lRndjjxKJSnKzOhCbwt3gWWBAd27uufN3203gwfL0at
 a9EpjAIQTqk7xaLMh0cptR0wNqW3E8KlizxGP6tWrs/dx5ZSaz5ZyrMol9X8NuTJZGAR5E87TvM
 D6eJUfVg1GHI9Kfo58JstYJqcYfDlAre/MIpvr14vO+9/vje3ulbSUEePVdQ7Wswl+dhPu98X3r
 FeXv/8jQumXDAZ0H2nw==
X-Proofpoint-GUID: zE5X3mKdwa3eopbczWolCBdi14zhS2jB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603240006
X-Spamd-Result: default: False [4.04 / 15.00];
	MIME_BAD_ATTACHMENT(1.60)[gz:application/x-tar-gz];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35351-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	GREYLIST(0.00)[pass,body];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FREEMAIL_CC(0.00)[synopsys.com,rowland.harvard.edu,gmail.com,mork.no,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 153EF300651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--_002_202603240105233ufngdffak7ldchgsynopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5B5012293271E419D7603D91BB092EE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgMjMsIDIwMjYsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IA0KPiANCj4gT24g
MjEuMDMuMjYgMDM6MTQsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmksIE1hciAyMCwg
MjAyNiwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IE9uIFRodSwgTWFyIDE5LCAyMDI2IGF0IDEx
OjE2OjIyUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBNYXIg
MTgsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IA0KPiA+ID4gTmF0dXJhbGx5LCBVQVMgbWF5
IGJlIGEgdG90YWxseSBkaWZmZXJlbnQgc2l0dWF0aW9uLg0KPiA+IA0KPiA+IFdpbmRvd3MgaGFz
IGEgY2xldmVyIHdheSB0byBoYW5kbGUgdGhpcyBmb3IgVUFTLiBJdCBzZW5kcyBhIGNvbW1hbmQv
dGFzaw0KPiA+IHdpdGggdGhlIHNhbWUgdGFnIGFzIHRoZSBmYWlsaW5nIHRyYW5zZmVyIG9uIHRo
ZSBjb21tYW5kIGVuZHBvaW50LA0KPiA+IHRyaWdnZXJpbmcgYW4gb3ZlcmxhcCB0YWcgcmVzcG9u
c2UgYW5kIGNhdXNpbmcgdGhlIGRldmljZSBzaWRlIHRvIGNhbmNlbA0KPiA+IHRoZSBjb21tYW5k
IGFsb25nIHdpdGggdGhlIHBlbmRpbmcgZGF0YSB0cmFuc2Zlci4gVGhpcyBwdXRzIHRoZSBob3N0
IGFuZA0KPiA+IGRldmljZSBpbiBzeW5jIGFnYWluLg0KPiA+IA0KPiA+IEFsbCBjb21wbGlhbnQg
VUFTIGRldmljZXMgbXVzdCBzdXBwb3J0IG92ZXJsYXAgdGFnIGRldGVjdGlvbi4NCj4gPiANCj4g
PiAoV2UgY2FuIGdvIGludG8gbW9yZSBkZXRhaWwgc2hvdWxkIHdlIHdhbnQgdG8gcHVyc3VlIHRo
aXMpDQo+IA0KPiBfeWVzXw0KPiANCj4gRG8geW91IGhhdmUgYSB0cmFjZT8NCj4gDQoNCkkgYXR0
YWNoZWQgYSBjb3VwbGUgb2YgdXNiIHRyYWZmaWMgc25pZmZpbmcgdHJhY2VzLiBSZXZpZXcgY29t
bWVudHMNCmJlbG93Lg0KDQo8c25pcD4NCg0KPiA+IA0KPiA+IFRoZSBjbGVhci1oYWx0IGRvZXNu
J3QgaGF2ZSB0byBiZSBkb25lIGFmdGVyIHRoZSB1bmxpbmtpbmcgb2YgVVJCcy4gVGhlDQo+ID4g
eGhjaSBlbmRwb2ludCBpcyBpbiBzdG9wcGVkIHN0YXRlIGFmdGVyIGEgcmVzZXQgZXAgY29tbWFu
ZC4gQXMNCj4gPiBsb25nIGFzIHRoZSBjbGFzcyBkcml2ZXIgZG9lc24ndCBzdWJtaXQgYSBuZXcg
VVJCIHRvIHRyaWdnZXIgYSBkb29yYmVsbA0KPiA+IHJpbmcsIHRoZSB4aGNpIGRyaXZlciBjYW4g
c2VuZCBhIGNsZWFyLWhhbHQgYWZ0ZXIgYSByZXNldCBlcCBjb21tYW5kIGFuZA0KPiA+IG5vIHRy
YW5zZmVyIHdpbGwgc3RhcnQuDQo+IA0KPiBIb3cgZG8gd2UgdGVsbCBkcml2ZXJzIGFib3V0IHRo
YXQ/IElmIHdlIGdpdmUgYmFjayB0aGUgVVJCIGl0IG11c3QNCj4gYmUgdW5saW5rZWQuDQo+IA0K
DQpZZXMgaXQgbXVzdC4gSSB3YXMgcmVzcG9uZGluZyB0byBBbGFuJ3MgY29tbWVudCB0aGF0IG5v
dGluZyB0aGF0IGl0IGNhbg0KYmUgZG9uZSBwcmlvciBvciBhZnRlciB1bmxpbmtpbmcgdGhlIFVS
QnMuIEJ1dCBhcyBNaWNoYWwgbm90ZWQsIHRoYXQgbWF5DQpub3QgYmUgcG9zc2libGUgYmVjYXVz
ZSB3ZSByaW5nIHRoZSBkb29yYmVsbCByaWdodCBhZnRlciBnaXZpbmcgYmFjayBhbg0KVVJCLg0K
DQotLS0NCg0KTm93LCBhYm91dCB0aGUgYXR0YWNoZWQgdHJhY2VzLiBUaGV5IHdlcmUgY2FwdHVy
ZWQgc29tZSB+MyB5ZWFycyBhZ28gb24NCmNlcnRhaW4gYnVpbGQgb2YgV2luZG93cyAxMC4gT25l
IHRyYWNlIHNob3dzIHRyYW5zYWN0aW9uIGVycm9yIHJlc3BvbnNlDQp0byBkYXRhIElOIGVuZHBv
aW50LCB0aGUgb3RoZXIgdHJhY2Ugc2hvd3MgdHJhbnNhY3Rpb24gZXJyb3IgcmVzcG9uc2UgdG8N
CmRhdGEgT1VUIGVuZHBvaW50LiBUaGVzZSBhcmUgc29tZSBvZmYtdGhlLXNoZWxmIGRldmljZXMg
dGVzdGVkIGJlaGluZCBhDQpodWIuDQoNCndpbjEwX3Vhc3BfY2xlYXJfaGFsdF9lcDFpbl9UNy50
eHQ6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVW5mb3J0dW5hdGVseSwg
dGhpcyB0ZXN0IHdhcyBydW4gd2l0aCBhIHNpbmdsZSB0YWcgbnVtYmVyLCBzbyBpdCdzIG5vdCBh
DQp2ZXJ5IGdvb2QgZGVtb25zdHJhdGlvbiBvZiB0aGUgcmVjb3ZlcnkuIEhvd2V2ZXIsIHlvdSBj
YW4gc2VlDQp0cmFuc2FjdGlvbiBlcnJvciB0byB0aGlzIFNDU0kgUkVBRCgxMCkgYW5kIHN0b3Bw
ZWQgYXQgMTQ2NDMyIGJ5dGVzOg0KDQoJX19fX19fX3xfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KCVNDU0kgT3Ao
ODUpIEFERFIoMykgVGFnKDB4MDAwMikgU0NTSSBDREIgUkVBRCgxMCkgDQoJX19fX19fX3wgTG9n
aWNhbCBCbG9jayBBZGRyKDB4MDkyOEZDMDApIERhdGEoMTQ2NDMyIGJ5dGVzKSBTdGF0dXMoTWlz
c2luZyktQkFEIA0KCV9fX19fX198IFRpbWUoICAyLjY4MSBtcykgVGltZSBTdGFtcCgxMCAuIDAw
NiA5NjggNjYyKSBNZXRyaWNzICNYZmVycygyKSANCglfX19fX19ffF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoN
ClRoZW4gY2xlYXItaGFsdCBhbmQgaG9zdCBzZW5kcyBhIG5ldyBjb21tYW5kIHdpdGggdGhlIHNh
bWUgdGFnLCBjYXVzaW5nDQphbiBvdmVybGFwcGVkIHJlc3BvbnNlOg0KDQoJVHJhbnNmZXIoMjg5
KSBMZWZ0KCJMZWZ0IikgRzIoeDEpIENvbnRyb2woU0VUKSBBRERSKDMpIEVORFAoMCkgDQoJX19f
X19fX3wgYlJlcXVlc3QoQ0xFQVJfRkVBVFVSRSkgd1ZhbHVlKEVORFBPSU5UX0hBTFQpIHdMZW5n
dGgoMCkgDQoJX19fX19fX3wgVGltZSgxNjYuMzIyIHVzKSBUaW1lIFN0YW1wKDEwIC4gMDA5IDY0
OSA1MTYpIA0KCV9fX19fX198X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCglTQ1NJIE9wKDk5KSBBRERSKDMpIFRh
ZygweDAwMDIpIFNDU0kgQ0RCIFJFQUQoMTApIA0KCV9fX19fX198IExvZ2ljYWwgQmxvY2sgQWRk
cigweDA5MjkwMDAwKSBSRVNQT05TRV9DT0RFKE9WRVJMQVBQRUQgVEFHKSANCglfX19fX19ffCBU
aW1lKDM2NS44NTQgdXMpIFRpbWUgU3RhbXAoMTAgLiAwMDkgODE1IDgzOCkgTWV0cmljcyAjWGZl
cnMoMikgDQoJX19fX19fX3xfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpUaGVuIHRoZSBob3N0IHJldHJ5IHN0
YXJ0aW5nIGZyb20gd2hlcmUgdGhlIGZhaWxpbmcgU0NTSSBjb21tYW5kIHdhczoNCg0KCVNDU0kg
T3AoMTAwKSBBRERSKDMpIFRhZygweDAwMDIpIFNDU0kgQ0RCIFJFQUQoMTApIA0KCV9fX19fX198
IExvZ2ljYWwgQmxvY2sgQWRkcigweDA5MjkwNDAwKSBTVEFUVVMoR09PRCkgRGF0YSg1MjQyODgg
Ynl0ZXMpIA0KCV9fX19fX198IFRpbWUoICAxLjAxMiBzZWMpIFRpbWUgU3RhbXAoMTAgLiAwMTAg
MTgxIDY5MikgTWV0cmljcyAjWGZlcnMoMykgDQoJX19fX19fX3xfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KCVND
U0kgT3AoMTAxKSBBRERSKDMpIFRhZygweDAwMDIpIFNDU0kgQ0RCIFJFQUQoMTApIA0KCV9fX19f
X198IExvZ2ljYWwgQmxvY2sgQWRkcigweDA5MjhGQzAwKSBTVEFUVVMoR09PRCkgRGF0YSg1MjQy
ODggYnl0ZXMpIA0KCV9fX19fX198IFRpbWUoODgyLjQxMiB1cykgVGltZSBTdGFtcCgxMSAuIDAy
MiA0NjkgMTA0KSBNZXRyaWNzICNYZmVycygzKSANCglfX19fX19ffF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoJ
U0NTSSBPcCgxMDIpIEFERFIoMykgVGFnKDB4MDAwMikgU0NTSSBDREIgUkVBRCgxMCkgDQoJX19f
X19fX3wgTG9naWNhbCBCbG9jayBBZGRyKDB4MDkyOTAwMDApIFNUQVRVUyhHT09EKSBEYXRhKDUy
NDI4OCBieXRlcykgDQoJX19fX19fX3wgVGltZSggIDEuMDYwIG1zKSBUaW1lIFN0YW1wKDExIC4g
MDIzIDM1MSA1MTYpIE1ldHJpY3MgI1hmZXJzKDMpIA0KCV9fX19fX198X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CglTQ1NJIE9wKDEwMykgQUREUigzKSBUYWcoMHgwMDAyKSBTQ1NJIENEQiBSRUFEKDEwKSANCglf
X19fX19ffCBMb2dpY2FsIEJsb2NrIEFkZHIoMHgwOTI5MDgwMCkgU1RBVFVTKEdPT0QpIERhdGEo
NTI0Mjg4IGJ5dGVzKSANCglfX19fX19ffCBUaW1lKCAgMS4wMTMgbXMpIFRpbWUgU3RhbXAoMTEg
LiAwMjQgNDExIDUxMCkgTWV0cmljcyAjWGZlcnMoMykgDQoJX19fX19fX3xfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KDQpBbmQgcmVjb3Zlcnkgd2FzIHN1Y2Nlc3NmdWwgYW5kIHRyYW5zZmVycyByZXN1bWVkLg0K
DQp3aW4xMF91YXNwX2NsZWFyX2hhbHRfZXAxb3V0X1Q3LnR4dDoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpUaGlzIGZpbGUgaXMgdmlld2VkIGF0IHRoZSBUcmFuc2ZlciBs
ZXZlbCBiZWNhdXNlIGl0J3MgZGlmZmljdWx0IHRvIHNlZQ0KYXQgU0NTSSBPcCBsZXZlbC4gVGhp
cyBvbmUgaGFzIG11bHRpcGxlIHRyYW5zYWN0aW9uIGVycm9ycyBhbmQgdHJpZ2dlcnMNCm11bHRp
cGxlIGNsZWFyLWhhbHRzIGZyb20gaG9zdC4gQWZ0ZXIgdGhlIGhvc3QgcmV0cmllcyBhIGZldyB0
aW1lcyB0bw0KdGhlIHNhbWUgdHJhbnNmZXIsIGl0IGdhdmUgdXAgcmV0cnlpbmcuIFRoZSBsYXN0
IHRoaW5nIHlvdSBzZWUgaW4gdGhhdA0KdHJhY2UgaXMgdGhlIGhvc3QgcGVyZm9ybWluZyBjbGVh
ci1oYWx0IGR1ZSB0byB0cmFuc2FjdGlvbiBlcnJvcjoNCg0KCV9fX19fX198X19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCglUcmFuc2ZlcigyOTMpIExlZnQoIkxlZnQiKSBHMih4MSkgQ29udHJvbChTRVQpIEFERFIo
NCkgRU5EUCgwKSBSb3V0ZSBTdHJpbmcoMykgDQoJX19fX19fX3wgYlJlcXVlc3QoQ0xFQVJfRkVB
VFVSRSkgd1ZhbHVlKEVORFBPSU5UX0hBTFQpIHdMZW5ndGgoMCkgDQoJX19fX19fX3wgVGltZSBT
dGFtcCgyMSAuIDU0MCA2MzEgODgwKSANCglfX19fX19ffF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkFmdGVy
IGEgY2VydGFpbiBhbW91bnQgb2YgdGltZSwgZnJvbSB3aGF0IEkgcmVjYWxsLCB0aGUgaG9zdCB3
aWxsDQpwZXJmb3JtIHBvcnQgcmVzZXQgcmVjb3ZlcnkgZHVlIHRvIHRyYW5zZmVyIHRpbWVvdXQg
c2ltaWxhciB0byBMaW51eC4NCg0KQlIsDQpUaGluaA0K

--_002_202603240105233ufngdffak7ldchgsynopsyscom_
Content-Type: application/x-tar-gz; name="uas_clear_halt.tar.gz"
Content-Description: uas_clear_halt.tar.gz
Content-Disposition: attachment; filename="uas_clear_halt.tar.gz"; size=2242;
	creation-date="Tue, 24 Mar 2026 01:06:08 GMT";
	modification-date="Tue, 24 Mar 2026 01:06:08 GMT"
Content-ID: <B43715811990DF4D84DE5D0548F96299@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

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
zZs3b968eTvR/g/PEr0fAHgAAA==

--_002_202603240105233ufngdffak7ldchgsynopsyscom_--

