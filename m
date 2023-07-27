Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458D27643B8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 04:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjG0CLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 22:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjG0CLK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 22:11:10 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F84619A0;
        Wed, 26 Jul 2023 19:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690423870; x=1721959870;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ztqHV0z0eLNtMczIHnanN0qiryg0ZH8RGnmRptAqGTA=;
  b=hNpQ+MLkohSdc1Xf0ZGx//zIKoaNnF64xS5KRz65mPm+Fr7v1S/4NMuI
   IPbRpxMsj0GyprOFm/JgYIxx5YAAulmSzaNWYsnL0chZ5oHh0bOz2whmX
   49Q7TLxG54FuGPxjeipn/lCDDGBnU7VJVHR97d4aId6CNvgAR705Tq0J+
   571gSd/4HsJa1ng3kmlx0QMRZEY2U1m4/E/2I9q5vkNbGgqBC0ZC1CT57
   LfF3/Jh9F5HQSVq/eYcQZM0LL5QfDMBVcj5Ye41RpsWFG4fP92zrPpn7e
   fpHJdlC/SfJ0u542HsEodCd4FkYw0ySVX154xPrDbmEl+gajmUDORemNW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434456078"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="434456078"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 19:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870164601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 19:11:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:11:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 19:11:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 19:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeShIfpbQ8BeU/aDvci19gvAwMdLwFC2g46fvGDvwNuXOyk2dv/CqyjBNcyixcQqFxaeRCFvAootbCY7Z0uPE9HuHtQwgOQkrRw29wjDLyOtmbeE6AcLNd3BUFtDGn5i/ywUe3oU+RvNWxvUTjyL2bZgYpvNfjPnTzMnls8Rww0o/HsMP1LAHtarMLceG4l38clb/uPDjZ19SxACFejJRSUe8xjevXQ+6q/nJC3MJYm/rNq0MDNys/ZacoW2JiWXasHKFHjVBM7er921zYX6WEpgSLPvFHNfO5Sf+lim4jXZM67L6ECSw2AU0db72z3o7J2bGwLTiqcRgRuu+B0RAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM3VzL+zvQ/Sc3vP8ePVkUXNWyp2KK4z1nox92zQthw=;
 b=JhdOTZ2NGXpyg5+7ZsTLFx5gzk250XU6o5HMsybTpUFandHLyAfIh8cNwA8MZuIaOxT+lsWjlMWc6x3m06OH/tMtsqkSH4nV+zZK+VZ6f7cNyvjU1iESlJAl8kazHaSqMX3FU4VcHgdKVN2E7FOPqZ0BCmYaSopRYQ9YxFEFlzetjJpP2/QnIGU845mwZROgu8n8siww3HJbC1u/bz3AwBG27VUada2iZnP8AXGn6sv7bCKcc3KI79plApsd1VUQpU/fmxCrbU5VT8Y6ZIQHFf/LfWCXyH5pLCB+old+k39HgeWG7jeyME3TcnJmzubbJ+HHa6huJJunRdM/0abh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:11:06 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 02:11:06 +0000
From:   "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: RE: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Thread-Topic: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB
 controller
Thread-Index: AQHZvflH4k6c0u0O8ECuPkXMRwqJHa/Kew6AgAJn1OA=
Date:   Thu, 27 Jul 2023 02:11:06 +0000
Message-ID: <SA2PR11MB4860644A600C3BAADAC00DDE8001A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <2023072554-usage-untrimmed-409b@gregkh>
In-Reply-To: <2023072554-usage-untrimmed-409b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|CH0PR11MB5442:EE_
x-ms-office365-filtering-correlation-id: 5b5fdb89-5a51-497c-1cdf-08db8e46bca5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVUA6qWMkj77TMtn/9jvbKBfpbu8a7BWROfNy25/fXuB9temvhBCiY43VzC8dneLhAeukYK57zUHeY57kKygpno4PfNqEmNIPXUvXXESfbsX7OHe7Dj+2pUqvBtwqq+Mk9OdhvY87FOd/Eov2j0tyXdPRYxGR3W6Pr2eXQ+6LKkVXIvBdTcSIUTJAjRRpAC66HNaYomGUIZhiB2RSN8oku3sRzALyiI3A3Op4Q1LrBFwQIUkfwsHJvSic30eTnNwror8krWc/0fofKqsjhjis0i2eDWMRrDTBOv7nbyGXP6jJGKkAR2Md2R67ZN+hr7TrsmKF4MT796wFuXEPIZ9ke/kh4+GUhrA+qFDi9mdeMCZlfvPKasHrCgy8uCbI+i7YOGxhlXJuMpCwuFErLxkrl6pLaERWvDuZj2RQFdZmNlA0I+SYhZKJfpgr2EiT4akMsQQxaElVUU2FI/EfFZvPMEnpFTk/k22AAD117bcudgEyMQQtVZq69UShdXlFChL3NCJOs4KtgyyypcQCmpD00+DtH3dgnAdeOB07kFzXfk0F+76g7Ci/XI99p2ndCLQAPIQ5kEjnEJMl64eW066IgzG1B/QkTeIrVIto+GsCc0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(9686003)(54906003)(7696005)(478600001)(66556008)(71200400001)(53546011)(186003)(26005)(6506007)(2906002)(66476007)(4326008)(64756008)(316002)(76116006)(5660300002)(8936002)(8676002)(41300700001)(52536014)(66946007)(82960400001)(66446008)(6916009)(122000001)(38100700002)(33656002)(38070700005)(55016003)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SddAtT47oBnY2VvbEre5hlGLFBcG7ufm7S/NdJo3eMSPgA0vDR+rK+DJUimU?=
 =?us-ascii?Q?OQ6yXP5GPlWZ6KA+1A0a+ShovEfxQozWuqzW0ALawGu+Q2FcV9e86TiYh/Po?=
 =?us-ascii?Q?ylXjoqZb78UdA3Huouqeaq0kc1gFOnX+vIDOpUvkFlC1N4BG/GrTU7J7NNiU?=
 =?us-ascii?Q?wL8KLVbcTYkqp0eP2VB/m12zKWEFRXBtIFeJ088HPrIDC/2qQsdvJuW+8GuN?=
 =?us-ascii?Q?8rcBQp5rvv0GgN1+hxaTEkUpQqtYW8LeOADZ6QiGzwG4SPoo6EBbbLTOfNB5?=
 =?us-ascii?Q?iFW//4WeJtoLk0MikUOaH1ZrRa/grDcjHz7Tmk5d5op3K/tWUka3TbzEb71x?=
 =?us-ascii?Q?GjvYc3k4nidxXKw4OAoagBzViwLsv4jDWtKzpQ1cUzcK9uTwSNrmF/JjD9HZ?=
 =?us-ascii?Q?P01NcfL29K0IiLQq72gGgu33/ha7zVOXUu/gaxV6ms29dgwl5I9iBUsLIACD?=
 =?us-ascii?Q?4VpoBHK5K7Y+0FLDs8T7313xJcM+QrKbfYrh+mjECLrLBtzlHbiramggUUhN?=
 =?us-ascii?Q?8hRFBE1i+azxD/qje1fLU8u/2RMsfLe3UOtsCEqA04AKj/JGtX9eW5vRXzzG?=
 =?us-ascii?Q?h9E/VRxuTnOx018CiLu9SM8PmIEN0hiSH9DWlIkbdnZ+MeWc2kjhHrRWo1He?=
 =?us-ascii?Q?PsWiWGC01CAKOYwauV2CzFetln7ycfGceUoewqyKzCVL6MPC+XXavC2ioYu8?=
 =?us-ascii?Q?vN986aeyusNNzIiau/fqlF4utB+/VCn3dvWRnqWgaStoR36A3QuJCv7IBIe5?=
 =?us-ascii?Q?HeJ60d4rwF86K3CY2PWqKPWQ/LSnd1IDTGAlMGP1bol/gZ+9Mv6UuNgccmXf?=
 =?us-ascii?Q?oOf9EnNOq5gMHkTmgNnvXSYemUagMO3DwlUq7+bKcInRSOQsR2lDCv0ATeII?=
 =?us-ascii?Q?CyHqNX2AL7BDZYn3LNy9AYlwOTAqbf/oRea+9KKyPAAg1fqNHtP++d8RIaG9?=
 =?us-ascii?Q?HBZDT74yXEo/IL8RA3oJX4ajdX9f2+heRQyDyRnhlXF4XtRF2v/wqt5QMIKr?=
 =?us-ascii?Q?huDdRRU6C/oxLB6gE5J4Cboj82Dew9ju3gJ9O6Y9UmnYcyrGGFwVIfzDNGv3?=
 =?us-ascii?Q?Q8w4Kjmh+7qLAVGTD+e+YvUgC6Uea3zVZVmPQvSH19UXxoQhPCLjZaEV9ZSM?=
 =?us-ascii?Q?wIXW+MvhTLs2qWIp9v+PkVh9OxF359ich2acnRcjc2tym/yJekYmIqrch9eq?=
 =?us-ascii?Q?IQrcC0syI1cART9dzY4l6T4X1aL8kdI/rSwIyklp3hnV4PHhESXxps4xxvpo?=
 =?us-ascii?Q?mRdkxZmTF8sWWU7D3R8KSU4ybrb6aMSSfx5zJwcDrOSw2UPFux5ddVSuVRjp?=
 =?us-ascii?Q?0fCfgchwspTW4w3+znPerf/ibW83yaX+AkpP4ZGg8DI89orPd2+7WQcJtQtM?=
 =?us-ascii?Q?OmI2BZjY84IM9cr0O/Ta/sHuT1yxeRVGOKqxjNjXDng04CL3cLAmtfnvg6kW?=
 =?us-ascii?Q?ULh7XoC24k39ywX/dQ2+N2Csgi7vgRiWzcp6srKXj3m6SYHJLSuMoFNaAseC?=
 =?us-ascii?Q?uRndPAr4mmb1sx/1AGCIjhUKITNnWOwANtr5GIfjsiR/C9uPppmVrbu9jM74?=
 =?us-ascii?Q?Dr92iTFTC1XwU4CAM2j51c7nVwwmEVLzhnr1abl2PRMR/By1LvtUUFysuptc?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5fdb89-5a51-497c-1cdf-08db8e46bca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 02:11:06.6697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ko3UxbwL7CS+PE9MC9tMVuUkmkTacEpVHyXFlANqrWUfTrgFJ/+wneHwfBbccUzRH1npIbaD9qnlXdxS/bkjdBI26pXCb9EdCXe/Ssfrcqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Tuesday, 25 July, 2023 9:26 PM
> To: Ng, Adrian Ho Yin <adrian.ho.yin.ng@intel.com>
> Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> conor+dt@kernel.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; Thinh.Nguyen@synopsys.com;
> p.zabel@pengutronix.de
> Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB
> controller
>=20
> On Mon, Jul 24, 2023 at 02:36:58PM +0800, adrian.ho.yin.ng@intel.com wrot=
e:
> > From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> >
> > Existing binding intel,keembay-dwc3.yaml does not have the required
> > properties for Intel SoCFPGA devices.
> > Introduce new binding description for Intel SoCFPGA USB controller
> > which will be used for current and future SoCFPGA devices.
> >
> > Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> > ---
> >  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>=20
> You don't seem to have followed the rules that your employer has for kern=
el
> contributions, so we can't take this, sorry.  Please work with the Intel =
Linux
> kernel group to resolve those issues first, and then resubmit the patches
> properly.
>=20

Noted. Will work with the intel Linux group to resolve the issues/concerns =
prior to resubmitting the patches.
Thank You for the feedback and sorry for the inconveniences.=20

Thank You.
Adrian Ng=20

