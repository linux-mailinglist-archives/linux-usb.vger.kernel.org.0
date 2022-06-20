Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73EB5526B1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 23:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242073AbiFTVsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 17:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235804AbiFTVr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 17:47:59 -0400
X-Greylist: delayed 102 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Jun 2022 14:47:58 PDT
Received: from sa-prd-fep-042.btinternet.com (mailomta21-sa.btinternet.com [213.120.69.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36424271E
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 14:47:56 -0700 (PDT)
Received: from sa-prd-rgout-004.btmx-prd.synchronoss.net ([10.2.38.7])
          by sa-prd-fep-049.btinternet.com with ESMTP
          id <20220620214614.OCSJ3227.sa-prd-fep-049.btinternet.com@sa-prd-rgout-004.btmx-prd.synchronoss.net>
          for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 22:46:14 +0100
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=flitspace1@btinternet.com;
    bimi=skipped
X-SNCR-Rigid: 613943C62AFBC1C6
X-Originating-IP: [86.128.12.114]
X-OWM-Source-IP: 86.128.12.114 (GB)
X-OWM-Env-Sender: flitspace1@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgudeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfvhffutgfgsehtjeertddtfeejnecuhfhrohhmpeftohgsucfrvggrrhgtvgcuoehrohgssehflhhithhsphgrtggvrdhorhhgrdhukheqnecuggftrfgrthhtvghrnhepfffhleekkeefheduieevudfggefhheeffffhleekjefgueettdeiteeileetleeinecukfhppeekiedruddvkedruddvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepfhhlihhtshhprggtvgdrohhrghdruhhkpdhinhgvthepkeeirdduvdekrdduvddruddugedpmhgrihhlfhhrohhmpehrohgssehflhhithhsphgrtggvrdhorhhgrdhukhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from flitspace.org.uk (86.128.12.114) by sa-prd-rgout-004.btmx-prd.synchronoss.net (5.8.716.04) (authenticated as flitspace1@btinternet.com)
        id 613943C62AFBC1C6 for linux-usb@vger.kernel.org; Mon, 20 Jun 2022 22:46:14 +0100
Received: from [192.168.0.21] (unknown [192.168.0.21])
        by flitspace.org.uk (Postfix) with ESMTP id 0AB1A9FF3F
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 22:46:14 +0100 (BST)
Message-ID: <2bb3208e-e7d0-9516-4dbf-16b3fa47a72a@flitspace.org.uk>
Date:   Mon, 20 Jun 2022 22:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To:     linux-usb@vger.kernel.org
Content-Language: en-GB
From:   Rob Pearce <rob@flitspace.org.uk>
Subject: Devices not detected on reinsertion
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I hope this isn't the wrong place to ask this. I have a weird problem 
and I'm hoping somebody can point me in the right direction.

The problem is that, if I remove a USB device and then plug it back in, 
the PC often (usually?) doesn't see it.

This affects a custom Gentoo install that I build for minimalist Intel 
Atom systems. The image is built on a fairly old D410PT unit then tested 
on the subsequent D425KT, Mitac and finally Jetway N2930 versions. The 
problem only affects the N2930 and only with kernel 5.17

We (that is, my brother) first noticed with memory sticks on a newly 
built unit.

I tried to recreate the problem on my build box, where it doesn't 
happen. Then I tried combinations and found it happens only on the 
Jetway MoBo (of the four).

I tried a different memory stick and that worked fine, but after a bit 
more testing I am beginning to suspect the problem only occurs if the 
device being plugged in is the last one removed, although I can't be 
sure on that.

My brother has tried unplugging and re-plugging a USB serial device and 
had the same problem with it.

I've checked the system logs and when it fails there is no evidence of 
the kernel seeing the device insertion.

During my testing I tried running lsusb when the device was physically 
plugged in but not seen. This took a surprisingly long time (well over a 
second) to produce any output, during which time the device suddenly 
appeared on the bus (and was recognised and the file system mounted).

I've tested with (vanilla apart from two custom VID/PID pairs in USB 
serial) kernel versions 5.17.5 and 5.17.15, both of which have the 
problem, and with 5.15.12, which doesn't.

The MoBo that exhibits the issue has (from lspci):

00:14.0 USB controller: Intel Corporation Atom Processor Z36xxx/Z37xxx, 
Celeron N2000 Series USB xHCI (rev 11)

The ones which don't are older:

00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #1 (rev 01)
00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #2 (rev 01)
00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #3 (rev 01)
00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #4 (rev 01)
00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI 
Controller (rev 01)

(The newer one does also suffer a known silicon bug in the CPU which 
causes it to lock up if power management is enabled but that's probably 
not relevant?)

Does this raise any flags for anyone?

Thanks very much in anticipation.

Rob

