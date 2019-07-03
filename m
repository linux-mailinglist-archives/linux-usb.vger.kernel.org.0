Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46CA5EE2C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 23:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfGCVMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 17:12:34 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:37370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726550AbfGCVMe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 17:12:34 -0400
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFA9DC0098;
        Wed,  3 Jul 2019 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562188354; bh=0bGW5VMNEaFO/+JmrgywGDGk5Cx0EsLbvkmIqaKR0Wg=;
        h=From:To:CC:Subject:Date:References:From;
        b=DCAWtOAXmiDZ23yvI3GKl6VGjB5v5cWmFDNfHUt8JRBq0j/BLzEU5Utff4ycT3lk1
         567V05cbwkxqGsra8dVso+3bFKSMnucQJJnFnW6hP24cMn6K5nhH965IvZB4+MY48c
         UjyxjrRuZy5H4imJQcrbxxiOnrASF8rsMgsCACC4zSkxW46eWUTAf5Z1ryDSqiPkBg
         fcABe+9ZM2LdsrTNkQzvtM/90V4abXkL22dyAixXS6QIq3aX+j/xq0n+s/UbtFLLr3
         PLFCdk/kFF6lZW0E8mubiFzfc+DUnBfDtbC1ULLLa5/fm01pzCZ2IleUbHGDkSRWFs
         TaioK/FhMWU1w==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AEF5EA15B4;
        Wed,  3 Jul 2019 21:12:33 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 3 Jul 2019 14:12:33 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 3 Jul 2019 14:12:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YurIn/44HM5cDI3rmxeIMGsuTD/3wbXmTnb4r504DtM=;
 b=OyQs9hFmKhZV4BwKNMVKSCjLDnVAE3WMNwzhjmL0pvD5aywhpVK0zy4zeOFOGsMdBMIx0DsvBLipvHkt9XNAXd5Kh8p2wJzofhCjOJJrr4uAkqdQv65VVymvhHlrhQ98+N5Rsh5SLqxNhS20SGqHfd5JAr1c5CSkU4J0xwcykyQ=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0151.namprd12.prod.outlook.com (10.172.79.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 21:12:30 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 21:12:30 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>,
        Rob Weber <rob@gnarbox.com>
Subject: Re: Clarification of set_sel handling when dwc3 is a device (gadget)
Thread-Topic: Clarification of set_sel handling when dwc3 is a device (gadget)
Thread-Index: AQHVLrjzp0xnkXfqDUapp8rL9YUyuA==
Date:   Wed, 3 Jul 2019 21:12:30 +0000
Message-ID: <CY4PR1201MB0037D8D2A9DFE0B055F0B1C1AAFB0@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <6dbe8df06875947d7ea6d6a21f83ac68315c0ef4.camel@gmail.com>
 <CY4PR1201MB0037D801D920ACAD8B4CF3B6AAF90@CY4PR1201MB0037.namprd12.prod.outlook.com>
 <847524769f1229b1a96d5ccea53c999497dccfff.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba3f7d2-d20b-477e-46c3-08d6fffb28cf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0151;
x-ms-traffictypediagnostic: CY4PR1201MB0151:
x-microsoft-antispam-prvs: <CY4PR1201MB015187E03EBA31DDDEE5E581AAFB0@CY4PR1201MB0151.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(26005)(5660300002)(8676002)(478600001)(81166006)(81156014)(6116002)(186003)(3846002)(14454004)(76116006)(73956011)(476003)(86362001)(316002)(486006)(66446008)(64756008)(66556008)(66476007)(2501003)(102836004)(25786009)(256004)(74316002)(4326008)(7736002)(305945005)(91956017)(66946007)(53936002)(66066001)(9686003)(71190400001)(76176011)(6246003)(229853002)(6506007)(8936002)(446003)(7696005)(71200400001)(33656002)(55016002)(99286004)(52536014)(6436002)(54906003)(110136005)(2906002)(68736007)(473944003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0151;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oU/Jm/oMOsavpLw0HVw1WMHYqyt1ebWm6wZD4kMdi5uD2Y11rzEOjw9YbRO1QN2ok/pm49mSvzf8QR8LUHtguaQiA3OEI+ICPF8YXsh0yr+nB9Uf1Sbz0NjrpScQ2FfcZjJvhhmxgY9wtBT1VXd/A+iuSh1s5yAAPsOdKgf74PcOWBgkrS2e3eRn/SebzqvD/+JaKNegqbY6JTMXPxrLl2+b61c40FXjKVxdJJwi/HxSMHjffozIDNAndWo5lVGP/JRRVH34fO1AhLHulXNMQTw2IiahYP6NGHmHHwhfEJK1bAGtZ7vr3Mj4ftpDKLGATkRqcA/1nrmqQ4gFWbLlrGHPZZbM/37iAKWl1Cjujz4HzoJoUDGley6Z45hQ0M2aCub3H6XiCTyzI4wdNuQAd1s8aTF3q+0n7RaLRASibEk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba3f7d2-d20b-477e-46c3-08d6fffb28cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 21:12:30.4959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0151
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
claus.stovgaard@gmail.com wrote:=0A=
> On man, 2019-07-01 at 20:48 +0000, Thinh Nguyen wrote:=0A=
>> Hi,=0A=
>>=0A=
>>=0A=
>>> ----=0A=
>>> reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);=0A=
>>> if (reg & DWC3_DCTL_INITU2ENA)=0A=
>>> 	param =3D dwc->u2pel;=0A=
>>> if (reg & DWC3_DCTL_INITU1ENA)=0A=
>>> 	param =3D dwc->u1pel;=0A=
>> This is incorrect. If the controller is enabled for both U1 and U2,=0A=
>> then=0A=
>> periodic param is U2PEL. If the controller is only enabled for U1,=0A=
>> then=0A=
>> U1PEL is used. Probably the original author intended but missed the=0A=
>> "else" on the second if case.=0A=
>>=0A=
>>=0A=
>> According to the databook, currently the controller doesn't use these=0A=
>> programmed values. It uses the value from CoreConsultant=0A=
>> configuration=0A=
>> setting.=0A=
>>=0A=
> Thanks for your quick reply.=0A=
>=0A=
> So my understanding from your message is that the code is wrong, and I=0A=
> was correct in being puzzled. Though the core currently does not use=0A=
> the values, so currently the code is unimportant as it is unused by the=
=0A=
> hardware.=0A=
>=0A=
=0A=
Right. Even though currently it does not affect the controller, the code=0A=
needs to be fixed along with some note that the controller currently=0A=
doesn't use these values.=0A=
=0A=
BR,=0A=
Thinh=0A=
