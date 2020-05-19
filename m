Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D291D8E8E
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 06:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgESEUf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 00:20:35 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:38938 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726131AbgESEUf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 00:20:35 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04J4JMiO012691;
        Mon, 18 May 2020 21:20:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=zR0c6HQm+hP1Ei6qvagy1nyHiysv96U/S9JE/1rtG1I=;
 b=d6hR9zdbFAwv7Z3JB2tfaw/IUBUMHSBVwDgrnmawkdS9eZsvoMOWbRhpkS0CzCgYjIiu
 VAHteWxHs0nX55SwONe6vYDzXeFXx1NqDPPBC9Z5BZjz8AZxnf28q5dnsgbqM15NywnC
 wsoKd3snGuog/WJ/sTVjZewQ9AXh7repwFku3QbRjhqzYimvVBCkwjXMXAcZjlFQNV5N
 3ZOXd5QCUG1AgtckHxyXE21nGClHEY6jgALD/jq5LRaqD1myv1a8YAqZe9LmwCZ+FvgV
 vhlLaUE0P7ZxI2XK/kXanyN+TcxgwnWUk0kRc6YCcIXxyE/jQrp4np2CH7Ly/eNlbhu4 DQ== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
        by mx0b-0014ca01.pphosted.com with ESMTP id 312bs0a0ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 May 2020 21:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrZaLzhFD/1cL240m4TLC0gXUFSFN4FnlxH+tRzTa3GBTHnKrEPAAD0BmKxFGCuQjEwqQdHl+eXtJtA2Et0QKGXVmabTZlrRbaEDNrT0wqCjHMy/dhUL+Jr/y/5fYPVDjTAGZ1VS/Iab/WV/DuihDjF6fqQ+lUALFFwTNzvgNoKMz9fik08FvNpit9vR6B4qc1GwAKBfqr83iO6r7zDYTXwTQtMq3GJiQ3Hf4H4+VCST9qBCW+cAl416H2IvbRtOICoOOkYbzJU8QhIXQGhN1lEkOX7cn+UDW4V6K4SsbxMgFOra4ZlZWkn8KW2hObE7rrzG19ltmWMkEifwcQAAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR0c6HQm+hP1Ei6qvagy1nyHiysv96U/S9JE/1rtG1I=;
 b=Z/5aSMye2iAWhZ25mBm3L+ld1fgvkBNLmkZZQce+EG9MKAPvAr2IUAgA0ViwFdfzFWkQdjPzH9DRUeSWZ6fxv3WGozI8jlFYscwPhCqhB19sCl1hkB/ajrq+jfj92eTA4Wpx+8ge2cZa3yIC5d4kg9fymdNoQLe4h0RcsZgQ7RKucv4mrD5RdqZcs/3aOPuvWaUx/OXFZdvI7frlOBBI5CGo2Auv7hFYvpl6QkWqKv72ugjh21nQIxJqvg+e18c3tKsF79B5gHuAWhreJZvTkbAhaqg62r4f6uvdKC54wrZ92r9PAZCuBGoN3LYGK2WYcTGx9EHR+BgD+bHlKdS9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR0c6HQm+hP1Ei6qvagy1nyHiysv96U/S9JE/1rtG1I=;
 b=BgHjFZvl36SNH8gJuTs5FYSe3RdibAXDNpywTIJCVdqmBFDj+iA53yb7yrNL8xisLG+bDav6BJm8TrXnLKP39OHoW+64JaGsFyW9PUWiisvDOy35ziK+vdfzmjWnaxyV8FV7pjPN9JhqULNdU1WLDahKhuWHQM8qjJQGlUQiCvU=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB6426.namprd07.prod.outlook.com (2603:10b6:5:1c9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.27; Tue, 19 May 2020 04:20:23 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699%7]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 04:20:23 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8uy7m1dDIVTukqO3oFetRWQJ6iu8c0w
Date:   Tue, 19 May 2020 04:20:23 +0000
Message-ID: <DM6PR07MB55296657E3963ACE8C5798D7DDB90@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200426130751.32556-1-peter.chen@nxp.com>
In-Reply-To: <20200426130751.32556-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMGNlNmZmNTItOTk4OC0xMWVhLTg3NjUtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDBjZTZmZjU0LTk5ODgtMTFlYS04NzY1LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMTQ5OCIgdD0iMTMyMzQzMzU2MjA5NDc4ODEzIiBoPSJ0QmVxT1pyYkhlV1R4ODBsdkRXaStsRDdqdDA9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4adf5ed0-9d23-4477-ff59-08d7fbabf344
x-ms-traffictypediagnostic: DM6PR07MB6426:
x-microsoft-antispam-prvs: <DM6PR07MB6426CFB3C5F48E63CB1AFAF1DDB90@DM6PR07MB6426.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZQ4DFA7aXnlDle6Mg+K3Na94OmZh4h5DZxmuVGtv88sJR7ZqMOczBozsUptBv8xqynirRGno+eZav+s5TG1qczQv8dorn2LTejtBLICcCwzQjX8k06bzZsJDn7lXlwST1yuTN1OOeldoM30f+k4XLNIixnjTHPWOJ7gm+rUlhRoaF4DEaUoB4M+bf43snVwLe4APNseBGnDiVvOpwjNxRGrKauvJFjwHSVckDWgdIBUeDSrCTyf/AwolYJoMnjVhRvTLAvKHomHIdjulodEj6TstA3l/+6PY6mt6k14tx1NuTEwZxOHA53ds48TEDlqhI8cSCy69zl69mKugjmAjiEmwwxI5U6tcEQkvs2jTUuOk8JBLYozKkEhaysu5j0m5aSmC8R09CLtFeehwNC24CiuBEp3/9UN5+6bXQczBBk2XNK1Mv2fAXv5ZhUznxHS5s85ZfwD3xpFuXL/Vq5jHwvhYZv57VK7OTtYIds51ejgywMABBMGRk08xZI/cu4Tk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(36092001)(66446008)(66476007)(26005)(186003)(8936002)(2906002)(6506007)(33656002)(7696005)(110136005)(71200400001)(64756008)(5660300002)(478600001)(66946007)(66556008)(86362001)(4326008)(316002)(54906003)(76116006)(55016002)(9686003)(52536014)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SFX/g9TX0PGeXMQgS3Qs/4DfxxQURCJhuRR3iKL36+ysPL7ve5pk2mqhrhpb1qSdDrHUw8kxJbV2kA8OaBnZF9vZjuCDrh4dTZjCoG8b2UDCvSVLTdCL1OqcHVs0FQHfKGKv9xZDPu4gr5/+igrzSYMVzqzrIZ4cj5k2czCMZvO1tf7pNnnbKC4oQygzDFOP4NApRiv3KpzEZJy9mh70Z8ovhri2BY3zzHl6pCMJ02DTuoleti3QKygJJH4a2S+CqIezM3j6arF+8V272MBBPHZrfaA2njQd7KP6+b3tgp9sodEglJTsbdBAOABypWUqGitMcZoP33/HZrcV4Vtt8UVNLAGLENBAziYzxkheoT0P2RPcgrJVXg7e3F4sIMN8ZktyUsBNYF9MTChBwH0FMYOPZsAxefQPwAsr7VkLzSwU9AjKR+LEXag8rRQT28hAsldpTGs+RNtkG2ebYSBYdytdhBWIbzqBbycW/K3wckai2tLP9xgx1hjlUwZL2YAS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adf5ed0-9d23-4477-ff59-08d7fbabf344
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 04:20:23.3480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6xBmJitQSHJS339XZLloSkMSQRYFKwzzqin6l869ZzVX/k8FneHRW/L2rpi4CfUafv/pESxL78HsuMgg7ZPWlLJCpuVHpCBUh8w8c2BxWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6426
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-19_01:2020-05-15,2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=863
 cotscore=-2147483648 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190037
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>
>Each setup stage will prepare status stage at cdns3_ep0_setup_phase,
>it doesn't need to add extra status stage for test mode handling,
>otherwise, the controller can't enter the test mode. Through the Lecroy
>bus analyzer log, the controller will always wait status stage
>even it is prepared by software later than the test mode is set
>by software. If we comment out the status stage at cdns3_ep0_setup_phase,
>the controller will not enter test mode even the test mode is set
>beforehand.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>

Reviewed-by: Pawel Laszczak <pawell@cadence.com>

>---
> drivers/usb/cdns3/ep0.c | 7 -------
> 1 file changed, 7 deletions(-)
>
>diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
>index e71240b386b4..82645a2a0f52 100644
>--- a/drivers/usb/cdns3/ep0.c
>+++ b/drivers/usb/cdns3/ep0.c
>@@ -332,13 +332,6 @@ static int cdns3_ep0_feature_handle_device(struct cdn=
s3_device *priv_dev,
> 		case TEST_K:
> 		case TEST_SE0_NAK:
> 		case TEST_PACKET:
>-			cdns3_ep0_complete_setup(priv_dev, 0, 1);
>-			/**
>-			 *  Little delay to give the controller some time
>-			 * for sending status stage.
>-			 * This time should be less then 3ms.
>-			 */
>-			mdelay(1);
> 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
> 					       USB_CMD_STMODE |
> 					       USB_STS_TMODE_SEL(tmode - 1));
>--
>2.17.1

