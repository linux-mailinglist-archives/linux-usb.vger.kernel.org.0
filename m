Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD211B5320
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 05:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgDWD3X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 23:29:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:48893 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgDWD3W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Apr 2020 23:29:22 -0400
IronPort-SDR: 0wKB8OBx9j+UssLnHpd/wi2WVv6JGqosFAjJJMFtiwW9PR/TnOTc+00sulOxTRidkHbva4c+Il
 Hau2m1JgCBzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 20:29:21 -0700
IronPort-SDR: VpSUxslH9ZGKTd7bklropK9H2MBtHijHwFnI8Ycv99ZAVn3O2nuzcnuIrofbqcFL0mUOnbVDGB
 J/5QPu/EtQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; 
   d="scan'208";a="301102138"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2020 20:29:21 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 20:28:50 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 20:28:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.55) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 22 Apr 2020 20:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1sfqwfxXg/He7q91Bk7hI2dZeW1cNu1MCqBCrzPNPH1aVB0MCpzdf9FcgeUF91Rhe5c0GA6ZVdTP7Yn9wQbBFUj+qWWyFa/u0O1zR9BvZvJqnfJ+Y08Z7nZaCxZQw/bwY8ejevM1doS08IjzLLofSR5U25JrpzQ9DKFKjoCSsXAPnkvN1IhduzwF37+YY8OCM351938sD8iGkACLZr0JSIVIeg92d2zFVWbIppr9Y3zsfkumE52Od9k3UYJLrphkQylTZVJQQrZ10vPR7FP0CuZY3gRa6yREiJAOGQ4oz2RtpEhyGOcgsnJAKOIc/7tHT1sC1f6VpAgmMQEoeFZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b86oV3h5BnD0Y2bU01WaWEPqlGE/JtiIuKgLsq/4bP8=;
 b=FfNTLjq+nHUVhO/cK6vxp/N0ynxXDzNmK+gxtTN0MaGzwHlLVAWCxuiNMqodjXkuvNmI3lpRPYGQ5u0e6Wm5N9huAkKkWm9TPL1DSq1FrmOcP7YFluAAF880nHu+Lsy28d20HmTUWikhBgaWIscRSCXBxZhCVIcb575Nfa3Cwp3Ylpskqh7AdFgVpS49F3zIFb1Y3LzB8tC7k8eQQ3pi1pErCBpepkpBO6nchlCfmARAAigp7CnHvJ5uKS8QrvloCqMSlGAVsh1OjEsv+E/twW6NaBBS8UqKE2W0pI+FkCddeHypiHVFcbS0CVn9j/Psk8/0OK091iWi5GtHS+W+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b86oV3h5BnD0Y2bU01WaWEPqlGE/JtiIuKgLsq/4bP8=;
 b=mjFLiki5xI1l+7oegeOQ9MzF8y/TGGF+BNvQaQXu1LL34gs65497r2wzfrDzNOcedp1jOb3rZerXngTZ69xwsZyWG0dGeEo3ucezkIGasC2JhoKFVu5HDEvApmzSC8Awrx6Qyd77pN3hcGzHFWIM+P+XIVZC7eJzgNnOPzAaGs4=
Received: from SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32)
 by SN6PR11MB3486.namprd11.prod.outlook.com (2603:10b6:805:c5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 03:28:32 +0000
Received: from SN6PR11MB3245.namprd11.prod.outlook.com
 ([fe80::875:de1c:e14f:34c4]) by SN6PR11MB3245.namprd11.prod.outlook.com
 ([fe80::875:de1c:e14f:34c4%3]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 03:28:32 +0000
From:   "Gopal, Saranya" <saranya.gopal@intel.com>
To:     Sid Spry <sid@aeam.us>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Failure to Assign UDC to ConfigFS Gadget
Thread-Topic: Failure to Assign UDC to ConfigFS Gadget
Thread-Index: AQHWGPHM9hzzWNqMuUqnz4/7GNK8Z6iGC5nA
Date:   Thu, 23 Apr 2020 03:28:32 +0000
Message-ID: <SN6PR11MB324507C7828C86B7460EDF11E3D30@SN6PR11MB3245.namprd11.prod.outlook.com>
References: <df1fe132-79ac-4656-9ddf-040e26f11c28@www.fastmail.com>
In-Reply-To: <df1fe132-79ac-4656-9ddf-040e26f11c28@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saranya.gopal@intel.com; 
x-originating-ip: [192.55.79.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae35c41-f4ae-4d32-36dc-08d7e736664e
x-ms-traffictypediagnostic: SN6PR11MB3486:
x-microsoft-antispam-prvs: <SN6PR11MB348665F789DCDD8072480913E3D30@SN6PR11MB3486.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3245.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(376002)(396003)(39860400002)(136003)(366004)(110136005)(66946007)(81156014)(5660300002)(8936002)(316002)(55016002)(9686003)(186003)(71200400001)(4744005)(8676002)(33656002)(86362001)(2906002)(64756008)(66556008)(66476007)(76116006)(66446008)(7696005)(478600001)(26005)(6506007)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0eUjUS76mmX6HjhQdijv5pk0cJHGw1afF53CHTYaIUHO8BunnBXkPyQuc7GCYcQfuy5oOe6JdlMpmiwpJwC08NuUjW4m6iUOBUsllJKti2412BpOfRvf2LDSSPBR+5UkCnTyYQcTNHX6/SqEA8CG0K7/Q5qKgxiaFF7frEgkNxCwK4RhhEFrNAtWPC2n2NEWTxgYWChhHbFC1iI+XJqw8/LqIMgNDP0wAx8CzK0bf+w7LaxOtag1CiUJhVDIuBhjE8M9x12NZV8kVHRlkrcqommeTvS/PVfVfyXMdtYW2RmNN1UZhM8JOB/prjM0Ko17SjuBaluq/5AK280ZdXmWKBFNkAk9IB3nxHhi3f2GCBZWp5EGjpa38B0KHIVuAH9tTkj6thoXgk83NRq6PGGmiOemsmfS9YTMcfsRLFuSel2r07zfZ7A4bitLkFxJTOA1
x-ms-exchange-antispam-messagedata: W5vmPhwYL+858rGKhmy11Qm4axABJGS6trU8aEftEY4OX43AMZTI1qoHBJElqkucGfvhZzaKOSb4+6Q0fLhc8UOCYldO6JeW+DJ5sM4ds8H8tXm4gG6QIbyEratEqxCodevHnde+46sTZDWB062iwA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bae35c41-f4ae-4d32-36dc-08d7e736664e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 03:28:32.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEx/8IrycVALO2ANnJuEYUGYWt0LEcFthTu+4GQ40AhwwuQq+JFzdXyo1tjd8T+aeC9Wee4nxWnN5GPO4Sz7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3486
X-OriginatorOrg: intel.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid,

> # stat /sys/class/udc/musb-hdrc.1.auto
>   File: /sys/class/udc/musb-hdrc.1.auto ->
> ../../devices/platform/soc/1c19000.usb/musb-hdrc.1.auto/udc/musb-
> hdrc.1.auto
>=20
> If I try to assign the UDC using the string 1c19000.usb I get:
>=20
> # echo "1c19000.usb" > UDC
> bash: echo: write error: No such device
>=20
> It's at this point I'm lost. I appreciate any help.

You need to give the exact name of UDC as present in /sys/class/udc.
So, try this:
echo "musb-hdrc.1.auto" > UDC

Thanks,
Saranya

> Cheers!
