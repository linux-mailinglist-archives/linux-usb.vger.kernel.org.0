Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5521744B1
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 04:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgB2D0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 22:26:01 -0500
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com ([40.107.237.47]:24672
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726418AbgB2D0B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Feb 2020 22:26:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdlFeIYdnI7LAesDjJhVlPLTMwclUwLVmTZaowmpKEULIaGGSjit0L6/eybbTXIfLZ5JqzaKJX8GKiLw57PsHphnHzbv81yNLqX6WWiVOeUCN71lu6lDPa6oI5AVkrDk63tJZDhil8Bw2KynOM4R9H8wr30PRsJ84zbE+k0ujuWaBpKhRAJQk/4Bo0gm71YoOQtuce1YjrmW1b0QvDW5MWTtEXSYhCYZLtvur+kscZLyNtdnfvxLPB1+P8ZJ02C4IXu4Qtmkh59oazeJFN6k+fkmMfKNuwusEQMUGcmjG2qK/Sn76TbklZI+208OLHI/ZlLwJtn1mvD+CNM8GBGdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSDJmvE/kT1LBoJvY9XMfuETCk9C4P7v5ztpEen97vA=;
 b=l5QG0oiVsYdAm39UFw48CaReXstxczpknkY9SKP2nJw81dtmG9ucbZK1NaL81tWOpHxNBRkJnrzvmEWuiYIAD1+V7Kjm0odiv79wf1Qo+Sf0ArrHEdLmFjDDHbS2TYMNasQmOGASJpEg+gL901RIWfDnyf1qxK6p5czPOXIEtpy/6LnQlakOpUFbIihU2M/5hsBx3+62vJEQJONpLwAG6qgRsdDi4Ps61VoR8AlMLUeYmIcYQCeYdwEwr4A1dp2ApzGZ5Y9k6FGhCNYnpu6ne28AA10ggtUp4ZWu988Iylf0OkQexMDtdyyg5o+Zfl2bhxm/XahclCuSE/7pLmFV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSDJmvE/kT1LBoJvY9XMfuETCk9C4P7v5ztpEen97vA=;
 b=lJSQQrCF5HFlKOhQ7LTeH9kwOa0153rTjvmAZE5hIeCX5oChVHpBdvef3YhGpiVEfwzimvRskb0QQk4UpujIDVrgZaPtJAg6izgPaCIo3ETsqt6Ad4kKsMaN3a69hhT/e/T5G0xXcIydgOhdYlG+PW1HnqxOL6GvyURZoQ8QZP0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SN1PR12MB2383.namprd12.prod.outlook.com (2603:10b6:802:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Sat, 29 Feb
 2020 03:25:58 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2772.018; Sat, 29 Feb 2020
 03:25:58 +0000
Subject: Re: UCSI:CCG: AMD Platform
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
 <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
 <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
 <20200227122308.GC10532@kuha.fi.intel.com>
 <278ab9a6-497b-9cd5-8aa1-440fc78cb3db@amd.com>
Message-ID: <9fcf4549-e699-1a35-d87a-6bacf85fba29@amd.com>
Date:   Sat, 29 Feb 2020 08:55:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <278ab9a6-497b-9cd5-8aa1-440fc78cb3db@amd.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MAXPR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::32) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (202.62.82.154) by MAXPR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Sat, 29 Feb 2020 03:25:56 +0000
X-Originating-IP: [202.62.82.154]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e5d8033-4539-4281-c44d-08d7bcc71801
X-MS-TrafficTypeDiagnostic: SN1PR12MB2383:|SN1PR12MB2383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23831D6AAA4C19B655F7C8E4A0E90@SN1PR12MB2383.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03283976A6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(189003)(199004)(2616005)(6916009)(956004)(6666004)(66476007)(2906002)(31686004)(66946007)(66556008)(52116002)(53546011)(5660300002)(4326008)(26005)(81166006)(6486002)(86362001)(16576012)(36756003)(478600001)(186003)(31696002)(16526019)(316002)(55236004)(8676002)(8936002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2383;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwydsihoseA+CS9nEImFv8EcE6x0RNEGF5vlRb2Z/Iy2LURdiNJuW7Dmqv47mDA12WKwnbrDoKDSNQTyrI4TH3ByDzEdl931g+eqyPiJrKGjlB+3oTZMjrJECJaMVcbhWf7kBID9hCFkkHLZSRiAjGJe8cZLHM8PR9CsLIP7CUTOeZ4cid6VAgLZjZlqE2p56XISUyGzsdWIEYCO5Wgq95gTltOVSpJwGapXtSUtcPcYtmK7KcdxXaCdnNfKKIYF2aSmbltOMkPeqnQybR7cSZ8OQ2wgnQg8Iz/uBaCxLSIrJVBfxL1hdpNlDU5CppmqusFmOmXI5hhdYG05PB8BB2clgD16SUqIqFIjTWKO40v2rg2U12lo9WdUjvteBvMK+NRrOGCppBZFFwDxe1yEaDIld6+rNTPv3QmVDy4/IRcG9moN6jdpcdz75Id3zwV0
X-MS-Exchange-AntiSpam-MessageData: rhSm3Sb+BR6KaxRc9VORzAnAxaXvtl6TmTEHODIE+FMsEVMOIeQOkrPBrXVYCP4ps4JognPphVRjK5kJFBaN4PpSiA3BPtD99xu/wKHDQ8yPcBx0aVOI0TQdJd7KwepWheYvetKvDKsP2K/WL8hVYQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5d8033-4539-4281-c44d-08d7bcc71801
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2020 03:25:58.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AyEioxRuVxa/xgZXVGeLL4aRrqTj+h0F3FO2oQ5PC01DYSAgbLhnN2QXCjFAoZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2383
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi
On 2/27/2020 10:29 PM, Shah, Nehal-bakulchandra wrote:
> Hi
> On 2/27/2020 5:53 PM, Heikki Krogerus wrote:
>> On Mon, Feb 24, 2020 at 02:38:12PM +0530, Shah, Nehal-bakulchandra wrote:
>>> Hi
>>>
>>> On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
>>>> Hi
>>>>
>>>> On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
>>>>> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
>>>>>>> I am using CCG based UCSI driver without any
>>>>>>> modification.For I2C part i have written custom
>>>>>>> driver.
>>>>>>>
>>>>>>> I have attached the trace out and dmesg crash log.
>>>>>>>
>>>>>>> Please have a look
>>>>>> Thanks for the logs. Can you test the attached diff?
>>>>> Actually, don't try that one. Try this one instead.
>>>> Sure i will update on this on Monday.
>>>>
>>>>
>>>> thanks
>>>>
>>>> Nehal
>>> Patch is not solving the issue. I have attached both trace and dmesg output.
>> How about if you try this (the attached patch) together with that
>> previous diff?
>>
>> thanks,
> Sure, infact i suspected that in first place and tried same logic but it was failed but now i will check with both patch combine and shall update.
>
> Thanks
>
> Nehal Shah

This is still crashing .

Thanks

Nehal Shah



