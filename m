Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12EF915AA1B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 14:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgBLNdh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 08:33:37 -0500
Received: from alln-iport-1.cisco.com ([173.37.142.88]:53552 "EHLO
        alln-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLNdg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 08:33:36 -0500
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 08:33:35 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=230; q=dns/txt; s=iport;
  t=1581514416; x=1582724016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KGLzTm9JuoUt79tDkBH5s7u6nawYyMhF8ZWKAysytKE=;
  b=fn7jw8N1iTgdfJ/5QRzXjAcnFYE9WPosv/uy+i3kJiW34YlTp+a8xtz6
   03gb8y/qXRVbVYu7yANPaWbR+DWscS5h54LOqrGJ7aDMBPUn+66E7huky
   xUYvBVPGahjyRLJ5C8FYLGyMvZHasTABqbj6oznOOhSQ5VYoHTBD4fAq1
   M=;
IronPort-PHdr: =?us-ascii?q?9a23=3AbA8jxRYo6RMHoASMSx4dE2X/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el20gabRp3VvvRDjeee87vtX2AN+96giDgDa9QNMn?=
 =?us-ascii?q?1NksAKh0olCc+BB1f8KavobCsgB8JPT3du/mqwNg5eH8OtL1A=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D1AQAQ/ENe/4MNJK1mHQEBAQkBEQU?=
 =?us-ascii?q?FAYFqBQELAYFTUAWBRCAECyqEFINGA4sDgl+Pa4Qrg3qCUgNUCQEBAQwBAS0?=
 =?us-ascii?q?CAQGEQAIXgjIkNwYOAgMNAQEEAQEBAgEFBG2FNwyFZwEBAQMSEREMAQE3AQ8?=
 =?us-ascii?q?CAQgOCgICJgICAjAVEAIEDieDBIJLAy4BAqA1AoE5iGJ1gTKCfwEBBYUdGII?=
 =?us-ascii?q?MCYEOKgGMIxqBQT+BOIJsPoRLgxCCXpBbnx8KgjqWSQYcgjgBmFwtqWMCBAI?=
 =?us-ascii?q?EBQIOAQEFgWgjgVhwFYMnUBgNjh0MF4NQilN0gSmQOAEB?=
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; 
   d="scan'208";a="426992119"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 12 Feb 2020 13:26:30 +0000
Received: from XCH-RCD-005.cisco.com (xch-rcd-005.cisco.com [173.37.102.15])
        by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 01CDQUTu016753
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 12 Feb 2020 13:26:30 GMT
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by XCH-RCD-005.cisco.com
 (173.37.102.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 07:26:29 -0600
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xhs-rtp-003.cisco.com
 (64.101.210.230) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 08:26:28 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 12 Feb 2020 07:26:28 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+gThOLTzcm/sxfeNGyHJUtOyHYlmU5WYqL9LXd7K3O/3tjO1R/RMU9g77RVyNJp4D6As75Ub4d+GPUkyYr7YwsbNzCSuAtfHSFbR7hVDQUXnNOPVw8d0f7x2rMFK8DX4VBzdI8loTBMD/Pf1fr+FVGLz+E2KVTYmc8+v7M8x4MLtT05e2+9hMGS7vBxl4EsN7xqC/anLA8B0ptXaCZkJP/fFjVKFyBfT1WZMW4t1QF2XAH8AwvePOUNbRqhAxVIUMGloDKOXrEhoy4k4CdtsI7Mp9KCFvpgkTZ26d/C9Ve420w69jmEWdZKignhOjANZzC58p975zQ0u68shZmjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGLzTm9JuoUt79tDkBH5s7u6nawYyMhF8ZWKAysytKE=;
 b=ni6augq5Mx88CgH8eBhLXvLu0e6J+d+A2K9oleNk/cCY/Yh0UddpIg7v1F1Fdqg6u4hg/JpadoMHKUz+PNBkvH4RW6ZNnFMvs2EFyAO6SA+4SxtULV0iks9c1nRhmbiCPHhLI3YUmJLgsmjPAgBEAd/nbpn2Si7TXTS2o/Om1Q6211Aa0J6s84Y7k6iBBxYw3NSKp0aRJnbCLk/ctcq3ZLp6HQZ4I7Zk4KDtFY+3Hb93dMDaSuxm5tVesAF1ks9fTi7dv+zORqCNpUJQPCOIM3Ptzzu9f9ILuSeWZqx0lE5aWl6FyQ59jv1tx36YlPjvxXB1KO0bxOF7zyXPkPmMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGLzTm9JuoUt79tDkBH5s7u6nawYyMhF8ZWKAysytKE=;
 b=t/Q8yYQfSR07/u5nb7Io7Mjwlct59SmPvKpTQModHdDw5KheuumMDxYhp2yF/WevBPsnlk+MzT4B9ioCgCJ/zCIPoJThGeIo3vCbbz9XNJ5UwqeIsqqpZXTQRZwl/sAydDekAAFW3KUcDxP5dESwKU/WU/OsyhjUIOM0D049dv8=
Received: from DM6PR11MB2986.namprd11.prod.outlook.com (20.177.216.79) by
 DM6PR11MB4313.namprd11.prod.outlook.com (52.132.251.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 12 Feb 2020 13:26:27 +0000
Received: from DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e]) by DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e%6]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 13:26:27 +0000
From:   "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Armando Visconti <armando.visconti@st.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 1/2] HID: core: fix off-by-one memset in
 hid_report_raw_event()
Thread-Topic: [PATCH v2 1/2] HID: core: fix off-by-one memset in
 hid_report_raw_event()
Thread-Index: AQHVzS7dd7DPQTi9F0GwvJ7iZeijMagXs76AgAAB8QA=
Date:   Wed, 12 Feb 2020 13:26:27 +0000
Message-ID: <1606f6dc-87f4-dd3f-ebe2-a0de0556d176@cisco.com>
References: <20200117120836.2354966-1-jkorsnes@cisco.com>
 <nycvar.YFH.7.76.2002121419180.3144@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2002121419180.3144@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
x-originating-ip: [2001:420:44c1:2576:5a2f:415d:31e3:2554]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afd2249d-737e-43eb-72f8-08d7afbf2a11
x-ms-traffictypediagnostic: DM6PR11MB4313:
x-microsoft-antispam-prvs: <DM6PR11MB4313D663CC343AD45B5A3EB8D71B0@DM6PR11MB4313.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(199004)(189003)(6506007)(76116006)(53546011)(478600001)(66556008)(66476007)(8676002)(6916009)(2906002)(5660300002)(6512007)(54906003)(66446008)(64756008)(66946007)(91956017)(4326008)(8936002)(36756003)(71200400001)(31686004)(316002)(186003)(31696002)(558084003)(2616005)(6486002)(81166006)(81156014)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4313;H:DM6PR11MB2986.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1UE+RPcPcjX94E8hQR0avgzueAalwizwPDA1fS37r3GUnhNHVsPzuJSSBjGdk4iVTNZSVor0BzLmrTXSpTAOFviT6b7hCL3BQ0aqYwIlw+pKtGMcmUBxBm6+0AFRDhVF4d95FTq6niA1eE8gRGpv1FQtBtAuRVmK3kl4ljxkrCL7eFjeG3Q1tWP6Psl1cQhCyi8nLpfyHQIiaSHRvL7mq9SN/GgDhktXugFTdaReFVcMbDF/vd/VIc/dOmZBK0MkL4YfQdHXkttTFTQNSmXHKs03o5aeAFYzhVDbslfzMjIcH76U9CX3J6oLxoDtL+bDTkicDTYYA6K15B4VFrMiMimfGH7kMVFAnYcaHd27B4yfYXff1RjP+lkR7CMyG/O4USnBBSNnq9Szz+6kynw7cdFDdivC9cMX9yHRQxMG1CxhfLY4opZVspqDp0TJuIBn
x-ms-exchange-antispam-messagedata: 9MxZbAlQILeTQYTVy+IKJts61bvbtpq3Mz+2fA2dQ0Ord3owx7lzQCcZ8SV9TBzQW+A3+Pxp4LG+gRajtXGxf8C4v0eACCtOeZdF5raYvHp45WeZTzwpotvXrPNIsh/cmzrlKUektV8COiQVPzwqhj97JVWpTqiSWSCPrjKR3aTz1YE49u0QbKplHyJMT7f4nl0/SyuUxIim9GsVWcso7w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF1B731AF5B6A64DB2CFF14ACB4797B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: afd2249d-737e-43eb-72f8-08d7afbf2a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 13:26:27.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0hcLhENd2fT0X/3FN5yXZYy/sofRLputVxnxKsdgCXf4oaVKKNC724lj6yFvlszYZy6gJKK/0EDH84p9pllzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4313
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.15, xch-rcd-005.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMi8xMi8yMCAyOjE5IFBNLCBKaXJpIEtvc2luYSB3cm90ZToNCj4gSGkgSm9oYW4sDQo+IA0K
PiBib3RoIHBhdGNoZXMgbm93IGFwcGxpZWQsIHNvcnJ5IGZvciB0aGUgZGVsYXkuDQo+IA0KDQpO
byBwcm9ibGVtIGF0IGFsbC4gVGhhbmsgeW91IGZvciBhcHBseWluZy4NCg0KSm9oYW4NCg==
