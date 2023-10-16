Return-Path: <linux-usb+bounces-1655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A247CA0C4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5809B2815E5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5CA168D0;
	Mon, 16 Oct 2023 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zo7hD9lE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B325154BD
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:37:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A173100
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 00:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL7U5fqQfy/32XkD4C8GbPxnx/u2mYJjViR5+6+KbsDsK1Dsg13vuIVaeb3irJdtnGD+MG033HbEDh+0yF/l1DIXUorHJZ8b6b19K1bZYgtF/96MfmPEWzszP1YtPSQubk9LfgIXZQZVzIlsrwWTNMUXCiI565slpYyCBq1nBs+qJOD5kOwyjtDhWTXUFogb6JRk5ZDwNhf2rs08Elri2mZRfhnbR7HxSv72r8RtJI7D5CtQvHKZYZEVR7JqysWcfAlGn/PW9I8ROUK1WcY4/azLnAD43Ek6CAlNfmSKTKxzeuYdTAwhHjazcy8crtSu4kkfE7hUU0DgtDIjHNnP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO1k0IrDvHqDhBoGggBfgcZX8hdwGrsWclHsQjdd7Kc=;
 b=V/i4mla9WSqOpwBR0WtqCiyY6gyTsw9SHzfVyKlp3JlQB5zxmC46FmpMUGtxvGuytHv4bU3QFn951oswJLkdOBBmw/abtoUSk1DNwbp/iz8OgzC5nKLMiyVoB+RvMj/YgQNkw7y+obgaQ9K9hnS9SKzpJyd1LIZOSI0FYeMy4uwtH+0QLuwzOF+PaUSpArlr44HfrYciXCg07rSgsxykLBcAPxF9GFEhx9Hbk+DeZDG40NCSG4dtLesk9dlh1TU4ZqrNYM1i7qkFSOkOLjt3u1GOka7HQ1vh6B4HcvsmQdjUZIpLu+6nd7m9l5YCf8jxTjun0p7WNnohzmXtIWQOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO1k0IrDvHqDhBoGggBfgcZX8hdwGrsWclHsQjdd7Kc=;
 b=Zo7hD9lEFgQiXjlLQA9TtS09pyTtNYbLJx5HvX/MUh3Xv2yDzeUWeMea1EU452EfJQxsh+pJrXGL7w7RVRpXePU0h0FWPrPwLMT8MiNvj5tI5qLdaAUucVEvd2ontImff19GzYadV8Api9d+jvRvCWGYA82XrE+N7RXh5Eqe6OMNWp2Wdu4L4unVn/Qh9GoOSFHWtM/iC2k14p6CWaAXgn9pTOZuuablImcjbO5EKZqAWQKKaYjn8qdsreGoUbrF1LmP+dX4PGvQia5avKwXN4g1/YOKKwo9Gtk24XMe59LVWYot57MbE+IM7JrhJVhOfEXBaKTB1Q7ryODRGYwzOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 07:37:10 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::52bb:37fa:d297:2a7d]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::52bb:37fa:d297:2a7d%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:37:09 +0000
Message-ID: <c3cd0de5-e8f3-4edb-bcaa-abf29ce5928b@suse.com>
Date: Mon, 16 Oct 2023 09:37:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: JMicron JMS567 and UAS
To: burcheri.massimo+linux-usb@gmail.com,
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb <linux-usb@vger.kernel.org>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 7637f0eb-b072-4204-2b99-08dbce1ab475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eqc17WxahjJEUa4iVBD+uc9G5IgV1phlGE9omC7zkQo2UJYB+ge5CPC7HLZihtq9NxVIp2e33CcLfmq1SRetQh958NxIyxA0WeoxVwQJQxPHHwH+e5/YFo4snunfqzmS6xBagWB2djwv14VPs3VGu2W56Aipvbqk2wXM3zV+zuoKygfF+YWpbVD/GhpoFkKb02FIuxA5oB9bqAkuMXotsIEfOxL/zPdQClb0S5ogtU2SbNzZPCBZXOPmLZW2aibSbos/Qd4ebQB4/3HsNWU53WnVDc+wdOdIXJbwLBSknhbUI+JchQInac+882fHBzDwdL8YZ65hFcRdE3ycf31tbXTcxqZsUedmdaP/Q7wwnLrFrZYc35zT+IRu/pv2JEQiWUT7glZLYG5xvIRWIIEJhcQLZnWB368RFtENhEig1ikoc8AdFbEdLJ9604UPECvcg4Im1gjgXmWVEuGCiU3ebmsorhCq+IDqMfI1yU5jLfnqyw1PBPkpzCYgrKY6cPXkUzKUQZbPAjSnIdp/rSs/lK1NRlAI1slBVTMp4NmNjvmPQHbDBy4M+xl2ypuhbuT5/+0f9Xefau6O5JvqtKVG34fJFdrY6P4OSGMP93XivAM69GmOOewuoh2A4n4J3rmLdzqnk6Mm9KIWRbpKAJUKag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6666004)(6506007)(53546011)(4326008)(2906002)(41300700001)(478600001)(6486002)(2616005)(31686004)(83380400001)(86362001)(31696002)(6916009)(316002)(66476007)(66946007)(36756003)(66556008)(8936002)(8676002)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUowNmtqaVVxV1JsaU15N1dUWXVZNzgyeElhbWNjYkM1Mmp5QWhJV1lnWFI1?=
 =?utf-8?B?d2pDcUFvV3drVVlZS0dkMmxsMkdPSjlwRXhnSWZXY3MwanI3Znh0K1hndUV6?=
 =?utf-8?B?V0pvTko4V08rbGVvdFMwSGxYbGlaZmZ3YVlVWjdHeCt2amhycHlFRklPU09a?=
 =?utf-8?B?RGJTR09DVFpLblZhRGFYaVVjR1JKN1pmNkdqQVZyTUV6YjJxVnlmNy9BdzFn?=
 =?utf-8?B?cFp2TUk0NEEySFNHWDJhUWdSc3piczJ2NzA1SFdraDRqNm0wMVJCZTlwZUNj?=
 =?utf-8?B?WjlUS2VneG1nVHd1OWhUbHdMU0p6K3FXSy8rNGdBbGhGSjlRVjBRVDQ5aGZQ?=
 =?utf-8?B?Z09RY3BOSUNSTzcwZ2FtKzRBbVlTekVaOWNOalZYVVh1Qy9RUVk2VzIzbFhk?=
 =?utf-8?B?VTJWL09CVWJ2cGFmQ2x3eXZkN2dqa1NQSHc3OStEVEs2Nm55U01PQjNsWG5h?=
 =?utf-8?B?NjdSaFMxbTg1dERhK0NES0hia1NxMTZCTHBEbVdDYWRvd3pUSysrQVhIM0Y2?=
 =?utf-8?B?WDJUTGtCdWcyMG1LRTd0Y2lUWVNPZUZYdE56dG5zbEkyQytVaytJRFh2eFo0?=
 =?utf-8?B?d2ttRE1rMmZTUDFRU2lZVkxpZDlPeDlRb0JBemhXbWF6ZlhSLzQ5aXBINkIy?=
 =?utf-8?B?VVR3amtRenpSWE5qNDRCMGV2WENwZzY3UlJLbG0xblNKOXlpMjdjbjBnRmx0?=
 =?utf-8?B?VDc0RkJBZU92Y1JQWWNZaVk4WDJQdW5XZlpFaFV6Q0lzd2ZkKzVZbWtpRzhq?=
 =?utf-8?B?U3JtS3o0Y2ZnbksyWkhKQ1dLZlJTaEptVjdSMHVZN0ZBWUxybE5yVjdDczhI?=
 =?utf-8?B?aE5NTUIvTUFjKytRZlFyemhKTzF5VTlCWUUvUUU0YUJZeXpIYWpwbW10VlVw?=
 =?utf-8?B?aDduY2Fha1BuSDhkYWp5SUZkNDg0Tk40NGN3NnEzZGFyTU12RW0vWll2aDUr?=
 =?utf-8?B?elkzYlQweU9TWEFLN2Rxd1R0bHZOdUt4UGl5cGp1d29jcnNJc1J4QlhnQ1gw?=
 =?utf-8?B?bGl1U0JJWk9mSDN0MVRhOUdYMjZQL1ZnQTJaVnhmMldIOHlEbVcrMkVQSDNt?=
 =?utf-8?B?T0RrUGVtRXI5NERWWEt0T1llSWxDbllpYnhqWGlpOXViNW9WaXo0WkF0Y0Y3?=
 =?utf-8?B?RUZ3aUF3OEVmaEhIdUJaV0oxb09ueHRPOVFUK3o3Sm55UGpRVHcxcDAxb1ZT?=
 =?utf-8?B?Ni8zTFNkREtxbFZzRm95dHJtUTJ4bksvOEM1aEpVblcxd0x6ZGVMbUgzMlZE?=
 =?utf-8?B?YUhISFcxeEp3cnBZZVlORTFrcmNuMkRqdUdMNk12QXVtcytJVUgvOFVjVTF2?=
 =?utf-8?B?c2lEcU93RnVQZGVuaE9iVWZQb1EycXh1NUlpUGxabUYvVGNNZ2s0a1N2Q3Bj?=
 =?utf-8?B?a0pNNnRFMXJFV0RZV3lQWmlMQ1RLUXZIZmxwNW1IbGhCOFRuYW1CMG5ITDFZ?=
 =?utf-8?B?ZE5Rd21EZFNYQ3JxSW5sNHIwM285SW1Sd0lhNDl5dTJZbStpKzZqdkFSY2Iz?=
 =?utf-8?B?dDdxL29tUW45QjV6TWFhM3FETU1KdTFzZkwybWFzQjArVFZqM3JlZjhsZFBl?=
 =?utf-8?B?MWIvZENKVVljYjEyczZpMk96cmlrNkIwbkVrbjNJcnJMdjZkckRqV2JURk0r?=
 =?utf-8?B?aVhqaXQvcTBUVk15WFBnMFRQTzZpSGp6ZlFYcGo2QWxVQmdmTFdKTVZ2bGkr?=
 =?utf-8?B?dHR1emdDL2h3MXJNelhDeEVEQ1YwdGtUOGtHTHU3RzBPZFAxQWdpZWVkL1Z0?=
 =?utf-8?B?MjJ4NEhrdktMaTdmblBqOG9pWmx4RXZ3bmtqYWNQV25aUFpVNTVJT29sdlhy?=
 =?utf-8?B?RkRiM0wyNnVPQlZvSjNlMVd5MlJ3VWFzSGI0U1RnZFBjOVFUeGZTbDVBa3N4?=
 =?utf-8?B?OFV5Q3FVcjFsd2F6MUs4Z0w0Y3JhOHpscnJDTGozdW9DZTVkT3NUVjREajM0?=
 =?utf-8?B?ekVnbjhVWFRiYnp0Ym92NDNPR21ldEJnSG9QOGdPeGUzMTRQdjN0NGl5VHJJ?=
 =?utf-8?B?bjFCNnJFV3BjWk9Sc3BlZnV2ZjVUd2FjQ3d2WWxsSndBZVluTWJVT1ZpR3U1?=
 =?utf-8?B?WWJjZVBML0tQK3FLRmtIOTVyYlg3WDJpdWI4SHVBOElxN204TVQ3Z21JVS9Y?=
 =?utf-8?B?V3dLaFBzVk1vaVdvZlJYMVFDVXNFeXBFN0E1WENWUHp5NkVkSzVxOUp4K0dl?=
 =?utf-8?Q?nVL4Ln0+QDk5CbBc6EUyZTtWSa04Ell1YJa1xrWyien3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7637f0eb-b072-4204-2b99-08dbce1ab475
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:37:09.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvMQLP5Dv/XvQYSoF4AtGbj7D9epJOyeq2IOpaVwHHUzSE/TUr6Yaw0FmR7L1MQqgzphf1fnOAwJSAsUNZWljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 22.09.23 15:23, Massimo Burcheri wrote:
  
> It's not blacklisted here afaik. This would be done in /etc/modprobe.d/*.conf
> and I have no entry about that device.
> 
> So you mean if not blacklisted by kernel and not locally blacklisted, uas is
> just not supported by that firmware? I'm going to check if I can just try other
> firmwares that were reported to support uas.
> 
> In the past I already got an enclosure supporting uas by just switching the
> firmware...that was:
> 
> Nov 23 10:25:27 [kernel] usb 4-6: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> Nov 23 10:25:27 [kernel] usb 4-6: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
> Nov 23 10:25:27 [kernel] usb 4-6: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> Nov 23 10:25:27 [kernel] usb 4-6: Product: USB3-SATA-UASP1(modForGentoo)
> Nov 23 10:25:27 [kernel] usb 4-6: Manufacturer: StoreJet Transcend

Hi,

sorry, this seems to have fallen through the cracks.
I think we have some sort of confusion here. Could you first
of all give us "lsusb -v" for your device?

	Regards
		Oliver


