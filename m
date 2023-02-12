Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2643969385D
	for <lists+linux-usb@lfdr.de>; Sun, 12 Feb 2023 17:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBLQNb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Feb 2023 11:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBLQN1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Feb 2023 11:13:27 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92B611EB4
        for <linux-usb@vger.kernel.org>; Sun, 12 Feb 2023 08:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676218406; x=1707754406;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/J5+jvs64oNUC/alJtysu2uvrw0l89QoOPEXejC68CY=;
  b=SqRHd72KVEHELiiLofQIn2GjyDgyXQIQXhOHFPzk5GQ0Uw6dsDdlNAC/
   AYBdK1WX+ienR8LRq6S4fdDPDrrqSPaUPnizPMXIfhD90yazfvbkI2eAX
   gWjByyIUUOq2pzR3ctcHpcTm/E3Dd+HxZ9EmXNCidzBM9gCrMVMJfnMPa
   m/0lBHxySlNlGzYZKDDq2nLVUWyAntbjPu1Ww76tTff+azevi669Kng+d
   a1uVuKYBO8qmvaWCMsAw8uhgi2s07c2mx4kWZ0nmIkSDjHA6w0+erl0h4
   063kkPgOF8tVHEUkaPeR6vnY9yYMAgnKL4mfaGlOo7MTN5CYu2w4aNpWq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311089146"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311089146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 08:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="777538596"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="777538596"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2023 08:13:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 12 Feb 2023 08:13:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 12 Feb 2023 08:13:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 12 Feb 2023 08:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqenkjTGTqjK8klJOFPcZU0ISTKuqtqEfgZtrpXWHAF8Y/1OAdTQ0m8/gQL3vTXMdMPC10sxcJhA6XAVm9TKxTe120vW5lNz3VEkiwI1/K1kYdOfrLpY4OFAv5y/9cBkypDLnmx/VUPJNNUNte5crXeoNxEihyiFmmxmsEXfKgogJh7QYLxX7RwhVcnmsWrbh5Hd55cc2qfTGJ+J0S3ywde7tymj4/3+kdj8XbWAVEr9n1YMCBW6oAZ1cwI57+VPBjmtD0j+9kuxn6Ad+62UfWfWIPG0yMKKLjJi42wc+XQYnlWfIoURi1iEg2s6AChUK1kpS1VFXLCrpMauD/kQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxzejxCV5s6e2D4mGXx4FPIEcWrDM5Dy68Y4q5peFNM=;
 b=mnDG/1K3U3NH6wooSd4AKOHqweO3kwva/1SzXqetVykzW8wz/JYB3m8+/FxEccpL9IcFUlVGoaO6nMNwGefuJyxzfE9eRMlRrT4TJ4FLijtMqwp6GcM+2plpzoHB+FIiGPlzUIvNwEVbSwu3gxx1g/hp6bkIy/LIsgdEQMKJZ61VI4NVpeXaauisIPscR9/NFy5uQEd2upQuvgXYVStdsICakDh50lfSca3miLhEVonlHO7iQ3SVb9Xs+wt/oXKAtxnK0dw/kfi30INwqN2eOPWzG8sUEXpAxrz+Iyq4R4tsziI3bklE9OoFMp9Ippc66+HEbbu5+0OiPbN9qyM1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 16:13:23 +0000
Received: from DM6PR11MB4612.namprd11.prod.outlook.com
 ([fe80::9940:2378:811f:fecd]) by DM6PR11MB4612.namprd11.prod.outlook.com
 ([fe80::9940:2378:811f:fecd%4]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 16:13:23 +0000
From:   "Gopal, Saranya" <saranya.gopal@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: RE: [PATCH] usb: typec: pd: Add higher_capability sysfs for sink PDO
Thread-Topic: [PATCH] usb: typec: pd: Add higher_capability sysfs for sink PDO
Thread-Index: AQHZPvAvkPng+34pLE6mLO0hztZYCa7LcSmAgAADRdA=
Date:   Sun, 12 Feb 2023 16:13:22 +0000
Message-ID: <DM6PR11MB4612E727FC1991BCD27F593AE3DC9@DM6PR11MB4612.namprd11.prod.outlook.com>
References: <20230212144838.128595-1-saranya.gopal@intel.com>
 <Y+kHDxDaHnXMPdfL@kroah.com>
In-Reply-To: <Y+kHDxDaHnXMPdfL@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4612:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 0d08e77b-f7ee-42aa-c23f-08db0d141042
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qc2DKFmhiMGcpmwpcZWpts5+YmB9OdIJyXLdm5gWpK15x3cq++2/QtiPpJpSH/YBV+zegzMSg5ZL2pKjsiqzxHOhBkWaRt4FYnOVXEZK2CCakCNeet8L5ESqrEz6Vg52qi4ib6R5yl/nVJd0lsYUfiA9fp4LUUyBaouF8XQLf6Y9i1pRTvP+Euck3hfjveyyhXo8/kYQ0UWu8a3DNMT4DxVrRojixfjLoPygdU4CYuriu0+PTXROBzDidtciTidsnyHXvvcr8ATzimo6AspbC3xQZNabBbuSGbJPr/KPEBN2ttHt3mjyuRqrStt/U8oIILVg5Gdlbseh7yMyGZi1tvfkytuY7mDt2f9xVC06vUoFnqx/6H28BXO1rm+SakwTY+meLnrDvRRgCT6kQF/NYpRglivc3Bn7lfRfzz+SS5Ge5CZP2FhUg6RGQTKc8dBCug9Ofxv+9D+rTL3x4ZI+PvPFa6f/bUIBzV8X2tOT787oZ9vR1EaDw8sV1mqikBA/RC5IF1AldeoLOfvDPwS+RFq/LhjBkE9QHZAF0HRcNzFKfJwD7Y4c7hQthgmKUV7dgfCnBolRn5r1Q8fiLbJ1KiGEg+qWw87Ejqwcb5tp1W4BzPRF+YBR27LrpuU++C+4XMvCyVPcnwmbXSWGI9wlnanwenSO6bo/1UdHyYvsCXuKFwjO35NvWOFh9OsZ/LMtaW1eatXy8UrJ4mIkdfSTrdGAiu1H5jmbJ1S3oSxw/N0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4612.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199018)(8936002)(2906002)(82960400001)(38100700002)(52536014)(33656002)(55016003)(7696005)(66446008)(66476007)(66556008)(66946007)(6916009)(4326008)(122000001)(64756008)(8676002)(41300700001)(76116006)(5660300002)(38070700005)(86362001)(54906003)(9686003)(6506007)(83380400001)(478600001)(26005)(186003)(71200400001)(316002)(53546011)(55236004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nYIwXAtSYSECc4U/rxTbYKAl8Tr3/vGakqjTJrSsPcVv8vQvmITcYeyFqAuw?=
 =?us-ascii?Q?cV3zI9YQIUKRo/mv9+6N2WaUbFdChZimPp/uvXSPHAgRr1juo1H+XVI+NsDF?=
 =?us-ascii?Q?qxB5SW/1D/g9Z1+TzQ12nXus7mZRBVbUac8OjfZfA9PFflgTCGrXyXQcBeTd?=
 =?us-ascii?Q?jM5tXIEkP0EEsPLuKsI3TM6tXF3mznQOvUUhDRQNjf2vb/pBTo65UV4uODsN?=
 =?us-ascii?Q?dPLk0YrsHw9vScSjQPYNBf8Gdu2jj7kIC/slobsgtf+uGmh4SItvIxbK69nT?=
 =?us-ascii?Q?xYbEpsufaLWX0F0xaCoz0GfGrz/U+waATEaIp5L5oyOAjo1/Fc0jRYrZXJJS?=
 =?us-ascii?Q?0KCWaC3rftBKo2w6Pdse7K3YWDTpWW6FdmZvvChMArwnBCCQvs4BrPuABE0g?=
 =?us-ascii?Q?l86AVJPDVAU58udEpqU+5JHG0iURfIoAaqbDwurJTKf2Fflw4GUzy4tN2U9U?=
 =?us-ascii?Q?tKSPp6iBrVN3aZvbd6ODNilGEv5SMFhVkaFF1VkxEv07r9JopWW281BLqxIG?=
 =?us-ascii?Q?R+dRRwZ/RnKPN80m/6CwnIzCHUcZDCAfF86GRKRH0XDEpeS6T1GzQBmL0Jho?=
 =?us-ascii?Q?OP+aYvli//IIhDzsYECCJ2uxLSA1e0lP+119GsD+Asa1P1rr7fn7T72rmj1L?=
 =?us-ascii?Q?fgqvsGSOaYdsqeWldzv/oolcTY/sALmWT2I+N9zGVB04YXuS7zNoDGPxs3Zn?=
 =?us-ascii?Q?aFRlzOnhdE7oglSmfZ/kT6yyY9zDvglRpJ0RMA0LKMOQWPaXlzw3OS0jNkcA?=
 =?us-ascii?Q?9wS7GZR2on/CjWHbG+hQI+Rizza8Rmyno/rnkLxqHKZtrWpWm3TveXJ5SN/u?=
 =?us-ascii?Q?0HStYrHrxF+mwc5vZwhpMpFjSTrd2S9kQ5HR9d/CoyKDi6M4+j+Fxe8mQZVw?=
 =?us-ascii?Q?q0Ww0nfgwakt1q8mUd3zLhhW13P5ONnwK79iS+VPdT7BBppo+9IZeklEmv74?=
 =?us-ascii?Q?JhASOj5lteDKiD5YJqxml6kJzTPUWxWRcHSqWiPSIk5rADJ6pWuSYoo8BnOW?=
 =?us-ascii?Q?mgQu1gNgbuO4CxTjQ7Z1P61UnLN6teyBCDremZb3FZoWMsY/I35FhuT4Bdek?=
 =?us-ascii?Q?a4ON7G22UxsnOSUaEkVKz04oEP2P+JpvrIQxB4zurOZjkX9vAYSyI93dx07J?=
 =?us-ascii?Q?xkM01S7CzHAcI0WZeG7ylfMgWCEQ+vVf7Tr/RKLrktPudwOclURNGzPrun03?=
 =?us-ascii?Q?DmM3pUVcLqSSeasiK5WqAI3DZ4LsHEPin3TMlIWJMrJc0CkQIS4mNAh3PCFy?=
 =?us-ascii?Q?ZfajqZUjBY8CJC93E5P+UsGZqGNUVnHHpuKgUuPHLJLG6r/VbxJcgG/OeF2d?=
 =?us-ascii?Q?406GAkTIR2zNWrJvZ064OT3tSg+mrZYsrzAELIT6Czo4LAL2YzJIG8IjfIUB?=
 =?us-ascii?Q?l9+gGFxrUeDBeNx+J5cxykpRFaZL9oC91+hVs7DoCjKQnJyheUsOyU0d5gRV?=
 =?us-ascii?Q?58BGhg+YLPU3vwUIRs2cgCe3XzH8dPyQG3KB/YyZz6ruh/RZAcsf9V7qHVwI?=
 =?us-ascii?Q?qY3N0RbvfjV/kP8MmX8CJvUhCyKb7OIp7jggrSShstJ+praV7u+ugXh7gSpg?=
 =?us-ascii?Q?fAMhIE2B0NeHI/yzqp5mjocmTeW/3k1XC5EI2MWn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4612.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d08e77b-f7ee-42aa-c23f-08db0d141042
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 16:13:22.5749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFO5FLUsL3Ixgtv71k1/aftchJp/j+gnSHqq1KJbojdXaMqN1BvUSoLH4vXfgKRWUyLqFMulgfrrM1wwIT9fZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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
> Sent: Sunday, February 12, 2023 9:05 PM
> To: Gopal, Saranya <saranya.gopal@intel.com>
> Cc: linux-usb@vger.kernel.org; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; Regupathy, Rajaram
> <rajaram.regupathy@intel.com>
> Subject: Re: [PATCH] usb: typec: pd: Add higher_capability sysfs for
> sink PDO
>=20
> On Sun, Feb 12, 2023 at 08:18:38PM +0530, Saranya Gopal wrote:
> > As per USB PD specification, 28th bit of sink fixed power supply
> > PDO represents higher capability. If this bit is set, it indicates
> > that the sink needs more than vsafe5V to provide full functionality.
> > This patch replaces usb_suspend_supported sysfs with
> higher_capability
> > sysfs for sink PDO.
> >
> > Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery
> from USB Type-C")
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> Where was this reviewed?  I don't see that on the list, am I missing
> it?
It was reviewed internally in Intel's internal mailing list.

>=20
> > Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > ---
> >  .../ABI/testing/sysfs-class-usb_power_delivery         | 10
> +++++++++-
> >  drivers/usb/typec/pd.c                                 |  9 ++++++++-
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-
> usb_power_delivery b/Documentation/ABI/testing/sysfs-class-
> usb_power_delivery
> > index ce2b1b563cb3..59757118b6a3 100644
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
> >  Date:		May 2022
> >  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >  Description:
> > @@ -78,6 +78,14 @@ Description:
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
> in vsafe5V Fixed Supply Object.
> > +		If the bit is set, then the sink needs more than
> vsafe5V(eg. 12 V) to provide
> > +		full functionality.
>=20
> You don't explain what this file will show.  0/1? Y/N?  J/N?
>=20
> Also, properly wrap your lines at 80 columns for documentation
> please.
This sysfs will show 0/1 value.
I have tried to maintain consistency with the rest of the file.
(https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-usb_power=
_delivery)
That is why I did not add the 0/1 value and also did not wrap the lines to =
80.
I can fix these in v2 if you are not convinced.

>=20
> And adding a new sysfs entry does not "Fix" anything, why is this
> tagged
> as such?
Sink fixed supply PDO wrongly shows usb_suspend_supported sysfs instead of =
higher_capability sysfs.
Sink PDO does not have this 'usb_suspend_supported' bit.
Only source fixed supply PDO has this bit. So, this patch adds higher_capab=
ility bit support for sink PDO.
That is why 'fixes' tag was added.

Thanks,
Saranya
>=20
> thanks,
>=20
> greg k-h
