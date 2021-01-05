Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317CF2EB073
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 17:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbhAEQtM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 11:49:12 -0500
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:22876 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbhAEQtM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 11:49:12 -0500
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105GgeJr030208;
        Tue, 5 Jan 2021 11:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Bk7ECmJ4hTFkUPuGMX7KM0AvF7R1rfVhTpBXOx04Q2Q=;
 b=Abpt/7QBLpMCMP+2ASH1PgrTatf6NY0VWCduulUpD/aod753lY/DreHD7XBAKjiWFbFP
 F7brUaUXgJLF6VbsyWm0DmepRMjffGzO200oGNOWNIXBeItqlPIxiUx5tPxiD+8aDQwM
 PgQtDmX2jCd2kW10R5LYUmAS5ulkS73CYtGoJ/XZJp2CVeP31uhoJUohddjEizKUKkzZ
 5fNWLZ7CkREvBOkgUsQcmnqwmrBlA9/QfIRYKOMxufTEh610DRuoYU/YVUAB55tCr/Ab
 uNqlRO6eqklzIp9rrfzc7oY/BfYzioroGeznJcEHJMYJFH56EACRw+v8V0hNbfc5fwAc Vw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 35tms8j2yc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 11:48:26 -0500
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105GjMea050024;
        Tue, 5 Jan 2021 11:48:25 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        by mx0b-00154901.pphosted.com with ESMTP id 35vtqr989h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Jan 2021 11:48:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9YNCd2LJ+oOJPIX7bZFCPk6bFjcNQs7UtPW3X6Z1ODtUv/AurUu1Z84oSb66GyNYNvfFOnc+4GfAqgP2Tm4cPEltyD+j9zQYN+9F+4M7mC7NmwV0cGTzCJY7pSl0elL7u3Y720ArZ+3mkZVTzZ3fmcQDuwgXFwyS6Zq9M+bsaEXP7eIahd7FYIqlg6RiagLCjh2TE25Et+niXypVzyDwicZBLm6dgfvbD5/RSAHviPVrFpDyH8L9j0Y8ThpRXbNz/Bq8py0VKafcgx68seiFNB4CDcemKj3DnH04IOw8C7hAwlCLIKWkZcmw5CuIbhDpJMSjw4KNlDq8sHu83o/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bk7ECmJ4hTFkUPuGMX7KM0AvF7R1rfVhTpBXOx04Q2Q=;
 b=Bq9CmkFII3FteJ98oF0SbBgDS+JlriZKZfHeOFudhgbAhdFSb4TzmQlMYALUq6N5L50GuJX6uYFW3w2loQ6sKMrn4AZw8hG/kIhcU0B+pOfXJMwBmG3/Mg5pfLA3Pf754Nv0xm5eimcRpF539F0BnNTqg9Ry5025vV7vTRTxAaqf50auwi2r0POC67atgTfrzz6sahPgaKWRrkRbV8DvIst+MihIJgV6juDMpzY5o+ufIN3x1R0clKsMqhccTVGRudVGzJG2xHgXWagsvVrH85pgkdrQ71ReFtcpd5pgmEAPuVRq9/gMSkeWD/tyUwJTQ6Ija6q5YfwkU9v2a5HR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bk7ECmJ4hTFkUPuGMX7KM0AvF7R1rfVhTpBXOx04Q2Q=;
 b=OfQOZuKlJQ03tMNUZW8ovuyNgkERgdHHB25ZEC6mOLisCie8oUuZVuik1FD2DGzDh3elCpThHpejjYvN/0bBDPJ7I2gxk8mpGdgRzQ6vahK1PlZrA+X38YCrlTV2qQHGPl10lGm8ycbtE/qHoQ0UTifQ+Mhi5tOrYN/8cZkUCgg=
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA1PR19MB5023.namprd19.prod.outlook.com (2603:10b6:806:1a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 16:48:23 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::e14a:eb33:4847:6cba%3]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 16:48:23 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <yehezkelshb@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>
Subject: RE: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Thread-Topic: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Thread-Index: AQHW40UbuPmeFcyxZ0GCSFVJ5I1lb6oZDcWAgAAtgACAAAEnwA==
Date:   Tue, 5 Jan 2021 16:48:23 +0000
Message-ID: <SA1PR19MB4926E78435DD9276364D0818FAD10@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
 <20210105092808.15817-2-mika.westerberg@linux.intel.com>
 <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
 <20210105163624.GH968855@lahna.fi.intel.com>
In-Reply-To: <20210105163624.GH968855@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-05T16:48:19.6759421Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=fe10b2e7-e1a2-4072-9a92-2a6452f20b61;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93d437a5-be03-4e81-0b6f-08d8b199b722
x-ms-traffictypediagnostic: SA1PR19MB5023:
x-microsoft-antispam-prvs: <SA1PR19MB50232D9F3368A27063F9CC1FFAD10@SA1PR19MB5023.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +jj0bFPtSvGoYg1Gqc/u5Vyfm2GTVDG4Kd7OlYN93OWYkn+da1wFynCY7d7ZFmd1klTE4QcRRo1RBkANW3N3LHdp7+SSZ+1Gm8oAeHvYkuTd56RL9PWvYoKwa91U75VpMzt8cEayvb4gRzmO6l+Z0r1MBM8vOTK8Hqp5uDQ090ns+ic3mAriBQgFnW0y6w9uwgjf1gd+rxYHGZQ9VmIXCqMqYa4+UBJNfiDB3hWiKzkUVORxVitFfhsYXn4hmbwi6gbW6dWDQxUwWZx6E364kjGs/v85KLzsYSa8h1RNg/zfIa9TyYqmiMflmbq2jQ7iW1Yae1+dSD0cXfhz0AzVtgCUudnLlhe7jMqR5kmF21a8nCHyc7BULm5gdDJ6EOBEIdmk61fPhIN6aVQMuCn1Sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(6506007)(316002)(54906003)(4326008)(5660300002)(9686003)(2906002)(66476007)(52536014)(86362001)(110136005)(64756008)(786003)(83380400001)(26005)(66446008)(66556008)(66946007)(71200400001)(76116006)(8936002)(33656002)(53546011)(478600001)(186003)(55016002)(8676002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pF9BlfUk5O9URv+CYxutww3moWtFjzkoL2Uwg2og70GLxTBvpNNOnwVRd6w8?=
 =?us-ascii?Q?1SgMPn8xh0TbWYYVFPWg+Al/toXRoHLTS4YTQpPBKtKGllo/CHe9LoCc2bFQ?=
 =?us-ascii?Q?KWKsRYfvAZdmq4bE3YJ7tTCEyA91fRQIhLdOFK4D9TAQm7X5+Ckv2IgP7VHF?=
 =?us-ascii?Q?GkWe0LufyeOp4+87/sruhkQ98FENBH1TdzBhLuWIDx+84tHLnmsCtXj8PCsM?=
 =?us-ascii?Q?LOAgtTWJl5CPOdR5TDdcpH6oPdYa0PJ0nkDO+RfaNUajvoyj4YYH6FH3UEIY?=
 =?us-ascii?Q?fgTzv84Q4RYoejzG9PHD+mE25+Gf84/d6aeIONgK8A28cXQZYuIPj6jPP2KY?=
 =?us-ascii?Q?ifJKfa873lRIwFcnr2BkbBYzVq91Fxeu0n+9L4CJYXDBnFGYyt7pVKvH44bs?=
 =?us-ascii?Q?jgDb0jLffw3KuV3nbrkih/iwlE7/IW76Wpciy+g+xdEB2Vb4vS1FNLpyFO0q?=
 =?us-ascii?Q?MfR3HNTHXWonJxSZmXDplCmPdwE8wdVXUOto0SUvGVmZZ8NK3gRSaVNf5wQx?=
 =?us-ascii?Q?2tKrNqIDKvI/yiNmQAJqihLO4drGybJPQAl6U8UNbZgvZGQCCLI+9G2NdMi3?=
 =?us-ascii?Q?LlSK5nMQMcRqGlEICtOp4w/pvJXEDY/90Tidz90sg/4vvGUB05vSKeUnZ+2R?=
 =?us-ascii?Q?9YkgOwl94n6Z0FJGyrIO1/lfy9B1A3jC09YPWILQoeJ1axfWyxVpqtLsztX5?=
 =?us-ascii?Q?WTJ/TMBS+A92unI0xdyx4q89KyLmLazyS3D8nAL22j+s6L1fqNUpRjU+215f?=
 =?us-ascii?Q?veXSCHMGQpzVhASeWLAWTGOWMM9LUQ7SnPaGqF5knxMvWDulcGE7+uWmf8g1?=
 =?us-ascii?Q?fo3HSOm9T1KPQ2HeYLXRZwQBomGZqFrAmSnlZlRzKGgHBzDqKoWsaaNx1niH?=
 =?us-ascii?Q?YnsCHih77+1uAR4aWCHgjpkX/yr/qss24aKu+l7mIlDgCLCdpW4Ei5imvBPP?=
 =?us-ascii?Q?Nzi/Gjbp1ypwJroJpVoZexB+H6aPcHf3+UdX8XUN6Fs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d437a5-be03-4e81-0b6f-08d8b199b722
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 16:48:23.2782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgnXu98hRIswDO8WvNnxVYaYPXQ0LwVklmueLB+IAqA/1cX7esetAx6ZVbRBpc9w9/iGSNxPKhXNCnHElzTVcAFxOGMYTm0ba64o/Ibv0X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5023
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_03:2021-01-05,2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 clxscore=1011 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050101
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Tuesday, January 5, 2021 10:36
> To: Yehezkel Bernat
> Cc: linux-usb@vger.kernel.org; Michael Jamet; Lukas Wunner; Andreas Noeve=
r;
> Christian Kellner; Limonciello, Mario
> Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devi=
ces
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Hi,
>=20
> On Tue, Jan 05, 2021 at 03:53:33PM +0200, Yehezkel Bernat wrote:
> > On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > In some cases it is useful to be able de-authorize devices. For examp=
le
> > > if user logs out the userspace can have a policy that disconnects PCI=
e
> > > devices until logged in again. This is only possible for software bas=
ed
> > > connection manager as it directly controls the tunnels.
> > >
> > > For this reason make the authorized attribute accept writing 0 which
> > > makes the software connection manager to tear down the corresponding
> > > PCIe tunnel. Userspace can check if this is supported by reading a ne=
w
> > > domain attribute deauthorization, that holds 1 in that case.

Just another idea, rather than the value of a new "deauthorize" attribute i=
ndicating
whether this is supported how about instead a "connection_manager" attribut=
e?

My thought being userspace can potentially make a judgement call from the i=
nformation
on how tunnels are going to behave (particularly in long chains from the su=
spend/resume
cycle coming back differently).

> >
> > What a great feature! Thanks for implementing it.

I agree, this sounds like a great idea.

> >
> > BTW, is there any general way to disable the device operations before s=
uch a
> > disconnection? The user has a way to stop removable disks, for example,=
 but
> > maybe other devices need additional precaution from the user (eGPU?).
>=20
> There are ways but it depends on the driver, I guess. For instance eGPUS
> at the moment (the ones I've tested) simply crash as their driver does
> not support hot-remove ;-)
>=20
> What ends up happening is essentially PCIe hot-remove so drivers that
> are prepared for that should be fine. Of course if you had mounted
> filesystem behind the PCIe link that was torn down you end up losing
> your data, so the user interface should make sure the user is aware of
> that.

I think it's also worth mentioning this risk in the thunderbolt.rst documen=
tation
directly.

>=20
> > >                 Possible values are supported:
> > >
> > > -               =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +               =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +               0   The device will be de-authorized (only supported =
if
> > > +                   deauthorization attribute under domain contains 1=
)
> > >                 1   The device will be authorized and connected
> > > -               =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +               =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >                 When key attribute contains 32 byte hex string the
> possible
> > >                 values are:
> >
> > As 0 is available for 'secure' security level too, you may want to refl=
ect
> it in
> > the documentation here somehow.
>=20
> OK.
>=20
> > > +static int disapprove_switch(struct device *dev, void *data)
> >
> > Maybe it's better to mark `data` as `__maybe_unused`?
>=20
> Or rename `data` as `unused`? I think in ACPI side we are doing that
> but sure, I'll change it.
