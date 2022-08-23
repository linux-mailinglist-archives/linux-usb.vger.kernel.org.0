Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF84D59D057
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 07:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239487AbiHWFNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 01:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiHWFNh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 01:13:37 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74471836B;
        Mon, 22 Aug 2022 22:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg5oyE58NhL1cD+/90XhhcQC0CPxq/bDz+fqtxYD/W2o1dvZRxrrGLT1DxeKGtrD97OBE8YJC7PbP+TV89oj5RpWRXgWuRroMMYmb9UO5/Qleew/PnF2f66Hvy1ZtvZFPVksZ7cpVlZSjZ/Fl+YabFTQnwPmzuZiPo5ngRtYo97lb6M6Pk21bWMWd/YO0dDt6mp8A7Hx2dk8Cy688VgdyUFEQZng8EH/QQDeVTO0EaV0iT8nZoyKm3HBv2PnARBhXiiFh1UnEa8w/PyMMV/1PSOgQuneuIFE4ZifqYsanjDpeMiBt+/OlYttRH8CRrFD6wc6orDF1z7MKJsrywse4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCrJdfJWIpgp6X3IyNZI1NBbgwRUAzRtw6JI7UIgdYE=;
 b=Cbp//SzSUcGrHcyrm/RbI95oGTtVL4s5ZkG9VRZheuH66CBxNJy/5TBnkeyvayniIQrPynUJ3e0JPnuoSL8xXDl5CB4kgKDUSyrgGmlgD0w+VScrQuDjFmcnREbGV7X7pOAb/85+/q/iE/08RZEL3OfAluxS9U+uIVj6KyZkBVOc79nsrZxewGEVhzQZgE0wyeVhDbSoVjpzT6VTS41vrd3gNPhWBSloNJU6/vRXeTtdyUi34lPkwZ0pggdX1N1mqfvsTaV1Amgla6EnjTo0AXA11glJldem43yR+VH13is46WePIc+nThbTFe6whC4kaektAPrvr5tgYg5Y9N/sUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCrJdfJWIpgp6X3IyNZI1NBbgwRUAzRtw6JI7UIgdYE=;
 b=cqsMzKHtpBJD1vaRPYbt4uuVlMEWo0HrEXjfL1iFXvoRSHbArMVLlwEqU36AlYLQT3alexwfNdpaMtUwbVcrdE6pfJl+vhrRT70BfgtYHL44Na8DC0bSHF0o71+6RTnPokFYV6nTaUeaTMPghY1V1hmd2HPtkv6vH23yPGhR0vE=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Tue, 23 Aug
 2022 05:13:33 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 05:13:33 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     kernel test robot <lkp@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 3/4] usb: typec: mux: add typec orientation
 switch support via mux controller
Thread-Topic: [EXT] Re: [PATCH 3/4] usb: typec: mux: add typec orientation
 switch support via mux controller
Thread-Index: AQHYtfmSG+YWmixnKUSSCfEMo3eHoq27ENYAgADg1ZA=
Date:   Tue, 23 Aug 2022 05:13:32 +0000
Message-ID: <PAXPR04MB878451B2D4A37632ADBED11C8C709@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220822153517.3747679-4-xu.yang_2@nxp.com>
 <202208222312.IFf74Ze6-lkp@intel.com>
In-Reply-To: <202208222312.IFf74Ze6-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b614d97-da1f-4e5e-0abb-08da84c63990
x-ms-traffictypediagnostic: AM0PR04MB6852:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N+JG4qqg5zWtTXM9PoXd+siO4nJN2258C+QBYD6j9AtQ2C7epJN9PuqUdXP+64KrAVZz2IaIV33J52gFrXB4gij8KRIPyi7l8WkChCvP7r3QSEmredXiXO0XquGFgz3xKU6jBjjeLN9zm3RlK0ZFUTMPG1S9RdAC/llyVf3ygIJW2a+iS4jDlQin+6F4EHi/Jn1Uk8Dqr7JEEH41aK3OG071INZ1YyxgqlUVH+1MPUhp0zhEoR0PhPZuMvFJN6cgm5p58GfcawTNK1ma1D48YGu/ADXNB+buDKxvGOI+aP2L9cBNwRZcehDK/1P0jxxrDkdnpwZAtefhkZy7xuBj38VuDg76gSXStp7WyVAMO3SsuVYezZyiFZnOdrQpE4f8BiLsdweQNwNWgiJn7ciGgruZLZ67dGPGqtrAfoB0ICzN1sJYjINHI5GxcW92RkXc0gELLywOwd+PrhgcVMHvez7RI2Xxs8vrvj+bho00p9k4ItwhOgJz9iqzeDwRdGcqQDGWYWVyfkCnUjCMoch3itzfik/qz2+RSoP34XdC3Ak4AeVMSwBvoZoXmbi8dhzY1fqSIhVuHKbpIU+ACDmV58t7oRO8LkBt1DE/CURO7J4P+iPE9zaZZ7x/8LOKdv3Iujoa/VfZITVxuVmRu+NyL1PRZie0Q6MTvUH0ety2sWcYz2Zh+8QuaIaRNqdOx+c+79qqe0powOsTnuOdSn6MBmlcY5aE8V3J0/4uwufmF2lMv3S3v71l0RK6mkuYNk75lyiRQ4l/ITCPf8/L1nyCEOWbMBP4ceXGoRyJlA1mwTE0LI28vo562BDqy755AOJGC0jwHI+yXLIXuJGo4oeEHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(26005)(53546011)(186003)(86362001)(7696005)(6506007)(2906002)(33656002)(122000001)(38100700002)(83380400001)(38070700005)(55016003)(54906003)(52536014)(110136005)(8936002)(9686003)(71200400001)(316002)(966005)(8676002)(76116006)(66446008)(4326008)(66946007)(5660300002)(64756008)(66556008)(66476007)(45080400002)(478600001)(7416002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T72bWpdxknUlqlPrrWC8iKV2bHxboTnzvoZ773SKjHRSFSTJM4tWMdNOBUOW?=
 =?us-ascii?Q?+FEtd0WDN/vqnMUFxBkVoOx1El4F5v0B8wJq6l1FUDSGB/EltzHEDctXqj1X?=
 =?us-ascii?Q?BsmQINARAyYkR8WwFEgc6qqmwGKkI1cDFBayREkyPZMfLrtnggHFi+E4J2Oe?=
 =?us-ascii?Q?ItPqEveWPqwNP7JTDecvzbE3NmsG2HxeHxhZVEnNLrjUF4pDqDQ7mPKzRCfK?=
 =?us-ascii?Q?HCDEHmn5PcrV6SVu1tYcDwAobqGJ3d+HPYkxDCCppiUWxYwZ0gQzMm3Q91JJ?=
 =?us-ascii?Q?/L2qg/PdNcwGd2AhA+2mctXF2C6sL7s0Yw4CHz4H0xomsWBtDlN4zBY19r35?=
 =?us-ascii?Q?30ytem/TyoqMeEFiivFcp+Xy3LpLZOLb+xQOeik7QSqvBEiwwP+IkhDRwAee?=
 =?us-ascii?Q?zzVWcQTaP+NS5n5JxL96eAJDOSpuB7onJvQwDfNzrY+9yJjy7NyT43ImLfmc?=
 =?us-ascii?Q?wdKjXTeJpwWqk8ZLL7i6+Ko1tODH6aS6KgNNhVK01gHmcn6axZKvDnGdY9ZJ?=
 =?us-ascii?Q?sX691HrQD+aumYPzyPey9NGH3N/ObYvQ8ORwg11MP6K39fvDmgp/m4hJCS/Z?=
 =?us-ascii?Q?5h1a/7yg0Esh+A0vmxkdOrR8SFO/G8jLr3AiBcaxXYrx61ZyEEtIPASHRm2Y?=
 =?us-ascii?Q?hnVE4u74A1N6d/kIN8ph0VkwzkQR+G4yoqwS142wLTN34dnKaA4GUkQ8x+1l?=
 =?us-ascii?Q?TRI8L3dd+BGG+dTpvD/qMG5z4DVidlYCTgayHdZTDEJ5QyzVb574Q47kFFKO?=
 =?us-ascii?Q?GoeSRldvWlD7lEChI1YSyPSm1OqK5DwkU6lm3jRfu/SfNmiDVh74YeylgYQK?=
 =?us-ascii?Q?IrhTc22s2F1UbapSG71A6r/DtC5EcbWr/EKvRWapgikytAbDcfCFlqUj59HV?=
 =?us-ascii?Q?1d8PyPzvTspvCQnlK82U1qQCLivPbO/0djVvalRhqhDcXZeXfRs1xg8i/NLR?=
 =?us-ascii?Q?bG4C5VUyXn2S85ZRgHs5/JWYzjfuSncFv78kkXD29yqu1hCd9StX+rBuUav4?=
 =?us-ascii?Q?2v3QS9GaV169XMtjdQxALdb105RdNKR1rA0JAHRLNgjuBptFMCMCaw3/4wLF?=
 =?us-ascii?Q?kwQhQhmEq1Ch4wsBDYY2eSChsSh5+kneUC78DhvivcaBUSxnxnZ4P626gPHw?=
 =?us-ascii?Q?btmfBaw32hqttM6PUn2U5ttrEgIqm1CfQ+HxoehSMczgLd5m2tVlidMK1bbf?=
 =?us-ascii?Q?1tfWoPlSfRyhdDE73yVK6hpPkeaebci24CWsPHVDtb4nIdVzN6/7X7NLKGeF?=
 =?us-ascii?Q?azymKPjttmxsLrR2jdHxfc7TzLI/ljHbR2jSdIgO2BbfqoiDZDooC6lJoW9f?=
 =?us-ascii?Q?wJnfM4FkojJO9JpeXoA0wM86KbfmVC9ZxeCww299AvchAK7YWYRqpCJSK7PU?=
 =?us-ascii?Q?s4nEFqh9AxH/vAPw1Xl2YBfo1vx78fBHjLA8zfOvrI51D6iSqWHiekpcA1FC?=
 =?us-ascii?Q?+5ig172IcnTbREET7sAyVkUqymSn4r5QNaTi/pEsaggnMFRay4ciiUIPk1iN?=
 =?us-ascii?Q?MrP24Akzk/moVV7wTiBsAKcJ/fTHW3/9FX3xIv2QFH++TCiqMASks+JugTBb?=
 =?us-ascii?Q?s67of4JlwC6rUPYAeFY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b614d97-da1f-4e5e-0abb-08da84c63990
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 05:13:33.0166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0VVqokm/crMX5Tbfj1iB3vc0Ng2/qfL3F1F5+/SBVBfJiJFELQd+LLYGxWIH1kIlzyXwn+KvXZb/cKWgeS3DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Monday, August 22, 2022 11:47 PM
> To: Xu Yang <xu.yang_2@nxp.com>; heikki.krogerus@linux.intel.com;
> robh+dt@kernel.org; peda@axentia.se; shawnguo@kernel.org
> Cc: kbuild-all@lists.01.org; gregkh@linuxfoundation.org; linux@roeck-us.n=
et;
> Jun Li <jun.li@nxp.com>; Xu Yang <xu.yang_2@nxp.com>; linux-
> usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH 3/4] usb: typec: mux: add typec orientation swi=
tch
> support via mux controller
>=20
> Caution: EXT Email
>=20
> Hi Xu,
>=20
> Thank you for the patch! Yet something to improve:

Thank you, test robot! I will fix it and submit a v2 for it.

Xu Yang

>=20
> [auto build test ERROR on usb/usb-testing] [also build test ERROR on
> shawnguo/for-next linus/master v6.0-rc2 next-20220822] [cannot apply to
> robh/for-next] [If your patch is applied to the wrong git tree, kindly dr=
op us a
> note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit-
> scm.com%2Fdocs%2Fgit-format-
> patch%23_base_tree_information&amp;data=3D05%7C01%7Cxu.yang_2%40nx
> p.com%7Cbfc9a4dc76fb43d05f7108da8455c2ab%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C637967801123509493%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3D%7C3000%7C%7C%7C&amp;sdata=3D1F2u5Ljc%2FxLAOzsnN9945e%2FeRl
> AVm5kMo1gLNbhUCjo%3D&amp;reserved=3D0]
>=20
> url:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu
> b.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FXu-Yang%2Ftypec-
> orientation-switch-support-via-mux-controller%2F20220822-
> 153600&amp;data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cbfc9a4dc76fb43d
> 05f7108da8455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37967801123509493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C
> &amp;sdata=3Df52r9hf0%2F5tfiSwZEjriijZ4da2XO7A8r8V9FjCRG%2BA%3D&amp
> ;reserved=3D0
> base:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
e
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fusb.git&am
> p;data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cbfc9a4dc76fb43d05f7108da8
> 455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63796780112
> 3509493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata
> =3DMDXVH0E9FZ4zZBJkVeG5KuWoUqxl7lVDIbtdLcayD6Q%3D&amp;reserved=3D
> 0 usb-testing
> config: i386-randconfig-a013-20220822
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdow
> nload.01.org%2F0day-ci%2Farchive%2F20220822%2F202208222312.IFf74Ze6-
> lkp%40intel.com%2Fconfig&amp;data=3D05%7C01%7Cxu.yang_2%40nxp.com%
> 7Cbfc9a4dc76fb43d05f7108da8455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C637967801123665718%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&amp;sdata=3DoZ%2FSbZ5Rp%2Bhj9l1x0fJPW1dIZ7p5ezqZ
> Y4ouw8EpmC4%3D&amp;reserved=3D0)
> compiler: gcc-11 (Debian 11.3.0-5) 11.3.0 reproduce (this is a W=3D1 buil=
d):
>         #
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu
> b.com%2Fintel-lab-
> lkp%2Flinux%2Fcommit%2F703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd&am
> p;data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cbfc9a4dc76fb43d05f7108da8
> 455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63796780112
> 3665718%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata
> =3D6RJFht%2FkdfQ4domUP29WJC5m515k2RkAswDRQqwL85s%3D&amp;reserv
> ed=3D0
>         git remote add linux-review
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu
> b.com%2Fintel-lab-
> lkp%2Flinux&amp;data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cbfc9a4dc76f
> b43d05f7108da8455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C637967801123665718%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> %7C&amp;sdata=3DwJeCdRdZ8UB0rHYQb1xEIlnOdqhJs53I%2BMM4%2FXvo8B
> w%3D&amp;reserved=3D0
>         git fetch --no-tags linux-review Xu-Yang/typec-orientation-switch=
-
> support-via-mux-controller/20220822-153600
>         git checkout 703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    ld: drivers/usb/typec/mux.o: in function `typec_switch_put':
> >> mux.c:(.text+0x21d): undefined reference to `mux_control_put'
>    ld: drivers/usb/typec/mux.o: in function `typec_switch_set':
> >> mux.c:(.text+0x29a): undefined reference to `mux_control_deselect'
> >> ld: mux.c:(.text+0x2ab): undefined reference to
> `mux_control_select_delay'
>    ld: drivers/usb/typec/mux.o: in function `typec_switch_get':
> >> mux.c:(.text+0x767): undefined reference to `mux_control_get'
>=20
> --
> 0-DAY CI Kernel Test Service
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F01.or
> g%2Flkp&amp;data=3D05%7C01%7Cxu.yang_2%40nxp.com%7Cbfc9a4dc76fb43
> d05f7108da8455c2ab%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> 637967801123665718%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7
> C&amp;sdata=3D915lo2yL7e5Zk0SBUqNX1TRvqNvAx3A2wCMVgho%2Fblk%3D
> &amp;reserved=3D0
