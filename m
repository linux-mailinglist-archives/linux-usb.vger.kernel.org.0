Return-Path: <linux-usb+bounces-2861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB57EAD36
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 10:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F6828111E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A76C168C8;
	Tue, 14 Nov 2023 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="yBd77jFU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DC168C3
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 09:44:44 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2077.outbound.protection.outlook.com [40.107.14.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CCB1A3
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 01:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yq7HCbIb79fiE5PgCh1j+jseYriQ9X6a6QMe+qK1w9dmlaa0OhFESDF60GaciF4aHTfs/sGHNsGPlSL+Wgik/E2TYnBVw0Pm4SOD1DSau+PRcaziLgt/PnhCaR0TGFVnAnz6/FqqCDKQ8XnvnmrZgfqtyerGju/t8MS6OLPy5hhShW90q434f4NN8w4Yhe6YooT308hZBe+jMC7oEoO7eDqD1XMIndBt1SNPZPZY5tf26t/lk6/HvQ9eOzxblkpUgipcUT73k802OHS5s+cIV/2qOOTXQVXX8JhlPfcf+dfrKFpyqcv7k50QLFFJmLH2OJnQU5niWNYhy5qw1sCQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XKTFhApfJI++eQOOWHRzMOCYVmSLhvAN5hJ7kngzh0=;
 b=j/+IVQlkhlFxVTotx4ffOBk7qWbygssBIWJaGdi/fSURJ2VZM2yBAH+sPrjhti/zW5Zhk5c5TZyOrrTLQmWQ7Pl17eM9GtugC5DswnUZYZDqxhMLWg70q69OCM1YDoCrbcRQnFRKSBghpLYSL1lck2xylolcpSIstQyZfqoXPfB45TjyH7oW3R2NyZVlMv7iqYN9mlpdn3phQ5cbwce+O9Raleqv05p9ZXuHX51uuyIw6zhcgslvLlrAOKDRRQyOvIlXswvlStn472HOm7MRugiFJKwf1eclfFL9EweVF24JyqJatyoK/dJrRR6blJn8PUXmFYXW+aKIIdk09gke0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XKTFhApfJI++eQOOWHRzMOCYVmSLhvAN5hJ7kngzh0=;
 b=yBd77jFUFZ/DNCdvmQom+zHMMy2/qvpCi9p3SWG1WX4yeD/+pOlUDlnG8/xOZw9hKQHM+T0oQAeLNw8uX1kcXSWJRcA9mhMwWHElTg5zMe1kQGUdUzizdHymqB+YPzujhfm1qHj4MLyaZw71f1g8z4NbyL+SUlI9SOnaoMub+YbCMSSTYVXOxLWQ5Xo9C6CBrlqHZ/Cds5mOt2OxhPm/8kGTAX/A7k3YXXmDVVVyY3NjVd8wBeqt7TUi+E2qQbSk/GXPozujC/sUSfIyifb1rxsa/p67i8GUBzIsdWH1XJfuoD78QFDaoaHHo4GtKzIprrFr5KkysLcr6y7F8czroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by VI1PR04MB6815.eurprd04.prod.outlook.com (2603:10a6:803:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 09:44:38 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:44:38 +0000
Message-ID: <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>
Date: Tue, 14 Nov 2023 10:44:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] initialize struct otg_fsm earlier
To: Peter Chen <peter.chen@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20231113173125.23696-1-oneukum@suse.com>
 <20231114072757.GB64573@nchen-desktop>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231114072757.GB64573@nchen-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|VI1PR04MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: a281b84e-98d1-41b0-faae-08dbe4f6512e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AhbMPebnq600gcZw55zTyDm0uMjyGWyoZrcNrGymJ5GThMpgpPSHcU2mLyg3LkNsNCDG8qrPKepJI7hogRIDGWaVkKtLwRwowbdmrvRQOSNTMazpC3hR8W+CK3njvqQOBxccXPdds0NOi2+8RslSBug22pgt8hE6ukE+Xp3TJziX63aMF1OI7lU7UEJSM5IRYCFEYqZwsNoEMI3LXYlmtjwhMf0hbig3SlsdWfURdyFrjX6287ITCZ2nJyKvpaLG5AftHuOmfc01xiswzolK+ZU9XLwOUm5PZqrDEzTEc4mlrUO4phZRBFF5x+q40JIYa42F8FIL9wtAti0toPTzClwUUrERxPxf2xg0fseJ2UvMxLi4tCNGGpRgU5vLK36Amdh6u8Zg6KVODuB8jY0gduyxpGrWB+g4MvXEZ/6J7l5w/zuBabgHOLf0gwe/gUefqAmErGCI97YSixCKDX8uBX3xSEu9xJFBKtl5todf62Z39ltF5WhXzI6Zb/O07vxwLB8F/rTinMUOm008SQ/TldYikgCluVMZxtFTd5sTBWpquD2zp9uEqy40Frc+U8Ek6KU6bpJgMtXM+ZfbJOtusG9Ud9GIG7sNH2tgnvm8W8u7XdmgB6aFjou6IrRb4lpdP+DE8a5ZD24rVlz+Cg+Zsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6486002)(478600001)(41300700001)(2616005)(53546011)(6506007)(8676002)(6512007)(4326008)(8936002)(4744005)(86362001)(5660300002)(31696002)(110136005)(316002)(66556008)(66476007)(66946007)(2906002)(31686004)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE9iOTBUVTdKdmYwbS8wTElMOFZEY3YwSTZTYnpUeU44U1dSR3RFckNTT0Ey?=
 =?utf-8?B?bkVmODVCcmNWVWV0NjhWS3dRSVMxOE5mdDVoVHNWdzMrTDhMMUFPSEFoN2pv?=
 =?utf-8?B?bVJlTWhMKzc3am5oWEJlemZSUmptb0xUdDYwNjNCZ0Nub1lPK0pXSmJQK1ZB?=
 =?utf-8?B?RVFjejY3N0VXOWxpa2tCdmxhVkpGL3IxYkxMNHF1RGxWc1g1ZWRRRkdGejBv?=
 =?utf-8?B?VzNldXFDSHRkelEzeWtkWjJOY3QrelJGZ3NMck5DdUZpakh5alA4bStick9X?=
 =?utf-8?B?aWxyVndXb3FscDJhZEZvSytDcHlqN1FZMnpZcXhrZmpzVm9uSWdEakRJWGdQ?=
 =?utf-8?B?UHZ4TXVhQ1BLRDRIMGovT3k2QTdoeDRUdysxNkJvZmtxNTFKUUdncTZUU09F?=
 =?utf-8?B?RE1OSmpKTkVwdlNRNW1Hc0FTamRUdGVrQkVrQVMzZ204T3cyeURnb3k0M1c2?=
 =?utf-8?B?UTVjMEYwcEVmT2VGUHNpWDBuZXdQT2ZZK2NWSVRidzdBS0w5WVl1cE0rMUVJ?=
 =?utf-8?B?ak5PRFZyc2lISjRtb2Y0V29OUTNXc3RiRVhoOTMzbnorc1NlenpEeDVXWnlQ?=
 =?utf-8?B?N25QQlNnTC9uT2pCRVFTcnpuRFB1VHNJTW5RbXNjSUlKUTdQa2FPa0xNWE5h?=
 =?utf-8?B?bUhHOS9wejdDUjZOcmIrU1k1NHROZlYzSlFlQjJWUVpnWjBMMFFqdVNQNnkz?=
 =?utf-8?B?Z0hidlBuMHdmVFhra2l1R2VJZnJ0VnpEb1hSWHJxdXovT1hzS2dTRWJBd3N5?=
 =?utf-8?B?Rms0VTFlWDZBc0xQN0xOVVhKMVl2YXBKclhtVCs5TkFjUW4vWmh1MnpUN0pH?=
 =?utf-8?B?aWRnS0IyWkZjWURiVWJOc0VkRnpDNkZ3a3FJNXZxd1g2RnV2c2VEVmo4c1Fm?=
 =?utf-8?B?VHprWDBKVThtazd1TXZkKzlmRFc1amxGQWlLb0dEOHFtbGJhRWt5Yjl3MHZ3?=
 =?utf-8?B?aWFzN3VMVVJsVWVjSWtqOXBCNjJmdi96czZiTmJDZW1vb3ZWT0poTllRQ3Nx?=
 =?utf-8?B?RzFsZHE2UU9LQVhOMnpJSHhUdmlHb0kwOVUrNkJ0SzQwd3YvMW5tdEY4UzlK?=
 =?utf-8?B?bHdJd2JhcGJkTTNRWlN4MHlKZTVtT1VQMDI2eGRaQ0xOVWZNMHF6dStIWU1U?=
 =?utf-8?B?RTFFYzlkeGE2NnRQVnNlY3JGT2RmQXhrNXRhdzFOWStqb2Y4N2dNcWxTV0tz?=
 =?utf-8?B?TytLMWtFTG8rMEpvb1RnTzZOUWV3VjVMcWY3MXVoaWQ0NEpINHRXRzNmN3FT?=
 =?utf-8?B?OEJlM3I5U1E2N1ZPMmJGc2Rnc3g0ZVJRbnEyTzg3aFVZNlVodDFqbkxlUjJE?=
 =?utf-8?B?ZTZ6cHhva2J2YUZTdXZUYXZwdERDRm94S1Iyd05VRFRrdUVEOUtvVFZKcVd4?=
 =?utf-8?B?cUw5K2dORUVHQ05nRHdEZTZqV3BlQ2tjQ0JIRkJEaTN3ZUVUcktVQ043bFFZ?=
 =?utf-8?B?NGJSdHZQZmJYSzZscDR2REVjU0g4NHdlS3g4ZTljTStQVi8wVXB3UGd0ZEo2?=
 =?utf-8?B?QjArSTNyZmZxbUhDQWpISVIzRm1oUVA0SjZBODhRZWhBUTBTcW5yaXdOdndr?=
 =?utf-8?B?WGV5RWZIYXJOM0xnTFBtVGRRcVBCUFZlUDFTMUZOcVNER1FDU096MWZrUGlR?=
 =?utf-8?B?MTd6dXg2RjFnZWNKaDV1OVZoUlcxd00vRlVtTmlDT1NZSWMvK2dzenNaTG5G?=
 =?utf-8?B?L3IwWWdnUnhTcmhrNzhWTHd0NnFLdUczL0cxK042NTRjV0Vncmd1c1BUWHFF?=
 =?utf-8?B?TXlKUjk5Ky9FTjZrQjVFR0RlekpSSG5vNisvYXFzeW5iTFRjV2RzSW1tT1E3?=
 =?utf-8?B?T2toSEFjRjFXblg0b2M3dnhOWU83ZmhES2RnTWlJK1VZanhkNGx5RUNieVJi?=
 =?utf-8?B?S2VIeDluWCtpK3R0YWZSTnBRcUpBdkdpcmt4QmFmcWpjVTAxVFNpRTA2Qktt?=
 =?utf-8?B?Vm1VVjJQZlZ0SjdDQ05ESFJvRUJ4RjVMaVJ0ZWVXWGJvbE1kQnV6NTBIbEt6?=
 =?utf-8?B?N1B1UnY4azZoNWFYcEFxVk03cjVHRXRTUFZjV2JXYXk2TDZMRWMwQnBRcWUx?=
 =?utf-8?B?WGIvL1piaWlZMDZVQWNlb0p2RFp6Rjg4SmQvU2daYWRCK2NxcjZnT05COENJ?=
 =?utf-8?B?NFBveEVGNkpJaWl5YURWajZwM1FYT3ViK0MyQmliODU0S01lTndCSDVNMzU4?=
 =?utf-8?Q?5Qm1m0BXjFTNdtN3yIG914ujCsxsKDVsQ10Ngh3Zl4oH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a281b84e-98d1-41b0-faae-08dbe4f6512e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:44:38.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkIzQD63VK73Qz38Lf3hteYTKcLftKHd5+vfKI0NbQ+eRrn6WEPfIV6v8i3uRJs86qJN09aM7KBOBG0TpJzhBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6815

Hi,

On 14.11.23 08:27, Peter Chen wrote:
> On 23-11-13 18:31:20, Oliver Neukum wrote:
>> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
>> corruption") in effect hid an issue with intialization.
> 
> Typo, hit an issue with initialization.

No, it hides an issue.

>> In effect it replaces the racy continous reinitialization
>> of fsm->hnp_polling_work with a delayed one-time
>> initialization.
>>
>> This just makes no sense. As a single initialization
>> is sufficient, the clean solution is just to do it once
>> and do it early enough.
> 
> The phy-fsl-usb is not the only user, there are other users, eg,
> chipidea.

Interesting.
Are you saying that somebody calls otg_start_hnp_polling() without
a prior call to usb_otg_start()?
If so, how is struct otg_fsm initialized?
Currently struct otg_fsm is partially initialized and that just
makes no sense.

	Regards
		Oliver

