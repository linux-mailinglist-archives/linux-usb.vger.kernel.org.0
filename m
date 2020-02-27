Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7917242E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 17:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgB0Q70 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 11:59:26 -0500
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com ([40.107.243.73]:6201
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729174AbgB0Q70 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 11:59:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECm9+u7QaviGKUv83v+ZbiGAuexxyyT5zrcS+O40S0L5f83CMOuiQPlu9vwauys6I+GYSL+HS9YxCyRMDmCrwYuehgOFLvay80EF8ohrmJs0FM6F6Kq1zhSBm1vqtgEERA65+4FVaBJ/18Nle9oPau4ZlqBR/Gensu+IhmJpJyOBPJtnEbp/XN7TnLLxn6gKou3+ckfVG2TMJHQJwiooERbiISRJHpQIVpNCdLxfk4cJFO7jN0ONYfAI/TsykaMZFe9Ch9MDJFC6Ql3hzt9KZQHacAUelRBKNxh/KsvEn3oD2O57YXTAfE7C6s11Zveq7RPNBCipKl13vfWTIkfXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tS9aA1IeuG7GQ1VdFVdYx7L+WxswTaYriWzpDw2TH8=;
 b=AePSTD7KMnSvaTYp7qpbPfRXsK18d9O6LumGVz0+LKuIOU7/5FF2vzej7ByY6A7GhwTcBXW7DvdOB/qHa+7FtweWF2VdMzgahrfKl802UxVCJx+jZZJTio3Gd8/CWBC/vTBenTlqKKB+zv8RsvoJmiprhM/4c097fw9l9gM9OmY9/+k2/0CnGGCi7UsSqi12TJ3zrspA0ShwL7ISiod8g6qv8V6ubbCRMuuvpQNfJL6aEq3kW4/uomqye7sb6xve9B3mgbRjxpjYTUMMIC6XD6BI7+BZYQ0p7Z8wt+Gsfbn/A0l4gk63+BcXALmAFRyYQeEDKDgAN2ImRIJtb0m+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tS9aA1IeuG7GQ1VdFVdYx7L+WxswTaYriWzpDw2TH8=;
 b=ZaURaKr516QGIppn/7vx8KSZ7nteDJP4HI+rWxLJ/Qt44I65hRHvPG/UmZMmXVKvE6jz8e9rIIgD8+RVun9QAlE8ZdaRedhJ87xs0H6LTNNeqtrHW8gWrqnyzaZrY1QgPO3DHHPGrsIG5KwGvuR0rqfslXorNxlli0mskLI9uEE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Thu, 27 Feb
 2020 16:59:24 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 16:59:24 +0000
Subject: Re: UCSI:CCG: AMD Platform
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
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <278ab9a6-497b-9cd5-8aa1-440fc78cb3db@amd.com>
Date:   Thu, 27 Feb 2020 22:29:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200227122308.GC10532@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::14) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (202.62.82.154) by MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 16:59:21 +0000
X-Originating-IP: [202.62.82.154]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b4347b2-e77d-4d27-9c49-08d7bba6656a
X-MS-TrafficTypeDiagnostic: SN1PR12MB2445:|SN1PR12MB2445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2445436FDC8B4BC6D90EDE17A0EB0@SN1PR12MB2445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(5660300002)(4326008)(66556008)(2906002)(66946007)(186003)(86362001)(52116002)(956004)(6666004)(2616005)(16526019)(55236004)(31686004)(31696002)(26005)(66476007)(53546011)(8676002)(6916009)(81166006)(316002)(6486002)(36756003)(8936002)(81156014)(16576012)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2445;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaM2m3jghI8OxyO5EuVa5Gwic5pi62BMp+zAWruN9+E++FJnOnIaST0BU6CnBLSZMk34xC/9Mf+Iq5MzKdPe00rywY70Vdm0HNYHGhLDF7bICD2zPvCrdleNJQCTfgOmouQAROfWBeg12gBA1w0rHUovwmlL0Aj+VB+lRSR0KMl5dVf87S92SGrFMtCNJjHjWAi3bvBg4h1IWAqY5muOJtBbbgq5hQnY9zF6HG1TNZXUdLJW8ZmZTN2zWwScxUilkEMMiM9QeMNtqw7hT87vIZ9s/+QVOO9gbQ0ssm+SnOi9Mbe4bs+kTsLySq8ucva8L5j3WRDBuChfzoHa7FBvZKmgc1udQab0vViRDky2ecIxoUM6OtznzkyrR3bliTF2acqU6KXmGTrAxz2vB5iwaHWKxg3sKZUEL3LhGVBG7kfUlVXVxfQXRyGoI1uYzS92
X-MS-Exchange-AntiSpam-MessageData: y6OXqf8Mkcrbl8vCK8BVRPx23ePrVzXK8jiCiXxTUyQgZFs/BHsfN6co7G+D5vQurgIFSyCQ4s4OdLfNA4q2XFscKWErNy/M+IgBuAuy0mAMICQjvEJGCMhucsA2QFfTWseVJ+jezWujVyo/kV7Hng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4347b2-e77d-4d27-9c49-08d7bba6656a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 16:59:24.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttmoju7MpmVi+rqMhGFIr9wRwN3dTMCHj+CJo8JJ2YKBx/ukLYJT/orzI1pEpPpB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2445
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi
On 2/27/2020 5:53 PM, Heikki Krogerus wrote:
> On Mon, Feb 24, 2020 at 02:38:12PM +0530, Shah, Nehal-bakulchandra wrote:
>> Hi
>>
>> On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
>>> Hi
>>>
>>> On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
>>>> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
>>>>>> I am using CCG based UCSI driver without any
>>>>>> modification.For I2C part i have written custom
>>>>>> driver.
>>>>>>
>>>>>> I have attached the trace out and dmesg crash log.
>>>>>>
>>>>>> Please have a look
>>>>> Thanks for the logs. Can you test the attached diff?
>>>> Actually, don't try that one. Try this one instead.
>>> Sure i will update on this on Monday.
>>>
>>>
>>> thanks
>>>
>>> Nehal
>> Patch is not solving the issue. I have attached both trace and dmesg output.
> How about if you try this (the attached patch) together with that
> previous diff?
>
> thanks,

Sure, infact i suspected that in first place and tried same logic but it was failed but now i will check with both patch combine and shall update.

Thanks

Nehal Shah

