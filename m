Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9382577DAFB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 09:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242333AbjHPHOe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 03:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjHPHOE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 03:14:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5482112
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at;
 s=s31663417; t=1692170037; x=1692774837;
 i=christian.schaubschlaeger@gmx.at;
 bh=G/bPTUaiEySKNFMXYsYcMiy29P5Ts1nIzhbo/DIjtwY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JMWQgTdF24cpOIXLuzSyRwUyEILGKjCdkWc54F4vyKMRRauSd5lNIP3iqTuPscyUobhzmvN
 ZRQVb7E6PeYr3BIvrDn1yv09tsYZ4Ape5fJ+S+JY1Oncc1zh1kuwGwxGrnFR7HFY41RPNAXiF
 WnzxUEJLJw3lv9bVTX6gY0OkYJ4jmwy6MXo8mCDwx1ZVtC/FRV97Y+aZY1sqz4gOUF8Hazdf4
 yhpqR1aUFPgZfw/y97ZoNPnrrg5LOsSz6NQx0RaP0fh7xpO9uk6x+3OseuvajDWZ+40i897+c
 2TFLOWI8YLVMFzzwUFGSlvzi0qbDgZFr5bftrt9zKMVzcWPSOm8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1phsLc22bB-016gOw; Wed, 16
 Aug 2023 09:13:57 +0200
Message-ID: <5bc24e26-ae55-3c8f-ea5b-6be7ebbcf957@gmx.at>
Date:   Wed, 16 Aug 2023 09:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: USB issue on a TB4 controller?
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
 <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
 <36d37597-c0fb-cbaa-dd7c-0f3d6b4050c1@gmx.at>
 <8b96cd69-324a-8f9e-fcd2-4681a43c2020@linux.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <8b96cd69-324a-8f9e-fcd2-4681a43c2020@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:65OpsXVEH8v50o99eiUZTCm8xLWwD3dwkQg+hwQzUKOmoNdORAS
 fnDH2jEnm2SmsHxv/abnzZTSzVimHDtAl/+kNEiAgub2MaGxbu88oy5b2l+gyj2F2kzVLQ7
 ZBp88B07xyBfrZ5AJTzB8qeOaGR4yGufpffPqfXXiUhlOKCrieS6BnQwxHAdLdCjoyG9If2
 SfcadqZLve35dOnTLpMJA==
UI-OutboundReport: notjunk:1;M01:P0:k69ejxKKzQI=;XgB6iuxtjEDkxEKSqaboNuorcyC
 kE14W+Mj69prHUka2TP2gWSeXjc4laXBMzkMaMGSPvSv9hgEeGsmUw5lddlZ5ih9YFE48hy7q
 y/osfUDQxrJS9LmEbCf/X9wan1p9F6LIKHNrYWBcpZkk6k4tBwRi5B863MHWREzR40HN6OQpB
 Aknafl5SKY/4i1SjwbSGcWobSqfJJQMd6PWuZnjycGiPuzf49E3sWtXIdXgDeMWLC8KhyZ874
 h1n0wg4ArHkkaDr4ab7y7VVLRadXfXIv3/Wtouj2o0Tg1KINSRHCmlp6iftDqxA+SGb+52Eao
 2Pve6L35/Z+5DCgDGqhcuxbvEHnh4VNqVwRsuL90OjiDXsfSMXluDBz/fAFj1D17lBL1L3cAE
 OGjMyEnwOhkPbxhA6LKFMGrvH3PnqGC0EfcD9D/zRxdIyGiIFyE/I78S9f8INOufBbU43CId1
 33kxk8a+Y0COrzhjbIvOZXBEpNHR1w+qPqJp5aja5IKg806MQNR5UbGWG4zaigQ4pwei07tVy
 kavTOmOz9AYnGHODLl0t/MK/qEGmOep91TDEPhAkyUSetRm98A+9w4loJlZJqkA6f/+ROjsSu
 8TXbhRCPLr7wohLPslZv0oJZ8m63ATPCIeb0P+DZVdJaaNMNnxpUToGojsRenjECcpEPNGeTj
 8U6togGxqa12AqcusKRGFTlt1RKCE1c3fwvlLC8yV3ATc5v3V4XMb2bAqRmy/3jET+oIdoRiU
 qq5nzJy5YtXb/ESDx7+c8y6XQ3mzuklMcswylzR/Ga2LnuirhgBOyr4J8wFuRvgPcP9RZukIw
 YOE/ECng+lBRjsKxrUEkZ5gT9kvTAhEtIjoOuorFnaDWxZfX+XDPpPElOR2WVsdam53rHCX+r
 Cn8aRQETzT8BYmDzL5MmA9PvCGSwM8hm0UvKEazwBynP20KUAspVQkH8A4YaDGA4uwWmpmjvs
 +t5LFQ==
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

> I have to check if we have similar machines and docks laying around.
> I'm away until August so there will be some delay on my side

I just want to ask, if you could find any machines / docks for testing this. Today I could reproduce the issue with a 6.5.0-rc6 kernel, also with the lastest Ubuntu-22.04.03 which comes with a 6.2 kernel. As I said before, if you need any logs or tests, I'd be happy to help debugging this.

Thanks and best regards,
Christian

