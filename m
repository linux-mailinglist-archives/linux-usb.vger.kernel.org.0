Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A5F3B8D3B
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 06:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhGAFAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 01:00:40 -0400
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com ([40.107.94.84]:5600
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230293AbhGAFAk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Jul 2021 01:00:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu3+P3xgGnA4rBxC/SfAEnJ/fcZsNJFyCllpo69ejoczgRIh/j3HRRjwkRKqN/uAR3vcITqpoYEipOMWzUz5E1ZAcfyKGhJxbLk25txyOZkXA8meUK11BfP3RqpkTtdFCuMYFtRjYkA24GjaQdYmsPKpHpLGrCIA/UjD5nOrLgeFxMl1S9z11OMQyysGumConoaLQlC5l4TXe+ybXlRR4amEbvsG/8ftKTE/k9knO1WmXZU8StwBjfjIFR42aE5Aksc2nIdGVS7Iba6cunR/uxB8p5wwwxj1jwnrQdCdktqv6xx3NvEOCnyKuHYDLhEQfkfdkWbhy928uEiF1YRmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx7jgrIDc9XJ1L9fTLWnI5c2VaPcBhaDCO3WBJJNrZ0=;
 b=k71HkWlj5ZC1ZggiLeBpKS2nGtW8Bw5ThWpRe1iweZeoxaDsfPofWpJQyyVQLSIhY3wRQ496ws+pBJgRMv0rwlqOSuI/Uqn46JJLC2F7pnsnWLdSeApEFOLz05SNaw7CQGLOcIJ0Z1xGHzlAUNiWZWkHe/FsnQrcg4DbKqwEy2SJeAv1ISI+K1/ntCNngLilt1hzcJwuhbwfgOwp/m54VMsjv6tlRwFemOW9snJasvkCvEzTtjfFWQH1evaM7INlwNzHj/1UHW+QFKdQQ11WxXxAaJ3zH4Hvr1TMp/t61dltNSQt54pPzulOAoolQL4B6/7SaQN+fUBBMZbQjVK3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx7jgrIDc9XJ1L9fTLWnI5c2VaPcBhaDCO3WBJJNrZ0=;
 b=m26hcTJkDWCwbLaSO5lOKqsSMFBJ5YxsDVg3j24mgdLRhjpuq1d8j+N4FADPcjX1BSciKJx5K7Di4KanjkhQAt41v6jkwmSgy2ENyu5qqzulKtFt4dbFiVPJWepQb8TCWsf13/JUVUgC8KuHpL9tN0jTieC7h4dZb2lBrcTzXwU=
Received: from CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8)
 by MWHPR11MB0077.namprd11.prod.outlook.com (2603:10b6:301:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Thu, 1 Jul
 2021 04:58:09 +0000
Received: from CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::905b:f608:d0e6:6cf4]) by CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::905b:f608:d0e6:6cf4%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 04:58:09 +0000
From:   Tung Pham <Tung.Pham@silabs.com>
To:     Johan Hovold <johan@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Pho Tran <Pho.Tran@silabs.com>,
        Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: patch "USB: serial: cp210x: add support for GPIOs on CP2108"
 added to usb-next
Thread-Topic: patch "USB: serial: cp210x: add support for GPIOs on CP2108"
 added to usb-next
Thread-Index: AQHXaOeVhA2iY4NHiEazqc2bjICcJ6ssRT8wgAAX/QCAARa3EA==
Date:   Thu, 1 Jul 2021 04:58:09 +0000
Message-ID: <CO1PR11MB4882C876E69D61C52C42DAB981009@CO1PR11MB4882.namprd11.prod.outlook.com>
References: <1624532158188214@kroah.com>
 <PH0PR11MB4888B9D24A5F90E8AA02B28B81019@PH0PR11MB4888.namprd11.prod.outlook.com>
 <YNxCBreFm7uisstJ@hovoldconsulting.com>
In-Reply-To: <YNxCBreFm7uisstJ@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=silabs.com;
x-originating-ip: [1.55.242.165]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb887bb-55e2-40c2-7efe-08d93c4cd2a7
x-ms-traffictypediagnostic: MWHPR11MB0077:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB0077DCD716B12BA7C2E3FD4481009@MWHPR11MB0077.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DYHS5WAuOWJC5TzfiGKY+nj3tqLKkByI2NIDOyaSVWsjycFSxwbbrwQjIx2nFi9faSxTxHbJf1lFtxDqTd6kkFUnnKcowJ0vqv087P0uc78v8R1I/XqQWGzy3E9zqCHgJv30iBQl+MrmCDHryrTGfu0xL6YL329RD5Ihrw57m99jPoUPYChsMGG8aDi96bf10s1N9N/e0Iw7EcKgXoSC/NSNW+k0FJUcsEuoACQ1BivBd/YHH/cPp7WwehhfObuG/JjG0+Xn6IzDpV9pRltKVvTPPYsOVJyHkuxrXZHNCWGAyT9uWEPVsXQXknFJykKGnmD4Q1CqxWKd76VDYTCAHv2PJtLWUo0qxVgj66Jj0tFanIVIEqIa3DPo8OWntLILtzDVTI/n2HzV54tdycULZhBWk2Euodsgi+3cVMBTfHQ0dVwIVx8msU8G/JnGQ3m361Ccc/kY5fZLU5tNESA9KnqTJ215NdJ8U1mfCfsYP+mosW8oqa85y6uX54xE1zJFSGQjrzw8pU693/kmRhA8+FZLdOSyvDnh2eZ/vNNFn+UENrWW6Yf7HIDZpY6EB5erR5UM8bK1Vj4XOljsU8/qiwZA3hBbsTditE8aXEFXJX4R8B1yw2Lve5fg43K8X1nY6y1eCvcDonrEEiAFxDzHTjprIBRIucyzSElkMS8lvIAC3eSYk9z4qMj7GCjJxbfwJc5EKqzfdoR9BOpida06ygcbG39dYiGgvhL2WAQc+OvU4ZcpGfcm9m38kVZgZI2zoqMIZ9OwGiGgAsF1GQyf4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4882.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39850400004)(366004)(136003)(966005)(7696005)(6506007)(316002)(55016002)(186003)(54906003)(8936002)(26005)(9686003)(2906002)(5660300002)(8676002)(6916009)(122000001)(38100700002)(478600001)(4326008)(33656002)(86362001)(52536014)(83380400001)(71200400001)(66946007)(64756008)(66476007)(76116006)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d8u3lwbJsBztdvqa9SBcZUPKwFbuEnynkgv3CYG7kNB5lmJ4TFu2xfkshTLO?=
 =?us-ascii?Q?v+jQACJVmMvmU7VsM8dxAhM4ULCbmAWN40b1U9hiv80UPiiKWFQoldU3nfYQ?=
 =?us-ascii?Q?37/zkYaHafkS4PiJrzBGG312brKlgQgAtPrm85BM7HKj/s/sSKagXj1rTP0h?=
 =?us-ascii?Q?uKqHTZC4uWDgR7GM7NQwQEdHcxhivIg1w9FHPi56Od8EEw3cQIup+cSNhNlp?=
 =?us-ascii?Q?B1qARZTSnc8H88+ULHeUdH2bNqHGfT6TYoSq3Rtz2Tc5A8d92fsSYtCOVNgH?=
 =?us-ascii?Q?hUa+Uo6/2cx2d57xlg7NBquLFcHguIRKxH16+TzSPtOy2GI6JJI+LZNPtx+9?=
 =?us-ascii?Q?jlFT2G3bCw3Co3WNpjqTMBF575EoPEpWT8t+xmutXBPDcqHZJtykj65PXevJ?=
 =?us-ascii?Q?w26INLdgQY/6n60paJXjcoJkGI94Y9JcYSNUYbDgCgztJiZEMfukmFNFm+FE?=
 =?us-ascii?Q?2IShjCIGezN7/U2tlEw3253NCPDNER+qaKypzJOcUuhrbyqdGgPF5xXKodk+?=
 =?us-ascii?Q?G2lE3SwfgG8tArzJu9cS1FH8TjqVU0XkGG1uoCMGPee/x0DmHw4/sg58T9I5?=
 =?us-ascii?Q?ANOkNqpidg6YRaU9zTqTFW3t5xhRK0AbMyj9iedNGeuboqpVMm6f2u6t09+w?=
 =?us-ascii?Q?CHIqb2D7OLeTBhKr9NJufynKXTMzLzA6ao+L1yTv0IT6e32alvuC7zAbxhDg?=
 =?us-ascii?Q?g+GSj4gCSZ63ZiyrDu2yFGtG5AljK9oOkcb0XnjJrxKx1/9AdZe3RM0cgnNb?=
 =?us-ascii?Q?/ZTuAGI1rwWWcjGEnDfdCjWIv09PgS0kmA/3RRN9yzpFi/abSGl/0v6jQ6De?=
 =?us-ascii?Q?R9xyXmHV9kOV9LjkcoEEruyUCVzflKgXGW0WOkuhCYQV8Ng3sEGM6fx3DsWW?=
 =?us-ascii?Q?tt5jXLk/DNOevAvoeHSvgDCWGNCJSjvLr3HVuKNP1IDaSwa6VDplUs6rO0DQ?=
 =?us-ascii?Q?I1lYMcvF9mFP6f3LUbQyntcvC7o5XUVPTsZCIhDktf+BsVp1PlsdfmesaomY?=
 =?us-ascii?Q?ZO85L1ZMdsSDLH6eE0Q5nlROEeHbyLgyrz+WLGYg8ttPhHWYawVXjWaghzxW?=
 =?us-ascii?Q?5/Fr9hwd3a9hLR3lg1lfX8+HUZb2EihL9YKEoSoTaO8RaEAzn1zCPNgGM6dV?=
 =?us-ascii?Q?ucazQEcEqExYhb7vEzUag3fG18UM0c/xKtJtJLJpzCN/3tgUTQ9oC71nxr9Y?=
 =?us-ascii?Q?niJkCUf1HoxYylNpmF2xHCT9gR5rdxg0f+aNBb4VhpmFjLEIlAkrf9CT4LJX?=
 =?us-ascii?Q?DBm96CyR4FtRvejb38j8DWK+ilqsbDAZvpHlSS/cO4BEHgtK2gwIHG8knnjf?=
 =?us-ascii?Q?lIg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4882.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb887bb-55e2-40c2-7efe-08d93c4cd2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 04:58:09.7645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ+gkMmIO7iFUmtF6FAHk3M5eg1VoshSsY0L94chxuCCdUR6ZJY6nBH+xphtJfN0Ne/h7Mn1hgqOoNHJFR1pqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0077
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dear Johan.


>Please make sure to CC the usb list when reporting problems. I've added it=
 to CC now.

Yes, I will remember to do this next time.

>Are you sure you're using the latest mainline kernel here, that is,
>5.13 here?
>With recent kernel's you would not see -ENODEV ("No such device") but rath=
er -EINVAL ("Invalid argument").
>What does "uname -a" say?

I use the kernel 5.8.0-59-generic, I think either result ("No such device")=
 or  ("Invalid argument") may be accepted in this case.

>And which version of the patch are you applying? Are you sure it's the lat=
est?

I apply patch V13 from last mail that you send.

>> But when I test the branch of Mr Gregkh.
>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/dr
>> ivers/usb/serial/cp210x.c?h=3Dusb-testing
>> root@ubuntu:/sys/class/gpio# echo 496 > /sys/class/gpio/export=20
>> root@ubuntu:/sys/class/gpio# echo 497 > /sys/class/gpio/export That=20
>> mean it still use GPIO 0 and GPIO 1 as GPIO functions.

>It does seem that way, but to be sure, do the

>       /sys/class/gpio/gpio496
>      /sys/class/gpio/gpio497

>directories show up as well?

Today I retest it and it seem everything is ok. May be previous test I have=
 some loading driver problem. The result is as below:

echo 496 > /sys/class/gpio/export
-bash: echo: write error: Invalid argument
echo 497 > /sys/class/gpio/export
-bash: echo: write error: Invalid argument
tung@ubuntu:~$ /sys/class/gpio/gpio496
bash: /sys/class/gpio/gpio496: No such file or directory

>I just did a quick test using the code in the usb-next (testing) branch an=
d it seems to work as expected when hard-coding alternate functions for som=
e of >the pins in the driver.

>I did not actually reprogram the device so perhaps something is broken wit=
h regards to reading the port configuration. But then you should see the >p=
roblem if you apply the patch to an earlier kernel as well.

>Can you apply the below patch on top of Greg's usb-next (or usb-testing) b=
ranch and send me the logs from when connecting the device?

The log written is:
[ 3599.781531] cp210x 2-2.1:1.0: cp2108_gpio_init - 03 00 00 00
Anyway both drivers are now working ok.
Thank you.

