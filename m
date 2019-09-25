Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F743BD6FE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 06:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633898AbfIYELu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 00:11:50 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:24466 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392066AbfIYELt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 00:11:49 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8P48j0O029569;
        Tue, 24 Sep 2019 21:11:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=8WM+F97DG3Rwnm7sGthLjrsq0O766Vx4O88BWh9zuu0=;
 b=rLEazmRKIcDKJFjuR7wM1otGKRhXquXUzJODc9h7FHMN1tSQ8M5HKN1KFB9UNraFrNsc
 Hy4UQRqT/d3fFZE73cYdHAiUPdgxBUPnKlJJHZRJzaaZlsBVa4OlkjtDieZunRL7TsTh
 hBCHpuRAKaL55WrId7NJRMejQgoNn4LaR86oesYkRVHrY+lt/6SY5yK797yCAnbpc9PQ
 WP+WbgNfP6tzfZbQIjLRdPXabHp1VcIUjRGMAPB9anBk7iNUe19F9zBU0Lq3LEMs8mMA
 xvG3jOpVDPpXLyA6W2KucbysdrtBILFYsxqKtaRfIdbPIpyLBZcjwSpxISXlTV58bBu7 gQ== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2054.outbound.protection.outlook.com [104.47.40.54])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2v5fewpmqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Sep 2019 21:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffj/FGlDliQIhOoSoDkT7RYgPB76NSDjL8chxCdc4rLvlG5NA5Pg1G7zvNvsZxz7SCtvigT0O/8wmpbJGNG5K5xpPvQOSy1U3NPZkBSGCLaig9NpyNQe8CXeliCnLgXHCA7/gIapPVU+89OYc37BkGWYeGFIryGKkZseZQXZpcatMHNhTr7Cd9ZIHatkFYfpB9zvnyOJ0ygN/dt5YaOvXxVv91bQ9ek1gXgw+Krag8yBHLTlco+PGc1yvr0eXHIRG8Y41y+KKwXDjHaMJsw/If4Nrh/b4amlrow3Pp326ePCXiIfw8jFlHROi7k+iObLuDYgpkPKugjZhU6Ti93CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WM+F97DG3Rwnm7sGthLjrsq0O766Vx4O88BWh9zuu0=;
 b=IyFeyOCfjeVTvfeSzGB8whXyrl1gXnS3cJX7SKLArjwukdJJiqw6fl6D2hlTBG2Lfkh5lA4QxaIeHvyZqReoxQboJsoxXBdb26HToz9VAiiNmqbra+4b81Njc0clZNL1D5Y3jssqjhVH5AKnk9IqG6K5JkVbO6Mka9+TqIrJcKyx4uqIWxy6NOINB/k0m4tI92+eBT535rxXxlNnAfXBe1254lSCcHcTvrnmhmiG65h87xgxiyKYgrKWcWmK/KmU6BQ7bj50RAMsBmKKy1YEIHz0qjiWvelu2weUw32KQ/kCXm5KUv6sdRjyPFqMt9jwM+wxu/YHznvfHLmKlvyQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WM+F97DG3Rwnm7sGthLjrsq0O766Vx4O88BWh9zuu0=;
 b=fOYsOlYGqZf0WfwbrZZKaJ+MEpP6cRBj71r0OHkqZvA+ZYua0eoUm5/xpKkg8A7qMq4ZRh8JeI5RzHPTFpE0wZG0lMv9vUrL6LOtL6exlKbff1HETxIxQpFhmz0cFlDty8CvIrJBX0gMu78tQ4X0dRs6CfNc7RVQn10Xg37Z6CY=
Received: from BYAPR07MB4709.namprd07.prod.outlook.com (52.135.204.159) by
 BYAPR07MB6005.namprd07.prod.outlook.com (20.179.93.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 04:11:39 +0000
Received: from BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::e0f2:de8b:4b8d:e296]) by BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::e0f2:de8b:4b8d:e296%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 04:11:39 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [bug report] usb: cdns3: Add Cadence USB3 DRD Driver
Thread-Topic: [bug report] usb: cdns3: Add Cadence USB3 DRD Driver
Thread-Index: AQHVcuAbXw+wzidSckO7wgpPswA8e6c7xWbg
Date:   Wed, 25 Sep 2019 04:11:39 +0000
Message-ID: <BYAPR07MB47093646D4B9941929A3ED86DD870@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <20190924135558.GA18359@mwanda>
In-Reply-To: <20190924135558.GA18359@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dca9c015-29d9-4fe2-195e-08d7416e7730
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR07MB6005;
x-ms-traffictypediagnostic: BYAPR07MB6005:
x-microsoft-antispam-prvs: <BYAPR07MB6005E81926A115DE2ABAA94BDD870@BYAPR07MB6005.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(36092001)(51444003)(189003)(199004)(25786009)(305945005)(476003)(478600001)(11346002)(52536014)(3846002)(86362001)(6116002)(6506007)(2906002)(66066001)(7736002)(74316002)(446003)(99286004)(486006)(316002)(6916009)(14454004)(14444005)(256004)(26005)(66476007)(33656002)(66556008)(66446008)(76116006)(64756008)(66946007)(71190400001)(6246003)(186003)(71200400001)(229853002)(4326008)(6436002)(55016002)(9686003)(8936002)(81166006)(81156014)(8676002)(102836004)(76176011)(5660300002)(7696005)(309714004);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB6005;H:BYAPR07MB4709.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sC4GY5MwvLSUwEGTjQN7EIIm24pt3lCpowcbcf3Dm39GtD3axP90myxecoZRqVGjMCu02OGERzWGeboRcW8hmgu/+1OirTj53DPUVuaBPtrVkHrbwhCPATeW6Ag7418AAxX68umEZL5153PZPAuVHTR0+D5lhHnnLQRFOhDlwuYRSN3a0VZTQkTOwg7439qawvqrLYqCkn0TRbqNFWGpk4o43ASzYfACS4rY60Ej/dOJ+B4zV6AUgwjFIWCfNW3tYclZnVomVHCLhvMfedD+aOAOFY0auFL6SBeR2+Et4qlMor6nw3mqH2JDzSc+gx4NvpoW94pb1z3uIvNwtpHeoy74HxLG5izuRFK/wv9D9+fXRe1ahc1nDO7QCRwCIK28/s1jhDdKcVR0eIpz4i2DNPOKAvuTSnZxE5G1eZ00fTc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca9c015-29d9-4fe2-195e-08d7416e7730
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 04:11:39.6444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AnvPpqtgBexWUVHdvogPRNrfteiuZGJAK4BRwzC6BKXAr4JMFXHAfxOF63nkL+xe6U2HIDej2DyEoLfMYrxxK0J+c3hSfZmjZNorP3i0mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB6005
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-25_02:2019-09-23,2019-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=488 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909250040
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

>Hello Pawel Laszczak,
>
>The patch 7733f6c32e36: "usb: cdns3: Add Cadence USB3 DRD Driver"
>from Aug 26, 2019, leads to the following static checker warning:
>
>	drivers/usb/cdns3/ep0.c:335 cdns3_ep0_feature_handle_device()
>	error: scheduling with locks held: 'spin_lock:lock'
>
>drivers/usb/cdns3/ep0.c
>   309
>   310                  priv_dev->u2_allowed =3D !!set;
>   311                  break;
>   312          case USB_DEVICE_LTM_ENABLE:
>   313                  ret =3D -EINVAL;
>   314                  break;
>   315          case USB_DEVICE_TEST_MODE:
>   316                  if (state !=3D USB_STATE_CONFIGURED || speed > USB=
_SPEED_HIGH)
>   317                          return -EINVAL;
>   318
>   319                  tmode =3D le16_to_cpu(ctrl->wIndex);
>   320
>   321                  if (!set || (tmode & 0xff) !=3D 0)
>   322                          return -EINVAL;
>   323
>   324                  switch (tmode >> 8) {
>   325                  case TEST_J:
>   326                  case TEST_K:
>   327                  case TEST_SE0_NAK:
>   328                  case TEST_PACKET:
>   329                          cdns3_ep0_complete_setup(priv_dev, 0, 1);
>   330                          /**
>   331                           *  Little delay to give the controller so=
me time
>   332                           * for sending status stage.
>   333                           * This time should be less then 3ms.
>   334                           */
>   335                          usleep_range(1000, 2000);
>                                ^^^^^^^^^^^^^^^^^^^^^^^^
>This is called with locks held and IRQs disabled in
>cdns3_device_thread_irq_handler().  The call tree is:
>
>cdns3_device_thread_irq_handler()
>  cdns3_check_ep0_interrupt_proceed()
>    cdns3_ep0_setup_phase()
>      cdns3_ep0_standard_request()
>        cdns3_req_ep0_handle_feature()
>          cdns3_ep0_feature_handle_device()
>
>You would need to have certain debug config options enabled to see the
>might_sleep() warnings and probably USB_DEVICE_TEST_MODE isn't used
>very often.

It's very rarely used options. This part is required only during USB Certif=
ication process to pass
some tests.  After completion the device under test can be even rebooted.=20

I think that It should be replaced by udelay/mdelay function. I understand =
that the problem occurred=20
because we can't use sleep functions when lock is held, or interrupt are di=
sabled.=20

I will post the fix patch ASAP.

Thank you for letting me know.

>
>   336                          cdns3_set_register_bit(&priv_dev->regs->us=
b_cmd,
>   337                                                 USB_CMD_STMODE |
>   338                                                 USB_STS_TMODE_SEL(t=
mode - 1));
>   339                          break;
>   340                  default:
>   341                          ret =3D -EINVAL;
>   342                  }
>   343                  break;
>   344          default:
>   345                  ret =3D -EINVAL;
>   346          }
>
>regards,
>dan carpenter

Regards,
Pawell
