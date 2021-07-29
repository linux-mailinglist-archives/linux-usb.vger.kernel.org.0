Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9A63D9FC8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 10:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbhG2IoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 04:44:08 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:46604 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235162AbhG2IoH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jul 2021 04:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1627548243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J4mYUasOxR/wksxbs/Nh4gTNmLF4IMH6C/fpozy13AI=;
        b=AJxY1tW1SvaRn+9iewg98eyKRnzIb8ddNViYklfcX0tdZWsU9PGFEx0V9PyJldjMO2XAxJ
        uwN8dNBDXBLCcwYvMVGU6orC88C9WCLkyuIE3YDGxG+YGEUVLYeK/h6eARkgi1sXZjoU/L
        1+yYN3mWc5QbQbXP7coolHvlIAxTfF8=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-pbwQDp-IO1-bhK6J1KeTHg-1; Thu, 29 Jul 2021 10:44:02 +0200
X-MC-Unique: pbwQDp-IO1-bhK6J1KeTHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8WmJSv35OAZ5OWY/IKEZ7jnyqiqrR6QA+O9fBQmex1GfaXkrFkloG3BJPRcwQoqKVI+w7/1vGVQAF+L+47q9PWFiSXHRBtZ4lSsrxwvNkRATle+SWii653Mz1jq/PPCnvjbiJ80D5hYtA/cMNkYHxs03rHd/8kQK8N373piEV+u4ZE+DECioX2Mk1WM7TCgCpOYOUsuV2UAATiyx16gzXXhtJAGi7PIEIQXUahDBNB+3kcssMS3fiZCVHv7egjbERLpJ16+n8JGwZ6Vo5ZXUY7ei+KSXOMTfcfqYlRS1nCHnY1D2yTX1PPVDc38qTcP3/WKf9pVKzXSQeCuHJtCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrWTIjGuc8ILQFVPTmj6kousP+/Yy76lQm5VwEXMi2E=;
 b=mSHc3oTPVA+F4r1Ori7OyjkBZ3r3qsp2DBLYooQhjzFvHv+RPykdJlFT3A2poB68omKxjPAWiGUp7bc1M+92nwgU5KMmh0iqUAOBSQbuULygqNwRwlCb3wF6d5NzQdvX6kMyQJiawpA2wAn8nf4Jb3C9PXoCBuJ2L9Ut6oLKtQd3rkmLxStoVxoJ1UTc9VWQz0xqNLv+RnZPEEi4L1ZOIm+L4jch3fvZX4D9bnMsiBJbJMVT+DETYpvkw505MSdq28XJqumcjUCxOGVQrOSDJSjadpQ608sWjiqGaPAwe0fNcDY3G19gDPUqJ7X5sRF8wVXdVGWbBMzSCO+NDNZfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB6PR04MB3144.eurprd04.prod.outlook.com (2603:10a6:6:f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Thu, 29 Jul 2021 08:44:00 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4352.031; Thu, 29 Jul 2021
 08:43:59 +0000
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>,
        USB list <linux-usb@vger.kernel.org>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
 <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
 <c4d769e6-b906-f5f4-255b-7faf27f8702f@redhat.com>
 <CA+xVL_QEgzb1tu-tzqYPxJF-G_a8czCp=uyZ1JJ9+5xmCcNp2Q@mail.gmail.com>
 <CA+xVL_QrJ9f8-BwVRq1oG_yo2Cd=yQH9=TCm5g=MUO9MmdvRVA@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <efbe7e12-d730-a80c-7f5f-125959efd3be@suse.com>
Date:   Thu, 29 Jul 2021 10:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CA+xVL_QrJ9f8-BwVRq1oG_yo2Cd=yQH9=TCm5g=MUO9MmdvRVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:207:5::26) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3b82:3e01:c3c9:c93b:1b8e:a220) by AM3PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:207:5::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend Transport; Thu, 29 Jul 2021 08:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34bb6cd7-9a1e-45df-107a-08d9526d0262
X-MS-TrafficTypeDiagnostic: DB6PR04MB3144:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3144B34CF9D33670C3120985C7EB9@DB6PR04MB3144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7s/7UcHlXq+kkfg631jx7shypvQLMQxduZQQ+RA5IlbCNk+RVduYcRQ2tt0NAXVQpbtZn9oIW+z3nl+5osnPtj9t8+fPPD2m4SxO1/FINXJSYzLZOPfBdogcbUdQzWdirLy/7hX/RV1W4SmYkBETqsKzYdg0bY2K5aHkb1xX8/jqQV5wF/NgANZyADrTs015ImdDsOn0rkhfekEALvU+J20USimh/JuChNOTcWfMVoWXKuTMff/s6BU+leiO4HLw7tfz9QsvqxPG/UXr8BFUpLKcZ1SrDru6Gl3zE7AGqQX0aVBeetucJpj6dQe7XWmwZgXVGvvGrx9DzPq1e37a57SN7P2/WkT593QRR5sHSsJE8bwkX0d9FpMsot+OFENiLPjY3CU01I5KouhL1htRVAmIc1MT9N3Dp3LWAesFQn5O04bHYTd6SxywTx3AHYHsTNzsbMiTyFbBk3wPS/Gr6x0qA2NoCN+8COIMste3dQ8OfRyYh3PumTffjOC264CGKS9J4LMRmhIDCbjwQUyfPKYMc0iqN5f/F+bon7VPqXGEaAV5toE7NzwvJEiPnB+F5UdOXXHLGUVIhhoif21IguskvXUtjXX6HIFiJW4IQftexGO4/KA7hvidI867Y3VeZMQotqPduh12BsGNaLvpn/GZdC8EZJgi1XdQ2b88FmHGEQ2RbuiCjXddxDNtml+szD2S1B/rtxp2srV6yWJWgGb1ZibTEYYzx07QQRONWKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39850400004)(136003)(396003)(366004)(31686004)(66556008)(36756003)(6512007)(6486002)(38100700002)(2906002)(8936002)(53546011)(478600001)(86362001)(8676002)(2616005)(5660300002)(558084003)(31696002)(6506007)(186003)(110136005)(54906003)(66946007)(4326008)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAvvqwVzzeimEl2zJmUJ0Pk873NyhX7RpX7d/YZ9MMI441Ng5l+CphDrnnu5?=
 =?us-ascii?Q?A3Opt9YmZ3xEdwjYcirYfVaahYNsDxYAwKN0eWiQOsPm5ouaC+hWqPtFl/5U?=
 =?us-ascii?Q?Dc+Ok7AFeFnK7VXnCLAcDs+2cQg1vY8ioyiW/J7yh8jbMj/iRtSgHeUvk4b8?=
 =?us-ascii?Q?qHidRw7nQbRxc02mj+Q+Hx7IHpXJ8qZ8H8058m6MGaVXXWLXQyFTzBL6tseF?=
 =?us-ascii?Q?9K1PM9yqOUAMo5SvQjEUCMnoud+MkmQmKKduxnFH1jopNpneXmHT9p/+AjIS?=
 =?us-ascii?Q?9fThC/Ce5Jf4bPCNFI5HhIw4dlD3KrfGm6Vo4b7TzTLRaAlNq8g2/VgzGnwh?=
 =?us-ascii?Q?nirRaQAZrcKtZBYHuC92+aGL6cBp5bXpIXKywDjPb1ppF53/Bh4b4Rrf5Tgg?=
 =?us-ascii?Q?UCIobMrVvUg7bv+pBHjVZn+19s0ErHuOfhP7ezQbXn+FW112Ql3dQJMj5Mia?=
 =?us-ascii?Q?xt6EVGs3+9RePXqFef/jz+GXhZKIc/MPEGQGKL8KbPIWQsPJ3R2W/iHT1eYw?=
 =?us-ascii?Q?pmdgGgUFVAl9Okyd2aoP5KCdAkbiWDlz2cudfekyfq6efCzE+PwnzF17tSEc?=
 =?us-ascii?Q?qm3LeVH5zv1KbT9866bLnKmIcB3iju0ziTPkZw1WQuJn+A4SnAQ9V8FhGnxw?=
 =?us-ascii?Q?t4sbBLCAaG1NyDfKobZco1eJRvNovuTgXq1O9GLosVFBfUP4deXdW3KjXs8Y?=
 =?us-ascii?Q?4pYiFgHQaIhQbN4fb6rJi4qelzfg/23mBGMeDUvzO3RyziBMAkm8Da/oY/XK?=
 =?us-ascii?Q?+FkJkc3cr/ZDNXVJry9cvlNyLtLh04+8YQmmbZkhbi14jSIPbWSYFxgwdMpY?=
 =?us-ascii?Q?Qj+flf8ipERjWI8bgg+L1wDWcZwYgTzf+8omp+JX/5qieswIDbF7J2Mh3jeB?=
 =?us-ascii?Q?oyGsmI7FYXYigFDKOs3gyMQY8V2JjjtCofTdVpV706B5Y4s8/fzkOzjiNh9Z?=
 =?us-ascii?Q?I4qGwi6Dy/7yI+9NoYxRzDFNndXbEsQ6ttCqGdppNOlwUngsH/LWl5WeOlBL?=
 =?us-ascii?Q?4VDv0fPwqHljcBSiaYPg5X3SjiDtctg7521LZdQY16B8XGuMYUI/el33NG6X?=
 =?us-ascii?Q?fqXusnSriilsMR8Cu/b8oAA5ytCf6cgM0ww+dFoith1YmU3XnTSNE5mXp8x/?=
 =?us-ascii?Q?0X8UzBu3POHS6YHVaxEh/gs3BTqE2Dct0FYR3eqe9F4yJfNTKhIBTkrS9dcy?=
 =?us-ascii?Q?lyI6UOwlQHMNtHH3iQ6ymlmAtY+6I7LgP3x88voTpXlJxwvvv/VDwIXyOCO0?=
 =?us-ascii?Q?vFoXODp0yGpEBIeMLQn53HvjmYLJSgQtolkDXwHCGd0SbYoQqZCT2vpm4pNr?=
 =?us-ascii?Q?DkkQRf1uU58+URKxrY9Qv/Bnv8d7EXkvvjE66bdzImbjFpw20YgGixjNuud1?=
 =?us-ascii?Q?MGhfrn62WElBWgNJC9ggvLFe6Uk4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bb6cd7-9a1e-45df-107a-08d9526d0262
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 08:43:59.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJtpFKRGmoSRiLz5MkFz7A2iM8JAaNNkyXuNZAoMJDihr17J8IM0X3FaDTLCrJ51EjsrmoLxo0ToeUMjamERGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3144
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 28.07.21 19:29, Julian Sikorski wrote:
> Hi all,
>
> f quirk alone seems to be sufficient.
>
Hi,

OK. Let's not rush this. Could you do a bit of testing until you are
certain and then report back?

=C2=A0=C2=A0=C2=A0 Regards

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver


