Return-Path: <linux-usb+bounces-9096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A789CFBA
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 03:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A1B1F21FA7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 01:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654F36FB2;
	Tue,  9 Apr 2024 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O8u7Vdab";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SbsEJKs3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="suKW1wN4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171046AD6
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 01:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712625546; cv=fail; b=VBXRp3saMxTtVQChzsu5oCKBwaEsU34RyQrd0eAVv8vgnu/Ul0BYTAEJytbEYaXv8nAENZplCAl8nqhmCznhhxPNZ3QMsuo5z1yTR7VjXsMmNvO+6hCZrd31OnmYatc49RQCsy9yVPW7jrYzXR8kx9Y7wJDa+/VgQD+FHnG902s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712625546; c=relaxed/simple;
	bh=6bUQRf/+uVwc4p4JPCiOrF5dpuWJGRDYfrFOH6vjqyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MmZYhmilWz9u3J7S6Qos+GaX6vJiXPvQhLBFwTlo1BEqu9ZhcTS4qgyLA6DffaE4RBXQLtT9ZbVJhmGRL/1h0xdJzeVHWTQg0Ubpe22/aV0ipWOWXN+lnnQgFOYZS3+IwifyX8qL4LjfWtDD2RzoiQY+aCog9Bv+VdxRzGr2v+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O8u7Vdab; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SbsEJKs3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=suKW1wN4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438LA0Cw006828;
	Mon, 8 Apr 2024 17:27:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=6bUQRf/+uVwc4p4JPCiOrF5dpuWJGRDYfrFOH6vjqyI=; b=
	O8u7Vdabn7sdCjliO2l9oNjKZ6/i9IhVlR4ii+ro0AFRtsminbIOrCBs2fKlBgGU
	3Wf2nNu8m4tnbDJ8G6SB1/cpxVhLYYF67qOisDDeJukfC+sfH0Ig0wLIRm31aqzP
	jp32fGsiM6YH0hi/ZOOTiGdYsODDsK1J4kb1wfrP+Fi1Uu+gIE6SWsuSY3Jj7PPj
	xANs0dOLNsCQMsqkpGqulofFYn7w7BI2AZKDOif21Av5XreibwORjF3DpSOhVPDt
	6vhBsySYpFACw1+nVjzFHqjXqKp4zmLqb2ZVCQxAa/sBQvDuuP2x4nNYKC12jU2p
	hd8+lqrjMcQzPOmSOaoh5Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xb5asf8dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 17:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712622420; bh=6bUQRf/+uVwc4p4JPCiOrF5dpuWJGRDYfrFOH6vjqyI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SbsEJKs3wkKlNPPTuoPyroW85SWgL/FWnVN0AQ8lObi4dsw+iRrDnpMyV0UJW3vyM
	 a2JCGicAZFuotYRERZBRVXd4j1f0GYBuPlbza4WyIBcU0eY1BYVQUmryVGT19jWnEU
	 krK4vxUjGEEjABR3ZNaVYJCqsSYJJE3aBEbAmkf8mCQ0ac2n7LPs8+l1x6xnEd4N3y
	 e2yVginloIDrD1YY4PuytXVDHIuDaVI0u5cQAOMwqg1X5URNMKPSRrqD6NcrNuBx3C
	 xU7GwDs+G0rcOg7oiisWBuCuMt7H0R2suSCWq5ouAMV2loKVCk7Sph2mzxbG9Tp8Jf
	 Mkhl9L7U0Pt2w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8AA124045D;
	Tue,  9 Apr 2024 00:27:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6DB13A005E;
	Tue,  9 Apr 2024 00:27:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=suKW1wN4;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D71A4035B;
	Tue,  9 Apr 2024 00:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce5bT6kvb/laVJ45XqIhea+LrR8BkJXuARHehPbf4klLOCCt89H5tG4NJSL6JHSD5NFEGcB2jI4t6WWZSTunumBZo+Aaz6Mo+rBJGUfyeyeK60L3WNgdamuKE9FZJDUzcvtFcjDObCxyojrJ20gW3K7xgV4KiXiwUD3q0RqgHZfmhp027QKeeJi/00QQ8XnXJFlbAo1ipQmQjpf1UpZE/GCViEoYs4f6+mXbWof2yecmolJ28Qw7kHyB0p2U3vQKPxJ5gw02WrIBWuty8QTlLz9hp0xQCcmauG6pZa+PTjinJblYKRXwKunbyTqrkjhn+gYCRAg6XwGMjdYojGfRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bUQRf/+uVwc4p4JPCiOrF5dpuWJGRDYfrFOH6vjqyI=;
 b=hXTyCNv2rn0BEdwfaTcqsroH76KMmWPzYWMywSx0usCwE6CgIi6bDdEXZeXGuGpTRnTaUG6T0+MJRVJS6G8EQoFS01S/NSe8SWyy5lcoNP/9UoWR8VkKpIRiNASzwb1sFQ9oB/sEl5+VYFh3L6JxRBjEDUsDGtIbHudpGpqt63JUoKfBnueazfbKErc2s5ldVmz2Jv+d00aAznGqH5UsrCTAJTV1zlVJgSOQTjZxluKmJvgK/819TN2EUroZAp1zREU4wrMEY1uRleJV55E8zO0t4aUc2FQUOXzzHXLelMgi6rP37AVYAL8pITikXzOdTOOANjoEP7iY51WBDABBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bUQRf/+uVwc4p4JPCiOrF5dpuWJGRDYfrFOH6vjqyI=;
 b=suKW1wN4ABhmXSekcNC2nhPE9DXjl1g2pJXG73zXNNQ+aLf3KOhNPFDUTpxEKTkTN91XCbv6QyjxdjG2V4C3Kuo8iTCZqfX7QDvxjbNmTGdeB+pncNdNK1j7itib/N7y01+2MYYcfDVanpV2v7WVIZyiPpZ/6qFXBE4+oL3rnuc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 00:26:56 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 00:26:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Hans de Goede <hdegoede@redhat.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: pci: Don't set "linux,phy_charger_detect"
 property on Lenovo Yoga Tab2 1380
Thread-Topic: [PATCH] usb: dwc3: pci: Don't set "linux,phy_charger_detect"
 property on Lenovo Yoga Tab2 1380
Thread-Index: AQHaiCtAr1MQdZokNkyTgDs9k9UqrLFfGOeA
Date: Tue, 9 Apr 2024 00:26:56 +0000
Message-ID: <20240409002653.rcdvx5matix7ezkr@synopsys.com>
References: <20240406140127.17885-1-hdegoede@redhat.com>
In-Reply-To: <20240406140127.17885-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7714:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LhEFD1WdLJre+e7Ea0/n7dlJmPzjBA+MDYS3Z/VTInrznBrhXpfjwSa7qex6HSPDh0Sm9FkWWez/CXEbE25SalEl4w8qqg06z205oLKuz1w3H7Y5j6ZHR4TSInVYY2W5SI1cFaOUh3HzVbj9n7UHMeZj2WEZ8FVHkJmSDV4AfE8CJ5ubp2/vn3hXjl4BgnOKAaLvOpg+o4vp8alexJlA3No4iWz80+WxmFI18kxfqQZDH4vbwcRGy8Jh3akYNIFSmxYPk0erkgfIShWoqxKTr55fUmBngNI9yEfiAnsBjTzBIrW9gv0w4ipu7SJk6bsBlvcKZWjjoZPvQb2pVpdIzdqUWvtl2WhiQ+ahI7GNB/fa0uZFJ2Zsg9q9whLsuYX6fF00O3fUQJQINpi3OhPwkTQASuwGLpawej1LnY/zv3Vs1BRxnYrqnxuM2XgCDYFDrfgPeE2Ebd7HfbZGtQNHfcpp3nS3CcRs3m7xLW4f8HFHx3tgH+RODEBLGMsnsXR1lhxfqQyodClFoe95S5Lgj53WR1JL7FaNJrIrLEzv9qvoIEcjGMBNZHd2btT7WR/njYhckTS281KbpCoN+lPyPDqydaFepbDn6qPiV4nLbgTnzfaMkdtO3jraTUDBpHps+Y8uVy3EvII8a3E8HXqz5pQz4eCnNju4ZAlxwVEsgK8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2ZBa2E1aGVIeVdxamZvNEZSZU5GakRibit3K1FBQmRSM045a2dxd1NxMlI4?=
 =?utf-8?B?bUtHU0FjNlJ0RzhHeWJKa3h2T0R0bTNIQzNCMEVHSXpHdUI5MFhKYmMxckJD?=
 =?utf-8?B?WnFxbjJiNjJIS0swelZrVFZPanRmemdJeTBlNnlBenhiVG5VbzhEaTY2b1hV?=
 =?utf-8?B?K1hpblpYUUdvY3c0NEtmMnArd0xvT0xKdDRZT2xXVXphakJZZkE0UnBhUTJS?=
 =?utf-8?B?cFowQS9GYTJwam9GaEowcW5FNTVrMlczNXNxK1duTXV5UHVIcEJhZUkwOVp5?=
 =?utf-8?B?L3ZnMDhVd3JWOVF2SWNUWGNiRm16WU80K2xZSnhiOUIvMTUxTVBmdk9pL0V6?=
 =?utf-8?B?N0E3MzIxRC96S3JtaTZIRGhjWHhjd0RJdDhaZTNVUlNOcmRCMmFoY2Ywa083?=
 =?utf-8?B?T3Y5UmpoQ2l1T1dlMUdKU05KaFIrMXVZbjg4TjllUzB5cUNULzM0bjV0Q1dG?=
 =?utf-8?B?ZzY5RGtoQ3Z6NFRSdlpSU2RxRnQvYlJCZ04rUk8yQmt3YmlMdU40WkxvKzZL?=
 =?utf-8?B?Mld0U3RjbktuMVUzem9YdmdtelNqYXpCVGlCK2NON1JhRGxtWGRrdzQxV0sz?=
 =?utf-8?B?SmcrT1RvNzdUM3ExYmZSa1V6dE91U2NlMmxoaW56ZFkxYlJLWjlSL1NpZWpm?=
 =?utf-8?B?K1pUSDNaR3A0b1o4Q0hEV3BOb0hKcGdoN285cG9DeW0yM0hyOTlWUTZlejdY?=
 =?utf-8?B?T3lvcXZEaktLSzFXVVVmWjJNeTZ1a2VOczZyc21FYXd0a25mQjVTZG9oeDZa?=
 =?utf-8?B?dEt0MHd6c2VhUjRrTDdkQWNaV254SmxuMzFnMnF2c3V3VHhlUVpoS05Ec1Fp?=
 =?utf-8?B?NTBVWlV0TXhRR3cwdGNYWkVPcjNZY3p1KzZiQU5pam5ZU2dZQ2pqMGg5djRT?=
 =?utf-8?B?WCt5ZktyZ0MrK3EzT3dNNUVseVp1eHBzWnh5dU1NVU1yQlI4bmRVY2NPUFlF?=
 =?utf-8?B?NXhTUzN5c3N1SHN3RFdTKzJGZGF3czhzRHd6UTNZdmJFaVIwdkpZWmI3TVNB?=
 =?utf-8?B?SjVVZHRYOEtGa3J3RElRelhaajFKMEY0ZUNmU2Vvc2pzMFNXRFhXZGQydEVw?=
 =?utf-8?B?Tk52ekREQUJ6bkYxNjBNaWhkcWw3aTUzMUpVbk9KSEMzTVZSN0F3Rm4xeDNu?=
 =?utf-8?B?MWFjN0NCWjM1cXlVNnAzbHNpMDcyK2JlZXBEVjd5N1EzVENuK3ZOdnZ4NGtF?=
 =?utf-8?B?OVR0cmpiNnM0M1RzR0QvKzVrdjk5S1JaSDIrSnpQVEtGUEVmSEF6V29lYmJm?=
 =?utf-8?B?c0tMUVNEQWt4VFZSUjhKMGtyN24zUE8xU3JDSVM2cm8zTXpqbklQbXBkVjFI?=
 =?utf-8?B?WXZvK0Y2bnVQc1o4b1V5alVWRnhKeXdHQ1o0MEhHWEZKTUFMeXlaQlN3V3k1?=
 =?utf-8?B?VHFEdlMwK2lOSzZBYnhVcVNFYkhoMm5Xc0JNVXhodkNaUXRKMnl1Y2Y0ckhN?=
 =?utf-8?B?U2NpS1ZVWWZsbkFQaGpDbnZNY0dKdGh6Nk9mYXFaTEpJakJTWHpMQk02NnJ6?=
 =?utf-8?B?MkZqa0ZhY3QvOEhGVjRhU3hCWm81SEtQQkdUb0UxVWVpMHFsbGxJVEZRd0Fs?=
 =?utf-8?B?VHR3OEpaekxYeVN6MU42NHl1VENZVjY2cWRYMzU2YVBQZ2JUM1VyNkZkTkU0?=
 =?utf-8?B?R1ZDT2tJVnFVUDNLd29jQ3lWVFZTcHJKRCt3SmEwWVpTNElGY3hIS2h2U0FH?=
 =?utf-8?B?MStSaHAyRFlPbUJPNVI0VU9uMWNUZFFYbml1bVErd29jOWZGcVJYaFdKVG5S?=
 =?utf-8?B?SmdzN1o3aWNja0w0aWlCYWlQcFBtd1d3am8yci9aaGdDalVKOVJkK2lETWM5?=
 =?utf-8?B?L0pNN1FSanl1YnF1SUllMFhMOW1uWnFuZktpMlBUWWxUdVVKajFWV0NaSGta?=
 =?utf-8?B?RElZRGhSdGpra2RtMTJtMFZwVGkvdzAwL3BpUTBuOHcrOVRWaTFRQXQ5Qi9p?=
 =?utf-8?B?Z0tiSlI2dGFGcE5XN2JaRkNwbjBKaGwwNE9YK2VqMyt2OEREbFAzOGJxMk1H?=
 =?utf-8?B?OGxMb1lqbis2YmJUbmhDekpyTXNNOEFidXZPZDdNSExLNHdiQ2ZtTFlOMkdZ?=
 =?utf-8?B?Y3F3S3NHQ2UwUUdYTzRaYlVTK3NDWjduZzhWTVRxUEVhb2pwZ1NVZXR6RFF3?=
 =?utf-8?B?M0V1MUFabXhFcE5XeTYrOUVsbGJ0WFBDemJOUmpKc1RXcSt1Unl2REMrNGxL?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F3F60189945F548A03F3A11E2282C61@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NqMV7B+SqpCH/WTsE017Usrf1PwPKkBhg9z5dmO1z1xpRdVssfQjdHfs36FTTt3RVbL/oz+cT2be6z0X14JAS4wYQEuxV6+D68MvnoPx4+88z7LlX36SeXDHzm2Jtb0tOkxCEJaghkurMREJvQ4tZGt0FY2ZJwDBID3GlaYlVFcFxw4W+TLa2UftHsA2elzqkjwZFIaSu+RNBgz3Xn1adzQjh94kDoP9FqUTWM1ET0HXC4t/aSmHYsrajXcutHg2tO6hLKpfDer2qSrd0BJWABPAweaJKOt127X08mbIVgSU0oJDyChHDp/l/n0z7RzDzTpKjicaDqu+ITvwdsaos5dKV02QhbTKz/dvja03N71qST7cc4ZJGb1HTfFkT3q/0Wm3QVBWQ29n8XDp8UegveYCkdg5oypmZ/ZkfC60APj8pWTjKnRhywa8V7/ulkVy2s5QILbgo/JC1EGeeQ1nonOgt5hgIuz9AEQcDHisLfv+XaYo16CWL6ZrXi++y4SfnniEr14i70Gh8yaVfHb9lfmWrXJlL4kr4zV2ttOYIuVGdI6JFE5V1CgOG1iApkSOHfhWW74s4CemzQV3UVKIJpeM1qUh8qqwrQ3dH1vUQ8PhYOFP7rsdeoYsnsiDJt7NywyVQ7Rbmr4NRW6TLIMWCg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382e7429-3b15-461a-fbfd-08dc582bc338
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 00:26:56.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poLJt5KCNtCHYaEZCpZNtthVr1cj9zhkENDlV8zMQZwJ+YTlNvdAiyhpqKTsrSzXvdR3VfX6XB2T1FL/7IESLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714
X-Proofpoint-ORIG-GUID: NQ285t_631RutE_yxDrVhyMfb9fBHAdA
X-Proofpoint-GUID: NQ285t_631RutE_yxDrVhyMfb9fBHAdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_18,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090000

T24gU2F0LCBBcHIgMDYsIDIwMjQsIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+IFRoZSBMZW5vdm8g
WW9nYSBUYWJsZXQgMiBQcm8gMTM4MCBtb2RlbCBpcyB0aGUgZXhjZXB0aW9uIHRvIHRoZSBydWxl
IHRoYXQNCj4gZGV2aWNlcyB3aGljaCB1c2UgdGhlIENyeXN0YWwgQ292ZSBQTUlDIHdpdGhvdXQg
dXNpbmcgQUNQSSBmb3IgYmF0dGVyeSBhbmQNCj4gQUMgcG93ZXJfc3VwcGx5IGNsYXNzIHN1cHBv
cnQgdXNlIHRoZSBVU0ItcGh5IGZvciBjaGFyZ2VyIGRldGVjdGlvbi4NCj4gDQo+IFVubGlrZSB0
aGUgTGVub3ZvIFlvZ2EgVGFibGV0IDIgODMwIC8gMTA1MCBtb2RlbHMgdGhpcyBtb2RlbCBoYXMg
YW4gZXh0cmENCj4gTEM4MjQyMDZYQSBNaWNybyBVU0Igc3dpdGNoIHdoaWNoIGRvZXMgdGhlIGNo
YXJnZXIgZGV0ZWN0aW9uLg0KPiANCj4gQWRkIGEgRE1JIHF1aXJrIHRvIG5vdCBzZXQgdGhlICJs
aW51eCxwaHlfY2hhcmdlcl9kZXRlY3QiIHByb3BlcnR5IG9uDQo+IHRoZSAxMzgwIG1vZGVsLiBU
aGlzIHF1aXJrIG1hdGNoZXMgb24gdGhlIEJJT1MgdmVyc2lvbiB0byBkaWZmZXJlbnRpYXRlDQo+
IHRoZSAxMzgwIG1vZGVsIGZyb20gdGhlIDgzMCBhbmQgMTA1MCBtb2RlbHMgd2hpY2ggb3RoZXJ3
aXNlIGhhdmUNCj4gdGhlIHNhbWUgRE1JIHN0cmluZ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1wY2kuYyB8IDggKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcGNpLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gaW5kZXggNDk3
ZGVlZDM4YzBjLi45ZWY4MjFjYTJmYzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1wY2kuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gQEAgLTgs
NiArOCw3IEBADQo+ICAgKgkgICAgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBs
aW51dHJvbml4LmRlPg0KPiAgICovDQo+ICANCj4gKyNpbmNsdWRlIDxsaW51eC9kbWkuaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+IEBAIC0yMjAsNiArMjIxLDcgQEAgc3RhdGlj
IGludCBkd2MzX3BjaV9xdWlya3Moc3RydWN0IGR3YzNfcGNpICpkd2MsDQo+ICANCj4gIAkJaWYg
KHBkZXYtPmRldmljZSA9PSBQQ0lfREVWSUNFX0lEX0lOVEVMX0JZVCkgew0KPiAgCQkJc3RydWN0
IGdwaW9fZGVzYyAqZ3BpbzsNCj4gKwkJCWNvbnN0IGNoYXIgKmJpb3NfdmVyOw0KPiAgCQkJaW50
IHJldDsNCj4gIA0KPiAgCQkJLyogT24gQllUIHRoZSBGVyBkb2VzIG5vdCBhbHdheXMgZW5hYmxl
IHRoZSByZWZjbG9jayAqLw0KPiBAQCAtMjc3LDggKzI3OSwxMiBAQCBzdGF0aWMgaW50IGR3YzNf
cGNpX3F1aXJrcyhzdHJ1Y3QgZHdjM19wY2kgKmR3YywNCj4gIAkJCSAqIGRldGVjdGlvbi4gVGhl
c2UgY2FuIGJlIGlkZW50aWZpZWQgYnkgdGhlbSBfbm90Xw0KPiAgCQkJICogdXNpbmcgdGhlIHN0
YW5kYXJkIEFDUEkgYmF0dGVyeSBhbmQgYWMgZHJpdmVycy4NCj4gIAkJCSAqLw0KPiArCQkJYmlv
c192ZXIgPSBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9CSU9TX1ZFUlNJT04pOw0KPiAgCQkJaWYg
KGFjcGlfZGV2X3ByZXNlbnQoIklOVDMzRkQiLCAiMSIsIDIpICYmDQo+IC0JCQkgICAgYWNwaV9x
dWlya19za2lwX2FjcGlfYWNfYW5kX2JhdHRlcnkoKSkgew0KPiArCQkJICAgIGFjcGlfcXVpcmtf
c2tpcF9hY3BpX2FjX2FuZF9iYXR0ZXJ5KCkgJiYNCj4gKwkJCSAgICAvKiBMZW5vdm8gWW9nYSBU
YWJsZXQgMiBQcm8gMTM4MCB1c2VzIExDODI0MjA2WEEgaW5zdGVhZCAqLw0KPiArCQkJICAgICEo
Ymlvc192ZXIgJiYNCj4gKwkJCSAgICAgIHN0cnN0YXJ0cyhiaW9zX3ZlciwgIkJMQURFXzIxLlg2
NC4wMDA1LlIwMC4xNTA0MTAxNTE2IikpKSB7DQo+ICAJCQkJZGV2X2luZm8oJnBkZXYtPmRldiwg
IlVzaW5nIFRVU0IxMjExIHBoeSBmb3IgY2hhcmdlciBkZXRlY3Rpb25cbiIpOw0KPiAgCQkJCXN3
bm9kZSA9ICZkd2MzX3BjaV9pbnRlbF9waHlfY2hhcmdlcl9kZXRlY3Rfc3dub2RlOw0KPiAgCQkJ
fQ0KPiAtLSANCj4gMi40NC4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

