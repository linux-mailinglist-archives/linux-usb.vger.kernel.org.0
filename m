Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC858F3FA
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 23:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbiHJVw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 17:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiHJVwu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 17:52:50 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AC98048B
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 14:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhnCHEywch6D8PL1ckEdlFUR7iFHLRGJjYSzlAJs+qSB+8xTonRe63h0HCrYCOO2V8qFVEcTfK5pqnTQcjoiHBCrZQrOEVATHExytmuEGn36QQMmELO/k104g5DUx9UqAVgBJ2vKKKcEUprwoorSRlJq2/yeeR9ddu4O1OUyFaB/IMLlXgnps27CJdXxlTYNOASWvGNMDAjkhh/qJCwS/lG64yah3y024RPuVW9BiuBfE6IjgnWEsfwCww3uvFM71Zp95Fur+3e+saikpSvKoJwx8Fus6qN7Bj6sCzQCMhK73zCTfUd+pgPiHBu3yTVx4FDUcPC+/JGRTYAsxsxxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOpE/nOmC67Mroy9gexHx6BDm76jHc8XHgt/cWlWT8Y=;
 b=ISTW9eO3p+CYFcGqwMWK2pmAb9ZqMlz5jG9j0v78uEk4m9zFLM7arR+2u665p3hFliaS7dp86HyuDkFmW6g53DQ7Cj6PGTM0dk3lYXdx1KpaAbQuhsMw3RmXh656qbVt71Xk3wiRQOsKmLSvg1O3IztWe86dMJnxJHhwchE7tHniB4Rpx3eKEWlY3jrLCaPNXlo92WXqrz3xKzTdpBd0FeDke6FYFEnSOyFR61K3u9eGp9ioofFS8x4NQAnenPrPmfSde1Nvq6exJy1bWHoqnZapw8aZcc1UFtrhvaxuIdgowePzEONEphQSeXF7vVD5mIhnmTFr+LUaMv7ywRT8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOpE/nOmC67Mroy9gexHx6BDm76jHc8XHgt/cWlWT8Y=;
 b=lpi9ic2zqQTzCgmD4rLAhlR+CvYWFUgNbDBdAJ/t88PV833Mc1zpTrL0xxBfhtkI4Sk92xC++eqCwb9cMyFBMF2IlEUp/J1uDur3+pCkdzOwtAulFidRvWwYwAH40nZYfTzNJiZxJNJu3PH4CwCarYjWAWXUPqlKCBA30xd6n/4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY4PR12MB1719.namprd12.prod.outlook.com (2603:10b6:903:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 21:52:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67%3]) with mapi id 15.20.5504.021; Wed, 10 Aug 2022
 21:52:46 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC:     "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
        "Mehta, Sanju" <Sanju.Mehta@amd.com>,
        "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: RE: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP tunnel
 is discovered.
Thread-Topic: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP
 tunnel is discovered.
Thread-Index: AQHYp/ABMEtMh0RhkEKwnZ5GCrlSya2otqDg
Date:   Wed, 10 Aug 2022 21:52:46 +0000
Message-ID: <MN0PR12MB6101A4EC593D70D7D3FC3EADE2659@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <1659610118-119104-1-git-send-email-Sanju.Mehta@amd.com>
In-Reply-To: <1659610118-119104-1-git-send-email-Sanju.Mehta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-08-10T21:50:51Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=674502ca-ba81-4e04-95d8-de58c03ebc8c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-08-10T21:52:44Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: e11d1b3a-cb9a-4654-9de4-3cc0789ec989
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb1c8414-2136-4db0-5064-08da7b1aa928
x-ms-traffictypediagnostic: CY4PR12MB1719:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tcE+vTu7BxD2n0DXAusfNs7g9Fqk5lJmUaGWVum/wU4KUUM9ryOhX0yXcjeTW7AnrxrFAps/WGv6uaqdTLWz1ke126wDZ76345PmFdX/KcRVOstgicaWD/B1+ChE5VW80uuUTa05KI+4lGHn1d4fh7gDYUjBK4q/EBMWNPoznLu/tq43G6twwqa6PZiuVzip/yPjwduJZ09VkdgCXLrUI1p59ZjWBIjstF/B1SPK13svuPezLMsLVdO5aJOa51Gk+JHRjDeyIofgDBMBUfD7xYd0UPpeAJKS8yrTsnuT+cyGbXMfQeWePXUq4JrvdXAuKYUA0roOq8ACR5p3b2BdBj4YhYFbj51IBzZy9MHkH1AfChkUm8CSa0QBqp2l1k0s+eg6sIa222au9iU3X2QQ+PtFciM0YNM4xgGXCqJ8C0/X1wiRg6prL/zVf1zeWlKmUizpaYHrZOmYzgcq0RKdaWyVUiNsBy1ulp8fYLTLUqlDGdBekhKMzoxNiMcKAsv1DUV7u6PrmHpJnygvN+T03pv7AePG/XgiTV4ig3LA7+c15SkeVm7LR2Cjz6Q6pId+ri+H6pmr8+SGmxLeXUCKwTxZFtxWpkKoAZlBXy4Zfzh+3LkPfoxhWY2wRJARjDLResznUVnUptFuiN9Eey6JtA116PgNINUlwkWhPiJKJ+WIYTo4ezJU/NV1yOvWpeuWrszuFsONN3JhBAKmSmP+ss8EX6iGLIYgR6EvZHXd8hmBsn7QkDhnNHJPSQsRMnOCY91pb0ANVqI8N1iiPKK3b+97u7qCq4N6ELN7ddCuO/TMbgDUQHCS3hjAQwDq7lEj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(316002)(478600001)(83380400001)(71200400001)(6916009)(54906003)(66446008)(2906002)(76116006)(66946007)(52536014)(8676002)(8936002)(66556008)(5660300002)(64756008)(66476007)(4326008)(38100700002)(86362001)(55016003)(122000001)(53546011)(33656002)(38070700005)(41300700001)(26005)(7696005)(186003)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GNN1ZcLKqk3X3qbGQ3r3fByJQE9ABQHtyL3TEDvzNtdeC5NfO0P2lz+ClfmE?=
 =?us-ascii?Q?nBrdUbDJ/K4jLcwoZPKsC+HP+hb3CWEQRe7pJoaoF9ww1eg0j0ZMA4WyOKhD?=
 =?us-ascii?Q?bP5Fje/YjrrvZ/KX5UGZGSf+v6F/m5gZCExSCSxgr/3Z+R71f186clo/CGWG?=
 =?us-ascii?Q?a/AcnBUlClmZ5q0sv4ghKFAGjtUIyGLOuF5O2E95CMDl6iehLkPyK0hzyvIy?=
 =?us-ascii?Q?79llE3xpZWJetjbfkHxW5DOl0UclLj7Ti5pu2GJQn/sLWBJr98lh4icQ7Ujx?=
 =?us-ascii?Q?Q3h7MvgvSHfzR56tnqZDaGyTNXo0KpkJCgc48WBBl5t1g9NSwEO7HkES2m6Y?=
 =?us-ascii?Q?uz7T6TH47zXmt/8LrQdlccNLGNPynD9AQBHnGOUCkupm3+QamDAR3vhl+csA?=
 =?us-ascii?Q?UosR9egcEWoJcYAngAlhgG/FEGndkCdepWftTcw4JRKCofauoLUv9zFxVVXw?=
 =?us-ascii?Q?iAKziDp4FT6fgtfhJa84Q/WdYDfoD8J6S91dev7r4vtPUDGGVF3zdYq/GmO7?=
 =?us-ascii?Q?j1Gb+jd30Y6YBwgaM4r1F2V0v2haJ8LjfCU45/HIU7dF3fHa6u2zVsyB/lNk?=
 =?us-ascii?Q?s/PXgQ4OIBtD1Ps3M8RALkeLgNp9vz066Y+49cWC/9AWDyvO1YPh/zW4AtF0?=
 =?us-ascii?Q?iDJREf56YWh1Zbsi6uiQ1OKFSRYDpf8Sd8bLSNe5SFYv39aTHxzmILKxh6mw?=
 =?us-ascii?Q?aiR1u70WnKcoYKnb+BMRyh+pDv4R4sRAZtA3bvZf/SFFGqMcegBH+4owWd2P?=
 =?us-ascii?Q?g+kdOUNQ+b2OPmeWkZRMOFDYqHlUp8JCwktUYw2T04Qb74Y04wfZKcpu770f?=
 =?us-ascii?Q?AjZksCPQ3eDxJ5s61l5jojUPcZ0zDmr1iZIVwe7cyGVgHnkAN0a7slYQuhWp?=
 =?us-ascii?Q?6gTVySR9m0A99XOZIju+pF7zCBCWdHaTPW2CFKxlT1gNTpZ2HvQDRJTOHaOY?=
 =?us-ascii?Q?qjNKUshSPwRyf15KZaPr+NWyPC7scF+RO1PZOb0cEMmnKVzTl/J3UrdyaQYl?=
 =?us-ascii?Q?E1PpaECIyJQ03pOTxj6zoHu8N+afXGwc7tlrH8Iu+1d/F0pNG3CaJ9LXavqe?=
 =?us-ascii?Q?jItN5ioy6LIScgPmx053G9Br+UC0ilb5eM5pmGk1IAVbb8qKCYBqFlW1DzKG?=
 =?us-ascii?Q?JHLClGmW+GQTgVvghBqEELUcKC/2NGucG/maXXYQ7ymm8LWyetL3zwkugrb2?=
 =?us-ascii?Q?KazcIvSdL3ASYvNTIwwX0mpLqs9J07D2YA0apZtZ9zqHmlTvk/tiSehXvnT4?=
 =?us-ascii?Q?eKkymoKMw0uD22bQvORJux4jiSelmRim1mHRpOBhz+ScFUshXV7kbqnEEhMQ?=
 =?us-ascii?Q?VnCvZyhfqZPADGhARqfXJ2mumkpXhRcKZRf9JS3hh7CbK2T0WIkwMT+AnRxK?=
 =?us-ascii?Q?3Yf1GqOmMOr/6tajkez0BQB7YVXWEytU/bIq9EHsCoGoQ6Uu/T4l2zbnxvrX?=
 =?us-ascii?Q?RGe+tE0y2jq8M513Yqi4pGYUJL7q0Do/48FucGoupvcH+shfyTfHu+wEkVZH?=
 =?us-ascii?Q?zDtf2Jn7P6lVuCwOoVqopaBfJTaoOUQQ15viM9Ur9+cIqEFcYyE+ZwfhLGwe?=
 =?us-ascii?Q?tsHPHnA9OmgJevC4SfI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1c8414-2136-4db0-5064-08da7b1aa928
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 21:52:46.3235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RklfDlg06S142QKLGb1rDH6DTpzSZNn/SFBLg9BxvjmOWvB4Z/DIsFIM7eUtW7T7ftRk6JREcmUqr+snOMZKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1719
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Public]

> -----Original Message-----
> From: Mehta, Sanju <Sanju.Mehta@amd.com>
> Sent: Thursday, August 4, 2022 05:49
> To: mika.westerberg@linux.intel.com; andreas.noever@gmail.com;
> michael.jamet@intel.com; YehezkelShB@gmail.com
> Cc: Natikar, Basavaraj <Basavaraj.Natikar@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; linux-usb@vger.kernel.org; Mehta, Sanju
> <Sanju.Mehta@amd.com>
> Subject: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP
> tunnel is discovered.
>=20
> From: Sanjay R Mehta <sanju.mehta@amd.com>
>=20
> If the boot firmware implements a connection manager of its
> own it may create a DP tunnel and will be handed off to Linux
> CM, but the DP out resource is not saved in the dp_resource
> list.
>=20
> This patch adds tunnelled DP out port to the dp_resource list
> once the DP tunnel is discovered.
>=20
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Another one of my colleagues validated this patch this morning, here
is a tag for him.

Tested-by: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>

>=20
> ---
> v3:
> - Change function name to tb_discover_dp_resources & making it
>   as static function as per Mika's comment.
> - Move call to tb_discover_dp_resources() from tb_start().
>=20
> v2: Re-ordering the function declaration as per Greg's comment.
> ---
>  drivers/thunderbolt/tb.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 9a3214f..0d420dd 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -105,6 +105,32 @@ static void tb_remove_dp_resources(struct
> tb_switch *sw)
>  	}
>  }
>=20
> +static void tb_discover_dp_resource(struct tb *tb, struct tb_port *port)
> +{
> +	struct tb_cm *tcm =3D tb_priv(tb);
> +	struct tb_port *p;
> +
> +	list_for_each_entry(p, &tcm->dp_resources, list) {
> +		if (p =3D=3D port)
> +			return;
> +	}
> +
> +	tb_port_dbg(port, "DP %s resource available discovered\n",
> +		    tb_port_is_dpin(port) ? "IN" : "OUT");
> +	list_add_tail(&port->list, &tcm->dp_resources);
> +}
> +
> +static void tb_discover_dp_resources(struct tb *tb)
> +{
> +	struct tb_cm *tcm =3D tb_priv(tb);
> +	struct tb_tunnel *tunnel;
> +
> +	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
> +		if (tb_tunnel_is_dp(tunnel))
> +			tb_discover_dp_resource(tb, tunnel->dst_port);
> +	}
> +}
> +
>  static void tb_switch_discover_tunnels(struct tb_switch *sw,
>  				       struct list_head *list,
>  				       bool alloc_hopids)
> @@ -1414,6 +1440,8 @@ static int tb_start(struct tb *tb)
>  	tb_scan_switch(tb->root_switch);
>  	/* Find out tunnels created by the boot firmware */
>  	tb_discover_tunnels(tb);
> +	/* Add DP resources from the DP tunnels created by the boot
> firmware */
> +	tb_discover_dp_resources(tb);
>  	/*
>  	 * If the boot firmware did not create USB 3.x tunnels create them
>  	 * now for the whole topology.
> --
> 2.7.4
