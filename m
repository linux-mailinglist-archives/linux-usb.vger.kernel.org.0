Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979EA3046F3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 19:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390310AbhAZRSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 12:18:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732542AbhAZHkW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 02:40:22 -0500
Received: from mout3.freenet.de (mout3.freenet.de [IPv6:2001:748:100:40::2:5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88920C061574
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 23:26:42 -0800 (PST)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
        by mout3.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l4IkJ-0000YQ-4y; Tue, 26 Jan 2021 08:26:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:Subject:References:To:From:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Y/2/K+Mo8gjsGCe2xh9w9mn9XgJLC/ALLkIRaoWo6/M=; b=mc576JGWqEdof1thwwq55Ze/KI
        cTiaZqGZIIip3Q5FJ3mmsxvvyIgaxFA1m4RXnJxriqRI6TsAllMhxABjS8d9jcIhH8iJ0ByMw4hGw
        UIc0u3pREd+k8mP6TOEFcQzI1C2QRacocqyqtbJfv8orwZ78tq5IT4bFC1cDoCOrSeQSmaIzbbsg0
        d+oV7tNghliEdF7w5AjMz0IUIkZXxDqNZCcf9VNg3BhDxMV8+axW2W8blJJw1qI5bwgqzH1ZKXBBf
        gZ1Wo7P+vP62EkbpxCSn373AjAaRZRVd7Fu3icm/DuXfPBnuzBrs26RsvqM9UfpkAz9H0pxM+S/Jq
        rGdXPGHw==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:60654 helo=mail.maya.org)
        by sub2.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l4IkI-0007u6-BG; Tue, 26 Jan 2021 08:26:39 +0100
Received: internal info suppressed
From:   Andreas Hartmann <andihartmann@01019freenet.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
Message-ID: <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
Date:   Tue, 26 Jan 2021 08:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!60654
X-FNSign: v=2 s=53E39A61856A45B557D8576A76806DBD64B6CFD2EF91207B6B5F7CE944740B89
X-Scan-TS: Tue, 26 Jan 2021 08:26:38 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 25.01.21 at 21:06 Andreas Hartmann wrote:
> Hello Mathias,
> 
> On 25.01.21 at 19:28 Mathias Nyman wrote:
>> Hi
>>
>> On 25.1.2021 12.18, Andreas Hartmann wrote:
>>>
>>> Hello!
>>>
>>> Meanwhile I found the culprit:
>>>
>>> https://www.spinics.net/lists/linux-usb/msg141467.html
>>> and
>>> https://www.spinics.net/lists/linux-usb/msg141468.html
>>>
>>> Especially the last change breaks things here completely. After removing them
>>> by the attached patch, problems are gone and device works again as expected
>>> (I tested with the original 24 kB bulk size which was horribly broken w/o the
>>> attached patch). This means: the additional repair steps are not just breaking
>>> things but are even unnecessary (it's working perfectly without those changes)
>>> here.
>>
>> Unfortunately this isn't enough to remove the alignment code for those
>> controllers. This is just once specific usecase. We need to figure out what
>> really goes wrong.
>>
>> Looks like 0 bytes is copied from sg list to bounce buffer when we want 512
>> bytes copied. Just noticed the alignment code assumes sg lists are used without
>> checking it first.
>>
>> Could you add the below code and test again, it should print more debugging info.
> 
> See the attached file. That's the result of two times coping 1.3 GB via scp.
> 
> As the transfer mostly breaks after the wrong alignments and because
> there isn't any further alignment needed at all, I didn't do more tests.
> Hope this helps. Most importantly it should be investigated, why there
> isn't any additional alignment needed at all.

I'm not sure if it's important for you to know: The driver doesn't use struct 
scatterlist or num_mapped_sgs at all (if it's meant to be used by the sender at all).

But it sets URB_NO_TRANSFER_DMA_MAP (for data transfer among others).

Mlme packets are sent w/o bulk and w/o setting URB_NO_TRANSFER_DMA_MAP. All other 
packets are sent with URB_NO_TRANSFER_DMA_MAP turned on.



Thanks
Andreas
