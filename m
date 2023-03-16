Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9458A6BCE5B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 12:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjCPLg0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 07:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjCPLgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 07:36:21 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3B077E1E
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 04:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpe4/WJ4CysidQUaweQhluF4JcoC4xhHLDo1P++6Wj++aVJFiHk0jJ6QDFskRGLMNsD5oyw4E2qzeDXWZ/im6qeFUkUxc0QVUo406VMsQEolPAw5ZRKLgWv1KuEgYDwdcZQQe6Mq7z3wI2OKG0A8TIH2k13aVCoVYr+UnrSg2h7Ggyqe9k+R2a2OXYmiKM6/z4ZTJQAgPK+b/VdiXD3CDK6JnPjANpHTWbetVHIem6VufgrY3+jtlJNcQciA/gTbXGfFcx1EXlY2+PZZJBXHNbkhvnVb0qkOE/0e+kZ+3IuSPqcR69roGbMO61dPr7udYfB787llYGPBXm+8UZ3FqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gAuR0Vhf2Xx7GY0vH/uJTSytC1WZJs4kFmvFqlOdt0=;
 b=islr52fmjPa02Rh3JjRzuCTdagCq0ijTRjjIKs6QRrWVHlrnKK9fNYQxV/b9dnq2icRIGv3pRebHeCioKczi77XsXKbivnLbji+v8fCbjDx/8aW0Kxcreaps+ksNVr5sduQuMwogwCOZjYMqaceeK0zidMAQ00iVA7zcowfaE2AVHizKhIYbClzXeBjpLONLauLnyttbuTv6BWkq0dciFX2JHHRKvuuA21e6+Z9mpXWw4fqmb73fSv7Cmv8HtU/ccgSBjD/B14LpCxYtcU/B2bvor+2oiloBUIbdN8JnM04GoLldFKH6ofn43oEXGgL9KBPK/8v+XLoZP85vD5h5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gAuR0Vhf2Xx7GY0vH/uJTSytC1WZJs4kFmvFqlOdt0=;
 b=KpHe4zwjRItm0ay9FCw/o9VWIRI07ljQGRj2PFlj+ffxsMH25G+ACYuvpT6bzy/P4oNn8Pt2hMsPw0n+hB1WYRVnwXKdO2c4/chtOaprN8PaIgpiZyWgTJJwaJ/b0A3mS/zXpye2vjjNO2DcaucHqM3q1ecGmallm9HjsNJJ7dpKktyPVdbh1+erlCSPNA0dhsJRh3br4e9Hnb+5GQJLkXumy+NQNvj83yT6KT43M2qRMypJMAST8xDi229bA9fOFsM8TBCS2WJD/uyrbnTaD6++iwHElo/CgCAoISE9Yn7Jqcm5i9QL9aN43itkABkTDfxdEj6tXh/KBbTBYU+6CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAWPR04MB9744.eurprd04.prod.outlook.com (2603:10a6:102:383::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 11:36:05 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.031; Thu, 16 Mar 2023 11:36:05 +0000
Content-Type: multipart/mixed; boundary="------------dq0TbaOzrw0TwY03unhozhT5"
Message-ID: <ee8164dc-8078-3ede-df5b-52aefd55d787@suse.com>
Date:   Thu, 16 Mar 2023 12:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
References: <20230316065858.12687-1-quic_ugoswami@quicinc.com>
 <ZBL6vT4OzdbfW+ZR@kroah.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZBL6vT4OzdbfW+ZR@kroah.com>
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAWPR04MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 502aabe8-aa8e-4c7c-78ac-08db2612a09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PS7KadBiSYE8hwmpS5O/Clek/MinU7Su6qgWUVMs0hThRhHza2syI1q0ZV5iYO6+WiFTO/xBSDi0Z63BppM4X9Wr/8pHOO+lfoTFtbv2FxdbpSST2BDW8yPTTqVsFcNsua/SBGyyyooLP32VNW+PGAR+e/fKqNNCU0zTrzTbvbUsGFz6kljm6tIf2G0fMSOWSw7bS03GxKye0KkLcCEy415NTCGtfmkMeqD/uBhu49dAeD0q3MJ/npTYoYGFWHR0D5iov5wIlYL7OK2E2QVvhIGPIJsTjaCcJObNEPz6gmNLD9j1qjChQtlvoAyEqO7ewn9nkaWXelP0L3WOaFx71etxMuSDTBIvZR+1N7YqptfB+MLLRZFClBK3oP1pzth//7flAD2XGgumNNKPPSjgtOfK3shdw9rHu3EiilYUbkH194y/lkghCo74r1p4Ch/ch0Mwk4fie4Y8IXYPzBJk6IG03hD1Sw4qqqFrSIkhT6sGWS/+EQWGJ4UXxca9U0c7nXvcov0U3s0kuWArwRQSlvfm5GQOIGxqDYvv4W5L2DzNwwj58kEff9OCNcGWtGs8UtKaTfN9wKIwZn2LPUCRKLFg7CYB5bgAG41L2dGH9fvsGs1tMqu9ah/Hz42kha/HaBf3ycA4ftwgcGQSUETt3HZLtgljOm5Zd+sqXuIvHWD2mMoI1zHn9hVhAenQv47+LBQRtMKSnNZd3j/P/iMXvnMifXXjf6bsnt5NpFrO2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199018)(6666004)(5660300002)(8936002)(41300700001)(2906002)(235185007)(15650500001)(31696002)(6486002)(38100700002)(316002)(4326008)(8676002)(66476007)(66946007)(83380400001)(66556008)(36756003)(86362001)(110136005)(478600001)(54906003)(53546011)(6506007)(33964004)(6512007)(2616005)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhldXJlSDVkcjFabHNLN1JZbWpWSVl3MEJBS1hRb283N0hkTjNYUUJLRzhu?=
 =?utf-8?B?MVdiQXZiRVV0Nm5YSWtXYVlVYXVTcCs0TDFpMUxhc05adDdpdXVnQUNHaXEr?=
 =?utf-8?B?VDN1VXl5RlN1bk1jZWwyQ2pQY0NwVUo2MzZvVmNnRkxrckNNdU85SjVEN0FC?=
 =?utf-8?B?ZytOa1VacmJKb3Jtbzh4emdQeVVFeEt3MkJXb0JReUV6bTVrL1d1bEU0bjE3?=
 =?utf-8?B?eVl1ZllmSUEwVFFubDNLYjJpSUV4RkJkWm93RUJWTG5UdE5DOUo0VlRoU1Vo?=
 =?utf-8?B?YzZwa24yeVNEQnVYV0xkd1JLa0JNQi9PSU9zN3h5RVN3M1R4VVlWY1N1emZq?=
 =?utf-8?B?MWZlTXhhUFBxbklxdng2M2dla3dVaElpemg1d3dodHIzaElPUG5XRHZtMGIz?=
 =?utf-8?B?YnpkTnpLakRMVWZBQ3A5N0ZEbmN2TjJUTkVjeVJVZUhoVWh6b3hRMk1WcEMy?=
 =?utf-8?B?cXIwUTdNYVI5V2F4U1dOc0IyTUZ5UlpHSTBIMGo4bTl1ZDhRRTFsanVuTFI3?=
 =?utf-8?B?Y2gzcDZ3L2NybU1uUUYwZUlCZ2VHSzRmcVZEOE96TWZ5SmhrNE9MMmZFdWFM?=
 =?utf-8?B?eGxWb1FUdVAwVURLRVVLSzVuMDhXcDVkRWgrbUZ1eW52R005VEtsWEJTU1Nk?=
 =?utf-8?B?NmE1Y3k0T3EwQUdoaktYQWQrL21jR2lCYXBtRDByL253T3VNWjJMeDRHYmJy?=
 =?utf-8?B?QS9QcEErZmpoOGZ6NTVyeWsyLzM3cmdhZElrMkRWU1NvcFVZTVMzQmJjZVBB?=
 =?utf-8?B?N29hTzFQZ0Z6MGh6NDVpZ3BsenBTdEZnN2wvWkNSMUcxZDRNRWE5MDVuZVlq?=
 =?utf-8?B?emVMUWNPejRxWmF0SnJScGtNa25NVVFrUk93bEpXNXorVUlMTGMvZkR3RS8z?=
 =?utf-8?B?TmdTSjZhVGhQMm5uZ1VIRWNoQURXb1VtcE14b1o5TFhXYUloMStGM1NPd0JI?=
 =?utf-8?B?NHkvL3N3QitoSXVpQ1AzTE81SXBsNmxvZklxUEtyRFJFd2FzanEwZ2k2U2hu?=
 =?utf-8?B?S1ZoR1Bjc1VDZ0xoYlpDZXREd2ZpSm5ueW1ONUk1eXZZcUtMc0w3RGk4NkVD?=
 =?utf-8?B?NDlYNzFyWlJLQlFWYmVWSEJ5dy9EOGpKNEd1R2hPQlpzYU0rUkd3c2xBMjJH?=
 =?utf-8?B?WjErL0lxRUtCVnRZS1JSeUV6WnlnNXNpU1ZTb3k5OUswRVQ4SFQ3eHpmbWpI?=
 =?utf-8?B?VUFibDFuMTFVaEVBNjNvVDlPQ0QrUlY0WXZWSEhLRHlvV1hQZmMxdDVhaTZL?=
 =?utf-8?B?Y2JlMyszdWtvTUs4L1VUZEpMQytrcHUzczc5d2s0bzVLQzI5WXh6ckdwSmhh?=
 =?utf-8?B?T3VvTVprUGlBalBVdWdubGo4cVgyaTRkQ3RxT3o0S0tHNXVyK0tKL1g2NjZ1?=
 =?utf-8?B?KytOU1M0VzkyQW5rOHNsSmlOUDhFcnZVS3dmbG05OXluRFVvZEhkWW9rbWdi?=
 =?utf-8?B?YllPU2FGMWdmeFlVS2NVVkV4b0N1OERhZEpiSG44dStjZzFWM3daK0M0dlZJ?=
 =?utf-8?B?ZFdraERNd0VVZkZXalMrYzBKWEEvUDlaanhmZnlPTkIreUx6UWN3cStPWkRB?=
 =?utf-8?B?dmc4NDhwa083QVhJWFBaVVVZTG9uaFRKY1RlVThLY1VqMFlOOWI1Z094QVQw?=
 =?utf-8?B?dHN5SFViS3FPUXI3clBNRlNHRnA3SXdSeUxzRjNPVzFRdFRuSzM0Mk9CNEtC?=
 =?utf-8?B?bXBXK0Vwc0ExcXZSQWpnTUxNNWY3ZlJRVmR6SDAvVmg5ZmZscXVWK1NxZjQy?=
 =?utf-8?B?TlJMV1JuS1VWWURZMm0xMDNXRjJJYmR5Q2dxMjNhdDJNUUNzMWxTM2Y3Z3R6?=
 =?utf-8?B?K2NGdEVzbUJ5L0JDZ2xtc0tDMWhNbzhac0treGVSNXBxT1pNU0tFdzNuRXAw?=
 =?utf-8?B?cW9YdkptSTlpVWdhR2FRQnYwaWZTY3pkOFZDWVJ2YTg2UE42QTBKMStWa3BM?=
 =?utf-8?B?VTc0MnQ1SGw1TlM3VEt6MWFZaGJEZVYxVmNNblZvUm1PV2hYOVBBa2FqS0Q2?=
 =?utf-8?B?by9ZalArSW9QMEN3QjFMZ0tlYzZvV1IzRmN5Y1dYT0NTWG9nS2RMZXZoMGlD?=
 =?utf-8?B?KzNXR3pINGR3dk42M2xtbDluMjlXVnFRWXB5QnJxM0pJMWFEM3ZwUGVGU1lE?=
 =?utf-8?B?NW1hdWlnTG5DSllReTJoUkZaMEt3MUl2RXZQTzFxWDdFVzZFbkxuck1VakFw?=
 =?utf-8?Q?sDMdbZxvqUUgo5D4+coZVivE8ontCyKoQ8pwKFKb9E+R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502aabe8-aa8e-4c7c-78ac-08db2612a09d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:36:05.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAgPDsbrZZLsj1kMSQQtsxILpTgc8/vEGoe1E8Ooc1/PjzpfMVpfLnULywWATXESM7FPlrm5Bbj5jJ5N9Ec+mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9744
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------dq0TbaOzrw0TwY03unhozhT5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16.03.23 12:17, Greg Kroah-Hartman wrote:
> On Thu, Mar 16, 2023 at 12:28:58PM +0530, Udipto Goswami wrote:
>> When the dwc3 device is runtime suspended, various required clocks would
>> get disabled and it is not guaranteed that access to any registers would
>> work. Depending on the SoC glue, a register read could be as benign as
>> returning 0 or be fatal enough to hang the system.
>>
>> In order to prevent such scenarios of fatal errors, bail out of debugfs
>> function is dwc3 is suspended.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v3: Replace pr_err to dev_err.
>>
>>   drivers/usb/dwc3/debugfs.c | 60 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>> index 850df0e6bcab..4a9d0994f3b4 100644
>> --- a/drivers/usb/dwc3/debugfs.c
>> +++ b/drivers/usb/dwc3/debugfs.c
>> @@ -544,6 +544,12 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>>   	u32			reg;
>>   	u8			speed;
>>   
>> +	if (pm_runtime_suspended(dwc->dev)) {
>> +		dev_err(dwc->dev,
>> +			"Invalid operation, DWC3 suspended!");
>> +		return -EINVAL;
>> +	}
> 
> What prevents the device from being suspened right after you check this?

Indeed. If you really need a semantics of not waking up the device if
somebody reads through debugfs, the attached patch should do the job.
But do you really need it?

	Regards
		Oliver

--------------dq0TbaOzrw0TwY03unhozhT5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-dwc3-debugfs-no-register-access-if-suspended.patch"
Content-Disposition: attachment;
 filename="0001-dwc3-debugfs-no-register-access-if-suspended.patch"
Content-Transfer-Encoding: base64

RnJvbSA4NjQ1NDgyM2I2ODJhOWIyNDE0YzBiYmI0NWMzZWQyZjlkMGExZjVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDE2IE1hciAyMDIzIDEyOjMyOjU1ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gZHdjMzog
ZGVidWdmczogbm8gcmVnaXN0ZXIgYWNjZXNzIGlmIHN1c3BlbmRlZAoKUHJldmVudGluZyByZWdp
c3RlciBhY2Nlc3Mgd2hpbGUgc3VzcGVuZGVkIGFuZApwcmV2ZW50IHN1c3BlbnNpb24gZHVyaW5n
IGFjY2VzcyB2aWEgZGVidWdmcwoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1
bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8IDE2ICsrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9kZWJ1Z2ZzLmMKaW5kZXggODUwZGYwZTZiY2FiLi42OTIyMDc2NTcyY2QgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVi
dWdmcy5jCkBAIC01NDMsMTMgKzU0MywxOSBAQCBzdGF0aWMgaW50IGR3YzNfbGlua19zdGF0ZV9z
aG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQogCWVudW0gZHdjM19saW5rX3N0
YXRlCXN0YXRlOwogCXUzMgkJCXJlZzsKIAl1OAkJCXNwZWVkOworCWludAkJCXJldCA9IDA7CiAK
KwlpZiAoIXBtX3J1bnRpbWVfZ2V0X2lmX2luX3VzZShkd2MtPmRldikpIHsKKwkJcmV0ID0gLUVJ
TlZBTDsKKwkJZGV2X2Vycihkd2MtPmRldiwKKwkJCQkiSW52YWxpZCBvcGVyYXRpb24sIERXQzMg
c3VzcGVuZGVkISIpOworCQlnb3RvIGVycl9ub2xvY2s7CisJfQogCXNwaW5fbG9ja19pcnFzYXZl
KCZkd2MtPmxvY2ssIGZsYWdzKTsKIAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19H
U1RTKTsKIAlpZiAoRFdDM19HU1RTX0NVUk1PRChyZWcpICE9IERXQzNfR1NUU19DVVJNT0RfREVW
SUNFKSB7CiAJCXNlcV9wdXRzKHMsICJOb3QgYXZhaWxhYmxlXG4iKTsKLQkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7Ci0JCXJldHVybiAwOworCQlnb3RvIGVycjsK
IAl9CiAKIAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19EU1RTKTsKQEAgLTU1OSw5
ICs1NjUsMTEgQEAgc3RhdGljIGludCBkd2MzX2xpbmtfc3RhdGVfc2hvdyhzdHJ1Y3Qgc2VxX2Zp
bGUgKnMsIHZvaWQgKnVudXNlZCkKIAlzZXFfcHJpbnRmKHMsICIlc1xuIiwgKHNwZWVkID49IERX
QzNfRFNUU19TVVBFUlNQRUVEKSA/CiAJCSAgIGR3YzNfZ2FkZ2V0X2xpbmtfc3RyaW5nKHN0YXRl
KSA6CiAJCSAgIGR3YzNfZ2FkZ2V0X2hzX2xpbmtfc3RyaW5nKHN0YXRlKSk7CitlcnI6CiAJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7Ci0KLQlyZXR1cm4gMDsKKwlw
bV9ydW50aW1lX3B1dChkd2MtPmRldik7CitlcnJfbm9sb2NrOgorCXJldHVybiByZXQ7CiB9CiAK
IHN0YXRpYyBpbnQgZHdjM19saW5rX3N0YXRlX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0IGZpbGUgKmZpbGUpCi0tIAoyLjM5LjIKCg==

--------------dq0TbaOzrw0TwY03unhozhT5--
