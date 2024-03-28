Return-Path: <linux-usb+bounces-8088-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06C87FD32
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 12:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7896A1F219EB
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 11:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372237F47D;
	Tue, 19 Mar 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="f/mQ4B+s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247F7EF1F
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710849282; cv=none; b=sYu+IWCounudawJfJwtcH/7gBvAnvnMpE2xn34olc55/HH4jQg86mz4lVTh0YPJ8zUTErwe6I4esHCkbA6sn7SuS3XgV3snOhQiw0H3t9LcuU5/yXyOD0upIYPT5K2DJdcuWfxGGR7exSDKtTaLctzSeITh1MSBrdUfK2W1QN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710849282; c=relaxed/simple;
	bh=QhSFdj6uVvIabBLy3+oijYFEsG35tgJUgtYOEhdusVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITUx49Gr64hb636Y8FU0mTeLR2bk6hKYM1N3q24WzlCbKO0j5CeDIcsfrHcy8Fjh5PFsKuuXChkbPjmdSVbfcgczIgr8um8ywZjbUZd87in5VKwODxjIDZnAh0rvZJrIIw5+dQi7J4KOJN3awhztb0FHVYcdkQQPWaNfrM7J1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=f/mQ4B+s; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5684ea117a3so8028554a12.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1710849279; x=1711454079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Gf9o/yRzALGoGzkqtIrPrMA/PHdND+EQbbg96/0MR4=;
        b=f/mQ4B+sJXEQsEoJZRbjHjosmc4rJsr75FHy1yN+qhr8Fz7VfvhTaBeWBzE2+TaUMj
         h6dtyOoh7dTjAGFs7HpIcOUlmK8DanmQA6Kvjp401qjV2VjjNQE1aH81BjcKZmbV/bzi
         ZOSMLvAHqXAKk2gIrszL+e9hMj0IeAgy6D3gvdqFYF5JZK17bA+/X/OMICUbJkQqS5ur
         xdY+psKnHiQ+4ehZrRvztuJS+WrcEK6obONZGMy1uzSgr4HxNWpb56ZRgazacEkh3gyL
         jBzxypKacJyyt5a14+6509Ju3BKCul66d1LbW9mppYpUI89AUYJnDPENOq9h1TInYbXg
         P3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710849279; x=1711454079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gf9o/yRzALGoGzkqtIrPrMA/PHdND+EQbbg96/0MR4=;
        b=W1e9R5SPkylDylhmTV/ZgOtEnGPZWGTz3x5AoGvUVmwxb/tClaMGuqP/ocyxY4lotV
         B5OkSxTDIsqAisMgdsfIAAWSj53FzAe4mmoW506u6k2SVUUYcX/FZAo9b9JinAeffJNs
         mY9JoAo30eOqlZLPDyWVJY5yBEKUH29rMNU5aFmM/8abqbzKxv+SZR2fpIPoi6kiJHu6
         0CprGvp90iYS/x/6LmBjmR219/9hJV6sAwmsbAdwoDZ3niCh4573mfKN7Hnc+mb2qSVP
         Jil38gswvDLfje5nT8ERly6ZSZArMQf8TtCSLhX497bSZjEH5lZDYhy0EHy/WoQSg7dr
         /nTg==
X-Forwarded-Encrypted: i=1; AJvYcCX44ZZbvD6r3O9ZzqFzHap2yUXHzYPeOr57JXN87MS7pHZjm19DRcxBVsUvzYsxbgj1LH6wpR0M5kOrbC6bK80Pjapfne0s5WKo
X-Gm-Message-State: AOJu0Yzd5orxNhYanoCljKVmJ/vdQDjCkj2/R78n89Wjo/ofVGnXSeFl
	u54kbARkCYVQuL682Z6Zl5uxzMe1I0ccB74I9F7kN+KnmF9m9gkKEB+vm4BvO4M=
X-Google-Smtp-Source: AGHT+IHV3Ev/Y3Qd7/jhVB9avXik0Z2tOqFOEc0Iu/Kwh+gC2/sP5mG7pqQmyVlEGfJrG6bb3717Hw==
X-Received: by 2002:a17:906:ce47:b0:a46:dacc:dcde with SMTP id se7-20020a170906ce4700b00a46daccdcdemr1288930ejb.76.1710849278414;
        Tue, 19 Mar 2024 04:54:38 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906b31a00b00a46b99a4273sm2653352ejz.216.2024.03.19.04.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 04:54:37 -0700 (PDT)
Message-ID: <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
Date: Tue, 19 Mar 2024 12:54:37 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Alan,

On 16. 03. 24 21:35, Alan Stern wrote:
> Below is a patch meant to get the number of resets back to what it
> should be.  I'd appreciate it if you can test this, and report the
> kernel log output along with the usbmon output for the normal case and
> also with the "old_scheme_first" parameter set.
> 
> I'm not very hopeful that this will solve the problem, but there's a
> good chance it will help point us in the right direction by removing
> extraneous complications.

unfortunately you were right, the problem is still unresolved with your 
patch. I hope the traces will provide some new insights then.

Regards
Jan


###############################
# Patched - new scheme (6.6.21)
###############################

[  149.638997] usb 1-1.2: new full-speed USB device number 8 using ehci-pci
[  149.640602] usb 1-1.2: device descriptor read/64, error -32
[  149.811493] usb 1-1.2: device descriptor read/64, error -32
[  149.986051] usb 1-1.2: new full-speed USB device number 9 using ehci-pci
[  149.987370] usb 1-1.2: device descriptor read/64, error -32
[  150.163337] usb 1-1.2: device descriptor read/64, error -32
[  150.266422] usb 1-1-port2: attempt power cycle
[  150.750045] usb 1-1.2: new full-speed USB device number 10 using ehci-pci
[  151.162030] usb 1-1.2: device not accepting address 10, error -32
[  151.430029] usb 1-1.2: new full-speed USB device number 11 using ehci-pci
[  151.445492] usb 1-1.2: device descriptor read/8, error -32
[  151.633637] usb 1-1.2: device descriptor read/8, error -32
[  151.739227] usb 1-1-port2: unable to enumerate USB device

ffff8881003dc9c0 149518477 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 149518517 S Ii:1:002:1 -115:2048 1 <
ffff888139ff8480 149518558 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149518935 C Ci:1:002:0 0 4 = 01010100
ffff888139ff8480 149518951 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888139ff8480 149519199 C Co:1:002:0 0 0
ffff888139ff8480 149519229 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149519467 C Ci:1:002:0 0 4 = 01010000
ffff888139ff8480 149546106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149546393 C Ci:1:002:0 0 4 = 01010000
ffff888139ff8480 149573113 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149573442 C Ci:1:002:0 0 4 = 01010000
ffff888139ff8480 149600103 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149600309 C Ci:1:002:0 0 4 = 01010000
ffff888139ff8480 149627105 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149627441 C Ci:1:002:0 0 4 = 01010000
ffff888139ff8480 149627495 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888139ff8480 149627699 C Co:1:002:0 0 0
ffff888139ff8480 149639104 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888139ff8480 149639364 C Ci:1:002:0 0 4 = 03011000
ffff888139ff8480 149639401 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888139ff8480 149639619 C Co:1:002:0 0 0
ffff888139ff8480 149691082 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888139ff8480 149691572 C Ci:1:000:0 -32 0
ffff8881419950c0 149691656 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8881419950c0 149691905 C Ci:1:000:0 -32 0
ffff8881419950c0 149691917 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8881419950c0 149692565 C Ci:1:000:0 -32 0
ffff8881419950c0 149798110 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff8881419950c0 149798431 C Co:1:002:0 0 0
ffff8881419950c0 149810115 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff8881419950c0 149810401 C Ci:1:002:0 0 4 = 03011000
ffff8881419950c0 149810427 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff8881419950c0 149810864 C Co:1:002:0 0 0
ffff8881419950c0 149862123 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8881419950c0 149862618 C Ci:1:000:0 -32 0
ffff8881419950c0 149862653 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8881419950c0 149863135 C Ci:1:000:0 -32 0
ffff8881419950c0 149863165 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8881419950c0 149863534 C Ci:1:000:0 -32 0
ffff8881419950c0 149974112 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff8881419950c0 149974320 C Co:1:002:0 0 0
ffff888141995000 149974393 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995000 149974575 C Co:1:002:0 0 0
ffff888141995000 149986107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 149986437 C Ci:1:002:0 0 4 = 03011000
ffff888141995000 149986471 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888141995000 149986696 C Co:1:002:0 0 0
ffff888141995000 150038142 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150038648 C Ci:1:000:0 -32 0
ffff888141995000 150038672 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150039032 C Ci:1:000:0 -32 0
ffff888141995000 150039046 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150039358 C Ci:1:000:0 -32 0
ffff888141995000 150150113 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995000 150150417 C Co:1:002:0 0 0
ffff888141995000 150162111 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 150162387 C Ci:1:002:0 0 4 = 03011000
ffff888141995000 150162418 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888141995000 150162648 C Co:1:002:0 0 0
ffff888141995000 150214119 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150214598 C Ci:1:000:0 -32 0
ffff888141995000 150214632 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150214912 C Ci:1:000:0 -32 0
ffff888141995000 150214930 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888141995000 150215314 C Ci:1:000:0 -32 0
ffff888141995000 150318106 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888141995000 150318446 C Co:1:002:0 0 0
ffff8881419950c0 150318517 S Co:1:002:0 s 23 01 0008 0002 0000 0
ffff8881419950c0 150318704 C Co:1:002:0 0 0
ffff8881419950c0 150526102 S Co:1:002:0 s 23 03 0008 0002 0000 0
ffff8881419950c0 150526430 C Co:1:002:0 0 0
ffff8881003dc9c0 150542516 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 150542548 S Ii:1:002:1 -115:2048 1 <
ffff8881419950c0 150630112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff8881419950c0 150630417 C Ci:1:002:0 0 4 = 01010100
ffff8881419950c0 150630450 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff8881419950c0 150630685 C Co:1:002:0 0 0
ffff8881419950c0 150657105 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff8881419950c0 150657423 C Ci:1:002:0 0 4 = 01010000
ffff888141995000 150684024 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 150684290 C Ci:1:002:0 0 4 = 01010000
ffff888141995000 150711108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 150711365 C Ci:1:002:0 0 4 = 01010000
ffff888141995000 150738112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 150738437 C Ci:1:002:0 0 4 = 01010000
ffff888141995000 150738494 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995000 150738692 C Co:1:002:0 0 0
ffff888141995000 150750108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 150750364 C Ci:1:002:0 0 4 = 03011000
ffff888141995000 150750399 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888141995000 150750621 C Co:1:002:0 0 0
ffff888141995000 150802147 S Co:1:000:0 s 00 05 000a 0000 0000 0
ffff888141995000 150802527 C Co:1:000:0 -32 0
ffff888141995000 151006106 S Co:1:000:0 s 00 05 000a 0000 0000 0
ffff888141995000 151006560 C Co:1:000:0 -32 0
ffff8881003dc9c0 151054453 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 151054467 S Ii:1:002:1 -115:2048 1 <
ffff888141995000 151215694 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888141995000 151216068 C Co:1:002:0 0 0
ffff888141995180 151216115 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995180 151216315 C Co:1:002:0 0 0
ffff888141995180 151228102 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995180 151228380 C Ci:1:002:0 0 4 = 03011100
ffff888141995180 151228417 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888141995180 151228638 C Co:1:002:0 0 0
ffff888141995180 151228664 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995180 151228899 C Co:1:002:0 0 0
ffff8881003dc9c0 151310482 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 151310497 S Ii:1:002:1 -115:2048 1 <
ffff888141995180 151430108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995180 151430419 C Ci:1:002:0 0 4 = 03011000
ffff888141995180 151430455 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888141995180 151430693 C Co:1:002:0 0 0
ffff888141995180 151482140 S Co:1:000:0 s 00 05 000b 0000 0000 0
ffff888141995180 151482405 C Co:1:000:0 0 0
ffff888141995000 151496106 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995000 151496622 C Ci:1:011:0 -32 0
ffff888141995000 151496658 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995000 151497138 C Ci:1:011:0 -32 0
ffff888141995000 151497169 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995000 151497486 C Ci:1:011:0 -32 0
ffff888141995000 151606108 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888141995000 151606374 C Co:1:002:0 0 0
ffff888141995000 151618105 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 151618344 C Ci:1:002:0 0 4 = 03011000
ffff888141995000 151618379 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888141995000 151618599 C Co:1:002:0 0 0
ffff888141995000 151670136 S Co:1:000:0 s 00 05 000b 0000 0000 0
ffff888141995000 151670488 C Co:1:000:0 0 0
ffff888141995180 151684039 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995180 151684454 C Ci:1:011:0 -32 0
ffff888141995180 151684532 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995180 151684785 C Ci:1:011:0 -32 0
ffff888141995180 151684834 S Ci:1:011:0 s 80 06 0100 0000 0008 8 <
ffff888141995180 151685618 C Ci:1:011:0 -32 0
ffff888141995180 151791035 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888141995180 151791290 C Co:1:002:0 0 0
ffff888141995000 151792277 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888141995000 151792534 C Co:1:002:0 0 0
ffff888141995000 151792564 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888141995000 151792796 C Ci:1:002:0 0 4 = 01010000


###############################
# Patched - old scheme (6.6.21)
###############################

[  272.774542] usb 1-1.2: new full-speed USB device number 12 using ehci-pci
[  273.185546] usb 1-1.2: device not accepting address 12, error -32
[  273.251550] usb 1-1.2: new full-speed USB device number 13 using ehci-pci
[  273.665491] usb 1-1.2: device not accepting address 13, error -32
[  273.667236] usb 1-1-port2: attempt power cycle
[  274.203558] usb 1-1.2: new full-speed USB device number 14 using ehci-pci
[  274.283841] usb 1-1.2: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[  274.283867] usb 1-1.2: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[  274.309310] cdc_acm 1-1.2:1.0: ttyACM0: USB ACM device
[  274.309355] usbcore: registered new interface driver cdc_acm
[  274.309357] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters

ffff8881003dc9c0 272654268 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 272654316 S Ii:1:002:1 -115:2048 1 <
ffff888145ae1780 272654483 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272654726 C Ci:1:002:0 0 4 = 01010100
ffff888145ae1780 272654739 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888145ae1780 272654993 C Co:1:002:0 0 0
ffff888145ae1780 272655020 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272655255 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 272682096 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272682378 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 272709128 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272709311 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 272736109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272736445 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 272763140 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272763338 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 272763393 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888145ae1780 272763595 C Co:1:002:0 0 0
ffff888145ae1780 272775074 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 272775275 C Ci:1:002:0 0 4 = 03011000
ffff888145ae1780 272775314 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888145ae1780 272775729 C Co:1:002:0 0 0
ffff888145ae1780 272827142 S Co:1:000:0 s 00 05 000c 0000 0000 0
ffff888145ae1780 272827417 C Co:1:000:0 -32 0
ffff888145ae1780 273030123 S Co:1:000:0 s 00 05 000c 0000 0000 0
ffff888145ae1780 273030664 C Co:1:000:0 -32 0
ffff888145ae1780 273239645 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888145ae1780 273239905 C Co:1:002:0 0 0
ffff888145ae1d80 273239949 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888145ae1d80 273240163 C Co:1:002:0 0 0
ffff888145ae1d80 273252126 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1d80 273252423 C Ci:1:002:0 0 4 = 03011000
ffff888145ae1d80 273252447 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888145ae1d80 273252680 C Co:1:002:0 0 0
ffff888145ae1d80 273304146 S Co:1:000:0 s 00 05 000d 0000 0000 0
ffff888145ae1d80 273304402 C Co:1:000:0 -32 0
ffff888145ae1d80 273510101 S Co:1:000:0 s 00 05 000d 0000 0000 0
ffff888145ae1d80 273510377 C Co:1:000:0 -32 0
ffff888145ae1d80 273719545 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff888145ae1d80 273719772 C Co:1:002:0 0 0
ffff888145ae1780 273719812 S Co:1:002:0 s 23 01 0008 0002 0000 0
ffff888145ae1780 273720047 C Co:1:002:0 0 0
ffff888145ae1780 273926112 S Co:1:002:0 s 23 03 0008 0002 0000 0
ffff888145ae1780 273926406 C Co:1:002:0 0 0
ffff8881003dc9c0 273934050 C Ii:1:002:1 0:2048 1 = 04
ffff8881003dc9c0 273934081 S Ii:1:002:1 -115:2048 1 <
ffff888145ae1780 274030115 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274030418 C Ci:1:002:0 0 4 = 01010100
ffff888145ae1780 274030442 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888145ae1780 274030677 C Co:1:002:0 0 0
ffff888145ae1780 274057089 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274057416 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 274084090 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274084322 C Ci:1:002:0 0 4 = 01010100
ffff888145ae1780 274084353 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888145ae1780 274084578 C Co:1:002:0 0 0
ffff888145ae1780 274111090 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274111317 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 274138114 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274138418 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 274165108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274165350 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 274192122 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274192263 C Ci:1:002:0 0 4 = 01010000
ffff888145ae1780 274192320 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888145ae1780 274192521 C Co:1:002:0 0 0
ffff888145ae1780 274204052 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274204382 C Ci:1:002:0 0 4 = 03011000
ffff888145ae1780 274204405 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888145ae1780 274204652 C Co:1:002:0 0 0
ffff888145ae1780 274256143 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff888145ae1780 274256517 C Ci:1:000:0 0 8 = 12010002 02000008
ffff888145ae1780 274256546 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff888145ae1780 274256743 C Co:1:002:0 0 0
ffff888145ae1780 274268088 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1780 274268362 C Ci:1:002:0 0 4 = 03011000
ffff888145ae1780 274268388 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff888145ae1780 274268618 C Co:1:002:0 0 0
ffff888145ae1780 274320112 S Co:1:000:0 s 00 05 000e 0000 0000 0
ffff888145ae1780 274320449 C Co:1:000:0 0 0
ffff888145ae1d80 274334110 S Ci:1:014:0 s 80 06 0100 0000 0012 18 <
ffff888145ae1d80 274334545 C Ci:1:014:0 0 18 = 12010002 02000008 
58060002 00000000 0001
ffff888145ae1d80 274334577 S Ci:1:014:0 s 80 06 0600 0000 000a 10 <
ffff888145ae1d80 274334813 C Ci:1:014:0 -32 0
ffff888145ae1d80 274334843 S Ci:1:014:0 s 80 06 0600 0000 000a 10 <
ffff888145ae1d80 274335150 C Ci:1:014:0 -32 0
ffff888145ae1d80 274335168 S Ci:1:014:0 s 80 06 0600 0000 000a 10 <
ffff888145ae1d80 274335581 C Ci:1:014:0 -32 0
ffff888145ae1d80 274335610 S Ci:1:014:0 s 80 06 0200 0000 0009 9 <
ffff888145ae1d80 274335914 C Ci:1:014:0 0 9 = 09024300 02010080 32
ffff888145ae1d80 274335932 S Ci:1:014:0 s 80 06 0200 0000 0043 67 <
ffff888145ae1d80 274336373 C Ci:1:014:0 0 67 = 09024300 02010080 
32090400 00010202 01000524 00100105 24010001 04240200
ffff888145ae1900 274336803 S Co:1:014:0 s 00 09 0001 0000 0000 0
ffff888145ae1900 274337062 C Co:1:014:0 0 0
ffff888145ae1900 274340120 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145ae1900 274340243 C Ci:1:002:0 0 4 = 03010000
ffff888121658a80 274361461 S Co:1:014:0 s 21 20 0000 0000 0007 7 = 
80250000 000008
ffff888121658a80 274361751 C Co:1:014:0 0 7 >

