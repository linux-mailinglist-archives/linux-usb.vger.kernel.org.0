Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162E3245BA4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 06:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgHQEho (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 00:37:44 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:30620 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725983AbgHQEhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Aug 2020 00:37:38 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07H4Yh1m001316;
        Sun, 16 Aug 2020 21:37:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=QZUf2HTthGW92k1RdidoA2ppTCFX4o44p8+NhZ9zRvk=;
 b=MOuJHts1IwGe3Yc60XJvPBLun1U4YOmIK5UW7z8JCwsoo16ae4WBbTWbDtu7/EWo0diW
 qpP6DrEBi3LR9H4I5MAMxWt13t/C8yeohbyaBoNX03I/pG9E10IzzoyjqGfIke/CKKNx
 DJmrn02G4mKs1Iye+pQdUNDd7YhaKS99nuwBmwo94cQexP+53O3GIYRjL2Ji9Rktkbce
 Y9hfCaZwHePNuF/2049Wy31J5Y0QiOqFdAm5fWMejxTJ/+DNz2MJg9RBJ4q+/3Zwit0+
 BL7AaXjpFWnzgdju2ZKjQFtr9T+ibnkUDb4FLO/1tu1gl8eW0BsoFAMGqp4RtaSTvvkn Jg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by mx0b-0014ca01.pphosted.com with ESMTP id 32xba0d0gf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 21:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa1b1kMgPlcedjodXe1sVvjVzZrfGO3scIL+yzw9w9fEpXa/QLMuQDz+KatAcStEwXHx/XgEikAeuIAH1H245YLnQqCPM2OVGRVyujMVg+AaPygCOefBL/p2nNapv7Jis+d8QMrgfI/CyD+ylMTTNp3GGqExMAHma8ID5Yd0/m5DJgt0X0dX5R4jGm4sLCcSaGQcAi3ejmo/JEiht2r/20+TPmGrnOT6/ODzyt4rY17wisKPp9y4/02eQRKVV8IzQYKuunIFFwueAckMrkF8gcyWhi03GJqUVduJmnIWjHphENfmu/iDBqeSYRAEHm8MSbfSEy5pdQa1dI23eQIq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZUf2HTthGW92k1RdidoA2ppTCFX4o44p8+NhZ9zRvk=;
 b=Cbbj78IXIDsMaXyipeASxC2zbW0oTlZaUbZSOxRxfuqCwrToPL3I+8Gq4CK/q8ujEhoDJll59Cl0Tpsj2ZfQo9LSevrc303P1htBcV+hWFWtNHnQGEgLuMR2SDXFBwr9uqPqftmocqfpBYEST95eRi3Ikz+SjuwSRJeK+Y/0l6A8/w73N9aHAXE19yUrGcqlUXVbsSqeEgayo10vC9T3F0fIIrFatNrQEN7cfd/8XBDl4vxcEfXorPODDfOcIxFIynIZL+Q/JFkXTViDqAeiV/W66mH/VcF6Po8zWPXf5G1OjXXXCrzeCf03EU2FpEd9eMEvF5e3ePYE9jr8e2J19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZUf2HTthGW92k1RdidoA2ppTCFX4o44p8+NhZ9zRvk=;
 b=t2yJOTZxZ56k5aqI9FdNXD24iQv+gVHGNp6XO4gC7XzF68fedqBBQd7JvxlcPZkcRNuQUPslUiOrXy2RFRCMHfQFMtk+AIuFCVg+JxcbVXUvW5npuSddn6pK2TdXd2/LPgYz1xj75y0pTjsiEpbh3g9+28LEUxjFWsmx7oxXXoY=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB7098.namprd07.prod.outlook.com (2603:10b6:5:158::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.18; Mon, 17 Aug 2020 04:37:24 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362%4]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 04:37:23 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v5 9/9] usb: cdns3: host: add xhci_plat_priv quirk
 XHCI_SKIP_PHY_INIT
Thread-Topic: [PATCH v5 9/9] usb: cdns3: host: add xhci_plat_priv quirk
 XHCI_SKIP_PHY_INIT
Thread-Index: AQHWVDNCW3WjLSrXz0WTEcln9/QW86k79vyA
Date:   Mon, 17 Aug 2020 04:37:23 +0000
Message-ID: <DM6PR07MB552946569333D23154D25E57DD5F0@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-10-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-10-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNTUwNTE3MzgtZTA0My0xMWVhLTg3NjgtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDU1MDUxNzNhLWUwNDMtMTFlYS04NzY4LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iODI0IiB0PSIxMzI0MjExMjYzOTIyMDkzNzAiIGg9InN0bXh3M3YzYThsaHpyeFJPNU5sZFowaXhpMD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aab09a8-749f-4d28-8354-08d842673c9c
x-ms-traffictypediagnostic: DM6PR07MB7098:
x-microsoft-antispam-prvs: <DM6PR07MB70984978F27D1DFAB1F5A147DD5F0@DM6PR07MB7098.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEBY4Ht68kcJhM+WIu42bJSBMjsxSxBB5uYogQs52zv4wuUYZtFs7dpL/nE5ATCCBhC29My+fx9stpNQdYkKq+wlIizPgewvyHth8kHCEJaVjZAKZLwv4QJ6/Mw1SMmWEq87vruFzPVfKHzjIS8jY8TE1+mfZC3q6EzSfWhBavnQHgMB+7zgKJ6Tl83eRhiCZGIyicJ1HeRxIopx3coMtikY7sJyiDIqpbbjucPtfqvgUlcE5nlyApBJUkJUzVy/2dpBKpJkRWh2S6m70Ep+WSXzgfGdaMW/291gUMRMW4Sqr/CShcmBPyOBwjSK9vCUz/ypFsC90vxglDR7ramEiIe230+YyWof1mq+yg7Xjeuq2LO0lEGyYIJxbCGNgc/R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(36092001)(4744005)(52536014)(5660300002)(110136005)(316002)(8676002)(54906003)(66446008)(55016002)(66946007)(76116006)(66476007)(66556008)(64756008)(71200400001)(33656002)(83380400001)(86362001)(2906002)(9686003)(4326008)(26005)(6506007)(478600001)(7696005)(8936002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MeVdOZzS2EaU+5eynnoJsFT83Gz8TX4brn4hXqel+H6WXUqfKkh3tQzmn9nLHuYWp9yAo/k4l0WBqydIVUi/P8y3Uqkuv9JM7VBZg3Z1IlxbsVpfHBbovUc/X6bgCQtsKYtMsTGjodCQ6OyL+7OP+YvrH07k4C+HhsHZNwTbl8Y9j6K4H2t35RZD2Xk7hbRDCCIEwpKPRNvg3ocqzHNCfU7ynEEzD7UR8uktW/4O9peTIIHrZ98z5j8btM8FdR2+zsy04t9X4860TPMtYqMOyraSYrfchuURsZkRPdVbTRFdE1E6gLXq/4no/oBJo2L19POdxbYh3S7ahmp/jBmhHoZH3Um2iiRXFO0LjijFVSXnfqjFmS/j1c0tdmWeSQ89bTZCGlA7RByaTsM7MC9S/dXWT1152+/rqJX5rUefMLsBy1fHN/mXHjR4Tv0/kueXPEom3c6Qg1eVlcFykQfovkpyKyy5BEst9komGcXk/Zbr4GjkkL1aEAXbh7Yvn++lnPN95wR/nlSs2f6i/vMPMfjQqFXDNwIyUJkuKeury94OcQTrjVHvKGWdc6BNLrVF5UtqgiMfRBFPCzwyG5KcBxPwY20zFmEPuby6U6c7GPqbIv0y/hcPnSixJzXwZ2iSid5KWjxlXFRkUkNYXwwM6A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aab09a8-749f-4d28-8354-08d842673c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 04:37:23.7370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VacDk8X9VvsO1vgoWYekv77SxR8EyPiHiu1c6jIk+4JMLjMtB0+BuC+IJPam5awyLdsiH9O0u/PzVFkYs9f7ksPW9R2bNndQD0mT+JPzqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7098
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-17_01:2020-08-14,2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170036
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>cdns3 manages PHY by own DRD driver, so skip the management by
>HCD core.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>
>---
> drivers/usb/cdns3/host.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
>index 030d6421abd3..1dfbe23fa089 100644
>--- a/drivers/usb/cdns3/host.c
>+++ b/drivers/usb/cdns3/host.c
>@@ -24,6 +24,7 @@
> #define LPM_2_STB_SWITCH_EN	(1 << 25)
>

Please use BIT(25)=20

Reviewed-by: Pawel Laszczak <pawell@cadence.com>

Regards
Pawel

> static const struct xhci_plat_priv xhci_plat_cdns3_xhci =3D {
>+	.quirks =3D XHCI_SKIP_PHY_INIT,
> 	.suspend_quirk =3D xhci_cdns3_suspend_quirk,
> };
>

>--
>2.17.1

