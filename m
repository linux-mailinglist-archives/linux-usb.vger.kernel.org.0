Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A246A6D034
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2019 16:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390994AbfGROqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jul 2019 10:46:40 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.215]:41054 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726513AbfGROqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jul 2019 10:46:40 -0400
Received: from [67.219.250.196] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id FD/E0-11015-D46803D5; Thu, 18 Jul 2019 14:46:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRWlGSWpSXmKPExsVicqA/VdenzSD
  WYPoXA4umGz2sFk/brrFYLFrWyuzA7LFz1l12j02rOtk8Pm+SC2COYs3MS8qvSGDN+HC2m61g
  qVTFk/XdrA2Mk8W6GLk4hAQ6GCW2rvvN3sXIySEhUC1xesM8dpCEhEADk8SS/RtZQBJCApOYJ
  aY+0wJJMAosZZa4un4RC4RzjEXi9Lm1zCBVjAKnGSWezzMCSbAIrGSWmHx6AiPEkglMEu/mbm
  GBcO4zSlzecY4VpIVNwEzi7ckrYNtFBDwl2m4uAFvILJAn8fjMFjBbWMBd4u/cv1A1HhIPV71
  kgbCtJNasWskGYrMIqEqseXMDrIZXIFZi6YybUMs2MUocebueCSTBKWArMe3zKkaIW2UlJu9q
  ZIJYJi5xafIiNkgQCEgs2XOeGcIWlXj5+B8rRH28xOFbZ5kg4ooSW7o7oeplJS7N72aEsH0l7
  jzvYYME3y1gWJyGGaQl8W1ZJ9BFHEB2jsTmc14QYXWJlo/zWCcwGsxCcgaErS+xZ+IpFghbW2
  LZwtfMs8B+E5Q4OfMJywJGllWMFklFmekZJbmJmTm6hgYGuoaGRrqGxqZAtpFeYpVukl5psW5
  5anGJLpBbXqxXXJmbnJOil5dasokRmIpSCtrTdjAumvVG7xCjJAeTkijv8jiDWCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvCatQDnBotT01Iq0zBxgWoRJS3DwKInwzm8BSvMWFyTmFmemQ6ROM
  RpzTHg5dxEzx4KtSxYxC7Hk5eelSonz3gEpFQApzSjNgxsES9eXGGWlhHkZGRgYhHgKUotyM0
  tQ5V8xinMwKgnz6oPcw5OZVwK37xXQKUxAp0yx1AM5pSQRISXVwJTDPZU9K2Kxr6bsxv+anSb
  m2+JXa76YfPldQcoN/rSUvYuyz/8JeRR3iuOL/Lyi6LX9ax4IFoj8eV/dMiEhYVbhlQnnC7da
  x/zleX1uy/LJVZruTTHWB2oTurXt8zTXLuCKFpSfEpjyNLauYYUJh5USy88cy5JDJ94GF6qni
  f+6NPUX88sjb+c/vPvhvOo/fs3TtZ76ih+eznJuva965p1D/X7517GW2qXbNyU+mXdjT1qs6l
  yH79xr+iLyaq0aVwm2WrNmO6kE67pGNh/7Ejhbgf/Btfdnxd1CUl4lf37tPOGU5HZezw8iS4R
  vynof2eK7SydB0NVr9tbsYPdWH7+e0JgNu+r6cry8GJ3UlViKMxINtZiLihMBBC+cGlIEAAA=
X-Env-Sender: yokamoto@allied-telesis.co.jp
X-Msg-Ref: server-26.tower-344.messagelabs.com!1563461195!133082!1
X-Originating-IP: [52.192.143.101]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6686 invoked from network); 18 Jul 2019 14:46:36 -0000
Received: from mo.allied-telesis-co-jp.hdemail.jp (HELO mo.allied-telesis-co-jp.hdemail.jp) (52.192.143.101)
  by server-26.tower-344.messagelabs.com with SMTP; 18 Jul 2019 14:46:36 -0000
Received: by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix, from userid 504)
        id 79EB1294002; Thu, 18 Jul 2019 23:46:35 +0900 (JST)
X-Received: from unknown (HELO mo.allied-telesis-co-jp.hdemail.jp) (127.0.0.1)
  by 0 with SMTP; 18 Jul 2019 23:46:35 +0900
X-Received: from mo.allied-telesis-co-jp.hdemail.jp (localhost.localdomain [127.0.0.1])
        by mo.allied-telesis-co-jp.hdemail.jp (hde-ma-postfix) with ESMTP id 206AD1AC001;
        Thu, 18 Jul 2019 23:46:35 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (mail-ty1jpn01lp2054.outbound.protection.outlook.com [104.47.93.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mo.allied-telesis-co-jp.hdemail.jp (hde-mf-postfix) with ESMTPS id 0BF2D294001;
        Thu, 18 Jul 2019 23:46:35 +0900 (JST)
        (envelope-from yokamoto@allied-telesis.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQnl5+C1WOJGg0ux1YIJe05aLR9YwybV17yalwnvrBiIA+GoRJYqUT1odCGFNJRgk0VXSgkoPxIzqgEaoDMUuHfoPgnO8YB2YfspKlkP9aPPIh76zrvPBFIRFy5bVTxrNN1UKxmx3t5xF3TdTEWi7fvMmygBSjVzOvX6y3sZJBHiAgvVbmUeRjJY+m/XsiZsD5/My3WIqkWUhcb6TnpIVRJw5uo+it12p6BZilcMWYieFX0WY2GLMGOpvju0EJZntA8VVkOXbU/+6tuO5MAlmxNhkb6nU7zenLFrmFxMJTnm0PDs0sWorGPS05TcpETsZ87DRd3MAHeEKsi2+HU+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjow8vUPeMwZq6xExDq+/AoPNDXzUW46Dnmfs/68Cw8=;
 b=MpFABUHUSFwy8jLOaqxX/4M4mEbhlYiQgfxZj7KUlQAnkLvBIxTyvDXdP4gqQZeYfhixd8xYyxAVrG/IGdkL7vumG7dmy/6ZsLey+jhdcKt3azWP+ejKRw0OUFz+Hhzq9R1s71h6Wove866D0Eeb428metSoaKlknedYWojwvAu+8p3sKUSWzAdxC6BPwwXYbUGVILMZpcghRaqkV0WNaoiIMJpZNEqlt56pgQn07L+gTqTCLUAvyk0AVqN31kqyZEJbBRSegR+zL88r5OR4bumOABXv/vqNjeBDfLuQOjCvltoF0PP/+3/pfpgZ6u5bc+DzZHJmBifeqdbyzNlPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=allied-telesis.co.jp;dmarc=pass action=none
 header.from=allied-telesis.co.jp;dkim=pass
 header.d=allied-telesis.co.jp;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atjp.onmicrosoft.com;
 s=selector1-atjp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjow8vUPeMwZq6xExDq+/AoPNDXzUW46Dnmfs/68Cw8=;
 b=MmeLTx77y9i5oFzPfFVFQOisxd4hN0j1vJ+r7Xs+CIB/L7gFDCItv+9OEWJjaKgY9812idKJrWFGmwNJt9bh716zYlbe6SJLiO5t7dOFol6zMk7iIqZCWMZuOlJTqkacBOz8dVBLYiGi40ksUIh9NiVOZQ+lJDHQCLG0ljtzmIk=
Received: from OSBPR01MB3973.jpnprd01.prod.outlook.com (20.178.98.142) by
 OSBPR01MB3864.jpnprd01.prod.outlook.com (20.178.98.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 14:46:33 +0000
Received: from OSBPR01MB3973.jpnprd01.prod.outlook.com
 ([fe80::a9ee:b4e8:7706:ebdb]) by OSBPR01MB3973.jpnprd01.prod.outlook.com
 ([fe80::a9ee:b4e8:7706:ebdb%7]) with mapi id 15.20.2073.015; Thu, 18 Jul 2019
 14:46:33 +0000
From:   OKAMOTO Yoshiaki <yokamoto@allied-telesis.co.jp>
To:     Lars Melin <larsm17@gmail.com>,
        "johan@kernel.org" <johan@kernel.org>
CC:     YAMAMOTO Hiroyuki <hyamamo@allied-telesis.co.jp>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
Thread-Topic: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
Thread-Index: AQHVPGIitlRoYnyPjUyBFtKe4ZcuLabOtxOAgAGFjnU=
Date:   Thu, 18 Jul 2019 14:46:33 +0000
Message-ID: <OSBPR01MB3973A00B1FB1E0930DF0AC13BCC80@OSBPR01MB3973.jpnprd01.prod.outlook.com>
References: <20190716090553.GA3522@localhost>
 <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>,<5b4971b3-64e7-605a-948c-9e1e02b11eb2@gmail.com>
In-Reply-To: <5b4971b3-64e7-605a-948c-9e1e02b11eb2@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [61.215.194.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e303ae5a-4a28-4fff-33eb-08d70b8eba3a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:OSBPR01MB3864;
x-ms-traffictypediagnostic: OSBPR01MB3864:
x-microsoft-antispam-prvs: <OSBPR01MB3864A0C1BECC5A9B1277395DBCC80@OSBPR01MB3864.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(346002)(39850400004)(366004)(199004)(189003)(316002)(486006)(66066001)(25786009)(110136005)(54906003)(446003)(478600001)(71190400001)(76116006)(71200400001)(52536014)(99286004)(5660300002)(11346002)(66446008)(66946007)(66476007)(33656002)(64756008)(66556008)(3846002)(9686003)(6116002)(26005)(256004)(229853002)(7696005)(55016002)(8676002)(53936002)(74316002)(305945005)(4326008)(7736002)(186003)(19627235002)(6506007)(53546011)(6246003)(81156014)(81166006)(102836004)(8936002)(476003)(86362001)(2501003)(14454004)(76176011)(6436002)(2906002)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3864;H:OSBPR01MB3973.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: allied-telesis.co.jp does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fA5pCVfXt07zPsZRijhOs4I7TI7kZ+WxjsYxmiw7o7kwhYbbzVVPg6tc7MJcxF4qN8LDFte1hBrQ61F1sAIdb8f7ijq6FxMobcvzEynEKvBtVOBawS4KFajT2vlPBTtJqgpX5GBtOBZBrmMEctpYGLFak3hrxQrZ4R6P7JKf9dv1nvEwxpvhdmqVndvFU6Zg/ManyMV6xwXwjjEXrrizwT+BBlzlXxKUlObtl/GbxHFHEOCQD3saDMILxF1l+3UDLRt3ZcnV/6nyww3OARBLdoAou3WrHpAPtH5e55QW8CSBoJP9RBbqov1KZMEvgvmejfDr27S9qzmXaNiLWtPry4sCpIGwb7IeJg7KW5Y194dsSo2odfCj1rI5fX1z14lwPK/uXCiggfN+Kbe8vcdsiO9GPkYG4Tyd8ix59GVRJfg=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: allied-telesis.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e303ae5a-4a28-4fff-33eb-08d70b8eba3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:46:33.2963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1a8a37cf-9ecc-4cef-abb0-1ab01a15a6ad
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yokamoto@allied-telesis.co.jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3864
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Lars,

> Please do a full test of the interface attributes (Class/SubClass/Proto)
> whenever possible, this could be helpful in case the mfgr makes a device
> with different interface layout but re-uses an already used vid:pid.
>
What should we do specifically for "a full test of the interface attributes=
"?


> Both interfaces has attributes ff/00/00 so there is no reason for doing a=
 less accurate test.
>
Forgive me if I=1B$B!G=1B(Bm wrong, did you say mean that we should use USB=
_DEVICE_AND_INTERFACE_INFO" instead of "USB_DEVICE_INTERFACE_CLASS" ?

Regards,
Yoshiaki Okamoto

________________________________________
=1B$B:9=3DP?M=1B(B: Lars Melin <larsm17@gmail.com>
=1B$BAw?.F|;~=1B(B: 2019=1B$BG/=1B(B7=1B$B7n=1B(B17=1B$BF|=1B(B 21:05
=1B$B08@h=1B(B: OKAMOTO Yoshiaki; johan@kernel.org
CC: YAMAMOTO Hiroyuki; linux-usb@vger.kernel.org
=1B$B7oL>=1B(B: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF8=
71A

On 7/17/2019 12:40, Yoshiaki Okamoto wrote:
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
>
> Co-developed-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> ---
>
> Changes in v2:
> - Add Co-developed-by tag.
> - Move away product-id define and add short comment after the entry.
>
>   drivers/usb/serial/option.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a0aaf0635359..3188b3cb0f21 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1548,6 +1548,7 @@ static const struct usb_device_id option_ids[] =3D =
{
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, =
0xff),  /* Telewell TW-LTE 4G v2 */
>         .driver_info =3D RSVD(2) },
>       { USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1476, 0xff) },    /* =
GosunCn ZTE WeLink ME3630 (ECM/NCM mode) */
> +     { USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x1481, 0xff) },    /* =
ZTE MF871A */
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1533, 0xff, 0xff, =
0xff) },
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1534, 0xff, 0xff, =
0xff) },
>       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1535, 0xff, 0xff, =
0xff) },
>

Please do a full test of the interface attributes (Class/SubClass/Proto)
whenever possible, this could be helpful in case the mfgr makes a device
with different interface layout but re-uses an already used vid:pid.
Both interfaces has attributes ff/00/00 so there is no reason for doing
a less accurate test.

rgds
/Lars

