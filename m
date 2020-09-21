Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B59273467
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 22:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgIUUzN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 16:55:13 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5776 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgIUUzN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 16:55:13 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 16:55:13 EDT
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6911d50000>; Mon, 21 Sep 2020 13:49:25 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 20:50:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 20:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk8i5d3H44Uru1jHsWLd+B6NrKRomUQJG7d9kDfYuwbiMUEhDUajMDebAx1tlZYDg6ECoVUFMubbclObdQznjdXpsEbNBWTukzyHfFXJEkhgUDoFQUVpEmRdWfwSN04Lc6TXB6glpJEPJU9dhjjdVOeec9MV1AS7hsqHRNE05NlQ8KK8EFMprhMU36BAbZMKX6qWYPKlkCkyPoeFtjKb2MPdy7AXe2UbBaRLmr7cxSOUXdNaqR814pWh8JvdFpEcT01HcrkOeGoVE1LoPJrhQC2aeC95M0Qi9o9zxsGdoDFAP9ZUlQL8wwq8cLf2BoUOgeaOIxRjxCZ2NBeyzVcuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYfYSj8zcLHNXz9IBMvtxTFSOLEjW1vdKgS3gdiAV08=;
 b=Eza1fztOcMgMTTwDTQIeaznO9wabl/F3fdjJA3B1bGbL5gd6KQy70dlUt72Zi7d6+HJj1qzxsJjv1PXqhOzudhiikOco1gNnitXo7yagPqunXYjOFxVE5KGkfswP1s47YMuR+rzJsEzZZHXuUCNaj71A/1HNhvcD0Qo+HA5zkmH0J3bOAqliSgGIplp+Oo6qyREzHN55KI6XItX4Ub8Ot/oUEvNve8UtCh03cvDdGT2uAZNG4EhL/064Rk8jhQQ9Y7BsJ8uEYsTJUdO51rkzrB64dESc+iIKgtXZlfQD8wGoSLjCuiPMTIJdLzxBR4CZNUKkWJpYT+5yts4PBRcQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 by BYAPR12MB2886.namprd12.prod.outlook.com (2603:10b6:a03:12d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 20:50:04 +0000
Received: from BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09]) by BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09%6]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 20:50:04 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Thread-Topic: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Thread-Index: AQHWkD6liAyFp+D0JUimlD153ehl1KlzcMsAgAAf/tA=
Date:   Mon, 21 Sep 2020 20:50:04 +0000
Message-ID: <BY5PR12MB3953FD500F1F72A32A5BEC07DC3A0@BY5PR12MB3953.namprd12.prod.outlook.com>
References: <20200921174216.2862-1-ajayg@nvidia.com>
 <20200921185432.GA1484407@kroah.com>
In-Reply-To: <20200921185432.GA1484407@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-09-21T20:50:03.4276043Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=9e8f88f4-cd2f-46c8-8669-99dc5c738678;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9355419c-ee08-4c9e-3a36-08d85e6feaef
x-ms-traffictypediagnostic: BYAPR12MB2886:
x-microsoft-antispam-prvs: <BYAPR12MB2886E63C7EE18FFA666D39B8DC3A0@BYAPR12MB2886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: awl/Mw6BXNy//h5pSIW9PyTbmLozH/JqABvJ/LdlubHlrpDYOe++H2rkOh8OD8MxvJUgKnhjPI+GD3yxEsliGJlUbu11aA7epye7Yt6q8ZuJF6ymPv5PRo/po6miWfdDTG02xJev8EBPrZQa1Gm0l07J1kgK42dxJctfUMejsUm8gPdx4zJ33QUBDvzs2eaQnF8Uwsjp4mc39R9CcypGFFxQx8zcde6asGfQxZKuwko01Mfsh5yJQlyyHBAn57/plK0n9By4u0Z7T7nGmvUu501IAW8qJFILxyEpQO7q1cVu0jq7BxyYNHLTx19HNF3+FlKgEqOoL5LB9LXQbcWtnNv0Jvu0Z7tVlGwJyn6Vx7p1YPouHIGqTbNtziyLkbe/XYqb7ZVsAhHFo7fe74Zgy/w5GJsX9tyPvoC1YxBIVSpqnScQLNy7R+eLylTyB/f7mulGEraKl3P/fYgNBf4GuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(110136005)(7696005)(66476007)(966005)(71200400001)(66946007)(86362001)(66446008)(2906002)(64756008)(66556008)(76116006)(53546011)(6506007)(4326008)(26005)(316002)(55016002)(478600001)(186003)(54906003)(9686003)(52536014)(83380400001)(5660300002)(33656002)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oLne1e5CPfYBJ4ez0Gm1KprqVlXdwAp58EDHS2bYNTt0Fu2RnF6D6kjZ2QCSeG9nJcqO+Cj4xTaJ+wNkLq32xNAqLPuTpgBnpSOR9rUAeqFSkWfY5urX5nbde4ocSezKlyNU8SpSgrFRcdyjW6MBNxs13ya7mBoE6rKP617Ga3ja6XuhnwL/G+nLm0KS4I6Fn4MtKq2glV/bZ0zgqZ38v6o8b/2z04DZ+h64Ld0o+Z8Yp0Dt3kehRJiW+r+BhiGByiteW/GTxpJnjKZPRGNkaZ9xHqPAVvHvv4veSyh97324J/DoucJzMtBh9ooiPMlTEufAne6Vwm71spKJlBMjwCL6rtKJzIgd+YDEewKqlJA6DjIYbjJwvDhVpnsd06RVoMjHQQ2xMM08C2RrjdA7Ui/A4bnD7v2krIvEq4HZi/DxTIxKpbw/aODTsvBwfLAyCY0/QFA5dlfU1UICxDsanHs1wpzyHrQp0agbZ0DJGo1bdJ1dXEQurCt9/lSOtsJbdQW4pcgiKjqTBWV44lyeJMLbNzWyO4O+WSMbRl6BFOR+lcYxve0QAh5Pjq+ex+4mPfzDv+JseSREwaAHTIe/VW5JJ3baKbPacLRURjEBz/v5G2OU+SCTOHk+qs9Bg0C31kb1/KOO6Owmit/OL/FToQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9355419c-ee08-4c9e-3a36-08d85e6feaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 20:50:04.7363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cdDwn9BrNDjZ2xhUCVeXYTYuEGIqfr+upDJtWsD9ugD9848FQb4pLrO2nGP3YXV6SqbsB2+eOSIcYpY57w1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2886
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600721365; bh=KYfYSj8zcLHNXz9IBMvtxTFSOLEjW1vdKgS3gdiAV08=;
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
        b=NrPrJ7zfXNkQ2YHdhzDwM5XAbOrKHfng4bUL5Qryd+1MeXvNQ80WMfG79/dLslTFC
         0tL6QyIMjtxOuhn5Nwxy54qjCBsMX08ni4fWBPmsnCPZTwE8ATd4MnZSUwYV/gHnC9
         5yBJl4+7eYSZq8drWEYwPcCTjawengqUtiWROHmkaWIMqDgS5tAq7yQnzNp6B8XZ7x
         IqWDzRBna0KMxQQ0PhU/z3/zxnfdOSQ6A6deIOD+J9H+0G1kVFD6BwiWWPOuHcfVnX
         jGX4U/oAQZotxfUbZxw7D4l4jNxW6XbJ6Bx1eGU7ULcjNxHpgXhFdH+UyItme4EhZs
         FP2psZIVW14pw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Monday, September 21, 2020 11:55 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; Ajay Gupt=
a
> <ajayg@nvidia.com>
> Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Mon, Sep 21, 2020 at 10:42:16AM -0700, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >
> > Timeout error may be seen due to missing USB Type-C UCSI controller on
> > some NVIDIA GPU card. Currently we don't have a correct way to
> > identify these cards.
>=20
> No unique id anywhere???  That feels like someone really messed up :(
Yes, there is none.
>=20
> >
> > Tools like Plymouth (splashscreen) doesn't like dev_err so changing
> > timeout status log to dev_info.
> >
> > Bug information:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> >
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi_ccg.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > index bff96d64dddf..d69432df866e 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > @@ -252,7 +252,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u=
8
> *data, u32 len)
> >               put_unaligned_le16(rab, buf);
> >               status =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE=
(msgs));
> >               if (status < 0) {
> > -                     dev_err(uc->dev, "i2c_transfer failed %d\n", stat=
us);
> > +                     dev_info(uc->dev, "i2c_transfer failed %d\n",
> > + status);
>=20
> It's an error, leave it an error.
>=20
> If it's not an error, don't log it.
Looks like this is the best option we have.

Thanks
> nvpublic
>=20
> Or better yet, fix the hardware :)
>=20
> thanks,
>=20
> greg k-h
