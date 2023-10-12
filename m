Return-Path: <linux-usb+bounces-1543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B57C796C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 00:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AFE0B208FB
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 22:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113673FB3F;
	Thu, 12 Oct 2023 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kZFkkQxh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bro09EDf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cSbmw1pS"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD683B28A
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:23:46 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E43BB
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:23:45 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CK0Yw9023948;
	Thu, 12 Oct 2023 15:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=o4HVHKQofgyZyio8NyFJrOTCZmHL2bB52oxIw39bzD8=;
 b=kZFkkQxhpExPbeIu+VDEJ5ejJxLaxyNxK6KSMNwg5Cp+z0uTNhkOAqbpZYy/9TjoDh/v
 at/pS4Rkie0qAzLW25tT9To2vtQvA0IKUJAgazaQoTnmS/yt//3qqIlJgnKjUMnY9EMJ
 izAXeIkOIsmNIrHODXH8I9MVNKuOSkvWo7mQhqKzMGg5VFbA5LTpQm90v52mcP7bch8F
 NUbOGckrXldsAdTphiW+da0wy2cY71ei22j4ShXX3jLpmAqrqQjOtS3rnUIpocQTjboY
 CveCJwfk/pY1Qjkuf7aAc3NgvSMfyK1knKTBlPW0ydN1B8NkIt4gVzYLJFWjwqnmw3DV Rw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tkh042mh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697149420; bh=o4HVHKQofgyZyio8NyFJrOTCZmHL2bB52oxIw39bzD8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bro09EDfeIwDT9814A7TKtGQhXyfuLs0k4EQcH9Xo1XaDb1X3kQAGp7q2F/mfJqe3
	 JB2SbTv6OWMWgH+F5+zXDrHVwz5LX64ZS/UGUJw4otKb5xSA46KAipzB7w6pVJ70W7
	 EJZq1qJuWAys+NW2JeMOQxE00YjypESSISPkTSZWvcPT+oBo+FBn90ZQHxtEZTiNaf
	 mKp/NIc1eUWVSWJkRJP3iF4EPmV0JjhABB5DFkPlVM8nSNjz+ZXP5EZ1dyRiAs3rBM
	 Aff5yUisUK4reUqTYJ1d9ne/qhi8AnzNjanvXGe2DaXiSi6LLNiasP+SpQxkrGY0wf
	 d3UXfI8ml6Ltg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A2774054A;
	Thu, 12 Oct 2023 22:23:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 56273A0085;
	Thu, 12 Oct 2023 22:23:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cSbmw1pS;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1778640169;
	Thu, 12 Oct 2023 22:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/bqoKukbuIBzaOdJexbmyEFkJxgU85EstrRcHCm9hH8/bCctP8m+yKOyjrntSZeCA9MZEHl46GGpaw6Ysi0q8/FnNJG+FfIOwoFSAb5pREnxIHGdiQExclADNNd2bKPU0O7MoosUSwYJKbTUYfg9DWcn0KTo327m+HenIqisTAK+z7aRX0WNAsmVGo4DAPGMv5ZLKuAXHXe2D1ZzswSDEfpR6t2abVOvOfc+TTVzE/cp34N/SPr2u8Id8BDLtyKsIIlJfowEt74X6FA2OU7zvwfqFBx4O6auJ/Qvh5wjfbkgSs5BEUQ6FeSo28uVpSD+Ts/XwhAJtCsa4DPhzYL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4HVHKQofgyZyio8NyFJrOTCZmHL2bB52oxIw39bzD8=;
 b=StbQwhGkDAODSnnn+XUMfyJVAhDWCGWzhvkMl8cGN1BfvkbAdbTnTXD965PwKl/ij5uGQLJ7AwKxSMJE4AXFgGXlmzdzXPhaMgkQi6pIHTa40Tc8LmX1SxsrWREeaRfT55UaqQiF2tkTubQ7xd1qALrHmOug1gg18JldRbbNGL0vED/BWW9QklZMgiSX8StSvE2N8mq21cetmwz9l+pyXPrkIgZ+dNaJdsXafmN1dsgJqEvseIVAQp6kkj5+pe2WPWTGhHd7j+RlzLoeXmxvfrfOyIYUuy2X/bHAlOInlISfyyIaUAkNIxtrtBrzs0AuOl1SX1A23dS81WWhh4hRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4HVHKQofgyZyio8NyFJrOTCZmHL2bB52oxIw39bzD8=;
 b=cSbmw1pSFdISjEmHgVn6ieDEmMSXgonVQvQzh7KLTMqM31Eb1CyHbmjLudtXSA9dOzPHE7IrvkB1is7JV1baIoOOy0ommel92Ne/sIyCRqtSOfm1Ie5/+NGOVW3uRoYlUtoNoW+xM8m76vO9g9yq3VTK+00+MBp88KXF9jzeSBc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:23:30 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:23:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ladislav Michl <oss-lists@triops.cz>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Thread-Topic: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Thread-Index: AQHZ/UD3pAn64kboaEKjcKPKLnMEgbBGuvAA
Date: Thu, 12 Oct 2023 22:23:30 +0000
Message-ID: <20231012222328.ts3z3csvxi4obkig@synopsys.com>
References: <ZShGmL4mph91Ncib@lenoch>
In-Reply-To: <ZShGmL4mph91Ncib@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH0PR12MB7906:EE_
x-ms-office365-filtering-correlation-id: 399acd6a-f47a-4827-d2b0-08dbcb71dd44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +3dK6bTqsSCBl4gn6Y0B+QLrEjab2s91VnsAJ3l29nnbNv2XBEk8YtDWsDywzDJaZTejwXFRDNge7X/VM1tJRga80Z7qbFdv1wH4fRShpa3IThzUACxxULRgvE+OcLNC31NWJJs6kflotiV5Yk9xTxyiOZoVT0FMZnA54ZY6dSXSxJI7qiIiD9wqYkwWWhKoDOpKVt9F9ap/Q0m5xhykEtfOnw7E10TiEtqOZNrFwBdb4P5fy/mYuHeZGjpgFcy60yDb1jBdhUPV2ujiA8ohTuK75QccB4nQpEDYUHw/2Mv32E/Awa7cOiDANlX1n29pjE7UaQAjEIxQm5ap+rPFiAWUkFzPJqTxOI1adNR+wvQaLnzfhMZN2PPdwEZpNUXbhuv7Qboo4AOqr4bSQwDU8/fJ1LTO98nmDfQQDfSBy+wsdfJCwC3v5vOacclAbfO9Q+XjbR6odE+MAiKZcWz3HBlsYfEBhl2zwP5v0QQZ6PEYUPmzn1R4pD/LH/3QX5OGwQzzkodoLeXkxu2z4TqrFcIKPyjYvychj7I12bgZbPEq26ioh8tiqHs1v7daZxTAaGxbyA/SPbcCJhjUAJmISZ5GX4QxTzoNZYibqU0veOob6Qyx0SeZzeIpCV0hqR5m
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(122000001)(5660300002)(38070700005)(41300700001)(4326008)(8676002)(8936002)(86362001)(2906002)(6506007)(6512007)(71200400001)(64756008)(107886003)(36756003)(83380400001)(478600001)(1076003)(2616005)(26005)(66946007)(66446008)(76116006)(91956017)(38100700002)(54906003)(66476007)(66556008)(316002)(6916009)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzZidFVTcGd1UHJSMThBQU9yUS9xOTZxVGZ2U1ExY21JMjlCNlRNMG84ZWhl?=
 =?utf-8?B?VkdQYWVDTE9lalkxVXdYa0hDdzkwLzVCU0RKM2ZOUXBwalRsTlJEZnRXM2dt?=
 =?utf-8?B?eUhQUXk3RFFjMDFlNXJrbjh0SWQ1WU9HaW5zbjk0Tm52NSswYUxKUzdacmZT?=
 =?utf-8?B?Y200REd0Qys4NEpWN2dPYzhZWURqLzAvUGRtSkpnN09zTEpMckVLbUMwOWlY?=
 =?utf-8?B?R3A4MkUwSnUxRjFNZTNBV2s2aExRMUkzWERqVDdvZG54Uy9LeGhocWJCQ3Nq?=
 =?utf-8?B?VVIyVjhkMzFWMDQ1ZG5Zbm82U2k1bUhaM245d04vZ2lZTW9BZC9MMVZzMmRB?=
 =?utf-8?B?VCsvaFZNdjlnUkdmNkcycFJsSTVUTkdiN3N0OFFIcXRRSTZHZWg3VmhGaWFW?=
 =?utf-8?B?SVA5NTNMdlZqTERRTWdobDJ6dng3eWY5Smh4eXc1QnRHNzNWZjJNZ2RiOENi?=
 =?utf-8?B?UzRqUzJGQTdJVUVhOC9EeU5EVGdhYnZySTh1MmpJaG1za3o1bkl3aU9QUnJz?=
 =?utf-8?B?aytmaHY0QThlbEtMcERja2Q4czZ6NzRIaGhIeFZra1FCUVhZdHNqeFAzeW5h?=
 =?utf-8?B?TEZ3RDh0OWZCR0d4azZGazdTNS85SUdZUzlSRUVwRE10bW0zUmNocmNTcGtM?=
 =?utf-8?B?TlU5cS9Sc3ZMYzNRM0JQa001ZDk4b1FPaXlyMTFJWnAxTlFIdVRLaFBhNDBi?=
 =?utf-8?B?TEZZVGZRMGNxM2hJVGpJRkRJZkV3L0orWjlNVWtvQkNnREk0ZUhHUWJGb3ZC?=
 =?utf-8?B?bFNuc25VdnV6cHVMZUhpcnV0QkRsamtyQmtWTGxMYkppb2pTaWo0Tm9pSjBw?=
 =?utf-8?B?ZXJJVi9Kc2ZuVlNoSVFXbXpkaHp0YUlyKzV6ajVTODU1ZStzM0YrREFWam51?=
 =?utf-8?B?SUdnc1Q3WU5EY3F1ME9tcThPYnNiK2tVZjMxRXRtd2JQWnpRdm9XNjdkVDVP?=
 =?utf-8?B?eUFKdldqWDF5R2E3UGhoYjRKMkFMNHBQKzcxcU5HVFNwbXFDdnp6OGFEbE9Q?=
 =?utf-8?B?NlpZRHVYMGF1bWNKUG5jVnFaNmpRQ2RUV21zWXZoQWxFNXVMLzYrajkvSmpM?=
 =?utf-8?B?WUg2R1pqK1p1QVFkUFdYWW4rcEptS0xWQXZkTjhKZXY2YXh6SG1LcmY1WW9m?=
 =?utf-8?B?cDJ5cTQzRVpUUGdMRjFGd1JiczVGSGJ4dTZtRUdvS3BkYk5HaVYycTBpSUtM?=
 =?utf-8?B?M3RrQ3BUS1J4V0tEMUd6VDdWUFFhTWFFbUwrOTdHL0NJaWFraXJ0cUs2bUVT?=
 =?utf-8?B?V1k0dWFQcUZyYVZ6OU9XeHBPMXBrajdac0lNSjQ1ZW9lNGNDUStLQThZdHEv?=
 =?utf-8?B?eFp5N1hRb1krV3RMbzdCV0Ewc2V3eHhVWFMyanJ1WXRuWXVlSDNZQkl6WjJF?=
 =?utf-8?B?d1R4bk56WlNDcVJ3QzB4aUxxaHVSZC9HMmVneFJraWdiYXNZNklxVW1WRThh?=
 =?utf-8?B?RVZ1Q2lKeC90V21iUTA0WDdCV1p2RjExVG1WUzdlWGxFTjVDaVluNFFuL2hp?=
 =?utf-8?B?ZjhyOW01djgzRFFUeGhTcEtZWEtNcDB0Y0k4dkhWTkQ3dHlWcW9kQjVnZFZ3?=
 =?utf-8?B?YndjOWZsUjkxaFpEbHVmRkg3NW9YcUthRTZ4RWN2SG43TXMzTExVT25PTkp4?=
 =?utf-8?B?b2pnRDJNMmJNVzVzeFRGQTVGVlhQTlByZWQ4aFJCWVg5dlpYc1lRbUJveXUw?=
 =?utf-8?B?UDVaMU5qSVZ5cHVPc3d5YjZsQittUW1YaVEzNHBOWExpRjVCYm5LMS83UHRr?=
 =?utf-8?B?cnRmVE5CYVhEMktLZmswN3FoYVhPN1F3WEo4YUtLS2NYWFkzRmg4bGRYaTZB?=
 =?utf-8?B?ZHZpWXByaFhPVld0UEpEYnRDQnFwRnpJVkxrcklLWXlNOG14VnFCd0diSnYw?=
 =?utf-8?B?eTFHVEpsOFlOelhJR0ZlbWhRdmVsYktybzlIN1BwV3orNUx5eE9hQTJQWDRD?=
 =?utf-8?B?UlUvWVlaMnJ0cFd6VTJCMVJiWTZRWG5KTmVCL0R5bk9GaXN4WmljNmRjNVNI?=
 =?utf-8?B?QUx3bElpUGdhMmJtUkF3SHZhaVAzTWpIUkhDS1N0cVNwd0pnUnQxM2s1cEtV?=
 =?utf-8?B?dDdPUHJwYitoNDFQZE5Kb3hxVXk3bkRUKzlMYXJTaHdNaEROSTRRNHBXWlpj?=
 =?utf-8?B?SVhTeW9HSGNQSU9KeXFIOU9xbkhHNmU4eENoc00zeWRRWEFaQWlibExKaXpG?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D3BDC77A71E814CB2280445B73F6CB1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mVE/UQIPAXmtOUOQR5PQr+XIvQ0S4pCo38Huj+XjZtUu2Qeou4vvNnH3m1SZLBSaerkkCXG5eG+SMgsjxoyW4u99DLiJ1MaFQzM+VES47o4lD4CZUU39Q3tdUdCF/7GGuCRHB6oE7haP8+otsGERqL5ax5UO+sVLCOSVb21SEJmfySwfFFuaDIRsvoNJdU6lZIKYGLu68dGeJuLVjVIkR1P+S8ns/wF7v3iJbWvfW9Oxkm9mjzU4Gej4jEN2ia/WjUZbBDI22/etHkahdRFI28gsWnodQkxFPI5GXALtJNOTzICjRhsuCNc51XhitlnyfN0/0W5N+P0F7ijxqjo39HYQuKC6sONKCHMl8dURJhVdQC1ossJlu8kfZGpmrKc3Eil5LqUkQs9iCEFBXD+i9642rqVdEv+4548axzbYJYIAAgaacAqjK4UGrNr507dy9vOotbHQRAzuS+ueI4Xr6fiBdXVxQwhH+3EvyVTaScMAc34rbIEq2SrgYFNAR1TeQQPGilqLICuYbS4Bkacv3IJ4WqIuvzQpqIr4CGYaugUdGmsLdZ2miZBl+Rk4M2IMERzPWom5M54d5m8Qw+3tjHJRjxLu8gKzNaAYthMyvuC66zmCJycbCLTZYhug5tfS/2I0x7mF5bwTdEd9loRtS1E42vkZcW+THS7T4Gvxnf5NhGhYTlK0VfkUX33sSTCu8wzyKhfBD9MsJ5YZJFvELWnxALwhlVIiVCPBSI1EXmB/gpVBXNYIEaf187PyZ4lnChYFPplTgYEeiKjeK6e8MwIG2pSiano+i0gY765FwkyCHx9mow3SVJv0aLs38natWHbVfvMCLikoAeo3UtZrFQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399acd6a-f47a-4827-d2b0-08dbcb71dd44
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:23:30.6462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCnfBSu9YFCmThvPENPa7YcOtRMYd0by6wliVErCxzCFCDQA/Igggmu7azqKoYBYZu3zy6i/cMMnLEo3oQHwQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906
X-Proofpoint-GUID: 2mjXWMwnqK7a1FmRAwNSDIqaRzTyhafC
X-Proofpoint-ORIG-GUID: 2mjXWMwnqK7a1FmRAwNSDIqaRzTyhafC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=945 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120189
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gVGh1LCBPY3QgMTIsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBJbXBsZW1lbnQgd29ya2Fy
b3VuZCBmb3IgT2N0ZW9uIEtub3duIElzc3VlIElkIDI5MjA2Og0KPiB8IFRoZSBVU0IgaGlnaCBz
cGVlZCBsb2dpYyBjb250YWlucyBhIFBMTCB0aGF0IG11c3QgbG9jayBkdXJpbmcNCj4gfCBpbml0
aWFsaXphdGlvbiBmb3IgY29ycmVjdCBvcGVyYXRpb24uIEluIHZlcnkgcmFyZSBjaXJjdW1zdGFu
Y2VzLA0KPiB8IGl0IGlzIHBvc3NpYmxlIGZvciB0aGUgUExMIHRvIGZhaWwgdG8gc3RhcnQgY29y
cmVjdGx5Lg0KPiB8IFdvcmthcm91bmQNCj4gfCBBZnRlciBpbml0aWFsaXphdGlvbiwgY2hlY2sg
dGhlIFVTQiBQTEwgbG9jayByZWdpc3RlciB2aWEgdGhlDQo+IHwgVVBIWSBDUiBpbnRlcmZhY2Uu
IElmIHRoZSBQTEwgaXMgbm90IHJ1bm5pbmcsIHBvd2VyIGl0IGRvd24gYW5kDQo+IHwgYmFjayB1
cCBhbmQgcmVzdGFydCB0aGUgaW5pdGlhbGl6YXRpb24uDQoNCk1pbm9yIG5pdDogQ2FuIHdlIHJl
cGxhY2UgInwiIHdpdGggdGFicy4gSSB0aGluayBpdCdzIGVhc2llciB0byByZWFkLg0KDQo+IA0K
PiBQTEwgaW5pdGlhbGl6YXRpb24gY29kZSB0YWtlbiBmcm9tIENhdml1bSdzIHZlbmRvciBib290
bG9hZGVyOg0KPiB1LWJvb3QvZHJpdmVycy91c2IvaG9zdC94aGNpLW9jdGVvbi5jOm9jdGVvbjNf
dXNiX2Nsb2Nrc19zdGFydA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGFkaXNsYXYgTWljaGwgPGxh
ZGlzQGxpbnV4LW1pcHMub3JnPg0KPiAtLS0NCj4gIE5PVEU6DQo+ICBUaGlzIHBhdGNoIGZpeGVz
IGluaXRpYWxpemF0aW9uIGlzc3VlIGZvdW5kIG9uIHNvbWUgQ043MDIwIGJhc2VkIGJvYXJkcy4N
Cj4gIFdpdGhvdXQgdGhpcyBwYXRjaCwgY29udHJvbGxlciBzb21ldGltZXMgZmFpbHMgdG8gZGV0
ZWN0IGRldmljZXMgY29ubmVjdGVkLg0KPiAgT3JpZ2luYWwgY29kZSBjb21lcyBmcm9tIENhdml1
bSByZWxlYXNlZCB1LWJvb3QgbW9uc3RlciBwYXRjaCwgd2hpY2ggc2VlbXMNCj4gIHRvIHN1ZmZl
ciBmcm9tIG1pc3Rha2VzIG1hZGUgd2hpbGUgcmVzb2x2aW5nIG1lcmdlIGNvbmZsaWN0cyB3aGVu
IHVwZ3JhZGluZw0KPiAgdG8gbmV3ZXIgdS1ib290Lg0KPiAgVGVzdGluZyByZXZlYWxlZCB0aGF0
IG9ubHkgc2luZ2xlIHJlaW5pdCBpcyBuZWVkZWQgdG8gcHJvcGVybHkgbG9jayBQTEwsDQo+ICB0
aGlzIGFncmVlcyB3aXRoIGNvbW1lbnQgaW4gQ2F2aXVtJ3MgdS1ib290IGNvZGUsIHdoaWNoIGlz
IGNsYWltaW5nIHRoZQ0KPiAgc2FtZS4gSG93ZXZlciwgc2FtZSBhcyBpbiB1LWJvb3QgY29kZSwg
cmVpbml0IGlzIGF0dGVtcHRlZCB0aHJlZSB0aW1lcy4NCj4gIChpbiBjb3VsZCBiZSBkb25lIHVz
aW5nIHdoaWxlIGxvb3AgaW5zdGVhZCBvZiBnb3RvLCBqdXN0IGxldCBtZSBrbm93DQo+ICB3aGlj
aCB3YXkgZG8geW91IHByZWZlcikNCj4gIFNvQ3Mgc3VmZmVyaW5nIGZyb20gdGhpcyBwcm9ibGVt
IHdvdWxkIGZhaWwgdG8gaW5pdGlhbGl6ZSBQSFkgYWJvdXQNCj4gIHNldmVyYWwgdGVucyB0aW1l
cyBvZiB0aG91c2FuZCBib290cy4gVGhpcyBwYXRjaCBhbHdheXMgcmVzdG9yZWQNCj4gIGZ1bmN0
aW9uYWwgc3RhdGUuDQoNCldoYXQga2VybmVsIHZlcnNpb24gZGlkIHlvdSB1c2U/IFBlcmhhcHMg
aXQgaGFzIHRoZSBzYW1lIGlzc3VlIGR1ZSB0bw0KdGhlIGNvbW1pdCBlODM1YzBhNGUyM2MgKCJ1
c2I6IGR3YzM6IGRvbid0IHJlc2V0IGRldmljZSBzaWRlIGlmIGR3YzMgd2FzDQpjb25maWd1cmVk
IGFzIGhvc3Qtb25seSIpDQoNCkRpZCB5b3UgdGVzdCB0aGlzIGFnYWluc3QgR3JlZydzIHVzYi1s
aW51cyBicmFuY2ggd2l0aCB0aGUgZml4IGZvciB0aGUNCmFib3ZlPw0KDQpUaGFua3MsDQpUaGlu
aA0K

