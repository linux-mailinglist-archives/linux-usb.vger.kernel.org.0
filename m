Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14F3274D4B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 01:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgIVXZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 19:25:08 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:55911 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVXZI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 19:25:08 -0400
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6a87d00000>; Wed, 23 Sep 2020 07:25:04 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 23:25:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 22 Sep 2020 23:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqVAI1jN4Mg2RRI0kCMoMtpJqAJUz82kQzA0bfXqM54Qj7acY14KmwRR1VCH0D8UQ+pMtfdKAthqfiF7qmEUIT0THRKFHtNO5w3tPwC0hrkrf2VuxDVD4Ac1RIAwi/IKJgaxOwieqijmgbI7JnHOvTuAiutFer536VmSBD6JhmiUactAjbiGEQkKs8s70r8hVZXn5WkDo/t96dobYw8mVlpSXWeK5xKf4GYBAue4/c1p/ot/O34VAY05FFBohdzV2FqOtFJO1tV9W099t79+MEx8CSqMC991Ylk3RmSQbgsu0yi80FHd9raSmvgXLJ+vyOzk2MlYQnUnAbRqj5HqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tpjSg7u07gtOBLhuqmBfurmhKJ9yhZPobNW0W/IpFQ=;
 b=kODCFxnxQx3pYag/Q6Aru4HForfbFYIYGOyMJjn00cIwYq+zZ6pIKhyDfvuecgHiKNIMWNleFiw5nyC4XpN8U+u0VO2p2u2tAZzhBrxQdkqkLIHIqLUt0DH3uRyzCblq+idxE29G7UH+On85x7IOetH/cOaA3xQ5QtNbeK2znKfDg9NvpxeqAVBJXnulhcP9he8asROROAcZ34DjrW1do63CL9r5jen9RuFDct2jLkD0F9xbCaLgQP7M3V9otIK204hbyGJptqEOeaQVAaNL4PYPb0EzZ4G8eiRITaFwKdWQ4tvcC8oeqmeBlgeazel2Ag4fV5uAw+hlFFbddmpOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 by BYAPR12MB2886.namprd12.prod.outlook.com (2603:10b6:a03:12d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 23:24:58 +0000
Received: from BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09]) by BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09%6]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 23:24:57 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Ajay Gupta <ajaykuee@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Thread-Topic: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Thread-Index: AQHWkD6liAyFp+D0JUimlD153ehl1KlzcMsAgAAf/tCAAJVdAIABJ+gg
Date:   Tue, 22 Sep 2020 23:24:57 +0000
Message-ID: <BY5PR12MB395337979505715CBD17AC07DC3B0@BY5PR12MB3953.namprd12.prod.outlook.com>
References: <20200921174216.2862-1-ajayg@nvidia.com>
 <20200921185432.GA1484407@kroah.com>
 <BY5PR12MB3953FD500F1F72A32A5BEC07DC3A0@BY5PR12MB3953.namprd12.prod.outlook.com>
 <20200922054338.GA588161@kroah.com>
In-Reply-To: <20200922054338.GA588161@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-09-22T23:24:56.4062355Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=90ab2423-1b92-47d1-82b0-d65ae68f2358;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb620bf9-1d22-4a4a-4484-08d85f4eb871
x-ms-traffictypediagnostic: BYAPR12MB2886:
x-microsoft-antispam-prvs: <BYAPR12MB2886780EF5F603DE041C0DA3DC3B0@BYAPR12MB2886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sKlGS0hsGAwzcP19b321S3mDWSOKriGUyGSuD+KgGfhAe4Vq68736Ys4bsf9jiEJJmVdeT+bLApVMcIPGQ5yGLwo3h5enJq60DdR079Lmm5TSMCiwFtMeCJaDyDOObXVVsC+4VILonikFnEiLhWDXCEmznVT2bLnKa75cEjuB2ZLv6/MraeINWZ5UghzR+QPmB3i9qh9EQYfciDkMgQ+vIwZjaCspf9K7t7L8zcsjpuovdmFfUdM99EKf6oOj+m9nxTy8q39XcJQF6jOW8VUFy/4URe/Ig6rhM8vR2lNMaTpprzTVquoSyKUBuMD9TXK1wOnq/Eda6mz+31TK80r87tTDhk8WCed7bgWI0Spn9E98K3UnAeiLPA3fzWXk5u2s4CqvGsSWdkoXubXK5DIH9mrDSQd4dDWvqz1V/7sdGeED4GGgU+brcJX+F0sMOudvu/EFkHhwwNTAcCaDVbaIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(8676002)(76116006)(52536014)(71200400001)(66446008)(64756008)(66556008)(66476007)(5660300002)(33656002)(86362001)(186003)(6916009)(53546011)(6506007)(54906003)(4326008)(966005)(2906002)(26005)(9686003)(478600001)(8936002)(66946007)(316002)(55016002)(7696005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9Y+uj8ZlQlZxhK94UDRBTqk97sgyys2j/927GNx4wV0hFgdoCWPoX86o8mm9pH72Cu/w19ZRg8syjSnVQyPaQ+yPTPdzeHYEuD0BjMz3sj4YfV5aZZBgHa6i3ooNoMO1clVjZlb876JXd/iznZx77PTfR18hV+GFdOyB73nOTHSrde1yjVSYnYPiwmM+UINQxNQrX8+Soz3jByyNbMhD1nexrF/m11032Igk2ZC+dG8a9uten9pKsNqWMTGiuN3zhYUdB9+zRpiyz8knyuxznzw32RpVAjDyvvCJCoxHcSBxvjFvZ8OxfgoUyN8z7gAwc8LShrST/GBlpZjrUerrFOWn/r8E7bC9c0R+Ww/BeV1OctwUV1ZhTupFpTrOV5nqA858eg9EDOrXmVvCdMcS2/hD7d0QP4BNcP35tPR5vgHQKuQQ9nC8E5azG9Y0pDlygCZQJMqP7khhItmZBT9MEHrUGKz+/f/xLzzFYwN1yZ3mPNMRRnLojAk5SaykPj8iRZpsDEx4LgPsD/ras5Wt0hdhkPe/109MBiNZEmz49+rUTnSJxXox5X3J1B/pNAe2u7952IT5ktViR6nzQgDzTnsjr5i2D1JnAm+LiLQ4zy5/1kzAsv9C3xz5Aoe+1kR3RBIR/ZEqz/090FjCGbFQdg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb620bf9-1d22-4a4a-4484-08d85f4eb871
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 23:24:57.7055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JeaHvNrVzz6um02ajOVt3bV0wo+qa67vhfQe4ycozwQqRHBwSqXovhLOJJWYon/1uTOC7J4ZRcQR8WFkp23nNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2886
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600817104; bh=6tpjSg7u07gtOBLhuqmBfurmhKJ9yhZPobNW0W/IpFQ=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         Content-Type:Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=Q2VabMYNElE+vTVf53YvDKw85+CU8xF62Dq1ip5GiDb23n0Me54DxbhO/xfwYZ+Oe
         l4bICUaYcM2ejgl+MD6hiFipdbs9Q50/VgqcrBsDZ/iraZAIopqGZGRZF/4AyWBvef
         aR5xwXFsAin4IYEK9zGZKsT2G5Dsf1Z0efAqCg/OAW6LDuoaKFsmrNrzLvyeqKSe3f
         ssRIP4uwSmtolCSr3uABTrtb2Ghyf2Y5i6uk2tK9mXfHwUoXD/W0MNS1yjD+fT4D4H
         NfFh/SXFGfE1Uc0MgNQ2cxN1URda7yLezV1Hmik2ZMwBO7QH8PSgYivg2gWFzbaDIX
         rrINj63SygvVw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Monday, September 21, 2020 10:44 PM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Ajay Gupta <ajaykuee@gmail.com>; heikki.krogerus@linux.intel.com;
> linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Mon, Sep 21, 2020 at 08:50:04PM +0000, Ajay Gupta wrote:
> > Hi Greg
> >
> > > -----Original Message-----
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Sent: Monday, September 21, 2020 11:55 AM
> > > To: Ajay Gupta <ajaykuee@gmail.com>
> > > Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; Ajay
> > > Gupta <ajayg@nvidia.com>
> > > Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout
> > > error
> > >
> > > External email: Use caution opening links or attachments
> > >
> > >
> > > On Mon, Sep 21, 2020 at 10:42:16AM -0700, Ajay Gupta wrote:
> > > > From: Ajay Gupta <ajayg@nvidia.com>
> > > >
> > > > Timeout error may be seen due to missing USB Type-C UCSI
> > > > controller on some NVIDIA GPU card. Currently we don't have a
> > > > correct way to identify these cards.
> > >
> > > No unique id anywhere???  That feels like someone really messed up
> > > :(
> > Yes, there is none.
>=20
> Can you identify them by the failure of an i2c transfer?  Feels like that=
 would
> work :)
Let me test it out and comeback.

>=20
> > > > Tools like Plymouth (splashscreen) doesn't like dev_err so
> > > > changing timeout status log to dev_info.
> > > >
> > > > Bug information:
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> > > >
> > > > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi_ccg.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > > b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > > index bff96d64dddf..d69432df866e 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > > @@ -252,7 +252,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16
> > > > rab, u8
> > > *data, u32 len)
> > > >               put_unaligned_le16(rab, buf);
> > > >               status =3D i2c_transfer(client->adapter, msgs, ARRAY_=
SIZE(msgs));
> > > >               if (status < 0) {
> > > > -                     dev_err(uc->dev, "i2c_transfer failed %d\n", =
status);
> > > > +                     dev_info(uc->dev, "i2c_transfer failed
> > > > + %d\n", status);
> > >
> > > It's an error, leave it an error.
> > >
> > > If it's not an error, don't log it.
> > Looks like this is the best option we have.
>=20
> It is an error, so we log it, that's fine.  We are correctly reporting th=
e fact that
> the hardware is broken and not working properly, don't paper over that
> please.
Ok.=20

Thanks
>nvpublic
>=20
> thanks,
>=20
> greg k-h
