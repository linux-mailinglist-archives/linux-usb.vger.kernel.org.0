Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BA96A525A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 05:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjB1Ehj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 23:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjB1Ehh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 23:37:37 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2105.outbound.protection.outlook.com [40.107.6.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38BE2685C
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 20:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khKA9nfHRU6D0HI6lKy6jVSFh3fSPREyKg603Zhffv/9k41pjtQ32foD+NakJUqW8WJu61ehtgPmxyC9TO5huXixPzMBAIXB43i3D4HA2FcVaYqsfYh9jvuKqFeaJR+Xhs64eOF/9+q3VYaulxKBU/wovJ6a64vIN53R19OnN18vG5/MV3oZ1OsWjoDCQnKPnj5EYPhcagMbgOQtB7oXvy//Zie74ThL4KKGXFp6BbctVNIK/M2B6bFM/IGv07MiQPsR/SNsJIvxMuRru2IIamJppvP3T0T+CQl4i2Fb6kFrtUUNB3GsvcGdqyKj/+4wWc/DrCcgxGxqCXhYPb3DFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pc+gLtU+ACCqHvfaJlHiY2TT3klV/3xnUjGOLSqRV8=;
 b=QIsYCj8RqoDDemFjIXsK+pb26zgGynoKNeoKcWbPQifdDtyepO+Bpr7ZBsIOjB1btze90reBW/P5K7+u572TA7tBUElz//tLO1ATJqlayDu72VoIvdR9M6PGmumZUlOd84tth8TR5xg3Wrt5TA52eq5k4SIl9SmzGFZSwIV/di4e+Af+XLbzTc8Y42AG1rHlB6XGCBdWsVx5NCZNn1oCpzTdWP50KZWrsprZRYud42mMhlE2azwQTkTDt5zgZunW5dUHO4YALs7FMEsQWFonUTyf97uiSH2bO1hnomqSgzRb8ES67Mnqn0XheJSVkLMtPzjAw5QvqgmUNnX8ErN69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=se.com; dmarc=pass action=none header.from=se.com; dkim=pass
 header.d=se.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=se.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Pc+gLtU+ACCqHvfaJlHiY2TT3klV/3xnUjGOLSqRV8=;
 b=JKVtV4+SDdjFanuVuwewxrGmHo8DLGyypG6NE9Ws9BWjxkTYiPwLaRYEMgkslA4gkhzW/KbrDnK94IyEdOuRlAX1GakBACNBsTadrEp+w2VE723EGie3xE8Jn817/H3l0wY/QHuVzT8j3MrJZo1FNiQ6qsPT2MH5wSoQCDYmE5l9YqiOPOQ8O5YgHvA+nA78Qc1ZERNqGnHFuqcL4ph5UeGhalvUpFxPwB+3X7kk6qHuHJcXUfQ5qSBcjEjugI3aSfkld1O8v602PuUhFiEkcllLjTkCL0gIS5JoVLSaDcGU3FZJwgF+CGf+top+O3Tcct6R6hRpN3fZE5zRCYQ3ug==
Received: from DB7PR04MB4012.eurprd04.prod.outlook.com (2603:10a6:5:1a::22) by
 AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 04:37:31 +0000
Received: from DB7PR04MB4012.eurprd04.prod.outlook.com
 ([fe80::eee7:ad41:2f7:f28f]) by DB7PR04MB4012.eurprd04.prod.outlook.com
 ([fe80::eee7:ad41:2f7:f28f%6]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 04:37:31 +0000
From:   Fengyi WU <fengyi.wu@se.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
Subject: RE: USB transaction errors causing ERROR unknown event type 37
Thread-Topic: USB transaction errors causing ERROR unknown event type 37
Thread-Index: AdlKYZ4E1yiQoFZZQKy/QYhvkMBcuAALZ1IAACJeLfAABUhMQA==
Date:   Tue, 28 Feb 2023 04:37:31 +0000
Message-ID: <DB7PR04MB401234A7AC2028D1E0A15A9F95AC9@DB7PR04MB4012.eurprd04.prod.outlook.com>
References: <DB7PR04MB40129A44420006C5048D8F7095AF9@DB7PR04MB4012.eurprd04.prod.outlook.com>
 <a1871c3c-d2a0-72e9-e96c-f0791b4663be@intel.com>
 <VI1PR04MB401592DD04F6BE20FE7F5EE895AC9@VI1PR04MB4015.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB401592DD04F6BE20FE7F5EE895AC9@VI1PR04MB4015.eurprd04.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Enabled=true;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_SetDate=2023-02-28T04:37:28Z;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Method=Standard;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Name=SE Internal;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_SiteId=6e51e1ad-c54b-4b39-b598-0ffe9ae68fef;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_ActionId=5df45e53-5691-485f-a884-c618197edfd4;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_ContentBits=2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=se.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4012:EE_|AM0PR04MB7123:EE_
x-ms-office365-filtering-correlation-id: 404980f0-1271-4da6-6e00-08db1945812b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sRoEW6s/FAhu6Yb1KxKT3Znsl8PYW0V8DXiJomLB0udITNfdRJp9lN9Dr1D6aOMU++P4qmlqK6ttk5rkbbP1tmpBQBPi6iztq5YhZB1kKnyr3qHTRYKCrpOkBFbArPftsrMYQZGmgILDsQ7aWpllF5H4R+j2L3GKiNYM4OcjtPoP54ip/OQVoLpXxgoX0FatAnO8PtGAbwxAQ3i6YcRzmJpxya1UoYeNMtgdjo1+8+GHtscXXCeUZSq3hOOQmbBv1vHTARxZHiVcbiY5RiNJ4NblmJTJwddbP/KN9XrSk9qSl+iKaMVnFaGy5k9QmY0qNm870Yb1Cj8+r18C3oq7P9LnWa0au7mkD1gDrrxlNsWL3SVbrpi/9ha+u8wxitFtYw67b6kePQ6oKRBNOpojZ8wAStO1/GRcpSnQBwaTHFaqx+1GzqnjoJfcbJeFzT+70QmNedQ+s70Akoyh64Zs4HI6qYWi2Kb/q3L09JJUiiEGi/vGqW53GanqoJPAJuORtc0fstTlPaRY237uRt5y9suwsCAbDwulko2vkFnXYrlZo1BP95B6nUj8AVk8ErVD/85Y6dOOZSvXhiaGnzMDcpE7//6l6HPMuH8IIfWnZKPNy1EelJen4d+kBq4e1r0cjDUrnq4USUrZO2teeJKWr61MEr3GHlry07dk8pKCcwjRidkFE2myoa5uImgd07VIiRO0xwrRBhAZ2Awv9CRc5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4012.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199018)(8936002)(52536014)(5660300002)(2906002)(41300700001)(4326008)(8676002)(66476007)(66556008)(76116006)(64756008)(66446008)(66946007)(16799955002)(9686003)(86362001)(316002)(110136005)(54906003)(55016003)(45080400002)(33656002)(966005)(7696005)(186003)(71200400001)(26005)(478600001)(53546011)(6506007)(38070700005)(83380400001)(38100700002)(122000001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZxohNUMEvELifIUaf72DK/3KulM+qzXL2ulc0AHoXC0hItluv2r5IpdvkgRP?=
 =?us-ascii?Q?+xZx4N50AMsco1OgY1WW1RphtpS2XxmK3/IrbeItKBbhwCgEu56JUtVUG0BF?=
 =?us-ascii?Q?bHnY11zWqmSE+6Duf/i9LLjkruAvsC7epUhun2Tw9xQ9aSDJei9r9ug4j1se?=
 =?us-ascii?Q?0957j9cRWzj/NnBZ7JrquDdpmKelNR0O3za12xQ/P3D/QUozEF8UAtzOBoU9?=
 =?us-ascii?Q?dOQpmiTAa9AQ5KGm/nq9XjYMrjEDahyOks/BQOLz7Ye4Ran/wZBfiV5ZHL/x?=
 =?us-ascii?Q?32ebf5/YtN7KkSQVJurY/fKGLtsvBIRbuBtTRqKkAO+8qyv1l12fGmy1+8zn?=
 =?us-ascii?Q?WPhEuKGLCOLhZfsVdMcTxpGKH6JQ8XnMBGpWKeel+14c/tah7LWQ3lXFjLBm?=
 =?us-ascii?Q?PHc/KtKZNhqVZv+MP/Im+LmAKNihLts17ZFnhczJnfxPOpVSCmlUREwJS6tJ?=
 =?us-ascii?Q?Vh85Vws7AASHG7O12NiarkAsgBlxIw5ycJIIws0/Ts1011MflDtmcZx2hAv/?=
 =?us-ascii?Q?0ZjqxVmm7Jei7RsLgalea/ZIhDjYTw2ylK/ujZGj/v7alfcssBwZiO2/uwPT?=
 =?us-ascii?Q?O7o8yOHIVOzE+mznWObSIeihvOU/rAc2ni+Wxh2pS7Zi6X9VUDGPXeleynRs?=
 =?us-ascii?Q?T0Zu1vjpWUXb2Ajj2Lws7pOw2Ixi0xc7pt0/3ctWMrqnZDXo0RFkItzVfD7h?=
 =?us-ascii?Q?n43Q2Rjr44w4lCswaIp/U+siQKKfjs5YL6zZaIQgdUvQjQZC03okJS5Tt1lX?=
 =?us-ascii?Q?OxPnxRqL1+YCKFKsQYmuD9EvW7giOyNBPyOacUt5U8pZFZfVnPnlAMFpuJtH?=
 =?us-ascii?Q?kYrfQI0vM+Qm4IbmSPLcehT0418Naes21e7NoKWUthW0lXxw+nrHFB1IZ0+V?=
 =?us-ascii?Q?5jk8RKpimY5a25TbgMrp16WT6h5NnobXi+/lacdkRgDiU/ejPscqlYREumfP?=
 =?us-ascii?Q?KIwNiMWyX06n6y4udP17akiAa7tlUPKlVKZwqgjIN0ok9dXOOr/MjF2FbknV?=
 =?us-ascii?Q?bUMQ9wtdErfwMXHGmarqC/H9/MLHgT3hUAgG3u+JF5AQajQTwWWC51mAeBX2?=
 =?us-ascii?Q?r56VyD1Cb8vbKH6ZR89Fbyyg/17ijKeH+3HD6LGjesMh3KzM6V41vY9YpFoJ?=
 =?us-ascii?Q?dpDmjPUNK/50xqsysb4ziGID5vuMTvBiY22PyA/L3KeYDUwyY3PiplFAkAKF?=
 =?us-ascii?Q?9ZLJe0sAtnFEtAdh+R5Kz70qBUNodHo+okQqgxAmVpZ78D6Zwc5OQSwrU+eJ?=
 =?us-ascii?Q?p7exFJTgwq5c+jv6GKPbqBdXH9VqHtc8roZZRQcjHsr6jEZFLbmljgX3FW2R?=
 =?us-ascii?Q?8mXuiiYeyrfm0mg93RNHSw/6CfDVb8lOW6G+aczE7S6wkWN6nVr/hjZNio7K?=
 =?us-ascii?Q?r8knc1+U5eRwoB4r5wWcGUQ9MlT3pTxY0IqBnHiQj7A+LVSVjR+n+QFZVF6N?=
 =?us-ascii?Q?C22n/eW6pknFNPcd1FEhWxWlF1sNIkG7CQsClwgIx6bEuRuAtsLao5pPHBVD?=
 =?us-ascii?Q?XvjoQitzQzwZ3FkM56z15VxQkoT4WisBRYKdCNOxCzqMRERpfoVFnBCpFlqD?=
 =?us-ascii?Q?wjtA7qEyD8oSyFPUa4mo/fv9mo4bA+L636iwrqZZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: se.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4012.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404980f0-1271-4da6-6e00-08db1945812b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 04:37:31.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e51e1ad-c54b-4b39-b598-0ffe9ae68fef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/d3iy/ifliddWoFCJarWxfTCWBu7l1GCcX2V69/jdOgJygepM9If5dQeZaQc6iOpORdAHwZNBkCDx3OUQYqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mathias

We followed your suggestion and tried to add this patch to the 5.4 kernel,n=
othing has changed.
36dc01657b49 usb: host: xhci: Support running urb giveback in tasklet conte=
xt

We also adjusted the xhci interrupt moderation interval (IMODI) from 40000 =
to 10000.
Nothing changed either.

And we are thinking to try the 5.5 kernel next, but not sure if this will m=
ake any difference or not.

Thanks.


Internal

-----Original Message-----
From: Fengyi WU
Sent: Tuesday, February 28, 2023 11:08 AM
To: Mathias Nyman <mathias.nyman@intel.com>; peter.chen@nxp.com
Cc: linux-usb@vger.kernel.org; Peter Chen <peter.chen@kernel.org>; mathias.=
nyman@linux.intel.com
Subject: RE: USB transaction errors causing ERROR unknown event type 37

Mathias

Thanks for the kind reply.
We do tried the ubuntu kernel 5.4, it was working without any problem as I =
mentioned.=20
Let me give you more info, so we can debug and analysis together.
I did a trace using the command below, can you check the atttached trace fi=
le?
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

I do found Event Ring Full Error inside the trace file.=20

Thanks.
Jeff


Internal

-----Original Message-----
From: Mathias Nyman <mathias.nyman@intel.com>
Sent: Monday, February 27, 2023 6:38 PM
To: Fengyi WU <fengyi.wu@se.com>; peter.chen@nxp.com
Cc: linux-usb@vger.kernel.org; Peter Chen <peter.chen@kernel.org>; mathias.=
nyman@linux.intel.com
Subject: Re: USB transaction errors causing ERROR unknown event type 37

[External email: Use caution with links and attachments]

________________________________



On 27.2.2023 6.13, Fengyi WU wrote:
> Hi,
>
> We have a board NXP i.MX8MPlus EVK. We are running Linux 5.4.24 from NXP =
on the SoC.
>
> There is an analog to USB converter connected to the SoC via USB.
> The converter is this.
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> linuxtv.org%2Fwiki%2Findex.php%2FThe_Imaging_Source_DFG-USB2pro%23Maki
> ng_it_Work&data=3D05%7C01%7Cfengyi.wu%40se.com%7Cb7f04f2f54d749f2c19a08d
> b18a62dc4%7C6e51e1adc54b4b39b5980ffe9ae68fef%7C0%7C0%7C638130874232170
> 496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DwrZSuQ9hBAMNkCblWrTQYV2
> BemA12DNr5Q6rbzBUviw%3D&reserved=3D0
>
> We want to play video on the EVK and the result is that with 640*480=20
> resolution, the video quality is very bad And the FPS is only 10.
> Before we applied the patch from Peter Chen, the 640*480 resolution is no=
t playable.
> So the patch from Peter is usable, but not enough for us to make a good v=
ideo quality.
>
> The patch is this:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc
> hwork.kernel.org%2Fproject%2Flinux-usb%2Fpatch%2F1573836603-10871-2-gi
> t-send-email-mathias.nyman%40linux.intel.com%2F&data=3D05%7C01%7Cfengyi.
> wu%40se.com%7Cb7f04f2f54d749f2c19a08db18a62dc4%7C6e51e1adc54b4b39b5980
> ffe9ae68fef%7C0%7C0%7C638130874232170496%7CUnknown%7CTWFpbGZsb3d8eyJWI
> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> C%7C%7C&sdata=3DqNm3Yzs3bGkbvwKggC4FxcbSXpzi9NOupKs5Qe81uuw%3D&reserved=
=3D
> 0
>
> And we saw a lot of ERROR unknown event type 37 log on the console=20
> while the video is playing when it is not well working [  272.942827]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  272.999240]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.055696]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.112372]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.168736]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.225463]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.281947]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.338204]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.394560]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.451048]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.506856]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37 [  273.563624]=20
> xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
>
> We do tried the same USB converter device on Ubuntu kernel and everything=
 is working fine, and the USB converter kernel driver between NXP kernel an=
d ubuntu kernel is the same.
> So the problem we think is from the USB 3.0 xhci core driver.

Event type 37 is a "host controller event", usually seen when event ring is=
 full.

The patch from Peter Chen also touches this area, making sure we update the=
 event ring dequeue pointer in hardware more often.

This error can happen if interrupts are disabled for a long time, or we hav=
e a lot of TRBs on the event ring that don't generate interrupts.

There are some changes in this area since 5.4 kernel.
Is it possible to try a more recent kernel?

For example in kernel 5.5 we are giving back URBs in tasklet context, see:
36dc01657b49 usb: host: xhci: Support running urb giveback in tasklet conte=
xt

Other things to try:
- set xhci->quirks |=3D XHCI_AVOID_BEI to make isoc transfers interrupt mor=
e often
- adjust the xhci interrupt moderation interval (IMODI)
- Add xhci dynamic debug and tracing to get more details of what is really =
going on


Thanks
Mathias
