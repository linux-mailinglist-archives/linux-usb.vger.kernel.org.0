Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26617157298
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 11:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgBJKKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 05:10:16 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com ([40.107.236.48]:42414
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727369AbgBJKKQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 05:10:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYNuHK8xZHJnaHzo/kAjoBhzFmY3ZFfa3IA4ddMgdbtCbNzhY48lufmvdXJaqLymUcdH6il7vHubM8DOCXx4msjZMw6SdhgY5Mg4YIRxOscEuQCtyAu7/ItuRa1lIj48JHEHVMs/OAkUfQ4WcBylZNVQD9+Ut+auZA8+hR1CO11sqoz2imzCW+dKGCHK6BlF0aKoMszkHelllkdg5WZsMfc7XNLkrB3kqaXoyNhTz5mURbjzBZkBjZmKeNLIurP36WSQl4ky4LzDcM9wrSpWZvx5wWm9YuLiRDbwl+6AyoojDEuoP1YG3hWPHWKjo7WpLlmNq4nyIpEweAeXgg5rUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmcqe4ZN6r7BZoy18VX/+TAVBT9cTUH8n2k6WT9wUWQ=;
 b=hlO6vgAx32WIvu+cZU41hMS1CU2uOkRVgt8vO0/TBPl0uXedBz72d3iGN7wc/lI4nEy1DuBnJVSaE5NIHY1cteXXoJdBRGyAL2oEILcCPZ0rtOBsDiT25ePAEIwAXMj+6J/EEdGuoIAv0ZMlUiED0YFImQu5Igyb1E9Ix/RbC21q1dqh4ylFws6nzold4kmWvVR7rBna9t1GHCHNk7yRlAlqZHiKbAPWrOpcqAeuZEs0FuTgrgrJNWqC3VTyAQMEdtRPcP7C1NUA3r9LlihPxdE+Y5Hl48OXo9E5dHkZLMEJecLLfSmnBxNyGTO+iEWEZTGIjHoDtXawVR4oH4l5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmcqe4ZN6r7BZoy18VX/+TAVBT9cTUH8n2k6WT9wUWQ=;
 b=p4wbzMoykFBRfGVbRWP0R8rdmdsymdsRYAMPMfXkwHiOK6cwLe1zqu7iQEHHLnxpHMioUTf0R0NxXYbbVuYzG4U4B89g2951/mg9XG5oe82+l7Lk5cXmgQo4ONUFAKB5PPOi8FLHBbvMsLuwRCgYCyPqpj3whQ6V5HQGXca9AUw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (52.132.194.142) by
 SN1PR12MB2558.namprd12.prod.outlook.com (52.132.197.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 10:10:09 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 10:10:09 +0000
Subject: Re: UCSI:CCG: AMD Platform
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
From:   "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Message-ID: <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
Date:   Mon, 10 Feb 2020 15:39:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200203133231.GB29050@kuha.fi.intel.com>
Content-Type: multipart/mixed;
 boundary="------------18C4DBE28A0BA36D1F14425A"
Content-Language: en-US
X-ClientProxiedBy: MAXPR0101CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::26) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
Received: from [10.136.133.159] (165.204.157.251) by MAXPR0101CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Mon, 10 Feb 2020 10:10:07 +0000
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 774fecb5-ba26-49ca-e865-08d7ae11689e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2558:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2558C9887B73A2FC45CC1536A0190@SN1PR12MB2558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(189003)(199004)(53546011)(186003)(26005)(6916009)(31696002)(45080400002)(478600001)(2906002)(966005)(52116002)(16526019)(33964004)(235185007)(36756003)(2616005)(956004)(5660300002)(316002)(66556008)(66576008)(66946007)(66476007)(16576012)(4326008)(31686004)(81166006)(8936002)(6486002)(6666004)(21480400003)(8676002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2558;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfEWS+dkKkjii0tWSd97ueE2Ve1ASQVlTEKHjG4JJcYcKrMbfsd9GB6oehTzNHgc2KNuzIWcMz//TYXX0fbDd9huyjfGZLr/R6PNgt8v68zywO1jcRNE2gClwPayRC98JXrj278zUl/XECoegIqY2gP8oBsF2j6JdhPySx0bBi1oxC18OrC1Zk6729xF40APr79Gf+Yz87uk2yxcZ2v3fi4WFq8B3Sn5uLd7Fd9a69Im3hMsw/sl9eL6IMWSG2kxv5QDbfYRrtJcQhDSAnhjoLVH8tAOnqKK3bAkjH7jtZQgzN3UduogfDVkwZhhptR3r9rANx9e+yeWa9FC99NcrDvnIUYRz/Hl0yZPx4pQPTqXKAJpNqG8OPdO8SB5HlpaxesrtRZws4HpOOskrT5IyiHPb2AdlSkMMjRxhGBu4ZG4t9btjWhINj6xuhsBQLLmfDjthUpu8//ugUIbMLRHzRMrP0DUVCwTYXej8SLrxz1tomMmp0Iootay2qvvh8vYtTNeH/k1mEjIwPIxD8pVog==
X-MS-Exchange-AntiSpam-MessageData: 9XTa7lDiwmn4EhDvGNAQOMsupqq3+zLNEImXHG0mYgpJxFArRVq5HLw040nMBtc01DCGoIJdKR1ubbZlmgQmfaoyjRCvcgENnpYG3yXe6dsSIh2oWWuElLgkJsMte/oE9WO7UbRhHtbxTK1Mc9MLkA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774fecb5-ba26-49ca-e865-08d7ae11689e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 10:10:09.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRWel8DLVMd4F/ZxWqqYPEraVb+IkrO3TeV6S7JqGA4f36daimICqX9RKs6fuLKw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2558
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------18C4DBE28A0BA36D1F14425A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

Sorry for the delayed response. I was on vacation.
On 2/3/2020 7:02 PM, Heikki Krogerus wrote:
> On Mon, Feb 03, 2020 at 03:28:11PM +0200, Heikki Krogerus wrote:
>> Hi,
>>
>> On Mon, Feb 03, 2020 at 10:52:52AM +0530, Shah, Nehal-bakulchandra wrote:
>>> Currently i am working on enabling UCSI support
>>> for CCGx based controller on AMD GPU Cards.
>>>
>>> Now i am observing the issue reported here when
>>> i unplug the cable.
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1762031&amp;data=02%7C01%7CNehal-bakulchandra.Shah%40amd.com%7Ceb1ac5e877db4fa9d75f08d7a8ad87a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637163335569266081&amp;sdata=KemJKkVhpqDo%2FSbHhVaMz7jrcploEALJYg%2BRWvhJ7bM%3D&amp;reserved=0
>>>
>>> Also would like to know is there any way we can
>>> get user level notifications for UCSI?
>>
>> If you want to see the actual UCSI notification in user space, then
>> that is not possible, but the driver does produce trace output, and I
>> would actually like to see what we got there. You need debugfs to be
>> mounted. Then try the following:
>>
>>         # Unload all UCSI modules
>>         modprobe -r ucsi_acpi
>>
>>         # At this point you should plug-in the problematic device
>>
>>         # Reload the UCSI core module
>>         modprobe typec_ucsi
>>
>>         # Enable UCSI tracing
>>         echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
>>
>>         # Now reload the ACPI glue driver
>>         modprobe ucsi_acpi
>>
>>         # Unplug the problematic device so that you see the error
>>
>>         # Finally dump the trace output
>>         cat /sys/kernel/debug/tracing/trace
>>
>> So if that works, please send the trace output to me.
> 
> Actually, first things first. Please share your dmesg output. Are you
> using ucsi_acpi or ucsi_ccg glue driver?
> 
> thanks,
> 

I am using CCG based UCSI driver without any
modification.For I2C part i have written custom
driver.

I have attached the trace out and dmesg crash log.

Please have a look


Thanks
Nehal Shah



--------------18C4DBE28A0BA36D1F14425A
Content-Type: text/plain; charset=UTF-8;
 name="dmesg.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg.txt"

CiAgICAgICAgICAgICAgICAKWyAxMDI0LjI1MTI4OF0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDgwClsgMTAyNC4yNTEyOTBdICNQ
Rjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbIDEwMjQuMjUxMjkxXSAj
UEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAxMDI0LjI1MTI5Ml0g
UEdEIDAgUDREIDAgClsgMTAyNC4yNTEyOTZdIE9vcHM6IDAwMDAgWyMxXSBTTVAgTk9QVEkKWyAx
MDI0LjI1MTI5OV0gQ1BVOiA2IFBJRDogMjgyIENvbW06IGt3b3JrZXIvNjoyIFRhaW50ZWQ6IEcg
ICAgICAgICAgIE8gICAgICA1LjUuMC1yYzcrICMxNQpbIDEwMjQuMjUxMzAwXSBIYXJkd2FyZSBu
YW1lOiBBTUQgTXlydGxlL015cnRsZS1SViwgQklPUyBXTVgwMTA4TiAwMS8wNi8yMDIwClsgMTAy
NC4yNTEzMDZdIFdvcmtxdWV1ZTogZXZlbnRzIHVjc2lfaGFuZGxlX2Nvbm5lY3Rvcl9jaGFuZ2Ug
W3R5cGVjX3Vjc2ldClsgMTAyNC4yNTEzMTFdIFJJUDogMDAxMDp1Y3NpX2Rpc3BsYXlwb3J0X3Jl
bW92ZV9wYXJ0bmVyKzB4Yi8weDMwIFt0eXBlY191Y3NpXQpbIDEwMjQuMjUxMzE0XSBDb2RlOiAw
MCBjNiA0MyAzOCAwMCBjNyA0MyAyOCAwMCAwMCAwMCAwMCA0OCA4MyBjNyAxMCBlOCBlYSBhNiAw
ZCBmMyA1YiA1ZCBjMyAwZiAxZiA4MCAwMCAwMCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA0OCA4NSBm
ZiA3NCAxZSA1NSA8NDg+IDhiIDQ3IDc4IDQ4IDg5IGU1IDQ4IDg1IGMwIDBmIDg0IDUwIDAzIDAw
IDAwIDQ4IGM3IDAwIDAwIDAwIDAwClsgMTAyNC4yNTEzMTZdIFJTUDogMDAxODpmZmZmYmVjMDQw
NjE3ZGMwIEVGTEFHUzogMDAwMTAyMDIKWyAxMDI0LjI1MTMxOF0gUkFYOiAwMDAwMDAwMDAwMDAw
MDA4IFJCWDogZmZmZmEwYjVkZDE2YTk3MCBSQ1g6IDAwMDAwMDAwMDAwMDc2N2YKWyAxMDI0LjI1
MTMyMF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAwMSBSREk6IDAw
MDAwMDAwMDAwMDAwMDgKWyAxMDI0LjI1MTMyMV0gUkJQOiBmZmZmYmVjMDQwNjE3ZGYwIFIwODog
MDAwMDAwMDAwMDAwMDAwMCBSMDk6IGZmZmZiZWMwNDA2MTdjNzgKWyAxMDI0LjI1MTMyMl0gUjEw
OiBmZmZmYTBiNTk3NzdlODE4IFIxMTogZmZmZmEwYjVmODcyY2M3OCBSMTI6IDAwMDAwMDAwMDAw
MDAwMDAKWyAxMDI0LjI1MTMyM10gUjEzOiBmZmZmYTBiNWRkMTZhOTcwIFIxNDogMDAwMDAwMDAw
MDAwMDAwMSBSMTU6IGZmZmZhMGI1ZGQxNmE4MDAKWyAxMDI0LjI1MTMyNV0gRlM6ICAwMDAwMDAw
MDAwMDAwMDAwKDAwMDApIEdTOmZmZmZhMGI1Zjg3ODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAw
MDAwMDAwMApbIDEwMjQuMjUxMzI2XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAw
MDAwMDAwMDgwMDUwMDMzClsgMTAyNC4yNTEzMjddIENSMjogMDAwMDAwMDAwMDAwMDA4MCBDUjM6
IDAwMDAwMDAxOWUxMGUwMDAgQ1I0OiAwMDAwMDAwMDAwMzQwNmUwClsgMTAyNC4yNTEzMjldIENh
bGwgVHJhY2U6ClsgMTAyNC4yNTEzMzRdICA/IHVjc2lfdW5yZWdpc3Rlcl9hbHRtb2RlcysweDdm
LzB4YTAgW3R5cGVjX3Vjc2ldClsgMTAyNC4yNTEzMzddICB1Y3NpX3VucmVnaXN0ZXJfcGFydG5l
ci5wYXJ0LjArMHgxNy8weDMwIFt0eXBlY191Y3NpXQpbIDEwMjQuMjUxMzQxXSAgdWNzaV9oYW5k
bGVfY29ubmVjdG9yX2NoYW5nZSsweDIyMC8weDMyMCBbdHlwZWNfdWNzaV0KWyAxMDI0LjI1MTM0
NV0gID8gX19zY2hlZHVsZSsweDJlMC8weDc2MApbIDEwMjQuMjUxMzQ5XSAgcHJvY2Vzc19vbmVf
d29yaysweDFlYy8weDNhMApbIDEwMjQuMjUxMzUyXSAgd29ya2VyX3RocmVhZCsweDRkLzB4NDAw
ClsgMTAyNC4yNTEzNTRdICBrdGhyZWFkKzB4MTA0LzB4MTQwClsgMTAyNC4yNTEzNTddICA/IHBy
b2Nlc3Nfb25lX3dvcmsrMHgzYTAvMHgzYTAKWyAxMDI0LjI1MTM2MF0gID8ga3RocmVhZF9wYXJr
KzB4OTAvMHg5MApbIDEwMjQuMjUxMzYyXSAgcmV0X2Zyb21fZm9yaysweDIyLzB4NDAKWyAxMDI0
LjI1MTM2NF0gTW9kdWxlcyBsaW5rZWQgaW46IHR5cGVjX2Rpc3BsYXlwb3J0IHVjc2lfY2NnIHVj
c2lfcGNpX2FtZChPKSB0eXBlY191Y3NpIHR5cGVjIG5sc19pc284ODU5XzEgYW1kZ3B1IGVkYWNf
bWNlX2FtZCBrdm1fYW1kIGNjcCBrdm0gc25kX2hkYV9jb2RlY19yZWFsdGVrIGlycWJ5cGFzcyBz
bmRfc2VxX21pZGkgc25kX2hkYV9jb2RlY19nZW5lcmljIHNuZF9zZXFfbWlkaV9ldmVudCBsZWR0
cmlnX2F1ZGlvIHNuZF9yYXdtaWRpIHNuZF9oZGFfY29kZWNfaGRtaSBjcmN0MTBkaWZfcGNsbXVs
IGNyYzMyX3BjbG11bCBzbmRfaGRhX2ludGVsIGFtZF9pb21tdV92MiBzbmRfaW50ZWxfZHNwY2Zn
IGdwdV9zY2hlZCBzbmRfaGRhX2NvZGVjIHNuZF9zZXEgZ2hhc2hfY2xtdWxuaV9pbnRlbCB0dG0g
c25kX2hkYV9jb3JlIGFlc25pX2ludGVsIGNyeXB0b19zaW1kIGRybV9rbXNfaGVscGVyIHNuZF9o
d2RlcCBjcnlwdGQgZ2x1ZV9oZWxwZXIgc25kX3BjbSBzbmRfc2VxX2RldmljZSBkcm0gazEwdGVt
cCB3bWlfYm1vZiBzbmRfcGNpX2FjcDN4IHNuZF90aW1lciBpbnB1dF9sZWRzIGkyY19hbGdvX2Jp
dCBzbmQgZmJfc3lzX2ZvcHMgc3lzY29weWFyZWEgc3lzZmlsbHJlY3Qgc291bmRjb3JlIHN5c2lt
Z2JsdCBtYWNfaGlkIHNjaF9mcV9jb2RlbCBwYXJwb3J0X3BjIHBwZGV2IGxwIHBhcnBvcnQgaXBf
dGFibGVzIHhfdGFibGVzIGF1dG9mczQgaGlkX2dlbmVyaWMgdXNiaGlkIGhpZCBudm1lIGkyY19w
aWl4NCBudm1lX2NvcmUgc2RoY2lfcGNpIGNxaGNpIHRnMyBzZGhjaSBhaGNpIGxpYmFoY2kgd21p
IHZpZGVvIGdwaW9fYW1kcHQgZ3Bpb19nZW5lcmljClsgMTAyNC4yNTEzOThdIENSMjogMDAwMDAw
MDAwMDAwMDA4MApbIDEwMjQuMjUxNDAxXSAtLS1bIGVuZCB0cmFjZSBiNDc0ZjYwMmZlMjllNmI4
IF0tLS0KWyAxMDI0LjI1MTQwNF0gUklQOiAwMDEwOnVjc2lfZGlzcGxheXBvcnRfcmVtb3ZlX3Bh
cnRuZXIrMHhiLzB4MzAgW3R5cGVjX3Vjc2ldClsgMTAyNC4yNTE0MDZdIENvZGU6IDAwIGM2IDQz
IDM4IDAwIGM3IDQzIDI4IDAwIDAwIDAwIDAwIDQ4IDgzIGM3IDEwIGU4IGVhIGE2IDBkIGYzIDVi
IDVkIGMzIDBmIDFmIDgwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDQ4IDg1IGZmIDc0IDFl
IDU1IDw0OD4gOGIgNDcgNzggNDggODkgZTUgNDggODUgYzAgMGYgODQgNTAgMDMgMDAgMDAgNDgg
YzcgMDAgMDAgMDAgMDAKWyAxMDI0LjI1MTQwN10gUlNQOiAwMDE4OmZmZmZiZWMwNDA2MTdkYzAg
RUZMQUdTOiAwMDAxMDIwMgpbIDEwMjQuMjUxNDA5XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDggUkJY
OiBmZmZmYTBiNWRkMTZhOTcwIFJDWDogMDAwMDAwMDAwMDAwNzY3ZgpbIDEwMjQuMjUxNDEwXSBS
RFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAxIFJESTogMDAwMDAwMDAw
MDAwMDAwOApbIDEwMjQuMjUxNDExXSBSQlA6IGZmZmZiZWMwNDA2MTdkZjAgUjA4OiAwMDAwMDAw
MDAwMDAwMDAwIFIwOTogZmZmZmJlYzA0MDYxN2M3OApbIDEwMjQuMjUxNDEyXSBSMTA6IGZmZmZh
MGI1OTc3N2U4MTggUjExOiBmZmZmYTBiNWY4NzJjYzc4IFIxMjogMDAwMDAwMDAwMDAwMDAwMApb
IDEwMjQuMjUxNDEzXSBSMTM6IGZmZmZhMGI1ZGQxNmE5NzAgUjE0OiAwMDAwMDAwMDAwMDAwMDAx
IFIxNTogZmZmZmEwYjVkZDE2YTgwMApbIDEwMjQuMjUxNDE0XSBGUzogIDAwMDAwMDAwMDAwMDAw
MDAoMDAwMCkgR1M6ZmZmZmEwYjVmODc4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAw
ClsgMTAyNC4yNTE0MTZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMKWyAxMDI0LjI1MTQxOF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDgwIENSMzogMDAwMDAw
MDE5ZTEwZTAwMCBDUjQ6IDAwMDAwMDAwMDAzNDA2ZTAKWyAxMDI0LjI1MjM1OV0gTmVoYWwgeGZl
ciAgc3VjY2VzcyAK

--------------18C4DBE28A0BA36D1F14425A
Content-Type: text/plain; charset=UTF-8;
 name="trace.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="trace.txt"

IyB0cmFjZXI6IG5vcAojCiMgZW50cmllcy1pbi1idWZmZXIvZW50cmllcy13cml0dGVuOiA3Lzcg
ICAjUDo4CiMKIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF8tLS0tLT0+IGlycXMtb2Zm
CiMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVkLXJlc2NoZWQKIyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IC8gXy0tLT0+IGhhcmRpcnEvc29mdGlycQojICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHx8IC8gXy0tPT4gcHJlZW1wdC1kZXB0aAojICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHx8fCAvICAgICBkZWxheQojICAgICAgICAgICBUQVNLLVBJ
RCAgIENQVSMgIHx8fHwgICAgVElNRVNUQU1QICBGVU5DVElPTgojICAgICAgICAgICAgICB8IHwg
ICAgICAgfCAgIHx8fHwgICAgICAgfCAgICAgICAgIHwKICAgICBrd29ya2VyLzA6NC0xODkgICBb
MDAwXSAuLi4uICAgMjIxLjA0MzE3NDogdWNzaV9yZWdpc3Rlcl9wb3J0OiBwb3J0MCBzdGF0dXM6
IGNoYW5nZT0wMDAwLCBvcG1vZGU9MCwgY29ubmVjdGVkPTAsIHNvdXJjaW5nPTAsIHBhcnRuZXJf
ZmxhZ3M9MCwgcGFydG5lcl90eXBlPTAsIHJlcXVlc3RfZGF0YV9vYmo9MDAwMDAwMDAsIEJDIHN0
YXR1cz0wCiAgICAga3dvcmtlci8wOjQtMTg5ICAgWzAwMF0gLi4uLiAgIDIyMS4wOTQ0NzQ6IHVj
c2lfcmVnaXN0ZXJfcG9ydDogcG9ydDEgc3RhdHVzOiBjaGFuZ2U9MDAwMCwgb3Btb2RlPTAsIGNv
bm5lY3RlZD0wLCBzb3VyY2luZz0wLCBwYXJ0bmVyX2ZsYWdzPTAsIHBhcnRuZXJfdHlwZT0wLCBy
ZXF1ZXN0X2RhdGFfb2JqPTAwMDAwMDAwLCBCQyBzdGF0dXM9MAogICAgIGt3b3JrZXIvNjoyLTI4
MiAgIFswMDZdIC4uLi4gICA4MDguODY0Mzk3OiB1Y3NpX2Nvbm5lY3Rvcl9jaGFuZ2U6IHBvcnQw
IHN0YXR1czogY2hhbmdlPTQ4MDAsIG9wbW9kZT01LCBjb25uZWN0ZWQ9MSwgc291cmNpbmc9MSwg
cGFydG5lcl9mbGFncz0xLCBwYXJ0bmVyX3R5cGU9MiwgcmVxdWVzdF9kYXRhX29iaj0wMDAwMDAw
MCwgQkMgc3RhdHVzPTAKICAgICBrd29ya2VyLzY6Mi0yODIgICBbMDA2XSAuLi4uICAgODA4Ljkz
NDMzNDogdWNzaV9jb25uZWN0b3JfY2hhbmdlOiBwb3J0MCBzdGF0dXM6IGNoYW5nZT0wMDQwLCBv
cG1vZGU9MywgY29ubmVjdGVkPTEsIHNvdXJjaW5nPTEsIHBhcnRuZXJfZmxhZ3M9MSwgcGFydG5l
cl90eXBlPTIsIHJlcXVlc3RfZGF0YV9vYmo9MTIwMTY4NWEsIEJDIHN0YXR1cz0wCiAgICAga3dv
cmtlci82OjItMjgyICAgWzAwNl0gLi4uLiAgIDgwOS45Mzc2ODU6IHVjc2lfY29ubmVjdG9yX2No
YW5nZTogcG9ydDAgc3RhdHVzOiBjaGFuZ2U9MDEwMCwgb3Btb2RlPTMsIGNvbm5lY3RlZD0xLCBz
b3VyY2luZz0xLCBwYXJ0bmVyX2ZsYWdzPTEsIHBhcnRuZXJfdHlwZT0yLCByZXF1ZXN0X2RhdGFf
b2JqPTEyMDE2ODVhLCBCQyBzdGF0dXM9MAogICAgIGt3b3JrZXIvNjoyLTI4MiAgIFswMDZdIC4u
Li4gICA4MTAuMDA1NzQ4OiB1Y3NpX3JlZ2lzdGVyX2FsdG1vZGU6IHBhcnRuZXIgYWx0IG1vZGU6
IHN2aWQgZmYwMSwgbW9kZSAxIHZkbyAxNDA1CiAgICAga3dvcmtlci82OjItMjgyICAgWzAwNl0g
Li4uLiAgIDgxMC4wNDI1NTQ6IHVjc2lfY29ubmVjdG9yX2NoYW5nZTogcG9ydDAgc3RhdHVzOiBj
aGFuZ2U9MDgwMCwgb3Btb2RlPTMsIGNvbm5lY3RlZD0xLCBzb3VyY2luZz0xLCBwYXJ0bmVyX2Zs
YWdzPTIsIHBhcnRuZXJfdHlwZT0yLCByZXF1ZXN0X2RhdGFfb2JqPTEyMDE2ODVhLCBCQyBzdGF0
dXM9MAo=

--------------18C4DBE28A0BA36D1F14425A--
