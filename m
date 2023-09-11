Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC6779BDC2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350855AbjIKVlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242189AbjIKPYc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 11:24:32 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2081.outbound.protection.outlook.com [40.107.215.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA122D8
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 08:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChSB09EBr0yJwtIakuK4rW4TSjMrH1bnregQKzYRlyg75iyR/AeD56+mRbFXRA5sGH1WQP1jjaRfDHTxw8piyBhAnTD+YwCWFKSTut3r95b8BZu36e9s1gurlrwJdnlAi0RvN9yKrSW1mTx49FNBHg8LJe1GQPeBdpjL2O6m0DgQpJuEBxPg19GWR8/QtUnSUaXivvQMN7jF5zN3QmUwQk28pqtnY52ACc28N2NxeFv3ZxNJbnpiZH43UHqa7nXRSe7/6nS4tzbRxSZZ4B6YYy+bAJCVq6V3ArCMyTV51pVuXcdfwrbAmX0b9AWQDjmK0IATj1DcRaU1KCHOD88WTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWUjL5ETJ+fAnWYN5Xg4jIcftWEORhvublwU1dUwf/Q=;
 b=C6KK6A2NrV3RjRmGYfF/2ygjRGnSpsKbEicemuqn3TnY6mu0+Ws1je7AvPDyulHhR4RVymJ2tfkQFQUK9KlFXP+AJfjWHHv+xUNTZAZ+fnUwiybHOwjVzhFTA3T3t+hJuCK3WLKXtq9UlIRrk85/jOuPGW7XCAwAt4SbEVP/KSXAdINT8cbCuUXRLUSUiFVEv9lAEGEJdCfAxVUz9XWM9p7+BSTXfSV4TaZB2jWGRyNBHjqSF50DvHdYJLd2JoeFwnvcvQCP9vp8F9cGVB6Jz2otSHd9pCso97XJOI9npGZdWmiD4nBQ+ZcXIIGAgr0XhrUh/fTycqGCNB0h+Ficdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWUjL5ETJ+fAnWYN5Xg4jIcftWEORhvublwU1dUwf/Q=;
 b=PPG9kp7ikx71IlDfrekADVM5VNgLboJ245Ye2iucGyMJut5g/C7mOdepwi4YyzM+KzfRwhfoE6i7N0JQTv8eBeENmNksrQkt8P2V3qqoMoutSMXJ6wLQNZQn9m5kUm/9UI4miICJqWjlmNaM70/u4xZfllzn3bKsfrcDcDx9HGA=
Received: from TY0PR03MB6276.apcprd03.prod.outlook.com (2603:1096:400:144::14)
 by SEYPR03MB6962.apcprd03.prod.outlook.com (2603:1096:101:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 15:24:19 +0000
Received: from TY0PR03MB6276.apcprd03.prod.outlook.com
 ([fe80::29e2:965c:f784:898d]) by TY0PR03MB6276.apcprd03.prod.outlook.com
 ([fe80::29e2:965c:f784:898d%4]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 15:24:18 +0000
From:   "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
To:     Peter Chen <peter.chen@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Advise for adding Nuvoton BMC Synopsys USB 2.0 device controllers
 to Linux kernel USB Chipidea driver
Thread-Topic: Advise for adding Nuvoton BMC Synopsys USB 2.0 device
 controllers to Linux kernel USB Chipidea driver
Thread-Index: Adnhl67G3S4A2aX2Qyu85V379n0OBgApzh8AAGj3P/AAMcYmgAAFoxjQ
Date:   Mon, 11 Sep 2023 15:24:18 +0000
Message-ID: <TY0PR03MB62761106476B7E23A9DA9F2384F2A@TY0PR03MB6276.apcprd03.prod.outlook.com>
References: <TY0PR03MB627615C146DF1CCED0BCAA2C84EEA@TY0PR03MB6276.apcprd03.prod.outlook.com>
 <20230908102618.GA1134975@nchen-desktop>
 <TY0PR03MB62768499A37E53AEB9E1306284F3A@TY0PR03MB6276.apcprd03.prod.outlook.com>
 <20230911121659.GA1146957@nchen-desktop>
In-Reply-To: <20230911121659.GA1146957@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6276:EE_|SEYPR03MB6962:EE_
x-ms-office365-filtering-correlation-id: a03a9f23-23d6-4155-f6ab-08dbb2db2acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZlrnU+O6XbvRRxIo2USpRQ14wXWZ38lJFiev0vVxNpk86ZZfIP1KoFxi+Db6jZFE3Ig10lDu78KWN6Cmb/7X41cgZb8i41AhWtCjSecylFB7HUbTGcAw1zrCan6glO5pYuCnp1pRDZ4mxX86sLoHyQW1L/UxWPcbvUf59blPDkc2/60n7AR0J6vDWuIt4A+iFNJuC9k2ewmBoB+tB8JcSYpprXOj/bDiZ195p4pjsDNKt/BzX+Dj1eeBPSdqx38i7YzUapnUdSZJ7Pq4Uv64Qq9xSWFbL/P9ZYMJVLOr30kyzabHDBiWVwZcaGHi5igL8G6+vjDwy9dhTgrpJrDy2IK2dFeKtUknnsWYn/ByQ0nCiaOxukBQgqBZPk7Il4iZVf0X12msKWrhOII2XJruO7reoeSztFP2nLFUlO5j8wtHDKp9q4+ZBqoeJyDjaU3qQaLDc464gz9veNuARlAVg+n7H/nbx0Wqq1Hzb9kbUjCnxoAFG9Uk3XUf6vQBYZCKvs5vnyEu6bP3w8K8NRDlc/yPlH3qx2MDdbYm8V5PD3qs2yc1xi3CKtpM/cELa1dAT4lmodh6M3F+0GpUdSWBu8FHD4L96WKS48VWr2FZN/potkHQvI07xx6OShUc9UXC01ipuJicQHeNe+hlqAGWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6276.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(41300700001)(122000001)(71200400001)(53546011)(7696005)(6506007)(86362001)(33656002)(38100700002)(38070700005)(55016003)(30864003)(2906002)(9686003)(45080400002)(966005)(83380400001)(478600001)(52536014)(8936002)(8676002)(5660300002)(4326008)(76116006)(316002)(26005)(6916009)(66556008)(64756008)(66476007)(66946007)(66446008)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DVN804IVkrRc93fFm7JjWSzXTiIH8nwjwIunGC3f60U0eMJuARu0G9FIl5gG?=
 =?us-ascii?Q?Ds8ipsYj+tS3kecl4GLhSfbIkYxYgRkmibjy0W5Ns9CZojVdc17LLL8bDrB1?=
 =?us-ascii?Q?M7pNHgHpJYhikNZyhoc4pq7WhkgcHZDDzn4dKQRL40f8wlEo+sxwX7eGiZX3?=
 =?us-ascii?Q?d92j/eBPAHclgPlFTMVRH1Vj0D0pdluk7rijHqc7Fc9Ref45NgIL1/F3rPpz?=
 =?us-ascii?Q?co+6+Lna7i2nEzou5KyTBgTKDZFSRZjMAJgkOq2tx0fsMXfZHMiuXqQFVUVG?=
 =?us-ascii?Q?JIZjNkgY/blC10gSW0lQkz0k44aow235bmik09zjh6UlEl7vfGyVhCh8qVUi?=
 =?us-ascii?Q?7p8IxMA+FJ1pSkUfipisvJ9zYSp/DcYc8iM74OQUqO/1IGE2Wju33o0t2ljE?=
 =?us-ascii?Q?/ZTScZya6EbWLK6eyNCP8CfV/BEj4dqbgxEc/r6EgMZJwJ/8uULRNqWTbskY?=
 =?us-ascii?Q?0bkHogQB0Cel9NQK82lZ3zx28/h0rtCFVcvIapGCOLh20R1xOobvkT8WAtOQ?=
 =?us-ascii?Q?2nW8aWbNi9In9VWd0cH6vBFQEhbv53da+U559mzkIuDWpZuFH12+/E85mE6n?=
 =?us-ascii?Q?64hHdRjxx8E+50l1OmkDOn07yyStX/WRapRIHHTo2nYToWKqB34v0YKrMC0M?=
 =?us-ascii?Q?fDA03ApxXBFr1wY5/3f70+ycif0pV/BMeCgQGpSMNITTguDizAs2DU3Cfccz?=
 =?us-ascii?Q?V93ER7zd67sKT+yyK3nqwtosXpqSG3JylmZz/lE1Sp6bKEapWZpVjWKkZMRc?=
 =?us-ascii?Q?OFjBf4QsKji7FqRHeimAksFD+Vv+163SmAsIDsjEg+gF8cTswUcama1ogRoO?=
 =?us-ascii?Q?YbW/ss4rGBY7DJeb5vOz28uqC4um+fL4CC5wE9eCV57V61CDZMX36j1gYU6K?=
 =?us-ascii?Q?d63n1vGNbMweZfLEnFWh5FDrFTEo9zhUShDhufgmFITO/+yW0zUf95BaGk5X?=
 =?us-ascii?Q?rsXjnzUNWzVO7cXZc+DlE/JnQ/VxZrOS2u3i4RIuV1clMoljUFmXHtQUmcx7?=
 =?us-ascii?Q?3n2IDPViJa6KAlqPeRCgt8c+y+6EKPg9kWcnoKMB376rk0qhXeEiPdWpAoBE?=
 =?us-ascii?Q?h6ZS9PQSgCTZ2LdHJsscZnCd3wcSEaGpYnUd2JBp9tXaOYiV3hQxob9X4WQQ?=
 =?us-ascii?Q?6BCUoxxpXzZbuTrbUGdNb9UU3qDhIYkO5MlPAGD4q6aM2RzeZmcmPxm0d6Pj?=
 =?us-ascii?Q?Mv16P65+oFAoZ4h8ROheuX2tL4zn2Xfp5PzBhSJ1FOLDWP6iqPDTkXVCWpY8?=
 =?us-ascii?Q?+WwCEUMgJ8RS95GH6j/AcEOtnnklWd5XMvHDm2KCJOgl/6fCFCj8sb+a1jPQ?=
 =?us-ascii?Q?yb6Qgq+ylgwyrCcSjJfgQYahXYb0/3B0LtfmA3hUCYAiQ+XKfIhBxp3E5CQu?=
 =?us-ascii?Q?vBW6BV2Xd7REV9eCtOjfDTNPrwNGvS22igsxGGHm4Bdle4NrzUxWI+ly+TyU?=
 =?us-ascii?Q?RfQPWQnTaCVJ5O6mgbLcxFKukDiW6OmKeqTrGXWT3HR+WwB7fGI57dnjwjd1?=
 =?us-ascii?Q?IUz72I7I0pAgDIimmOwyKI6RRUKQZKkkaJ/ODgTxmMy71gGJYbdlcGigQoLR?=
 =?us-ascii?Q?mFuDaqaTffrNN3Tw4kiy9ek6K0a/zaWz1EVAc0K0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6276.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03a9f23-23d6-4155-f6ab-08dbb2db2acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 15:24:18.8349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwt9p7Bd1dIa05ZfSUj9Ddvb87Zk2ty/4YMqrQc0MDcBMaryR1F2G/4JDh6n5ddc7pACPjZZE245febpUxej1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6962
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

Great, done and it works fine.

I will send a patch in Kernel 6.6.

Thanks a lot for your help,

Tomer

-----Original Message-----
From: Peter Chen <peter.chen@kernel.org>
Sent: Monday, 11 September 2023 15:17
To: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Advise for adding Nuvoton BMC Synopsys USB 2.0 device controll=
ers to Linux kernel USB Chipidea driver

CAUTION - External Email: Do not click links or open attachments unless you=
 acknowledge the sender and content.


On 23-09-10 12:47:06, tomer.maimon@nuvoton.com wrote:
> Hi Peter,
>
>
>
> Thanks for your prompt response.
>
>
>
> Unfortunately soft connect didn't solve the problem, because the
> vbus_active is not active
>
> And this is why the ci_hdrc_gadget_connect<https://elixir.bootlin.com/lin=
ux/v6.5.2/C/ident/ci_hdrc_gadget_connect>(gadget<https://elixir.bootlin.com=
/linux/v6.5.2/C/ident/gadget>, 1) is not called.
>
> https://elix/
> ir.bootlin.com%2Flinux%2Fv6.5.2%2Fsource%2Fdrivers%2Fusb%2Fchipidea%2F
> udc.c%23L1950&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d3682253
> 4ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6383
> 00314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DPkffCTYcl1KX
> %2F72Sn3zSCkyN2wmRrfh2%2FQeu43mYpPw%3D&reserved=3D0
>

Please use plain text for upstream email.

So, for your soc, the usb role is device-only, and there is no otgsc regist=
er. You may try to introduce a flag like CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS, =
and using it at ci_handle_vbus_change for (!ci->is_otg condition), when bot=
h conditions are satisfied, call usb_gadget_vbus_connect(&ci->gadget);

Thanks,
Peter

>
>
> In the log below we added debug print of the vbus_active status:
>
> # insmod usb_f_mass_storage.ko
>
> # insmod g_mass_storage.ko file=3D/tmp/backing_file removable=3D1
>
> Mass Storage Function, version: 2009/09/11
>
> LUN: removable file: (no medium)
>
> LUN: removable file: /tmp/backing_file
>
> Number of LUNs=3D1
>
> g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
>
> g_mass_storage gadget: userspace failed to provide iSerialNumber
>
> g_mass_storage gadget: g_mass_storage ready
>
>         usb_gadget_udc_start
>
> ci_udc_start
>
> ci_udc_start ci->vbus_active 0
>
> # cd /sys/class/udc/ci_hdrc.0/
>
> # echo connect > soft_connect
>
> udc ci_hdrc.0: UDC had already started
>
> # echo disconnect > soft_connect
>
> ci_udc_stop ci->vbus_active 0
>
> # echo connect > soft_connect
>
>         usb_gadget_udc_start
>
> ci_udc_start
>
> ci_udc_start ci->vbus_active 0
>
>
>
> How can I active the vbus_active parameter?
>
>
>
> Thanks,
>
>
>
> Tomer
>
>
>
> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Friday, 8 September 2023 13:26
> To: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: Advise for adding Nuvoton BMC Synopsys USB 2.0 device
> controllers to Linux kernel USB Chipidea driver
>
>
>
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>
>
>
>
>
> On 23-09-07 14:33:29, tomer.maimon@nuvoton.com<mailto:tomer.maimon@nuvoto=
n.com> wrote:
>
> > Hi Peter
>
> >
>
> > My name is Tomer I am working in Nuvoton system in the Linux kernel, ou=
r project developing BMC SoC for servers.
>
> > In Nuvoton BMC (NPCM) there are ten identical Synopsys USB 2.0 device c=
ontrollers called NPCM UDC.
>
> >
>
> > Lately we started to work with USB Chipidea driver to add NPCM UDC as w=
ell.
>
> > The NPCM BMC using only the UDC and not the USB host.
>
> >
>
> > Using the default compatible<https://elixir.bootlin.com/linux/v5.15.130=
/C/ident/compatible<https://elixir.bootlin.com/linux/v5.15.130/C/ident/comp=
atible>> =3D "chipidea,usb2<https://elixir.bootlin.com/linux/v5.15.130/B/id=
ent/chipidea%2Cusb2<https://elixir.bootlin.com/linux/v5.15.130/B/ident/chip=
idea%2Cusb2>>" didn't work for us since:
>
> >
>
> > 1.       The USB_MODE should be set at boot or after reset since the re=
set The USB_MODE is incorrect (0x15002)
>
> >
>
> > [cid:image002.jpg@01D9E1B1.691030B0]
>
> >
>
> >
>
> > It solved by setting USB_MODE during NPCM reset
>
> > ci_hdrc_npcm_notify_event, now using unique npcm-udc compatible :)
>
> >
>
> >
>
> >
>
> > 2.      vbus_active parameter don't change, stay 0.
>
> >
>
> > The Device Control Capability Parameters Register (DCCPARAMS) is a
>
> > read only register that indicate the module is only DC (Device
>
> > Capable)
>
> >
>
> > This is why the driver didn't indicate the driver is OTG
>
> >
>
> > https://el/
> > ix%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d36822534ac64b
> > 0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63830031
> > 4351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D4%2BTkt%2FJC
> > n2kBrxH5iXzTy1rUq5Jop8v8aktT21VnAWs%3D&reserved=3D0<https://elix/>
>
> > ir.bootlin.com%2Flinux%2Fv6.5.2%2Fsource%2Fdrivers%2Fusb%2Fchipidea%
> > 2F
>
> > core.c%23L948&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cb
> > a4
>
> > 4903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63
> > 82
>
> > 97655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> > 2l
>
> > uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2B5yqPLl4
> > FS
>
> > YUF2Wr0fnNEGgHETE7FTmmSxVm8HCAaQ4%3D&reserved=3D0
>
> >
>
> >
>
> > ci<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%25=
2
> > Fe%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d36822534ac64b
> > 0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63830031
> > 4351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dh%2BP7BtQic7
> > 7OW86RQuY77z%2F1CnDem3MQkST%2FmZuTGLk%3D&reserved=3D0
>
> > lixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fci&data=3D05%7C01%7Ct
> > om
>
> > er.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb0561155%7Ca3f2493
> > 1d
>
> > 4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUnknown%7CTWF
> > pb
>
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M
> > n0
>
> > %3D%7C3000%7C%7C%7C&sdata=3D0l4NnlxNNGGLe%2BEG%2FXU%2B2bdMB5R%2FY%2BD3
> > Xv
>
> > ndUiAWUyE%3D&reserved=3D0>->is_otg<https://apc01.safelinks.protection/.
> > outlook.com/?url=3Dhttps%3A%2F%2Fapc01.safelinks.protection.ou%2F&data
> > =3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d36822534ac64b0308dbb2c1
> > 05c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638300314351616432
> > %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DbgAy5PJGGPzbSeJQ3pMD8k
> > 90fvLG6Zy%2FTNl3UflUpHo%3D&reserved=3D0
>
> > tlook.com/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC
> > %2
>
> > Fident%2Fis_otg&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393
> > cb
>
> > a44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C
> > 63
>
> > 8297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
> > iV
>
> > 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DrQIdSi2U
> > u%
>
> > 2Bss84SiVOlWQkdrPXPVgJvDqPheYtPcolM%3D&reserved=3D0> =3D
>
> > (hw_read<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%25=
3
> > A%
>
> > 2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fhw_read&data=3D
> > 05
>
> > %7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb056115
> > 5%
>
> > 7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUn
> > kn
>
> > own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> > wi
>
> > LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DHO%2F6v4XA2bQgU9jCrya2Y%2Fv8P5%
> > 2B
>
> > 3m%2Bn8ekJhtZLrq5A%3D&reserved=3D0>(ci<https://apc01.safelinks.protect/
> > ion.outlook.com/?url=3Dhttps%3A%2F%2Fapc01.safelinks.protectio%2F&data
> > =3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d36822534ac64b0308dbb2c1
> > 05c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638300314351616432
> > %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DCLgeG15MtjgRfkTE1SNSkY
> > 0vpkggEDvFN9Ak80gA6uw%3D&reserved=3D0
>
> > n.outlook.com/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2
> > %2
>
> > FC%2Fident%2Fci&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393
> > cb
>
> > a44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C
> > 63
>
> > 8297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
> > iV
>
> > 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D0l4NnlxN
> > NG
>
> > GLe%2BEG%2FXU%2B2bdMB5R%2FY%2BD3XvndUiAWUyE%3D&reserved=3D0>,
>
> > CAP_DCCPARAMS<http://ht/
> > tp%3A%2F%2Fhttp%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d
> > 36822534ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7
> > C0%7C638300314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > =3DJluPFVn6TZqPtn06KIOAWRx5HG7Nyhw81jwX%2BXzEeF4%3D&reserved=3D0
>
> > s%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FCAP_DCCP
> > AR
>
> > AMS&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa
> > 08
>
> > dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985
> > 40
>
> > 8934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ
> > BT
>
> > iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXmsVmw0t55YR0wcrcTng
> > kN
>
> > 6vyBCj5sR5GYT2I8lIq2A%3D&reserved=3D0>,
>
> >
>
> >
>
> > DCCPARAMS_DC<http://htt/
> > p%3A%2F%2Fhttps%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d
> > 36822534ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7
> > C0%7C638300314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > =3DsZFWiMb7iy1R4sT3q8t%2FmVfPkc0%2F5sRUs8sLjw6eliU%3D&reserved=3D0
>
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS
> > _D
>
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08
> > db
>
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63829765598540
> > 89
>
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > iI
>
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Do9trybo5aT%2BF%2Bai6eH
> > eH
>
> > %2BeQTaY5l5Jzy53u8TlLg%2Fps%3D&reserved=3D0> |
>
> > DCCPARAMS_HC<http://htt/
> > p%3A%2F%2Fhttps%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d
> > 36822534ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7
> > C0%7C638300314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > =3DsZFWiMb7iy1R4sT3q8t%2FmVfPkc0%2F5sRUs8sLjw6eliU%3D&reserved=3D0
>
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS
> > _H
>
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08
> > db
>
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63829765598540
> > 89
>
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > iI
>
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5Zb%2BmrV2lcQwXlz93pJt
> > zF
>
> > eRNBxqiHEgD4ywW1ed4D4%3D&reserved=3D0>)
>
> >
>
> >                                   =3D=3D
>
> > (DCCPARAMS_DC<http://ht/
> > tp%3A%2F%2Fhttp%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d
> > 36822534ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7
> > C0%7C638300314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > =3DJluPFVn6TZqPtn06KIOAWRx5HG7Nyhw81jwX%2BXzEeF4%3D&reserved=3D0
>
> > s%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAM
> > S_
>
> > DC&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa0
> > 8d
>
> > bb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6382976559854
> > 08
>
> > 934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> > Ti
>
> > I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Do9trybo5aT%2BF%2Bai6e
> > He
>
> > H%2BeQTaY5l5Jzy53u8TlLg%2Fps%3D&reserved=3D0> |
>
> > DCCPARAMS_HC<http://htt/
> > p%3A%2F%2Fhttps%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d
> > 36822534ac64b0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7
> > C0%7C638300314351616432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > =3DsZFWiMb7iy1R4sT3q8t%2FmVfPkc0%2F5sRUs8sLjw6eliU%3D&reserved=3D0
>
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS
> > _H
>
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08
> > db
>
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63829765598540
> > 89
>
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > iI
>
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5Zb%2BmrV2lcQwXlz93pJt
> > zF
>
> > eRNBxqiHEgD4ywW1ed4D4%3D&reserved=3D0>));
>
> >
>
> > Why otg is set only when DC and HC is set?
>
> >
>
> > By enabling ci<https://elixir.bootlin.com/linux/v6.5.2/C/ident/ci<https=
://elixir.bootlin.com/linux/v6.5.2/C/ident/ci>>->is_otg<https://elixir.boot=
lin.com/linux/v6.5.2/C/ident/is_otg<https://elixir.bootlin.com/linux/v6.5.2=
/C/ident/is_otg>> =3D true we see we need to set the extcon in the device t=
ree, why we need extcon to handle the vbus? Can the vbus be permanent?
>
> >
>
> >
>
> >
>
> > Even after setting extcon vbus to dummy GPIO we succeed to modify the v=
bus_active parameter to is_active but it didn't worked in the end because i=
t a dummy GPIO that not related to the USB vbus.
>
> >
>
> >
>
> >
>
> > BTW,
>
> >
>
> > If we adding ci->vbus_active =3D true at probe stage the UDC Chipidea d=
river works fine.
>
> >
>
> > https://el/
> > ix%2F&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C63c0d36822534ac64b
> > 0308dbb2c105c9%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63830031
> > 4351772660%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZ4PZt7iDIPfz
> > Q8Es2S%2BEhDeyKmYSPQRktYlbyOwOrE8%3D&reserved=3D0<https://elix/>
>
> > ir.bootlin.com%2Flinux%2Fv6.5.2%2Fsource%2Fdrivers%2Fusb%2Fchipidea%
> > 2F
>
> > core.c%23L1123&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393c
> > ba
>
> > 44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6
> > 38
>
> > 297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> > V2
>
> > luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DO2JoKArqq
> > Y6
>
> > IaAvYAEFXrVhuPdsArba3MczPKSJsaIc%3D&reserved=3D0
>
> >
>
> >
>
> >
>
> > Appreciate if you could you advise how should we overcome this issue
>
>
>
> After loading the gadget driver, try to force "connect" udc using /sys
> entry. See the below code at file: drivers/usb/gadget/udc/core.c
>
>
>
> static ssize_t soft_connect_store(struct device *dev,
>
>                 struct device_attribute *attr, const char *buf, size_t
> n)
>
>
>
>
>
> Your issue is probably due to the UDC don't know it is connected, so DP i=
s not pulled up.
>
>
>
> --
>
>
>
> Thanks,
>
> Peter Chen
>
> ________________________________
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.

--

Thanks,
Peter Chen
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
