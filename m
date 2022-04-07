Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37514F7D28
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 12:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237767AbiDGKmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 06:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiDGKmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 06:42:13 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC37F1AFE
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1649328011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=L9V7DKIB/3q0ENvfp4Vqnv4uYlRNxB4FWArfwBpV3uI=;
        b=GnPwk71+hbE2CKgLvhxViUB1AijJAOIyHbftw7ElxGcNnWERvaMsaCltWFswkOg0pngP5q
        JY4ckwjZ4tsaK7Cjr15NZd3UJ9G83RxE+fUn+xkoNbNq5htUYA9M00XEGg1sRpVjnj/efU
        oMe1OH7H13oTWkXooeK7AVBdGwRwhnI=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-PC_fk8xKNJSrV4C5VwNALQ-1; Thu, 07 Apr 2022 12:40:09 +0200
X-MC-Unique: PC_fk8xKNJSrV4C5VwNALQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA/+ljqkfxGT0bnHekO6Pp0sTbxKgL9Ts8YUSeu3TXY38o9u+gQuJkct8fo3swy5qkmG0K9bv8PpLSSwSoBMXBkYjewL6hWsrbmcIUYV5nC4Dup4f/aiSfwW9MUqdNkqGiSniCRLrCySHyjek1OAfciBShzhiZEKenaxdKq5I7LsQ07GuUeY3AiyY0Xe3SMxV/ihBFq85UCpjMvmE3kbxrPUaXNgN1FytfVG12wDecPTZcMI2XdzGAb1biLucS3iPbOxwdeYwvNkzXkem9cs8ql0mDMdZu1MbseHdZQ/KgnE2zqjSZ3YaNXYWA99yxhtGuGAf0+mKSIMxpY6EaJAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9V7DKIB/3q0ENvfp4Vqnv4uYlRNxB4FWArfwBpV3uI=;
 b=bsdEPlbdyVXeYKlC2gh8zjv6AcdwTMcGu/nDczbovXi7BoFqUyQHHvSqMQXEiQ+NJeA6oZbu0TWuvfVyd2+jpvH4Kn+Zpl5EeZ211IOOqh/x2okTTCaciYJV1ZgGv4UzU9uW8WFkNhjqo2un4iKlWpxMsb9NcSB/XkmIGHaE86AmKuLfCqR2vCuFO0DwW3vH3Cpu81q8qOyu6k7bNSJ7ltKB0M0sK7JbTw5MRJUEVx6KGu0MvAybb3G9Xfh3lpqECwAsF2m+RmlOK26CpsI04igBWydfbILAaOcHQya5bDK1epgh2fzHuh2uTENetWU5gZ35s0Qw3bXVlOXZej3pfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AS8PR04MB7831.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 10:40:08 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 10:40:08 +0000
Content-Type: multipart/mixed; boundary="------------rFwPqDzRKMEzOSjGsL3UWItK"
Message-ID: <b0b97178-80ec-65f9-9ae9-7f72ffc6af74@suse.com>
Date:   Thu, 7 Apr 2022 12:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     hadess@hadess.net
Cc:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: device type in apple-mfi-fastcharfe
X-ClientProxiedBy: AS9P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::16) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adb6b972-9f42-4705-b6fd-08da1882fbee
X-MS-TrafficTypeDiagnostic: AS8PR04MB7831:EE_
X-Microsoft-Antispam-PRVS: <AS8PR04MB7831E60E80C3B477E812FB96C7E69@AS8PR04MB7831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NW5583LqFQ5fK/ngWTjbGdo7njeB57OgNW5ic+wWrYkDCvHy0mfJd2EhWoQ41o43rA0gLlNFJbOmM77NfzyCqr3HaH35RUdC3+OJ0jLp0p+NYwWpZlHbIeTGrOx0uo8ze+JQpGBH5ZD5NpVjl5u3xU/3/ucrRfbyMC/0abaACItisgw52E9awOD/0cXwsYqnqeGIcQbKy8lIrtWOlnLf9xp3q/cbvB08sbE1ssRGxaAxZx97iH9n3YX7LseE90KmfpLcIjo+9Qs6G9glckNfi630/LazlmXE2whEX1neUCoD1AbjBUenn0H6ZmX4xT0ss3/Y9c5Xe2b7Q66hvb4/yx0A5ASjx580+Xklo3maL+hhLiPKhDGYswdZyjCW4Bw5pznoZIr39NpkWNeoM/H5L7t7Md3trkI3p3kLlFKsZU6S269JbS3YjiHwMA0dXRP9lA8+N+dp9C2Snd5sg+nPAPOvZcBS60OM8BCBySaU5pHSV3SXJLuz40NjaxjJEINuTDafvGUILV8dnQqr9sAChjFBOfXGzNRmSkJNk2i9LCuV9Gk1EiyRoGLsSiZq6QUhOk1wXcgtKES8C6Oqfncrl5PijA0Y8xxhv6+5ykDWBanFnmv7yHZzZ+5n6Qnw6KJgJbRIUk5xbjVKBKIP994li8lRG3LeiMgKWtXRMi9OrBFAKKsenSuQY/YytW1NtHgDI//i1E7bpS3TDDoSmyHsmfBDfHIbjhHmb97r861f6pD5paS6RlhcWWyKEUhIM3t23UK9Gsjus6UE/euXbVoSSwTcWyY42pzpm8BIRSX0YifPvCnDrwjxoVX5GaKUqk6I6RJ8+PJaQ5Uax/EkZFt5iuvO1PbQkvPw9HpU+5lKW8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(47660400002)(235185007)(186003)(36756003)(508600001)(966005)(6916009)(8936002)(6666004)(5660300002)(6486002)(2616005)(31686004)(2906002)(66946007)(66476007)(66556008)(4326008)(8676002)(6506007)(38100700002)(316002)(6512007)(31696002)(33964004)(86362001)(46800400005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0dEa1hLc24xdVF2bmVSREc5SEk5V2VKVDVjSnpKQVB2VDBaa1lhcjRGRGRU?=
 =?utf-8?B?RkpuZGEvMlRveW5ncDFFWEtBaWMxYVZSVThLV1FiNnJwQWVQSmQzZHJLeW53?=
 =?utf-8?B?TnQ0L3JKVFJUOXd3UFNPSldUWG85VEt1citlVkpHTjBlWllDQ3RvZWFBM0Rq?=
 =?utf-8?B?MnNHWWtpaWEzbGM0UEdxb3lraGEyNzR5am9PQk9GazR1UWNtcFVRMFhXKzBQ?=
 =?utf-8?B?N2d1YTVHRHdkdlc4RFFGSkRjem1OUTBTYlV3enhkWTdpUGZDZkNSU1lZaGV3?=
 =?utf-8?B?eDhWWEVPS2dySDlhMW1jTFU0SzlCekxWNHdDdVZ6SmZEc2ZqL1dDazlEQXEv?=
 =?utf-8?B?Y2JJQkdIVFlwNE9rbUtOcHphYjduRkxvMDJRaGVmNCtOOFVGU0pYQllSYjRr?=
 =?utf-8?B?YUluSjNwM3dwYzcvVzVFeVphY2RPdTRBRnVDeFBSdjBiUmdLUUdHOWFoSnJN?=
 =?utf-8?B?QUswOEVoWkJ1NjRvbDBmL1dQWmpmZ1VVSFhTOTh6M2FmZlZOWmhEVllpN2s4?=
 =?utf-8?B?NEI5bHcrYjRoZ0pyRGVvdXdBNzZsaXRqYmRVR3kzNmpuNlBqVlF5WDl0c093?=
 =?utf-8?B?cDRvRHdrcjYvSm53dnFyN3FjV3dvekt3Y25Pbjg1elpzaFRxc0lVYkZkVlBr?=
 =?utf-8?B?SEM5eGQrN21RSC93MldXUzBxKzRHQ3FiN3J6U0xxUE15OHhNS3A1VXhoalVJ?=
 =?utf-8?B?Nm1md2l3NlQvbFM3TnBoOFlCN1UvcVRjbnFxaTN4dUgzVVRLbXB6M0hRTnZS?=
 =?utf-8?B?U1FZZlRUWGJrMTE1OW5SUE5qMDJhbkJIV2FYZXEweVlNalFxeFZ4UUM1UUFI?=
 =?utf-8?B?NGFzNWd4bFFQaEJXenV5MEJ6L0d6UFpORWM5T1VoZ2VPekRKajNKdzVmU2lV?=
 =?utf-8?B?aHU1SFZqZllqZnM2RWpDaDErVDNpaWJUckc0WnRUaXNtWWNnSEh5YjFCazJW?=
 =?utf-8?B?VmJqSGlnTjhJRHBoV3REY25zRHlsdU0wdjZQRWk4R1dzakI3UC9HYkE3MnAz?=
 =?utf-8?B?M29mS0toVm93VzhTL2tuVk5RZVFGZ2RNS2haRlBsNTVjU2RXOEp0bGxESEhL?=
 =?utf-8?B?b3JPcHNmSFQwVUlyN3RxRncxZnQzVWJ0bkZzck5qdHMvS3ZkUmhFMlBzN1Nq?=
 =?utf-8?B?clJvMm9YVERwQ0wrZzhVK3JKZGZTWWNKYUlhYzFsNHlDQ2dpb2hjL3BuSkV1?=
 =?utf-8?B?Slo0S3UxQXZaT2lRb3JjRzcxM2dKTW9PZWt2WkFSZVdsSXFpYkZQWEM5M1A3?=
 =?utf-8?B?cWQ2Z3BydCtldVZ1T3BVZG96Y1AvT1hjTEJaRDR2TldWZnhwR1BadnNnbisy?=
 =?utf-8?B?UUM2YWFrY3hTUVpiT0FuOTdYdmxjUE9TaE1WcURBYkVjcFlHcDJZa1hZMmtL?=
 =?utf-8?B?djhCeUpFMzNsaU1maFRMNGFxL1lEK254TjJGMmRNS3ZISjdvZEFDUUtyamw4?=
 =?utf-8?B?OGtNWjJZWWIzbFE4S0x2Unl1aEJyRDJSYll3d3d3NWFuakh3NzhHTHVObGtQ?=
 =?utf-8?B?UnNYYjdJTUpLaHNRRUVKdE0rOWhhSEUyK1N0czVvQW94YWw0TmUvK1N1ZkNH?=
 =?utf-8?B?QThQR2p1c0N0MC9xVjVyUzhHYkhvQTNRMnE2WElTV0MrYmNZU0JBQTlJelg1?=
 =?utf-8?B?S2x5cy95WDR1bXJJU2ZGbFVSKzlSYXczWVlwQnREYkxwV25IN2drWGlFMGlW?=
 =?utf-8?B?NGFaK3hYUERNUnZTTkRvZzBhWDYwUmJuVExpanNJRCsyZVlCTDVjdEJvL3ky?=
 =?utf-8?B?MWFsODhYUWZTR2ZsRWQyMG5EOFZvLzZLd2ZzS0xBU0w3SmZ3QXdlcGNQcXJa?=
 =?utf-8?B?RVBTTTBWVEx0aE80Y3M4Y1ZUTHY2alNNRUFhYWRuZnpMbC9KY2VCSVcwSFpl?=
 =?utf-8?B?c3dmak9Jb2FhcEZNM0V0a1N3c3BNV3hwY0xwakVNWnY5NEJ0TlY5b1lOZmd3?=
 =?utf-8?B?STlsWnE2cHFaNTJiN2ExTE9PQnNML2dDRUc2aS9GSjBrZFZ4RXZpVFFibGlI?=
 =?utf-8?B?aE1PN0FQcEhxanRlZTE4VVJxSk5WYk5WeU1QMDZoVXlYZEVyTGhaMG0zKzFX?=
 =?utf-8?B?bnBZYWxBN0YreU5VUXZra2ViR3lqaUlhYkhpcGNKNzN5eWt1NGgwUFN0WTd0?=
 =?utf-8?B?dGR5OGQ5cVZ1ZW56MXBVVnF4c0src3BXaFM4WTArVGhLajFNU1VtMEtsUERX?=
 =?utf-8?B?Y1MrajRBemF0OVpjeW5VMUpzaFFPbFMyOXovTDlQSnc1dWNRZEE1cGtUVWg1?=
 =?utf-8?B?OEhtN0lBTmdsRmR2cW16VjhlL2JxRE1BVVF4T1Q2Q25VcTIxeTZhUnhvWDRO?=
 =?utf-8?B?V1pWOC9hYlYzNmg5SEFMdGRaQTJodFJmQmdIQ2RaRFpWY0FFVlhLbmxTOXZD?=
 =?utf-8?Q?wxJD5qWZzUvJ/FGNDAUBjpnA4BbSiZ7LEMnK5RnziH3FN?=
X-MS-Exchange-AntiSpam-MessageData-1: FnSky8Qlf+io/A==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb6b972-9f42-4705-b6fd-08da1882fbee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 10:40:07.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edEcaXlSWXYei0knrQoFiXlunvpTH69eixmYLPtpVvnGfXknhc+uYR6aojWC4NjBN4O0BzGyjtUXvApzX79B6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------rFwPqDzRKMEzOSjGsL3UWItK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

looking at this bug report:

https://bugzilla.kernel.org/show_bug.cgi?id=215799

I had an occasion to look at the way it registers the charger.
In particular:
 .type                   = POWER_SUPPLY_TYPE_BATTERY,

That seems kind of wrong. It does not contain a battery, does it? The
type seems to confound user space. Is there some deeper reason? If not
how about the attached patch? Regards Oliver

--------------rFwPqDzRKMEzOSjGsL3UWItK
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-apple-mfi-fastcharge-correct-type.patch"
Content-Disposition: attachment;
 filename="0001-apple-mfi-fastcharge-correct-type.patch"
Content-Transfer-Encoding: base64

RnJvbSBlMWU3ODA1NTg1YTk3OWY3NGJhODZhNDA3Y2E4MjQ2YTUxYzQ3YTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUdWUsIDUgQXByIDIwMjIgMTE6NDA6MzkgKzAyMDAKU3ViamVjdDogW1BBVENIXSBhcHBsZS1t
ZmktZmFzdGNoYXJnZTogY29ycmVjdCB0eXBlCgpUaGlzIGlzIGEgY2hhcmdlciwgbm90IGEgYmF0
dGVyeS4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0t
LQogZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jIGIvZHJpdmVycy91c2IvbWlzYy9h
cHBsZS1tZmktZmFzdGNoYXJnZS5jCmluZGV4IGFjODY5NTE5NWMxMy4uYjhiMzk0ZGY2MjJmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3VzYi9taXNjL2FwcGxlLW1maS1mYXN0Y2hhcmdlLmMKKysrIGIv
ZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jCkBAIC0xNTcsNyArMTU3LDcg
QEAgc3RhdGljIGVudW0gcG93ZXJfc3VwcGx5X3Byb3BlcnR5IGFwcGxlX21maV9mY19wcm9wZXJ0
aWVzW10gPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcG93ZXJfc3VwcGx5X2Rlc2MgYXBwbGVf
bWZpX2ZjX2Rlc2MgPSB7CiAJLm5hbWUgICAgICAgICAgICAgICAgICAgPSAiYXBwbGVfbWZpX2Zh
c3RjaGFyZ2UiLAotCS50eXBlICAgICAgICAgICAgICAgICAgID0gUE9XRVJfU1VQUExZX1RZUEVf
QkFUVEVSWSwKKwkudHlwZSAgICAgICAgICAgICAgICAgICA9IFBPV0VSX1NVUFBMWV9UWVBFX1VT
QiwKIAkucHJvcGVydGllcyAgICAgICAgICAgICA9IGFwcGxlX21maV9mY19wcm9wZXJ0aWVzLAog
CS5udW1fcHJvcGVydGllcyAgICAgICAgID0gQVJSQVlfU0laRShhcHBsZV9tZmlfZmNfcHJvcGVy
dGllcyksCiAJLmdldF9wcm9wZXJ0eSAgICAgICAgICAgPSBhcHBsZV9tZmlfZmNfZ2V0X3Byb3Bl
cnR5LAotLSAKMi4zNC4xCgo=

--------------rFwPqDzRKMEzOSjGsL3UWItK--

