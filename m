Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FC4D1F18
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 05:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbfJJDsk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 23:48:40 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:36176 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726722AbfJJDsj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 23:48:39 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9A3lcE1028395;
        Wed, 9 Oct 2019 20:48:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint;
 bh=ra8VJUpstVKTc0TznGGRLAgMt0gW2ihXkY5KntNl4ag=;
 b=tg6uqyR+oQWQRxq4CGopLsiJPEeJYYyWtdk6DUq95j5afgeOJaMAAy52mCyNBpQAQXK2
 aF1RRip4vk+d3rAG1ZXPqb7BT1OAN6XzXNOudxPVm2qc7o7RN2M5vLdqgujrgFU9MG43
 mc7neYWOwAVLSRNM/UtaEAK4OZGZJfvyvqNOlsfX5PNOmzzpdvF4hVxNFHNvti6l+5X5
 fKC8oQjaJ9omZ+lagLMwWTaWKH4c5rONHl8jmA0EEKxVcBxuSmA5cngQG9kPnBYwI5ZX
 QeayMMCRvrNiyxlSl8jfMSvzVQWU+oGXzUpgpR5F5TfVFlXnMamoMesOQvBlk1izL96A vw== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2052.outbound.protection.outlook.com [104.47.40.52])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2veqqyhh9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Oct 2019 20:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geUMRxV2nd0rMsYhghJM9ns7LESJB+8zMTjj81PM5UEiBSg9XBoVd1qB08JBAeG8iNQNup9mkpx9h3EwNCtl/z576Tx1wLMEJodpdwFP6b+5CJTqxBMEhgqsocWWZdLqXkrb5lrFGFXy2In2wrw/n26UAaBjoPACrKebvKfxpXU5GKHvEVe8KpcDj+85TilwfmL4YB8dppR7B1WOSQMcHRaX1eAEmiKT3/9hDXoJS/b8fVeTN9AdB9wvmHhlGBTskpY9nKcNTQGLppEVvc4kuhTP/VrMKp/WdD8XYZ7YSnXPpUGgt28RrkQrQ0soDQEEwdjAUvCX5Ha0LWaPQzRetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra8VJUpstVKTc0TznGGRLAgMt0gW2ihXkY5KntNl4ag=;
 b=e9EGHmffeC0riJIIyzqXPfcflXAEyvtXXjV0y19PvQSGzrubAVxAmBo6AGEI8zOScw8X1Zt88NIZI/CAo6kan85BkzrFO8i9jjSg8OYN1WK6mGBMklrvgU6OGFU3osJYLAlNkCr7mdkzx7PEBzRchXPmdugSopzBaYOMThMlh9JYuVuR7Qkm7gmtoyMpVzA58Rjsm9XwUQgitY+CchZ3QoLCvayh2DBjrbGgGUVYi8iNoSFhKugW2omWogPQKoCftk8CDA0zSYcHbbNBKsP7DF0As5SbaPsFMKLA5+aakjCoASZR4aiHGTT0Gf243o4gGLNktXZolGB2A1tZ8e7HkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra8VJUpstVKTc0TznGGRLAgMt0gW2ihXkY5KntNl4ag=;
 b=xcAbdRR4P8ODzhBwyeDea16Eoa1DhvE2TzoK1+Kq1FOSwif2baBWhMQPz11n04yvr+a0ts0io31eiQaZdB+BKaT1kzM/ow0Tf7D1YKLvlHOzkAkbbqfVukQ++HnXm6lqzRSSJ78lgK2gwldeKqWczhLbLjpsBAfSXX7zWGjw8G4=
Received: from CY1PR07MB2572.namprd07.prod.outlook.com (10.167.16.134) by
 CY1PR07MB2650.namprd07.prod.outlook.com (10.167.11.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 10 Oct 2019 03:48:34 +0000
Received: from CY1PR07MB2572.namprd07.prod.outlook.com
 ([fe80::5d55:65ff:813e:b6be]) by CY1PR07MB2572.namprd07.prod.outlook.com
 ([fe80::5d55:65ff:813e:b6be%6]) with mapi id 15.20.2327.025; Thu, 10 Oct 2019
 03:48:34 +0000
From:   Rahul Kumar <kurahul@cadence.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Roger Quadros <rogerq@ti.com>, Pawel Laszczak <pawell@cadence.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Sanket Parmar <sparmar@cadence.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Need clarification regarding UASP gadget status in Linux kernel
Thread-Topic: Need clarification regarding UASP gadget status in Linux kernel
Thread-Index: AdV/Gv646Um/EM7zTPq50Qhnqr+W/A==
Date:   Thu, 10 Oct 2019 03:48:33 +0000
Message-ID: <CY1PR07MB2572A2CA838486A896F67965A2940@CY1PR07MB2572.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNca3VyYWh1bFxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWQzYzVhYmMyLWViMTAtMTFlOS05YjRkLWQ0ODFkNzFiMWRjZlxhbWUtdGVzdFxkM2M1YWJjMy1lYjEwLTExZTktOWI0ZC1kNDgxZDcxYjFkY2Zib2R5LnR4dCIgc3o9Ijg1NSIgdD0iMTMyMTUxNTI5MTI3MDQwMTUyIiBoPSJjMmsvd3R4dkVVWjU2L2p0SDlDeFNQV3JCelU9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-originating-ip: [158.140.1.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e9850be-a1ba-4c08-d750-08d74d34b97e
x-ms-traffictypediagnostic: CY1PR07MB2650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB265023AA683A3393CA05FDE2A2940@CY1PR07MB2650.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(36092001)(189003)(199004)(2501003)(81156014)(8936002)(8676002)(81166006)(71200400001)(71190400001)(256004)(66446008)(64756008)(66556008)(66476007)(66946007)(305945005)(7736002)(2351001)(76116006)(74316002)(478600001)(14454004)(6916009)(25786009)(33656002)(5640700003)(6436002)(55016002)(9686003)(66066001)(4326008)(2906002)(86362001)(54906003)(4744005)(486006)(316002)(476003)(6506007)(52536014)(7696005)(102836004)(3846002)(6116002)(99286004)(5660300002)(186003)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2650;H:CY1PR07MB2572.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z0xuTrKDAHkt4xvFFi3/0GMc5f43nGvrsYRJY/AfTuhiWyIVIyyHGsJCoFg4naQPGaxVakU/crYBvPCMbrOBndwKiJF79jYcTdHt6ZRm/n4S3kyz9tplx0UpWgb8lWltd54XMQreluD1q/JVnSDAmxuqSzfPE4xP4lYP0fZjgD5ZwpMN6RGbe7ciLjEEKAb53chFoGxUE81M/HGO5XTvTZ8vQjj3HhmgsSNMSgxl1C4OrazhOha3JHZ7bU1WIo/tHwBG+A10KuxVp+myKzOrW0+kmD5oWIDd/Pf02Php3mEdl7ijTNMlSDxqhabFe7zLY0bZ2083PDUONeUKYHxKkbLtn4BLCE3qJozOF/Av3JN2TYbte4X/f2jt8PuqwVAE4x5lNdEmBZvJaFhvIqkOcRIAdlLtfTB0l9jDBEyW0Vo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9850be-a1ba-4c08-d750-08d74d34b97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 03:48:33.9631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lY/hJzRR5IKpAm+Y7u8p+3Tgs5NWA4Mjbb50orlGIzd/sCc8kX6Hx3Ljvig3Y1Pn1ISY3T8jr/3zFW6Vsizoui1RuFxoK9jQFmFDYlm75sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2650
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_01:2019-10-08,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 malwarescore=0
 mlxlogscore=400 phishscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100032
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am trying to test the UASP gadget based on f_tcm.c against Command Verifi=
er in super-speed mode.
I would like to know whether anyone has had any luck in this regard.

However I see a lot of failures, due to lack of features in the function/f_=
tcm .c code. My understanding is that it doesn't support:
(1) Handling multiple commands in parallel. The current code waits for the =
first command to complete sending its response/status, before handling the =
next command. However in command verifier based tests, multiple commands ar=
e sent by the host, before the host sends PRIME on the status endpoint.
(2) Rejecting commands if illegal stream-id is presented, or other error sc=
enarios.
(3) Handling of task management commands.


Regards,
Rahul

