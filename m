Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A83C6E6D50
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 22:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbjDRULL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 16:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjDRULK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 16:11:10 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F19E4205
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 13:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhGGnN1Q9IBIAkALmfjdgsxI15pxp8g5NltE1zlicNuPhllGJ1ad4Xskw2QQSIp50IXdDE0tEGLBeQ6UhZCRc0sSiqI+uPBtK1CCQW8NPQASvtb0c2q57nBuvtKxGWvic24NHDpjamBgjf7FUwjvU/yjl2i0Cqn41/CU3nH8QTVbaB9axenyXHIymjiwQCrenA6hYDipwCpelUk3YQ8T1ffMqWyITPLVGgmmCw7SflF54DpH7Yatt0KywP0sb7hgM2s9/pr0VdcLzGSelbXGfVg4y44LWxrlOKCN6E7nUbqrt6JwSzYaYd6UqnsV0zYsaIKLU3HjI1RSJuN8fxdN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw/1RMGk0410LGLE3GXC04iFB5+Fcp5PN+9uRtVITKo=;
 b=lSF5EgrmLXPlKcVeY63f+9TLVc0aADiQ+2jkDb5SLajvWMawr8Hw1O4YAdSvWp+gNXH7qbtDf+ehkCiAMA3j6KofUGw64mE8Z6hUTenyaRqmtUUEclxzunSqItBu2R76oBRsqlHPegeojzui447IwA6ms/Fz3YuiVyl4WrK17bMzPoFA0/ujou+KW88AW3VhK0JEw8eCeTBPJTZxwWPsvZCZyovIBZmpZl6cwf3ogIz7Ta/n2IQ0G3dS4uc4EggfE7bNct3R4dQ7vs7RgdVjC8Kjb/LACChYgclAk5WbJIMAhBRlH6HtakoHFNsCmB+kDBjgw5yWzA3Pva39OKFsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw/1RMGk0410LGLE3GXC04iFB5+Fcp5PN+9uRtVITKo=;
 b=TamaQKprIBla42yQYaV6yZr6BeKbGrY+vnpckxTtOjx2Ys2/JJbVAktX/QZ1zpngznbRFNjuBozOuSW2F9XHAp7jtwSyeSq4JT9sjD9/nmaNT2T5iyioOHsdJp1vHe/zdOvVh53DNislOomIc2FNF60InGfDr4rD9pR0RaaoIcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 20:11:06 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 20:11:06 +0000
Message-ID: <9ae41720-3774-79ba-8901-c82b89693dac@amd.com>
Date:   Wed, 19 Apr 2023 01:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     stern@rowland.harvard.edu, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <2023041856-shed-sesame-4a5c@gregkh>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <2023041856-shed-sesame-4a5c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e69982-57b1-43ca-900b-08db40490aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FrpJ0KQza/k7Fkt0qt2iRpGuWOwfDXWT2nuJp7yLezzkBRzPSVkoVv4VT8NQepaNe3ygVFFPQ6FAXCHW5Wlp4xtTAs9W/9Y7jh5RWD1L6CHuYYoNsbPvM5wjXx5HCXQev+c39xz+x4T9JX/YltCF7zNOuv0rxKJPhrcc7R63ky/xjVy6KX0RwlVH2UMipWoAuBVIPZhEYcuJoaAqv5UjldrY0qQ2Kde4pwiFgRuQ2mx6mQj5x/azsTzsH1C+brhLbhqL7Wlm3dJsAU/DlUCTDRDNyHI0pAvsSl+QDSJYCm3y/jLLPQD5XfAmUrqm+rAPdfVhE5Z84JRbnBAAQg9BgXmAgD9ztbBZDn/jiDCAGnZ2L6MxhgpaOz5i2INYeVKT1b/CMgtkHsjezJRrNQRqJkoFRAhy3KE9TdZaK4nvzEDa2adRxzBhv/u6EyzljeneidhvzxJF6XHM5tv60bqCImUMHnP9uu8SFVgurc9jUePviwd42Sq97pozJ23HaN8D2aIcRtjw7eZJACdjco2oBo5S9IQtpFW4vVVSM/eM0FxeCfcJKShTRYs1EggJexK+HXTERQpZH+pRMphaQ4Q1Fw31rLixsz/HGdDN32SUAAJo04Bp/LgRUiJrye8jk9c+S4dDt42t/63faw8lwpA4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(83380400001)(2616005)(26005)(6506007)(53546011)(6512007)(31686004)(478600001)(966005)(6666004)(6486002)(6636002)(110136005)(66946007)(66476007)(4326008)(66556008)(316002)(186003)(36756003)(41300700001)(8676002)(8936002)(5660300002)(38100700002)(2906002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWN5TmlLbktUSmpWU0tFOUNNdzNSUm9JMnpLYzRVeElWTVlFeXAvRkhTTnBG?=
 =?utf-8?B?YTZaNTRkaHllUjZNOUVDRXlUbkNici9vWUFBcnE3dXE4L0loOWs2MUxLWWpq?=
 =?utf-8?B?U0dUWkhOc2VPYkNjbXdrVlZBSXF3MkVXeUxLcnk3ME4xenl3eUlsTVJFSG9q?=
 =?utf-8?B?SEdyT290aFJZWFAxeEdRSWVYUXgxbzI5MHMydy9jMjc4NkpXZFcyMS9vV0VW?=
 =?utf-8?B?ZFRJRXNUTTlJNmxtelpEUUNkWFBKVVFQcTI5NUhCV0RrbEI0M296cTlvamNJ?=
 =?utf-8?B?VVhVOVp4UVI1WEhFTmUrSENlZjdIcTZRNnRhbmNIQ29uSnVwSlRtaE1laFIz?=
 =?utf-8?B?ak4wbDBibVlNQUpVLzBPNTE0OXY1ZTMyMHkvbktLQUlvT2tlRk1TM3ZLRnpN?=
 =?utf-8?B?Q0k3VTl2UnhobjM0VlRQd0lJSFcyYU5pOHRINHpOaWZvQ01zNjV6K0NqSE9F?=
 =?utf-8?B?NjZVL2xZMENORURkR1dHckNIQlg1bit1NzJmZ2ZuMHp0d3JHaWhvaUh4WjNq?=
 =?utf-8?B?RnhWbVRmeHJ1OXFaOThYakZsRDFlZEt2eFlnVlBoUWtwYUhDMHUvZ29PZktx?=
 =?utf-8?B?d242SW5kYnZydk9zVVIrTXFzODluUlY2L0xnWUJTMHNWU3Z2UnlTYWZQZXM0?=
 =?utf-8?B?Um5GTll2YVhXQnBTbVBvTFQ3ZVF1dkpvSjJOUlkwaDdwMTF1MWZZYnBtZEtV?=
 =?utf-8?B?Nkw5SVpzWk5oRU9YWlh6WUpsVWVCV2ZoeTZERldCemEvQzFWMGNyaHpra1Uy?=
 =?utf-8?B?bkw3SWR2UlhFZkZFa2xtMGNvc3pBZlkrWmx5NlJVc1hlUWN6VFdQelpJSGEz?=
 =?utf-8?B?T2JCQTZGSTJxdHpzUjNFOGxiWDJQSTF2WTJkQytFMUdSQnFUZU1CYVJCejZ4?=
 =?utf-8?B?UkNvOXZMdmZ2K1lxRUNCVm5xVWdocGN6NUh0YTIvZ1JlVVQ2SzF6YWErcmo4?=
 =?utf-8?B?MzZuZGRSQVNncTFoTXNhU2JETm5ZRDdMeVhSNUFaamtOcktnNG1GSFRYaGg2?=
 =?utf-8?B?ODg0dVlpWk5PRXFlUElXZWRoeVFROS9RNFVpL0tNZ01mMDRTNExnVTVuYmFO?=
 =?utf-8?B?K0RiQWVYOUxXbzVQb2pyR2lJcHZMN0xMNHJpOURsUXpsSENxcVZNSHh0cHpZ?=
 =?utf-8?B?K0RrSnovK0RLMUxOdDdVVTc1eTlXbU5taGxNYTUyOWE4RVV4TlBEVjRFZGZR?=
 =?utf-8?B?aEFCelU5L2svZkVGMlhvNnBrdGUreDFNU1ZsSHphdWZWM3lsZk9mYXZsckMy?=
 =?utf-8?B?eHFiMFN1WFZoMitMUzI1cGpmUmtiSkRsb1h3NU85c2NIQm8zOG1ZcG1NeDBN?=
 =?utf-8?B?S0dsOXBiTEJLdTRQdTRiN2VHeTI1aWFjdXBqMnBxcFFkTExwSXpjWGpnbXB6?=
 =?utf-8?B?SWUraENySmFrZGZiNDdLbVN2WTVwalphRkwzaDQ3bVVJTG1HVGV6N0xIQXZs?=
 =?utf-8?B?dWtobHVWaitrVU9zS09DdkRieGVWZEJZdTZhZ2FJekdrSHpYdnZJWmxRS0lu?=
 =?utf-8?B?Z0ZzZk0zV2J0a1FLdVJDd08vSWRlQW5PTHJ0bEJ1dnMzZS9CZVVmeW1ZRmp2?=
 =?utf-8?B?eWI5SmMwYXQvMWdMK3VQZVJLOURwNzZUbmVOQXh0K1dPZFM5NGE5Q2NiUS8z?=
 =?utf-8?B?eG0zbTRuOE42eXdHUUVZYnFWYVJQTS8vVUdDRm5CZUJXdWVTMUROZE43KzBl?=
 =?utf-8?B?eUU0OWxoMVFrMXJzQUtYOW1NS1krWElXVTBIMER1cEZ4OWdBR0pKM0wwZEtL?=
 =?utf-8?B?Z200TDRIQ3VxSzdWQmcxemJVekp4eWNOaVVUd3NuTWRTbE9tVDk1bnhtYUFi?=
 =?utf-8?B?ZUhLdVBnODhENEZEdXJIWDFvZ0pRWFdGSCs1WGRrYldVbnd1UGJDcFJpb0pl?=
 =?utf-8?B?ekkwZzRwUHA0cnNVd1llaVZXOGhwbS9vVDh6OUorVlZRWWJvN2pZWnQvL25M?=
 =?utf-8?B?QkJuRUY5QzZBWEVyYnBCUVNURmJPOFA0T2luTWNWVFEyRkxadkxMTWNDbExy?=
 =?utf-8?B?cUczaHBteDNZNDJqcG05K2Y2a0c4MS80MHVDZlZaV0tTSWlxbEJqc3A4Z1d6?=
 =?utf-8?B?VVg3Wi9Uc2h5VklYNDlGN1hiU2dpcEtkMTRJdWFwSDZvaUp6elJWOEhrY1Nl?=
 =?utf-8?Q?IE1hM6YKTp4gSvvDAFGvwrQd5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e69982-57b1-43ca-900b-08db40490aae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 20:11:06.2572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHL/SbSAW+HbCxUSqBmUM+iHbuqvaCi8En7Viwu5IlhCl9r+qxIuEgTwLDGStCd7TZIBU+sYByYIBP2yTHKv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/18/2023 8:55 PM, Greg KH wrote:
> On Tue, Apr 18, 2023 at 07:38:17PM +0530, Basavaraj Natikar wrote:
>> xHC system resume time may increase due to a 120ms delay.
> I'm sorry, but I can not understand this sentence.  Is the delay 120ms
> too long?  Or too short?  Or will it change to be always at least 120ms?
> Or something else?

Each USB controller while xhci_resumes by default takes 120 ms if there
is no activity on the ports or no ports connected. Therefore, if there
are more USB controllers on the system, 120 ms per controller will add
delay to system resume.

This patch will prevent 120 ms for each XHCI controller during system
resume.

>
>> A PME# signal
>> will trigger the xHC host to resume runtime, and the host must wait for a
>> missed U3 LFPS wake signal before re-checking for port activity. It may
>> be necessary to wait only for auto-resume cases. Add a check only for
>> runtime resume to avoid the delay for other PM events so that the resume
>> time can be improved.

Once XHCI controller in runtime suspended state (D3), on USB device hotplug
controller will resume (D0) and check for pending port events if no events,
wait for 120 ms to re-check for port activity i.e. the first wake signalling
failed is handled in below changes.

https://lore.kernel.org/all/20210311115353.2137560-3-mathias.nyman@linux.intel.com/

This check adds delay to system resume case as well, which may be only required for
runtime resume (auto resume) case.

So added an extra check to handle the runtime resume case only.

Will retry to reword accordingly as above.

If you have any input, please let me know.  

Thanks,
--
Basavaraj

> I also can not understand these last two sentences, can you try to
> reword it a bit differently?
>
> thanks,
>
> greg k-h

