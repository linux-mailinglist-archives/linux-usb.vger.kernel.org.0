Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9B233451D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 18:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhCJR2n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 12:28:43 -0500
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:27108 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229602AbhCJR2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 12:28:32 -0500
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AHSIQS012269;
        Wed, 10 Mar 2021 12:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Vugn2HftA7Llwccd2kBUhUEnUDPF1JiRfwf8dc9MrpM=;
 b=nsnmZnslNTKlDQCh2GIuwZcG6ifGxVytAkrZA/QlG0pjjto8OzktwK9FIZYuJjaoW/O6
 UsXGQyvOEjYwiExEkElGOujFDKjblhhcLscJgiFCGF7svAb8DVh0PnIQALAZ43co4Y+Q
 zVgiLjnKICe7ua8+T+pXzJuZ1LEJQm/BjTPXBRAIK2+9k9ZES3S6lZCZfjlyYBSmVKJN
 sLzzKNXfYUZbI9G3Y3zzYyBqRdraEvNV/aEOmxTpi/gfPlRVWyYmYb7iz5QBlKnwQonC
 8zgR537jHB7pzYK4y+QRJufXPKuK7C/F8KYgur9vxDXolTTBItQup2ffMa2VgKXtxHtE ww== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 3745p9edjj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Mar 2021 12:28:21 -0500
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AHP3Lb019256;
        Wed, 10 Mar 2021 12:28:21 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by mx0b-00154901.pphosted.com with ESMTP id 374qucu4ss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 12:28:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggLu5YUMZAp+OBSNBg0QkW2bklPfbm2yxXK/3Q8huKuhUCcVURbHLxAK6B5U27OsxfmC/A0mzS8DC53f0cQfcDYF/o04zPDNoF3A9P3W4oZoTC+Br2ssOOnQq/9ASVUQCsFXL0HIIu0PZKCzA3rsD4SToFkjjWxK+JFRYQBJD8y5Op72DLoOQu3W7Y1C0TWZICeh2yXHKjkX+uT4o/e9rfc8/YPQ3Bxzk9b63NH73Nl2Oab1hWCHDGG4i2ajKOmlqMrWPmGyu4YKLDs7EuTfTQ9oPzOAvVCIV4N36Gjpt/JtUtaHEZadq4Eq67E0FnlEQjMiY8ekkezpH61a9x9Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vugn2HftA7Llwccd2kBUhUEnUDPF1JiRfwf8dc9MrpM=;
 b=NIK2CY65glDjfhoY4E30c7WTQW8kBpHpMI78DFP5sY444KedFrH1CKOOOOzc9AeIqvuqf+IoEVPiXKlufgf8R+n8f7Sva6xzIAbXbU0gZvozfyr/EVBMs9HtoNPXoaPBaQ2MP486U/Bm8wsv+md1MKVl7V2o+2r6JL3y81BROCqgTxk2/6+eOGfxs5Z4frNh8loHPMlS+1H6xdCnlnvZg+Hlt6eLGROH5DvlD5aKKgSS9bqnXOuO/5AIfq/UL8cxmLeoX2Z8k9e4M7CMkfZhJZkJF9E28iI1pU9Z2XAn2sBWys7mV+Y0SOzkwzTc1S+xST7v0Thf9H2C9tqfY/Uu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SN6PR1901MB2192.namprd19.prod.outlook.com (2603:10b6:805:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 17:28:19 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50%6]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 17:28:19 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/3] thunderbolt: Add details to router uevent
Thread-Topic: [PATCH 1/3] thunderbolt: Add details to router uevent
Thread-Index: AQHXFOrmgF3oCt99rk+j4JSzOX46aap9euog
Date:   Wed, 10 Mar 2021 17:28:19 +0000
Message-ID: <SA1PR19MB492689B6C9A525CF47DF742DFA919@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-2-mika.westerberg@linux.intel.com>
In-Reply-To: <20210309134818.63118-2-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-10T17:28:17.2834703Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e7065510-f389-4f57-a532-37c4c1584121;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ead27a7-80c1-4edc-5e67-08d8e3e9e5c9
x-ms-traffictypediagnostic: SN6PR1901MB2192:
x-microsoft-antispam-prvs: <SN6PR1901MB21926574840D4D436301BAD3FA919@SN6PR1901MB2192.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kzwkTKk2U5SrEXauajZGxPdYl57eJcRngm8Fw6atiPcQxW4qaS5XR1rmohMteU/wLdlG2wm4wiPjIQo4awc51omvUstE3RD9DSYliN7CF2n3jBbpBTbaD/bPuXD+32BLv/4cqQurNexru1gx+SOUn0I1do3b/ANCKrdI4hRyHl+zv/sMe6zi3wnCX9Mxs1oXnihuUDuCLw4ioS3IVtuSqJoBv3T4VFTu7jt60IRx7+Vs/G3V44O+XMamwknTIMMlxs+nS5IdAOYLp7tAJeKkMHiJoubiSV2ikXG6XmS9kkZRLUq42ydasCVLvVBKSnQI5BTj3muEcwz3fGanQyTCYae10IHlPd+21h2xh2MfyCBcBrmtlyv/LixpP7+ZEJi+T1/FHwgWnYuJNiNSqQe2oqS+ZciJI2uJjDMf2Lu6XDJZU76nbfVCU9mUuX8RxysodIpD19JEFW9p5mvywNs4FfRrA55+scx/otf0LjOJERodDKRHOjXZUCQUVEx1Z5tfA7IuvJMse9qNaNk72Jk8Dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(478600001)(4326008)(71200400001)(86362001)(9686003)(5660300002)(55016002)(53546011)(6506007)(7696005)(786003)(52536014)(33656002)(8676002)(54906003)(110136005)(8936002)(26005)(2906002)(316002)(186003)(76116006)(83380400001)(66946007)(7416002)(66574015)(66476007)(66446008)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pKRZ3cuKIoTLrC+yG8fRFEoVFJvAFkGE3S+lzCB9g1e9xrVzQeG2MD7HHGez?=
 =?us-ascii?Q?RvRVwjR7IpQ9jlf+XuZT3DZ3aTInovQeSreKFvKTN8zJfXiceAXuBdjrZNQP?=
 =?us-ascii?Q?FlBbQF2sciItXNpt/rAbveg5byvfTrf6RSPpCPt5qNA8zuirytEDqNnmXfPD?=
 =?us-ascii?Q?5n93yXGiD9Y1OexmS/IBfzPsuwO+XOxvt5zHa8HJ7dxGwsM8hW7fePvK6jnx?=
 =?us-ascii?Q?9YTF6spESXiACR98TjM5FjbHu5YZdq9ctntyAYWX9lPItWtbEeIlffkeXDg2?=
 =?us-ascii?Q?66AVxRzu1JMl9aDyAoBjNnuTE0fdyzIG+19rVDrxPJXLoD0nQjOCdTXkubH+?=
 =?us-ascii?Q?GgVWhyno96uWSB7mMrRpJgjfhonUFxVTiv0FUiYUXAyg6oa/O/yLFpPrdS5f?=
 =?us-ascii?Q?ocdq+vaSj6z67ANlQkgIKjbTAaeZgagMu6CoWGzjbE/NC3y1hxll4KJA0nyX?=
 =?us-ascii?Q?+JJ9eIqEdkpqcOb7KrUCap8PHMjWV57lOOyrexU5SARe2OZ1Bq8Sw3aoVUAV?=
 =?us-ascii?Q?qSzDERbziKzjp/N97yoECxx3n+8NvZ2MKEKnOpisYno+D/7Nj8ZuTTl17a+d?=
 =?us-ascii?Q?dOLoISUguPTTOQ5FRpT7jFCYvEIXt+IUJX3Pi/pp/Qy5WHt7SaGnTVJuZ2tv?=
 =?us-ascii?Q?XSCkxKcNoi8ue89+4mfdzY8OESW6scn0AJkaUT4GY8su394DheGzzOCMJwA9?=
 =?us-ascii?Q?4U4PxyqgIhGmt4GfnzhkoB4yS9Z4qdmahFuWlqB1fyccYpvj5OJFSGtoG/FS?=
 =?us-ascii?Q?3nCreygVDQ07iVaAWi6RsgXfV9Fj5gO/Cs4F9qK8Zr1RMKP+lhLiOnm8CVUb?=
 =?us-ascii?Q?nr5dKl9bw9ozqJkvTFqRS1bHbF6luasKl1a8ivFJXhwnVHQ/RJLBPNiUxo4Q?=
 =?us-ascii?Q?TGlYIq7kzNDmH9Uvy+0vhLBFbVohmRaIOzOiSCTzuUBBY/8w3XLzEqv61C0h?=
 =?us-ascii?Q?9LE5eywAsKDQ81UUyl+MWklc5wo0itZCCqdXHBGNcBug5vXxADpwr1cQ45Is?=
 =?us-ascii?Q?ePeg505m8Aqht92cB3PYBwBQp4ga2V6y7OVW0lx0BE6cn+Um8takv+Q4AVRR?=
 =?us-ascii?Q?aIg+tyfHSzxhyw0AmkGV+LeW7WY1U8MPMEqYGs3RNw87fxZMKGFw5p4gPtzN?=
 =?us-ascii?Q?FWcvX2dcxNjshRDgjIPahblCx9Ls74FFBCZh6rACYjMM7PsqlP0GYiPm41ql?=
 =?us-ascii?Q?8IBkhDCRVTqRmbVWbGYgt9OBnQDhbZj1E2/A6oevGJLWoPcDrsuGJOnWpeP9?=
 =?us-ascii?Q?jGQFA4fGK9fAh7oEXYpTyHd2EidIuH3AUsUgn7B4GYmbbeJD0iySNdmHyvt1?=
 =?us-ascii?Q?g4z8UMsjvMV5THISMYvfVlrO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead27a7-80c1-4edc-5e67-08d8e3e9e5c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 17:28:19.3516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Alg481BCjoaKQqSj0X+u14QJb7udMH3+RxY+gAwzPUAzmW4HRF0ydQ+fFKua56lb6YTqJrLD9tjj8CrhOZUzSTkfCldjAjKGwhFr8BS46zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1901MB2192
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-10_10:2021-03-10,2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100084
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100084
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Tuesday, March 9, 2021 7:48
> To: linux-usb@vger.kernel.org
> Cc: Michael Jamet; Yehezkel Bernat; Andreas Noever; Lukas Wunner; Limonci=
ello,
> Mario; Christian Kellner; Benson Leung; Prashant Malani; Diego Rivas; Gre=
g
> Kroah-Hartman; Mika Westerberg
> Subject: [PATCH 1/3] thunderbolt: Add details to router uevent
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Expose two environment variables for routers as part of the initial
> uevent:
>=20
>   USB4_VERSION=3D1.0
>   USB4_TYPE=3Dhost|device|hub

Presumably this will then show up in the uevent like this for a host contro=
ller:
DEVTYPE=3Dthunderbolt_device
USB4_VERSION=3D1.0
USB4_TYPE=3Dhost

Since it's specifically for USB4, how about if you instead have new devtype=
s?
TBT3:
DEVTYPE=3Dthunderbolt_device

USB4:
DEVTYPE=3Dusb4_host|usb4_device|usb4_hub

That would at least make it clearer to userspace to make a delineation if i=
t's
legacy device or not.   I don't know if that's actually valuable informatio=
n however.

>=20
> Userspace can use this information to expose more details about each
> connected device. Only USB4 devices have USB4_VERSION but all devices
> have USB4_TYPE.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/switch.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 72b43c7c0651..a82032c081e8 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1827,6 +1827,39 @@ static void tb_switch_release(struct device *dev)
>  	kfree(sw);
>  }
>=20
> +static int tb_switch_uevent(struct device *dev, struct kobj_uevent_env *=
env)
> +{
> +	struct tb_switch *sw =3D tb_to_switch(dev);
> +	const char *type;
> +
> +	if (sw->config.thunderbolt_version =3D=3D USB4_VERSION_1_0) {
> +		if (add_uevent_var(env, "USB4_VERSION=3D1.0"))
> +			return -ENOMEM;
> +	}
> +
> +	if (!tb_route(sw)) {
> +		type =3D "host";
> +	} else {
> +		const struct tb_port *port;
> +		bool hub =3D false;
> +
> +		/* Device is hub if it has any downstream ports */
> +		tb_switch_for_each_port(sw, port) {
> +			if (!port->disabled && !tb_is_upstream_port(port) &&
> +			     tb_port_is_null(port)) {
> +				hub =3D true;
> +				break;
> +			}
> +		}
> +
> +		type =3D hub ? "hub" : "device";
> +	}
> +
> +	if (add_uevent_var(env, "USB4_TYPE=3D%s", type))
> +		return -ENOMEM;
> +	return 0;
> +}
> +
>  /*
>   * Currently only need to provide the callbacks. Everything else is hand=
led
>   * in the connection manager.
> @@ -1860,6 +1893,7 @@ static const struct dev_pm_ops tb_switch_pm_ops =3D=
 {
>  struct device_type tb_switch_type =3D {
>  	.name =3D "thunderbolt_device",
>  	.release =3D tb_switch_release,
> +	.uevent =3D tb_switch_uevent,
>  	.pm =3D &tb_switch_pm_ops,
>  };
>=20
> --
> 2.30.1

