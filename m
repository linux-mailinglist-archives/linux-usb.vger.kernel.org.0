Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18E9AE172
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 13:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbfD2Liu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 07:38:50 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:35084 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727872AbfD2Liu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 07:38:50 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A51AC0092;
        Mon, 29 Apr 2019 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556537930; bh=d+VcAKt0/aYfgYHJUdkrepuaad6/tXoV8lfPYOiEQcY=;
        h=From:To:CC:Subject:Date:References:From;
        b=jbJWy9g3gWIesi8vwPe1Rkhefr8sX0txZV6h4VdoDD9ppIN2ro4QCbmjqDJiHKDun
         i6dFmZcoLUNRIfwB2Sc8lQgywWfC2JgpbOKLQ8/YpkvLPijxFrozh+ZYG4OHdTfxtd
         7wVQkx5gPDkkSahSJN0r9JOnDsOj10ZEjsjyeXt0MbFF72pmf/oolfyIuOmAqecf68
         i2AuSAnBIXhSXpl6BOlAR26OPPsJIS374EVTNXM/oBcSOZVmWaDyEB3pKRs0VwJX9V
         Yn7jFxGUvENLvpkEBkJZGw3JMUJP4ZQfRllxI/XYhCXJjmxcATXL9F0VEot6t8gB5e
         nZ4Z7eP39J9XQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 49473A0066;
        Mon, 29 Apr 2019 11:38:49 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 04:38:49 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 04:36:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+M203ngq0VxcHi3pKvn1pYUmUcDqS/xAcgK/tAzaDk=;
 b=G/psvlMtCHr9TjTwuhVKAmx9eXkSr9xSKA4SU2oKdxyU0YbmxBmRV3WLDCiRFhpUGKUiqM8v/DAQL2alWiSUys/WWQcnMf+w4H8vuWvGE3IlIXUpJtJSALolpmEBHfYvdgjUumMq9zJ+t/Frpf0q80qni7VqlQq7hetF86vPaLQ=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2415.namprd12.prod.outlook.com (52.132.195.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 11:35:33 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 11:35:33 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 09/14] usb: dwc2: Update dwc2_handle_usb_suspend_intr
 function.
Thread-Topic: [PATCH v1 09/14] usb: dwc2: Update dwc2_handle_usb_suspend_intr
 function.
Thread-Index: AQHU9qKG+ViDfaby7kumU8hq4kl1Pg==
Date:   Mon, 29 Apr 2019 11:35:33 +0000
Message-ID: <SN1PR12MB2431ACBD844C56D7FAE500C1A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <edf4726d21dd5a00013e5c26ac783906bc589d4d.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UNL-=n1CW+pQ2U4T1Mth5-qEY6ycp70jE8zqTTWE8BDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd976110-7dd1-4982-28dd-08d6cc96caaf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2415;
x-ms-traffictypediagnostic: SN1PR12MB2415:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <SN1PR12MB24156DBB2FA41BC8AA0B2DF3A7390@SN1PR12MB2415.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(366004)(39850400004)(376002)(396003)(189003)(199004)(33656002)(256004)(3846002)(6116002)(478600001)(25786009)(229853002)(52536014)(2906002)(107886003)(966005)(71190400001)(6436002)(7696005)(9686003)(6306002)(14454004)(71200400001)(4326008)(6246003)(53936002)(55016002)(73956011)(6506007)(102836004)(5660300002)(81156014)(6916009)(66946007)(74316002)(316002)(66066001)(66446008)(76116006)(81166006)(66476007)(486006)(76176011)(64756008)(66556008)(91956017)(53546011)(97736004)(86362001)(68736007)(305945005)(99286004)(476003)(26005)(8676002)(446003)(186003)(54906003)(8936002)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2415;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3mo2vbf9eXX8jhJNCQpcOsuAlLil4IQsXCCR7+OFKN2uadoJQQ1VfXDPSG8tfQPhowxZ6SoqB5hF0ghMBOAYdYhFEY6Z3uLS7d253m1vmuWo5NJkO1y2hGp8FY1yb0hvi3rLucSZMkurNwp0o88m3samkbzgg1QQydFkbvcXlUHciFc6ByZpKPvf1CFFyvo2IssnCo0j7B9p2Dukcv90Anw2K8EJdwWxeQlsb8MPDeZ31J5/WkSuN6VMuapChPzaGvzyd/3zuKKVGEuTZdh6n557nZma7A09AXub8nZXUNoa5wqNZgIjmwLAw8wHtWckxkmHHtTnBcJOEAPX2RXKuS7rwU4cslBgEKmu6AJCpJZdB+cqrdA0byszM9Qs5tZ7SGrJUQtPzstW13WjTOodue/IGIKifSGNBzVvtAEzuW4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd976110-7dd1-4982-28dd-08d6cc96caaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 11:35:33.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2415
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/27/2019 00:52, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> To avoid working in two modes (partial power down=0A=
>> and hibernation) changed conditions for entering=0A=
>> partial power down or hibernation.=0A=
>>=0A=
>> Instead of checking hw_params.power_optimized and=0A=
>> hw_params.hibernation now checking power_down=0A=
>> param which already set to one of the options=0A=
>> (Hibernation or Partial Power Down) based on=0A=
>> OTG_EN_PWROPT.=0A=
>>=0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/core_intr.c | 13 +++++++------=0A=
>>   1 file changed, 7 insertions(+), 6 deletions(-)=0A=
> =0A=
> In general I'm in support of this patch--it's cleaner and gets rid of=0A=
> a needless goto \o/=0A=
> =0A=
> ...but you don't go far enough.  You can fully get rid of all of the=0A=
> "-ENOTSUPP" stuff.  I've actually picked my patches and yours atop=0A=
> Felipe's "testing/next" tree and you can find it here:=0A=
> =0A=
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromium.googlesou=
rce.com_chromiumos_third-5Fparty_kernel_-2Blog_refs_sandbox_dianders_190426=
-2Ddwc2-2Dstuff&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVr=
rlYOeOQjP_HlVzYqrC_D7niMJI&m=3DWBAPjgkB_xB8UlcsYvQdxyxg2a3wC70A-jrd4IucYKw&=
s=3D6HkWJc-CszWClXSA1Ja9AupZVe7Qb4VTMofH8yTmj0o&e=3D=0A=
> =0A=
> ...as part of that I've included a patch ("usb: dwc2: Get rid of=0A=
> useless error checks for hibernation/partial power down"), AKA:=0A=
Have you tested the patch? on which platform?=0A=
> =0A=
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromium.googlesou=
rce.com_chromiumos_third-5Fparty_kernel_-2B_0c924f736e2f7c1bb02531aa33c04a3=
ae5f4fc4c&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVrrlYOeO=
QjP_HlVzYqrC_D7niMJI&m=3DWBAPjgkB_xB8UlcsYvQdxyxg2a3wC70A-jrd4IucYKw&s=3Dpm=
6jeDE--3WsqgUui0ZU15vcvHZRQ05jA8mvP1LohS0&e=3D=0A=
> =0A=
> Feel free to squash that into your patch or add it to your series if=0A=
> you like it.  Note that patch points out that there's are still some=0A=
> instances where calling dwc2_exit_partial_power_down() might still=0A=
> happen in a case where it's not obvious if we were in partial power=0A=
> down mode and made me wonder if there might be some bugs there.=0A=
I will test it too. In case it is fully ok and has no issues. I will let =
=0A=
you know.=0A=
=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
