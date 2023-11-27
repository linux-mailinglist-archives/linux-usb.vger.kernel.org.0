Return-Path: <linux-usb+bounces-3356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF67F9FBD
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 13:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1ED1C20DF6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957A7288AE;
	Mon, 27 Nov 2023 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tZRRfmKU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B937135;
	Mon, 27 Nov 2023 04:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701088723; x=1701693523; i=wahrenst@gmx.net;
	bh=rqNqfzT7EUpULUk95uOz6iVY1nF9ZPSpgllv6aJkesU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=tZRRfmKUzLX9Mk5A6iMuHWYOl72DtxMmJsZW8sXw8ffQyCOYfVWtuob2g/jFxDok
	 Z0ppK0Q36D3+b3B0FSMnm7WWx4sDV6JLqQMXSxVeZHTQAVN+Lwi4QcHKJNASNJ62x
	 0ofYPwt9+aHiRJEor+7Vi6nU33U7j34plnokmaenchRNG1uLmv26EvR6hzXHqVHZ8
	 bp+Nw0itHSi0FkqvB69/wwTKHCIJAAds0GTV/Tn9zclkZB+t2FnL6ZLYxHefHKgel
	 F3QlHFg57aysF5q/RYq6Lwf8jB3gvo5oUYoJoeWW2JjhUEGXu0iwSdh8HZDf8kTAp
	 Kc2rZZ4QJHRFUt4/Wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1rOIDu03JV-00sLOj; Mon, 27
 Nov 2023 13:38:43 +0100
Message-ID: <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
Date: Mon, 27 Nov 2023 13:38:41 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Content-Language: en-US
To: Cyril Brulebois <kibi@debian.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231127115538.npv23hhn7jfrk3fc@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qqQMxxXiuefhAI4MUpa9mg0QSbZ7o/Cwle1bUzpr76HCozRCflo
 /qJfOJuftdDid4sc3wBtCJZXcu0nSmcqwXcytU2OXXTdFGq4Tqq5aae6jA3PsOTgd8mDZyQ
 HrxWErFT9dHnUVa38+mBnTHr4bsvgMOosVXaslLGNor3BF1qUOpmp8He7ocCu7axi/8aJvl
 xh7JdvUN2dUplPfNom27w==
UI-OutboundReport: notjunk:1;M01:P0:islNlAp+2E0=;vzyfTGE3XXlMSBYFbXWmzfvaS2a
 k46BJ6kNISLSNdvS2+E7c4KcOgJhR9+d6q8TUZmB8LPC6qe6Bk1gRqG0lxB//ezDsnAztiVPi
 psQYwX99cEdT44wfBdNtGQP62NVI2VrzM796aYrcOsI2SIzjHJwvXEJA4LyNyxCa89p4eQORQ
 gW2f5BYhUnA4ordKS1dcqhurbn+Eg+E8arAE84JwdTwpi/vxEMoxKo9kyxb4LGTVZdrJJih1O
 722PuL3k61YfgFBwqo7/bhz4vs1c2owcil4qpRaicaEw/8zO1lfGaIsl68lVEUXdAsfZyu1+K
 pw8rPF9svfKDrrLLgYibnxraTzcKg4Gncc89AT02z5/ahx7TmIcVhsoToErO/nAnjHfnfGIBq
 UEWPj8OlsOgAPB3zW/H3SQIWgGcVGV9Jku458xf6rzos+21zuRF4CwtvfnA7aZ1lkSq2/8Jk6
 F9TxzZcB+9/KJGLj8453ehTwpC4ASEEkM+28bmA+rpF9VLAPr/3VFNopKHvfL1pW36KpJUjOE
 /fIBh+WLMwxArgKlC/YILaKJcHf8FI4WmnIpzmOlvVkR+jMGb3q5YFho/jy4DuHVNMMFQH784
 YZ0GGmBTOG59C0gMommi4pq4jP78QOE2vcxlGpGlXnAH1jxkb5vvVkzsm15jsxQhyAmonjWXL
 ZddrA8qn4aPsT0amkfPnnIgFxec4TtxLmQFaEjgSQHcCzJI0ZTzJompIT4xv/fMZLXYwRz3Il
 yBQ04T4KZcj1TxJqprGMCgNLo6qSF1kdITdlb5qiLkLHvM0CUN6RT7ls+TORVwexG/vsgynNc
 UtDrjk82pb2QIbLoA7QGn1cU+pj+AZ5mkzuWjtN65Zi5aXIumEeCrXHPY7JE4EeyDqpHb2903
 rYuX4BPD94YU5f/HGP6/U1uNEWoR9KQ2p2WfUjguBmae531XK5pIFlrUeLBjO6u5YEgpVZ78s
 NMObdUbIUAPMyGju9Cli+MYz9FM=

Hi Cyril,

Am 27.11.23 um 12:55 schrieb Cyril Brulebois:
> Hi Stefan,
>
> Stefan Wahren <wahrenst@gmx.net> (2023-11-27):
>> thanks for testing. Are you absolutely sure that you are using
>> bcm2711-rpi-cm4-io.dtb from the mainline tree?
> I'm pretty sure, yes.
>
> Starting from the unpatched kernel:
>
>      root@rpi4-20231108:~# md5sum /boot/firmware/bcm2711-rpi-cm4-io.dtb /usr/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
>      5cbe07e9f85ddfefd21ffe98bf92f5ea  /boot/firmware/bcm2711-rpi-cm4-io.dtb
>      5cbe07e9f85ddfefd21ffe98bf92f5ea  /usr/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
>
> The second file is shipped by the linux-image package built via `make
> bindeb-pkg`, and sync'd into /boot/firmware as the first one.
>
> After deploying the patched kernel, I'm seeing both files getting
> updated:
>
>      root@rpi4-20231108:~# md5sum /boot/firmware/bcm2711-rpi-cm4-io.dtb /usr/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
>      c6ea63f43dcdf8ecd66dda6c494f52e2  /boot/firmware/bcm2711-rpi-cm4-io.dtb
>      c6ea63f43dcdf8ecd66dda6c494f52e2  /usr/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
>
> Comparing a copy of the first set of files against the refreshed DTB,
> I'm seeing the attached (dt)diff.
>
>> I would expect the following hardware name: Raspberry Pi Compute
>> Module 4 IO Board
> I suppose this is an arm(32) vs. arm64 difference?
>
>   - setup_arch() in arch/arm/kernel/setup.c does this:
>
>          machine_desc = mdesc;
>          machine_name = mdesc->name;
>          dump_stack_set_arch_desc("%s", mdesc->name);
>
>   - setup_machine_fdt() in arch/arm64/kernel/setup.c does that:
>
>          name = of_flat_dt_get_machine_name();
>          if (!name)
>                  return;
>
>          pr_info("Machine model: %s\n", name);
>          dump_stack_set_arch_desc("%s (DT)", name);
>
> So I'd guess you're testing on arm(32) and seeing the name embedded in
> the DTB while I'm testing on arm64 and seeing the name as filled by the
> bootloader?
thanks for your fast feedback. Shame on me, i didn't test arm64 yet.

Could you please provide the following information:

- settings of config.txt
- VC firmware version
- did you use arm64/defconfig or something special?
>
>> Be aware the arm files has been moved into a broadcom subdirectory.
> Thanks for mentioning that, but I've been working on arm64 exclusively,
> and those files have always been shipped in that broadcom subdirectory
> anyway.
>
> With 64-bit capable hardware, I didn't think of mentioning I was testing
> 64-bit kernel and user space (Debian 12, arm64), sorry about that.
No problem

Thanks
>
>
> Cheers,


