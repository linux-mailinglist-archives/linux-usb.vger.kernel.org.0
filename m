Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14DA44B6900
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 11:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbiBOKQL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 05:16:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiBOKQK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 05:16:10 -0500
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639E910E54B
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1644920158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=k5bmSa09/wWkKaEuzd3vLcfD6NRfSloD+hYmHtpCbeU=;
        b=IYj1FA+EwtIEz6/DC7aZFdGcnklFAuApIfkjmU2CZYIbI7bhxfxIIXNtc6ujVPcG14Uz9Y
        WtHOyRks0H9KrKLheAj5ci1c+v/UrgX2kKn5/HLFsgAOZUSXsYtQEWc2blm+I7tDBIpZJA
        /exMh1UhQ7lTn7QV4yNAX2mVnDpYowo=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-SdUi0ttTOf6qdt6ba4VfJw-1; Tue, 15 Feb 2022 11:15:57 +0100
X-MC-Unique: SdUi0ttTOf6qdt6ba4VfJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd+1MfoGOaJFLDKiQoOHjpiuBOTOTyqawD8gHza2AnMLHkFzwx3IyU4AnxtqMDpgnribZHukfIW9kwmV0ARSvJIc+bdryWai4LyWvJRR6nVInXegfWlTvlXeKMf8doZQbAex/6ml3OvFj0SuKYgSqNifQuKkMoUCZLnVeHkA67+kY1keil/21YkvsOr3sGdADZHR0dZn/YAutrr9Pc4lLze8STmpd2JdSnkd7dhqMAlJVWZ3KTlEJuWV+iALYL8v/DL5DjiFMnCds//QDtf0Dk6bv+I7LooaAMRSB0/tWZpEiQfirPhC/chu5Hn4xA6BKKZU308D5Ce8kfaBLEE96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5bmSa09/wWkKaEuzd3vLcfD6NRfSloD+hYmHtpCbeU=;
 b=UyGi+dADzhf4XuR5cXBUnIDzSHuCLX1pYku7DDTZ6kmrGpa4A9ZqtlpUxYzs1php3k7K1FqrOefQA+qiqbIyJpISX+QFXQT1WBpfP+mD9rmkZkFtBVIRDj7RTu7gsXBACDsFaZRvRUUW/Sxn43vqc6ATMpe6ihScnguA2b9qPfMZvC1YRHk7M5RjR5WQe7tP1GThxwo5ieNDBMLPnUEhxDKP+jHxwtit08WIHNE7+IaSSPujg5XdrjDfZMpvX+zcc3MnXHrG/ITRe0iwwfEs7CLopGAjz0wp/DFjixiy6Obg/y9Lo3Cs9lJtm5+T1C74i5sTK6LpOq2Mui7n4UtP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by AM0PR04MB5492.eurprd04.prod.outlook.com (2603:10a6:208:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 10:15:54 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::98e0:cb7:30fd:254f]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::98e0:cb7:30fd:254f%5]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 10:15:54 +0000
Content-Type: multipart/mixed; boundary="------------zHHiENHPBILaNUEgKHVMDWx0"
Message-ID: <b58b9212-3128-ad6f-1628-1f67815be802@suse.com>
Date:   Tue, 15 Feb 2022 11:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Guoqing Zhang <guoqing.zhang@intel.com>
Cc:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: possible race condition with PM entering test mode
X-ClientProxiedBy: AM6P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::44) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc0726c-2b8f-4f21-5b6c-08d9f06c264d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5492:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB549265DDC5AE71A7368A09B0C7349@AM0PR04MB5492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ChlTsv+CteyusI9gyTBPGrvOrx0U+PCGMtF28WJfT669AOPf4hiRqQKlyJMdorwmuW4yu5nuExZRv3OcRRGittnbA+tHtk3BCNyZIhNd1zsM0RTslvItlhSechcH9v1lCbGTmncs+4CUrfaCfjzLai4gAO1+IpyjU4XjgBx2HYJwdq6MdLVqAd+ASYZGwFwD9QUBEynSFuBqkQcYONo/JFbwMfiN7ojKWkNXEF2iqKoo3zDmC6aG8YT+Pgj7e8BPvwrMVOpXZ/nYwePYXyMn0R7wTTbrg8XdpI/TyBZhc9u26wykhVopavd913I/55k1fSd0Vng/xTybq6doBDQ4ZtndEGQNR0zI9ADwWryT0bbUU9bxDgSidI4TDTrMQFmq0R6J37rnnJGdI7zhiHtIk06AMYWwymKxjCrNsxxKOB5E+APghlSfeXfpzzA5AhwmuxGplJuugOPcf2EmQIWhBTPRbT2PD4CxIwocC4tf5P/74aSgfHrzYQhGqGrkFlH8J5OZ1P+gP4gB2Eu5EoZ1BNDbPrBcBGHPBfjHIkcRbnU+G8Rj0jRAfyx5I98j7FPSWXZpKdlzPcl4GRTOg6hYCFPtURSXHPor1YCjh2I6qdhwEKQkScjdFHaNS/9PXz7Hd1jjEhd4/qS32xvT5DJKLZaSiKx0KhwlStkYOyvhyp3TwW/+OXRTjcCa+q/jRARTJKcEmGtt+1VhHB8lihdIeDcQHOBIw+Nyy5Y+MvsXI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6506007)(6512007)(66946007)(8936002)(8676002)(66476007)(66556008)(2616005)(31686004)(186003)(6916009)(4326008)(6486002)(316002)(36756003)(38100700002)(31696002)(86362001)(2906002)(33964004)(564344004)(235185007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNycThBM0svZjNGcmowOGNTTHpCUFdxeHJsNjVsSnVsdzBJQjZxSUJSamR1?=
 =?utf-8?B?ak42V2RlOEp4Tnc4UWRGL3VUYitjSk4yQnBPVlhoSklxb3RZMnViWVluSG9x?=
 =?utf-8?B?MzJuZFN1ZGcrUmtGRjBzRnFLdkdpSTRvN0hJRmdDSWdlNlE2UHBJS2ZjMjE0?=
 =?utf-8?B?VjJCWUNubWJKZytLTVY5d0dLLzNUODZ3WkxqaFhoTHhFQVV5d096S0VWNHlq?=
 =?utf-8?B?YVJHTVVtTkVLRXFud1pTbHpnaGVLeG43aHF0WGFPeXNLcDlaV3NHbEE0SlFJ?=
 =?utf-8?B?NFdBcDV3TEVRZ3hEdjFBQ3ozdXBESWlsODM0TlhmdFpSd25xMGloQ3NsTlBH?=
 =?utf-8?B?bFdZMGJQbHhuemhNVjNHMk9yUDh3MFdiM29Qd0twaTRKVmxxQjAxOUN5ekh4?=
 =?utf-8?B?VytrN1dVOWNZd2srNDl4c1RsTVpXdFpSMlZ2bTd2ckZhVWdMSHkxQmVBaTlu?=
 =?utf-8?B?eVVtQnJ5ZWdiUUdXdnl4YTBjNURaRHFMbkY0TG1DY0R0UmN5eVJHZWJLUm43?=
 =?utf-8?B?UU9hOTI1YmNIZkJaeDltQnBGUDUyWCt4YnUyZU9oRkErY0hIRmZiYndlSEMv?=
 =?utf-8?B?WU9wa3g3MHI0VytZaHV2UVBxR2I0SUlSdUE4ZDM3Q0VGOERrSFErZUdsUjdt?=
 =?utf-8?B?amxJVEFVaFBjYzZNTnJkaWRiQVhuSFhlN0hYNDJCbXVNRDNiejJaL3RQMUdx?=
 =?utf-8?B?aHZ2ZWc1OWJ5bzBHT0doTHJBK08vajNsakM4NWpOdjg5THI4TkRabzRRNzR3?=
 =?utf-8?B?UTRSeTdKeEJ3TlZINkVBaUNGelVjWnhldFFhU3o2QXZYUG1iRkNraGRqYytK?=
 =?utf-8?B?YTI5cjZBMmlDNXc3OXJQd0dEU25BSjRCN2M1OHMxbHNLbTFSQmxwcDZ1Uk1Y?=
 =?utf-8?B?dEdoUUNZWFcrM1pkSkQ2S1liamdNSnZ2dk1oU3plWUlvOHNzeHVPNGRsclFC?=
 =?utf-8?B?RC9aMUd6NkdsQnRqUlBCZy81enUydmlVV3IwYURzeWNCS2RzVFZicXlpbVA0?=
 =?utf-8?B?S1N0dDd5SkhhTHlwR3BGYUNtQm1TbitWUTUrdlR6VVFnUUY4ZWVUTmdoc09m?=
 =?utf-8?B?QWZoOHBDQ1lwcHhsV1c3SUF1Vko4M2lNVytYbU9QTGc0RDg3Q2dxd3BXenJE?=
 =?utf-8?B?WW5Tc2pmem5uY29oNWpTdUEyemtyT1MyTnFpNW00SVg1SjlNdjdnSXdiY2dQ?=
 =?utf-8?B?cDhkM0Q0b1RBRW1xZ2NWeXJtUWNzVU1DNWNkRU1tQlRIY3hHRXpKYkNGVlZS?=
 =?utf-8?B?WDdOS29VZEd5VEQ0Mnk3bzdvSUZpZG1aclV5Uzh2ZFNLTndna2hRUUlDQk05?=
 =?utf-8?B?OU1rVlpMS0ZxSTNFSGR5QnpxbUpqc1Y2amhzMi9UaC9ueTFTKzhVQ3BSa3Ev?=
 =?utf-8?B?K0QxWndXeCtpZmRZaWFYUUVtOWkzTDBXS2xjbG1SMVduTGFzVUZYVlN0eWxq?=
 =?utf-8?B?d3JST1I4WWlFTkVUWDY5RW80eGtFY2kvZElacUN6SjFCcjQ5R2hLYnNubDVR?=
 =?utf-8?B?blEvSXppb1g2WUJzNkpZT1VVQ1lPYTY2TDVyemttQXJjN1FQYnRlUk9DU3ov?=
 =?utf-8?B?TTMxcGtuQlZjRTVsei93eGlaZjdJMGs1THFIOExVM2Q5MFhvclBoTEQvdlBp?=
 =?utf-8?B?cWRXbzFNOHViT2Rqb1Y4MkxPZUJ0QUNCQzMvSGllcmM1YnNLV3M0UkRodTlM?=
 =?utf-8?B?dllTSW8vSWFCVFZndVNZMlp2ZmhBT2JnSmRpZ1VEbnZWdW1BdHNWVWJDbGlY?=
 =?utf-8?B?cmV4cm84THBCMkREN01NaTZOYU4yUXlkY2RrMHNiRVlzbHBlVnRaWnZLL09r?=
 =?utf-8?B?M2RLank4TFlhL0NnTlY3QjIxMEpWNnVRUlRHeTdmYTVCMVRiNStGVlZ1c1lU?=
 =?utf-8?B?aldWaXpWWDlRZEgrcTcwa0wvd0cxVnE5L3JYZFVSSkZGd3RjTGRwZTFrYTYz?=
 =?utf-8?B?MDJUYm1mUmErMU91b3VYdU5paHBldGxDK2ZRcm8rT1VmZ1ZWNUM3NktRbzE4?=
 =?utf-8?B?aHB3Mnhjems5QjVaRlJSaGRiT2lHQVRJbHdXcTgvL2h2WWJLNVFqT3kwa0lI?=
 =?utf-8?B?Lzg2amZkNFh0eGxNampLeS8yOHZwaWpJQkVmRmZvS1N6bmtlZmVwMHUyaHRj?=
 =?utf-8?B?V1BzUGtQNG5kQ2NxRjJzUXJaMnZJakFMUEk3NUNTdTNXaXNpU3hmYy9tWHhI?=
 =?utf-8?B?M2pYUjRiRDU1RGpwSEdVemw0cnh6bldzZ2hZUlo2YWRrYjlmSEZBdmxRNHF2?=
 =?utf-8?Q?C28syj9E6UHUDpSHchXJpLU3UlL1fMv2H3p3SLRE54=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc0726c-2b8f-4f21-5b6c-08d9f06c264d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:15:54.0467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb5H6zB8FYKqYN+3Xic+5O+vlBJpkmdYygATD7DB1C1q31+6IgF6+6kjqK58MCh0Om9XjOeKiTvs6AdmEQbciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5492
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------zHHiENHPBILaNUEgKHVMDWx0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

it looks to me like you need to disable runtime PM
earlier if you wish for an undisturbed entry into
test mode.

Does the attached patch look good to you?

    Regards
        Oliver

--------------zHHiENHPBILaNUEgKHVMDWx0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-XHCI-race-conditions-entering-test-mode.patch"
Content-Disposition: attachment;
 filename="0001-XHCI-race-conditions-entering-test-mode.patch"
Content-Transfer-Encoding: base64

RnJvbSBkYTEyOGViODRjMWNhODE5NWE5YTI4YTBlNzE1N2M4MDA3NWQxNjg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUdWUsIDE1IEZlYiAyMDIyIDExOjA5OjIyICswMTAwClN1YmplY3Q6IFtQQVRDSF0gWEhDSTog
cmFjZSBjb25kaXRpb25zIGVudGVyaW5nIHRlc3QgbW9kZQoKSWYgeW91IGRvIG5vdCB3YW50IHJ1
bnRpbWUgUE0gdG8gbWVzcyB3aXRoIHlvdXIKSEMgZHVyaW5nIHRlc3QgbW9kZSwgeW91IG5lZWQg
dG8gZGlzYWJsZSBpdCBiZWZvcmUKZW50ZXJpbmcgdGhlIHRyYW5zaXRpb24sIGV2ZW4gaWYgdGhh
dCBtYWtlcwplcnJvciBoYW5kbGluZyB1Z2xpZXIuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1
a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyB8
IDE1ICsrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jCmluZGV4IGRmMzUyMmRhYjMxYi4uNGJmYzcxYjBh
ZTQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMKKysrIGIvZHJpdmVy
cy91c2IvaG9zdC94aGNpLWh1Yi5jCkBAIC03MDksNiArNzA5LDggQEAgc3RhdGljIGludCB4aGNp
X2VudGVyX3Rlc3RfbW9kZShzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksCiB7CiAJaW50IGksIHJldHZh
bDsKIAorCS8qIERpc2FibGUgcnVudGltZSBQTSBmb3IgdGVzdCBtb2RlICovCisJcG1fcnVudGlt
ZV9mb3JiaWQoeGhjaV90b19oY2QoeGhjaSktPnNlbGYuY29udHJvbGxlcik7CiAJLyogRGlzYWJs
ZSBhbGwgRGV2aWNlIFNsb3RzICovCiAJeGhjaV9kYmcoeGhjaSwgIkRpc2FibGUgYWxsIHNsb3Rz
XG4iKTsKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ4aGNpLT5sb2NrLCAqZmxhZ3MpOwpAQCAt
NzM1LDE1ICs3MzcsMTcgQEAgc3RhdGljIGludCB4aGNpX2VudGVyX3Rlc3RfbW9kZShzdHJ1Y3Qg
eGhjaV9oY2QgKnhoY2ksCiAJeGhjaV9kYmcoeGhjaSwgIlN0b3AgY29udHJvbGxlclxuIik7CiAJ
cmV0dmFsID0geGhjaV9oYWx0KHhoY2kpOwogCWlmIChyZXR2YWwpCi0JCXJldHVybiByZXR2YWw7
Ci0JLyogRGlzYWJsZSBydW50aW1lIFBNIGZvciB0ZXN0IG1vZGUgKi8KLQlwbV9ydW50aW1lX2Zv
cmJpZCh4aGNpX3RvX2hjZCh4aGNpKS0+c2VsZi5jb250cm9sbGVyKTsKKwkJZ290byBlcnJfb3V0
OwogCS8qIFNldCBQT1JUUE1TQy5QVEMgZmllbGQgdG8gZW50ZXIgc2VsZWN0ZWQgdGVzdCBtb2Rl
ICovCiAJLyogUG9ydCBpcyBzZWxlY3RlZCBieSB3SW5kZXguIHBvcnRfaWQgPSB3SW5kZXggKyAx
ICovCiAJeGhjaV9kYmcoeGhjaSwgIkVudGVyIFRlc3QgTW9kZTogJWQsIFBvcnRfaWQ9JWRcbiIs
CiAJCQkJCXRlc3RfbW9kZSwgd0luZGV4ICsgMSk7CiAJeGhjaV9wb3J0X3NldF90ZXN0X21vZGUo
eGhjaSwgdGVzdF9tb2RlLCB3SW5kZXgpOwogCXJldHVybiByZXR2YWw7CitlcnJfb3V0OgorCS8q
IHJlc2V0IHdpbGwgbm90IHdvcmsgaWYgdGhlIEhDIGhhcyBub3QgaGFsdGVkICovCisJcG1fcnVu
dGltZV9hbGxvdyh4aGNpX3RvX2hjZCh4aGNpKS0+c2VsZi5jb250cm9sbGVyKTsKKwlyZXR1cm4g
cmV0dmFsOwogfQogCiBzdGF0aWMgaW50IHhoY2lfZXhpdF90ZXN0X21vZGUoc3RydWN0IHhoY2lf
aGNkICp4aGNpKQpAQCAtNzYwLDkgKzc2NCwxMCBAQCBzdGF0aWMgaW50IHhoY2lfZXhpdF90ZXN0
X21vZGUoc3RydWN0IHhoY2lfaGNkICp4aGNpKQogCQlpZiAocmV0dmFsKQogCQkJcmV0dXJuIHJl
dHZhbDsKIAl9Ci0JcG1fcnVudGltZV9hbGxvdyh4aGNpX3RvX2hjZCh4aGNpKS0+c2VsZi5jb250
cm9sbGVyKTsKKwlyZXR2YWwgPSB4aGNpX3Jlc2V0KHhoY2kpOwogCXhoY2ktPnRlc3RfbW9kZSA9
IDA7Ci0JcmV0dXJuIHhoY2lfcmVzZXQoeGhjaSk7CisJcG1fcnVudGltZV9hbGxvdyh4aGNpX3Rv
X2hjZCh4aGNpKS0+c2VsZi5jb250cm9sbGVyKTsKKwlyZXR1cm4gcmV0dmFsOwogfQogCiB2b2lk
IHhoY2lfc2V0X2xpbmtfc3RhdGUoc3RydWN0IHhoY2lfaGNkICp4aGNpLCBzdHJ1Y3QgeGhjaV9w
b3J0ICpwb3J0LAotLSAKMi4zNC4xCgo=

--------------zHHiENHPBILaNUEgKHVMDWx0--

