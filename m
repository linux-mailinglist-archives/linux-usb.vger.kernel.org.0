Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E21D3B8E58
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 09:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbhGAHst (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 03:48:49 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com ([40.107.93.42]:35109
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhGAHss (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Jul 2021 03:48:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVN1adTlQyIz/YbaGWkRQUP5xBKsaWRNi+/0kLpYPyXK3zjBYq3dZxleC+XGeuPrCTdvnsuJMlkKPvh8kjKYfChChMpuyXxINBVt1KmH2VWsWd/qcUfxQnYbl+WJLd86N28x/xqF8u1B0VR+slA8tCPe7GcHX22b3F6xSITDfETm+eJkzIfSJRlZMk2KyKYXaM0w9olnXrMLbChkodpxRhTfI5HD1eWUGft7chqMls4xP7sCXkfz4+N6Pal+dc7L402bcOg0a5jpPAnKPUzrqtYlDNHjwt0ZfLSEh/dXTIYM8bMBmumsOmKWLcwazgsqtgwXB6Saw9uk/HxFWdC5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxjfN17jhp8DpRvla3TY5ju5TaMyjc69tSXueUarK68=;
 b=T6eFqxhFxX7uOrw6YOxV4rB2Nnjr2GPY49mO6/xbpfGBLi7GaYxgx+7xaEbR8bY+veC/sf9cGBvScfcgOvnMKMhBj1zN+cXTAAEOtE3H0qdMT4WKzCCqX+Z4OrXfqMm4ogxlRXmFsmvRPAJ5q8Mj8co1y9vR8oEewZK01mIK1x1IIwaMZ/XKCEQE5TYcUGs7jvMMHmid4dwvn79zsf5Xq0/eJNM4z6iFKT+bk63EmJGh050zAuAcEV0SRIEEnmyKvmd4XQyC6xPAndm+rUlGlcndGCY9Os3j1YPXhh0fpr4M3xzdOCyO3O2NhAjmz1J7FoKSUPRYyOrgiAOS+IrCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxjfN17jhp8DpRvla3TY5ju5TaMyjc69tSXueUarK68=;
 b=AtNtuK3afpnFlgElbfsxKw+n7qyc9Ty/fujHycPEyJ+EihFUgX1t5gWskIVM8ve1MBeFqu2eqjC4VJZhZmcPQ/lXOVu4VTgLsOqyStp9sGMD0RdVIhr6ZPzrs23BEH0hIhAzBi/drgG9JXHsHc8RmuzoUDIQYX67Towu3Xv0k80=
Received: from CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8)
 by MWHPR1101MB2271.namprd11.prod.outlook.com (2603:10b6:301:52::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 07:46:14 +0000
Received: from CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::905b:f608:d0e6:6cf4]) by CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::905b:f608:d0e6:6cf4%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 07:46:14 +0000
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
Thread-Index: AQHXaOeVhA2iY4NHiEazqc2bjICcJ6ssRT8wgAAX/QCAARa3EIAASDwAgAAHkGA=
Date:   Thu, 1 Jul 2021 07:46:14 +0000
Message-ID: <CO1PR11MB48827E1D157F5C8EF67361E781009@CO1PR11MB4882.namprd11.prod.outlook.com>
References: <1624532158188214@kroah.com>
 <PH0PR11MB4888B9D24A5F90E8AA02B28B81019@PH0PR11MB4888.namprd11.prod.outlook.com>
 <YNxCBreFm7uisstJ@hovoldconsulting.com>
 <CO1PR11MB4882C876E69D61C52C42DAB981009@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YN1obE99oebXaD24@hovoldconsulting.com>
In-Reply-To: <YN1obE99oebXaD24@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=silabs.com;
x-originating-ip: [1.55.242.165]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b08d4e95-02d4-4470-6cb6-08d93c644db7
x-ms-traffictypediagnostic: MWHPR1101MB2271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB22718DD4231537C9F59079A481009@MWHPR1101MB2271.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvwz9D2+MD89ZmndCpfkgSHgfIOaQwzwT9lsbu1p7Q+mJaCP6og3ETCQZCwTvxTCRYL+kAR9dQeaLooE0n+LmzhFlHu3/nkl65oYTMRlyc+lOLBpAZoakrVIs1U/7h2fvgzaXL5NW7y5XY7mIcJMTUQUFwbGjlLz3nUESkZhmSnmojbxTr3uugV7HvANZYFUzUHFpyHn/GYh4ARVhhP3yTieybF3kNOMRZ70ZvN+rOf009xNRgfjQyl6Uyzr/ptq6qO9x8g31jcFT6zTs9Obu06TVGd5QksARlhVR6VSbd8+RKQ1DSZXeKChcX0w2fM8jblh9gduTWgWTufwBydDug4xTVz25aU05yeS79fDafYc+WeL871btfo0MZF9Sx2S3REEoiObDp74hfHxq2iavuZOIRyt6NjhCvB70DlcPHZB4kHAU92cq++OfkgkF7OK2ZhQpOp25zSfXEu2cj7T3nfOz/nMiGAt0W0NMMZLY67/WO4mCgfMzWyEhH5A5w4HScpHwC+7drEjxsCOur2lW4pSe6CQJmrxpuHjW6lqfGWB0SpGoIv9U4jcJ8jy1boLnr4NzDIcKPfYhk3NxCwWHepv8/qG5KNbDtpHxgZQa2vPsItXz8iPNIxOi/EMnFJZYz97R7nBvnNhJc5z0OhCEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4882.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39850400004)(366004)(346002)(396003)(5660300002)(122000001)(7696005)(66446008)(186003)(66556008)(64756008)(8676002)(38100700002)(26005)(2906002)(6916009)(52536014)(83380400001)(66476007)(6506007)(86362001)(9686003)(55016002)(71200400001)(316002)(478600001)(54906003)(4326008)(33656002)(66946007)(8936002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ytA4g4xGQ//lqm82EvXx6rAUDReYE2VDgCfzR1SvmfocENEgDo0ZZNZVPSWx?=
 =?us-ascii?Q?GFFjTfC8zoVumpt0J29ICmD2AQdqnf02g2ZOYKuhHwfgtm5bN/YFXWzrRZRp?=
 =?us-ascii?Q?aWSbDxGsizCZK3BlNWFctIykB2JGRq27dmiZttAeHMBPNy8XFkZj6+WI0ROC?=
 =?us-ascii?Q?hooikm6s6k6vG6Ud/xPI9d3W4sJxpE5VBjxtZTEiXa0NDHxH/2TAEqoS3ivL?=
 =?us-ascii?Q?5QIylYOSwcshFSIPhJhE+4Djr9Mo2O2YkZxFNSa/TmqgxNU1eVgZjEGL3rOB?=
 =?us-ascii?Q?rgI/ELSw28u6qAfawLBFUOuEvDai6W355SYk+IcNu8p27iaEtToGxjxQs5Xx?=
 =?us-ascii?Q?CFUTMHyZL/nT2Xl86kc8fCQ4zW4yLkyIf6lekfS0wIPZUJ9QOLWVDpCFx+HO?=
 =?us-ascii?Q?I3OyBryFvSy3yrt39u93jUxATdHnzmKABWOjubPYaOcjV0YZR7rdiIRs5Win?=
 =?us-ascii?Q?fLAqxumI4Iwhlbe/Jyn01xZoPwhqGuXi/w2d98CqJuVQZx5V7OFMXlo/gjV3?=
 =?us-ascii?Q?OAc9yGBrQXJZNqiEkLO/NUrffmY3FnIRk6g5m5xVLaQf1lzeVExE9OEIPwMH?=
 =?us-ascii?Q?dnmxJI3cIPa7Oxiz6UW7cs93yD/VhYA+fnSyw7wiIDA2IFz9NbTjLLxeK2WL?=
 =?us-ascii?Q?nf+26f+QKR7o434WC4wIyF12x/0ZvknKV37XZzhPsgNeqYDeSG0UY69ZTk4o?=
 =?us-ascii?Q?/vbzpT0r3PesMg4yKmSd363s3DElYIm4jNFuY27sMFrf5ZJ7nQ8TBtCoUu8l?=
 =?us-ascii?Q?q1SYLnz9JYR8aYyLcyPLUYuN0Br71QY9zTm3pH6fp89RiFZjgo2Gna6j8Z9r?=
 =?us-ascii?Q?5aQUQVccLhiiPziLaqz2FSLD2saFknpCVvKlYv5xtrgU6ImkkNBeS9RpJyfi?=
 =?us-ascii?Q?bmmkNfKZANdnPv8gXj5ohea1Wg1Q4e/mpm++b/v8ysqJ0N3FHJ4dcpjUq2RT?=
 =?us-ascii?Q?Ye7HqXn5eGWG0NsKH1YaJW0vc9TOWYlh7UTgDTpvSZjU+f9SbfkLUgHzstpx?=
 =?us-ascii?Q?f/p9NIlK8T65t/Fk9ruf8VXdrrmZ53AVPbRWvGSXjCyiyllC0oR+ebUcCWbT?=
 =?us-ascii?Q?Wgm8+whn3zbntCVKc1O9GitZc7ShNUIzmADl7Hi/ydX1wfr3HGLsVveP41PD?=
 =?us-ascii?Q?wDN/aW18j2v2C9gg0iK2aNmGcZV0aXgnwNr1n+TZUeOoB2D0/yBGXFNyllY7?=
 =?us-ascii?Q?3QKl4Q2FjrAdM5nHpYcVT2n5kHYTjtPKAJtm4xe6Mg4d+7EmVtsOXAK2QdDU?=
 =?us-ascii?Q?C7aO740DzoAjVARp9ifWjVCsBmmdWz0jm7ywTL11I+X17qqfVtOns5gHACah?=
 =?us-ascii?Q?A7Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4882.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08d4e95-02d4-4470-6cb6-08d93c644db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 07:46:14.6285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKLyzKEWoui75mwWAoQaV9ZTjdIZeQe3qxsEaRLhVYXRhnGbbGlkPghbXrbts7N9utZcogap6qGIJQlHQoPr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2271
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Johan.

>Yes, you should be able to apply this patch to older kernels without many =
additional changes, but you should still mention which kernel you're using =
>since backporting may not always work as expected.

Yes. Thank you for remaining me.

>Good.
>Very odd.
>Were you using the very same device in both tests? And did you try with th=
e older kernel before the new one? Perhaps the new settings had not yet >ta=
ken effect otherwise?

Both test I use same device and same kernel version 5.8.0-59-generic.
May be in the wrong test, the device that have been configuring and the dri=
ver may not load new setting from device, I think the wrong may come from d=
evice. Just some plug and unplug problem.

>> The log written is:
>> [ 3599.781531] cp210x 2-2.1:1.0: cp2108_gpio_init - 03 00 00 00

>Thanks for confirming. So everything appears to work as expected, and you =
should have seen the expected -EINVAL unless the device actually did return=
 >all-zero here for some reason.

Yes, now it return -EINVAL ("Invalid argument"). As expected.

Thank you.
