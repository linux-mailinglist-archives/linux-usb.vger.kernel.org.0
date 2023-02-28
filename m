Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F66F6A561A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 10:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjB1JqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 04:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjB1JqG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 04:46:06 -0500
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2144.outbound.protection.outlook.com [40.92.62.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB1910A8C
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 01:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvkv/lWqXBQt882EHXsNGHxNxjhQXnHh9h6FQOtkFnyuhEptn5LUTM9MsHzWQ0vP4S0fG+sGLumymdupZEpK0LAwBSsrh66CsuLrsGM9bUZzu6AAy4CoAItcBm3ahegu/ZTSgzCnsMlYfK+Vzp9bIgZgeDagF7s1JZkOyXNPKtKVoAXuzy5ZcS6la6+rWisMqh5M8haN+UlzzNiiXjgWTE8LJ3nvQPrCTjBSSSUkJFKdvplQuNmFH8SyodJ8PlJH7kQA7icNZ2PZ0HvxFbZOrlHgP4lWdKhaXCsGKvoMRafcnw/7WijGPamKujHakub6LpK4OrMEKDwDLG19qq2BKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfBjrWsoAoKgCbx4pzuuIkgVxBwZs5jqyHwED5kOJ4k=;
 b=UgrELfkhMvvBeej7hVK8N/KMChLxC7+5nHCaFP2JC6TxPC4xOfl+EyAFLlDLdr5OWbFt6J2Kpg8aAjxCsohwOFGL8ce0D9UOu8C0dKpRJsWYdhD9jAbR2RfdukRq3pZcIwNXEsaOqFn6Ab0ArpiqKgpusMuTQWTdg2/wqY8WEBq9jPGtknV+RMGHTJby3yASRxBjxtQTG9j06jFVGQu7FHHkImBzSOZmsN2TwklKPpkeUViqMMr/asyaqji2ddMe/14VrPbJ+mj0WbHXRSzuFo/WBbuGyXMzE9wImtGDJ+rYb2MB5PI+GeNgnIIaijluRCn7ee21omKFANi4grD9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfBjrWsoAoKgCbx4pzuuIkgVxBwZs5jqyHwED5kOJ4k=;
 b=ubk3aSBk76GEhNfPJfsDud/ey5q0JtG6MmSS+yOh0byDblKyWszq3UmrPSVtNg1PNB715lWPlagC7CX+g++QmsLhyP1hbRzXNU1TO+c+/7kvIzOnYj3S0sIeJgIlgDsTujn0gx87hd+lSnp8FbLUVOImGGvRCsfjSwG8iSy6yoe9C1y44KXwj03YryZEGm/SEDA9TYs2Dg9kFLattvV6f2Sph9hOkiQKyQhIVdv1Lg+blJe38wqeH7L4h7HWhyxuSCUzepgpKzmL8+D2kf61p0LOmqxv86L5Ts9mVdPAZ6/Xpw/2myxPURKfDLJsIDbjzIycDZBN6Pf1wQAVqHKjeQ==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by ME3P282MB0884.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:44:58 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4%5]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 09:44:58 +0000
From:   Yen ChunChao <nothingstopsme@hotmail.com>
To:     "davem@davemloft.net" <davem@davemloft.net>
CC:     "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 3/3 RFC] net: usb: ax88179_178a: Allow live update of devices'
 mac address
Thread-Topic: [PATCH 3/3 RFC] net: usb: ax88179_178a: Allow live update of
 devices' mac address
Thread-Index: AQHZS1lS1m3VJU2uwUClrI4Qi+U7Zw==
Date:   Tue, 28 Feb 2023 09:44:58 +0000
Message-ID: <ME3P282MB28272C76B95D78090B3876FFD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
References: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
 <ME3P282MB2827F9C56A588D9794DC0750D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <ME3P282MB2827F9C56A588D9794DC0750D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [O1hF3daOmKQUDQXDJL1pJe/WcAYo4gbu]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2827:EE_|ME3P282MB0884:EE_
x-ms-office365-filtering-correlation-id: b017dede-ebc3-4cc5-9721-08db19707493
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBx/TYnIdkdS1pMJ17p5AaM5mwa94l07TW/OqfwCCTwi6oGJhrRPAyrlcTPdv8M3hriGYNhqtOV1OqkS7K8nXk9cGCUy0ZU/h+m5loCX6LjWbSsEeZA7/aLUahM9Iz83TX2P6wmkZZolGefZ/JSK85aA5WUJdm71DuaSh+Dbl0m/KpE4gXHvJ6CgdbMt7yLQBVj+4iDfdb7zxuTDg+qRM94nMqsEvfAtVLt0mY5QdT6FlEx/ycA+VocRoSx2CeOJD8Rr7zj5ZwV8y9FxVXqlO7+tfZGzh/DUde6bDK9N4aPH5jVsdM161CsgFeS3gdnUhA6lqU4pziHVaXkSdSDKLavtMcY9qfC3IK5n3Iv8GJF8pbhghXxj3fNLLjV5msHMzqSBDcEX1oNxKXTZDw2cqDTT9CKqeZbw00lSwmlmUf7/T45kD04GpccWon67Gig89zIQFOgDkKljE9BBbxhJBpWZfCFyfXboRexXz8o0mMw9jYDX4ABad19Y+usmvmf1vznUSC0wVmurE4Ybj10jZfvYI41aCgQDd04UavAOzJkOGjSqnUGY7UHEK5YNrVdYkIHpL6/Hcj9DgJ0NzoneNA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BYSIuahmcHsM3bYgNax09+HVZi3dM0wJfcEBlMyDA4owhGXej+Od4eJQWd?=
 =?iso-8859-1?Q?YSJjSOEUQbu+dr1N6rBGnA7tb8Bgrtf6NJywrpfkAQxpzGW9/FYw2RTLiZ?=
 =?iso-8859-1?Q?gdCCTRg9XzAJ7rC/1qFZOmXZkvMUU1EfF5auhYn6mKg5xen5evQcF/GhpZ?=
 =?iso-8859-1?Q?idyqHfMocsobS5WtD9R25S8801orJTPmhpVXRefKQ++ZPC1bggucZ7Cilb?=
 =?iso-8859-1?Q?ly6MRPbVQqN8aLxEexa+kfSnkGt/B4D7HzuXay5GCbXmpdtCve04f9cDiL?=
 =?iso-8859-1?Q?2JXyPLuc+i/VMFz5Y3/zdLuc0q4K1b82uh8cskYwtMEvXTvlX2VFYJ4WXp?=
 =?iso-8859-1?Q?iKfsdQAhi8GAU7ShpNM3iVhyMB+DYk+zNjfDy5UfS+x0hmsohOAnwGmSfR?=
 =?iso-8859-1?Q?+5jwfhk7aPn4N07KH/aRIPBXZAORYaxpGioLH7zFPEXF0hjxsTqi5+u9Z0?=
 =?iso-8859-1?Q?d/NRiiqCubGVWWcwOXllDy/VyKrIpwcu1no1nMwYvq+r8Te4PQzqDZORg1?=
 =?iso-8859-1?Q?iTOrNypzfNx/tpe/8Sv+kjhVVpaeI0OuW/BmUWEdOzK/1bquFnfaraPCAb?=
 =?iso-8859-1?Q?OfBGJ8CZrV80G+60g1IqPUZ4ALdQFZVXhBTR4WSdM7ff15RdEoT5EgzuDO?=
 =?iso-8859-1?Q?j3GlSOUL1vU9BM3olq4RIScxQLiK3Z9cu6oJ0BND5Ssib+L+aPj4VRXXZG?=
 =?iso-8859-1?Q?fi2tR0jrJRzMnnUDJcrXa/xFprSqVK6M2nhRRZnl/YomtssMdEFfzvvwSK?=
 =?iso-8859-1?Q?ftgcOVLbTqsS9wQDN/zgu03+wi5ZPMIjSuv8BP874cQC3xioy55ojeSrPY?=
 =?iso-8859-1?Q?rI48H1dpX3ckKW9vM7oO8JXu6/jEmurBFA6qOBiJebHl9KHxDzq8jk7xYW?=
 =?iso-8859-1?Q?jMrVc086wtRBWrnHDSQQhSEronzLrbbQiS7gjfSRmdkT6txnzoHKRkK2f/?=
 =?iso-8859-1?Q?kuDdrvlHtWTsRsya52vWU54EcXeNhp8is9jxxfumBp3+5abe9W3Se6s0Bl?=
 =?iso-8859-1?Q?spX/GEhaUI9Bs/3vmvG6ym7NmP39Du8cIIK23p2J0gl188YWrVVIkZ8vI4?=
 =?iso-8859-1?Q?mnWBV0NYjTXeDv4J9C3BR1txLzOWOHw5hnFkoqaEGfjIX+lNF22X52A8Pv?=
 =?iso-8859-1?Q?rlaqTZgo8/1CilRQkiSwq4KuUz4WPKhqRCcaYTA7llDxEByAS9RDRLT1UN?=
 =?iso-8859-1?Q?96Df5ntndv+qmCmE5Dif4+UZXEGJS7Ec8VqF3fSgDcoVTLaItlU7YjunHy?=
 =?iso-8859-1?Q?sY7ybRCkORzHklCFZrbbpn8mQpJXaxb7kfjhwhmKDucyhk1iJBaFVPx/U9?=
 =?iso-8859-1?Q?g4Bt8SrrlBrad9zze20pQNrQtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b017dede-ebc3-4cc5-9721-08db19707493
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 09:44:58.5281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB0884
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Problem Description:=0A=
Live update of devices' mac address is currently blocked by this driver, as=
=0A=
it requires the evaluation of netif_running() given the corresponding=0A=
device being false. While appearing a harmless check, it can be disruptive=
=0A=
in some networking configurations, such as "Link Aggregation" operated in=
=0A=
active-backup mode with fail_over_mac=3Dfollow, where the mac address of a=
=0A=
device will be updated dynamically even when it is already up and running.=
=0A=
=0A=
Solution:=0A=
Remove the check of netif_running() in ax88179_set_mac_addr(), so that the=
=0A=
update procedure can proceed irrespective of the boolean status returned by=
=0A=
netif_running().=0A=
=0A=
Verification:=0A=
Only tested with this device:=0A=
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet=0A=
=0A=
Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>=0A=
---=0A=
This is the same patch as https://rb.gy/nxendp sent in Oct. 2022.=0A=
I just would like to know the current state of this patch.=0A=
Has it been rejected or still under review?=0A=
=0A=
Thanks=0A=
=0A=
=A0drivers/net/usb/ax88179_178a.c | 2 --=0A=
=A01 file changed, 2 deletions(-)=0A=
=0A=
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.=
c=0A=
index 96ede3a131d4..84016e0567d4 100644=0A=
--- a/drivers/net/usb/ax88179_178a.c=0A=
+++ b/drivers/net/usb/ax88179_178a.c=0A=
@@ -958,8 +958,6 @@ static int ax88179_set_mac_addr(struct net_device *net,=
 void *p)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct sockaddr *addr =3D p;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0 if (netif_running(net))=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EBUSY;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if (!is_valid_ether_addr(addr->sa_data))=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EADDRNOTAVAIL;=0A=
=A0=0A=
-- =0A=
2.32.0=0A=
