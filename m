Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A8C5385E8
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 18:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbiE3QKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 12:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234005AbiE3QKP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 12:10:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659886AA74;
        Mon, 30 May 2022 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653927014; x=1685463014;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mPd5flCe2WR3QTaQPAWFxVOvywPQMuckEg/a1Uhkyh8=;
  b=fRzwnk/LoyYoj1j6O+m4vfS4FIUCYM4z+v8gLxXj9Ybh/RA4K01EgRB4
   JY1aX3ne+sAIq9iGaGN1bdz44CH6D5G7A5lXDeJQec0FwiL5YU5oQeBHz
   q5bdNFIshfQQEem5W8Td9u6x22omIDK4Z1vs76Y5b6vpYIQyWuv2ln+Pp
   FsIQ0Tf4rNVg1NDeCxCU7zgWAGn7mjlcVsWbkzZlg4vMPHCn7iqPbnQVR
   pPvXx8sk4NG/3BKGjYBgXulBfiLgQaC5kipQnrYbzQVnEvr/DLu2euXB6
   sk0qqAwGx8q4itI0nmompzXVdGeltk/UfcHhWp2N015Ijc6HJBPZ7UvEf
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="335686736"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="335686736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 09:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="575991815"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga007.jf.intel.com with ESMTP; 30 May 2022 09:10:13 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 30 May 2022 09:10:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 30 May 2022 09:10:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 30 May 2022 09:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUM5kVZUkFu7WeC5xeY9MDe7ZCOzxKqfK5Fb7Kq8Fg8v7u4KUoAv+V0oJPDrQQ5BELvhJikWOA61JOV1eMi3UkTfCFrvmHZo7oZoOGlFyMp31QcNvuLIlXQHGPXrHrl67yFyYlDqOtZlfyGQsak0x/MZetK1CrPO2IgMoclvUC8u0cjeN8s2a4vgf9gaCV/N0G6WLj9+DJ2cXz/MO4/KO7uZ/++U4Q1tCbBdnLf17tsko4sUGDgpRHhMtKIz8DU43yqjj6hSOhuvKVcee+ZY9CIitbHhlfsHXj98K/wntUQ4USG14EOimCal/hQ2aBU65m/8gCJbu6D7qYuf8M6l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+fxAk3TOBUAQobVw+tGDle8Z5It9D/jQ7JObIq6+1w=;
 b=P3DksP5g7bprh6TqXa/BLNVul3zu5jaPGYVPqRAU8REM404iKsZ0KB0W8PgYFz9j9N7Enwkz4/NHHfNZYbtcbXfgFwi9OFnPki7Kl8YfmkPet+A417eZ23pZ6Db1HiS785Pvop5RrDHMkKXW2gLS3T8cAosu9xGsgUta2cjaErONp676JSWeb5Kh2HPuhVaPxGKWHf33/N1G0lj9wxHcDeyq+D7e0NRGB3h+4+TFTWrYQ//AHe6xzai/k/gTsCyuN3jZzLIeagjgoho+qS72/QG+Hxtpqlooccr+uBq/kewwLwrzucBSvo7RTPvjeNrh+U1EsWyNzLo4bPU2W2nDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 by BN6PR11MB3969.namprd11.prod.outlook.com (2603:10b6:405:77::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 16:10:11 +0000
Received: from MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::9171:2e5d:1f1f:3789]) by MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::9171:2e5d:1f1f:3789%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:10:11 +0000
Message-ID: <d44864f9-a912-11c9-9321-be73d4e75cb5@intel.com>
Date:   Mon, 30 May 2022 18:10:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: typec: ucsi: acpi: fix a NULL vs IS_ERR() check in
 probe
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <YnjaDBXLmwouCB3M@kili> <YnzVCTHJm9iT4eRk@kroah.com>
From:   "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
In-Reply-To: <YnzVCTHJm9iT4eRk@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::23) To MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0603af9-5abd-46a1-bed1-08da4256df87
X-MS-TrafficTypeDiagnostic: BN6PR11MB3969:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3969E17431BC9189842AC301CBDD9@BN6PR11MB3969.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sN2w8IT/p53KF5nuf7RGQvpt7ZIZllUZ5iujLgwXGL7h/V97KHHUhANs745CzUhOgZYjF75Dv6dnjMpOFdIeUlsCfeCW4tectEVZxUthbixUOlRQ3wEpH6+7oX0m3HayCJhS6ruVTBPzW+4feVnew28zcEFDQOzHSZlj1jWNgwhTbglbCwIEMSljQKAp4Qc5FbOs+LntZ7O96+R6kODCkIZjxHehu0/tA49aik8N82xjaD1zDcBxbhWIS3oUglt53qRvnic7P2Z6YdQLHG8MYX+ku7CZa7IaTuixo8Hfx0thsI8XCueEfft4A57dzNNIv/HaFBO6mzkJH2tTdiuhn825sX9YkbGgGF+FO/0tMUNIelITHn37H0+EI80a79VLeNqffDaDVR57/oqYNqWlBOdcDtSVncn9c+zNStN0RTW9rLBRIV+JjOUQkwZz/mJ852o9zXOYbdU+uDoiMOl5bZGs/5ZUZtDEL8bOPZ7H7rgUN+FHYQtfHkvW0QECEI0wyXR6+ySl3LQAQi85/XOEbxwKeNU/hzSDcpAj8vFs01etlXPM+vVBbAZ/c4wiF+DZql8QvcpNbyjOnNWV+DVv8zPncN0lljZJuN6rDa4r/uoaLkmrymDgEQsD3Jcgd7I+PGr7cg8WcR5zTwWeceI8U0Bko+1CAL8SxtjvwCo7zy63dPU8ON8pKAHf57OdkGCf6fCtMuMmYf9yESYAz40cljW++aTLe9HLPoBmySHIgmzRqxFZoMYy44lLFq/fwulN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(38100700002)(186003)(8936002)(8676002)(31696002)(82960400001)(86362001)(6666004)(2906002)(5660300002)(2616005)(4744005)(6486002)(26005)(110136005)(316002)(508600001)(83380400001)(36756003)(4326008)(66556008)(66476007)(66946007)(31686004)(6506007)(36916002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJ3KzBpZmkyaks3NndkZTBZaGtOUHE0LzVJeGkzemRkWFZKcFZVVFVRYzBF?=
 =?utf-8?B?WHFvRWtLK1BKS1ZFZ0VDMUwxZTZCVHo1OWdnY0IyRnFzNWttUVJVTitHYTZn?=
 =?utf-8?B?V3gxdkFndzJ4UUVndnZHbTZqdEwyTjhpTFFjbTcrNmcwUWJFVGxzUTU3bmpw?=
 =?utf-8?B?a08zaXhuSkRtc1IyTFZxaDVaVHpZK0M0QklNbEVzZmRVU3NNMnVQVjh6eUpC?=
 =?utf-8?B?eUNaZlIxUVVMejJPUEZwb2RaT0o2dVQ0LzRyQklzUkVJRkxXYm5LZTFPM0Z5?=
 =?utf-8?B?cCtNWStsN0dEOWM1VFRpTTdjMkFNZUY2L3BTSE1qakRuQk1CYno3T2Q3aG56?=
 =?utf-8?B?MGtpd3h6TktrbVRqMmsrYm0xRnMzNlh4a3lSU2FOdW5JVGZORDNJdlZCVlRD?=
 =?utf-8?B?bUFyMGFwODFBRUlJUW56V3lyWDRPb0ZOVUo3cVkyMFlNd2YvbUlsZEJpWVhv?=
 =?utf-8?B?VWxDRUdXdGN3bFllV3JMVmVuSGhYNnBQNmFRRjdxeDU4Z2tCemM4ODUvWitE?=
 =?utf-8?B?QXp3eWFPZXhHUmRKM3ZBS25VdGw2OEF5T2xkV0RGQ2EzNjZRdmkrcFM2VkxO?=
 =?utf-8?B?Y0VwMktLR1JsSzFIYUtCTndIREdTRlpmMUcxS3NrOTBkRDkrY2JMSVNpZVhM?=
 =?utf-8?B?NDhuRGpDeUFVS3NxSU9DUndzeHg5Zy91WEtHSmZRbWtreUZ3U3o0OThaUHd2?=
 =?utf-8?B?aUNCV1kxVlB4ZlBYbElvdG1BT3BKQ2dXdkJJSGRJV3RkM1NsaHNjcjlwQ2xj?=
 =?utf-8?B?SG9MbmM2SHNyNmthdU9pMk9uc0lPdUN1eXB3ZEc0b1RJL0ozYjB2aGVydG1Z?=
 =?utf-8?B?MnZzVmpzajFrWGJreFNvTkF6TFNzZkRhTlB6S2syTm0xdWhsc1ZIN3Q1SVJR?=
 =?utf-8?B?TktYdk5uL1FDKzlRYkVWYUl4NHp2cXBwU1o0Zk1Kd1BtSExyY0N1bEpOcWlC?=
 =?utf-8?B?MjJmVUE1VVVQbkRyZ0oxSVB0eDNVelRoY21CVWFFaUFMbUJBZ2J0MlpnWFF5?=
 =?utf-8?B?TG1WYmxQUlp3bzlTOE05TGNpeTk2Q290dU5FVDRyU2JiMitaYVQ1Rk85L3JN?=
 =?utf-8?B?Ni9jYnRQVjhsTmYxVFR2TVJma043Qy83emRnUEh0VURjdDVoYXFmTnZTb3hE?=
 =?utf-8?B?Z0xYTE8yT1U1a1M4OFlSenZia3NBM3VyNVd5aFp3eXNlUDJTbWMxSW9UbjY2?=
 =?utf-8?B?TWJielFGMGxZeElucTBDQzgwb1NGN2wzeTRUcmlUN292dmt6czYzdWhtT01s?=
 =?utf-8?B?V3ptKzltNk9nVXJxR0xaUmJQMXNWRzlPTXBvZVcvQ3Zlc1djTSsydW9KaHpT?=
 =?utf-8?B?M2swWjRYM1I4d3ZhMXJ5YTcraElBQzJRUWJHdHNCbHJCME80RzdEdmdOd2ph?=
 =?utf-8?B?aVRmb2xpYkRoRjYyS091anE5VHJuQk12M3o3UGl5TUF3RHVFSUF1R21EaWZQ?=
 =?utf-8?B?cnM2akV1QlMvdkx5Q3UwaWZpbE80d2pncGxUTFdOMkROOTNBWEppUUx6WTJt?=
 =?utf-8?B?STRIUmh2ZGVLRVNHTEdmTmhTK0FhTFVSd0pNZFJsVmcvY3ExS1dFV1J6VElX?=
 =?utf-8?B?UE05RFlWT3FrSjYzd2pSSldQS0ZpenFKUFJieEcxck5teWhrTmc3RzRWMFdL?=
 =?utf-8?B?UzdwTDk2UHNVWEsvSWUxK3l6U3dFTWJxeWsza1MvZHRnSlUzK044cXFNSmNs?=
 =?utf-8?B?bmJuMWVUUTRrSVFobjI0a3ZUVjJhdFBRWjdycDE2MitBRzRyTURJdy9tOFh2?=
 =?utf-8?B?eTlaRWp4emZvZmpSeVpRSnZKSURmUFptWExvZU8vVzlTMUtBaG4xM1poMEJW?=
 =?utf-8?B?SjRuTDdXOHRhV2JVUDZ2WWlMNU5JMlpYL3dydFpzbi9oRkcvZ0hqc0MrTFFw?=
 =?utf-8?B?dk9aOUdPVnVMRlVPcnNnTlJ4bENVY2pUQytSSU9UUE9aSVF2d2s4ODNhZlVU?=
 =?utf-8?B?aTU2QXBMYWFjWGtZUmtVVVdwdW5ZQjdTQ1BnUTBqUGxXWjBnNXVvQnJ6VXZz?=
 =?utf-8?B?dFkrNmdYeWMxV1pjczhZVG44a3MydjYxbXMvaklKNXdmM1ppelZkcE5rVDRU?=
 =?utf-8?B?aU5teFVVcTlja2p4SVpqcW44WGNHRlo4L1FoR3ZyTk9VdVNUWFk5Qko3SW1s?=
 =?utf-8?B?dFlPZWlkUFV0WDdHTlluWXlxeTMzVWxHUkl3QjYzMDBsZTY2ZTdRZmZBb0Rv?=
 =?utf-8?B?cjV1ZE8xK0pBc2FLQjdGd3ZLQ3pPTjdRYmx3blZoSzRlRVdWa3Q1WTJpVjlk?=
 =?utf-8?B?WVRoSFhSdVpnWkRRU0RNbHhHUUlJOC93UzQrTTdmWitCdFdxTGh4YTA1OTRp?=
 =?utf-8?B?c2ZVZG1OTXZwdUhWYktrNU1RZkNFZ3Y0VVV3Rzg3VVZQYURNUVk5QmluUGZO?=
 =?utf-8?Q?PYIk+x8DV9EcGn4o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0603af9-5abd-46a1-bed1-08da4256df87
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:10:11.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ajqahooxpHKwfkMHMynK/ZJvZOnFGyzXvLlKNceFzdNzudpKJVbnJ1wIWiybmm7D21Dl+7Af6Xlx/8y6S1GijPH5npNEovt+o5bd1G3hV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3969
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/12/2022 11:36 AM, Greg Kroah-Hartman wrote:
> On Mon, May 09, 2022 at 12:08:28PM +0300, Dan Carpenter wrote:
>> The devm_memremap() function never returns NULL.  It returns error
>> pointers.
>>
>> Fixes: cdc3d2abf438 ("usb: typec: ucsi: acpi: Map the mailbox with memremap()")
> As this is in Rafael's tree, he needs to take it, I can't:
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied now, thanks!

Fortunately, I've not pushed the original change before applying it.


