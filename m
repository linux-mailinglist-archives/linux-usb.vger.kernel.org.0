Return-Path: <linux-usb+bounces-1527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57077C75C6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 20:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC2D282A6E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 18:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626B63A270;
	Thu, 12 Oct 2023 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iMXBdUQl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aMGJjv34";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PLt5/er3"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEECA347CD
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 18:21:17 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BFCBE
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 11:21:16 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CHMsJu004737;
	Thu, 12 Oct 2023 11:20:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=86qgipvStGy35qNTXfhrYhj7CQBSwgAm5b+/o2Vjyjw=;
 b=iMXBdUQltOrhvSqyQVLHd2wsOmcVLtOdBMqM6J5+6P8et6ykXyrPL8J2vinpcsGW8e8o
 mYW5vdvoORwVXEpS9jafsCBqNy+JrNwOLOpfNcEZ1lJxIBZcexPm4hWw1YjOv6RK7MOx
 0nI6X48hd/e3PpV1JaWOg52r4vcnUp57fBSGws23w4ij/LhUZcipkqIiEolIxguF2g1x
 7BYw4bCCbdlYm5aphli1d7Vz7JBwDhnwfuEC6WAg3CTfReI7Zli9nUFel8T+F0VEIscr
 RdkWx5nKHrc6dxAWx3fy+kAjp9n/OaUUT3KmKgi/ZFnWYOFgOhkYdqMWgfL8q3+Ve1Xq lQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tkh041r0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 11:20:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697134823; bh=86qgipvStGy35qNTXfhrYhj7CQBSwgAm5b+/o2Vjyjw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aMGJjv34KjBa+LnWMkWkIKM9MXwcZxrR3ia85BArF0c2YuU/9hw6COteCwVKU8wuL
	 nlcrLF0wG1QFr4PU30jzfaJu/tEK9IGvBtfFgMWX320fMKgFzpQV6N8Gq/bAe+TLAa
	 sjjZ8vh8zc8Y3CYnTJagjvrXjhmOlx6WYoRiXQO46dqDIw4wBNPPhclZRwwTsYYeFu
	 45lrx+QasoRMDIwG/hnk6nhxjOtTW9CukCtl3t19g/icETZ+XI2i4CdavQNUS6Bm1a
	 SBiaPVShCUxO8QzhRn1HymSsJVnl+f1SYAIe1STexhosvLrPXppvq09HRtArRSPJ49
	 kXB3J9kAMH2DA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 72B1540493;
	Thu, 12 Oct 2023 18:20:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B1264A0077;
	Thu, 12 Oct 2023 18:20:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PLt5/er3;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D718B40087;
	Thu, 12 Oct 2023 18:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOkOQF4HEXubgHZ9GRmRZRTK3SV/syYiOI1kv/JyEeqlQ/CWN04TEnkXiHH2uRbYq5nrVFaLkqmwFbjYA3R6mYCHBX6DHGNgox56q62n+ENaGGtjVYLbuH+uNSxxk2onpShnJ502/7X6E9hTpaymQJ4ouc1ilHjuAg6AL0blvL2YfE3XEVhilrTKSR6L/4/DZpwdmOOEKhZle/rDIsGGTEFKXzzlRkyPUMTZkdM23/k8lJV1buZHCdS6KEgqlT0/gTJ0Q11YYdva1g4VP4z0MgGR2WP9YyvaheQ+wMuR1zu5MNoeYC4eNq8QcoVpH/exA0xc6UOu0mGoPeYBcUfZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86qgipvStGy35qNTXfhrYhj7CQBSwgAm5b+/o2Vjyjw=;
 b=PxgmR64RQsTQiHVPbzrDDYVp7Si+TGNPW+SQ9kHZwI2DCFMa50QxR4Efdv9WTT8iBbP71VlfJ3e1FUoyQ/CWsSoB0YKKV5ug4ouaAhfveQXeRWzdJbSAKc8PSrAH0FFIPR7r+J3b423sLsbfp6GFmaz2xtOweslsE2T2EfuYlm4Kr+ftYkAzjQy4z1bnourjsZ+M990y8Czees3sFys98WFwpxZlZmKRgnU+MucIq46GDcFVrnfj6wQ01VFUlITEwiSBOubaTK7S3X13f8EaHurNw44qzbLUs/gOG5zLfUcKqDU1hI7ryAx3uTtDEsFls0GGTkZcBME2pSz+3HNmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86qgipvStGy35qNTXfhrYhj7CQBSwgAm5b+/o2Vjyjw=;
 b=PLt5/er3X79e710/IUDi/B/2lld4FUFZmaS4Mq0q4UfZK1JMCiBYXsGywCDYaQomjduJWX+29tjhfCLHNKFqGsbNLW2fWVn8d/mnyhiCsh6Pm9xPIQZ9atowERtGb+xoO/ocE85UquAoULEw7LQUQCSZ93NYYMfwXsJARX5LwI0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4514.namprd12.prod.outlook.com (2603:10b6:5:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 18:20:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 18:20:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dang Huynh <danct12@riseup.net>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Kenta Sato <tosainu.maple@gmail.com>,
        John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        stable <stable@kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Topic: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Index: AQHZ5dyKoaCEdJ+w5UO4Jaesr32Vr7A4RceAgA5f64A=
Date: Thu, 12 Oct 2023 18:20:17 +0000
Message-ID: <20231012181959.kycxp6hqis6o5bbb@synopsys.com>
References: 
 <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
 <6120384.lOV4Wx5bFT@melttower>
In-Reply-To: <6120384.lOV4Wx5bFT@melttower>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4514:EE_
x-ms-office365-filtering-correlation-id: 8b85b727-7a2e-4095-777e-08dbcb4fe2fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kwu1NxSTbz1fuda+IU9yUjKc3YHKFnXRk9zCuTxu9WP/m5xoa/2z81LCTamhjFxRr9pPHmdAvKF2zF9l7Lhzc1pJcsvqvQBzeDwIdy6PkhQSh3yOK8EgTGb3SPEtt5ZH+rbyeKn2ERCa9HyzP4MYNsEaKbqN7jHbM7ZOmYRRdJTFQdKneyejrL62JW55p3pf+VI4vEBzRsTkFOmcNpyOQoalz9f4+vAu7nJACRLDGzKmuuCX5i5lL80NLwDT3S08FM+7N7uTKPSQKDX7vvPe6xDHfpuy/RjFmp0YhDgi1knbUyKtG+nbAeUd7fy/Ploe3uH+NPXqSih/Wd9X47CNXX7fSUb0fhKscYCLlHXYnfGLGb+kkkJBcr4X8s7Txrg/zgzKhr7j5Y8I1ZM95iqaoJDVH1slSixbphCKvRcgzT/IvjilUiltnCpvbq7jNav/gu2+9VHUlI/c4xwgAmKNOoohpGzSKGTLTG3A1ktJedazdwFxCeEJ3zQRamfy+mCqp+cq0PKw/HlWOg0xA7WG6Lurgx4UFkSMKvMpxBmEBrIDDgBLWVVcJTSucmZT054tKuoV7M0AqDzUH+KAJCfZ62CkG6Qk3A8YUOWvHjd8pYIz3rFabOM6Yg/uZQ/4N+JQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(91956017)(316002)(6916009)(6486002)(6512007)(6506007)(64756008)(54906003)(66946007)(76116006)(66446008)(66556008)(66476007)(4326008)(71200400001)(41300700001)(8676002)(8936002)(38100700002)(122000001)(38070700005)(558084003)(1076003)(2616005)(26005)(83380400001)(2906002)(5660300002)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UGY1TThiNXRxTXllTUFjWGRZMXhUbWNZbElqZWc4eHN2RlhCNHg0ZlY1UGFJ?=
 =?utf-8?B?UVM3elpVbWJyeEwwVEhNNFpoWUJhVW1yaElMd0NYYll5QUtJSXlkUTYzSXlC?=
 =?utf-8?B?L0JGTE1KLzVhYW1YdVpOWllKVXZaYVFGTWdkQzRrWE8zemw0Sm1UaktjZ1Uv?=
 =?utf-8?B?U29oWWlNVi9ZODVYa280K2VvRXVaMDFwK29aYjUzUlN4SXhkL00yNmF0MWNT?=
 =?utf-8?B?SzJSb1FCTlUxV0lMWUpNNFBxYlo1MmEzMlZRODV4dHRDQXJpb1NPUzVWODlV?=
 =?utf-8?B?Wmo1QUhvUmVFOU9hdUFxQWRGdHRnUGxFV0k3alFkV3BrSllJUGFaRnB2ckpa?=
 =?utf-8?B?cExmNXp2ZTJrMnd0OWVCdmhHNEdRbnYwaVluVGRwSlcyWE9ZK0Z0N1RIQVJj?=
 =?utf-8?B?TnpTeS94dHRXNTZSUkljT1ZaSDNsRVhMVEFlanhSY0JCRllraFk1azNZNUNp?=
 =?utf-8?B?aUxza1F0TjhUVWNMMXFHa1ZiaDhlMFBadmYyQXF6bnJVaXBwYUZTNFNveVNs?=
 =?utf-8?B?T1A0UlRHcUFpT2tUSGtYVjRRTEtCR1dpQUFsZ2hHL3ZpWUxobmliTjJhYS9B?=
 =?utf-8?B?bU8yckNQWllBek50S29CWm1sNFROVzVPdlNEeUY5bDRPanhVeXQwanFUMUVB?=
 =?utf-8?B?VlR6RVg5aEFBcVRaNklDcitXRURxQVozTVNVWE1ORHJZZ1F1b3hBQnVER1pQ?=
 =?utf-8?B?WGhHc0R0S1NVSklXbkhDYTJuRVYvOHYzZXdOZnh0blpDT1dhd2pSWWJLN0pJ?=
 =?utf-8?B?YjJxYXQxTmhaT3BQRmVzYmQ1Ym1FOUZDQ3UrNFhrVjZ5L28zVkU4VnduZGxY?=
 =?utf-8?B?RUdRTnFocWpoTkdkZXFsaENLT1ZNYnRML04zT24zcXVkR0JKVlFiTkRPdG9r?=
 =?utf-8?B?QkE2WFdtYUluUnA1RFllMEQ0YWNudmE1SSt1eGtPQmNNOStZRUZycHBhTXph?=
 =?utf-8?B?QmxDeTkxVzFLc3ZXUlVXbHFlL3RhS1pRaFpJMVBvMlNBNkJPUHBGYkFISWZm?=
 =?utf-8?B?c1lZR0tBVmFtTlg1VUY1N21VMXZyZENIK0d6elVTelBCQmkxMjhKUUZDVWZF?=
 =?utf-8?B?M0pQdTRJWnYvT1ZpVlVDbnBRcDdISlNUcVd1M2JSenMvN1NVUXloTzVpMVRq?=
 =?utf-8?B?aVM2MWtVQzRucVlGV2xReGRiS3FtNzQ2dGhhUHlXK1EzZXFHMXI5aEZNZ3BO?=
 =?utf-8?B?eVBVanBaaU9aMldUOEtKc3BnVUhrYmwyaTkzZ2tQWGx4Z1pEVnI1YUxDaGpL?=
 =?utf-8?B?QmcxQTZlNTh1Nm91QkJnaE9KczFiTjhSZnVrSFY5NUNNMzFScHJyb25uWXE5?=
 =?utf-8?B?VGpxMzJGWnUwb1VPdnpvdmtBMjNFS0RHTXhoV0FoY2tKTldaN1dqTkRaK3N3?=
 =?utf-8?B?TVlwQ3ZoUnQ0TXdyKzZyOTdTYmRUSnk4a04xMTd1d1lTdVg1R2d5L0NidEcr?=
 =?utf-8?B?ZHUyTDV4eW5rR0NLU0lyZ0kyekZTSGxhNy9xQmtabHVwY01uSDFHdThJVVJM?=
 =?utf-8?B?YnRINUtoU2lGUU9PR2IyOXZNVTNOUGF3YmpaSitlS2xzK2RJNzkrKzlDNkJX?=
 =?utf-8?B?ODcrdWtwMS8yU0t2eXBCa1hCMlhEYVAwMlJiVDFVaVRQdG1ZQkswckIwQnRZ?=
 =?utf-8?B?N1VSeDQycmNUaFlkQ3RmMmpVMDVBcmtWaWpIU29zMXZHbzZYWDZoYXh3VE9w?=
 =?utf-8?B?cFhNNEJHQWt3dGNBS0xxazNIcVorMWhPN05iaVFiSnFYSlpkOHkxRmJ3VUIr?=
 =?utf-8?B?d0o0TlZaVWFUMm5FY2ZOMWRXZ01BeVZOTkxJQzZKRjRzVGVGb1VCdTVNOW9z?=
 =?utf-8?B?Mmk5SEhvZmVRa0NXbVd6ODBJR1Vkam1VWG5zTWwvNEhjYVA1cVJXbVg2T2g4?=
 =?utf-8?B?Uk1sVW9hZHZvUWYxSTdaaFNrUmpFZlJhVHNHMnh6ZEtaTVpBVVoyS1dDbjdx?=
 =?utf-8?B?aThMMWFzN2NUeE9UUTZPMGRSWmJXbGdlOEJkUUNvbzc0UTI3STBycXpQWVpk?=
 =?utf-8?B?YjQvYUVVSzY2TTdhdUdMajBvbXlDRnpOdnBnOHBvRHVZZFZXQmhibTVCcURR?=
 =?utf-8?B?N09iTGFROU9XMXF6Y1NpVVBDYXNTVmFlRnNnZkhZcC9hVHFuamJ0L2c0dHV0?=
 =?utf-8?B?VnlIYzRIMGNiSmpMMjd6OVNnWllQNFUxdmdoWlFVQVluUlpxTWcybiswZHJs?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1B45C9EA679DC41AA47ADE3A6688C10@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?S3BUYnVRYmpvNDYrbXNGYi9YMDdENVJXZG1vK04wSDV1cEs2WElTSVFoYVdH?=
 =?utf-8?B?ZmxwQjMyL0VTbnZPRmRWTWRkd3JwRU53Q1BHbWVpdmJXQUdPOXdtVE1rOUFJ?=
 =?utf-8?B?R0IzeHpZTDJWNldTUzFLSU1xV25mNmNaeXpCVjBYMUgxTVVrZUhoODRpZm9G?=
 =?utf-8?B?REluelk1UGJNNE84OVVvSmJsSDkrcEVEZmhZa2VKbXBKbW53Ky9TZ0ZxVWZB?=
 =?utf-8?B?bGxzL3NQMk00V1A0RThxNzdBOGwrS2pJdjNaSytFVG4wV3VSS0VxcGtyaHA2?=
 =?utf-8?B?Sk9MOEZUTWl6QTN3S2x3YVZ5Y29HMjEvRVJFT25SZENqV09mK2o2NzNHektw?=
 =?utf-8?B?Q3YzaUNrclYyd0hKUDZ2Wmx3dk1uOHY0Yks2UHU4MDR4ZStxOTJ6OUoyZ0hN?=
 =?utf-8?B?aitSZWprWk9rR0xUbjNwUmp4Q1JZc0VEREkvejlWNnQ0RE1LKzBNSEFGRTZr?=
 =?utf-8?B?OHpoN0paVGwzb1R1aDJhTyt6NVdrTWxicXduUWtOellITWwyMTFiMkFFb1dZ?=
 =?utf-8?B?ZGdoZEhzL2VXZDhKWjBLUHVGVGtYcE5GRlBHejJiMEpzNHJsMGtNL2FiTUk3?=
 =?utf-8?B?UTBhQWdOMGFUL1VlV3RhRTFxNzBGNHZxN2pweEVaZWlhMGd6OW4vdDJXb2hq?=
 =?utf-8?B?RG16OHVrNUx3c3JvVjlpWkNVWFdTWm0rQ216NkNBQjB2R1NIUUIySkhqWVF4?=
 =?utf-8?B?U1BmYUw5QjFvOGQ1NkpnRXNzS0FqUGh4SXowaml1OFlIaXZCSU1xcnk3c0Fo?=
 =?utf-8?B?SnBsc1Jpc2RsZmkraTFSYkpvQ1ZwYk9BczF6OUQvR3VTY3dpM1JGd2JRNmhO?=
 =?utf-8?B?WTlXUzVLdzRVUVphT2o4RHVRWkxXZ05sMWc2THVhb1NaMVVrUk5zWnp5cnZo?=
 =?utf-8?B?V2ZVM1VhaFZkUGJzSVpCeFNTandod1VjS0hWUXpRT2VQcmE0UkJwenI0L2Vx?=
 =?utf-8?B?U2w5aER0S3pzNGN1UGgrNkJ0NzlYK0JWUDh0K2xPakdXS2VRWWJsaGh5RVlB?=
 =?utf-8?B?L2FyYWlyZkI3WFNNN2tLRnBwb0ZwVXlYUi95Zm9FNWZ0SWdjNFlGWkxvRHhZ?=
 =?utf-8?B?MnNubEZrOXRCVU4wZ3hyTHFUQ1QzUzFNcFE5ZUoyNTdrQmdJWDAxNzlndVly?=
 =?utf-8?B?UjYrcVlwUEVnNVZHNkJxMGtoVEhCckxVSmZTdWd5WEx3aWMvL2dHdEdmU1N3?=
 =?utf-8?B?WXcxaVNmVVh1ZzRLdHRPT3VzMmFLTmIxcE05Y1kzMmNwWXdOcktFNWdjS3o4?=
 =?utf-8?B?NU1hVHlBU1dyS04xVmpvTXlPUkJvUzdiM0plZS9lMWg5bEcyR2tWaXlicXll?=
 =?utf-8?Q?9GFtGcDW3lQtY3HROy/V6EBZXgyDXd6IPm?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b85b727-7a2e-4095-777e-08dbcb4fe2fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 18:20:17.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMZHJrcBpn1jX8bfb/sPi6Hs0ktojlE7vtDdUVFUuk4dIzpw6KG4VBfjbDgFd10u9kZkrNvnJ5DoTybdrxo+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4514
X-Proofpoint-GUID: RK4b3bCBFsA_UVeU3Fq7nPGObi5na3sx
X-Proofpoint-ORIG-GUID: RK4b3bCBFsA_UVeU3Fq7nPGObi5na3sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=607 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120151
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gVHVlLCBPY3QgMDMsIDIwMjMsIERhbmcgSHV5bmggd3JvdGU6DQo+IEhpIFRoaW5oLA0KPiAN
Cj4gSSBjYW4gY29uZmlybSB0aGF0IHRoaXMgcGF0Y2ggZml4ZWQgdGhlIFVTQiAzLjAgcG9ydCBv
biB0aGUgUGluZWJvb2sgUHJvLiBJdCBtYXkgDQo+IGJlIHRvbyBsYXRlIGZvciBhIFRlc3RlZC1i
eSBidXQ6DQo+IA0KPiBUZXN0ZWQtYnk6IERhbmcgSHV5bmggPGRhbmN0MTJAcmlzZXVwLm5ldD4N
Cj4gDQoNClRoYW5rcyBmb3IgdGVzdGluZy4gSXQncyBhbHJlYWR5IGluIEdyZWcncyB1c2ItbGlu
dXMgYnJhbmNoLg0KDQpCUiwNClRoaW5o

