Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29CC1D5DCF
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 04:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgEPCFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 22:05:39 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:48046 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726261AbgEPCFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 22:05:38 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 87429C0087;
        Sat, 16 May 2020 02:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589594738; bh=tqq2pmtyiJ6OWdIRTaxhS4tesRhiJcc6BoSghM5Dkms=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HtsUsnh8y545ZrQ7mt3krypGSjRI5id4EwPxLUR6YY/N/POUhu0fz3Ujb/2wyQZhZ
         tzP++nsog1hiJTFTiJZKicQN40xNtJfEZ9092DyUgbkDPLOOtNPq+kgV6sR2A3FaSC
         51meF0/AvADsOwFS6BM99DFwPD0Hd8+mO3BUBUMzUUoVnVI2iTis8ig1XjrDClx+Lw
         Lq0llSb4qrxTjYE0RkJfz3WaireCI0m3II+xZs9r70V5TyNLj0vIMObfoUiyvQdlU4
         A1/yN3mUJT4FlxWgTl42WdofG4UdwZXQDB8QcQTjX1lAx2MU15QRvdJObA6b7GM+np
         9xVHJv0+5gMJQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 741FBA01E7;
        Sat, 16 May 2020 02:05:36 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 15 May 2020 19:04:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 15 May 2020 19:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOLNecTSHVau+tVTqE9Oq4F20CKNJ7OlwmkQclRo+OnNVh84ty+AZyZyC7CPVOi2G7rZU1I6aTmqLfAahOJV+anBtV6Wub0UW7sfwjmnPr4D/jQItEQ5xY1gCPBbz23AFrTfa26Ox19+1Xnaf5zv2h4U/MDTQlgdTkJOfLksXM4G0+9FDehtzwDKejl1Z796pXQrD8Uh1CC3nETfMbhVzhbWAttoWFptSZ6suTgvC1i2oeORXvgzzRvtlNzSgw/O4Ab3ydZBn61nzx4GMwctyKsxND6wr98CwhgfIqq/uRHPsbIUVhZO2F7uyi5Qa7liHvtlaPuk0j7RHGN5gI8tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqq2pmtyiJ6OWdIRTaxhS4tesRhiJcc6BoSghM5Dkms=;
 b=YwbtoREWOB3mRb7oyOW6sBvFEjsCGuLCpIZ7BDPN9YAQuMk5ChUz4MkPA7+fR0LOerjZw6SuYteXcbyKd2US0cH3utoIRunYXiUL6b0JHBB+O55IUU2H+2sbYZW12Jc4/J1G57eO9cBPhmvA3x8Si0iyUpXXXu+rGJAmOmxpCH4gC55VSEUMvm8YZnUSYXiksXc+4EdM9vrIWYlun2FxC7ni/+9ZUzVkL7nED0QCCHKJB+p4FjsV9Fx6pagAcINuuVKNbzjLs8zc0ai4PTOXB+bQ9FoLHv8GExUtRK+VefSUGRQApiJUHHbxYCl9FPm6y9oryilDyh0b6BdGs3JNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqq2pmtyiJ6OWdIRTaxhS4tesRhiJcc6BoSghM5Dkms=;
 b=KWZmiyg0cbGMI3hM1ShiH76G92iqv3+VcfefjiUcRFLN9jzzdD320MnsFlGm0G/UmxLOIGevdre8060W0O7N6s+TuDrQ6J2BKLnKvERt+HTUwVT1/LF4zAG7QdU4hvAk2Jp8S40IoSv9cOFWyZBQV45LogOss2o6/M4Zclhsd2A=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2600.namprd12.prod.outlook.com (2603:10b6:a03:69::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Sat, 16 May
 2020 02:04:39 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.3000.022; Sat, 16 May 2020
 02:04:39 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     kbuild test robot <lkp@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Check for prepared TRBs
Thread-Topic: [PATCH] usb: dwc3: gadget: Check for prepared TRBs
Thread-Index: AQHWKxJXuGe4hMuXq0CEAVXFR7/vF6ip8pYAgAAD+gA=
Date:   Sat, 16 May 2020 02:04:38 +0000
Message-ID: <cfff1113-75c0-b133-028c-fb9ebe5fb067@synopsys.com>
References: <dcb46412b7454e517255e64b1c70d3e402797dd8.1589585973.git.thinhn@synopsys.com>
 <202005160940.ZvsbE4LE%lkp@intel.com>
In-Reply-To: <202005160940.ZvsbE4LE%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56188420-7923-47b9-47a1-08d7f93d7d90
x-ms-traffictypediagnostic: BYAPR12MB2600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2600B0877EF88CFB34447DE2AABA0@BYAPR12MB2600.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 040513D301
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IHdWWSF42sxibZg5QcGfLYNKFJ5vsWmc+Uw+0yaaRYV7sxl/yi01tUsOyXNipQWF2902uWnWuv8/BvjZ5uNR2T70Z6pOgkDsN4877+pc2Px+ZAPxSTXZfx5hge30gQY3Lf5e1X3dUs7sSk4CFbeMbrz3WcEFsFIh6ZYaw0RKjQbXRNXCUOIKHVa5arCsuTx+FKN+bP/oF19UqLrJ+cpwLtWULSzjKmyuFqrnIg2/JyJ6QX8WNFu77C/NV/XlSTkWr6wvvm6hCgUu909xA7tPpPkH8C2Qysc6fhhm7e8mNOuzdnDRZ3Q1prxv0kAAS+XGIQgB6cyT8y5G8HmSdMFx8b/nW+zy8UjA1XImpuRg3JCwF9anVEdjcba2Uzv/Nqqe1aIiZ2q4wRzo7nBNDi9TleGyjl3tA0KPHjC2jHuGWsZzIWmdZZlq6uekOhNTs61pJ4tEW2+nAC2DUh9JIH5TAmjwfnq3G8hnlsQg1/s150xblBtSwA3tza+atvxhACKK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(39860400002)(396003)(346002)(136003)(107886003)(4326008)(64756008)(316002)(6506007)(8676002)(110136005)(66946007)(36756003)(86362001)(54906003)(66476007)(76116006)(66556008)(6512007)(31696002)(6486002)(66446008)(4744005)(2616005)(186003)(2906002)(478600001)(31686004)(71200400001)(5660300002)(26005)(8936002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 10d2nRidR9N5vtAbNPCAqTv8Nj3Ibvn4PZlml5VHDQpHRgVvqIGqIE0Xf0gQ3lHvCaN8D2oOG0hiFPRkAAnY+1ngpSE1NWc6WPORMncs9RuSLeJgEL70iPsyXHb4zFUTx1KyKWVAeJRgZGv20eOFAaKRE9bgZ3IzFC8qbzXlUKSTAkNnV+NLk36m+f5jUMY0aRtwfyoRWZzlqfINZlyU3hef+UatGWDy73Cj/cqk/ajJXdziVpZLY7Px4fnWcED460pWyJpBx+gt7GxDj/049u/nrtBwCuSAdfmR6gr+nm4CQ4E7558wdLamkVwotHTtqaGZ0uJJdT43m/qCcXXCM50JLCAt7GUbotPX5t3SkHt/IO6eh45uy2pDentW5HxGLmZ/8huOj1Gqd/apnmd2Ow9ulQeh3PAEN+H//K05ETk7Tlnpeann8hep4ATObud23u3m/tFQ20rQAQXn39cTPuaSZTObJqDGlMAVJFH+sQU=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <879B1805FD5FA544A1E0F5EFA57E343A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56188420-7923-47b9-47a1-08d7f93d7d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2020 02:04:38.8644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbJ9CPbtw3k4glClBv8PvbArxdIPWGduk26WKgb88xETmL4QI9sezlyRCv7dQcJ3cXHUBCFykYLPBU0AcaNRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

kbuild test robot wrote:
> Hi Thinh,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on balbi-usb/next]
> [also build test ERROR on usb/usb-testing peter.chen-usb/ci-for-usb-next =
v5.7-rc5 next-20200515]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system.

Just dropping a note:
This patch is base on Felipe's testing/next branch.

BR,
Thinh
