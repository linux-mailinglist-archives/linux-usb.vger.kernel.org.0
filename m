Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D80694E91
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 19:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjBMSAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 13:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjBMSAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 13:00:38 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E4A1A671
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676311236; x=1707847236;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JUVaSoGhnDTc9tQDCnMbMXu0e7AIEg8scwmLsyyhubY=;
  b=WUQ9EHUpHXjOzuEA54qipdfzXviGv2VkLF36iwn6qRyXFHySJtWudwON
   Bd89sVanf4z5hlQhhXr0kGPEJiPk5EABKxTtPRnlDUlg/P2AUYEXhtzS+
   pEc41a/5HXQx19Kk2j1MBWhE9lIcK6FuFYkqKOB29pTK18WVLtuS/UT4k
   aoqaU+N1O5Z7qy0l4o7+zDAY7nODny2lTki3G2LdQfUtU8WJczevDKc/0
   rwQf7HI1OfUuXWmu3prVsR+RN0PC3mbwOyRU8P8YBI8SW9/ENeygsK7Iv
   enI/MhP69fGWca2S1JzU+ijEKKUJ4e8S9sQsUEHjdLn+B5AKZsekV5hYv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395564694"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="395564694"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 10:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="842849802"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="842849802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2023 10:00:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 10:00:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 10:00:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 10:00:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htl5za/C2ogFsMqAAnrpV/Wu6oroHSGc5wUx5SnH5pESlPvhOVIR/JUZbHl1hPmDDlUUD7ZpKsm5am3wYmKrU07LBkbptLdaErj1mNmnC1R/FIeEZNLxmnVnF9EHtTEWWifGk8hoaLFGEBZ5kIhJ08X5tzCNo46Btc2mowJml9YBnmLm1Y3mGKe3N+X9pGiBgzQG6Rgf+MZ6X/id7xhjtktY5NfvSr9iPPMtk35q7V6DeSvciORHpWgx97kSjQpaamEFGukReJHe3q712dd7QcYOkeWI1u7HyTTXJd7ATmZy+HSDZBTq/qMqqsetMqR5bkm0ycjus5h3bveau79Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfmWocpYcCQzuQ7qfXBerQVqJTUB/gZhAWgsw/nldiM=;
 b=kj8VvCMcstrnbpAP5IoXDtXaDU/a+oSngj9ZTIUxGvWxOJA/+/dQ9A2Y6gShTDVA+wX3m+lQm3VGq3VPyueMF+fwduQMDyjH/wipNHsbaTWBmnJ9XLjJRrwmeaYthsTzrQmCfWamecG8hEezY73LfUt5NMeHdb1THOoeXaBR4erpn/ZKnHbSKddqCu+RBZojqpjcdbsVu7CBCbzGP/3RAzI8jl7yyI6uAjlBeQskxgDa8wEHt++mY+wIImUbewP+XyxXGId7dBy4SFmQL/RlOX9vDIwcqsNqfWuhrzCR7J3CHw9q0RC4TFAGvBx+Lt558/8Z6gl6ZA2MeQGFa3vKDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 18:00:31 +0000
Received: from DM6PR11MB4612.namprd11.prod.outlook.com
 ([fe80::9940:2378:811f:fecd]) by DM6PR11MB4612.namprd11.prod.outlook.com
 ([fe80::9940:2378:811f:fecd%4]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 18:00:30 +0000
From:   "Gopal, Saranya" <saranya.gopal@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: RE: [PATCH v2] usb: typec: pd: Add higher_capability sysfs for sink
 PDO
Thread-Topic: [PATCH v2] usb: typec: pd: Add higher_capability sysfs for sink
 PDO
Thread-Index: AQHZP7NZ73097gk6oUqt9LwO0exn2a7M/cuAgAAl0SA=
Date:   Mon, 13 Feb 2023 18:00:30 +0000
Message-ID: <DM6PR11MB46123516D600B54C21880610E3DD9@DM6PR11MB4612.namprd11.prod.outlook.com>
References: <20230213140522.171578-1-saranya.gopal@intel.com>
 <Y+pVDx84luyrJJv0@kroah.com>
In-Reply-To: <Y+pVDx84luyrJJv0@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4612:EE_|MW3PR11MB4569:EE_
x-ms-office365-filtering-correlation-id: dd49c7f9-8c77-429f-d69e-08db0dec3231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QTskvXMsPlRJuwLwsUkC+OqIuCSRFptiYVg2UzI5Qlcq0PaFuIV8r0SSYz2B2MhQGb0U55Hlb9v2P8tcPieLGfYs3BHF5GHESSsvU72BB2L5qRu4cuxED5EbPHzm4pXaO/E+csOVTQyAsgzK2cHKdlLwP6sQMPkvN4Oh2o6+tA8crZpE4BbTK69UjdLjSMyHkkx+OyEP5QJcJVejHR21m+pQqVwoCh8cSlSeuiD+Ym+0JQj8d2ZNYwcDIonoxj2pGnTDorNJnCt2mzpqb2N/d5juDACL3LThClDJjNeRMjU5mYer9i5opTUe7VEmNEz63O8+TLVeulOFKQuuhdYJCTrs3m412TDq8vcGJvWQsUsZ+QtUBxQiUHqdTMWTxUtMt8B8B/36hEvIGZUxwKyvSHbpRVyBMq5AipIW9UMhnPTk9cE7Yvv3ZZOoH9F9EXF6Qo7G3roP5KOa+qxvt8iBmQKj+ej6/zIuQ53VB0SRkkjivNJ2wA16rpc79QVAKG52gsxLdwIzzu7S9d7seAXYq1EiLTMpl4kmCCjXUDq5cuoLIWfnKx8eCWxzoHgNpKP6WUP1KdelESfmPzc1KkEuhp60XRMVyvozg7dpPIqaPvEHKHpXlJpK1oe+5BkoNyUrutpwNSUufhxnAnv0E/6HnqKtW0awikpcfz/qq1Lo/O6uOoGdLBxkd4PjBxc0840YHWjJ6X2nLh5Ofl5VS7ndbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4612.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(7696005)(83380400001)(53546011)(55236004)(26005)(71200400001)(33656002)(2906002)(6506007)(38070700005)(38100700002)(54906003)(82960400001)(64756008)(66556008)(66446008)(66946007)(76116006)(6916009)(478600001)(8676002)(66476007)(4326008)(186003)(9686003)(8936002)(122000001)(52536014)(316002)(55016003)(86362001)(41300700001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5cQ5/vW9Mh6dms7rQ0KF1Wib4YDEkUUCXnorN176PhuJtYsGY+BNjV3GG5dH?=
 =?us-ascii?Q?MmiaKxNFrRLXjOEbNvqHOiYKGqZmlPTW3UuOHSlNdJWK6PWN7KLfQ7ypfCe9?=
 =?us-ascii?Q?1W8MRjPqc+36yMA0q8J22mfbnSvaBbvyECVHXa+aluMYmPRXSF5wO7e3xeCw?=
 =?us-ascii?Q?OooKoPk8KNvgKsrS/0vmYrX0jeN4KsRbfN6AYv/9cwGJR09cfWnCT3P3d9Ap?=
 =?us-ascii?Q?Zgs+DU96N8gHdk+ZQZZ56aVQa2wezCsFS3x/x4aQeiVdfXKhJHKPp/0l7qvX?=
 =?us-ascii?Q?tza3iZgn8ZC3RGbCjLBU53yM3AQe58rNBho6/FV6jRLJ/Hap6QmseoR3JlEp?=
 =?us-ascii?Q?KrZq6/rlSVV2SGO7ZneCKBI2WgeTI5FK+Rr1UN1xmULZh3EoCXUdvBtpEzj4?=
 =?us-ascii?Q?XV0WcjTOZgC1wjObt1Br+ktwu+gpHYALqQsLXOmYSbD3l8LCmNYITYv288zq?=
 =?us-ascii?Q?E8YJXH2nlnjrCeG1iAn02OPO8rVvu/QBZzF8KPj8zZ4ZH2eYULHSVS6PgTJL?=
 =?us-ascii?Q?pJOC4Sik38sGikvfvQ5kW/fesNXHtRg6KacMhoeX99yMEs8XB1+A6yccJZHf?=
 =?us-ascii?Q?OEI3tHkutN8B+EklA0Hwp09VtPoorOSJcMhyZk9xo0S1/ajkRdhxF0zSMhbU?=
 =?us-ascii?Q?Yef5X8gffkv0hwqTTVtPpE5h+T0unufgxYzT816Fj24uhiqjMdAzYndzRGIv?=
 =?us-ascii?Q?fQgSvreHzPebSOg9bEZlluJcaOF2DGwsTf4SQ+BjCU056KmvMk43QqbiW5je?=
 =?us-ascii?Q?awOOPTCCN64f/38qYeb/Y9aLr3ECTAuAyFHliVTbeJqNiUzi6IUBjFe41IJ7?=
 =?us-ascii?Q?xg7zYtWH6nbvek2yL3jnPDUlI2TQQ26/YnbTaV6yD/29buCKFnZjNi0q4wwK?=
 =?us-ascii?Q?WOtq5qD+NTqT5nu+NUhd5privbqQP+6mzB4eRugedEcziOLfnK2eKk9pMIUX?=
 =?us-ascii?Q?x61pkjSq3hZOBpax4xUzS6P3Mw696dyuIZlkd0rrNiD3g49ESQhh60GOswNX?=
 =?us-ascii?Q?uQ5zWrRcdMnkjI9+GQ20Nav9N0cl7kI6KYhdjgzMrGJvDc2WOMbMp+oMzUG1?=
 =?us-ascii?Q?nBWKfkU5trDH6BQoNZjZA506BB7TgkpN9nQv8GrV1gqCx+D8iz7g5MhUcgvF?=
 =?us-ascii?Q?GVY0s3QCoPJ+9W4ecA3xxlAEZ9yJf1L1mCwnnEmJufigqdf+wizN/Vjlw8K9?=
 =?us-ascii?Q?vm8iA+uFATtYPh8ii+BFsuZH3tAFotDLIKhn3n4qDUpgmZ2D1h/wxYFKaTbF?=
 =?us-ascii?Q?WvfMpIVm1cWfCXCQcVBU7JxgMbJ9MOyR/elj8BBWgjphkFJAnbctlNiKj/++?=
 =?us-ascii?Q?iU7j3CnnEdcAxDi05l22oyhInQwpkucblqSZdiA7AhqHExxptTyC8TNkB4qy?=
 =?us-ascii?Q?FyjDO528r0PfVt0heDOJCpounyws+ba/3ukr1TQB2MTfaFU0mTBupgDK2iLU?=
 =?us-ascii?Q?HOrQxwYuOnZKdsjGXm5kJ84sOqEJe+ag/pyTZg9ZstxqfBHK7yoLKdGBkz3O?=
 =?us-ascii?Q?NGn5wQj38CpYxjRx8t1Id/QOqyXJS0Puwjvug/CnxEaBHUS1vF82ajNR+47F?=
 =?us-ascii?Q?ObLCK3SNB8YWZtmojtmUcXDOU26sIQn4e+AB60fF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4612.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd49c7f9-8c77-429f-d69e-08db0dec3231
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 18:00:30.8470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NaQ6ifqu+nSFcSKWYu2z43MY/wytGHrQqYJTCziIwtugOugMrUYwTfesuBozJMRPSxBI/47W6SBFDXwuSSE1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Monday, February 13, 2023 8:50 PM
> To: Gopal, Saranya <saranya.gopal@intel.com>
> Cc: linux-usb@vger.kernel.org; heikki.krogerus@linux.intel.com;
> Regupathy, Rajaram <rajaram.regupathy@intel.com>
> Subject: Re: [PATCH v2] usb: typec: pd: Add higher_capability sysfs
> for sink PDO
>=20
> On Mon, Feb 13, 2023 at 07:35:22PM +0530, Saranya Gopal wrote:
> > As per USB PD specification, 28th bit of sink fixed power supply
> > PDO represents higher capability. If this bit is set, it indicates
> > that the sink needs more than vsafe5V to provide full functionality.
> > This patch replaces usb_suspend_supported sysfs with
> higher_capability
> > sysfs for sink PDO.
> >
> > Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery
> from USB Type-C")
> > Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > ---
> > Changed from v1:
> >  - Added the valid values for the sysfs
> >  - Wrapped the description alone to 80 characters
> >
> >  .../ABI/testing/sysfs-class-usb_power_delivery        | 11
> ++++++++++-
> >  drivers/usb/typec/pd.c                                |  9 ++++++++-
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-
> usb_power_delivery b/Documentation/ABI/testing/sysfs-class-
> usb_power_delivery
> > index ce2b1b563cb3..1bf9d1d7902c 100644
> > --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> > +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> > @@ -69,7 +69,7 @@ Description:
> >  		This file contains boolean value that tells does the
> device
> >  		support both source and sink power roles.
> >
> > -What:
> 	/sys/class/usb_power_delivery/.../<capability>/1:fixed_sup
> ply/usb_suspend_supported
> > +What:		/sys/class/usb_power_delivery/.../source-
> capabilities/1:fixed_supply/usb_suspend_supported
>=20
> How does this relate to this specific change?  You didn't mention it
> in
> the changelog at all :(
It is related because source PDO still needs this sysfs.
The sink PDO needs the new sysfs.
I wanted to make it clear by specifying source_capabilities here.
Sorry that my commit message was not clear. I will fix it in v3.

>=20
> >  Date:		May 2022
> >  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >  Description:
> > @@ -78,6 +78,15 @@ Description:
> >  		will follow the USB 2.0 and USB 3.2 rules for
> suspend and
> >  		resume.
> >
> > +What:		/sys/class/usb_power_delivery/.../sink-
> capabilities/1:fixed_supply/higher_capability
> > +Date:		February 2023
> > +Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
> > +Description:
> > +		This file shows the value of the Higher capability bit
> in
> > +		vsafe5V Fixed Supply Object. If the bit is set, then
> the sink
> > +		needs more than vsafe5V(eg. 12 V) to provide full
> functionality.
> > +		Valid values: 0, 1
> > +
> >  What:
> 	/sys/class/usb_power_delivery/.../<capability>/1:fixed_sup
> ply/unconstrained_power
> >  Date:		May 2022
> >  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> > index dc72005d68db..59c537a5e600 100644
> > --- a/drivers/usb/typec/pd.c
> > +++ b/drivers/usb/typec/pd.c
> > @@ -48,6 +48,13 @@ usb_suspend_supported_show(struct
> device *dev, struct device_attribute *attr, ch
> >  }
> >  static DEVICE_ATTR_RO(usb_suspend_supported);
> >
> > +static ssize_t
> > +higher_capability_show(struct device *dev, struct
> device_attribute *attr, char *buf)
> > +{
> > +	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo &
> PDO_FIXED_HIGHER_CAP));
> > +}
> > +static DEVICE_ATTR_RO(higher_capability);
> > +
> >  static ssize_t
> >  unconstrained_power_show(struct device *dev, struct
> device_attribute *attr, char *buf)
> >  {
> > @@ -161,7 +168,7 @@ static struct device_type
> source_fixed_supply_type =3D {
> >
> >  static struct attribute *sink_fixed_supply_attrs[] =3D {
> >  	&dev_attr_dual_role_power.attr,
> > -	&dev_attr_usb_suspend_supported.attr,
> > +	&dev_attr_higher_capability.attr,
>=20
> So you deleted an attribute from this device, ok, but again, I don't
> understand how this is considered a "fix" other than perhaps the old
> attribute does not relate to this device?
As per USB PD specification:
28th bit of the fixed supply "sink" PDO represents higher capability (wheth=
er sink device needs
more than vSafe5V (eg:12 V) for full functionality).
28th bit of the fixed supply "source" PDO represents usb_suspend_supported =
attribute.
Before this patch, 28th bit of sink PDO was wrongly representing usb_suspen=
d_supported
attribute. We had to add the new attribute to correctly represent the 28th =
bit of sink PDO.
Does it make sense to add fixes tag now if I add these additional details i=
n commit message?
Or do you still prefer not to add fixes tag for this patch?

Thanks,
Saranya

>=20
> And if so, then make that a single patch, with a Fixes: tag, and we
> can
> properly backport that one, and then have a second patch that adds
> the
> new attribute.
>=20
> Again, adding a new attribute is a "new feature" not a fix, right?
>=20
> thanks,
>=20
> greg k-h
