Return-Path: <linux-usb+bounces-31891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA200CF0DA3
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 12:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A44C030071AE
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 11:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE042882AA;
	Sun,  4 Jan 2026 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="TcgHk8Qs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49207.qiye.163.com (mail-m49207.qiye.163.com [45.254.49.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A14A3E;
	Sun,  4 Jan 2026 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527537; cv=none; b=qU0HcGiSKmGkDgzqFSbqv6WMC8nNub3HQtwlSkBB2f7k3E4oP1tgvHmrs50VVnRuBYEGO2hBAX54pEdEqWwM2RYNxhOf2EIAvRmzO8gnQmQJ5igFnmSISYoLh69wv2fu4g1kTsIViPkiKONHi2DW4HSbv93caUdf1JlDdvxx4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527537; c=relaxed/simple;
	bh=edKL4RsK/Yy+74lxyD90zDBaZQlNayes3zHKhT/d/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=anb/uf5Kdl8bWbWtSTXik4sFHbgnLROGHuW0fhed1fAjaK8ZTwFnIWQEfDBSC/iwsLVf51auAsJjbp9RrmYufp/SchPzM8mJw3iEmOzx9/kirFdGL/poxMvgW3L+VCWAdF1M9sCnT8zcAg3HZ5PQqUBkJj7PG/mykZGU8ZXKdU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=TcgHk8Qs; arc=none smtp.client-ip=45.254.49.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f6f5a8fb;
	Sun, 4 Jan 2026 19:46:54 +0800 (GMT+08:00)
Date: Sun, 4 Jan 2026 19:46:52 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-usb@vger.kernel.org, si.yanteng@linux.dev, alexs@kernel.org,
 dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
Message-ID: <20260104194652.000058a7@leap-io-kernel.com>
In-Reply-To: <7adbcb46-1511-4840-9e12-811c7a664c56@gmail.com>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
	<7adbcb46-1511-4840-9e12-811c7a664c56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b88d4eef809d5kunm74b6fce15f92bf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkJOVh5JSkxPTBkaTUwfHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=TcgHk8QskSbS2C6uUbjGapDePoNfGzOnrH8EYk0MRLGxrFAtOuruJu+8Z7Mo1ZsvVF26rOHGqmM7RcaoPcrrZWd7ahFYYRdb3VKrT+iyu56NXD5xAQDLkJaSkjpCEQzukJrqCzXkXZWMLJzlYp1W26uaA0/s7BN7N4JYLPuZBVr2PrIatDanKzCulgNu/XcBS3nTeCK/Sz0GufS6R4/lsr4ZxR6ivhQQcGcYJQYczmIX/e6X+bfqCfUJEBnZzuWMh7Dug6Tx2FY7hNJHO3z430gzLahNEKoH56A6bUx44Zvi14HHe9bYpYSZ9oytzYu9FUo8Hkfg5da4gfp8pxQ66Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=RfKkTpoUXMtU9jEqE0TaczqUcpHlcDLem5rhdhYyUlA=;
	h=date:mime-version:subject:message-id:from;

On Tue, 23 Dec 2025 21:39:41 +0800
Alex Shi <seakeel@gmail.com> wrote:

> Hi Kefan,
> 
> There are too much whitespace errors.
> Please resolve the problem and send again.
> 
> Alex
> 
> $b4 shazam 
> https://lore.kernel.org/linux-doc/cover.1765180570.git.baikefan@leap-io-kernel.com/
> 
> /home/alexshi/linux/.git/rebase-apply/patch:89: indent with spaces.
>                                  # FIXME: 确保没有人能够挂载它
> /home/alexshi/linux/.git/rebase-apply/patch:94: indent with spaces.
>          echo "We are good, connected"
> /home/alexshi/linux/.git/rebase-apply/patch:95: indent with spaces.
>          umount /mntpoint
> /home/alexshi/linux/.git/rebase-apply/patch:96: indent with spaces.
>          # 添加一些额外的内容，以便其他人也可以使用它
> /home/alexshi/linux/.git/rebase-apply/patch:98: indent with spaces.
>          echo 0 > authorized
> warning: 5 lines add whitespace errors.
> /home/alexshi/linux/.git/rebase-apply/patch:395: indent with spaces.
>           hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
> /home/alexshi/linux/.git/rebase-apply/patch:396: indent with spaces.
>           if (hdr->type == '@')     // 填充包
> /home/alexshi/linux/.git/rebase-apply/patch:397: indent with spaces.
>              continue;
> /home/alexshi/linux/.git/rebase-apply/patch:398: indent with spaces.
>           caddr_t data = &mmap_area[vec[i]] + 64;
> /home/alexshi/linux/.git/rebase-apply/patch:399: indent with spaces.
>           process_packet(hdr, data);
> warning: 5 lines add whitespace errors.
> /home/alexshi/linux/.git/rebase-apply/patch:67: indent with spaces.
>          - 3Com GmbH捐赠了一台ISDN Pro 
> TA，并在技术问题和测试设备上提供支持。
> /home/alexshi/linux/.git/rebase-apply/patch:68: indent with spaces.
>            我从未想到能获得如此慷慨的帮助。
> /home/alexshi/linux/.git/rebase-apply/patch:70: indent with spaces.
>          - USAR Systems提供了优秀的USB评估套件，使我们能够
> /home/alexshi/linux/.git/rebase-apply/patch:71: indent with spaces.
>            测试Linux USB驱动与最新USB规范的兼容性。USAR Systems
> /home/alexshi/linux/.git/rebase-apply/patch:72: indent with spaces.
>            认识到开源操作系统的重要性，并提供了硬件支持，感谢他们！
> warning: squelched 57 whitespace errors
> warning: 62 lines add whitespace errors.
> 


Hi Alex,

Sorry for the late reply — I’ve been tied up with other work recently.

Thanks for pointing this out.

I tried to reproduce the whitespace warnings you mentioned, 
but unfortunately I’m not able to see them on my side.

I tested the patch set with:

1. linux-next with the latest mainline tree
2. b4 shazam
https://lore.kernel.org/linux-doc/cover.1765180570.git.baikefan@leap-io-kernel.com/
3. scripts/checkpatch.pl --strict run on all the patch files


Given that no "indent with spaces" or other whitespace warnings
were reported, I suspect this may be environment- or tooling-related.

To help me narrow this down, could you please let me know:

1. the exact tree you are applying against (commit or branch)
2. the exact command sequence you used before running b4 shazam
3. whether any whitespace-related git config is set (e.g.
core.whitespace, apply.whitespace)


Thanks for taking the time to review this.

Thanks again
Kefan

> 
> On 2025/12/8 17:25, Kefan Bai wrote:
> > This patch set adds Chinese translations for the USB documentation.
> > 
> > Changes in v5:
> >   - Ensuring that the index.rst entries, including acm,
> > authorization, chipidea, dwc3, ehci, and usbmon, are placed in the
> > correct patches to prevent build errors when patches are applied
> > individually.
> >   - Remove extra spaces in chipidea.rst.
> >   - Send these translation patches tolinux-usb@vger.kernel.org for
> > review by Chinese-speaking developers, per Alex and Yanteng's
> > recommendation.
> > 
> > Changes in v4:
> >   - shorten those overlong title underline/overline symbols
> >   - Remove CREDITS section from index.rst
> >   - Link to
> > v4:https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io-
> > kernel.com/
> > 
> > Changes in v3:
> >   - Updated the signoff to my full legal name,
> >     as requested by Jonathan Corbet.
> >   - Reviewed and fixed the RST syntax to resolve the patch issues
> >     noted by Alex Shi.
> >   - Kept the number of translated files to eight
> >     to make submission and review smoother.
> >   - Link to
> > v3:https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-
> > kernel.com/
> > 
> > Changes in v2:
> >   - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
> >     to include corresponding updates in
> >     Documentation/translations/zh_CN/subsystem-apis.rst.
> >   - Link to
> > v2:https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-
> > kernel.com/
> > 
> > v1:
> >   -
> > Link:https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-
> > kernel.com/
> > 
> > Kefan Bai (8):
> >    docs/zh_CN: Add index.rst translation
> >    docs/zh_CN: Add acm.rst translation
> >    docs/zh_CN: Add authorization.rst translation
> >    docs/zh_CN: Add chipidea.rst translation
> >    docs/zh_CN: Add dwc3.rst translation
> >    docs/zh_CN: Add ehci.rst translation
> >    docs/zh_CN: Add usbmon.rst translation
> >    docs/zh_CN: Add CREDITS translation
> > 
> >   .../translations/zh_CN/subsystem-apis.rst     |   2 +-
> >   Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
> >   Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
> >   .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
> >   .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
> >   Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
> >   Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
> >   .../translations/zh_CN/usb/index.rst          |  54 +++
> >   .../translations/zh_CN/usb/usbmon.rst         | 380
> > ++++++++++++++++++ 9 files changed, 1268 insertions(+), 1
> > deletion(-) create mode 100644
> > Documentation/translations/zh_CN/usb/CREDITS create mode 100644
> > Documentation/translations/zh_CN/usb/acm.rst create mode 100644
> > Documentation/translations/zh_CN/usb/authorization.rst create mode
> > 100644 Documentation/translations/zh_CN/usb/chipidea.rst create
> > mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst create
> > mode 100644 Documentation/translations/zh_CN/usb/ehci.rst create
> > mode 100644 Documentation/translations/zh_CN/usb/index.rst create
> > mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst
> > 
> > --
> > 2.52.0
> > 
> 
> 
> 


