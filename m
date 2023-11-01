Return-Path: <linux-usb+bounces-2437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4ED7DE638
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 19:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C181C20D85
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 18:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99E918E3C;
	Wed,  1 Nov 2023 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57DD13FF0
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 18:59:37 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9113D124;
	Wed,  1 Nov 2023 11:59:32 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyGR3-0006uz-32; Wed, 01 Nov 2023 19:59:25 +0100
Message-ID: <635eb180-0dea-4dc7-a092-be453bf80023@leemhuis.info>
Date: Wed, 1 Nov 2023 19:59:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: dwc3: regression in USB DWC3 driver in kernel 5.15 branch
Content-Language: en-US, de-DE
To: Tomasz Rostanski <tomasz.rostanski@thalesgroup.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>, Linux USB
 <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
References: <bfee63a3-16ee-0061-94c0-9c9af5318634@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <bfee63a3-16ee-0061-94c0-9c9af5318634@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698865172;c25a29ef;
X-HE-SMSGID: 1qyGR3-0006uz-32

On 15.07.23 13:03, Bagas Sanjaya wrote:
> 
> I notice a stable-specific regression on Bugzilla [1]. Quoting from it:
> 
>> The backport commit to 5.15 branch:
>> 9d4f84a15f9c9727bc07f59d9dafc89e65aadb34 "arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes"  (from upstream commit 5c3d5ecf48ab06c709c012bf1e8f0c91e1fcd7ad)
>> switched from "snps,dis-u2-freeclk-exists-quirk" to "snps,gfladj-refclk-lpm-sel-quirk".
>> [...]
>> When the commit is reverted the USB 3.x drives works fine.
> 
> See Bugzilla for the full thread and attach dmesgs.
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: 9d4f84a15f9c97 https://bugzilla.kernel.org/show_bug.cgi?id=217670
> #regzbot title: regression in USB DWC3 driver due to missing gfladj-refclk-lpm-sel-quirk quirk
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217670

Tomasz, it looks like you were really close at resolving this regression
when you submitted the required patches for the 5.15.y branch a few
weeks ago:
https://lore.kernel.org/all/2023090417-silk-parting-36d8@gregkh/

What happened? Did you loose interest? Did you not understand what Greg
asked for? Do you need help?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

