Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B490764CB8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 10:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbjG0I0Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 04:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjG0IYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 04:24:41 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293D04C20;
        Thu, 27 Jul 2023 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690445629; x=1721981629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RwNz7v2bwFDFKP6gRYDz1OJBDqWaJb0X7vSyh43r9PQ=;
  b=iqeVB5D5TghHxyr2j/I7DIt/beX/t7smkf88SF92l/4fsQHJaoqPB9xQ
   YjW9Pn+6mo82r5RFqGH6i11qECXSVWI13XJeX/PCPITBrvN3x/zi8d892
   WNNiJGmZgSjM+/JHHUxDW2ZRFuBQZUpK9ql+xmqryGVJCO9ywbweBrs9K
   9CQDmBOQ3bvH8nrqQ04Kk48VtbWb0q6kmO+jHaoMxphUljwJH1uY4D28O
   g6PoDPtZM1a8xcCNa4BVqqmRRJYIcNAR0ZneHaohlYp91A7RoRqRCcKFw
   spqwEhZJDoqT+fnEiXvUAySwaphtOXLGYkUMvqus3DbjzwMeF7W6vbbGL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399182480"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399182480"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850769218"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="850769218"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 27 Jul 2023 01:11:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 01:11:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 01:11:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 01:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUjSVcg+z6dVoIl0iNxgjcTNokoa651bd1Le8V3NYLSrFHg3q2/PwnDHWYe6QAuBAC37vErKGgYc6LcynFk43PSWlv7L1PMOJts8cXdSpJYbaPjMFndevvEYbF+EJLsWTxbc7/r6xwVDtJZ0HYQcgyOU96mrTpMWl+6KAAbZBS9ifOBxefHl0DR+MNnNgwbqI/iqsinHjuguhkSP8NfVG48a9AX9f6JJFp4W8qDfoURDVDU1TvlVYriTU49lUrbOS3b+4w7BR5kgiXzJvEpxuiGkHRZI9NtbCX6qJVxrYgMwOX/Y4fGLFcTa4UaNlytQDjj1ULG+rUX4SUlUtQSDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBr/nQf+DCUAftPmPF74zN9Wh1UFgS3bdhJcVq+kKiw=;
 b=PXbticnpbPtRErhrPLl/a4vpWO3Z7+TKuWBKfV/6IS65not6Jva5aUC8KdYZ+dsSzVya8GnArmEseNP4PQqQYgB8MnPyeoH2puUvany3t5NYrXZOoqIBHCX+LRI13jjTKFqhs77aW0aCkCYiSVH8akWG92cPbQNaj/JaOo91ulonv2Or4zjnb/67/4Fb+YnkhSHtHY9v6qotLKG3D/ekKZIYGWiyFYQs3TdEEOGruzdibud5zXKOW/CTVwzUd/8aNsWxoyGhyFVslsLLemHdLSQkWQnTFe8KXJ/LZd9gMwWenIlYGUBzF5x8Fy7pJOQWxw7dDef8J2OHfuv1LPxzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 27 Jul
 2023 08:11:45 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:11:45 +0000
From:   "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@intel.com>
To:     Rob Herring <robh@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHZvflH4k6c0u0O8ECuPkXMRwqJHa/MQK4AgAEFduA=
Date:   Thu, 27 Jul 2023 08:11:45 +0000
Message-ID: <SA2PR11MB48604FE6CA1D769335ADED508001A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <20230726162914.GA1542946-robh@kernel.org>
In-Reply-To: <20230726162914.GA1542946-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|CYYPR11MB8408:EE_
x-ms-office365-filtering-correlation-id: 0cfd3b44-ce73-4819-84a7-08db8e791e30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDICPLeTgPrn4kd7EKDH1vX5IF/i9J5jUmxzgzFyFznEfIfuzBjCNEUF92Apy4LbcdMZOmN1BV3zYxi5OqoqpuIkI3YHY+MxP1tkO74hsDgPKv8XQqmDHPH9CvUjI2+7nWB9tih5wfT653A7pqSNZDM2xdPFCi5TnRKbaXQhiPXE2RiOdLOJORYD9ggBi3d0XndI2pJc4yvHyiyROBymsrlhlFe++Wu4U+zo88h4QDuxMYGxfkwqD/wO8EMkX1/wyUkbRsGqeG/W3hePNzghsVN/Cx6NjxgASardFc8+ZZiSP2rEqW7BnSrt81IaN1eJBNYTRnVwK9EyeTyDHp38ma6OflwoZn0/uosN8IjOONBUKXyqpWzgJoInwb6ukdETYt5PKt0OBN2oeHsozJpv8wc0iy1TxboN2Mh0+WnmR8TB85PxIcGqCLLW7EyC8l8A9iU+pxFy8gM1F9GhnRaRKzvPXBFQmMNaIplDobM0zIGyQIE2DKtiAvNpM149vRvuUC7gjPXUq+QIvmDvJEJW6pDdSf4rUOl/TUpQOO6D7ilTMOB/u7MY+dlcPBlcIjLl9nQVlPPQ8hdaf3QEfAEq3j/3CxMk39Bfz1+iulaeZI7dYsKVdD5n1kIHLQochDqWaM6WYqRcTCVRLXrmvLGh6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(66899021)(186003)(83380400001)(54906003)(478600001)(71200400001)(7696005)(966005)(9686003)(53546011)(86362001)(33656002)(38070700005)(55016003)(2906002)(76116006)(26005)(5660300002)(38100700002)(66946007)(8936002)(8676002)(6916009)(4326008)(66446008)(122000001)(82960400001)(316002)(6506007)(66476007)(41300700001)(66556008)(52536014)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ozoXJ37vkbtpoQVFnTtukTmbJY9CUPG3MtGT5E+hBHvK0ByuxM0DBVvmO8Yr?=
 =?us-ascii?Q?5G/tEx+dXyhVFff6wgum2/jCGOhu4wXvwhy2FlaLrRkvoNcu5g9kQkJ59LYe?=
 =?us-ascii?Q?aRqH92ZeeFzmlIvL8Xni4c//28eN9inWwEWAjq1S/wdOFDS0q8H2hkypmXDR?=
 =?us-ascii?Q?zd2jgAjMzFgXBINAShG7exYkAE/wdXecjsTPNGEnIza8tLeep5PSue7pfG4e?=
 =?us-ascii?Q?fRkHM6GIZosQgQE+J77pUygv9CV/974r4Pchb+SCg1aN3PySH4/Tth5Gwgva?=
 =?us-ascii?Q?EPR+XOCq1FmWas3wtTqYLWYXGQY3d61ZfPwk5HImDsX+Uy9MFB8GyQpEj0dG?=
 =?us-ascii?Q?RORy1JPFzohUD8kD+7WmN7SsLx5iDlTdVVIbbvwI/kw8EPr3x4Xf8vArG3jg?=
 =?us-ascii?Q?K1uXTARfv0/PdMrt2OUOicK/vJLyOGG/ShmgubvrjI6zwjXqPdjculO2YPJK?=
 =?us-ascii?Q?9NBsisUSezXbp0g9PSLb49+OMmNJyKEnmeageccxV0Y9NUONcfq4XtGS92Cy?=
 =?us-ascii?Q?77TLnM32kh6/wkA2ns6MK+UwKO/abHMsXWQIWxTe1GTE2dZI04HSqixhSokV?=
 =?us-ascii?Q?T634m93I6gohNdXVLyqMSXMzvpq2MbR+sD8HmV94NK1FPsxqXt53Laze6DCf?=
 =?us-ascii?Q?EUpz6oBshk8WETjNfK9SCv4Uu5Jss1SDWQKj+1ynuYj9HN1+i66IQztVSxr1?=
 =?us-ascii?Q?hewlCXlGS+Tg+G0f/PECcS3KVv1y0DM4/Syl1ucZ1KI8VeYFNEvwTN8E29ZD?=
 =?us-ascii?Q?ka7exJVMsCQ7u5woZjZGr/1MQTqpE2VAA5oSrGR4BM5CLQEJanJDiyNrz9Bv?=
 =?us-ascii?Q?AQsXE+t7/5xpr/r6P9vN/tQOJl+IUKpw3xinbB5jFFaTQvDlJFbGlG1dettZ?=
 =?us-ascii?Q?alAuFNb3xQEzi6uhsPey4Va8nkq8kRfLn6ymB9LJ369onXJPMrrhTjC0h+X/?=
 =?us-ascii?Q?2UH1AchXeb27g2A0Siy/1UL9p41llm58jGQQECbPUbKOKCnCXSYNmRpCifIi?=
 =?us-ascii?Q?cUCk3TEMloJ69mcUOicZd5C6ZACnIy3A+7JlVWQGjfhk6wKLTm8QNbBNnGau?=
 =?us-ascii?Q?4EA3dEMXnkl7TkzInlNBryPepBMtw60m3ioaG0vrXXsT9srlpcsD6RjbEeDI?=
 =?us-ascii?Q?c1L/OoWjkt/DjM/Ve+gS/ZcCgctOiTUsHdEFvv/fGf+sjxXy7BWJjstf0q9o?=
 =?us-ascii?Q?hGgeFM0ty17eDU+6Nmx+fQ2i/BYYCwHJdR+E3SPvUt9ZtQ0dJoAGixxQ4stF?=
 =?us-ascii?Q?FmiFfQvsF+JLDWx6vorQaX09FYGQN5h2q1SFi21wmcbxxSewkotELdBdf2e0?=
 =?us-ascii?Q?GlB0orFUv/lVVRac0+Gmy80Fm4u81YPwp8cgXYQVgr3YJRSDYhMnGV3TtQ20?=
 =?us-ascii?Q?iHAyRQ+FXCxgeextyFj/KG2hErmWLhNXRcn8JLbIAHek/t5PI8nqq1he8Eso?=
 =?us-ascii?Q?EfD1kNsjiqn83S23m/EvE9NwrS8xziPaOj3t6DWYB/KpM+k1uirAn7lBpG/X?=
 =?us-ascii?Q?QebBCt2qzGxgGicXXnt0q46XjnkRfBgXEgluk1yNfwOF6tGhvP+gp781fCBs?=
 =?us-ascii?Q?snF7SXk+fJX4NOHT6eHHUvA2QzEYdg5/DYNQxhtEMI+mQTO2iExyuxLn9Lub?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfd3b44-ce73-4819-84a7-08db8e791e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 08:11:45.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPh1NYi07PC/pDObTUB/C15nsLOf7BNkdOcsaVL2rEeRdjJ7NzC7HOiEYZ2zWrxqlFUyeQ1nKfaYHmxRiUOf5/vcULq6dmzSB6ALAMo/Ufw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, 27 July, 2023 12:29 AM
> To: Ng, Adrian Ho Yin <adrian.ho.yin.ng@intel.com>
> Cc: gregkh@linuxfoundation.org; krzysztof.kozlowski+dt@linaro.org;
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
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> > b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> > new file mode 100644
> > index 000000000000..e36b087c2651
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Intel SoCFPGA DWC3 USB controller
> > +
> > +maintainers:
> > +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - intel,agilex5-dwc3
> > +      - const: intel,socfpga-dwc3
> > +
> > +  reg:
> > +    description: Offset and length of DWC3 controller register
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Controller Master/Core clock
> > +      - description: Controller Suspend clock
> > +
> > +  ranges: true
> > +
> > +  resets:
> > +    description: A list of phandles for resets listed in reset-names
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dwc3
> > +      - const: dwc3-ecc
> > +
> > +  '#address-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +  '#size-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +# Required child node:
> > +
> > +patternProperties:
> > +  "^usb@[0-9a-f]+$":
> > +    $ref: snps,dwc3.yaml#
>=20
> One node, no wrapper node and dwc3 child node please unless you have
> actual registers for the wrapper. Based on the example having the same
> register addresses in both nodes, you don't need the wrapper.
>=20

Noted.  To remove child node in next patch submission.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - resets
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/reset/altr,rst-mgr.h>
> > +
> > +    usb@11000000 {
> > +          compatible =3D "intel,agilex5-dwc3", "intel,socfpga-dwc3";
> > +          reg =3D <0x11000000 0x100000>;
>=20
> You really have 1MB worth of registers? That chews up 1MB of kernel virtu=
al
> space. Not a big deal for 64-bit, but it is a problem on 32-bit systems. =
Define
> the length to just what you need.
>=20

To update reg length in next patch submission.

> > +          ranges;
> > +          clocks =3D <&clkmgr 54>,
> > +                   <&clkmgr 55>;
> > +          resets =3D <&rst USB0_RESET>, <&rst USB1_RESET>;
> > +          reset-names =3D "dwc3", "dwc3-ecc";
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <1>;
>=20
> BTW, this implies that you can only DMA 32-bit bits. Not sure if the
> dwc3 supports more.
>=20

DWC3 supports DMA 64 bits.
In properties address-cells support value 1 and 2.
To update example to indicate 64-bit DMA support.

Thank You.
Adrian Ng
