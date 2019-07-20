Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77316EF7E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jul 2019 15:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfGTN0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jul 2019 09:26:41 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:43378 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728427AbfGTN0l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jul 2019 09:26:41 -0400
Received: from [67.219.246.100] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id D0/AA-10313-F86133D5; Sat, 20 Jul 2019 13:26:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSf0xTZxTl63stD8Izz5aOu26wrYax6PrWH5t
  jMyS66FazoG4u2UJEfMiDVvuD9LVY1M2GKIxiFIS5FWsLBEjoyCRQiWyYSdncqqAOZBtsExAZ
  lmGEqdmiC1tfH7rtv3O/c88957u5BCbtlSgI1mlnbRbGpJQk4i+eO8qqHpPrctXXrkoyy348L
  M6cLv8ez2xqPYStxfQ99b/E6zsDlRL9nc60LViO2GjJtzp3iA1XPmuVFH+T6GwZzHahu4QbJR
  JS6kME1R1nkBslEEDtgxOnRhFPAOUSwZfB47jQdQyD86ErGF8gqgUDf5lHIhTncZju78N4PaI
  uIpjxaXkCp9ow+LzCK17Si6D2j5qlYhzBoOs2zksk1Gq4Fb4az+NkaiOUjzbE3jHKAlMDwRiW
  UW9AWW9ELPToYTIQwQX8OowHa2JanEqHyXsXJTwmqVwI9x1Cglm3CMLdtTFxApUFY/31UQERz
  ZoKl0KE4JUCYzf8ImEFFDT3XsYELIfI1KJY+Foe9I8NLvU8A8GqSomAU2HIX7W0vmw4e2Q2Xl
  jfGAL3x1/FC8RKqDo+gfG+QJng2N8ZwnMGHFzwiauRuv4/MQSshtuX/JiAV0Fr428xTFLLIey
  5gTcgPIBW59uMRQa7mTGaVBq1WqXRaFValeZlLc3sVeXTDk7FMpxdpaGZPRzNlZp3mgpoC2vv
  RNETKigWtZ9BNz1zdAg9ToiUcvK9Ddpc6bJ8a0GpgeEMeTaHieVC6EmCUAJJJutypcttbBHrL
  DSaoof4kAYiSZlMnpBFaZIrZsycsUigLiAdUR052YQRDaebmzApbrFaWEUKqeMnUXyrwWF5NO
  jhUQ+hVIWMRHFxcdKkYtZmNtr/z8+iFAIpZeSnvGGS0WJ/5DcbjSKKRpmitXwUO/MvpXCJKhT
  rdT50362TbRh57oXKHy437shrQ5nU3t294+ZTc+P3272OMFeY5p748yO6CZ/fV+fdv+7Ia+Lr
  Weaz635if3e80lhT5HL+mrPZ+/M9xXx6MOfNp/7a9sVBpDwwop72VX/dfbdu556nrzUgavTwp
  o6jXb7ULl/B9vmaEpgpWTPJ0sNqZsSa7o4U3okMN+3OqN2WpR9Ie75v8bvpek9o7YJGzjzYWG
  afnMguD51uWfXt1pes754TzZ1cGKijr3ctvv1g6tlkWuV5Z3hXj6TtwOYRFNg+9GrpB59kqcS
  7Nt1c9laF/4mSFvnW98svBPYneBsX16+4NTjTrux2jzab1vQ4OpQ4Z2A0KzEbx/wD5qP+S08E
  AAA=
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-41.tower-384.messagelabs.com!1563628821!235831!1
X-Originating-IP: [52.192.143.101]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25557 invoked from network); 20 Jul 2019 13:20:21 -0000
Received: from mo.allied-telesis-co-jp.hdemail.jp (HELO mo.allied-telesis-co-jp.hdemail.jp) (52.192.143.101)
  by server-41.tower-384.messagelabs.com with SMTP; 20 Jul 2019 13:20:21 -0000
Received: by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix, from userid 504)
        id A51C0294002; Sat, 20 Jul 2019 22:20:20 +0900 (JST)
X-Received: from unknown (HELO mo.allied-telesis-co-jp.hdemail.jp) (127.0.0.1)
  by 0 with SMTP; 20 Jul 2019 22:20:20 +0900
X-Received: from mo.allied-telesis-co-jp.hdemail.jp (localhost.localdomain [127.0.0.1])
        by mo.allied-telesis-co-jp.hdemail.jp (hde-ma-postfix) with ESMTP id 46D461AC001;
        Sat, 20 Jul 2019 22:20:20 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (mail-ty1jpn01lp2056.outbound.protection.outlook.com [104.47.93.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id 31C42294001;
        Sat, 20 Jul 2019 22:20:20 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IosOgs/DFPfEeo72B0l3anllVvuwrEcpiR2otuhaAue8sC9jDBxe+WlQyWtGeuooZL5CPxZSpHQGHcDMwmHBQ34udnJH7memDXUsl/WH7RhzdZBqP8UYGlDI0XHFR7lmvKRwiJ8ijsqCGWaHKDF3VI9alrv84Sm1OX9g5LpRDh7W4G3eYc0Fa9ZwdRJSpRv3TiH0JRknZQvyQUVjZ3+Tb4ZrhXEXfX5bOHH76BTo/VSqaRNdr7K2+95G6/1oxz9ocx3hvt2Tq3cw7UEPjUxVSYkzgCVfGnsxA4vW47mBd173FyqO7yYcMYwJ15DFixfsWVJi0m0HsWDmqEJPzkVehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPVKjfPCvhMlRpyg390N20U0SHCnRk+RtRatGABWax0=;
 b=ls9PAHMm4MibhSbzGNbGeB5/IYQiCAAaq4ZQ6HJt18L+uPVk2x4wvns5fmRanjGO5tPm4KnXMWVmK650iRNePgRkpz1dN9efYjneiEVzNkW/koZULgD9aZGD1wGkKDnV6P0ssjItS4nZqVFAnrNcUIgpN2wJIBrislWA8J65z71nkInSQYhr6fzC6P0ccm4GW+AhhuW5F1FptXIGEV/lx+xQfcudvkQWqJPy6mhuIEDSXQEA3Yyp4ODV5AifnnAmrZwwWd9y82IjF0oaIt5YfCrzpsc7rCC5a2NE45etN2z3rwoKenV7AOR8OZddXMnzAEHpG9+rz+ytxlaumc0u5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=allied-telesis.co.jp;dmarc=pass action=none
 header.from=allied-telesis.co.jp;dkim=pass
 header.d=allied-telesis.co.jp;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atjp.onmicrosoft.com;
 s=selector1-atjp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPVKjfPCvhMlRpyg390N20U0SHCnRk+RtRatGABWax0=;
 b=RdgP+9g0a7GB9zCO5BW4r9B9zzdxbTDeSORekV2BlNlPKS5+7M+i6Ia3CLG8hqKR8WkJf2EhtcdAKWi794VWTVHuCZRS5Pqu/IgftYxged1zLpnmg5b0ZtKQa9u/TqhSFWWJ+8pfW3s9e9CYCJweQ30WtjP/52C1dKR8ZEKqwJs=
Received: from OSAPR01MB3969.jpnprd01.prod.outlook.com (20.178.103.147) by
 OSAPR01MB5169.jpnprd01.prod.outlook.com (20.179.177.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Sat, 20 Jul 2019 13:20:19 +0000
Received: from OSAPR01MB3969.jpnprd01.prod.outlook.com
 ([fe80::a800:baf4:b9a8:86f4]) by OSAPR01MB3969.jpnprd01.prod.outlook.com
 ([fe80::a800:baf4:b9a8:86f4%4]) with mapi id 15.20.2094.013; Sat, 20 Jul 2019
 13:20:18 +0000
From:   OKAMOTO Yoshiaki <yokamoto@allied-telesis.co.jp>
To:     Lars Melin <larsm17@gmail.com>,
        "johan@kernel.org" <johan@kernel.org>
CC:     YAMAMOTO Hiroyuki <hyamamo@allied-telesis.co.jp>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
Thread-Topic: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
Thread-Index: AQHVPGIitlRoYnyPjUyBFtKe4ZcuLabOtxOAgAGFjnWAARoCAIACBaZT
Date:   Sat, 20 Jul 2019 13:20:18 +0000
Message-ID: <OSAPR01MB3969F5D8E3632CE73EB699F9BCCA0@OSAPR01MB3969.jpnprd01.prod.outlook.com>
References: <20190716090553.GA3522@localhost>
 <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
 <5b4971b3-64e7-605a-948c-9e1e02b11eb2@gmail.com>
 <OSBPR01MB3973A00B1FB1E0930DF0AC13BCC80@OSBPR01MB3973.jpnprd01.prod.outlook.com>,<1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
In-Reply-To: <1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [61.215.194.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4adcedf-c410-45c3-a8ec-08d70d1502d8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:OSAPR01MB5169;
x-ms-traffictypediagnostic: OSAPR01MB5169:
x-microsoft-antispam-prvs: <OSAPR01MB5169B271EED9B07C0E1DC375BCCA0@OSAPR01MB5169.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0104247462
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(26005)(5660300002)(52536014)(478600001)(2501003)(68736007)(86362001)(102836004)(66446008)(2906002)(6506007)(54906003)(76176011)(110136005)(186003)(66066001)(66556008)(64756008)(66476007)(53546011)(316002)(256004)(66946007)(486006)(76116006)(53936002)(6116002)(3846002)(476003)(9686003)(305945005)(25786009)(74316002)(7696005)(81166006)(7736002)(81156014)(446003)(11346002)(229853002)(99286004)(4326008)(6246003)(8676002)(6436002)(71200400001)(71190400001)(8936002)(55016002)(14454004)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB5169;H:OSAPR01MB3969.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: allied-telesis.co.jp does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EVrJjIVCWaLQib2X+oqZpy2nu6iqdIDZyJdeELfEwgHiJfjJ47XsCLaBG6huCcH+m0lL87sjFhKZKFoZnPDZBHBUJH0s9sRLqwU3WjBzI30WPMx/0/Pz7Jm19JxAHiIsagD2FNKFK7GfYur0BTri3Pg8rl1TP7KYGib3IYHFAP9rV7/JHhWiWSLRSdERODIPyU4CYO0wECcf6T6iBfxvPTC7Zep3NCjnE2bJ3CPLzumenD++JQnmW4tRvNEOrNxeIl5rCKbNdHFJ/mfp5gYQzCpYNQ9n64a4jVrhjyra5yvRZfs8koPweswf6mDOsDrrIBhxNDcybuiqfJe5pbrsUJxfKD/jjCjZvaqiQGvPpdbciyRufVdBqslargItK0QrPg3r9UuGXAYNacuVfCOFtRh8z54dMuUN2CVh9XX3GLw=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: allied-telesis.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a4adcedf-c410-45c3-a8ec-08d70d1502d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2019 13:20:18.9002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1a8a37cf-9ecc-4cef-abb0-1ab01a15a6ad
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yokamoto@allied-telesis.co.jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5169
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lars,

> Yes, USB_DEVICE_AND_INTERFACE_INFO is the one to use when all the
> interfaces you add support for has identical class/subclass/protocol
> attributes.
>
OK.  I will change it to  USB_DEVICE_AND_INTERFACE_INFO, and resend patch.

Regards,
Yoshiaki Okamoto

________________________________________
From: Lars Melin <larsm17@gmail.com>
Sent: Friday, July 19, 2019 13:09
To: OKAMOTO Yoshiaki; johan@kernel.org
Cc: YAMAMOTO Hiroyuki; linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF871A

On 7/18/2019 21:46, OKAMOTO Yoshiaki wrote:
>
> Hi Lars,
>
>> Please do a full test of the interface attributes (Class/SubClass/Proto)
>> whenever possible, this could be helpful in case the mfgr makes a device
>> with different interface layout but re-uses an already used vid:pid.
>>
> What should we do specifically for "a full test of the interface attribut=
es"?
>
>
>> Both interfaces has attributes ff/00/00 so there is no reason for doing =
a less accurate test.
>>
> Forgive me if I=92m wrong, did you say mean that we should use USB_DEVICE=
_AND_INTERFACE_INFO" instead of "USB_DEVICE_INTERFACE_CLASS" ?
>
> Regards,
> Yoshiaki Okamoto
>


Yes, USB_DEVICE_AND_INTERFACE_INFO is the one to use when all the
interfaces you add support for has identical class/subclass/protocol
attributes.

rgds
/Lars

