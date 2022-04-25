Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9209450E259
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbiDYNxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 09:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242321AbiDYNww (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 09:52:52 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA13A4A3EC
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1650894584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e9H0XSBPvTW1Dy6In8LNZHUk9caRQGVPiB7NUSYSAMs=;
        b=B9ZaQ4ZAv2H8KLMxoVcU5iGmW5tVtdvvly2quLaIc9ucGk6RQr09uFFx763OELhKkVHwpB
        grONwCRxEdX7FY5CL1Al5beTsr8vuqnbv/0+/+8oP2RNHHIecilmkJ6kVSbgbwx9C4p9Eb
        2L+EHfzRteCPBsGQn/tNvSy2Jy5EXUc=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25--NnLZZ0sMRiCCDU5yK0Fjw-1; Mon, 25 Apr 2022 15:49:42 +0200
X-MC-Unique: -NnLZZ0sMRiCCDU5yK0Fjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny4Z/XRBohtDzKQFr/hJCfFmE5lsjCAC9Cf9/rrzyTu153xEhrXkRtPPToIE/ZHL/BLFa/eFoYWVLyk1w08K38USzpRTj9W/nr99c2gnalke8TrlirH5pTnxNfbRZDVoEfnlTnIeWgzx6VJlF9im8wnQYPkhx8gCI7jO91juGCMJA8awXzJxs3Zd3Ph4e9Y77888erlJMywcWjr/oCeQqinKja72VUWrx+j3bGWty8gyt8FDeuPQg6Zx8eSSTE8MqNu+CG/w2kBSjsBkDRRQ7ZIU3bmAbDqjQlutsYf9cVtFEuOys5eHGtm25uVFCQXvQd4SXeXYcMfp4pWwm/xZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfmdFHgnUmW+qQJVY49yHnOvGRd7aLolOtj5pV/6tUU=;
 b=D7JBMzno/eKmF/ZQBxjqrnX0iCKW81vbKLIAX/g/cUlFqs7M7aAIqR00YcgCzL3X6B2Gx3FNnVi8hx7VPVCpGnyjwM5l7mkElg54SX9StD659u9S7Y42gOvxdhxNUjPXyJx9h8xD4VwkkR/S3BGcRXReznN4mQ/GgEaTmTZ0St/gbEPU/bJI9eqTVCewlBxhZ2fo87U+jCtY/F7QLGs91UDPtbF9RVxlgqekH3Ny62qVZ6nQFgEzXyBDXgiix0d8W/ZDBDi5HmHhev9bMfU4ChwwGLj2BcO/dH2nacUcePuc086fv4PqOBrRVhHwuqqwPB7BEjB4URTt7ZsZkMNOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR04MB5139.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:49:41 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:49:41 +0000
Message-ID: <903b294f-8407-3438-54a9-3c96e361be41@suse.com>
Date:   Mon, 25 Apr 2022 15:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
References: <20220425132315.924477-1-hadess@hadess.net>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20220425132315.924477-1-hadess@hadess.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::16) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47a55e3-5c73-4286-a51d-08da26c27235
X-MS-TrafficTypeDiagnostic: AM0PR04MB5139:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB51390F0D3091E5A0D218E07DC7F89@AM0PR04MB5139.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTdawQyFWWiHa/mYsy87bLvzLeyt6foUhOfEb2YMA/BjV4SYS2prW7ahD9nE9rCBdvs8swdj+6VsWx7e2IEDpQbFrE3zHOsjofcHHv0auYwapxJyVJ11PLoj3aiVPLtsGv1phM2wtPAOs7soitWH9ijZKqwy0EwkFpRJczT0/qFq2kSN7zK6FsCPlYCDUh6KX3wbAkU8REwMMQ1gItZjy+a9sOoB74GuZ19Hk6xfmf4XMnfHCY0ibVFkWN3FC5p9L80gY5wNwXyjo+Y6m7+CaKqqnX0+UXrgrwspbuwUj6Bz9eBZv4cTVoJe6kt/oQnRpkaqfeqtgz/JbnPVvbL8XoW+vyjbn6GWs0OxYmsNNQx5U40nR1DvD0H0MBY03J563rRJDeCDK8uc85ZVx4F1cstOR26qyqIo+arVPWVNcgUsHiDVfKVKxnTrrFiWr70bNduHmn3Iz8W7lOlh7FVh3azgMqw4+DEDmXXOSw6XmM8aqDvqjImJ9awv/SKE366p/g0ePFWIsTEBPpVWQL8O4a5xoAQ52F76p1Z8TKXiY7tkqJwA9KOwDEil4JeizOjJNboR4n9JlPl7N1XSDiaqTpcerSm3tKToFRcP8gm1fosdX1zbZJqVeH8NNst43/5wclU6y8ThWS52l4B7rd7tbWF9RuLK7L8F57TWE+plleJCGz1amyZqdNzlBQnUuEy1bWafSr9yH5WuFV6/yX8wStOvcbd1O259LRvTIWs/mbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(36756003)(83380400001)(53546011)(31696002)(6506007)(186003)(2906002)(31686004)(4326008)(66476007)(8676002)(316002)(6486002)(38100700002)(2616005)(86362001)(508600001)(66556008)(66946007)(6666004)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3/i7TcApqwTOu/mwFi89pZGf4Urmn+PrxSeu6OHIBtVllF+Aw8u6FBBQ16l?=
 =?us-ascii?Q?PAZZpqmPxRi7exSrjpj8nCNxDdKQTtmVcf0yO1jj9dgKBKcI/3pi5SEiYJ/E?=
 =?us-ascii?Q?ymGjPs0MvxFgzGVdDTrDMQQLAGdIgghsV5NlQiSFHzh59Ykvz8aN+Dmt7GiG?=
 =?us-ascii?Q?xmc8mDv9v97vU6hFo5cYDte8gsQlD7L9b+37BO2Mn/3ja76XUgBFm7GRDTFq?=
 =?us-ascii?Q?INYHcVMXvwhKye/LRMZp0QjxWwpWyrKZBOxzoGn19cQ7w/Ky5pzOlVydMTxg?=
 =?us-ascii?Q?SisIMVv9hN16lyunlfwLSrr07YcCCJNC7iXmK7yjMC9x4uSOVWbNOE6pyr1L?=
 =?us-ascii?Q?AJz7rdFYXqPI3xnc5nmdfDDxCrs3QP54MuRMmZc1e6eP+KnxYS/bxnyxtwhp?=
 =?us-ascii?Q?qlM5io/NKfpAy2jANuRIGtJ16HUfitP5/O1LEj8uwSt1kch20Q0GepSFxXyY?=
 =?us-ascii?Q?9uON9hGSjqi9omuw/h5rmd5qdCk0F9rkNM+Wc47x+a5TgHL0CfLSnx0HoJIe?=
 =?us-ascii?Q?hRSQ5Mjgkxtmh8R1vy6TeoocGSmW08Rj15qcCO6Y+CrG7xXNw9NM1GLqtm5E?=
 =?us-ascii?Q?oOePYc/PLrtbuPTTdiKqRoPc/rCUr/e5N2PE16G80u+pBlTofXuWwBL6edLq?=
 =?us-ascii?Q?yTDhurf9aF4ClwgzMVQ5v5Asssp/oM/RzSaVxJ5QYBa5vCZfxQ5WhBgbUmvU?=
 =?us-ascii?Q?Kl9x1NhN/7bTe30ZGsoeT3XGCC9fbXBLiTV9nKFod+5rxzTGIMC+zDmyZMhH?=
 =?us-ascii?Q?/jtR55c1YMdKh5EtlutspM3b6gNBLcyKpAlge4e9wZReZ4e4q1qWZISwLH0r?=
 =?us-ascii?Q?i6rBvY+wuaNBYNH1ru7aRqW+1lIpJPpsWG+XZAAgNCOm2vnUZNkuPREfu5aE?=
 =?us-ascii?Q?/fgIXIS5GWG+8Kn/ITemPlgb/21uPc9oaGRomTrV64eXyozhGjAwwWFsUnqA?=
 =?us-ascii?Q?5aLYF5+X/Q6uwogywtVffyb1lMv28BorzB1fGZr/ZJrNR+GYdxQeM3YtnFsO?=
 =?us-ascii?Q?SP0yv1lwfdao3meNq94zvC+andlwyHPy24jOJR6tFTwM6lZqKkNFlrpazGTl?=
 =?us-ascii?Q?IRD43wko1gu+j68QPyk+U4k1drIqMj3BJ4IU+W7e4vgo/0HF1Ywtirso5k8i?=
 =?us-ascii?Q?cxzr3p9S0sxlrSoV2Fowih51lZ7AoSfkzyBLq7ZpTZlwbCkKV/DHi0oN69N9?=
 =?us-ascii?Q?14MOsUer8QihQpHrlXheUZ35i2e9M98cn8j4wenOdhoKMDF4zgzgev60js82?=
 =?us-ascii?Q?S4SV1LL1iyYsgfVDbhIKllIJ/TmQaqGhq6YVNuZbGH3jmYqg+KioVJzlw3cH?=
 =?us-ascii?Q?UIveFgxo0f9o2H4d/m8MNIcbPQTqKHnS2wEn6K5Il9Ywoialy2vjD9XZ7gBB?=
 =?us-ascii?Q?TJDHvcK9kaGRACShDe+9OuCXZE1+SwpRN3zhxplHO2100bsehpa2FJmDAj+t?=
 =?us-ascii?Q?J7RA6wJ8I9yNQGp3nWcV5wPlC7uZyhuBzoeZioQNG/CzjbKSxPqUj+N5n99C?=
 =?us-ascii?Q?UGZwR6EsZ62pnSxy1MSlQC9Yh54j8q2R+MXbWxbzn/VKWXjY0NQohv0Bzzd2?=
 =?us-ascii?Q?cGFnR0BTp/kGnd2acEsV1fkQSPOd86XK2q79lY/ECmsPY6ryhOx5Qxr6OZzc?=
 =?us-ascii?Q?O/Efr/XMqdPdYJEEMrnj2B2hnwJFQNw+RJDd7o2W8DSbIehg2QlIFhT+1O0n?=
 =?us-ascii?Q?ZcJ0m+BULcMlJDKeVdPW/ni0yChE6k2yCh/9pjFxB+Odx8baVBzk4DSvUK/R?=
 =?us-ascii?Q?S58SyDwNHZEwCKbrheVzTNGUV1kqG4JhlqygWUcLJYu/A2yaJ+V34RlJtRgA?=
X-MS-Exchange-AntiSpam-MessageData-1: QT4MD9B3eXNS/w==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47a55e3-5c73-4286-a51d-08da26c27235
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:49:41.0006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhIR9lkcubEDwVwJXutT8JMvkTcbEWj5CJ3/XgrwHaFDwmqhXCM5RFAvc4oX3ahZE8Vv1CWfx7VnkGI2dDOLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5139
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25.04.22 15:23, Bastien Nocera wrote:
>  struct usb_memory {
> @@ -237,6 +238,9 @@ static int usbdev_mmap(struct file *file, struct vm_a=
rea_struct *vma)
>  	dma_addr_t dma_handle;
>  	int ret;
> =20
> +	if (!connected(ps) || ps->revoked)
> +		return -ENODEV;
> +
This lacks locking.
> =20
> +static int usbdev_revoke(struct usb_dev_state *ps)
> +{
> +	struct usb_device *dev =3D ps->dev;
> +	unsigned int ifnum;
> +	struct async *as;
> +
> +	if (ps->revoked)
> +		return -ENODEV;
> +	ps->revoked =3D true;
> +
> +	usb_lock_device(dev);
And here you lock the device a second time. That is a bad idea.
> +	for (ifnum =3D 0; ps->ifclaimed && ifnum < 8*sizeof(ps->ifclaimed);
> +			ifnum++) {
> +		if (test_bit(ifnum, &ps->ifclaimed))
> +			releaseintf(ps, ifnum);
> +	}
> +	destroy_all_async(ps);
> +	usb_unlock_device(dev);
> +
> +	as =3D async_getcompleted(ps);
> +	while (as) {
> +		free_async(as);
> +		as =3D async_getcompleted(ps);
> +	}
> +
> +	return 0;
> +}
Getting your file descriptor revoked should wake you up
from poll(), shouldn't it?

> +
>  /*
>   * NOTE:  All requests here that have interface numbers as parameters
>   * are assuming that somehow the configuration has been prevented from
> @@ -2619,7 +2660,7 @@ static long usbdev_do_ioctl(struct file *file, unsi=
gned int cmd,
>  #endif
>  	}
> =20
> -	if (!connected(ps)) {
> +	if (!connected(ps) || ps->revoked) {
>  		usb_unlock_device(dev);
>  		return -ENODEV;
>  	}
> @@ -2779,6 +2820,11 @@ static long usbdev_do_ioctl(struct file *file, uns=
igned int cmd,
>  	case USBDEVFS_WAIT_FOR_RESUME:
>  		ret =3D proc_wait_for_resume(ps);
>  		break;
> +	case USBDEVFS_REVOKE:
You are still in usb_lock_device()

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

