Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED253CD512
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 14:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbhGSMHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 08:07:01 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:29425 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237028AbhGSMHB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 08:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1626698860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kGuvusAsnGXeU2Bh4z46P8dJ+3DUSKoC8Xz5wZuhw6o=;
        b=ESaK1Xn63vAi56q3jg3G9QqqZDjWNQaV2MvZ4pkx/GwFKIAH1xmNoa7og39oWsTq+k59of
        ywuZJucNeU/YLDcpiv1wFSpmRxLjCZy1LEwHwvUxWzk8lwKTqTWtwuerP5kFpa2aBTxznH
        XJrcZsaAw8x9Sj03m/j70M49tI1JFN4=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-UAx9__ktPSy---WObe_HPg-1; Mon, 19 Jul 2021 14:47:38 +0200
X-MC-Unique: UAx9__ktPSy---WObe_HPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcBSPBYJXwEEd4MQym7tIOTOMb71R34ySTdsVDOMba3+ITJMpeGSsYdx/l2Kx1/kedPtxpJYkdbYIgkXij9JfmUB/YiasPryq3TgEX5VLjbg/DV0+pb13pHs7CNEWR1f/Q6ESQuRGWEvXF2CRCE//vo7dAk4FVNq4RtFpPpXZdEP/FO3oFvFggRRuTvVPX5aDySnBpEalC9CYWcKLIhJwchSIROhiRCPu++8/mHGEX9To5OyFNxvwilSyMX6MzbgtHncbK/ikeGyFAvPRgMDSne8285ULtuQF1jN1mTh55qj/Ol73JjSmFDlb2c899D39DD31EysOc2We2sfnm+KOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSU4ZO+Nz9ZUQ2cpYtemuM5BhLCzAOV8lcndpwTOl7E=;
 b=VGiqwqKxWj02bn3E9JXlHjUQHM3Yf7BmZlC55TlNAEYJwJbdzVPtXFxtpSN6ZYqFyv6c6VM0EWZKcbAabH/So+kvTEf8gyNzvCrQ8OJpu/4vILm3znP4yUq3rr/NwzNOd1r2xExzPtAj+KhOIIMKxBd4n5iHyzkaPC7FYxudaIg0JiGem0yOxvI/3TWvtHS1XYRil5pSK6K8Zc+WirsCS51pBe6mIRh9VXw/0mIbCbmhcQ4kZW2PmLSFmsETZgxtM7kKzjVgiVUeCrtjJGCTKuJtV0ISoslJALVAOUEvlFJG1m5JR6R/VkPnqx/ZzR8iGmQWygLN5Ub5S/chaYkVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 12:47:37 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::ed33:d0bd:1825:e5ae]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::ed33:d0bd:1825:e5ae%5]) with mapi id 15.20.4242.023; Mon, 19 Jul 2021
 12:47:37 +0000
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
CC:     linux-usb@vger.kernel.org
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
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
Date:   Mon, 19 Jul 2021 14:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0108.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::25) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3b82:3e01:c3c9:c93b:1b8e:a220) by AM0PR10CA0108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend Transport; Mon, 19 Jul 2021 12:47:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d00c4b7-4140-43d5-3ef1-08d94ab36325
X-MS-TrafficTypeDiagnostic: DBBPR04MB7803:
X-Microsoft-Antispam-PRVS: <DBBPR04MB7803E7BD73FC4BFEB549CF3EC7E19@DBBPR04MB7803.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OudF4eu+3RN7Ftsdu2wCcAtm0dTS9sG6oP/pSwFt6z/LhRSuag3HAYH7aHIXQECSgb02sBrQkLMMfINFiXeHdAoXY2h99jze/qYkPVbMOu6TlJgMX484LspuzczHWXAtSgx/U2YSPhYGykdjlQb2Gh01vVsDuUkLM/wbdtKykKB3VrBpMw5gkeC50SPlr0+ugldhaA+mIpYqrZTs9RqMpn2edwlAPYwiAzGNglQbwICZo9GrDB122sU1hs+qUilyYUa/Uw+INPLJ7BLLHon64K3OCx6Cn4Dx7Q3LUAmyW9BebeKOYop6omCmLHP8ctFjhngUdQUPbVbUBsxHikvXp/c2ZbKMOlhDefJsHVf0lZnvEEcGLgsXXjMtuBz8k0qCQwXB2ED/r9/xyWgEKCkOoS2twr1VnuCnk7NsoHyxf/C3VCkUPSDhNwxscMLB2Mq6yeZ3seQxPZ6wDcOY2R+tlDs/8490dcsh35WV+sPEE7DBUIribMlJ+JD0JIGmAlC6dNkqsHLTKRW8lsC2pij/b10wsr/lKoKGPl/EH7Q6sY3H0BdWyDIDOh70Gx0091gkfMNkpJUK+cItIRIAvBB1Ah+CXEEuDus3QDWA5jUJ33ptIlFUNo7m7/noG35328HLvw2oEB76TsXnetnn2SeNMChmLp66/BJdMGg/hceLdb5WK8hpcDN4QrBhPdD0X7Fne4ifxo3pgtmPBkA/bHBlmNrWucSrt7LGyfzGMiIKh0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(346002)(396003)(376002)(5660300002)(478600001)(2616005)(4326008)(316002)(6486002)(110136005)(86362001)(4744005)(6506007)(31686004)(2906002)(8676002)(6512007)(38100700002)(8936002)(31696002)(36756003)(6666004)(66946007)(66556008)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nyFO5Vmycr/pSLegeaWo/fV7UDAUP11PfRZ00xWZhWL/3kfv0AOQ2Ik1KqAl?=
 =?us-ascii?Q?utiH3cB4b18NezpAOTwMld94wWbPVD7+qX4QxG/eKMLvOsQlxgOWOsTi80tf?=
 =?us-ascii?Q?9Qq1mjDwjyArsTUhpsfLHfjGtZpqvEHbuonP6XS00ETxAb9Rov6hCGW0J8Pd?=
 =?us-ascii?Q?qdWtNNqel+mfpAhAw7ovnDFVpLWVAO6OIkjNqlhvj3gCRLjANJJ72bODFytm?=
 =?us-ascii?Q?M7wH3hycXhlTLrQDLCShBO5yl10k+wuEPcycaJLtcMVTLdGT56eyqSGtBe4e?=
 =?us-ascii?Q?fJR1KKZJ5sk/c+toig+9WtA7jkbXuMuMvKRGlOi+83nZgVO23GsIucMfLYVV?=
 =?us-ascii?Q?F3g9hOwPf8Vm9T1+psEikNN1U5hzypTiC5ndd/jenUgj3r90vfjAVU/eNrHW?=
 =?us-ascii?Q?CGkJfmcRj9PcefnmEYfEGgSz76FhmG/G595SSiVAD8eRZHHNZBBTk2sG5H5T?=
 =?us-ascii?Q?leCy5JBgm9qZXSrZMLF+UmKwzmrDL0ng3ef4XW6kYpW9eljSv4s6fpl5Bocg?=
 =?us-ascii?Q?Wt5swLy5nnb93+aPN7W8KNp975ByuRbxl80n0EwWdSwpAGhcugh8XaPy8XBM?=
 =?us-ascii?Q?fRGG423H5G+U4k+pJsH8ialvKr9y5riCkAwoib3jo8FRUgSnmoDjGK9U72fN?=
 =?us-ascii?Q?TbvwBEdKRtKBxhFDwpZVWP2QnQf5JJUEAUOk7ts+GlKN167qaNnrYhkxD/vl?=
 =?us-ascii?Q?CdMF2ShPkO9LJq3k+ey54X3POUm1JicAoOSLza0zzNfX2Fi8kYsXDU8oA9no?=
 =?us-ascii?Q?PURvqNjnAaPHSXQlUxwcx5NqjelC0WVpJXzxFr0ouiQI80YewJgEVGAU7Sq1?=
 =?us-ascii?Q?h1660Rd724Ap8D3iWvGf64KZSqcq2RKifVSnc0kaKeRblWazEQfbOl7mlTip?=
 =?us-ascii?Q?xIx4oSpwqUyNm2hdM7lYFQrv+Jv5cPFH3ZP2NhFXF+BCAihTpLEDfA/eBeIf?=
 =?us-ascii?Q?wJf23+kLL2q5+kXrAPqZA0zPhpxR1F4nb/nUq7brqwNYVuXdMLg/3HvTC5mN?=
 =?us-ascii?Q?ouwhy5xIuHTU8q+WP0LzR/BJsZ4lz1OtosofwgTzepiohSKjH+wZ6rT0Pm4X?=
 =?us-ascii?Q?PIbQP5WAxm9Urg0utzjmC0ZsOlLoK4ElbdI/U8IghQCHMbAa6BiMmLCOIGIg?=
 =?us-ascii?Q?KEvaCLiiX4Fo83elmgWqHycxCW9Kr8RglGqvq8XyTVmtDo7wOkxC/yad7Gso?=
 =?us-ascii?Q?xzweARsYDxevuHNVrSUHxC2PzArTFSQdv45IVv/Cwd9Vr9sCPpSFYWI3tYGF?=
 =?us-ascii?Q?5U1vxpxnxbxOsV8lsODX0rznstbZUaSPFHO41FRmdYWugAE95aP5i9UvusU5?=
 =?us-ascii?Q?W/XEESL8bE1wZ0O8fCvLw7URCbmiVystG4X1wQZ3hiyiyQdZqUtTl+mo9i1R?=
 =?us-ascii?Q?iTyaIKqWI1K+BneBC4joxxCI6624?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d00c4b7-4140-43d5-3ef1-08d94ab36325
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 12:47:37.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMQHezgdB+KrOvTtod79gW7MiGQlcejHR67TJbS8CvO9QfOU8horEINOxN9uqubx8RbbYFyR0l88Z2lJqGHt/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> Hi all,
>
> apologies for necro-ing this thread. I have just tried this drive with
> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
> get the drive to work:
> options usb-storage quirks=3D059f:1061:u
>
> Should we still try to get uas working with this drive or should I
> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
> now. Thanks for the feedback in advance.
>

Hi,


sometimes we must give up. This thing is too elusive. Please send a
patch with a quirk.

=C2=A0=C2=A0=C2=A0 Regards

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver


