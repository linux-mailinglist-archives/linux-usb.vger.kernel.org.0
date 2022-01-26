Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6009249D5AC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 23:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiAZWuF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 17:50:05 -0500
Received: from nsstlmta30p.bpe.bigpond.com ([203.38.21.30]:54389 "EHLO
        nsstlmta30p.bpe.bigpond.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230027AbiAZWuE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 17:50:04 -0500
X-Greylist: delayed 885 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jan 2022 17:50:04 EST
Received: from smtp.telstra.com ([10.10.24.4])
          by nsstlfep09p-svc.bpe.nexus.telstra.com.au with ESMTP
          id <20220126223517.UFDG6098.nsstlfep09p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>
          for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 09:35:17 +1100
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecunecujfgurhepvffhuffkffgfgggtgfesthejredttdefjeenucfhrhhomheptfhoshhsucforgihnhgrrhguuceosghiughsrdejgedtheessghighhpohhnugdrtghomheqnecuggftrfgrthhtvghrnhepveekgefguedukedvhedvtdejueeguefgiedtvdejieevvdegtdeltedtfeekkeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvgedrudeluddrudeijedrkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegluddtrddtrddtrdefkegnpdhinhgvthepuddvgedrudeluddrudeijedrkedpmhgrihhlfhhrohhmpegsihgushdrjeegtdehsegsihhgphhonhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID bids.7405@bigpond.com
Received: from [10.0.0.38] (124.191.167.8) by smtp.telstra.com (5.8.806) (authenticated as bids.7405@bigpond.com)
        id 61B80FA30820EBF2 for linux-usb@vger.kernel.org; Thu, 27 Jan 2022 09:35:17 +1100
To:     linux-usb@vger.kernel.org
From:   Ross Maynard <bids.7405@bigpond.com>
Subject: SL-6000 Zaurus not supported since v3.0.0-rc4 kernel
Message-ID: <ed1a0173-5bd8-e6ac-5bd1-593b687e3e17@bigpond.com>
Date:   Thu, 27 Jan 2022 09:35:17 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support for the SL-6000 Zaurus broke after the following patch was added 
to zaurus.c:

[16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad 
module alias from zaurus.

I was directed here by Greg Kroah-Hartman: 
https://bugzilla.kernel.org/show_bug.cgi?id=215361#c7

Thanks

