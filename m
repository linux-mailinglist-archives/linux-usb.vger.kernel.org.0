Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAE2427788
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 07:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhJIFeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Oct 2021 01:34:09 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:53280 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIFeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Oct 2021 01:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1633757532; x=1634362332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+IbcSvlxfV0fWXuw25H/RFRRl9+Ain7F1/UhA4HrgJ4=;
  b=P+JQ95lY7CkTAhKlKcA/wsXdQ5KFBusH8gl2or3AuSNwOvUkNzuK5O1L
   ZqTXkmVDpNgYbYWOfTgaFJ4/fKZIrBreFlKVPzgwPUO7j+eaRVe9kaLMi
   KdZ7+10VzePl0j3ROcpNkS0vOAv1qJMnbrkJ3VpBEsIHuV0ZcNQbYgjEz
   I=;
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2021 05:32:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvk2Tc7j23/w2Q5hXJqwvwSHCOw5uoTB9B9ll+mn9ddhDFCAZpVR+wQUs8FAU+zbZRZ1u/bE9DQZROi1MFqE3AQIqPPhebHhuvQv0Nr1KGPEg6Ju4lQY4dWbjqbYD0SOecjqf+Wo3287Ia6+DxgJ93rfdYm01Fy/Qr4FwFtfmrJ0RGcs/hZt2cY1bq/NPKk4EbVpwwJAtWAGx4kna2BwtZkgbq0LTk7dMJAx/xEkZltxfWa89R/6M9A0aZvg+C2nwLhBCAzfCukjeBiwz+HnTSzg9BURFInOos+RAkLx39g6i6UeDkajT390nk8BG3JsNBZbyiLB5qTnt1+AIUHLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IbcSvlxfV0fWXuw25H/RFRRl9+Ain7F1/UhA4HrgJ4=;
 b=aaydtjxAfNkEapsymEksg6zgxzJrmQ3r/cqRzLoJ/0exzfwppcMM44s4ojoqViKlGaPB7w2OFAwTK6rGRDGH3R4HjuTir4YJ3SdLj/MrTJM40DEMQw373sYGJKAkD1/UtjeRN9oJzOchC0tHBREl+xcBgh/7xX3VOObru8QQvy5pTCQLbrCag4GXPdBIJUUWE3VMh0WPhR2pIdJBAKQwuRoMNTi/INnrDjRzVod7wqnFofww21vHxw1GJFZMrmG7u3X1JLxv/OsIfQXjuQUyl8hAqx6rmH8jSWzGzNUkakSmABE442rK8FQjGv49I0GdsTB48ywGhIOJpiUzetMaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BL3PR02MB8201.namprd02.prod.outlook.com (2603:10b6:208:338::17)
 by MN2PR02MB7023.namprd02.prod.outlook.com (2603:10b6:208:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Sat, 9 Oct
 2021 05:32:10 +0000
Received: from BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd]) by BL3PR02MB8201.namprd02.prod.outlook.com
 ([fe80::51fb:e0d:4b5e:4cfd%6]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 05:32:10 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5 2/3] usb: gadget: configfs: add gadget_info for config
 group
Thread-Topic: [PATCH v5 2/3] usb: gadget: configfs: add gadget_info for config
 group
Thread-Index: AQHXo4UPZ39IA5lPR0GzDl81LhwHi6vE4ewAgAV0OVA=
Date:   Sat, 9 Oct 2021 05:32:10 +0000
Message-ID: <BL3PR02MB820185D5B6241EECC055ACF9E3B39@BL3PR02MB8201.namprd02.prod.outlook.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-3-git-send-email-quic_linyyuan@quicinc.com>
 <YVwy/AHW2jfeGRnl@kroah.com>
In-Reply-To: <YVwy/AHW2jfeGRnl@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3873e8e4-488c-4b20-14a2-08d98ae62405
x-ms-traffictypediagnostic: MN2PR02MB7023:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB7023279132FA65BE4E335FE59FB39@MN2PR02MB7023.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGx22Lsklf+3nwpUKsHgkFp74xaciTi8QKl7EpFhhvW3zaGeVnCqvk0LTXgJZyJakX4giosrBe97oVOTbd3CXzMzRs178o4L2aFxYa+KOEqmbOh7XYm5ESSAGLAx7kbfoAmLJsP0PYKm+iLYeTPWtkqGWSJrgIrFlt0BntjqdWuonuV+LogiOloNdVmpjPk9C5BJMYP3m1z9nbxjw/WVAPSXMwcIDZEDQF5/Ve0hwCp8ISoBVNF1lIZbtrmEpz5kcrzg1w3mU7t/1s6Pq4fO5TDo14T8dl9weHf4Pi+kJU14cbWV9f76pPhNSKEXRueGKtPKIWZ1cRh8AoWkeKRuOfJDzBgycfUsxUFnQzoQsyyKhUnUp6tHavMOUkvDmDRw1W3VBR00GlY6bPN2ZY552Pd9D5xEaACpDsynnLfYRA53rym6UAIgrBuqV/NLyT+s7HCDHRGPdN8pu4oi/5vJDJdNB18/OKQ20UiZcbvfxsKxTJQUe3gIBZxHJ3HRSGh/s2LuJaczuwS2XEJxe0UKY/f+YvOUgkBn/cdzKiQqOMyxej+alOmxli8x02427jBEMq3iULySd6DQnFD9Oljg9pOrvBbM8U91bX6TYsI+J1w2DdVyI1PPgx0U0S9aRZEG7cEdjxLgC4GaWTQ2obbX4Vm1eTW7GQiTwS44BJzmhjrFwP6AArF4lLrx6stsJahc4CnXG1wgNgqc4y4J50p5NA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB8201.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38100700002)(66446008)(4326008)(6506007)(122000001)(110136005)(54906003)(66946007)(53546011)(76116006)(66556008)(8676002)(316002)(64756008)(33656002)(8936002)(86362001)(55016002)(52536014)(7696005)(83380400001)(5660300002)(38070700005)(9686003)(186003)(508600001)(71200400001)(26005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VAVPQIUtttaViutB7KHlZGzCsUgqqOeyZo5aFOq1L1aI55HaOiAylUHuXy9m?=
 =?us-ascii?Q?nLf8UFSpvXIrR5ebzYxrMy/QS4iD8kM3/v/7cLPt8mj4LskGcN52n9Tvkzv9?=
 =?us-ascii?Q?+zt1z5qwuCcd0kSv4Rv5ra8Ui3FbevUMjCvqhM/gNrGgcQat8ZW22i+0Ph4m?=
 =?us-ascii?Q?oICxIqPM+gbuLB9rI8EppDkcm2xMDx1CP+51sAU4tbVDmbvRN1/pSGK0V49z?=
 =?us-ascii?Q?vCnZIs4561bUHV+JftIVvTTWIkwUkZ5sAzFrXt93UkK3Iw1Io8NOcJGgrcpH?=
 =?us-ascii?Q?pF6KPtJsIFp3E3Vlr5+IM2T6ZZ1C5PyDlySVhzPnWwyq6M1t8npVrXCbWESV?=
 =?us-ascii?Q?vL8dzPXwwXPDPePmoGhD50nTSCWQibq5OTezXJgXUCVuDzLnkP3St+HflfqE?=
 =?us-ascii?Q?MvblwlpW7W+KIuRf9rDh4b3/Toz6/DXKRN55nqMJGx/yM8pvf159YKyY50K+?=
 =?us-ascii?Q?Ou+q3qqUlEvxrO2L7u0qk9eefk7Oe4po40h9spPsUVREzqA0X3dS8Yg8AGaK?=
 =?us-ascii?Q?tsBHhusKpFCsP1+4k3ihvjoE+xqv7ii250XNBYGpeTVowOMK8Gwm2VdvtI9v?=
 =?us-ascii?Q?NUv591vVhJv/Lv3xiovaPh3vcjhOS0SIDFqa1RfK9eNv0HYDHZqKxxdcbaHo?=
 =?us-ascii?Q?Jo8EXRGduxxmP8t/+mhI6lZMOUk86vNvBp4bGbSsmQ1ROwuXnnGsswe3gV3z?=
 =?us-ascii?Q?uH834p5O3iYvsXa0j2cD1FIKEP2PL5mAhLiEk8pwk7tKLoPEMo2mUJ1VhurP?=
 =?us-ascii?Q?YS6FUJxE5aPwyZL/DQdpLAbBuWqP6xeFlgRrvJ7hLcITv7SDGjD83GF/QSrs?=
 =?us-ascii?Q?iFyn2aUrDWTkOOY9EeKVIaQZTdIx5swLIv0q9EszSJbSnfBIkomD5lzbS+EO?=
 =?us-ascii?Q?Fv/kH2WllTTpBMm5RHkSDMbxCpK0otTzZmfuSoUjbIEdUeNPGv3+ZMn+W1T9?=
 =?us-ascii?Q?TxS0zU1GYQZnQysrDQ7qA+v+rkMS47R8TF286i7ip7rDf59cS+XmFDB78Hr/?=
 =?us-ascii?Q?JBxwi5cV77Xd/MMPMTGeZhCgPOemopTSQfO3CFutLaVASShdsf79OtSKFPel?=
 =?us-ascii?Q?yL/CcEaQvu1T/Pp7zHHxm7jpLViK8IHY15ZG1DCP0zYppZdtVEUxu+iSehzJ?=
 =?us-ascii?Q?2VvYtUDAxM+Ny7W+yVP+b5BuoZZwKxfVLbakGi+sZYc0aWNzjtENZDHdRhnZ?=
 =?us-ascii?Q?qQm5CSj4FpeMCj/i03hSeXZ4zlcwFZlkW6gkXj6u2VfV2Yg9ndE114miweCm?=
 =?us-ascii?Q?EG8OID4hWyAN4WmxX9WRrjXlDNyqBQq6h1VFNUpj+dkQkjsZ5877PDz+y+4K?=
 =?us-ascii?Q?HUE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8201.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3873e8e4-488c-4b20-14a2-08d98ae62405
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2021 05:32:10.0641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJpnl4ae6TYLMWUeUXZV/gvZRMA5ZyiBCKYvUwfn3pLAg/FUsFkisoPqu39K2mRpPB7ykHX1HNTgrVAiK9fpakWtn1rxF8Y35RM8898MIg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7023
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, October 5, 2021 7:12 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v5 2/3] usb: gadget: configfs: add gadget_info for co=
nfig
> group
>=20
> On Tue, Sep 07, 2021 at 09:09:36AM +0800, Linyu Yuan wrote:
> > add gadget_info pointer in struct config_usb_cfg
> > to allow common gadget info trace from configfs layer.
>=20
> Again, I do not understand this description, can you please try to
> reword it?
>=20
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: no change
> > v3: change struct inside configfs.c
> > v4: no change
> > v5: no change
> >
> >  drivers/usb/gadget/configfs.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configf=
s.c
> > index 5b2e6f9..cea12c3 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -70,6 +70,7 @@ struct config_usb_cfg {
> >  	struct usb_configuration c;
> >  	struct list_head func_list;
> >  	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
> > +	struct gadget_info *gi;
>=20
> You add a pointer, where are you removing it?
Currently configfs layer seem do nothing when configfs drop of config group=
...
(it assume the configuration group will not remove)
Need to test rmdir operation  and send patch if possible later.
>=20
> thanks,
>=20
> greg k-h
