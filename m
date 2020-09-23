Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0204427523D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 09:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgIWHXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 03:23:09 -0400
Received: from thsbbfxrt01p.thalesgroup.com ([192.54.144.131]:50868 "EHLO
        thsbbfxrt01p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726617AbgIWHXJ (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 03:23:09 -0400
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4Bx8lv3BTSz45VW;
        Wed, 23 Sep 2020 09:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1600845787;
        bh=3XsqoerxFyu9ftmsz2JP1lGf7+f5y/NHdR8ywLIsoNU=;
        h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
         Content-Transfer-Encoding:MIME-Version:From;
        b=za8uUtUxL4hWw7fZEM4z1XqRc1GYw/D1D907YA9PZjaK7tbSIkVUD8ZP4y3b4jdtz
         lF2J/NU1D7esEk4CBp1OfHkQbLKb4EaG35O7ROfSibD1aYlW8OkpVGjoS6GfyphXZ2
         kf+Pqn5WDcQ+0YjsY1k0WAW22d9jdVbLu1QjPqyUk3jG6AkYW4eublx4waWhjPHUfC
         GoakKxJohg7BzycIOOBlyK8kZ81ZVvL3/uvr1io5e8rK7Xc3zNfb8/9Q8jIxOSxhjU
         Xmnq1aOLSpBhgMB7LMh7fK6N3NFvg5h7jY1+5w16mmKppbZrsFJ+F+0KkUH5+cRe9e
         EgDqklNhmFSmg==
X-MTA-CheckPoint: {5F6AF7CB-0-C42F090A-662F}
Authentication-Results: thsbbfxss01p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="3ZzuzyZm";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gvxit51eovGj2ByD2M9NBJRYjOm5whP7b5fZAprrpOlNkB1ue9LquF8jV/O6/3Pkb6hdjzvA9FW2wQqpN0bw5JSHjpi3b5PwHDgyuygQ0OEfxxmRPbFjWPKzb4FZ4mUt/ClQvmsUovQza+4CRVe1RHwhP9/B3hyQ4G1oFOzibLb3wTquXl2tbuXziYhA/6wniWExIb08iX2fugxVxmWhkSwJMXOUYmyk/rC26gHE/n6VckXhKCU2eoWuAGMED7UCCcscw9qzzFq5nzTh1ZXfp9/dUv5AHJVE3MTkHoIAuvLC7Gw3mXj0b5WT6TK1ggOkuuyubJ15kWzG8DeoO8pPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XsqoerxFyu9ftmsz2JP1lGf7+f5y/NHdR8ywLIsoNU=;
 b=HsLoHk8duLPjjYxPsIAWqvTIp52mfbxz/UFkLQUeKtGH/yzbDc8dajT4lZDHZXOtSQMjH7eq4FK4EfxCnlCVEyVC5hzkzA18J64R5EIJBLrjspzJJIhPd+loTrMBL0GbokYnKxPxSoFOoV5ziJCFB7JIC55bPHh46DOTCNc3kezPDRSrWOt3+Qs4qrBOc7uisocJw/ryfMnVlz7OLpwTYhnfFZKSwv9pxi8Rm5djlqnMAX8/KA5EYPB7IUuCY9OvjSbq2RpTaT1trx1o1QgHSlhesC8pkcnLl2iVa95oLiSUFbFkgaKTuuBtmQx4NUQf/t/X+h0e0IxiGExdH8NiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XsqoerxFyu9ftmsz2JP1lGf7+f5y/NHdR8ywLIsoNU=;
 b=3ZzuzyZmXyNNx/AWnvnCW+/t7hh9hVMTHYV9keVOKSXyc5a8ODY9yHvwU8L0/ePyqF7TNDD463TOpwjj4VACzO0k2AEyYRKMMvfXukLy6R8FYUBeA8bS8hxjbe1xyt6I5Lf3XnMjeQ4/JfhvkSTqs3e2d3cVvXX/HfCtQCUtSUU=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>
Subject: RE: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OAABHIIAAADx4bQAAA8gQABXlXoRAAANOjAAAAJALQAACQvoAAADyZkA==
Date:   Wed, 23 Sep 2020 07:22:49 +0000
Message-ID: <MRXP264MB0904E313D456CD924D9300DCF8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
 <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200923064402.GA2732582@kroah.com>
 <MRXP264MB0904FE7CD168F36F476A877EF8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200923070415.GA2736466@kroah.com>
In-Reply-To: <20200923070415.GA2736466@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb8c1da4-e99c-4673-3464-08d85f917a2a
x-ms-traffictypediagnostic: MRXP264MB0101:
x-microsoft-antispam-prvs: <MRXP264MB010132784449CD66A5E1B2CCF8380@MRXP264MB0101.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3/lKj586NerPtdv0syrYhYsGEtPHObo5OzIp/uvnSuMOCUkE5a2FZLpcDexT2FAjgOqYDy5RSQDoIQT4UT+KSnRhQzOjRaMWd0A5Ef5jxTiVB3FJaizrc4TKymntzGfIRBBO5Noew7P/ZByy9y0klrz96XRsz/P61SaTiRTcHj5HiJHlzcah/+A0oGqOvOHSP321aa377utepdAdYM/NG9TaSbDJJUN+WMS+i/I9ZrwMMIVlHJD9116UU+SHHA+DFAyqKoeW2p0FUeMYY7lVDnRu1gFcztN3KmgLTgwHOMn6djhHhaz8bIEcVFEsmckiH268Jo3nYpLSFu+/jFbLgZg8ViwC4WmZXAMFiKzFeuPUuJY0Mr/EqwjhQ2AqPjls
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8676002)(5660300002)(478600001)(83380400001)(52536014)(55236004)(2906002)(6916009)(26005)(64756008)(53546011)(86362001)(54906003)(7696005)(8936002)(66476007)(66446008)(186003)(316002)(71200400001)(4326008)(55016002)(76116006)(6506007)(66556008)(66946007)(9686003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: H5oqHobiBtX91cR49g1TJLDM/DKpAk36Fc7/o3p3v8G6mTN14jpmH+1WQ0konBpAmHC1dzh095BML0Ue2tl2onoSrjm+KsSTOSpjJD9gsF2m0owE5A42VflQdHxCDlpOT6XQ6PNvnI+Eqbz1sMSADji6ls2H+BNdxOKYh791NrKAsWQzU1Wp7z1G4J6Kryxm2qErRGpGFeSAkdgC4jEhgPsrIWzQn+yz6GMqFcyZgwMdg5ugfiXq/H9tZdjMazmFMnAe6+rrxRMn2gFWjAqkoEQMCawEQu9r81sA6UkWK1I2Im8AaqWQ2uT7zQrxOyKSBDc8qBX7Hn66uN2OyJR17Cu993qRVPOJ3ezK2dUUVpUDE0I7+PV9CqGj2XdGfbr5AaeVp7VDW4n4YwuviUiYBDpRGLML1UwCnrHVf7AysqHpCsRL2wsCkjpEHwKrQsepzjsynxeVXxWiMX/b7CXmnEgjUBtQzF4iJkUwrIk8aTuFXOQVV9vNQk3qG7EuBmCLEJZcsasFDl2eWYT8Ve3cjYcX47cUsVzwzsxIoFa29SsMo6v4VuKZZor+UIgkLzMVYNY8izNBSMYO2IiwK5hrHvuqeLrRxX8gPLvOII97mN5rgXD1QvDJ5GRqVz+POnMcjBJBpnO3mcgD/6e6F0n1Ug==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8c1da4-e99c-4673-3464-08d85f917a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 07:22:49.7008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnN94NX5v3dEsaLt+4jJM7/ijOidkV/y0rwbDpn3H9h7er74gUEbmyINPf9VUjeRO12moS5qL5Mzmmyg64mwzIKh7u74LomRapwsLFZI5fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0101
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.9.23.71219, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.9.23.5770000
X-Sophos-SenderHistory: ip=104.47.25.109,fs=26535,da=49560302,mc=445,sc=0,hc=445,sp=0,fso=48808727,re=124,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, DKIM_SIGNATURE 0, DQ_S_H 0, IN_REP_TO 0, KNOWN_MTA_TFX 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, REFERENCES 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ANY_URI 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __ARC_SEAL_MICROSOFT 0, __ARC_SIGNATURE_MICROSOFT 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_100K 0, __DQ_S_IP_2D 0, __DQ_S_IP_MC_100_P 0,
 __DQ_S_IP_MC_10_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0, __FORWARDED_MSG 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_WEBMAIL 0, __FUR_RDNS_OUTLOOK 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_XOIP 0, __IN_REP_TO 0, __MAIL_CHAIN 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_REPLY 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

I agree and respect your decision this is the reason I start debugging it m=
onth back and found few areas that can be useful for any expert.

It will be a great help if community giver some hint how to proceed from he=
re.

My finding is :=20

1. FreeBSD machine is doing the continuous enumeration to USB device and du=
e to this host side Linux is crashing. In case we stop the enumeration (com=
mand is sysctl hw.usb.disable_enumeration=3D1) from FreeBSD side so host si=
de linux stop crashing.
2. In case we modify the usb_gadget_map_request function by adding it some =
of printk(around 25) so host side Linux Stop crashing.
3. In case we add printk at entry and exit of fsl_udc_core.c functions .hos=
t side hsm again stop crashing.

Any hint will make my day.

Thanks
Shivam



-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: Wednesday, September 23, 2020 12:34 PM
To: GARG Shivam <shivam.garg@thalesgroup.com>
Cc: Linux-usb@vger.kernel.org; Peter Chen <hzpeterchen@gmail.com>
Subject: Re: Linux Crash with Gadget serial driver

On Wed, Sep 23, 2020 at 06:51:52AM +0000, GARG Shivam wrote:
> Actually, we are using USB-C port at my host but vendor does not support =
USB-C. It is a customization that we did at our end in the hardware.
>=20
> That is the reason, we are stuck a between Yacto and freebsd. If just, wa=
nt to stop the kernel crash.

I understand the problem, but you are working with a heavily modified and p=
atched version of a kernel that was released over 5 years and
430277 changes ago.  An almost impossible task to debug for us, don't you t=
hink?

good luck!

greg k-h
