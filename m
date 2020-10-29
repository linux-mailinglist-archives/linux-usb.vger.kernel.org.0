Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9E529E93E
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 11:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgJ2Kom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 06:44:42 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:32624 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbgJ2Kom (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 06:44:42 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TAg7XC002749;
        Thu, 29 Oct 2020 03:44:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=LUJtA3etv0EkYQbq1HFo/m3gr2IDvyCKueUuegcieDs=;
 b=Gri1VMNqZX7Pt2zYImgD3R/LUhnu3J139oBmcQhPHkjmyEvF8oLKgdlq9OiUKXk2RpJN
 s3kYiQ9O2Vpdg8kQ/I0ahAlCen6ti89erV9344OMWcmtfTwez6VOhPCGEE5u7W4xdGcy
 fhFbRyVQjyghZJ/Pz/Lii2Fjlki68m41cv0ZZy1i6wtu/ID5Z5RQyzUPw366HYVtsVnD
 sGjNLcCxN1SxizfVolDa+IlrcBZxJYMSpABcLsvsNvR4P1/6IdzasBSI9etnnl9EOqrA
 uxkRYkRukH1sorC/OxH8EAamoR08bP2z5+OMS5bKd6UKUzOZqYDIzc26sZhwT7HeczDm /A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by mx0a-0014ca01.pphosted.com with ESMTP id 34cgtw4p7v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 03:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/utX+ddnhC3fTFUqhAcUJkj2rzT9cKUb5DcN+/JCyvq06CcyHHguTAMWxXvjaE7Fcmv5VsBHzOzxYRcoFgZg9QqZBqNI8rSbqViQTcsFCOVWN28uaWv6xG6DHY+80cWXhBCJVx3mm0BQ+xV8YWAN0kQsIRGExFKai1Y7vii6JLijqmnyzrAMGq9EFaWY5w+n8c0/64VaGpvvq41AiOVk5NYibQl3A7G8lxhWrrHephNGcwunoxIE/H2MZamfqzRsl4BLOocEDggQVATsrcaa5ZAs/cmUD071qB9mmggS/5meb9xfIOwzsZ2ka+kvx/oa1qzA2LJx9cV2yC54KqlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUJtA3etv0EkYQbq1HFo/m3gr2IDvyCKueUuegcieDs=;
 b=WWshD/0FoRaq3XuPEdZIEQkpZcqWrFwU/aYssnGXp+qJ3n3U0oAtCpAHf4aSBsRFL76D/xcmIw4Sc3neugwUShx6cRsVxkE4+b0TqsEIGokGqiGzbHlmjiW/ySH324aBcKHUyptgMJzzBzP0GbodFZwbvebSHGaHps+0pHM8LimF7gr1PjlKWtCCFxaV6fJUA5f64S5lwuNwjghcrhrOtngFPyjn77E1NgqNi0FW1FJTNIV6g8ya8h2Hnzw9QtFlsJ4/LpWDcdDyZM7vF3YKD5qIZlv483dlCRYQ12tv1k37bvBlUD2DNLOxrJtk48s0A4SW1ws2Mo5V+ZxPFVoSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUJtA3etv0EkYQbq1HFo/m3gr2IDvyCKueUuegcieDs=;
 b=7GHvLxTju0we4YT/0gU4uv+Bq1d0bibGX50PYrRAp0gkeppO9dXz48K0KL8LCs0iOMTfVEeJmhRxVJ+9wBy7stLfO0A2LSfR29/t3gTh+8lnTUVADckkWm36wHHt4pecClYbjlOyipUhzTsXgVe5HWb2BcuQCTu624deDGf5qPU=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB6665.namprd07.prod.outlook.com (2603:10b6:5:1c9::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Thu, 29 Oct 2020 10:44:30 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::2087:7f2b:5dc6:a960]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::2087:7f2b:5dc6:a960%6]) with mapi id 15.20.3477.027; Thu, 29 Oct 2020
 10:44:29 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>, "rogerq@ti.com" <rogerq@ti.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v3 1/1] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
Thread-Topic: [PATCH v3 1/1] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
Thread-Index: AQHWrdnZgd7g+hejJUmPQcZGC6EnBamuYpCg
Date:   Thu, 29 Oct 2020 10:44:29 +0000
Message-ID: <DM6PR07MB55297485616A3FBD8EAEADC5DD140@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20201029095518.24375-1-peter.chen@nxp.com>
In-Reply-To: <20201029095518.24375-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYjZhZDliMmUtMTlkMy0xMWViLTg3NmItMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGI2YWQ5YjJmLTE5ZDMtMTFlYi04NzZiLTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMjgxNCIgdD0iMTMyNDg0NDE4NjY5MTI1MTgyIiBoPSJTd3Q2QnBpSm1RWk55Zkg5UGZlZ0hUK211OVE9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93f9aea5-1c43-4d74-d6d9-08d87bf79d47
x-ms-traffictypediagnostic: DM6PR07MB6665:
x-microsoft-antispam-prvs: <DM6PR07MB66653CCCF0E9E29840C46EDADD140@DM6PR07MB6665.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JVZHs7o2XjYwXctWPjHelHVX/tWr0lzosa+Q9xtdj/G4zYiId4lWNnxSXr/LP9G8XJ3dHogJRYOYvaTzE8hyu7n1wqOxxsOQ0KuayCsrU500rZbZejyaMmyLRjoHHbf2Xrff43TlWq+plJvyWvPxGeOzKdlGmpbmSI1UO15V9Sx3dvAjJzD1qnOoUsAp5gtNxXTErmcjkAepvigXYlYLIftBEHwwz75BAGoOvtL15yXq+F8nADb5sRoRt2SkXMt55ZRCjCaU4WtOLjN3MoY6gNgkBmeZrAcSwqrM0mEh9DnSDlxI84lsKGURbd5Gr9qJ9G9NteY0aDDrgMXZGmUcMKadDdkUvPlKDYCz98+8PuL9GQuUz+umZBv/abMn06n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(36092001)(2906002)(15650500001)(316002)(5660300002)(110136005)(54906003)(6506007)(26005)(4326008)(186003)(478600001)(9686003)(7696005)(55016002)(71200400001)(66946007)(8676002)(8936002)(76116006)(86362001)(66476007)(52536014)(66446008)(66556008)(64756008)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: vFQKN5sh4FlYPHGQS4pnSKWo4ao+zD/LUrOODrNPrRV67QB/cjjDhGo/rA8LD9nwyGIr+AMCqkAyBeh3LIK8Zfc5azF1g/MFODdIzm04H2/Fe62ltlMtuO2kBpF52Y9W1NxP53nz/VHOC+2bGeHXZ28EaVNMQZh3FH6Xt6MD1iQpOyqdorxUYmmA0/KTTaBGf8nFm/9TjURWsIY7/lXizv/9rRW2sCzyYK0Xa07X+CmQGi0+dAcY9OdsXYjJXULj781gb2e8870zDWa8MLG+PtlaRKwEHPhkHKQb3FMK+yUjdmwympSzpWqApBtY3TrqgNAnZNTGiL0cCjqrkaCXnzdYREDc1uHGEd+iATyjweeNyOaXldvVYMbvJBMgbE7eei2UoVX23pG/hhbzVFCBEVudxB4lXqglP6IKC8j0+kgCj7OOoQZsAcyPOIEonbteI8VH3mVUTKwFafvpJle+Va1pJuDDcYafR7+2dgIajTYrw9X7e91Nnuze7vmAllTp16Dxlg6Uo6aoNLVhBxwp2lmEgIvIFQ7Owlid1w53SwedjulKnaxhbDFMTgYMEyrnJ6GJpVuTE27Kvqpm31ftlH1kipBxLQ4E41SVCfF6P9MGuwov+R3anLPwKJQB5v9AlKHkvSWsIGsT91UHbKeRgg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f9aea5-1c43-4d74-d6d9-08d87bf79d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 10:44:29.7845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8hy2PzqgvawHcXw2bgNLnnkrvt4QDPi6BrWeo+Y2BkwVY4/RopDZ24MhMvvjZrOQsDpwYoPfXPAq7j7+W6OwX7ZcPZEJaZhMvej8NjyS5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6665
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_03:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290079
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>When the system goes to suspend, if the controller is at device mode with
>cable connecting to host, the call stack is: cdns3_suspend->
>cdns3_gadget_suspend -> cdns3_disconnect_gadget, after cdns3_disconnect_ga=
dget
>is called, it owns lock wrongly, it causes the system being deadlock after
>resume due to at cdns3_device_thread_irq_handler, it tries to get the lock=
,
>but can't get it forever.
>
>To fix it, we delete the unlock-lock operations at cdns3_disconnect_gadget=
,
>and do it at the caller.
>
>Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
>Signed-off-by: Peter Chen <peter.chen@nxp.com>

Acked-by: Pawel Laszczak <pawell@cadence.com>

>---
>Changes for v3:
>- Add __must_hold sparse checker
>
> drivers/usb/cdns3/gadget.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>index 6ff3aa3db497..8e02ccdbd4c5 100644
>--- a/drivers/usb/cdns3/gadget.c
>+++ b/drivers/usb/cdns3/gadget.c
>@@ -1744,11 +1744,8 @@ static int cdns3_check_ep_interrupt_proceed(struct =
cdns3_endpoint *priv_ep)
>
> static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
> {
>-	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect) {
>-		spin_unlock(&priv_dev->lock);
>+	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect)
> 		priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
>-		spin_lock(&priv_dev->lock);
>-	}
> }
>
> /**
>@@ -1759,6 +1756,7 @@ static void cdns3_disconnect_gadget(struct cdns3_dev=
ice *priv_dev)
>  */
> static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_d=
ev,
> 					      u32 usb_ists)
>+__must_hold(&priv_dev->lock)
> {
> 	int speed =3D 0;
>
>@@ -1783,7 +1781,9 @@ static void cdns3_check_usb_interrupt_proceed(struct=
 cdns3_device *priv_dev,
>
> 	/* Disconnection detected */
> 	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
>+		spin_unlock(&priv_dev->lock);
> 		cdns3_disconnect_gadget(priv_dev);
>+		spin_lock(&priv_dev->lock);
> 		priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> 		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
> 		cdns3_hw_reset_eps_config(priv_dev);
>@@ -3263,10 +3263,13 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
> }
>
> static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
>+__must_hold(&cdns->lock)
> {
> 	struct cdns3_device *priv_dev =3D cdns->gadget_dev;
>
>+	spin_unlock(&cdns->lock);
> 	cdns3_disconnect_gadget(priv_dev);
>+	spin_lock(&cdns->lock);
>
> 	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> 	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
>--
>2.17.1

