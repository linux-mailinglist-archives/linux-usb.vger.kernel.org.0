Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F00762856
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 03:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjGZByW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 21:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGZByV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 21:54:21 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2081.outbound.protection.outlook.com [40.107.8.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A9A26A8
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 18:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z42WC3xfnD8V44mPZpMJx5/PLKA9hsJKbqFYFD4Ab+WOr7rXlh8A3l8UdXKAorE4tXP+o2emxd3QBhSM6nA5vYtm84Ehnhy/y2hGDqGH9WuuUMrnXIj6pkGMyhD+TcmNAwPZB5cHgGfncE/nU4EWDnGq0z+1GLQIOQKPHGjoPE+fWiZEbuLbeW0M5iJvYVZUoGEF7rMmmWvn/d7aSvKmQPtHdCotPgQIXJs9PZC0xGkfes+zOyOEOMmySaG+KALFbyYGGjo0mMTz/aW39VAqaLmdQFu0eIh0munk6/3ZZYfCOwP2wkCbdNH4IfF0uPFP9K0J/Vs6HW1PCHO4NjA04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6SlabFUn2Lw4eOFQviQEp1cAu1mY040cRt6jNfMbc4=;
 b=ZzNxDlhNTxu1rdtcDv4tgbS52GYhodzWlymcm9eCU6vNbAnlXFQqnbAUeVEil18MyAV6bnC9gC1+1v6BbUC0t3ifkuk9BmxUO8cfqlcNR1+PO+4WFvFhZFC0BSLRSFqV4o4zNsAQuKiE2g5inQqTDYuY2R5qliwryI1ZTHWRV2aD66SyMay2T6BB0B/BQd3sXUvulqcaO32LMS8Z2KNu8rWDpI0rLEukS/ZBrDd3Mm5en8Dmt+I4pQ5rH/A5AG1O/XF1Cc3aE2moIqg6UfDVdGYVDjpKiXB3ZlkPOM7Z5EJ9jpkpWNlCwdCcjpfyVqcdwNNRQa01uRmbrhfRFAxb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6SlabFUn2Lw4eOFQviQEp1cAu1mY040cRt6jNfMbc4=;
 b=A6ZKaey06r97esvHfp9/z7sLkQSe2MHl5O2Za5HLn0nOwM4CN0f6G8rYNoYrSwC52Xvz/+5w2ezd4/lWTevtgiAH1GA9X3+jXa7D46FBHsaQt58ogjy+r/4+SjOJJ77F1+jT5HR4mn73jC4ufS4ZuWeECHRmC+vrrwoL3r/vxLs=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 01:54:16 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 01:54:16 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "heghedus.razvan@gmail.com" <heghedus.razvan@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH] usb: misc: ehset: fix wrong if condition
Thread-Topic: [PATCH] usb: misc: ehset: fix wrong if condition
Thread-Index: AQHZryXt7ONMO208O0uU14qd1PDJ3q/LaaWg
Date:   Wed, 26 Jul 2023 01:54:15 +0000
Message-ID: <DB7PR04MB45050DD873B70F1A0F41D0CB8C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230705095231.457860-1-xu.yang_2@nxp.com>
In-Reply-To: <20230705095231.457860-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|VI1PR04MB7200:EE_
x-ms-office365-filtering-correlation-id: 046b97eb-1a6f-46ef-ee50-08db8d7b3793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hH40un2JuC98pZWq+4LwqiM5gTgqGVvJ94qScEVBMqjH4tlI7jvf1mFpOJrK4tZp1TQ0GM4nQ3Hsx2D4xbMkNluQvo8WK1lJHb2Bp7Vkf19/EVnhdSLNBeymX/k3HhZhc0eCCfqyvtrdHUS3yvYQ4aTrJzZn3bS9288X2kalUWc3gbKQfQT3YNZwnFgF2QYr96FL7m7ltUl3WGmJjK4uZ0GmQ1QGe8g5EpF2QKGj60Q243T4sxHDTGWNYOJkSkE9OFlIvk0dyHtIjQwiUfS9vCqnYPvWM/ez33Jxu9rFyd1u+QX2TC3bRV35n2Kwwv/qfRlygPhX4VTRxLW/lvB/Y87LZFoh/HDkB25Ly0EnvgkYlE4+nXyoWxwf4XPWYUWCwvIumtDf0GILYXd+voz4gG/+d203PmO740wJ9d7OSq3eKfOgWOidmr05z7bx2QeED1HWUR/rTHQmjNE+JEbI9A3+SLTL3FSu6r7yJGKgGUNPMs1TGmPja5D7Ogdl1tOLswk/r+Xs9hRM+8SQSehx3Fhu/W5jGsdzch9HS8Vx/f0UKpDJmE/QXxWrSpiNLiQSdgodutA0BAFHjnhYK48OkVwnTNSg6Z21RVveM6/LFNPMnYt2pCTSyO6q/W85AndH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(38070700005)(86362001)(122000001)(33656002)(71200400001)(55016003)(2906002)(54906003)(478600001)(38100700002)(26005)(6506007)(186003)(9686003)(41300700001)(5660300002)(6916009)(8676002)(7696005)(64756008)(4326008)(66946007)(66476007)(316002)(52536014)(66556008)(83380400001)(66446008)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7BhO9UnuKcGp7Kr4k2zAWQ4dzZ81YCpVEqAFMWd42p4U3sJnTiBdnPHoGfpS?=
 =?us-ascii?Q?nCs9gQ8aSmE3y7xzB8LOlfbaT41naQT/jYCrYBixTQTx9ap5Mflu617n+JGW?=
 =?us-ascii?Q?298/gDOcktgTltkJoY0gULIPtUUpGPBlttL4KR9ZOq6P0vAA9daXep/0apMl?=
 =?us-ascii?Q?OSmCfOwa60Egld7uqpTXIrlXBP3P0sBsWwHAzDZyTcfm4GYKJXCPseB8q3QG?=
 =?us-ascii?Q?AaNQyy9Ytz+K8C935WA3KVns+JFms72rw5BSKzYd8Ldu+hqDF9BaCPI8PiAF?=
 =?us-ascii?Q?kr9qIX+loI7YPsByBoFTNAPXOwV3paaqjITWkljrAQ4B4m56KidbUBL2c4RX?=
 =?us-ascii?Q?275shmEbifjwStpdCuWfTJteOsAs7Z9JxoJqCcd/vJPLJc8FwMSsVUHvTKEm?=
 =?us-ascii?Q?f4cTJpQFvn93gOUeVWheUBtAc+kTdpP4jw36sCAfYUy5IvHvQqQ4r0xM3jHK?=
 =?us-ascii?Q?EJpgLrL5vYsOS2vcso3BtMaZy9JPsOjGR3Fprkz3HtQ8huqFMphkOgJ1TXYd?=
 =?us-ascii?Q?/mEB+HzM53OIL7z5YZ9rgtU2Opmrmds3e5jTCI0WeDAf4UAWHU5xXNQGbI/o?=
 =?us-ascii?Q?FNIl/y5i7B17XjAOw30FcANaNNbFH6+sKOk/kieQ+3S/Q+rp2CovQKdbgQrQ?=
 =?us-ascii?Q?WSfb9nzeHOc1rssh2MzvxizVeMm8kSRToo26s4DnUN+Ym2zMTMYmi/ylG/fg?=
 =?us-ascii?Q?YS6bnfwfgN/PhgU7WpfyduXH981vQY89DLQaJnKh/+qg/G4q8Tp+FTlNxFc9?=
 =?us-ascii?Q?/070jtDvz5ME9gZCnyLEpNZbsOBbGiTk0rob4ZkDhvA9HY6oWknGeCyBbcld?=
 =?us-ascii?Q?iAZosrZ2EK8cOQoc0C510yrzL1mDWt3axFQ6aVPDUshjR8uKGcmFqCiBgl+4?=
 =?us-ascii?Q?T8CDmLuMctWx20n2cSbFIo3AFvkkzOjBLRGEkeIPVlChN957zG23VNTDIaTD?=
 =?us-ascii?Q?2eXcruyoPJgqaUw9r5tyYcTjqr9RwEnTZ3HGXZb/hUU64b+Zm5hGrGTI1gFB?=
 =?us-ascii?Q?P3HwEZGAynGTOk1oN10A5EMOCaYqayDk6HxVMKgpuAc7Xf6PxS5zkKXPCdjr?=
 =?us-ascii?Q?HhPjyLi52qGRA7PR+DhVziB8OQN4NKg/sv/bWJP0dPiYjKRze8wlv5AQLjr2?=
 =?us-ascii?Q?VNlx9QGh7khPV3tKSvEK/q+WWOrCehC7/EyGIhOJJh7xiPGGS4GSb01dSiyn?=
 =?us-ascii?Q?PM/+BZI0qJKBO5Z74npVV3WJJ5wzW8I3515SXdthpxUR5RkqCzI/hSMSv9mY?=
 =?us-ascii?Q?6DakkiyzmxnCnSqAM4Oby4X/Vhy7zN2kDCb0Iiwg9lARJR6PLxC7xlIQG9hp?=
 =?us-ascii?Q?73vrG1jU00NFCRc1qbU7LAufrw+RhXYzHEnoAgErUuHdO8AdYqMDHkU89qE1?=
 =?us-ascii?Q?0Y13vBc5lhqQhxqWMbw79z8oHZqG+8VP3bVzqbnIVdDkMbhTqyqRTkX9d4Ye?=
 =?us-ascii?Q?IldY+WaJ+dXJl0H48yfzu9V1t95lJLUT3OMHOxO2nC2l2fmtLb35JwyzrqSr?=
 =?us-ascii?Q?j+GjDykdH7IQixji7eM1h0gG4+ENkEGOa16GkIf4Q3xKTDhSMEkR97VVgT3c?=
 =?us-ascii?Q?hAlNvs960rHNy4UnhXk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046b97eb-1a6f-46ef-ee50-08db8d7b3793
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 01:54:15.5737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dCIEjxfXzhp6FyXNB1LfvOJNVKCTWPOILhxDzltUo1ULQfPIoNpBYM7csRy6Zk0gIkZ99dKODs5dqeiGWh5jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
>=20
> A negative number from ret means the host controller had failed to send
> usb message and 0 means succeed. Therefore, the if logic is wrong here
> and this patch will fix it.
>=20
> Fixes: f2b42379c576 ("usb: misc: ehset: Rework test mode entry")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/misc/ehset.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
> index 986d6589f053..36b6e9fa7ffb 100644
> --- a/drivers/usb/misc/ehset.c
> +++ b/drivers/usb/misc/ehset.c
> @@ -77,7 +77,7 @@ static int ehset_probe(struct usb_interface *intf,
>  	switch (test_pid) {
>  	case TEST_SE0_NAK_PID:
>  		ret =3D ehset_prepare_port_for_testing(hub_udev, portnum);
> -		if (!ret)
> +		if (ret < 0)
>  			break;
>  		ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
>  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> @@ -86,7 +86,7 @@ static int ehset_probe(struct usb_interface *intf,
>  		break;
>  	case TEST_J_PID:
>  		ret =3D ehset_prepare_port_for_testing(hub_udev, portnum);
> -		if (!ret)
> +		if (ret < 0)
>  			break;
>  		ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
>  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> @@ -95,7 +95,7 @@ static int ehset_probe(struct usb_interface *intf,
>  		break;
>  	case TEST_K_PID:
>  		ret =3D ehset_prepare_port_for_testing(hub_udev, portnum);
> -		if (!ret)
> +		if (ret < 0)
>  			break;
>  		ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
>  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> @@ -104,7 +104,7 @@ static int ehset_probe(struct usb_interface *intf,
>  		break;
>  	case TEST_PACKET_PID:
>  		ret =3D ehset_prepare_port_for_testing(hub_udev, portnum);
> -		if (!ret)
> +		if (ret < 0)
>  			break;
>  		ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
>  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> --
> 2.34.1

A gentle ping.

