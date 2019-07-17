Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8308B6B5F1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 07:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQFbW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 01:31:22 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.213]:32331 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbfGQFbW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 01:31:22 -0400
Received: from [67.219.250.196] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-west-2.aws.symcld.net id E7/0D-11117-6A2BE2D5; Wed, 17 Jul 2019 05:31:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRWlGSWpSXmKPExsVicqA/VXfZJr1
  Yg7uHmSyabvSwWixa1srswOSxaVUnm8fnTXIBTFGsmXlJ+RUJrBmPL35lL/gjX/Fj3x32BsaX
  kl2MXBxCAh2MEq0zvrF1MXJwSAhUS0w8XggSlxBoYJLY8aObEaJoErPExd9vmUEcRoGlzBK75
  15kg3COsUhc/9PN3sXICeScZpR4Ps8IJMEisJJZYlbfXaj+CUwSB3c1s0M49xkl/kz5yQbSwi
  ZgJvH25BV2kO0iAsoSU94IgoSZBfIkHp/ZwgJiCwu4SMz5fJMZxBYRcJU4cPs/C4RtJbFi1iV
  WEJtFQFXi5tx1YDavQKxE0+TJULsaGSXuT3sCluAU0JOYfncRM8guRgFZiXOHOCB2iUvcejKf
  CcSWEBCQWLLnPDOELSrx8vE/VojP4iUO3zoLVaMosaW7kw3ClpW4NB8USCC2r8TDo5tYIKF3i
  1HiZMcHqCItiUMXH0INzZH4MH8llK0u0fJxHusERoNZSO6AsPUkbkydwgZha0ssW/iaeRbYb4
  ISJ2c+YVnAyLKK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NhU18jERC+xSjdJr7RYtzy1uETXSC+
  xvFivuDI3OSdFLy+1ZBMjMOmkFLR/2cF4ftYbvUOMkhxMSqK899n1YoX4kvJTKjMSizPii0pz
  UosPMcpwcChJ8H7cAJQTLEpNT61Iy8wBJkCYtAQHj5II7+SNQGne4oLE3OLMdIjUKUZdjgkv5
  y5iFmLJy89LlRLnnQcyQwCkKKM0D24ELBlfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+x
  5kCk9mXgncpldARzABHTHFEuyIkkSElFQDU+v+juiE/8t3CE55PFGG6X3NTZc+FuG/njGdVZO
  nmF15t8fTIkFylq+a0sk5GlzBP3MvR5VUhMfOXue85NoOkSOmatMU37McFi1e88BfYM6EpjmT
  D565t/hiuszGDobvRx/v/Jqu2SPvPoWl4LGL9I6d86Z3HfcrLNOYIXpe/c/nSY+Oi/+OyZ1f+
  ytFxGt/tPBjc9X9FQ/Du2UEis4o3vh09JPyj0vaM5INLq9JWnhKK7do/9HAU1eeJLIwpExcdF
  NwX+kxTWeblosOizVXbqo7VPlBedpvG++1c3Zb3FrZ9NXi+7e/Ceaq6U/YtT7cmNjxROOCtVm
  +kljGR7ujG+ud5ueofxL86bP95ByVtFYlluKMREMt5qLiRACkZHU0QQQAAA==
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-34.tower-344.messagelabs.com!1563341477!430285!1
X-Originating-IP: [52.192.143.101]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10920 invoked from network); 17 Jul 2019 05:31:17 -0000
Received: from mo.allied-telesis-co-jp.hdemail.jp (HELO mo.allied-telesis-co-jp.hdemail.jp) (52.192.143.101)
  by server-34.tower-344.messagelabs.com with SMTP; 17 Jul 2019 05:31:17 -0000
Received: by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix, from userid 504)
        id E3967294002; Wed, 17 Jul 2019 14:31:16 +0900 (JST)
X-Received: from unknown (HELO mo.allied-telesis-co-jp.hdemail.jp) (127.0.0.1)
  by 0 with SMTP; 17 Jul 2019 14:31:16 +0900
X-Received: from mo.allied-telesis-co-jp.hdemail.jp (localhost.localdomain [127.0.0.1])
        by mo.allied-telesis-co-jp.hdemail.jp (hde-ma-postfix) with ESMTP id 980491AC001;
        Wed, 17 Jul 2019 14:31:16 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (mail-ty1jpn01lp2052.outbound.protection.outlook.com [104.47.93.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id 8E463294001;
        Wed, 17 Jul 2019 14:31:16 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzrBOJY5RrX2LGECLkFQYwcmcU00cg5nunVWkszcHFfrR2mY1UIG4lD55afkilcb6AFuQWjqk28cYRi/jbba9n988qThkP2gPKxgkYntU0U6sVecsAx1z2H986qZ1p3Oz/WqcQcd+QHNIaLjm3WKUT/Cz/ovtbZ5mG8bIrOENKhEu1jCvnVU9akRFAlHQG0UAbDsmKbDYepeTFRa1DOiztaiICTZEvbqJ5wnnsqhvD8EnsR5obARlxlNZu+5zApX+/0cHCI0NwMqe7+0fJGEx/nnWDin0B5GkjOQdhCzW3vCkc6/+qY/I+e+3lUyPiWHLtZzbfv6wPqkfe15ADHQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtpOcjygKcqc2wzBVQrTOzfvpTg0ZGnu62pRxX0yHs8=;
 b=Ko1BEpa4o/VX3h9b+23idVl8cwS3+Z3DRuoJ4YMYSuRHjvN2W+mT2jDc92FBshi9Pxuc3ZI0yRu/Lk9q3pXoSzB/K2wsGQ2nM0R3CTmlFtEEORP+GHGr8ZFbHFHvTMs8a0p+24HbJmKiqHJ3EsKWfPMMUw4+cViTwHIm0ruabmWXoPw4FBZltwofj/XOOdIgkcZHxQ2U9NDh6n9F34eqBXRIzfEpQTOQJvxNo6gprtjaFAXYcA42+2HrInIt8FGk60R5JyYliO7DIAqRAfmNBHwxnaE3yfkamorjJSvQWtAEVFwgOR6Q26Q64I5zvAe/YzdJhLVMDx2st6OzQYwZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=allied-telesis.co.jp;dmarc=pass action=none
 header.from=allied-telesis.co.jp;dkim=pass
 header.d=allied-telesis.co.jp;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atjp.onmicrosoft.com;
 s=selector1-atjp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtpOcjygKcqc2wzBVQrTOzfvpTg0ZGnu62pRxX0yHs8=;
 b=FT748mm08fK9qP/PsiZegjyFNUZXZ9EmkT8+jMveVoVyKrgmB2e2SqwlUAYs+kL/k1gGAmLXTJKAJHr2SLcvnWGul5hfGGviT+duS9y57sCEiyQ5B8ZOgd+/hyvrb6csEBz9WrqwmSGARo+wBtu0uq09f3Ub5yltCUo/DFMKsdU=
Received: from OSBPR01MB3973.jpnprd01.prod.outlook.com (20.178.98.142) by
 OSBPR01MB3656.jpnprd01.prod.outlook.com (20.178.98.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Wed, 17 Jul 2019 05:31:15 +0000
Received: from OSBPR01MB3973.jpnprd01.prod.outlook.com
 ([fe80::a9ee:b4e8:7706:ebdb]) by OSBPR01MB3973.jpnprd01.prod.outlook.com
 ([fe80::a9ee:b4e8:7706:ebdb%7]) with mapi id 15.20.2073.015; Wed, 17 Jul 2019
 05:31:15 +0000
From:   OKAMOTO Yoshiaki <yokamoto@allied-telesis.co.jp>
To:     Johan Hovold <johan@kernel.org>
CC:     YAMAMOTO Hiroyuki <hyamamo@allied-telesis.co.jp>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: Add support for ZTE MF871A
Thread-Topic: [PATCH] USB: serial: option: Add support for ZTE MF871A
Thread-Index: AQHVN7VbmR4JiAW0p0GKgARAy48MDabM++yAgAFQZqM=
Date:   Wed, 17 Jul 2019 05:31:15 +0000
Message-ID: <OSBPR01MB3973235A6A3F7F184611314FBCC90@OSBPR01MB3973.jpnprd01.prod.outlook.com>
References: <156282800460.29653.5486306531486471871.stgit@yokamoto-pc.rd.allied-telesis.co.jp>,<20190716090553.GA3522@localhost>
In-Reply-To: <20190716090553.GA3522@localhost>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [61.215.194.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25167e44-1361-49ca-66ee-08d70a77fcf2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:OSBPR01MB3656;
x-ms-traffictypediagnostic: OSBPR01MB3656:
x-microsoft-antispam-prvs: <OSBPR01MB36564FF0863B4BC9F2F67CC5BCC90@OSBPR01MB3656.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(376002)(366004)(346002)(396003)(189003)(199004)(51914003)(76176011)(81166006)(486006)(7696005)(66446008)(3846002)(6116002)(2906002)(229853002)(8676002)(6436002)(99286004)(186003)(81156014)(8936002)(26005)(33656002)(71200400001)(256004)(71190400001)(19627235002)(53546011)(316002)(74316002)(6506007)(14454004)(102836004)(54906003)(305945005)(7736002)(25786009)(52536014)(476003)(4326008)(66066001)(446003)(68736007)(11346002)(64756008)(53936002)(6916009)(478600001)(9686003)(55016002)(86362001)(66946007)(66556008)(6246003)(66476007)(5660300002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3656;H:OSBPR01MB3973.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: allied-telesis.co.jp does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SN3k0hwtWM+ZtcR0f42DJ7ZKy1atyErF6970Abe/Xt3Ze3tAD2tZp4SmXg3O976QRtCx6HCqXS63wC0X69M8yfEtd3/6PCmW8fh6+bAgp37Ud3Ddy1JVedUa9pYGk70wmOZeP8iaLnuH581qeOylokeKFT732v3cllr1OrObUQDq1p3eN9s+JlhgpHbl/fAu7edLuoYe2CIDMAm1+UBvMCePYzrSOtr1OE+VLfEDehnHBvqWab1UrUwT0CtIsd0sOR9SwjsNXIBXjF0UEniwdgU2WPh5Da7jbCbte8Jxvq2qhF9PquUSqtwkqkGpNxSYsyDeH6z3LbwbQJ16rwgbsBNr6B5KfJrSs++8K82d4o2VQsqwFXtw/IG4pHfTL8XF61YMm+YEKen8P2+u8pHh+ZOquLm3U6RUhqkhZ96Es3U=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: allied-telesis.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 25167e44-1361-49ca-66ee-08d70a77fcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 05:31:15.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1a8a37cf-9ecc-4cef-abb0-1ab01a15a6ad
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yokamoto@allied-telesis.co.jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3656
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> Since you are the one submitting the patch your SoB should go last. We
> have a Co-developed-by tag which can you use to indicate co-authorship
> (the second SoB is still required). The documentation for this was
> recently updated in commit
>
>        24a2bb90741b ("docs: Clarify the usage and sign-off requirements f=
or Co-developed-by")
>
>
> We're trying to move away from adding product-id defines, so please just
> use a constant here as most ZTE entries do and add a short comment after
> the entry. It's fine to go above 80 columns here even if checkpatch.pl
> complains.
>
OK. I will fix up your pinted issues and resend patch.

Regards,
Yoshiaki Okamoto

________________________________________
From: Johan Hovold <johan@kernel.org>
Sent: Tuesday, July 16, 2019 18:05
To: OKAMOTO Yoshiaki
Cc: johan@kernel.org; YAMAMOTO Hiroyuki; linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: Add support for ZTE MF871A

On Thu, Jul 11, 2019 at 03:53:24PM +0900, Yoshiaki Okamoto wrote:
> This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
> to option driver. This modem is manufactured by ZTE corporation, and
> sold by KDDI.
>
> Interface layout:
> 0: AT
> 1: MODEM
>
> usb-devices output:
> T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  9 Spd=3D480 M=
xCh=3D 0
> D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D19d2 ProdID=3D1481 Rev=3D52.87
> S:  Manufacturer=3DZTE,Incorporated
> S:  Product=3DZTE Technologies MSM
> S:  SerialNumber=3D1234567890ABCDEF
> C:  #Ifs=3D 2 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
> I:  If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> I:  If#=3D 1 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption

Thanks for the patch. Looks good, but please fix up the two minor issues
pointed out below and resend, and I'll apply it after the merge window
closes.

> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>

Since you are the one submitting the patch your SoB should go last. We
have a Co-developed-by tag which can you use to indicate co-authorship
(the second SoB is still required). The documentation for this was
recently updated in commit

        24a2bb90741b ("docs: Clarify the usage and sign-off requirements fo=
r Co-developed-by")

> ---
>  drivers/usb/serial/option.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a0aaf0635359..e11ae2092229 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -308,6 +308,7 @@ static void option_instat_callback(struct urb *urb);
>  #define ZTE_PRODUCT_ME3620_MBIM                      0x0426
>  #define ZTE_PRODUCT_ME3620_X                 0x1432
>  #define ZTE_PRODUCT_ME3620_L                 0x1433
> +#define ZTE_PRODUCT_MF871A                   0x1481
>  #define ZTE_PRODUCT_AC2726                   0xfff1
>  #define ZTE_PRODUCT_MG880                    0xfffd
>  #define ZTE_PRODUCT_CDMA_TECH                        0xfffe
> @@ -1548,6 +1549,7 @@ static const struct usb_device_id option_ids[] =3D =
{
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, =
0xff),  /* Telewell TW-LTE 4G v2 */
>         .driver_info =3D RSVD(2) },
>       { USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },    /* =
GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
> +     { USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, ZTE_PRODUCT_MF871A, 0xf=
f) },

We're trying to move away from adding product-id defines, so please just
use a constant here as most ZTE entries do and add a short comment after
the entry. It's fine to go above 80 columns here even if checkpatch.pl
complains.

>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, =
0xff) },
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, =
0xff) },
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, =
0xff) },

Thanks,
Johan
