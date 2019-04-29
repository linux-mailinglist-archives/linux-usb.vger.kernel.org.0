Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B644E0E7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbfD2Kyk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:54:40 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:60636 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727901AbfD2Kyj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 06:54:39 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 674A9C0028;
        Mon, 29 Apr 2019 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556535280; bh=YmjW/IHk5uX15dG4Jqky8C2ceugdgTwdyJTsBeAtbSQ=;
        h=From:To:CC:Subject:Date:References:From;
        b=TxHjemwJWghXqfaZ6cqcfyyXFYV5xFK0i2e6tBlZ6+vGYSeleHkIJD4b+MQ8syVxL
         VwgJmR1FRCjAaFwNOcI+5CxBE9gKu44WzBRSH3KKZ9tMAFRLt612idiSISTTcvaIpI
         XicxwdWKFCvxZ0jd+BTo2e/kN8tb0CCGKTDeobkhcm4YAI+zCoJyUwmiDqxHejGWkf
         ikv6nUBBf09RlgwJMfl2z1AYd2ogTi+t8OBM3/sxcaAN3iQtWVlijRFf5Bc+YGjcwY
         4nbzJ1XwG2CMB5BQImPtv4/dHLSaU5/nObk7l+KmH3pisUT8a6ATrvqtpzSAKMua9E
         g7+nuzTPS3sDA==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5750AA005D;
        Mon, 29 Apr 2019 10:54:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 03:54:39 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 03:54:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwvTVYqwIJd+nEDx7Tinaapt65LfXcIsBusKx3x0yFo=;
 b=Y6lVWV/Yn9KBE9Gvgra8HVCR/vfCSu41T7S0Q0KbnXc9Toz8f92c/tn6sijF5Uk2SouU/9uNbwN/iTPb1dhjE1TBW8LLFNGDb5FGRShULRjgJqOxu6hrKQyTq9vlm7NbIFZF1WxEQvUxj0DKkubvk/bNO1a2o7NxiNEMfEEe/54=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0605.namprd12.prod.outlook.com (10.163.208.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Mon, 29 Apr 2019 10:54:36 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 10:54:36 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 03/14] usb: dwc2: Fix wakeup detected and session
 request interrupt handlers.
Thread-Topic: [PATCH v1 03/14] usb: dwc2: Fix wakeup detected and session
 request interrupt handlers.
Thread-Index: AQHU9qJhG3XYf7ipcEa4AhmEgdfsAw==
Date:   Mon, 29 Apr 2019 10:54:36 +0000
Message-ID: <SN1PR12MB24319A458A44A1E023757EF5A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <9eed02b9fe96805eedbeb9188d6bca711f6032cc.1555672441.git.arturp@synopsys.com>
 <CAD=FV=Vfu5NK6ozujn1uAcHH4hs+mDRPzYL52VhUSm4iNLVXsw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2157a703-a8f6-42e2-b9cb-08d6cc91123d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0605;
x-ms-traffictypediagnostic: SN1PR12MB0605:
x-microsoft-antispam-prvs: <SN1PR12MB0605AD7AB89A36707DC3597DA7390@SN1PR12MB0605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(39850400004)(346002)(136003)(199004)(189003)(91956017)(76116006)(66446008)(2906002)(55016002)(66556008)(66946007)(4744005)(73956011)(64756008)(66476007)(305945005)(74316002)(25786009)(3846002)(256004)(4326008)(7736002)(107886003)(53936002)(14444005)(9686003)(6246003)(6116002)(316002)(52536014)(54906003)(26005)(7696005)(486006)(6436002)(14454004)(102836004)(66066001)(476003)(68736007)(446003)(53546011)(229853002)(99286004)(6506007)(6916009)(76176011)(5660300002)(8676002)(81156014)(81166006)(71190400001)(71200400001)(86362001)(478600001)(97736004)(186003)(33656002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0605;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y1+TbU85mZnVJRKdmjXV55bwxyT1JPn6+qaAmEWjdwm6wnppmBKSKvGbYxaHMo3YDZT6ZGg2wW3kjLAeDRfBsOxTt5hjGbHdCdTRw4hWEM5RfUlpPiE86/iU9Nmqd9ovo0ktY5QOICZ6yFJhd99JZ3s72FX2lMeonm1aRMgi5rXYb9Y8F8r5X2Oer2arnVAe6xWVZod7N4wIZA7WEZ5fIOu8+dHFd/xCSXBlZeSsWmnBaG03kVmAHpBSaJgUJ9FgQbtZjzs4Mk8l3paP5baBGPRn/LApuWI8ALSemUktYdPR3XkrbAe2eD2lFOinW8uZL4NhB9O/cVDzuBG5GDemrUyFySV7K4kOxjHPvI+aknlfhBADVr+Lu28pqLOGnf3PVaoKdH66pIUiYpefVpPKhtndeqPESU5UnI5sWQDPVNw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2157a703-a8f6-42e2-b9cb-08d6cc91123d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 10:54:36.6362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0605
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/27/2019 00:44, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> @@ -426,8 +438,6 @@ static void dwc2_handle_wakeup_detected_intr(struct =
dwc2_hsotg *hsotg)=0A=
>>                  /* Change to L0 state */=0A=
>>                  hsotg->lx_state =3D DWC2_L0;=0A=
>>          } else {=0A=
>> -               if (hsotg->params.power_down)=0A=
>> -                       return;=0A=
>>=0A=
> =0A=
> nit: you leave an odd blank line here.  Please delete it.=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
Agree with this thank you for the review.=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
