Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE1A3342FB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 17:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhCJQYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 11:24:31 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:49872 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231864AbhCJQYa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 11:24:30 -0500
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AGLv4J016821;
        Wed, 10 Mar 2021 11:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=01rfDsHDrKgVRaExWxEgzjC9aoOhDYtAUSqGodhoGqs=;
 b=Pc5khuLc7HOiXUsUu9aqGiGYJrhgS7xaQfzsOTsp2x4L5UWNijAHa3T5SCyQLvCh2hUi
 IoSiD2q0AccOUk9pMO3RRdRZHjCaILAnrCZCVzcwgTcPs8eBYqoPUBYq9x7Z5tC7+ikW
 LJfcO6u9vrH5mc87QGmg6ebjM2zgQymH70mbIW7MspVS0heJJlNy+6fxykSWzNtZkNhy
 EA7D534DAGyaYDGD/MH64tREoJrlo56jdQcDtAqYF6OC1a/Rh88mjv34OA16hs4sGDIk
 XD4ntVdCAIQ+OHTZEH1F/i3vMY3frUs73CWvIjb9hzlWs03UM6rJNHOsFgsYYcloPdLa fQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 3743q16665-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Mar 2021 11:24:22 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AGGSxw137542;
        Wed, 10 Mar 2021 11:24:22 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        by mx0b-00154901.pphosted.com with ESMTP id 374qgu30k5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 11:24:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An6VLpqVE1PTARnVQ77VEMr3iwQMk5IYCvmEkynO/N/iyvlaNhWBEx6DX6h30/MerOZxzdpfLKVFlfGByndgLmVa3tdRj2exM8cmbpT6Wv5l1b8XunvpQgBAO25mj/P/4aismqql9nyi+7RvLEg7OqUmQjZQCHrM5ZQZpTOj7Zif6U7vMLsjruena3f95oKEpuLpAnlsppiifcTXhOJE6Sc8cMTuql2DqzVVC7HGptgnvuTuVELIupKiAYRe+8iyrxnfc8c7WCOcWNydPK/HFUhhOa+TJxoNqw7leIqSq94SqPhdBJozLU3uOfDYEkFESlDetdiqixbDSDOzAk/eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01rfDsHDrKgVRaExWxEgzjC9aoOhDYtAUSqGodhoGqs=;
 b=F5ztbOjY8s4ODDU2ML9fxONGAkMdxc5lCjsLfPYhjeRPF494UxUZFxo8u6sc2bjgGppvQ8QaQHfeaOnJOACsNz1FFjcY5M5TbO4p/SpsY27LV644h5/u5nMFB8NFaTLgz4X+fejjFz7gs8WVJeaw+Dewnj9BdnNn5gnfE/CrQwa+RCVCBYKph+8uGOevr5dKHxO/dKw2WC+mAL+ijHGDOx4vhWLK75LoqbzHv/JrGigydkbemaRAGWiUMsK4XjNGoF7YCnFIifWYyVGVf0MJppsemgq2L4NjeBS0fcM1ZG8oZwEvQOwLMBFoVAMMdA11W4+L6ApJlFhHJ6naGETPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA1PR19MB5214.namprd19.prod.outlook.com (2603:10b6:806:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 16:24:21 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50%6]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 16:24:21 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: RE: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Thread-Topic: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Thread-Index: AQHXFOrkKoHbLY6shEa7xflOErQBmqp7sfGAgAEpfQCAABBsgIAAB/CAgAADjQCAAAFrAIAAcElg
Date:   Wed, 10 Mar 2021 16:24:20 +0000
Message-ID: <SA1PR19MB492655CA54780348D70BB863FA919@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com> <20210310075444.GB2542@lahna.fi.intel.com>
 <YEiJC/oZ2ZasVtvf@kroah.com> <20210310092155.GC2542@lahna.fi.intel.com>
 <YEiSrgziexV4SNdf@kroah.com> <20210310093942.GD2542@lahna.fi.intel.com>
In-Reply-To: <20210310093942.GD2542@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-10T16:24:18.6631028Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=9bdda006-8976-4c58-8c3a-2630642b8150;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1177254-48c7-474e-4809-08d8e3e0f5e2
x-ms-traffictypediagnostic: SA1PR19MB5214:
x-microsoft-antispam-prvs: <SA1PR19MB5214C97398AC519525DDED88FA919@SA1PR19MB5214.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: auziutTiClV7ceb4biG4M1J9sJHyH78T8C8/Q62cJQ/rjTtz8Mtbx9r+qUdiMpGQ0SbbTlOeZXngT94azvdI/jGfrwVcVaP2oNRLcLfMakG9kXIbpzIgaH3tnt8tcc3sKeNalSpOZ41BgpZXU72iUTPnNlJdNHlPYkPOzGY4i2RnXObV5H8xk7f4ugcbzj1ih4JDVzfqgc3+pXzxhewZFIYEBqurENQGsFixrMWDPKNDLqh+JNlHKTqD7PerWx/tDDCLQ9dnvUXzY9ks2ngcpzFvIJTdAsforfE4Or61ESp6p81PwA+lrxwWX3VdiTiA2tsOHdBE1Tgk/yvi4A4LvAfxBan5stOSn/qPrnakRULkElXBrjSaS7pSrLw8RlmS0gbnKy8hrrjeL1yx6aajP3NXrPnno5eGThsv6yhANO2S70U48wm9GSlSnxb/hOaCoZPBXahLRslvSoODOtyK4/LQISVSn32W6lBQuLJxRhCgIV3aqPr+FhjdCnVHSDxHgOcH7IO8UR7qdR+CekbDRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(66476007)(86362001)(66556008)(76116006)(66946007)(64756008)(5660300002)(2906002)(83380400001)(186003)(71200400001)(26005)(53546011)(6506007)(478600001)(4326008)(786003)(316002)(7696005)(66446008)(9686003)(55016002)(8676002)(33656002)(8936002)(7416002)(54906003)(110136005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8kn01RVNpMuBkIh49UKU3Vbb1Husdrds1TPppcIM5VAcbOyW03k0uoRlS/hQ?=
 =?us-ascii?Q?PGDBoXtkxS9rLv8EvikLBMQkC9TAiK34QwuokM8SqH+z+4yZChHtgYY0xBr+?=
 =?us-ascii?Q?Th01MsfRmJeYobtn3T9bqxIOHCHokIve3lHXFD6Cw4F+EDCWaUJaWwGP8Ip0?=
 =?us-ascii?Q?gp6tNvHUPpGwQuw74d/y/oMgykCn6MNx3XuTpBM6k3HRIbbwENIsjN34/nde?=
 =?us-ascii?Q?PWktBVgpogJtO0tYuFNaYrDRQgpk2SSLimKS224s6+qsT97BcaeS2SwdH4hx?=
 =?us-ascii?Q?iM0kPzoTu338Rg1yUnambPVWzvrRTTurC4WDLzwHlvq3RDt5nNjlEb3Y2AIf?=
 =?us-ascii?Q?N1vppKhGzM5NDtldfYEA4AHPhCvANKIGQ5R6BBwsDVKI8b6i6jB9xsPBI38z?=
 =?us-ascii?Q?gvVr1C4g2+ATctd+NBf3nFDeACKxb+aM5g+p7l1/anoCaxWpM29SSITcedUZ?=
 =?us-ascii?Q?b7JHQG32HdBYBblJ+m4X36SxJfMzTOmo81OzO71G4m3QVTE//N2fIWKgwRmF?=
 =?us-ascii?Q?XmLpRDWrgTaSmq2NF+CUQVrb3wQnQVS/owRTSIwcgd4hxh18H5fQmHYE+PRH?=
 =?us-ascii?Q?TQeMiOVHPt1EgDHkxHZlZG+E+HqzBzGstIeUjh0fCDOhNCvuaMypxFkEh9kF?=
 =?us-ascii?Q?ShbkUOJFp5uiSggMjuCMh5IjjOkbDVaKzESJdXlBKOFvkNbqydpw6/M17NQg?=
 =?us-ascii?Q?z0Vq5gNmLFu6zQTBSpGMjulrOkkRiEVDqG4e5PIkqzcXilQ75zVYUERR18Qt?=
 =?us-ascii?Q?35DA8rASlOdgXesF/D7GdRQOUaXpHfDRVK228+JWZ8t5TIi/V3p2A45y4Yj9?=
 =?us-ascii?Q?2sN3j0EdNNfzs2tCVggDsm8koxmwU2AWjH8MwYkpjlQVOOYVZtAILLWSTJ6H?=
 =?us-ascii?Q?G2xLcfrIpGnOK0dsv3HBKY9fEE1TjHmW3bafX6SUKEINI7yTVsoK6A77YHJS?=
 =?us-ascii?Q?L1ukA6J8u30rpZAt/LmWsAOjWUwL4LxWbRvdnCKSBSi0lAyfHs/faD1NNob0?=
 =?us-ascii?Q?CzI40FC/ERUm0e+TxkfvQ9owhb99eAmh1LaeuI7k6k8fblim/xdoGJ9cKasK?=
 =?us-ascii?Q?EpQav97njZ/jqZyn5SeqTWwKwzrl7nWTYKK9J4iPszJsVo1cQ4IDUYX2l3aP?=
 =?us-ascii?Q?T2G162QBUSslCWRO6er3CWGX7w3V9lX2M/9p3IrYdAbVqodR5Fx3QwmpEQcO?=
 =?us-ascii?Q?c7B3qK60hzJf9RI2JGhcSTBJxm9mu+ZB88mjwrGfIhCasnfDYQoezCFBd8+J?=
 =?us-ascii?Q?SKtQTk6Xvbe5cdWLyFiMyUlnpJUVjl41kDIkaOR72KRv9nqw0nE2e6tq2gpq?=
 =?us-ascii?Q?Aj9ojfApda6fL0wgCXqOcDkT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1177254-48c7-474e-4809-08d8e3e0f5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 16:24:20.8968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwztO18dNxVlKzFUbzmTDfUeinexfbvvntJx3rez0Lu+QK+9gpoRmZbyEpilucB64Kyi9Q8uIS9WAvFSJ/gwbnR+iqa/3uvHoPJpaEYWxEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5214
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-10_09:2021-03-10,2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0 bulkscore=0
 mlxlogscore=944 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103100080
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100081
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Wednesday, March 10, 2021 3:40
> To: Greg Kroah-Hartman
> Cc: linux-usb@vger.kernel.org; Michael Jamet; Yehezkel Bernat; Andreas No=
ever;
> Lukas Wunner; Limonciello, Mario; Christian Kellner; Benson Leung; Prasha=
nt
> Malani; Diego Rivas
> Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x a=
nd
> DisplayPort tunnels
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Wed, Mar 10, 2021 at 10:34:38AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 10, 2021 at 11:21:55AM +0200, Mika Westerberg wrote:
> > > Hi,
> > >
> > > On Wed, Mar 10, 2021 at 09:53:31AM +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 10, 2021 at 09:54:44AM +0200, Mika Westerberg wrote:
> > > > > > > +static void tb_add_tunnel(struct tb *tb, struct tb_tunnel
> *tunnel)
> > > > > > > +{
> > > > > > > +	struct tb_switch *sw =3D tunnel->dst_port->sw;
> > > > > > > +	struct tb_cm *tcm =3D tb_priv(tb);
> > > > > > > +
> > > > > > > +	if (tb_tunnel_is_usb3(tunnel)) {
> > > > > > > +		sw->usb3++;
> > > > > > > +	} else if (tb_tunnel_is_dp(tunnel)) {
> > > > > > > +		sw->dp++;
> > > > > > > +		/* Inform userspace about DP tunneling change */
> > > > > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > > > >
> > > > > > What really "changed" here about this device that userspace now
> needs to
> > > > > > know about it?
> > > > >
> > > > > DisplayPort tunnel came up, so the "dp" attribute value changed.
> > > > >
> > > > > I'm not entirely sure we need to notify the userspace from change=
s
> like
> > > > > these, though. We do this when PCIe tunnel comes up already so th=
is
> kind
> > > > > of follows that (and USB 3.x tunnel is always created at the same=
 time
> > > > > the device itself is announced so does not require any change eve=
nt).
> > > > >
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void tb_remove_tunnel(struct tb_tunnel *tunnel)
> > > > > > > +{
> > > > > > > +	struct tb_switch *sw =3D tunnel->dst_port->sw;
> > > > > > > +
> > > > > > > +	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
> > > > > > > +		sw->usb3--;
> > > > > > > +	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
> > > > > > > +		sw->dp--;
> > > > > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > > > >
> > > > > > Same here, what causes tunnels to be added or removed?
> > > > >
> > > > > Here the opposite, a DisplayPort tunnel was torn down so the "dp"
> > > > > attribute changed.
> > > >
> > > > Did just the value in the attribute change, or did the visability o=
f
> > > > attributes change?
> > >
> > > The value changes.
> > >
> > > > And if it is just the value, who is going to care about this value?=
  Is
> > > > userspace going to want to know this type of change?  What causes t=
his
> > > > to change in the first place (physical event?  Virtual event?  Some=
thing
> > > > else?)
> > >
> > > It is physical event. Typically this happens when user plugs a monito=
r
> > > to a Thunderbolt dock, or plugs it out. This value changes accordingl=
y.
> >
> > So are there other events that show up to userspace when this happens?
> > Like devices added/removed?  If so, then sending a kobject change event
> > here doesn't make much sense as userspace can go re-read this based on
> > the fact that other things changed.
>=20
> From Thunderbolt driver side in this event (monitor plugged in/out)
> there are no new devices added or removed. It all happens to the device
> that already exists (the dock for instance).
>=20
> > > The caring part is the userspace application, I think bolt in case of
> > > non-ChromeOS distro and the ChromeOS equivalent but I'm not sure if t=
his
> > > is something they find useful or not. That's why I have Cc'd (hopeful=
ly
> > > all) the people who work with the userspace side :)
> >
> > What userspace apps read this file today in any Linux distro?
>=20
> None at the moment. This is completely new attribute.

In practice software based connection manager isn't in any production syste=
m in
the field today and these attributes are to determine what sort of useful
information userspace can obtain and make messaging or let user's make deci=
sions.

For example you might envision "at some point" you might let a user configu=
re a policy
to prefer to allocate bandwidth to certain types of devices, but to enact t=
hat policy
you'll need to know everything that is connected.
