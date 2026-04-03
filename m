Return-Path: <linux-usb+bounces-35922-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGCFM5Mfz2latAYAu9opvQ
	(envelope-from <linux-usb+bounces-35922-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 04:01:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD939038B
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 04:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B54304876A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 02:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46A9347521;
	Fri,  3 Apr 2026 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I3Hcn2F3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KsV3mTau";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g4KipojN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCF23C4F2
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775181621; cv=fail; b=oaDxBIFMYnmQZa7Hz6olznr4IgQhRyEcbMP/jRMzRFRnUYfd+SS71+23SeNEi2Gs5AiRFPTteSL8xP6ZbyNWTAbPhG+xhkHi6BtAtIrSOSkVqCOJFySMC9lmuOoJWBJWzvHAtAwQ35w0nCs/oUdnbSRseGE0K3MXjKGSL20v3PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775181621; c=relaxed/simple;
	bh=iPjARHCAmCD1AZ/jqcwIv/vj3usjJa6nEBl0zjutiII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r3xJVaVqztctdvoZbsbXSX/f3kbdBwTqsv21rRCW+22P6y3ps+9CNnR5rUJhxvfy7Npx3OSSTl5V/HGIb/ulyTznmD2N183/c+es+eKQveTo5WuscRqwVNiS/sXqg2qFtwqLQhuwYyRhXbbcQecjRfeAXGRdf6GTx3GqgOA4Q3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I3Hcn2F3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KsV3mTau; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g4KipojN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632LcS8a2567805;
	Thu, 2 Apr 2026 19:00:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=iPjARHCAmCD1AZ/jqcwIv/vj3usjJa6nEBl0zjutiII=; b=
	I3Hcn2F3e5IPsdvhsiuswXKOcKUQ2tpdqwl3+8tkhkDo2KLc3toe7EhvuRQcTa2U
	5xDQ7pFiupnJioGGkSSIwK0EerOEqWs8v4VyDPB/CD5zYrSQqnXyAxpAlGOag09e
	pzkmaB5bv6iMsNP269rNUm3S2CLhawyZpgfLivsxfoyQJpg0GYKPxJbvdCzo2Qt3
	La4CUfzQ2dLcEhNy4BJIfHDnv754sxgTp8eroc7LgA18sAxiJMUTod68j+8O/Hm9
	WI4iV+CD6tCCbB/d03gWNfbTb/o12d0MJCKTwKQq+4nPjVMOAFb/fA1C3bgx/6fE
	mfa3aRqFo1kAjQSTAXcUGA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d9wy2hpt7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 19:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775181605; bh=iPjARHCAmCD1AZ/jqcwIv/vj3usjJa6nEBl0zjutiII=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KsV3mTauJ2NKHF4jS5hhF2xfBQyWxP34kB4rrmQkC6pzBPe/jUPWyEW1ENzPqauBu
	 BJNDDeWthloLCtGktC5jomFyX6ptZbc9PHo4wsr3VhTTIVdcH2qKS2wB6Scl1WUMVk
	 xfokXSbUptnuEIABTFCjYSz9Xr75LJy3Uiu4MQ1Y3N/XPRttMoT/Azt5ajaKNFDovi
	 jgdT+cWLVTA0NmA/fLHCXL3miMFnUAAWljsBjy8vEAO0xKkwebjAnzszNPZh+ZevsN
	 vVR1XviNJBLunVnmP9OiPUZ1fBTZk1jRCrxfxhIC/2fbAIaK6Oc2aiX4jhq+CbYYdu
	 9kkLMeACQ0o/Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8B521401CB;
	Fri,  3 Apr 2026 02:00:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 30552A006F;
	Fri,  3 Apr 2026 02:00:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=g4KipojN;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4C0742201D1;
	Fri,  3 Apr 2026 02:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVelHrUY3T9/cwVIZgWyiMK4eaGwwfRN2A3vt1amsxrG5UpVXcya/TL92btxj6q+H7Ta7lFAsVvukhT3j4G+MG7Jw9eW/c2LYVVtjlzDD7J2s27wYnP2iWfgw0pgljFzNL78q1Dmziy1XA+MqRvzqa0i5OyZrM5rYk7mrCUYQLUJNyUz8qInbPcQrO1ZNxqIKD/EFcOfoKX+eevba3upV2HwbNa/uMLCduEGjyksLEE2lAhh+qn8MnGgTzvEh6bCRSvfaC1dIqYS0WSY7tqChSM6Wv4g7Y7Ytu0H8RP6jC6EKg8qZ5WRUNv8aUI43zVPvgSDIZUlWptMuAMcpm0PKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPjARHCAmCD1AZ/jqcwIv/vj3usjJa6nEBl0zjutiII=;
 b=Fhj5iYtCZ+Ic6X0z1wu2j+icDuAWGl3iH63G9dmjFq22H/YxZP7Is1T6x/UJDx6XgHZbiGUGnjpo9Zm3CHP5BWZejhCgh5g6+cwuXwPZk2iK05hdQ7ZIaMo8XBdsehCG0Kk93W1qnEPHPBs2IuRu4bKQufBPOVmMrtsWyBmAnIcLT6ZC0hE8S1Td7fF3U1KfIM0qa1ancVomkKQxtX/PlrD7Z7uPY3ilCetd4tp/382UELwt0/Gc7vynoEvAyKuD9Xtc9eR3NY6UoZQ9JFDU0hlSTxm1Yrogcenn1uyFb3VtvT6yN9aWyqAOpFtFJyiqbZtDLJ8XFzKNoh3bXv0XEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPjARHCAmCD1AZ/jqcwIv/vj3usjJa6nEBl0zjutiII=;
 b=g4KipojNixh8+VddB0BpgtDn7du6qml+9Vrb/Gqf/kRB0cApFf6+bsqW1SzatfyrUSISqchveBktM32eytJdfuJNJWSyhVeFQIZe72ePxefISfpJ8tJdbu7Nfl/yma36t7AIfy1w818IoHaIhR4xOqsNisPucbeCWWwYX4Zbs2E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY3PR12MB9630.namprd12.prod.outlook.com (2603:10b6:930:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 01:59:58 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 01:59:58 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAA==
Date: Fri, 3 Apr 2026 01:59:58 +0000
Message-ID: <20260403015950.lx4n4zdqki37dy27@synopsys.com>
References: <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
In-Reply-To: <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY3PR12MB9630:EE_
x-ms-office365-filtering-correlation-id: c691f6d3-0264-4a02-582e-08de9124b582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 RC9AJhy2BTq07qOA3ol3aoR6dr+3E4zN+Gcwscb7C5WN0BhCNcFZyflhqTKjOz5l4hOzP8EAEfSclHa/5IlrBu7VTdb19dmgmHQypR3MVlMVL0mjjnLwqI11gsQZh4LPeplIbtWNLr03cKkMaI6RJ/ju72MADrBgnULI+GitpfQAu3jS9DEm6WWm3D7Pd/zeXhO4wEMNfsZ12KYsurd3RwahWmvUW8EacDdXCyhWkkAdykLKffzbIUlk3GD5txi6/t5pl21GJgHphjAIE0oYDjoYXuuac/Q1CWeZ+UHogW/OGJhTcZbLKu4R1mAtWGrSrxUK+iWJYN2nGE/QRkAS/NzbylS+vaRMDJaQmmu5NRQ65Yquoz1ixc4jPOWb3k6dRSgj5Yfzrb6KbgabsATAW9wq3HgZLADoKwfYvX1iI8JsvcK7XvMbvnYanU/V8hhaA8HyKHbUi89JgPCFWhpVg89Hk1SnD9ARu0JpSimyLlaONNEdLZFIrOoABIoMjq57zuoUVZ8MMHV3JR/b8T58n8kiemOS9ZzCwK4y5ri4AK9282iCi1OxAfBeWlfjkjz8BdnB9JSCAVGZN0w3pZfbSCDWk4J7udwx/Za/TIuI0Dh4zFMov8of/HPdm8foiEJvhbAAJqSxpzxRO/3q/HmEKQzzeQhfprUSQok2IojhWFd9va11vKNvbo7iQHYiRP2KUChSx4AaEi8eTBJM3aIi6dNg89jLoYIDzy+mumIFAQDBVIQd8aOAz9YfMRIanmzGmf+LXyn322DrGL04jx2eMS6bCMrDglzr9FeDm1AJTIY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnE2aTFTNEY4Rm9aUEtBZTlLS3VZWmNoQzFnbGZpVWc1ZjVPRWx0SVlpcXpT?=
 =?utf-8?B?RTArellvTFh5NUtLb1lXcXA0anJaY28yYmdhYVVmTGpWOXQyamN6dUVKQkZK?=
 =?utf-8?B?UjdWcTd1eU9UNjh2VFo3VERtekgxMUUySnlJYnErK0tGYmFVYVVTRHpkS0Zo?=
 =?utf-8?B?djQ2MHNGS0lKR2hCckxIWlhqT0Z4UDFNeVJ6eGlRRVFGK09yQkxJYk5QTHZQ?=
 =?utf-8?B?bkV5cEdQUzlJZ3RtR25qczRhZHh1b1Z2NEY2UksvM3FCSGRoeWxvMFlNNHF0?=
 =?utf-8?B?V09BSWRqN1pZRXVqdWxZMHl3cW5Ec2UvcGw0OUlFdG5KMGJLamJkN09DdEhJ?=
 =?utf-8?B?Q3RmQVoxVnF0QXRPOXpkUVRZZlJrWjRjTGxGVWdJek1WalNwNVd6RzJqcEdE?=
 =?utf-8?B?TjFRM1hnbG93ZkgxeHNBRlRwT2x1WjRycDhDTTlTVjVPOVZrSHN4NWJ1aXNv?=
 =?utf-8?B?N2drc0VxSHJvQXExNEROY1VRZFY5QnFYcm53MFN1UUR4dFFsWWlmWTBlTWsr?=
 =?utf-8?B?Y2xSdUt3TXoyQjNJVHRJVkZ1elZkWTN4aVVLQjZDZ2tmRTdyZnZoOFBGR3Jh?=
 =?utf-8?B?MlE5VnZ0ZmRDYWpqTVM1a29aMXM1UjZyampjSjUvd0xoVVFDT2ttZVhkakg4?=
 =?utf-8?B?RDJTNWZRQmhPc0ZXYUdJY0hEbVV4cmEzd2lNRWtZVHh0T2I1MEZoRGxDbHNk?=
 =?utf-8?B?ZCtsazVkQTlBREtINy9NdWlSMktYZUI5aC9VbE44TFppbGllaGhKZVZaQk5C?=
 =?utf-8?B?cU45ZFNHeFlIWmV4NHd6T1U3YWVXbVB5SkgvakFLZVhYWWFyNVRaTnpCdFEy?=
 =?utf-8?B?c1ZCNEtIZkRpOFJoSG9kcGVpUXJ6Y2QwMVRNZERncDFld2c5ZW04TEx2ckZ6?=
 =?utf-8?B?MHh0MzQwZVBxTHE1OWVGME5zYnp5cExtcnh0WVR1OFlNUUtUY01uV0pQUFox?=
 =?utf-8?B?elp1SDV0RDFNRUdKUTJzSUhQR0dmdEROQ0UzdVF5STY3Nzl0aStkSmgwVVpr?=
 =?utf-8?B?b1lKc3FpT3RwYW5FNW5LRGRTRWNTdnNwckgvdXRwNVlYdHJ6bTVOcDlFMUhK?=
 =?utf-8?B?MzNDREpMOXZjZXdja0UyZjdNYUdzZVQ2ZDNLUnNvcHhudEFmWC9PdUhpNkgx?=
 =?utf-8?B?bUVhc0tJbDIwQis0ZUdqU2ZLbmowVEhyUXFDZzJLSDRkV2ZRMWkzci81MHVt?=
 =?utf-8?B?SUtmSEQyNlA0cUR5aWQwS2MvN1hwK2xDMS9vVjRqSXdtQ1U1UlBINUFVVk1h?=
 =?utf-8?B?ajB0SDhKK2lBRXIxaCtnVVlxSmVCZDFnMFZoT1dCUE1kYkp5alp3RmZPT1BK?=
 =?utf-8?B?NXFJd0YxTUE4U3hHMy8zSXdtK1ZRYmZFWlllWkFnSTltYkhFcTRNVEpmYVRT?=
 =?utf-8?B?eEtBMHlsQXZYSHljSkt5Wm8rMWhLSFl1cFBpUXNNZ2dVT2pWRnBaUzVnY01Z?=
 =?utf-8?B?aWJVcEg4VmF5VTk1MTY5ZU1XRnZXQTVsVU44YXhFYXBHbVFjTHphRFhGZ2VF?=
 =?utf-8?B?anA0QWNxNldhYWYwYkhXTFE1NVlHcENQaWFwQlB1d2Z1QmNvTlVwczlGM28r?=
 =?utf-8?B?V0h0MEZmY0NoNVJCZzduUGxaeXZzUXIyRjlRZGpEY0hibkNYSWdVeUhrWHlZ?=
 =?utf-8?B?MEZOTGtLYjBDdGF6YmR3OFpXbzl1cjhUUlpLU1pBWlc0bFpxTm9qaHpiU2tI?=
 =?utf-8?B?aWNRL2tWRUtCTkRDVHhnOHoxMllNRXVjOENxc0UzTFFiTm5YcEhSNGQxS2xm?=
 =?utf-8?B?YjlrdzRIWFFqUUNqaE42dW1wbzk5OTdhNXg2RzFXZVErdzlYUkdLOGtSSVZi?=
 =?utf-8?B?RmYzYlBWOGluekVJUEVaVC9IK3VKZE5GQ29CajdpTTQ1NFh0ZmdFV2dzYkVm?=
 =?utf-8?B?K29Zb2ZsVzBZRTBJOWRWcHhwOEIwTkN6QlplQ1FGWTYvcDRaQ2k4UjgwYStF?=
 =?utf-8?B?S0U3dXAvbGY5REtOdldGNWZvMkFSbCt3Q25RUkwxZ1c2aHVqb2diQ1hHTG9Z?=
 =?utf-8?B?UnVWK2VWYW4yTFJYNHovb0c4VDcrdWVwbjAxT1B2M0YzQXlPSy85RmlwUzlr?=
 =?utf-8?B?S2ZsdWNSOTdqYzAzbWtDQVpURzVOWm9jSWd6UEhKVzRjalNYWU9OMmJIYmd1?=
 =?utf-8?B?WEVkR0J5R1ZudW9GUzBqNU1Ic0E5YWUzTjZhVW8zbTlJcFNUVnEzOUdiSkpD?=
 =?utf-8?B?Y1diZTZRNWpPK0hJand0YnROM3k3T1FER1ZDYTN0d2YyT05JTFFUbFh3clVT?=
 =?utf-8?B?OEpKSDBvemxSZHpTVERrS2RPVGhkaEIwTkY5RTcrSXB4K0U3ekMzL29RYVVG?=
 =?utf-8?B?TVcyYlZyWGFCcGIzVFpBaHd3VnlMd05sWUwrditMWnRHZ0M3TkhPZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <657CC96BD6563F469EF64C442C7EB5FC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	j7TiINehSf0zXCeyz+EvFJfsmLx9wEZlBGpX0xXv1mnyr5BOM3vvhpJsDAQO6EvmyuLLatMViCtQnTLR82vzUf9E89skmLWmXdn1M9tBdMaYxfxglKRlQkKmR/w+CJ1jJXoyBp/jT2VGg1RZS6Hy3Tj7xuPBkEnNqbA7h0zodOHV3/G47y47BKFN3wynyYJ0YmEIly+3jlv6G3ksNZRnJdmH9f6h56C7lWy7yMKQc3L7jPgxvq0RLOtuTTJPsaa0IUzqVl9euK/Z/as7SwY8x112V07Wo80OSkRmdUaQ3aDyPMP55693s/9Ajvp05cF7Ts7u9R99cdxguxClWcLO+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x1f0Vg1g0NXxxRkB/LTcuhg+m3+JBZqYgnRzsL8l9nEi7MJuyktacX5inVqAigYDvjUaHmo4sHyfNUJrU9+5e6Wpi6VK6WvZpgiJana0G4SUvBwRoV0lgQPm53HWaUrMp5CbpGp1APPDLqMB1rx0YQrcmZPR0wOuWVgUd7ESELotxvqfAwMUJii8E9kAotaFebgFzvt39+2n5nfe+7zKOr1Z4QFJoL/p8/kJZPoptLnnkQXqpVJDQ4Za/rjuuXX+urgvGxNh2ADGSMR/lGXXSP17xTzFbTF9Oj6NDZayQLhTJQAHDR0EUfVp02pAlw/GQFs+JLyHGDzmsN/6vEuKtibj/yS5+kJKDfyon0pFBLvsRABAHwRWfAGBW61lftMBxdAdb1U5PwTtkpn4E3swDyf4ObGAF5IfIaIRWKfa7uAOzeb3DH9+MlaTmQ/l1WAWCceQ83npDEFIYfOWW2tSkcHcPmmrOQ0RWF1GJ1d4P+LekZnreF0E/+ubUUsByk0JqhZCjUbpmMKizOBhV9wgDBKAQnkpZPWvSHaMq+VyalH1y/9/506pGVjrDx8sG1JyXjDwj+ozCfHhdMoivK/QrlHqAr6BUW1YoQuxQcSVcZswAQMsGaWkcnpABWVSVSuViRnc01M8uuh3CjIH59kCyg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c691f6d3-0264-4a02-582e-08de9124b582
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 01:59:58.3136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YmtcpAhyeCnzbfeAjbczvg03Xt8sC22ssrH2kzNeI1KwTO90tTNnK0G05PbWzf51Kb/SxDSEm8lCeyil2N1qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9630
X-Proofpoint-GUID: WQYcSrKP3IQKpwGO75v3AB3zLPYMGN5C
X-Authority-Analysis: v=2.4 cv=Mbxhep/f c=1 sm=1 tr=0 ts=69cf1f26 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=HGrXed9zdzQlLiSa8sEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAxNiBTYWx0ZWRfX4xdFSFPqyPv4
 IFbZNUGBoW5jOtCc3v9QHhKfk9f6laesbRhZ59/j/f3b81A3F4Xb+9EiCu5qLtINLrYyfb1F575
 Dd73b4NtWvonbzUP+wtJFC8ESbz7IOpFuYktnckSyb+6eYBVigc4uQorKBFisLUV0UoI7i8kS/I
 sG9PP8rD1oblXAFw0tR68o/NVlwWeyvT/cZ+9h35lLPnVndKDkDccopt2qY3e8z9zDTb2yALxF3
 kKGZZO1EKessvpY3Z4fEvMowwJndEvqCtI+Qrt0vbdJT85vi0DGpc8irDH4J5qZ5lglRbRCUM4l
 1uQE6mWiLJNCWZVbzQ2OvTqjEqgWr5T9hjtU+hfluKeGHOQ4VHkEfiIzvCkRMdhojlfF+ryfAhk
 0St2k0Obwn6CKQJqJ/IuVG+9zOlt977sBFkf84dui+IQKOHbLJ84whgOvnbmxV5KfukKJkIhkd/
 +3+cC6KWULjsvXHanvg==
X-Proofpoint-ORIG-GUID: WQYcSrKP3IQKpwGO75v3AB3zLPYMGN5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604030016
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35922-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,synopsys.com,vger.kernel.org,gmail.com,suse.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 40BD939038B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMDEsIDIwMjYsIHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHUgd3JvdGU6DQo+
IE9uIFRodSwgQXByIDAyLCAyMDI2IGF0IDAxOjA4OjMxQU0gKzAzMDAsIE1hdGhpYXMgTnltYW4g
d3JvdGU6DQo+ID4gT24gMy8zMS8yNiAxODozMSwgc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdSB3
cm90ZToNCj4gPiA+IA0KPiA+ID4gSG93IGFib3V0IHRoaXMgaW5zdGVhZD8gIFdlIGFkZCBhICJo
YWx0ZWQiIGZsYWcgdG8gdGhlIHVzYl9ob3N0X2VuZHBvaW50DQo+ID4gPiBzdHJ1Y3R1cmUsIGFu
ZCB0aGUgY29yZSB3aWxsIHNldCB0aGlzIGZsYWcgd2hlbmV2ZXIgYSBidWxrIG9yIGludGVycnVw
dA0KPiA+ID4gVVJCIGdldHMgYSBzdGF0dXMgb3RoZXIgdGhhbiAwIChiZWZvcmUgcHV0dGluZyB0
aGUgVVJCIG9uIHRoZSBiaCBsaXN0KS4NCj4gPiA+IElmIGFuIFVSQiBoYXMgb25lIG9mIHRoZXNl
IHN0YXR1c2VzLCB3aGVuIGl0cyBjb21wbGV0aW9uIGhhbmRsZXIgcmV0dXJucw0KPiA+ID4gdGhl
IGNvcmUgd2lsbCB1bmxpbmsgYWxsIHRoZSBVUkJzIHF1ZXVlZCB0byB0aGUgc2FtZSBlbmRwb2lu
dC4gIEZpbmFsbHksDQo+ID4gPiB0aGUgImhhbHRlZCIgZmxhZyBzaG91bGQgYmUgY2xlYXJlZCBh
ZnRlciBhIGNvbXBsZXRpb24gaGFuZGxlciByZXR1cm5zDQo+ID4gPiBpZiB0aGVyZSBhcmUgbm8g
bW9yZSB1bmxpbmtlZCBVUkJzIHN0aWxsIGluIHRoZSBxdWV1ZSBvciBVUkJzIHdhaXRpbmcgb24N
Cj4gPiA+IHRoZSBiaCBsaXN0IHRvIGJlIGdpdmVuIGJhY2suDQo+ID4gPiANCj4gPiA+IFRoZSBy
ZXN1bHQgb2YgdGhpcyBpcyB0aGF0IGFueSBVUkIgcmVtYWluaW5nIGluIHRoZSBxdWV1ZSB3aGVu
IHRoZSBmbGFnDQo+ID4gPiBpcyBjbGVhcmVkIG11c3QgaGF2ZSBiZWVuIHN1Ym1pdHRlZCBieSB0
aGUgY2xhc3MgZHJpdmVyIF9hZnRlcl8gdGhlDQo+ID4gPiBmYWlsaW5nIFVSQidzIGNvbXBsZXRp
b24gaGFuZGxlciBoYXMgcnVuLiAgV2UgY2FuIGFzc3VtZSB0aGUgY2xhc3MNCj4gPiA+IGRyaXZl
ciBrbm93cyB3aGF0IGl0J3MgZG9pbmcgaW4gdGhpcyBjYXNlLg0KPiA+ID4gDQo+ID4gPiBUaGUg
ZW5kcG9pbnQgcXVldWUgc2hvdWxkbid0IGJlIHJlc3RhcnRlZCB1bnRpbCB0aGUgImhhbHRlZCIg
ZmxhZyBpcw0KPiA+ID4gY2xlYXJlZC4gIEVpdGhlciByaWdodCBhd2F5LCBpZiB0aGVyZSBhcmUg
YW55IFVSQnMgaW4gdGhlIHF1ZXVlLCBvciBub3QNCj4gPiA+IHVudGlsIHRoZSBuZXh0IFVSQiBp
cyBzdWJtaXR0ZWQuICBEb2luZyB0aGlzIG1pZ2h0IHJlcXVpcmUgYSBuZXcgSENEDQo+ID4gPiBj
YWxsYmFjay4gIChJdCB3b3VsZCBhbHNvIG1lYW4gdGhlIGtlcm5lbGRvYyBmb3IgdXNiX3VubGlu
a191cmIoKSB3b3VsZA0KPiA+ID4gbmVlZCB0byBiZSB1cGRhdGVkLCBiZWNhdXNlIHRoZSBlbmRw
b2ludCBtaWdodCByZXN0YXJ0IGJlZm9yZSBhbGwgdGhlDQo+ID4gPiBjb21wbGV0aW9uIGhhbmRs
ZXJzIGZvciB0aGUgdW5saW5rZWQgVVJCcyBoYXZlIHJ1bi4pDQo+ID4gPiANCj4gPiA+IFdoYXQg
SSdtIHRyeWluZyB0byBkbyBoZXJlIGlzIGNvbWUgdXAgd2l0aCBhIHNpbmdsZSwgY29uc2lzdGVu
dCBwcm9wb3NhbA0KPiA+ID4gZm9yIGV4YWN0bHkgd2hlbiBoYWx0ZWQgZW5kcG9pbnQgcXVldWVz
IHNob3VsZCByZXN0YXJ0LiAgTWF5YmUgc29tZW9uZQ0KPiA+ID4gZWxzZSBoYXMgYSBiZXR0ZXIg
c3VnZ2VzdGlvbi4NCj4gPiANCj4gPiBTb3VuZHMgbGlrZSBhIHBvc3NpYmxlIHNvbHV0aW9uIHRv
IG1lLg0KPiA+IA0KPiA+IEp1c3QgdG8gY2xhcmlmeSwgY29yZSBzaG91bGQgdW5saW5rIHRoZSBy
ZW1haW5pbmcgVVJCcyBxdWV1ZWQgdG8gdGhhdCBlbmRwb2ludA0KPiA+IGFmdGVyIHNldHRpbmcg
dGhlICJoYWx0ZWQiIGZsYWcsIGJ1dCBiZWZvcmUgVVJCIGNvbXBsZXRpb24gaXMgY2FsbGVkLg0K
PiANCj4gQWJvdmUgSSB3cm90ZSB0aGF0IHRoZSByZW1haW5pbmcgVVJCcyBzaG91bGQgYmUgdW5s
aW5rZWQgX2FmdGVyXyB0aGUgDQo+IGNvbXBsZXRpb24gaGFuZGxlciBpcyBjYWxsZWQuICBJZiB3
ZSBkaWQgdGhlIHVubGlua3MgYmVmb3JlIHRoZW4gdGhlIA0KPiBjbGFzcyBkcml2ZXIgbWlnaHQg
c3VibWl0IGEgbmV3IFVSQiBhZnRlciB0aGUgdW5saW5rcyB3ZXJlIGZpbmlzaGVkIGFuZCANCj4g
YmVmb3JlIHRoZSBjb21wbGV0aW9uIGhhbmRsZXIgbGVhcm5lZCBhYm91dCB0aGUgdHJhbnNhY3Rp
b24gZXJyb3IsIGFuZCANCj4gdGhpcyBuZXcgVVJCIHRoZW4gd291bGRuJ3QgZ2V0IHVubGlua2Vk
Lg0KPiANCj4gSXQncyBhIHJhY2UgYmV0d2VlbiBjb21wbGV0aW9uIG9mIG9uZSBVUkIgYW5kIHN1
Ym1pc3Npb24gb2YgYW5vdGhlci4NCj4gDQo+ID4gIkhhbHRlZCIgZmxhZyBzaG91bGQgYmUgY2xl
YXJlZCBhZnRlciBVUkIgY29tcGxldGlvbiByZXR1cm5zLCBhbmQgZW5kcG9pbnQNCj4gPiBzaG91
bGQgYmUgcmVzdGFydGVkIGlmIHRoZXJlIGFyZSBhbnkgcGVuZGluZyBVUkJzLg0KPiANCj4gVG8g
YmUgY2xlYXIsIHRoZSBmbGFnIHNob3VsZCBiZSBjbGVhcmVkIGFmdGVyIHRoZSBjb21wbGV0aW9u
IGhhbmRsZXJzIA0KPiBmb3IgX2FsbF8gdGhlIHVubGlua2VkIFVSQnMgKGFzIHdlbGwgYXMgdGhl
IFVSQiBnZXR0aW5nIHRoZSBvcmlnaW5hbCANCj4gZXJyb3IpIGhhdmUgcmV0dXJuZWQuDQo+IA0K
PiA+IFRoaXMgYWxsb3dzIHRoZSBjbGFzcyBkcml2ZXIgVVJCIGNvbXBsZXRpb24gaGFuZGxlciB0
byByZS1xdWV1ZSB0aGUgaGFsdGVkIFVSQg0KPiA+IHdpdGhvdXQgY29yZSB1bmxpbmtpbmcgaXQu
DQo+IA0KPiBUaGUgY29tcGxldGlvbiBoYW5kbGVyIHNob3VsZG4ndCBkbyB0aGlzLCBiZWNhdXNl
IGl0IHdvdWxkIG1lYW4gDQo+IHJlc3VibWl0dGluZyB3aXRob3V0IGRvaW5nIGEgY2xlYXItaGFs
dCBmaXJzdC4gIChDb21wbGV0aW9uIGhhbmRsZXJzIA0KPiBjYW4ndCBkbyBjbGVhci1oYWx0cyBi
ZWNhdXNlIHRoZXkgcnVuIGluIGF0b21pYyBjb250ZXh0LikgIElmIGl0IGRvZXMgDQo+IHRyeSB0
byBkbyB0aGlzIGFueXdheSwgSSBzZWUgbm90aGluZyB3cm9uZyB3aXRoIHRoZSBjb3JlIHVubGlu
a2luZyB0aGUgDQo+IHJlc3VibWl0dGVkIFVSQi4NCj4gDQo+IChBcmUgeW91IGdvaW5nIHRvIGFz
ayBhYm91dCB2ZXJpZmljYXRpb24gdGVzdHMgdGhhdCBzZXQgdGhlIGVuZHBvaW50J3MgDQo+IEhh
bHQgZmVhdHVyZSwgc3VibWl0IGFuIFVSQiwgd2FpdCBmb3IgaXQgdG8gZmFpbCB3aXRoIC1FUElQ
RSwgYW5kIHRoZW4gDQo+IHN1Ym1pdCBhbm90aGVyIFVSQiBmcm9tIHdpdGhpbiB0aGUgY29tcGxl
dGlvbiBoYW5kbGVyPyAgOi0pICkNCj4gDQoNCkhvdyBhYm91dCB0aGlzOg0KDQpJbnRyb2R1Y2Ug
YSBoYWx0ZWQgZmxhZyB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQoNCiogSW50cm9kdWNlIHRo
ZSBoYWx0ZWQgZmxhZyBpbiB1c2JfaG9zdF9lbmRwb2ludA0KKiBUaGUgaGFsdGVkIGZsYWcgbXVz
dCBiZSBpbXBsZW1lbnRlZCBhcyBhIGJpdCBpbiBhIHVuc2lnbmVkIGxvbmcgc28NCiAgd2UgY2Fu
IHVzZSBhdG9taWMgYml0IG9wZXJhdGlvbg0KKiBPbmx5IHRoZSBIQ0QgbWF5IHNldCB0aGUgaGFs
dGVkIGZsYWcsIGFuZCBvbmx5IHVwb24gY2hlY2tpbmcgdGhlDQogIGZpcnN0IFVSQiBjb21wbGV0
aW5nIHdpdGggYSBoYWx0ZWQgc3RhdHVzDQoqIE9ubHkgdGhlIFVTQiBjb3JlIG1heSBjbGVhciB0
aGUgaGFsdGVkIGZsYWcsIGFuZCBvbmx5IGFmdGVyDQogIHVzYl9yZXNldF9lbmRwb2ludCByZXR1
cm5zICh0aGlzIG1ha2VzIHN1cmUgdGhlIEhDRCBkcmFpbmVkIGFuZCByZXNldA0KICB0aGUgZW5k
cG9pbnQgYmVmb3JlIHRoZSBmbGFnIGlzIGNsZWFyZWQgYW5kIG5ldyBVUkJzIGFyZSBhY2NlcHRl
ZCkNCiogVGhlIHVzYl9yZXNldF9lbmRwb2ludCBtdXN0IGJlIGNhbGxlZCBhZnRlciBjbGVhci1o
YWx0LCBTZXRJbnRlcmZhY2UsDQogIGFuZCBTZXRDb25maWd1cmF0aW9uLg0KKiBUaGUgVVNCIGNv
cmUgd2lsbCBub3QgYXR0ZW1wdCB0byB1bmxpbmsgcGVuZGluZyBVUkJzIGR1ZSB0byBoYWx0ZWQN
CiAgY29uZGl0aW9uDQoqIFRoZSBIQ0QgaXMgcmVzcG9uc2libGUgZm9yIGNvbXBsZXRpbmcgb3Ig
Y2FuY2VsaW5nIHF1ZXVlZCBVUkJzDQogIHdoZW4gdGhlIGhhbHRlZCBmbGFnIGlzIHNldC4gQ2Fu
Y2VsbGVkIGFuZCBuZXdseSBzdWJtaXR0ZWQgVVJCcyB3aWxsDQogIGJlIHJldHVybmVkIHdpdGgg
LUVQSVBFIGFzIGxvbmcgYXMgdGhlIGhhbHRlZCBmbGFnIGlzIHNldA0KKiBUaGUgY2xhc3MgZHJp
dmVyIGlzIHJlc3BvbnNpYmxlIHRvIGNoZWNrIHRoZSBoYWx0ZWQgZmxhZyB0bw0KICBkZXRlcm1p
bmUgd2hldGhlciB0byBpbml0aWF0ZSBlcnJvciByZWNvdmVyeSB2aWEgdXNiX2NsZWFyX2hhbHQN
Cg0KSSdtIHRyeWluZyB0byBrZWVwIGEgY2xlYXIgc2VwYXJhdGlvbiBvZiByZXNwb25zaWJpbGl0
aWVzIGJldHdlZW4gSENEDQphbmQgdGhlIFVTQiBjb3JlLiBBbHNvLCBJIHRyeSB0byBrZWVwIHRo
ZSBoYWx0ZWQgZmxhZyBtb3JlIGNsb3NlbHkgbWF0Y2gNCnRoZSBzdGF0ZSBvZiB0aGUgZW5kcG9p
bnQuIA0KDQpMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluaz8NCg0KQlIsDQpUaGluaA==

