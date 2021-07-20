Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F623CF6FC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 11:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhGTIzE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 04:55:04 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28241 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236027AbhGTIyj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jul 2021 04:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1626773708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E6zDBYatLrz6aY1CgxwjLVNfBHm4GBGTEpLBNUNoyak=;
        b=Ne2bj5VHqHUiN4fdvYvSQZPUuzfBgItTD1C0c7tV7Ma7MSl5kjlm7Qgjlgequ68DSzx8Hr
        sTDkaymueVH14L76mcPFo+/fbWB3zzxGQr6T7sG/XMbrJjr3DukShANNo/232NvAiVmO/2
        +ITdJNQT+OnMKazOgnehbt0uTKnbKtQ=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-jfbZP2IrMNqmYfANq5Z-ZQ-1; Tue, 20 Jul 2021 11:35:06 +0200
X-MC-Unique: jfbZP2IrMNqmYfANq5Z-ZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQ4JKJ2g2pufozYFQ+qtm5gan6pgiWHyNRXjVdn+vsQT2M/9IrW4st1RYeO01oAY+4VUyG9sS2NFCkpc+hdU8fLAOwWCzIPR8dWOTRxYKE5fdI9OeL+saiEZP3oqNqPXnaiCiDSz3vB1f8I1oEeIy3EV67EYPLbezm5lW4+HnB7kMpNl4T9q6wzxEY8q+8rkalJvH2WEVT51/NcXO2tveqO9FbeAUP+xxQQDtmKluaCd8aupi1JiW97WknUzAFVq3cORy+QNAQUotNwOeajRVfcSOraXR/uVSpuMJYLiQr6bzXimLuljU06JSTS6ekEWaIe+7p0/5L8l7+NNKE1Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUA7hpb/2uNr4lvBjihVtGtBoDqsFXplbJg6WIlwsqo=;
 b=mhmDCo6UaVl2gZq99WPHGMO4MKxcwePPSE7AfgoRGFIhlFMqHwupoHkSAdhTV89SFCsTlYZqYx3h5xB3Httajji93h25n3ZHQv/hWxvIKOfd2pV0eIexfT/9IOTzl58bYJSwe2GOcV3tAGETuXKaV2HZtZ7XkMEfPoMZS067KCHRbk28yRHoZZQcH86VxijAjkCokI7prnhiv2ESjgTprxl8+ZNe3LuUEoe3WUusmuUs+9vYDurBUb16AhVwb1ccdLw/T5ovL75altOFpD4rnqQSjMlNBzwSD7vFzfb4yFxnHwRtr3LGZkA29PwV/Mx3gxv9d/sGlffdvxbpTqdzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5047.eurprd04.prod.outlook.com (2603:10a6:20b:8::18)
 by AM6PR04MB5464.eurprd04.prod.outlook.com (2603:10a6:20b:94::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Tue, 20 Jul
 2021 09:35:05 +0000
Received: from AM6PR04MB5047.eurprd04.prod.outlook.com
 ([fe80::d021:dea6:f6f8:f32f]) by AM6PR04MB5047.eurprd04.prod.outlook.com
 ([fe80::d021:dea6:f6f8:f32f%7]) with mapi id 15.20.4308.027; Tue, 20 Jul 2021
 09:35:05 +0000
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
CC:     linux-usb@vger.kernel.org, hdegoede@redhat.com
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
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <09cf1208-7282-4eae-59df-9d28a4130bf3@suse.com>
Date:   Tue, 20 Jul 2021 11:35:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::26) To AM6PR04MB5047.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3b82:3e01:c3c9:c93b:1b8e:a220) by PR3P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.27 via Frontend Transport; Tue, 20 Jul 2021 09:35:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f354cdba-8d20-41fe-48dc-08d94b61a7ee
X-MS-TrafficTypeDiagnostic: AM6PR04MB5464:
X-Microsoft-Antispam-PRVS: <AM6PR04MB54648CBB4185B25B253D8E12C7E29@AM6PR04MB5464.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJt1MaDINr5ar9TPlOXgrh9dIp0aGgEB6w23ndjz5CU/T2VZ4RCVjtFVR7wXlysA20c5sNHXLObPqutua4Abv6pAdnEyTqb8Oum5j2u8+jbEmqUjo7dE7VBnu43SmR2OTt7ERnirOuX3gLXKrKWwWe8xOMw698q6ceOH2P2FIuoHQNXlUwIdpNVfpo+wFq5tLwZc4epJx6tVmq64HM1Yxd30g1EW3gH3XKnCElij++oPLn4Ehi02A/yBLzErAzBYH3/LxrjBv24WEURHl8TcI8HDj/pnBhMBe8lxLwqkkgzdkDlnjNuTByB9NsTMlMKhTtmU77GLM2bdS4ONnQ0SPK8x843O7CLAdIZPubFpRP3YB+U7k6Xs3/9q4opT41L5aN6/uXlpvrr+AipuMRs9yOFPDiYDoay1kJSJekCJ6kHXnB++v/nDX0939oTFpjFgUH597UIt2NgnG+TKDO3BsPZ6o8VssOd8M0xMreJH2NMQ8jnn6tjTOqvX16BUU215g6hVbNEsrNnc6SDXis/vGgr+y0ZYUHN16QckEi2F79Y6ANmc9KQuVriaBEKMDTeHw7AT0Y5h8b45SgKZ0tjnQsiFh/dn90dG4ksmBgMxg1tyIFFvBF26NpS2rpL6DmEcQEeAdlg3dPhnqgR1p9juLaa7E//IrcMpjhjUyhx81bHF9iRkuHpIq9WOI98BgvqIGZVaqcDhG2TMoj90xPQpuz11684ySh4xIwldqINCkEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5047.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(376002)(136003)(396003)(366004)(186003)(5660300002)(6506007)(2616005)(6512007)(110136005)(478600001)(8676002)(66476007)(8936002)(66556008)(36756003)(83380400001)(4326008)(31686004)(86362001)(316002)(6486002)(2906002)(31696002)(4744005)(66946007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYMpMF/ZQEk36W+5XSw0j71MGC+icDqEMYL6m6oXIDxE14nZ6O10WyZe7+7q?=
 =?us-ascii?Q?h6AoviEytix0JQCJT0Nz14awQ6Gs+sHpPXjmyHXls5WCxEVOVlKqawieXuAX?=
 =?us-ascii?Q?ziMmBVT1z6/XVLKS0bvLHipMp/CoQ/NLeojNCWX2M4drH8ZwNtmCmfZZzj0A?=
 =?us-ascii?Q?leHal/uutonArrCyNswHUmtfunh3opqDkbUSdnRG21T6DB8IBbBufHBN/Sr7?=
 =?us-ascii?Q?vla1iRCyMF8anBJARdxSLE3/L/By55HEjj6o/s/sT4L+3CWVA975Wu8A6zEc?=
 =?us-ascii?Q?OZ48+AHvWZmPYXlCvGCh14R5ZRpAJwrJR0xpT+Cu//LgLxvTJ36Rbja4GrON?=
 =?us-ascii?Q?339A13Z8Ph0c9rEeVFV3ZB9NN58osNqN7bGlEwqAHzPVN7dRPwpC2+JHQ1Gr?=
 =?us-ascii?Q?ux9Eb5SRZtRo+oM3nTKYsF1ftGExSKginKPtgB5ZxA4jnSLtFxtnBo+/g138?=
 =?us-ascii?Q?odjD5U+yb7GPhA/LTuNkgM1zVh2RXOVMcTx/2J54hmD/yQGU1EcnwEFeIG9X?=
 =?us-ascii?Q?rlhQlaiwSexwsZZ2MZ4rBHK6YLUP4j6qdv+8WEcc1vZk6kqZUSfcsufRmFGK?=
 =?us-ascii?Q?UlBd/xI+NxAezlxzjTrVlhmO1DB0oJfwcg0fkjjrZfbeTTwXdjh85wxVlCuC?=
 =?us-ascii?Q?bNanaA/RHJdYyCPa+bRL1fba2/Jeelz/ALU+pR6C3EmkR1UScFER+T6YmJB0?=
 =?us-ascii?Q?WFTkg7daRyTLcsOg1TgBFTMVbT1sihPwjJalja3sJvRaYMyv3dsJ+fWsin5K?=
 =?us-ascii?Q?7bseU49enuVe1mXGYIKWJCsgpSkUUuCvo04qD0ltg+vkFYzoC79ji9vE96oD?=
 =?us-ascii?Q?pRcljcC4V+cgbrdCAEtq/SXl1u/VAKjEac+iJ4TmFkdQqnlFDQKB3qbEMCMk?=
 =?us-ascii?Q?YA3qZcOP99nQ13XHnHicA83JAyKhW35/m96p7N9hz8JjLPzS9z+mwyjNmo/o?=
 =?us-ascii?Q?o8nXmS4dWJ43WM0OIuLHlu4D8tgv2iL49bDaB0S/wYIAW8+hBbagbqUA8LnN?=
 =?us-ascii?Q?mJDUNEp2hEQuh/RwGOccJ+uuS4Hi0/kepSGkBhnh/p05qZ8dPo/SqBX8WtPi?=
 =?us-ascii?Q?HTdVjochR6m+IhPr19GneDFWab8pMPA40OVvee+tdLzLW0nP6mkykdhI4czn?=
 =?us-ascii?Q?Lj34tT/WP9jSrNS9046vUv6WlSwnJphtSeYCp4I4BOnqZl4TKXcVzOcoNIZy?=
 =?us-ascii?Q?fmB4vYtSy/WVZhzumxeW7A4eGEc/AQt+uW/SPvHJi2UN2zbbvSda5ySJEZfS?=
 =?us-ascii?Q?6qsSJKUPk0HPovz9RBuiDrdOLQV5A3dXH/mf632RyGkVMlpJoZanxAoskwqp?=
 =?us-ascii?Q?UMuCRBTcg+w1JetxBSSzvxGBKuy5tUQ2znAsrQcmkl6Fi/wTl2Qw9bSi9F4h?=
 =?us-ascii?Q?6al5IEJaEri4itwwVXk49PFXH0T5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f354cdba-8d20-41fe-48dc-08d94b61a7ee
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 09:35:05.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/kdKhC559PpRTg05c/uN+x/7yUQUUZHFkdnk0YCisQNVbrKY8eqNyI80Op6gU94H8RnIxYAEhlSoOTw1Pe8VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5464
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Hi,
>
> thanks for confirming. Patch is attached, it appears to be working
> correctly when applied against 5.13.3. Please let me know if changes
> are required.


Hi,

could you please resend inline in the mail, as documented in the
SubmittingPatches documentation,

so that Greg can pick it up?

=C2=A0=C2=A0=C2=A0 Regards

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver


