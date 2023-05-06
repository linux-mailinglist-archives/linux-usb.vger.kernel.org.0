Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78736F93BA
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 21:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjEFTGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 15:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjEFTGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 15:06:43 -0400
X-Greylist: delayed 329 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 06 May 2023 12:06:41 PDT
Received: from e2i484.smtp2go.com (e2i484.smtp2go.com [103.2.141.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A501637D
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 12:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpservice.net; s=mf0fy0.a1-4.dyn; x=1683400901; h=Feedback-ID:
        X-Smtpcorp-Track:From:To:Subject:Date:Message-ID:Reply-To:Sender:
        List-Unsubscribe; bh=ikAMe8g0AHU4E6YeUCID2qSJH0xMmO3tiH/prIiGxc8=; b=nXSE+Kxr
        70vLZn7KWeZNMjpkgZ+udL5RKyaGn1lKH/EwSmpvfXVrslBpk5nafE5XZiuSIzN+tkYPXMKt85jN/
        Rkk4PERDYJi13X/xGk4oaVQK0DbPMfvG7Ea2rGtPtsxrdpoJ2fEsZwHt8sxHJONPW7/F4lzlDZz8e
        XJD9RQjoyuFxzKW1VFtD6KcEeaAIw1VTeIeFEGKMYRE/+rF5DTZekuDvbMK862sjcbaHwhpolfpGE
        RUU6175Z05IhlxsUmZQ37gu2/1oUrcPVbuqHu315fsfdF9r7a4V2McJISEkgSxdtMzQZYW+IJ2w6/
        /S0gq9HUcC8sbE+0EMPziD8szw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ettle.org.uk;
 i=@ettle.org.uk; q=dns/txt; s=s700414; t=1683400001; h=from : subject
 : to : message-id : date;
 bh=ikAMe8g0AHU4E6YeUCID2qSJH0xMmO3tiH/prIiGxc8=;
 b=TK5uiDbuI5P/r3wAwjJ/ejjgW9G70y9uU7Do1rNdBmLgnQRrmoQsb6+p9X2DZKbmSfn/3
 7MKJ57jSx/zdaDGlEYO/TaPKpOxlnCZM2zTlqyRWFxMvx5tXa2HTYR7tDPPSiqIzhHB56rA
 vYO6Aht2PH3rEwGIFPZZnfDv+cDNKNLN+eFVFsrJWWZEFfrz6cQjEHE9N08G4fCH0cPxuzE
 M3k1P12nNLAfxvVfS4Jiod3505HeRf/QlsSwg+rZGE+YfBR35g166t3OeYVETXsYUOSYG0d
 0t2ITC3u6i1Jecbs2GnwmgK1tSKIrK1Xr806ThY/EUMZw98mwCRrF01VsW7w==
Received: from [10.66.228.43] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <james@ettle.org.uk>)
 id 1pvN9P-TRk2fT-E4; Sat, 06 May 2023 19:00:59 +0000
Received: from [10.31.111.84] (helo=[10.192.168.0])
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 (Exim 4.96-S2G) (envelope-from <james@ettle.org.uk>)
 id 1pvN9O-wSKZjr-1i; Sat, 06 May 2023 19:00:58 +0000
Message-ID: <4ce7c155-30da-25cb-9eb3-b46622f4a827@ettle.org.uk>
Date:   Sat, 6 May 2023 20:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: ASM3242 SuperSpeed+ speed reporting
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <cbf6dfc7-7d0f-8b85-2f1e-de7d0129e742@ettle.org.uk>
 <20230404000718.4aeboi4gs6orcete@synopsys.com>
From:   James Ettle <james@ettle.org.uk>
In-Reply-To: <20230404000718.4aeboi4gs6orcete@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Smtpcorp-Track: 1pvN9OwSKZMr1i.Vneobjwl_47Kg
Feedback-ID: 700414m:700414avnZzBP:700414sQNN1VT8d4
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 04/04/2023 01:07, Thinh Nguyen wrote:
> Hi,
> 
> On Sun, Apr 02, 2023, James Ettle wrote:
>> Hello,
>>
>> I have a 20Gbps USB-C port on a plug-in card that uses an Asmedia ASM3242
>> controller. When I attach devices capable of 10Gbps or 20Gbps, lsusb -t
>> reports they are connected at 5Gbps. My test devices are:
>>
>> * 10Gbps USB hub
>> * RTL9210B based NVME enclosure, 10Gbps
>> * ASM236X based NVME enclosure, 20Gbps
>>
>> Now when I do transfer tests on the NVME enclosures I get speeds too high
>> for 5Gbps. In fact everything is consistent with them connecting at their
>> best possible SSP speeds. So it looks like just the speed reporting is
>> incorrect.
>>
>> It seems this problem has been encountered before in the following thread, a
>> bit over a year ago:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/all/CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com/__;!!A4F2R9G_pg!beAeIUnohpkAEs92iPBhg9xFF3wy_neCM8AbKOkCuo4Qo8w6XvED1IcSti7z5AQpMBmNXojdywa7NUorNyrk$
>>
>> in which Thinh Nguyen posted the following patch:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/all/6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com/__;!!A4F2R9G_pg!beAeIUnohpkAEs92iPBhg9xFF3wy_neCM8AbKOkCuo4Qo8w6XvED1IcSti7z5AQpMBmNXojdywa7NT-Vk7Cj$
>>
>> I've applied this to 6.2.9 and now the speed are correctly reported in
>> lsusb. Can I politely agitate for getting this patch revived and pushed
>> upstream?
>>
> 
> It was just a testing patch to verify if the workaround works. It's not
> kernel ready. A proper patch requires a new xhci quirk matching targeted
> Asmedia host. If someone wants to take this diff suggestion and respin
> it for a proper patch (with proper testing), I can help review it.

Understood. Unfortunately it's beyond my ability to make such a patch 
myself. So this doesn't get lost, should I open a bug in Kernel 
Bugzilla, or is it tracked elsewhere?

Thanks,
-James
