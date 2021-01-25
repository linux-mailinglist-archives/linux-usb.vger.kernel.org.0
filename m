Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F4030489C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 20:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732243AbhAZFnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 00:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731037AbhAYStQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 13:49:16 -0500
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75731C061573
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 10:48:44 -0800 (PST)
Received: from [195.4.92.126] (helo=sub7.freenet.de)
        by mout0.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l46uo-00042W-1k; Mon, 25 Jan 2021 19:48:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xqM0IkomII5QgtcP+rHBltCkZhJafwjhf2np7Chpx/g=; b=lq86bCoE7Jkmg3IOwvq3PpoGaM
        LaiYVzfVRBC6C6lj4d0yx9t12OEMpwpU32BTTY5AldBCNa1xKsWWQJpOtOaP8BdX82dspPwBWXoUe
        PAi5w3JxkWJRDjJin8rkAFOB/ZRtbmDZV25I83fXTzxEblUDlC7eivxegCrwy9e0ipwgv+evcgXld
        Q6O/ucEz5nLEcpJe2zPMOGGfR+3hX4fQzT61r/7fAYp2IEWRHzgzfKQAG7QHQefBWxjlgkicwMJjy
        B4YnnqACzFKrhOKWRpgSrNfXQ0fPWs46vOfYGMg4jbau+bnQTOrQ3fFW7b+DsUXlAOY5+rKoNoIHp
        toL5fDAA==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:44038 helo=mail.maya.org)
        by sub7.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l46un-0007nl-W0; Mon, 25 Jan 2021 19:48:42 +0100
Received: internal info suppressed
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
From:   Andreas Hartmann <andihartmann@01019freenet.de>
Message-ID: <f3f85222-0d9d-2f31-0a3e-d1d60ea9d153@01019freenet.de>
Date:   Mon, 25 Jan 2021 19:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!44038
X-FNSign: v=2 s=B2272646190B054E4BB650EE6BDD96CBA26C4F6D9C25825F90CA06DD75D8995F
X-Scan-TS: Mon, 25 Jan 2021 19:48:42 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Mathias!

On 25.01.21 at 19:28 Mathias Nyman wrote:
> Hi
> 
> On 25.1.2021 12.18, Andreas Hartmann wrote:
>>
>> Hello!
>>
>> Meanwhile I found the culprit:
>>
>> https://www.spinics.net/lists/linux-usb/msg141467.html
>> and
>> https://www.spinics.net/lists/linux-usb/msg141468.html
>>
>> Especially the last change breaks things here completely. After removing them
>> by the attached patch, problems are gone and device works again as expected
>> (I tested with the original 24 kB bulk size which was horribly broken w/o the
>> attached patch). This means: the additional repair steps are not just breaking
>> things but are even unnecessary (it's working perfectly without those changes)
>> here.
> 
> Unfortunately this isn't enough to remove the alignment code for those
> controllers. This is just once specific usecase. We need to figure out what
> really goes wrong.
> 
> Looks like 0 bytes is copied from sg list to bounce buffer when we want 512
> bytes copied.

I don't have only 512 bytes cases, but also 100, 136, 424, 396, 144,
292. It's working anyway w/o any modifications. Why does it work w/o any
modification? Do those chips really need any alignment?

> Just noticed the alignment code assumes sg lists are used without
> checking it first.
> 
> Could you add the below code and test again, it should print more debugging info.

Is there a way to compile this code external - w/o recompiling the whole
kernel?


Thanks
Andreas
