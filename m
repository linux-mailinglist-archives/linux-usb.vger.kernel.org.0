Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 769896D39DD
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 20:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjDBSkk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 14:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjDBSkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 14:40:39 -0400
X-Greylist: delayed 152 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 02 Apr 2023 11:40:38 PDT
Received: from e2i484.smtp2go.com (e2i484.smtp2go.com [103.2.141.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE7D1BDA
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpservice.net; s=mf0fy0.a1-4.dyn; x=1680461738; h=Feedback-ID:
        X-Smtpcorp-Track:Subject:To:From:Date:Message-ID:Reply-To:Sender:
        List-Unsubscribe; bh=PDqkPzabi/kFbiS3GZnqsalK854wlTUZRHPLGtLry1o=; b=gCZIL0wU
        LGfhvwGmhzc+/KC0nh/Kb6dWyq6OBekez749m+ETS96EG6weJRc8TZjgeVzb4utJshMcF1DEASEod
        48g74uEewC0VvP0ve61EBseoEFzJP/tFzRgmeEnNJljTfVdX+iKYUOwIA2SIRSY15DyQXiEBVfyRw
        M1z7SYiK58hED03VWM2oK6r46uFTQtzc7TW029SAse2bos+WUs5odkrYRiM3lVlsSYAw7Mo8sNj2y
        bgbUDEvgbt6JGFgAqk4YK5Add+Ecgx/TDqgzyOWXaBJb8v+3OGgpLTLdfQRy6iHB6Q2lizPwl4Msa
        UlDvkjxWkSxqaXO0i81WR993Wg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ettle.org.uk;
 i=@ettle.org.uk; q=dns/txt; s=s700414; t=1680460838; h=from : subject
 : to : message-id : date;
 bh=PDqkPzabi/kFbiS3GZnqsalK854wlTUZRHPLGtLry1o=;
 b=RttVTK0IBCN/30DAKBGWNOfJWpDiGaffEKliKdykW+NcqwWjEdtkbMdmXYiZAjY40RHpd
 nxBp0ObjxTIsVZRb0nQCQ8wd+wFa4pu3u+1aUlogexyuGAakif7wfX8LP9jw96h+67JQTVC
 taOazWMsRV7KQMtWPr8E/8bqyv6uOKHfryKpIzupS+mI4q1wLHsfs03iXUVB9ljzBg63/BB
 kV0nh8LoRaBLCoNlqRgzoKvnlOv0uC/AsQVRyN4+f/pNvpyWphaHZSXPh2q0Yj7riEN2vhe
 oLaTeShSsUPZGXRd2OPmecbvhvVo8OCuWX9HavmLZMPASSN7L7G3zgOQP6sQ==
Received: from [10.66.228.43] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <james@ettle.org.uk>)
 id 1pj2aa-TRjxzu-LX
 for linux-usb@vger.kernel.org; Sun, 02 Apr 2023 18:38:04 +0000
Received: from [10.31.111.84] (helo=[10.192.168.0])
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 (Exim 4.96-S2G) (envelope-from <james@ettle.org.uk>)
 id 1pj2aZ-wSERsq-2a for linux-usb@vger.kernel.org;
 Sun, 02 Apr 2023 18:38:03 +0000
Message-ID: <cbf6dfc7-7d0f-8b85-2f1e-de7d0129e742@ettle.org.uk>
Date:   Sun, 2 Apr 2023 19:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
From:   James Ettle <james@ettle.org.uk>
To:     linux-usb@vger.kernel.org
Subject: ASM3242 SuperSpeed+ speed reporting
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Smtpcorp-Track: 1pM2aZwSERsq2a.KRIKm2R1tWrV3
Feedback-ID: 700414m:700414avnZzBP:700414snJkWiqEE7
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have a 20Gbps USB-C port on a plug-in card that uses an Asmedia 
ASM3242 controller. When I attach devices capable of 10Gbps or 20Gbps, 
lsusb -t reports they are connected at 5Gbps. My test devices are:

* 10Gbps USB hub
* RTL9210B based NVME enclosure, 10Gbps
* ASM236X based NVME enclosure, 20Gbps

Now when I do transfer tests on the NVME enclosures I get speeds too 
high for 5Gbps. In fact everything is consistent with them connecting at 
their best possible SSP speeds. So it looks like just the speed 
reporting is incorrect.

It seems this problem has been encountered before in the following 
thread, a bit over a year ago:

https://lore.kernel.org/all/CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com/

in which Thinh Nguyen posted the following patch:

https://lore.kernel.org/all/6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com/

I've applied this to 6.2.9 and now the speed are correctly reported in 
lsusb. Can I politely agitate for getting this patch revived and pushed 
upstream?

With thanks,
James Ettle.
