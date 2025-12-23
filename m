Return-Path: <linux-usb+bounces-31705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC0CD976F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 14:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10BBD3016729
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 13:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183592F616A;
	Tue, 23 Dec 2025 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lz0CiDzt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABBF2E1C6B
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497193; cv=none; b=eQzNh64BlbrHuw2VZMc6YyvTkWE2c+PqzNE4oByMz/D4HEyx0BIOhoFrwGXlkF9KhaYnDtTLAg86nBRf746TFEKW8pERK3ZJ1R2TruSJssEJeIMtltMX33d9iKmfkqELCsAaRtt6/V4+VvGHzzD/cp01/mZQNbp8ihgzJMFS7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497193; c=relaxed/simple;
	bh=Zc8n7QrDhtkC6/epbwmpRihWfplq0T8W9ckDtt0+GRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+sd3LBXME2LG/s1XBraJcLJPldhb0Exk5PcuG7tg3UrumGuLmaKase0TouBS3t9OLeqYTzTP4zkuXBmu1MrSfFRyH+q7WRnGyHsuhAwVnLE/GCuMTy9qxelU7Zk2o+6PTWw1j/yOCgESzNUEHJ3LEuDbytLk+w2W/RhKpd8hu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lz0CiDzt; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fb7704cb4so27610607b3.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 05:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766497191; x=1767101991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naaQXCkEiet36KU5wTYKG8nq6nRc0MulgAo5nyIrg8o=;
        b=Lz0CiDztLHeV1p1D5xjnF5nOpsRZYpzkQbxgEaSTE1i+dsOE6jv0LmR8VxNDy1sBOs
         V+ryj8VHWxurmns5nqtBKqSmRWHMosF/zD5VdcJ5607UIiY5HddlD6g7fWpXz+U5SApb
         c5qmBAkimMgxS2S1+aCY2xv1xya00NPafleL57QDQk1ObbTITo5j/umUOe4IMEzdVfaw
         YxhOOgdoGTyklFkOk5jvwVLJr7EfT/wLN+EKzYmS34qOqPUlhA9GCGN+3foNeBzJ1fCK
         L9KQwzFjUa84jtvdKwokiG1xMEiSK8b2Nod7LrYWrrNI3BKjvqc9eKtGiADs1dGhOJJb
         6fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497191; x=1767101991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naaQXCkEiet36KU5wTYKG8nq6nRc0MulgAo5nyIrg8o=;
        b=bk7MeJvj6ZwbizAGrtzLVVDdM9sLCC6oPau3FeCfc7QGPzwqmj6DDb62kZwhRnsvVE
         eJYB2ZHhHBHbpeI8uvwPXRBPspxqe4TbLZdvNeRi6idqTD72aMmOWNjOmzzDRLtRO9LQ
         g/JtVEuZwK4N7ItLRO7XeuCq58Vo4o8SrXb0NVhF4Zes7plDVwTMR/IE0nFL4EuOVk6s
         Q0sIeO+SJwJGWYV/sjGaI3CrN3hwy/ZvTGQ+3EPy73D9OKUJxh2RiME8NyAcanSWwBKj
         jUq8oYtFq1O2/PE2s+oRLo6lCPHoU7Ndjl2rmB+CBvLzfK2XX91V03SRqCKLR7EH6c9k
         QVQg==
X-Forwarded-Encrypted: i=1; AJvYcCVMc+7Y+13uL/pXbxbJFieDNIpd2IrWhyXS86GaRw47AjNxHldd8jarcFiEyVsI6Oyeo8uA9BMIJ2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSA5DRa8JWWvZAwzXMHT85vVOACAIedrQ6yI7m4byuwGsyLvc
	+LTp+cs8ALJwZdkUpioLwt6t10QMtJXfInrfiMT/OznJgRrGqr2twRA9UZLQsplWDro=
X-Gm-Gg: AY/fxX47vS/meWNUYPe94NWMyi7qh7wlZV8JlMJYt5bfPHF/8/REx6HL003ZRwAU1XR
	KLmoecPlo8yFNQ9wKWvEaNqllYEBWmOoxtL84X0cTAkyygLtQ+bly85UV0Q1aksdm1ntGREx6+j
	dL1ydTMRUF8jb5eF55l4yrA+4EAY9kApGEXZm2diN/G4QXL3wkDh+EYhVvlNyV2SzRgISlPNWWF
	dCdUk6zieDz88DczKEnUPw+kE3cZdFtsi42FRTYIAY4KoVQZLTqT6Qk9IM9wvUtOT5+MErF0ik6
	oFMJs4baZ1SlKX2EjIRmHo3Qs61mp67TCjHnTmcOB3jyCIbK8VOyuvnykqfgLmWBpIDPYA5zbpk
	82pyMAfB8Qa0i10v++aZ6EGvSLXbE/aPwIb3ywWYVDaJYQLq9aUrG1v4HXNv1RKDI9yO0dgFHPC
	7D9S1TCFjlr1FwQAfwQWDowKZtKnR10uwlDS2XbQ==
X-Google-Smtp-Source: AGHT+IHcqm4a3kD3JWcnVEzlP7OHC2SatzSCl3Ulw/JG8bjOMyeihUmamsTRWu1MVuqw6v4CAkV2Lg==
X-Received: by 2002:a05:690c:67c3:b0:78c:64c1:c007 with SMTP id 00721157ae682-78fb3f2d8a8mr131833077b3.28.1766497190828;
        Tue, 23 Dec 2025 05:39:50 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43bb8d9sm53954977b3.20.2025.12.23.05.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:39:50 -0800 (PST)
Message-ID: <7adbcb46-1511-4840-9e12-811c7a664c56@gmail.com>
Date: Tue, 23 Dec 2025 21:39:41 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev
Cc: alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <cover.1765180570.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kefan,

There are too much whitespace errors.
Please resolve the problem and send again.

Alex

$b4 shazam 
https://lore.kernel.org/linux-doc/cover.1765180570.git.baikefan@leap-io-kernel.com/

/home/alexshi/linux/.git/rebase-apply/patch:89: indent with spaces.
                                 # FIXME: 确保没有人能够挂载它
/home/alexshi/linux/.git/rebase-apply/patch:94: indent with spaces.
         echo "We are good, connected"
/home/alexshi/linux/.git/rebase-apply/patch:95: indent with spaces.
         umount /mntpoint
/home/alexshi/linux/.git/rebase-apply/patch:96: indent with spaces.
         # 添加一些额外的内容，以便其他人也可以使用它
/home/alexshi/linux/.git/rebase-apply/patch:98: indent with spaces.
         echo 0 > authorized
warning: 5 lines add whitespace errors.
/home/alexshi/linux/.git/rebase-apply/patch:395: indent with spaces.
          hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
/home/alexshi/linux/.git/rebase-apply/patch:396: indent with spaces.
          if (hdr->type == '@')     // 填充包
/home/alexshi/linux/.git/rebase-apply/patch:397: indent with spaces.
             continue;
/home/alexshi/linux/.git/rebase-apply/patch:398: indent with spaces.
          caddr_t data = &mmap_area[vec[i]] + 64;
/home/alexshi/linux/.git/rebase-apply/patch:399: indent with spaces.
          process_packet(hdr, data);
warning: 5 lines add whitespace errors.
/home/alexshi/linux/.git/rebase-apply/patch:67: indent with spaces.
         - 3Com GmbH捐赠了一台ISDN Pro 
TA，并在技术问题和测试设备上提供支持。
/home/alexshi/linux/.git/rebase-apply/patch:68: indent with spaces.
           我从未想到能获得如此慷慨的帮助。
/home/alexshi/linux/.git/rebase-apply/patch:70: indent with spaces.
         - USAR Systems提供了优秀的USB评估套件，使我们能够
/home/alexshi/linux/.git/rebase-apply/patch:71: indent with spaces.
           测试Linux USB驱动与最新USB规范的兼容性。USAR Systems
/home/alexshi/linux/.git/rebase-apply/patch:72: indent with spaces.
           认识到开源操作系统的重要性，并提供了硬件支持，感谢他们！
warning: squelched 57 whitespace errors
warning: 62 lines add whitespace errors.


On 2025/12/8 17:25, Kefan Bai wrote:
> This patch set adds Chinese translations for the USB documentation.
> 
> Changes in v5:
>   - Ensuring that the index.rst entries, including acm, authorization,
>     chipidea, dwc3, ehci, and usbmon, are placed in the correct patches
>     to prevent build errors when patches are applied individually.
>   - Remove extra spaces in chipidea.rst.
>   - Send these translation patches tolinux-usb@vger.kernel.org for review
>     by Chinese-speaking developers, per Alex and Yanteng's recommendation.
> 
> Changes in v4:
>   - shorten those overlong title underline/overline symbols
>   - Remove CREDITS section from index.rst
>   - Link to v4:https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io- 
> kernel.com/
> 
> Changes in v3:
>   - Updated the signoff to my full legal name,
>     as requested by Jonathan Corbet.
>   - Reviewed and fixed the RST syntax to resolve the patch issues
>     noted by Alex Shi.
>   - Kept the number of translated files to eight
>     to make submission and review smoother.
>   - Link to v3:https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io- 
> kernel.com/
> 
> Changes in v2:
>   - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
>     to include corresponding updates in
>     Documentation/translations/zh_CN/subsystem-apis.rst.
>   - Link to v2:https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io- 
> kernel.com/
> 
> v1:
>   - Link:https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io- 
> kernel.com/
> 
> Kefan Bai (8):
>    docs/zh_CN: Add index.rst translation
>    docs/zh_CN: Add acm.rst translation
>    docs/zh_CN: Add authorization.rst translation
>    docs/zh_CN: Add chipidea.rst translation
>    docs/zh_CN: Add dwc3.rst translation
>    docs/zh_CN: Add ehci.rst translation
>    docs/zh_CN: Add usbmon.rst translation
>    docs/zh_CN: Add CREDITS translation
> 
>   .../translations/zh_CN/subsystem-apis.rst     |   2 +-
>   Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
>   Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
>   .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
>   .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
>   Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
>   Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
>   .../translations/zh_CN/usb/index.rst          |  54 +++
>   .../translations/zh_CN/usb/usbmon.rst         | 380 ++++++++++++++++++
>   9 files changed, 1268 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/index.rst
>   create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst
> 
> --
> 2.52.0
> 


