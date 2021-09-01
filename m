Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1653FD51F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 10:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242975AbhIAIR2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 04:17:28 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:51435 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242915AbhIAIR0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 04:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1630484188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Tsly7kigHdycumP6tsdOPtuxkyuTpYK7gatD6Uf6f8=;
        b=BL5kb2Ja4HvEwrjibnvEIIpLcfsHmKPqp/BWZaDl5W2cqo8vaLmu3SbshIVbm03fD4DwGO
        tVDrLWpqRfTU8an8ATMomeM68md+r/QNoZLWpaProIn/r9r+C+2jkWro5sdNOWs27Z7+2H
        ynoSS0+G0pKB9diTMpJ0b2DZFDQk0D8=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-_QtXGhVdMiCbo6VaLyO2rg-1; Wed, 01 Sep 2021 10:16:27 +0200
X-MC-Unique: _QtXGhVdMiCbo6VaLyO2rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9bCPAn5RUVVS9V7pIGV2Ac1CG8AunEXNxjsENLcqp0c88oRPs+se3Rv6/SlXBrDnttGGp7s4byoGTGNR6dGHtHBFhnT2OfFX4W0NJXWrrVgbtXgGQN43NHsCIHL+i5IgzZ2zEmJ4+umSfnbyqT5iHJzeZZNTESGB/tvTOGzrQMfhZHalC5Vxj70SARBYHe9wpwd++4kK1YyiEBoQIAgORaOZj0dRIY65dqc0Z9/vuSeKISVCEBni2dEyukxwOnIVteWOB//uV2pjd0Rz0hgoxz+/zdgkus00LiS3XvoJFFrvgWrb6ONCBxPWytmpK8XG2OtC8iaBui3sc8ZCLQ4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdRaD0khsZJK3XB/958PUB1TTUuhgOPoZo9vtofyXOw=;
 b=dfe1wSVFJy2htUh35I4Gqcz6XFrg/Ppb+j0lyXkyS0fO/Gz9fMjhuYTaEAMsXvan62pXTFO7pYj6IQ5Jyb6h8NptAiNGL+9Im3slGppUJYTOYQy2T7J3dlg9zD/1uHJBviPzBaqxfUdR4SUcS1Dwu1ZtOx0M6tZtSg/+xB7CytvGUIyyr/H8CoGGsT8PyvZFTYSn5u3h8Zk6rhhKRRM1gzR+MgYTF4W2ACTe1TS+e3Mz0FuS/4vEuUOKIGbhrJzoj4yGL8iN+szZkzgnKIRqY7dI1BbugJoUQd6vtYMEFlwBxiM9WZvbj8Gw2fqH6A8u4HBmzpY39ctyfjYk65KRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:16:25 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4457.025; Wed, 1 Sep 2021
 08:16:25 +0000
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
To:     Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>
CC:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <YS3y14DBrg0+n/iI@hovoldconsulting.com>
 <YS4OKKox+gZZZ/vV@hovoldconsulting.com>
 <20210831170338.GA371511@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <b9aba74f-b0bc-01b4-4d6d-33619375b909@suse.com>
Date:   Wed, 1 Sep 2021 10:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210831170338.GA371511@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::16) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3ba1:6d01:4428:c443:677c:c419) by PR3P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 1 Sep 2021 08:16:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fdb9703-cd3a-4955-edc0-08d96d20ca20
X-MS-TrafficTypeDiagnostic: DBBPR04MB7676:
X-Microsoft-Antispam-PRVS: <DBBPR04MB7676BD36E0151243F9667C1BC7CD9@DBBPR04MB7676.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqV5Sq5kwa7RBW4ysGfHeVwo4M80d1uk/lDUbOLroKjWuibuUIiGXobnySW2+F7RYawg1ttHmeoUdQZHD7ZNUp3L5pq4GXKrwzLIhAVwVPxm9VkUFeoFcxZu0CssQyTqU/yPpjOOP3XZSxThxQpjgIsPBVa3WnH+hEJ3Ad3hlVBRa4IomgYdRSJBnzDg9nxN4PiG7wOR+0j6KxIXge6wBMw8N64GyGRrMOtOTzx1gC57OYr3Ux2O5ko44ItCuWWNvs5P8m3wF76F89NP7O5Puee0MumGClls1JfmPyWO+G5gQei9jsliLh0m6i5II78DMOxZWasJni2RCWWjjjwmDptcsqdCJI1cQx00MMLtZ5O3QsFg7wdjRwDDP58PPlHvPGCsH3fac8V6YPZBYX4i3Qzm8Di/4OeqhJXpCqULBCSCTDyKWjFbSczq02APUFX6TaV+8c7yEeTI0YLqWMw+O3uDMIA2xVQQeQ5FM8BesPWIcxb60SAVqVzuYVKUu+t/kxuHVtMO+8xnmRqDEB+Z5OU3XKazWRIPy2TBRsIMYxLUzkc3cJ+dw2vRW69r1+LIoQbTpH7BEPoFttleL/A63sa5LohQ0U1zBhqVitJ9nNvRJo7860iTszXYbLtdawJ5vOXLwjBHyJqSsZTSrvqByILUEiBuq6pyoVg4/p76lpaeX5AnjYxlD554HS8/+h2H4CvFujpZMZ4bpRNfFHIvJMRuAoxdzJVdYDKb/TqEbTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(4744005)(2906002)(53546011)(110136005)(86362001)(31696002)(54906003)(6506007)(5660300002)(36756003)(2616005)(186003)(83380400001)(31686004)(66946007)(38100700002)(316002)(6512007)(8676002)(66556008)(66476007)(6486002)(8936002)(4326008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7/ChWTpk4Y200E7eNNCJKBT+3vqzB+32HnXpXioi3s8ptEnEbqwws6kshyr?=
 =?us-ascii?Q?njSn29YXqassJWN4LE0blvraEbeiwPa35ko71iWsWvjzdZYPfIQ7Az22sPQH?=
 =?us-ascii?Q?g6U95w3bHRcixGkKejSwEPT3wgWKwnQr4fcY0/x/XD9z3UsTVNx64dcsupgx?=
 =?us-ascii?Q?R2KRvRdUtAkf36HxZRq87iU3B1yeiC5vMJWRJXyZ9EjkRtnoUEz76EKpQEux?=
 =?us-ascii?Q?Itxzbpb27Re+CzcC8BW753bQaJEEbYpR+X+QP2lYvBc6fla0VELWsryaUiAW?=
 =?us-ascii?Q?NxxzEJRhQnAcyWPRgW+hdZsqXLIUJcty4Wdt1P6pe7q5RzHTtC7hPSUwU6IR?=
 =?us-ascii?Q?DpDWwZpXYtQcF9/MR+GydOrNKy0fKp2nV0l5yn2lLlgGVe6f5PMQzmJM6brD?=
 =?us-ascii?Q?tC9MtrBZ0Ayg+6aVTgfg2CZNFFn0TwiJ953WhR3lzBeRyRhituXTEJ2llQ/Q?=
 =?us-ascii?Q?gzdChSSWZwRebqcgOiuZxlRt1ivESPsbsia+Hi3VsZRqRZ7fIiZmOkQiPD4K?=
 =?us-ascii?Q?SSjIumS8dYLW9rk/vrk3tNLU/cUcVjf76t7KHJ6pp9HlSKweauPQrFjfyxVH?=
 =?us-ascii?Q?nGhr/wsSPtjY+708cDwex061KtpYTTD9jaORkAVPouHBF1wZEAoRb2Do0ZYN?=
 =?us-ascii?Q?nrz8KdwthbxO5XmAc2LNV/MCANul7UP+8x5uYNhM7wD8k3D6fzgY8YGw+Yhi?=
 =?us-ascii?Q?/7VZDBHq0/ZxQRIwbeRIHD2uxIa+pzaZ8MSSZCOiTlTsnCSjP7r1pR66ecV8?=
 =?us-ascii?Q?M+ZYs0j8x1kYIBW3fhNl3dPlASXrl1YkDmEOSQChKvztaH0f9kNhaAszDJ2i?=
 =?us-ascii?Q?B3+8GudYgsD6Y2Wy10RMfmbGJMpSuz4pCuu3i9Bd1QpyFnJ+xYMNYY8x3MmD?=
 =?us-ascii?Q?XzpD+OU91tjRoFETL/INH7yDT/vOaKNOuaM8xx/ACvsVSenPdaGZcp57c+W3?=
 =?us-ascii?Q?gxjZl6MPhLjwnQqoHFfAvbcOxGHa92hkA3hdlk+WfDJvZlIC/ALPY5QZNnYD?=
 =?us-ascii?Q?ta1i9gX3KOlD9TCdOmUVMe5Qa9b+yJzdgNiXQ49vdCgjmLWodO4L8xt57h+9?=
 =?us-ascii?Q?Gxg3cOdVjsdkxluN769BzDYeErcatQ2G/qle5n5cSUqLnn5jUYjkbFeyLeDo?=
 =?us-ascii?Q?uLjZ26nhx0aUBg4Dd6Ru14cIr4mvk6VTcIh2AVwTQgPWGYZ03qumN4Zwac9/?=
 =?us-ascii?Q?sR4A6v0ndC2zPlWJTrvkibdGcL0mQGQdcksyhpVwAZgFDWOTHKQQOul3srV3?=
 =?us-ascii?Q?v1pq5S+A5zFjHF1i3ikJiB6BPq2rXe48KnH4FaW/9b9nQ5rRnMO5TR/62WYJ?=
 =?us-ascii?Q?JD8c1id4vH2erRhlJSvSbTdYlO5k5+A+UNKTWjPcfo4yrJys1YHEt1fNoYiF?=
 =?us-ascii?Q?TmH1juw7JtHhRyHTYebNi45AWlMW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdb9703-cd3a-4955-edc0-08d96d20ca20
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:16:25.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4Ry13XnHxoM89L7GNCaN/3h/FCG6I7kpgxCddZn6KEVgc2IXf6mlTfA6qWMTuy43FS/OjTcfwP0OFWmdsWONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 31.08.21 19:03, Alan Stern wrote:
>
> Will wait_event_killable_timeout() prevent complaints about tasks being=20
> blocked for too long (the reason syzbot reported this in the first=20
> place)?

Very good question. TASK_KILLABLE is its own task state, so I'd say
if it doesn't the test suite needs to be fixed.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

