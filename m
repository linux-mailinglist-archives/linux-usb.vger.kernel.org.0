Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5206651BEDB
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 14:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356855AbiEEMKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 08:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244504AbiEEMKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 08:10:48 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982C924F30
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651752426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+tCMb6wxOsOCdbTmkY4kuxJ8InsYcMfDFOWY7IYXkIk=;
        b=a6L2X/M4YYSUmbpvpb0YtQP9oXtJsdz8975BewzWzK23r8zeAR5c8NTtYLf+9n3rd9SPfx
        Jz2GCk9RcnLEmAChl9sZgLf+UcN30xsFZgbzC1wM/aQwiIRzrIQ8Ix2Nzx9Y604h3FBME/
        7YSDBdgy/uGP1MlbNLJsn/mvs21V6E8=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-PX8GkqqrMFOaGwp4f9ZaPg-2; Thu, 05 May 2022 14:07:02 +0200
X-MC-Unique: PX8GkqqrMFOaGwp4f9ZaPg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+m1FvMJxOweU5NTRK9v4KRjhnzqRhh1/jMtQxlYJoL09SCJi1sh85i0wdQLGU4y7AGEaAk+zRauhjreYtYkMNIqEOuZuXT4CCqkVPmCYCCtPa0xzeR9EneuqfgLqY6fHCO8sEBvhb1OaVqWJXEXXOdJNlPw62IlUiiTF+1R+1mSK0DSIqlYoERMbNRRX2t1kqKzC+teH2PyKZzybZV7m2aJTNlNkwoUhEuTErabuQjGc+NS3yvjKEmSAQWshjFlUb5PEDr7G3DBrZGW2pgwHVDWyMLxaIfT6kkTfxKjiETavGAOIibPXUNtaKWQgQCexijpWxz5XsGdzaJCBXlt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XhwxNIYvWRZ0JMNWMRO1JQGq/ORh88YZLx7peV0Az4=;
 b=V+FtJLnRgRAj1TYlXs+AKQaEFebZS3JsDTKXpnYrcJirLUZfc+oQaqaPTaTEW+EPWNwPVm2mrn+RFnMgo+fCHd8W+PjG/kEfB9zf0ZR5G8o6ihBZpbjRWK6X7/swifugD7BBWUwoc82Z45pIhFiD2DnbRNAvHdDet6y6n0G7slqIqxKvoQNAPeMfD9XCClINoXD8i0goqN4gWFM+SuAlXb0pOwhto68sL47hgSBuum/tGPGlqCzpkPJ097/tDq3na+ZHq4SARzRPxRJkUhsegZ84waOklZuiVZsnpBiqDGEBrdNVksdhy1iolRODFUkh+/WPvA9Q1e6XhWawcQctaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by PA4PR04MB7760.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 12:07:00 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 12:06:59 +0000
Message-ID: <50d48f9e-d7b1-a05a-5fbf-2c0461b540ef@suse.com>
Date:   Thu, 5 May 2022 14:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Content-Language: en-US
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        Oliver Neukum <oneukum@suse.com>
CC:     Marcel Holtmann <marcel@holtmann.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
References: <20220504083612.143463-1-jtornosm@redhat.com>
 <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
 <CABk-BGt8dFKkRvFZHpJnkHyObZ2G3D102zvyEFjVYjaFVRiQdg@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CABk-BGt8dFKkRvFZHpJnkHyObZ2G3D102zvyEFjVYjaFVRiQdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0058.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::35) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c8ac5b-cf62-4101-112b-08da2e8fc20a
X-MS-TrafficTypeDiagnostic: PA4PR04MB7760:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <PA4PR04MB7760815C299607C1E99302C0C7C29@PA4PR04MB7760.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UNYX7IsxVtwl9RCgYPg9Kdz1yzckYBCR6jDzsc35DiHvDaeGWnlcNLLwXWgTbyAtYCiC9GtHBY8J9ptoEHEf3D2ciTvqXHu8N6pZwDmT/ZmOgwN4PgE2QNPQ6Fk5IOIp2ZS2ueNWbqbhZzbe6uuT746S0mQ+aeBAJuoC7VH9xtjmhGVynM2SCfbgwk8mjiRxdGM3z9UbitsUmD1hxdj1Y0/5DwJ06zYBKex+azqoFaAPDC/Es3zPXa/apxz+kYigcybrdGL5li3EB/Igiwld01dFS090DoueD2R83YU5A23fnZdX49ic0Pxkmvv2SW4psGdIKh/JfENMpldAW2GlWqPumjr7qFQ9JUpCASUqCFwlTyoK42nkTs7l3HdTA7s7ql6sU9APWC4pFrOfPdsuws00fwqveMj+51qofWLTapzyw9X3g2N24BZR+eh/j9pL/S0jReoaGEqEc7Mbz4EipfetizKW+2ODJyKYVs1dmph0ETg6WRbNZ1PuYhjpQM5SEq243ChlnjlMPEFsVW2TxD7mtNuwMv8E0i6DgE3DShdLBbxGNcUeQtZACFrXvucd8q2QcgCu/9L1mYkbn+EbsIuWPABP0YIrdk/E7Ebzdkxxsts9A5v8+cSJZ0QtuQnqjyoUtpYpN1dhaxt/Ejyid09LsLHqRhXcO+cJHccT2n1ZoTrIXj/5TrTMTzQS2iqSBeTpvtbr9dkaghuAtMDzQqAJgUhlvkiFUDen6CtZvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(53546011)(31686004)(38100700002)(36756003)(54906003)(8936002)(4744005)(5660300002)(6486002)(6506007)(6512007)(110136005)(4326008)(508600001)(316002)(86362001)(186003)(2616005)(66476007)(66556008)(66946007)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vq46Khcbt7Hse5eqdpE80ZqzwdVh1AkhSLx5GTM/ljH9kWL2DZXh+MuxxSGS?=
 =?us-ascii?Q?suBDxKzU2reYh6xCnshF/kP02Zv2pqvYldZdzRxi2AmncB8qgp2CES3+AS69?=
 =?us-ascii?Q?Bp4MWhEK2ci9H8fznOo0LyvCc/nC2b/1sT7fqMCooSE3cXhHjmJRjJM1My+Y?=
 =?us-ascii?Q?LqLkQtzcAiOvJYfCSAmeI01IucsOzaDFEIKlcobSLhA3D2+rJ/VIYg31l62S?=
 =?us-ascii?Q?pFb1SH8xdUN9Xa5dLpVw6X59s0x4aYm45KyfvZvWmuZcGoZYVr+Xr5Q6aMdv?=
 =?us-ascii?Q?hQvJ7Rr6dJpvek3zBrSUDevtT2yBBK4tPkrBsLfrJ2yid7UaGPZ2x3LfTYCb?=
 =?us-ascii?Q?kUg3Txs5x/c2/T3O5fju6g2KxU7lJaClnftZSrNYWvJolshXV9pvfb+MoR9T?=
 =?us-ascii?Q?l00iK/dGSqXDfXsmhqhJgXRzUpJhNcxj5YuPyBmAoNzD1LcPEtBCY3viTIxi?=
 =?us-ascii?Q?W7BUN5Q/xPFfg3RlxcCS/guZuejdDhXoFwpfVy9pqLD/l0AC/vnSIxfiuKW4?=
 =?us-ascii?Q?0pyWQ79YHhof10elT5OsqSjB7oP22YizeSLMl+RCtKuGYSY8rxSjYjzfXytd?=
 =?us-ascii?Q?hJLFJxbJ1vbOZoPGOVzG3IIHKaULwHewpS9I190o57cehSv2/2+jMGTl7WXO?=
 =?us-ascii?Q?wI+G2RvSf7/d+ux3NCnXy4XZa6i9k/56CRN3irOExVK2HgF/eqII49b8sSWZ?=
 =?us-ascii?Q?9kRXMDUu0v13l79lwN1sUhDWhK/HeB7JETWT1Vmfbxr6xkmf4uRgYbW9nYaF?=
 =?us-ascii?Q?oL7o+BER1QzKOiektMYp1nOJvH5e8bjUfJtm7Hq9ptQQqdZTdghdtT55ZeVd?=
 =?us-ascii?Q?muEHqXFGWfGuRDx1K/XSQucw8Y5l/euspxQTekVqRlCrIFtq/hJT1r3EUlmG?=
 =?us-ascii?Q?4QYhGbUtSeCfp5A0alvnbhQS5S6Bv/HlE1uebTBNGAXI0uiG98ZnA+0VWje7?=
 =?us-ascii?Q?MRtHHfQ+SNDWvdFliHE3E16lkbjJT6RCGQK5YpOCmXgkYo15endh4RK3pmK/?=
 =?us-ascii?Q?uQoankv48HUUOsuYFxvrvL1dtnj7o6pdasD29Icp35ziWZ8SqX3yviDyie5U?=
 =?us-ascii?Q?yMEnGUdhQoATqCdkJWziosvVygp3IwWN1zocuiYQFL1Wf+ES18TvuhfYBki8?=
 =?us-ascii?Q?6/Llee/jETowssPtDX7qkeBDvbq+JpquOmPIuEACMkQ780ua4/aEDQTgcetf?=
 =?us-ascii?Q?gDengYFsD1rRFixIYDg7HGUW5C78x+I7JAt7zX4osX56dt9+5fRA8eBo8yC5?=
 =?us-ascii?Q?fwBmczbwk39DcMdgXiFXnSLr6enkVF99yqFH7/T1GVsHJ/sQ54/bSiUnzW64?=
 =?us-ascii?Q?xc31BRlsWvjdF0zY9WHViKA/c8OjdHLpmvMT6t4XEEkjkGJWFjEPr5lRdPFu?=
 =?us-ascii?Q?WpLJeMqNEg6FkrWHRCN/M+K80PxHQ2+Tp7L0zyQRFpjN2rFegxhzvY3T7f2c?=
 =?us-ascii?Q?EjVdF+80d9ZHkhim+EbM+lgftqFNQMJ5hDwjzpgNLEPe8jLxJeQvW0lVSHM0?=
 =?us-ascii?Q?lpG8rWn0EQwdJmYe5QlcK08eDc0elsefq7InDDWzq8vlQeeHjasOT7FrIPuf?=
 =?us-ascii?Q?1bHMwfD8j8+c5ZycYunfaoPCXBCM0J2uvPzKoVimIZrb+e2gccxUxZgIxjm4?=
 =?us-ascii?Q?Sw8niz8NyHmpDBWalkAmKcU8J20f2oBZ9plCDCmwCePebGAJV+BYUMTnPVCT?=
 =?us-ascii?Q?JVRXLWDRXUwrpQnMwya1B1y9fbiwi9d2ubED3SliCd9ftm9gXesSpjGMfE+R?=
 =?us-ascii?Q?Rp5WUrjrem570qDFquHDlOOniMuBu03eCy8NxRb5+MzIqdsakpKn0Qg9hjyz?=
X-MS-Exchange-AntiSpam-MessageData-1: nNe1dRubE3RZdQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c8ac5b-cf62-4101-112b-08da2e8fc20a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 12:06:59.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiF8N5qYxzYmKwPRjxWg3IpDAXWxifxV3flOG4ujnxwusZI+3Z/ZsWR98x3VyZN26DbsQ0d+z8YcPo0eJX/KZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 05.05.22 13:15, Jose Ignacio Tornos Martinez wrote:
> Hello Oliver,
>
> Of course, I am working with usbip to remotize usb devices, that is
> the reason why unbind/bind is needed and with the btusb devices that I
> have, it was not working.
>
>

Hi,

sorry for being unclear. I was not referring to positive
knowledge about the devices you are testing with.
I was having dark thoughts about the other devices
they are sharing an ID with.
But Bjorn's testing has resolved that. In that case
we can indeed not penalize the compliant devices
for the broken ones.

One question, though. Your approach of simply doing
nothing if config 0 is to be selected again is a bit
brutal. Have you considered resetting the device
and stopping the reenumeration right as a config
is supposed to be chosen?

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

