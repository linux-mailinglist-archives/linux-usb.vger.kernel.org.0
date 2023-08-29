Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6648978CDE2
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 22:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240512AbjH2U55 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 16:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240387AbjH2U5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 16:57:30 -0400
X-Greylist: delayed 189 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Aug 2023 13:57:24 PDT
Received: from edc2-mailout5.edc.trendmicro.com (edc2vmout05.edc.trendmicro.com [216.104.20.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2841BC
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 13:57:24 -0700 (PDT)
Received: from edc2-mailout5.edc.trendmicro.com (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id BD235106CE52
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 20:54:13 +0000 (UTC)
Received: from edc2-mailout5.edc.trendmicro.com (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id A4C0F106CDF2
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 20:54:13 +0000 (UTC)
X-TM-AS-ERS: 10.34.72.181-127.5.254.253
X-TM-AS-SMTP: 1.0 RURDMi1FWENIMDEuZXUudHJlbmRuZXQub3Jn emRpLWRpc2Nsb3N1cmVzQ
        HRyZW5kbWljcm8uY29t
X-DDEI-TLS-USAGE: Used
Received: from EDC2-EXCH01.eu.trendnet.org (unknown [10.34.72.181])
        by edc2-mailout5.edc.trendmicro.com (Postfix) with ESMTPS
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 20:54:13 +0000 (UTC)
Received: from EDC2-EXCH02.eu.trendnet.org (10.34.72.183) by
 EDC2-EXCH01.eu.trendnet.org (10.34.72.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 29 Aug 2023 20:54:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by exhybridemea.trendmicro.com (10.34.72.184) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 13:54:11 -0700
Received: from DM5PR0102MB3477.prod.exchangelabs.com (2603:10b6:4:a1::19) by
 BL3PR01MB6993.prod.exchangelabs.com (2603:10b6:208:358::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Tue, 29 Aug 2023 20:54:07 +0000
Received: from DM5PR0102MB3477.prod.exchangelabs.com
 ([fe80::c3f1:3504:bc11:c035]) by DM5PR0102MB3477.prod.exchangelabs.com
 ([fe80::c3f1:3504:bc11:c035%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 20:54:06 +0000
From:   "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: ZDI-CAN-22042: New Vulnerability Report 
Thread-Topic: ZDI-CAN-22042: New Vulnerability Report 
Thread-Index: Adnasr0D6zIuA9dBSU21cPkurJk+IwACCjDg
Date:   Tue, 29 Aug 2023 20:54:06 +0000
Message-ID: <DM5PR0102MB347745E2B47C9AD24F379CF880E7A@DM5PR0102MB3477.prod.exchangelabs.com>
References: <DM5PR0102MB3477A5BBF521F22F6ED1694E80E7A@DM5PR0102MB3477.prod.exchangelabs.com>
In-Reply-To: <DM5PR0102MB3477A5BBF521F22F6ED1694E80E7A@DM5PR0102MB3477.prod.exchangelabs.com>
Accept-Language: en-US, es-ES
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_ActionId=4d5d6922-3c1c-46ed-b260-2064bb5d8d5a;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_ContentBits=0;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Enabled=true;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Method=Privileged;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Name=Public
 Information - no
 protection;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_SetDate=2023-08-29T19:55:31Z;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_SiteId=3e04753a-ae5b-42d4-a86d-d6f05460f9e4;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR0102MB3477:EE_|BL3PR01MB6993:EE_
x-ms-office365-filtering-correlation-id: f7e4ad82-64e8-42e4-4e0d-08dba8d215f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wBqp04QNR85qN1EVlVfrRBSfnKuthQDIO247cZynsmrOS2BnykO3+XtfwCARnhlvX0jie4mm3ia5UAM3ilY450+sFp3jL8XZ/wH3llL2I7x7qblURXJCND9lAKFpIQdVxH35mTkphiNDZPoaus/pPRtv2GRGezV4p4YFlGiH5wE1cJJVLTZSYbOsEfrEGoIJOIUutBxRK7vzSOaIQ1fi1vpgbb4LyM1MppHqS9s0EiTDc/gJgHbgymsGItxRyGgg4GqvAuuGk11T8B5Clt3drVmtxbv4tFotf8mEE7Sc1RGagi/ahJ3SGO/Guw+SbACob8dnxKA6IaOI5l1YmkDSC+dnSUCmyPryqSc9vGbtAaRdh1O0yNO1jmfX89IU7XR5XYsBk/rkrT8eE1V06yE12cOqiCTcFodWgzB1qu8KTNECk5wBBBRB7ZF4rZYoh0g9iXPgj70lzWqiPFNfOhJfTMzlrtoEKprqwZ9ID+Pk8mDjmRqPMEbzyZxF+znEe3W31fwWu6lblkiI8ifrf9vT3zIcvG54ndCq90Xsm6b3z+5dBmA39qNswA5SvjUE/98+1SDErrOD/2O03IgACAsBXr6Wf8eUln8CDzueIXdhpiQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0102MB3477.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(9686003)(2940100002)(38070700005)(38100700002)(316002)(82960400001)(41300700001)(33656002)(4743002)(2906002)(6916009)(83380400001)(86362001)(52536014)(30864003)(8676002)(5660300002)(26005)(55016003)(8936002)(99936003)(71200400001)(7696005)(6506007)(966005)(66446008)(66556008)(66476007)(64756008)(76116006)(122000001)(66946007)(478600001)(574254001)(579004)(505234007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yrXS+ICgdQ8RUzm0m6LMEAdqRQTEyLWEpWsxMT0o9Va8uH2Wj9qOZSgukJAQ?=
 =?us-ascii?Q?zWUqbrO+G2azSSxQoNmZlx9mLX99XL6CW6wL0DT6Aq82fceP9/tUt2rTcgKu?=
 =?us-ascii?Q?6+Lg62H/0lDZlWHoGL0mT3UPtdX4WSutWW/gdWUiq6Xtspk4c0DzLEVkTRsH?=
 =?us-ascii?Q?Phlil/S8AJf7c7QZkzViqhlJzWYOhXM9TD1BVfQjcutPzhk7nWHSpKQeUknw?=
 =?us-ascii?Q?nC+dhO2E1FJSTpvll4HgOmZ4dER1txp8jfrB03RSEh2UP7pRyIt9NbAMJzbR?=
 =?us-ascii?Q?t6UfBtLezsMvZERRRAiULZbotpExndP5Cc89Mcz3Riv/9Bc2HCSUbKf4TziA?=
 =?us-ascii?Q?JtZQz1zjfBM3ZexQMzeQiQukt9q/8MzuAHx4Ghvkde455Hh74nKsMgE7Or1g?=
 =?us-ascii?Q?xEkmiMC2YgAxzGkHSEOYTeMcQFhAa4mBsRkjh3EzdkAQnAtWrUGpbD3RVCfd?=
 =?us-ascii?Q?u0FIJTgZa7kv91RcNa7E82mBLn4j2I5AMZlSokaX4M2yyJVikQMe24aHBONs?=
 =?us-ascii?Q?ek1rE+hT8wW1vf+79jQSSET58xxbLyNlUVsrDd5euh/67ZcI0oabUCqW8YQ4?=
 =?us-ascii?Q?mbOp60hXZ8SamLEVZgG91DDRiuhflREzxAJFJchhK8ANl5u6g8Bo5bXTwb3R?=
 =?us-ascii?Q?IaraVqv3LLwhDVmXHYWChfx6RU/5ljPJSgSipohJc7IyLRBPFOyBwRE9MWxt?=
 =?us-ascii?Q?WOM83QsrtS1TM1J/jzEeVLB34MsDbLLC+823Fc3byeLLLAnRtxzlBiKWBXu7?=
 =?us-ascii?Q?x3Ha8Rt5PLVMytjoaJhSOwv/rkcFOAxb4u6UIQaC3occHdtSxjXGf5YW1AFH?=
 =?us-ascii?Q?7/ndLnf3U+CClkG+E2mHj/TQkhG9nw8feeV5P2JADJSZ4kxDxllKvp48KKP1?=
 =?us-ascii?Q?Z4Hc9N5HL98j2C7k5HWLbPeEhX5Ik1tjGTLKbo5MRIyAOY51hlbTpxRCnDQ9?=
 =?us-ascii?Q?usxZIBnMLwX61d8T08Y9cL+doMkwysWBFpe+XZ+1gHMf/IyRqpccKhk+PjK4?=
 =?us-ascii?Q?PJjTuySyeQn+UkfkN0CABLR6qi13j0KDiWZ+TAv0ei+YczBPGANq0Dm8N2cW?=
 =?us-ascii?Q?R7P52t277ZFN5zpazpXfnyzI2eCFvUEY/xRhmgQhQDKIJb/sxxjQXDhsbgi2?=
 =?us-ascii?Q?SQkYTwYnpfcnl7bKc6CTB/nfwLpta/kOSi8+tAjAUXSv4T9Dwo9rpS34MI+v?=
 =?us-ascii?Q?p1258mmznsDjmK/RGWvHtEsU3/pFIgmB2esbU/jBNLfQvHIVpmnuGdxGW1EG?=
 =?us-ascii?Q?Nn0Ys/0YdLC6R2bnO7StZ7IxOY8Fw9d55yVKBc2Zx3Jxng2LdfDMXSFmqx/h?=
 =?us-ascii?Q?9Tva0HO6GB3jb4Oehf4BoRqpr6laKcsOkyqZWqVF26/s4aDEpxm/aGVqGnXd?=
 =?us-ascii?Q?ddmBWE4+bQDvnxz+r2b1HPDS2lLlHRxlIaFJF2RdgKS4PQEZMpB1gTmTKNPX?=
 =?us-ascii?Q?CMFct8aOlVgihsCuwMg81bn/1WQjmDP0fURyBRytdV4IhpQxuKAAxU6Eg67S?=
 =?us-ascii?Q?FbEOM2CSjQBTfGZTQXjvbzRQiSZRCBEmeG0143liP3evV50kOhtIkxPCo8yU?=
 =?us-ascii?Q?mX0K+kK7G+hcBE06XVFk9ompg0fIAK8zHvzQFp8EmOE7fjkp3h8Y+XtBqmQz?=
 =?us-ascii?Q?4V/nZn7uLYeD2t0fPEMD6/ZIYKyfR4Q4WU+KKy4wNEAk?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3WFriXE2qKoMVjmlCC/8fX5Lch+kt91bbfGbicRlrDejDgr79NmS8XRHJn3sCY2RXGHCD7bHEsD/8W2OB6+uRmdZIbPh6aYgV4luEREexF5d2kXhUO8iKZxqSVFivL8q9oo7ORvFHi7MNVTXjh8OIKOAPkpKUp5pPY4idiHv2/HDDkfRMEGFt02wYcq/krRt5FjOaYFIiuFLfiPQ42UNq8KXiBfoscqIFLaWF3JdPlZyTFlVMUhn72IQrUv8/BSDn4aAlgic02A6Idsk20Z5l81d/fB305jAwmnbsU7cp1I5SQvUYlBUds9i+NrsMv1bu7BBykmTy+BRetMlUSX4Q==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBFyy7au0xRU5nOCZLFGgHCJ136yMSFGQs9NpqkCrIg=;
 b=E4sY/s5VIMcdHsjc0p+UsnpPwHih6RlQ+n+k1NLYzsp6P3xWW9blqOHCNZ9S7nxyMHMZlwcUaQnMUiqKuVK0JimNzQ++naTLls4zD83tdZ2ADrT+FlKpAJ9TaM5DtEOoJfLbd3g7WPb1Q80/g9ZlxnTwOIkSoas7G3gChUejteaR8CZmE+BuLL8LLCkkxVDgXafMMy5RrnDLPxKf+5CZ+3CbkZ/n2WJDOfNZDEnxS3x+mtwvzHK6EUzLylien4PJMWurhgL30N4WiY+PZYXFOMVNGifZKMPG3O+90QXaS/NgnkNYIUjkJM4hK2S6XfJrD7SGk9VzlpNze70rSPc6Cw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trendmicro.com; dmarc=pass action=none
 header.from=trendmicro.com; dkim=pass header.d=trendmicro.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: DM5PR0102MB3477.prod.exchangelabs.com
x-ms-exchange-crosstenant-network-message-id: f7e4ad82-64e8-42e4-4e0d-08dba8d215f2
x-ms-exchange-crosstenant-originalarrivaltime: 29 Aug 2023 20:54:06.7378 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 3e04753a-ae5b-42d4-a86d-d6f05460f9e4
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: zFddPzsx54muCPcWxaOEDCkAXmwPYOfzj3KX7jvzJLeVb7mqwmpA8Qk4Wc/fWFcix9BDkYnpuoRAyPACzutOFDPkQo9nmndEOwd0ZSLbph1/SiRNdU2kbc0YfaE9P+sJ
x-ms-exchange-transport-crosstenantheadersstamped: BL3PR01MB6993
x-originatororg: trendmicro.com
Content-Type: multipart/mixed;
        boundary="_002_DM5PR0102MB347745E2B47C9AD24F379CF880E7ADM5PR0102MB3477_"
MIME-Version: 1.0
X-TM-AS-ERS: 10.34.72.181-127.5.254.253
X-TM-AS-SMTP: 1.0 RURDMi1FWENIMDEuZXUudHJlbmRuZXQub3Jn emRpLWRpc2Nsb3N1cmVzQ
        HRyZW5kbWljcm8uY29t
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=trendmicro.com;
        s=tmoutbound; t=1693342453;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; l=0;
        h=From:To:Date;
        b=e+QQoA9m68gqtKDAgnqwO2fxS3HPDqAEETmC6BO4141alE8reLzwUTtF7v4Wnhgjr
         wjAOK7fpwaZpvX5Vlg8/1VFAGfczG3GQiZtvg1TftWr7fU1D4ylpogKkFcEGr2exdg
         HgLifuq+Xn0ozdRKEFMoB5onYf0joPFp25re90qY=
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_002_DM5PR0102MB347745E2B47C9AD24F379CF880E7ADM5PR0102MB3477_
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The attachment could not be scanned for viruses because it is a password =
protected file.
ZDI-CAN-22042: Linux Kernel USB Core Out-Of-Bounds Read Local Privilege E=
scalation Vulnerability

-- CVSS -----------------------------------------

7.1: AV:P/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H

-- ABSTRACT -------------------------------------

Trend Micro's Zero Day Initiative has identified a vulnerability affectin=
g the following products:
Linux - Kernel

-- VULNERABILITY DETAILS ------------------------
* Version tested:6.5-rc7
* Installer file:-
* Platform tested:debian bullseye

---

### Analysis

```
usb_destroy_configuration() didn't consider/validate the updated USB desc=
riptor it leads to out-of-bounds access in usb_destroy_configuration() it=
 would call kfree() on a pointer that is read from out-of-bounds it would=
 be triggered physically the build config is from syzbot's ci-qemu-upstre=
am ```

~~~C++
int usb_get_configuration(struct usb_device *dev) {
        struct device *ddev =3D &dev->dev;
        int ncfg =3D dev->descriptor.bNumConfigurations;
        unsigned int cfgno, length;
        unsigned char *bigbuffer;
        struct usb_config_descriptor *desc;
        int result;

        if (ncfg > USB_MAXCONFIG) {
                dev_notice(ddev, "too many configurations: %d, "
                    "using maximum allowed: %d\n", ncfg, USB_MAXCONFIG);
                dev->descriptor.bNumConfigurations =3D ncfg =3D USB_MAXCO=
NFIG;
        }

        if (ncfg < 1) {
                dev_err(ddev, "no configurations\n");
                return -EINVAL;
        }

        length =3D ncfg * sizeof(struct usb_host_config);
        dev->config =3D kzalloc(length, GFP_KERNEL);
        if (!dev->config)
                return -ENOMEM;

        length =3D ncfg * sizeof(char *);
        dev->rawdescriptors =3D kzalloc(length, GFP_KERNEL);             =
 // (1) at the beginning, length is 8, ncfg is 1
...
}

static int sd_config(struct gspca_dev *gspca_dev,
                        const struct usb_device_id *id)
{
        struct sd *sd =3D (struct sd *)gspca_dev;
        struct cam *cam =3D &gspca_dev->cam;
        u8 *cd =3D gspca_dev->usb_buf;
        int i, j, n;
        int widths[MAX_MODES], heights[MAX_MODES];

        /* Read the camera descriptor */
        se401_read_req(gspca_dev, SE401_REQ_GET_CAMERA_DESCRIPTOR, 1);
        if (gspca_dev->usb_err) {
                /* Sometimes after being idle for a while the se401 won't
                   respond and needs a good kicking  */
                usb_reset_device(gspca_dev->dev);                        =
               // (2) if usb_reset_device() is called, the dev->descripto=
r will be updated from USB
                gspca_dev->usb_err =3D 0;
                se401_read_req(gspca_dev, SE401_REQ_GET_CAMERA_DESCRIPTOR=
, 0);
        }
...
}

void usb_destroy_configuration(struct usb_device *dev) {
        int c, i;

        if (!dev->config)
                return;

        if (dev->rawdescriptors) {
                for (i =3D 0; i < dev->descriptor.bNumConfigurations; i++=
)                // (3) it didn't validate the updated dev->descriptor or=
 update the dev->rawdescriptors
                        kfree(dev->rawdescriptors[i]);                   =
                                       // (4) OOB read here and leads to =
arbitrary free

                kfree(dev->rawdescriptors);
                dev->rawdescriptors =3D NULL;
        }

        for (c =3D 0; c < dev->descriptor.bNumConfigurations; c++) {
                struct usb_host_config *cf =3D &dev->config[c];

                kfree(cf->string);
                for (i =3D 0; i < cf->desc.bNumInterfaces; i++) {
                        if (cf->intf_cache[i])
                                kref_put(&cf->intf_cache[i]->ref,
                                          usb_release_interface_cache);
                }
        }
        kfree(dev->config);
        dev->config =3D NULL;
}

~~~

debug log
```
Breakpoint 8, usb_get_configuration (dev=3Ddev@entry=3D0xffff888026a75000=
) at drivers/usb/core/config.c:888
888             if (!dev->rawdescriptors)
(gdb) l
883             if (!dev->config)
884                     return -ENOMEM;
885
886             length =3D ncfg * sizeof(char *);
887             dev->rawdescriptors =3D kzalloc(length, GFP_KERNEL);
888             if (!dev->rawdescriptors)
889                     return -ENOMEM;
890
891             desc =3D kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
892             if (!desc)
(gdb) p/x length
$2 =3D 0x8
(gdb) p/x dev->rawdescriptors
$3 =3D 0xffff888026b2a9c0
(gdb) bt
#0  usb_get_configuration (dev=3Ddev@entry=3D0xffff888026a75000) at drive=
rs/usb/core/config.c:888
#1  0xffffffff8639b82f in usb_enumerate_device (udev=3D0xffff888026a75000=
) at drivers/usb/core/hub.c:2422
#2  usb_new_device (udev=3Dudev@entry=3D0xffff888026a75000) at drivers/us=
b/core/hub.c:2560
#3  0xffffffff863a225f in hub_port_connect (portchange=3D<optimized out>,=
 portstatus=3D<optimized out>, port1=3D1, hub=3D0xffff888013fe9000) at dr=
ivers/usb/core/hub.c:5422
#4  hub_port_connect_change (portchange=3D<optimized out>, portstatus=3D<=
optimized out>, port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/=
hub.c:5566
#5  port_event (port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/=
hub.c:5726
#6  hub_event (work=3D0xffff888013fe9330) at drivers/usb/core/hub.c:5808
#7  0xffffffff81542e02 in process_one_work (worker=3Dworker@entry=3D0xfff=
f88801c94e200, work=3Dwork@entry=3D0xffff888013fe9330) at kernel/workqueu=
e.c:2597
#8  0xffffffff815440d7 in worker_thread (__worker=3D0xffff88801c94e200) a=
t kernel/workqueue.c:2748
#9  0xffffffff8156176a in kthread (_create=3D<optimized out>) at kernel/k=
thread.c:389
#10 0xffffffff813054ac in ret_from_fork (prev=3D<optimized out>, regs=3D0=
xffffc900007cff58, fn=3D0xffffffff81561430 <kthread>, fn_arg=3D0xffff8880=
197fc900) at arch/x86/kernel/process.c:145
#11 0xffffffff81004e11 in ret_from_fork_asm () at arch/x86/entry/entry_64=
.S:296
#12 0x0000000000000000 in ?? ()
(gdb) awatch *0xffff888026a75520
Hardware access (read/write) watchpoint 9: *0xffff888026a75520
(gdb) c
Continuing.

Hardware access (read/write) watchpoint 9: *0xffff888026a75520

Old value =3D 256
New value =3D 10237
memcpy_orig () at arch/x86/lib/memcpy_64.S:127
127             RET
(gdb) bt                                                                 =
                               // updating the USB descriptor
#0  memcpy_orig () at arch/x86/lib/memcpy_64.S:127
#1  0xffffffff863be9ed in usb_get_device_descriptor (dev=3Ddev@entry=3D0x=
ffff888026a75000, size=3Dsize@entry=3D18) at drivers/usb/core/message.c:1=
074
#2  0xffffffff86394315 in hub_port_init (hub=3Dhub@entry=3D0xffff888013fe=
9000, udev=3Dudev@entry=3D0xffff888026a75000, port1=3Dport1@entry=3D1, re=
try_counter=3Dretry_counter@entry=3D2) at drivers/usb/core/hub.c:5049
#3  0xffffffff863967ed in usb_reset_and_verify_device (udev=3Dudev@entry=
=3D0xffff888026a75000) at drivers/usb/core/hub.c:6021
#4  0xffffffff863979c2 in usb_reset_device (udev=3D0xffff888026a75000) at=
 drivers/usb/core/hub.c:6206
#5  0xffffffff86eefa44 in sd_config (gspca_dev=3D0xffff888024d04000, id=
=3D<optimized out>) at drivers/media/usb/gspca/se401.c:221
#6  0xffffffff86e8ff32 in gspca_dev_probe2 (intf=3Dintf@entry=3D0xffff888=
023676000, id=3Did@entry=3D0xffffffff8b475f80 <device_table+96>, sd_desc=
=3Dsd_desc@entry=3D0xffffffff8b476000 <sd_desc>, dev_size=3D<optimized ou=
t>, dev_size@entry=3D5232,
    module=3Dmodule@entry=3D0x0 <fixed_percpu_data>) at drivers/media/usb=
/gspca/gspca.c:1531
#7  0xffffffff86e910ab in gspca_dev_probe (intf=3D0xffff888023676000, id=
=3D0xffffffff8b475f80 <device_table+96>, sd_desc=3D0xffffffff8b476000 <sd=
_desc>, dev_size=3D5232, module=3D0x0 <fixed_percpu_data>) at drivers/med=
ia/usb/gspca/gspca.c:1610
#8  0xffffffff863c9a77 in usb_probe_interface (dev=3D0xffff888023676078) =
at drivers/usb/core/driver.c:396
#9  0xffffffff852b19b4 in call_driver_probe (drv=3D0xffffffff8de93548 <sd=
_driver+168>, dev=3D0xffff888023676078) at drivers/base/dd.c:579
#10 really_probe (dev=3Ddev@entry=3D0xffff888023676078, drv=3Ddrv@entry=
=3D0xffffffff8de93548 <sd_driver+168>) at drivers/base/dd.c:658
#11 0xffffffff852b25ee in __driver_probe_device (drv=3Ddrv@entry=3D0xffff=
ffff8de93548 <sd_driver+168>, dev=3Ddev@entry=3D0xffff888023676078) at dr=
ivers/base/dd.c:798
#12 0xffffffff852b290c in driver_probe_device (drv=3Ddrv@entry=3D0xffffff=
ff8de93548 <sd_driver+168>, dev=3Ddev@entry=3D0xffff888023676078) at driv=
ers/base/dd.c:828
#13 0xffffffff852b2c34 in __device_attach_driver (drv=3D0xffffffff8de9354=
8 <sd_driver+168>, _data=3D<optimized out>) at drivers/base/dd.c:956
#14 0xffffffff852abbb7 in bus_for_each_drv (bus=3D<optimized out>, start=
=3Dstart@entry=3D0x0 <fixed_percpu_data>, data=3Ddata@entry=3D0xffffc9000=
07cf358, fn=3Dfn@entry=3D0xffffffff852b2a60 <__device_attach_driver>) at =
drivers/base/bus.c:457
#15 0xffffffff852b3958 in __device_attach (dev=3Ddev@entry=3D0xffff888023=
676078, allow_async=3Dallow_async@entry=3Dtrue) at drivers/base/dd.c:1028
#16 0xffffffff852b3f2b in device_initial_probe (dev=3Ddev@entry=3D0xffff8=
88023676078) at drivers/base/dd.c:1077
#17 0xffffffff852ae9bc in bus_probe_device (dev=3Ddev@entry=3D0xffff88802=
3676078) at drivers/base/bus.c:532
#18 0xffffffff852a6c51 in device_add (dev=3Ddev@entry=3D0xffff88802367607=
8) at drivers/base/core.c:3625
#19 0xffffffff863c291b in usb_set_configuration (dev=3Ddev@entry=3D0xffff=
888026a75000, configuration=3D<optimized out>, configuration@entry=3D0) a=
t drivers/usb/core/message.c:2211
#20 0xffffffff863ec06a in usb_generic_driver_probe (udev=3D0xffff888026a7=
5000) at drivers/usb/core/generic.c:238
#21 0xffffffff863c874a in usb_probe_device (dev=3D0xffff888026a750a8) at =
drivers/usb/core/driver.c:293
#22 0xffffffff852b19b4 in call_driver_probe (drv=3D0xffffffff8dad0d38 <us=
b_generic_driver+56>, dev=3D0xffff888026a750a8) at drivers/base/dd.c:579
#23 really_probe (dev=3Ddev@entry=3D0xffff888026a750a8, drv=3Ddrv@entry=
=3D0xffffffff8dad0d38 <usb_generic_driver+56>) at drivers/base/dd.c:658
#24 0xffffffff852b25ee in __driver_probe_device (drv=3Ddrv@entry=3D0xffff=
ffff8dad0d38 <usb_generic_driver+56>, dev=3Ddev@entry=3D0xffff888026a750a=
8) at drivers/base/dd.c:798
#25 0xffffffff852b290c in driver_probe_device (drv=3Ddrv@entry=3D0xffffff=
ff8dad0d38 <usb_generic_driver+56>, dev=3Ddev@entry=3D0xffff888026a750a8)=
 at drivers/base/dd.c:828
#26 0xffffffff852b2c34 in __device_attach_driver (drv=3D0xffffffff8dad0d3=
8 <usb_generic_driver+56>, _data=3D<optimized out>) at drivers/base/dd.c:=
956
#27 0xffffffff852abbb7 in bus_for_each_drv (bus=3D<optimized out>, start=
=3Dstart@entry=3D0x0 <fixed_percpu_data>, data=3Ddata@entry=3D0xffffc9000=
07cf7d8, fn=3Dfn@entry=3D0xffffffff852b2a60 <__device_attach_driver>) at =
drivers/base/bus.c:457
#28 0xffffffff852b3958 in __device_attach (dev=3Ddev@entry=3D0xffff888026=
a750a8, allow_async=3Dallow_async@entry=3Dtrue) at drivers/base/dd.c:1028
#29 0xffffffff852b3f2b in device_initial_probe (dev=3Ddev@entry=3D0xffff8=
88026a750a8) at drivers/base/dd.c:1077
#30 0xffffffff852ae9bc in bus_probe_device (dev=3Ddev@entry=3D0xffff88802=
6a750a8) at drivers/base/bus.c:532
#31 0xffffffff852a6c51 in device_add (dev=3Ddev@entry=3D0xffff888026a750a=
8) at drivers/base/core.c:3625
#32 0xffffffff8639b48c in usb_new_device (udev=3Dudev@entry=3D0xffff88802=
6a75000) at drivers/usb/core/hub.c:2590
#33 0xffffffff863a225f in hub_port_connect (portchange=3D<optimized out>,=
 portstatus=3D<optimized out>, port1=3D1, hub=3D0xffff888013fe9000) at dr=
ivers/usb/core/hub.c:5422
#34 hub_port_connect_change (portchange=3D<optimized out>, portstatus=3D<=
optimized out>, port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/=
hub.c:5566
#35 port_event (port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/=
hub.c:5726
#36 hub_event (work=3D0xffff888013fe9330) at drivers/usb/core/hub.c:5808
#37 0xffffffff81542e02 in process_one_work (worker=3Dworker@entry=3D0xfff=
f88801c94e200, work=3Dwork@entry=3D0xffff888013fe9330) at kernel/workqueu=
e.c:2597
#38 0xffffffff815440d7 in worker_thread (__worker=3D0xffff88801c94e200) a=
t kernel/workqueue.c:2748
#39 0xffffffff8156176a in kthread (_create=3D<optimized out>) at kernel/k=
thread.c:389
#40 0xffffffff813054ac in ret_from_fork (prev=3D<optimized out>, regs=3D0=
xffffc900007cff58, fn=3D0xffffffff81561430 <kthread>, fn_arg=3D0xffff8880=
197fc900) at arch/x86/kernel/process.c:145
#41 0xffffffff81004e11 in ret_from_fork_asm () at arch/x86/entry/entry_64=
.S:296
#42 0x0000000000000000 in ?? ()
(gdb) fin
Run till exit from #0  memcpy_orig () at arch/x86/lib/memcpy_64.S:127 usb=
_get_device_descriptor (dev=3Ddev@entry=3D0xffff888026a75000, size=3Dsize=
@entry=3D18) at drivers/usb/core/message.c:1075
1075            kfree(desc);
(gdb) p/x dev->descriptor.bNumConfigurations
$4 =3D 0x27
(gdb) c
Continuing.

Breakpoint 2, usb_destroy_configuration (dev=3Ddev@entry=3D0xffff888026a7=
5000) at drivers/usb/core/config.c:826
826     {
(gdb) p/x dev->descriptor.bNumConfigurations
$5 =3D 0x27
(gdb) bt
#0  usb_destroy_configuration (dev=3Ddev@entry=3D0xffff888026a75000) at d=
rivers/usb/core/config.c:826
#1  0xffffffff863853b2 in usb_release_dev (dev=3D0xffff888026a750a8) at d=
rivers/usb/core/usb.c:492
#2  0xffffffff852977b1 in device_release (kobj=3D0xffff888026a750a8) at d=
rivers/base/core.c:2484
#3  0xffffffff8a1d13d7 in kobject_cleanup (kobj=3D0xffff888026a750a8) at =
lib/kobject.c:682
#4  kobject_release (kref=3D0xffff888026a750e0) at lib/kobject.c:713
#5  kref_put (release=3D<optimized out>, kref=3D0xffff888026a750e0) at ./=
include/linux/kref.h:65
#6  kobject_put (kobj=3Dkobj@entry=3D0xffff888026a750a8) at lib/kobject.c=
:730
#7  0xffffffff852980af in put_device (dev=3D0xffff888026a750a8, dev@entry=
=3D0xffffffff8af08580 <device_ktype>) at drivers/base/core.c:3733
#8  0xffffffff86399026 in usb_disconnect (pdev=3D0x0 <fixed_percpu_data>,=
 pdev@entry=3D0xffff88801430a000) at drivers/usb/core/hub.c:2296
#9  0xffffffff863a139d in hub_port_connect (portchange=3D1, portstatus=3D=
257, port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/hub.c:5261
#10 hub_port_connect_change (portchange=3D1, portstatus=3D257, port1=3D1,=
 hub=3D0xffff888013fe9000) at drivers/usb/core/hub.c:5566
#11 port_event (port1=3D1, hub=3D0xffff888013fe9000) at drivers/usb/core/=
hub.c:5726
#12 hub_event (work=3D0xffff888013fe9330) at drivers/usb/core/hub.c:5808
#13 0xffffffff81542e02 in process_one_work (worker=3Dworker@entry=3D0xfff=
f88801c94e200, work=3D0xffff888013fe9330) at kernel/workqueue.c:2597
#14 0xffffffff815442e6 in process_scheduled_works (worker=3D<optimized ou=
t>) at kernel/workqueue.c:2664
#15 worker_thread (__worker=3D0xffff88801c94e200) at kernel/workqueue.c:2=
750
#16 0xffffffff8156176a in kthread (_create=3D<optimized out>) at kernel/k=
thread.c:389
#17 0xffffffff813054ac in ret_from_fork (prev=3D<optimized out>, regs=3D0=
xffffc900007cff58, fn=3D0xffffffff81561430 <kthread>, fn_arg=3D0xffff8880=
197fc900) at arch/x86/kernel/process.c:145
#18 0xffffffff81004e11 in ret_from_fork_asm () at arch/x86/entry/entry_64=
.S:296
#19 0x0000000000000000 in ?? ()
(gdb) c
```

KASAN report
```
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in usb_destroy_configuration+0x6d3/0x750 l=
inux/drivers/usb/core/config.c:834
Read of size 8 at addr ffff888014709f48 by task kworker/0:0/6

CPU: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.5.0-rc7 #1 Hardware name: Q=
EMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/=
2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack linux/lib/dump_stack.c:88
 dump_stack_lvl+0xd9/0x1b0 linux/lib/dump_stack.c:106  print_address_desc=
ription linux/mm/kasan/report.c:364
 print_report+0xc4/0x620 linux/mm/kasan/report.c:475
 kasan_report+0xda/0x110 linux/mm/kasan/report.c:588
 usb_destroy_configuration+0x6d3/0x750 linux/drivers/usb/core/config.c:83=
4
 usb_release_dev+0x42/0x110 linux/drivers/usb/core/usb.c:492
 device_release+0xa1/0x240 linux/drivers/base/core.c:2484  kobject_cleanu=
p linux/lib/kobject.c:682  kobject_release linux/lib/kobject.c:713  kref_=
put linux/./include/linux/kref.h:65
 kobject_put+0x1f7/0x5b0 linux/lib/kobject.c:730
 put_device+0x1f/0x30 linux/drivers/base/core.c:3733  hub_port_connect li=
nux/drivers/usb/core/hub.c:5261  hub_port_connect_change linux/drivers/us=
b/core/hub.c:5566  port_event linux/drivers/usb/core/hub.c:5726
 hub_event+0x21bd/0x5230 linux/drivers/usb/core/hub.c:5808
 process_one_work+0xaa2/0x16f0 linux/kernel/workqueue.c:2600  process_sch=
eduled_works linux/kernel/workqueue.c:2667
 worker_thread+0x896/0x1110 linux/kernel/workqueue.c:2753
 kthread+0x33a/0x430 linux/kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 linux/arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 linux/arch/x86/entry/entry_64.S:304
 </TASK>

Allocated by task 6:
 kasan_save_stack+0x33/0x50 linux/mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 linux/mm/kasan/common.c:52  ____kasan_kmalloc =
linux/mm/kasan/common.c:374
 __kasan_kmalloc+0xa3/0xb0 linux/mm/kasan/common.c:383  kasan_kmalloc lin=
ux/./include/linux/kasan.h:196  __do_kmalloc_node linux/mm/slab_common.c:=
985
 __kmalloc+0x5d/0x100 linux/mm/slab_common.c:998  kmalloc linux/./include=
/linux/slab.h:586  kzalloc linux/./include/linux/slab.h:703
 usb_get_configuration+0x191/0x5640 linux/drivers/usb/core/config.c:887
 usb_enumerate_device linux/drivers/usb/core/hub.c:2422
 usb_new_device+0x112f/0x1950 linux/drivers/usb/core/hub.c:2560  hub_port=
_connect linux/drivers/usb/core/hub.c:5422  hub_port_connect_change linux=
/drivers/usb/core/hub.c:5566  port_event linux/drivers/usb/core/hub.c:572=
6
 hub_event+0x307f/0x5230 linux/drivers/usb/core/hub.c:5808
 process_one_work+0xaa2/0x16f0 linux/kernel/workqueue.c:2600
 worker_thread+0x687/0x1110 linux/kernel/workqueue.c:2751
 kthread+0x33a/0x430 linux/kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 linux/arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 linux/arch/x86/entry/entry_64.S:304

The buggy address belongs to the object at ffff888014709f40  which belong=
s to the cache kmalloc-32 of size 32 The buggy address is located 0 bytes=
 to the right of  allocated 8-byte region [ffff888014709f40, ffff88801470=
9f48)

The buggy address belongs to the physical page:
page:ffffea000051c240 refcount:1 mapcount:0 mapping:0000000000000000 inde=
x:0xffff888014709fc1 pfn:0x14709
flags: 0xfff00000000200(slab|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
page_type: 0x3e()
raw: 00fff00000000200 ffff888012840100 ffffea00007fbd50 ffffea0000650c10
raw: ffff888014709fc1 ffff888014709000 000000010000003e 0000000000000000 =
page dumped because: kasan: bad access detected page_owner tracks the pag=
e as allocated page last allocated via order 0, migratetype Unmovable, gf=
p_mask 0x2420c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_COMP|__GFP_THISNODE)=
, pid 1, tgid 1 (swapper/0), ts 2179796954, free_ts 0  set_page_owner lin=
ux/./include/linux/page_owner.h:31
 post_alloc_hook+0x2d2/0x350 linux/mm/page_alloc.c:1570  prep_new_page li=
nux/mm/page_alloc.c:1577
 get_page_from_freelist+0x10a9/0x31e0 linux/mm/page_alloc.c:3221
 __alloc_pages+0x1d0/0x4a0 linux/mm/page_alloc.c:4477  __alloc_pages_node=
 linux/./include/linux/gfp.h:237  kmem_getpages linux/mm/slab.c:1356
 cache_grow_begin+0x99/0x3a0 linux/mm/slab.c:2550
 cache_alloc_refill+0x294/0x3a0 linux/mm/slab.c:2923  ____cache_alloc lin=
ux/mm/slab.c:2999  ____cache_alloc linux/mm/slab.c:2982  __do_cache_alloc=
 linux/mm/slab.c:3182  slab_alloc_node linux/mm/slab.c:3230
 __kmem_cache_alloc_node+0x3c9/0x470 linux/mm/slab.c:3521  __do_kmalloc_n=
ode linux/mm/slab_common.c:984
 __kmalloc+0x4c/0x100 linux/mm/slab_common.c:998  kmalloc linux/./include=
/linux/slab.h:586  kzalloc linux/./include/linux/slab.h:703  acpi_os_allo=
cate_zeroed linux/./include/acpi/platform/aclinuxex.h:57
 acpi_ns_internalize_name+0x149/0x220 linux/drivers/acpi/acpica/nsutils.c=
:331
 acpi_ns_get_node_unlocked+0x164/0x310 linux/drivers/acpi/acpica/nsutils.=
c:666
 acpi_ns_get_node+0x4c/0x70 linux/drivers/acpi/acpica/nsutils.c:726
 acpi_ns_evaluate+0x6eb/0xca0 linux/drivers/acpi/acpica/nseval.c:62
 acpi_evaluate_object+0x3eb/0xa70 linux/drivers/acpi/acpica/nsxfeval.c:35=
4
 acpi_evaluate_integer+0xde/0x1f0 linux/drivers/acpi/utils.c:260  acpi_in=
it_coherency linux/drivers/acpi/scan.c:1657
 acpi_init_device_object+0xb46/0x1930 linux/drivers/acpi/scan.c:1785
 acpi_add_single_object+0xeb/0x1b00 linux/drivers/acpi/scan.c:1825
 acpi_bus_check_add+0x21f/0x5f0 linux/drivers/acpi/scan.c:2081 page_owner=
 free stack trace missing

Memory state around the buggy address:
 ffff888014709e00: 00 fc fc fc fc fc fc fc 00 00 00 fc fc fc fc fc
 ffff888014709e80: 00 00 00 fc fc fc fc fc 07 fc fc fc fc fc fc fc
>ffff888014709f00: 00 04 fc fc fc fc fc fc 00 fc fc fc fc fc fc fc
                                              ^
 ffff888014709f80: 00 00 00 06 fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88801470a000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
```


-- CREDIT ---------------------------------------
This vulnerability was discovered by:
Lucas Leong (@_wmliang_) of Trend Micro Zero Day Initiative

-- FURTHER DETAILS ------------------------------

Supporting files:


If supporting files were contained with this report they are provided wit=
hin a password protected ZIP file. The password is the ZDI candidate numb=
er in the form: ZDI-CAN-XXXX where XXXX is the ID number.

Please confirm receipt of this report. We expect all vendors to remediate=
 ZDI vulnerabilities within 120 days of the reported date. If you are rea=
dy to release a patch at any point leading up to the deadline, please coo=
rdinate with us so that we may release our advisory detailing the issue. =
If the 120-day deadline is reached and no patch has been made available w=
e will release a limited public advisory with our own mitigations, so tha=
t the public can protect themselves in the absence of a patch. Please kee=
p us updated regarding the status of this issue and feel free to contact =
us at any time:

Zero Day Initiative
zdi-disclosures@trendmicro.com

The PGP key used for all ZDI vendor communications is available from:

  http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc

-- INFORMATION ABOUT THE ZDI -------------------- Established by TippingP=
oint and acquired by Trend Micro, the Zero Day Initiative (ZDI) neither r=
e-sells vulnerability details nor exploit code. Instead, upon notifying t=
he affected product vendor, the ZDI provides its Trend Micro TippingPoint=
 customers with zero day protection through its intrusion prevention tech=
nology. Explicit details regarding the specifics of the vulnerability are=
 not exposed to any parties until an official vendor patch is publicly av=
ailable.

Please contact us for further details or refer to:

  http://www.zerodayinitiative.com

-- DISCLOSURE POLICY ----------------------------

Our vulnerability disclosure policy is available online at:

  http://www.zerodayinitiative.com/advisories/disclosure_policy/

TREND MICRO EMAIL NOTICE

The information contained in this email and any attachments is confidenti=
al and may be subject to copyright or other intellectual property protect=
ion. If you are not the intended recipient, you are not authorized to use=
 or disclose this information, and we request that you notify us by reply=
 mail or telephone and delete the original message from your mail system.

For details about what personal information we collect and why, please se=
e our Privacy Notice on our website at: Read privacy policy<http://www.tr=
endmicro.com/privacy>

--_002_DM5PR0102MB347745E2B47C9AD24F379CF880E7ADM5PR0102MB3477_
Content-Type: application/x-zip-compressed; name="ZDI-CAN-22042.zip"
Content-Description: ZDI-CAN-22042.zip
Content-Disposition: attachment; filename="ZDI-CAN-22042.zip"; size=5338;
	creation-date="Tue, 29 Aug 2023 16:25:06 GMT";
	modification-date="Tue, 29 Aug 2023 20:54:06 GMT"
Content-Transfer-Encoding: base64

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

--_002_DM5PR0102MB347745E2B47C9AD24F379CF880E7ADM5PR0102MB3477_--

