Return-Path: <linux-usb+bounces-31305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE037CAEA73
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 02:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1CE302DB7C
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 01:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903A62FF153;
	Tue,  9 Dec 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xm9NvmrX"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA3227B8E
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765244522; cv=none; b=DaMbYjgNqXgygd70uIpC4K1LnOvk36xEouhslGKRwFF2vXNxPOTlSrbenHj6G6oTSvB4vWtkwk2J3YnKV4aALEaYNlWAc22Q94rRH/HYX7wsB3sd1rCNYTh+qytFOrZ7/MgULcbSQOPfmJchhK7wk8hTv8Br9VfwD5InF4RhkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765244522; c=relaxed/simple;
	bh=UIecw0xWSEMQ3es13jLlIm3kI+J29vMxYJqYLk5rXjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDBJg3+jcPn2Q7DH+yPxTlkNS9GptxGnhe8Xx5M572Mgyb2tAdtGHMdaoWgzTOExi+qwKy0ljzvznUJgW5Y8w8hSh/jPzBFWPrwJBtzkQktDhwmd7vVrAYV31dV8UeKFhlcieFEuJYg89HtYDoz2a4BXMxjTiU7LkevcYluap64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xm9NvmrX; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <3bad1e9e-11e7-44a6-b3d4-f577a505a0fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765244517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inZPceqIsoFJ9YFFGX2x7XBbK6Cma2CS5AFOQfOxu1g=;
	b=Xm9NvmrXqqBvOXQYkyW+X9xaFSGhsug+TG4z0b2sJ69LkyE/BrRctFWjv6Y/XlV3o5VlBO
	F7hf6M6Uy2/uZJqO+EFp6prBTwcDqfpYQDw2s5ZQDei3I2K4gyS6I1+wRjZ1KQQb9qN6Fq
	YjrgDvCRJyGuZlwte9LS/lPsglz4aeI=
Date: Tue, 9 Dec 2025 09:41:51 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/8] docs/zh_CN: Add index.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org
Cc: seakeel@gmail.com, alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
 <874e4d8b28638ff36d0cd9fb76962c23b41cff96.1765180570.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <874e4d8b28638ff36d0cd9fb76962c23b41cff96.1765180570.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/8 17:25, Kefan Bai 写道:
> Translate .../usb/index.rst into Chinese and update subsystem-apis.rst
>
> Update the translation through commit c26cee817f8b
> ("usb: gadget: f_fs: add capability for dfu functional descriptor")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>

Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>

Thanks,
Yanteng

> ---
>   .../translations/zh_CN/subsystem-apis.rst     |  2 +-
>   .../translations/zh_CN/usb/index.rst          | 54 +++++++++++++++++++
>   2 files changed, 55 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/index.rst
>
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index 830217140fb6..b52e1feb0167 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -90,6 +90,7 @@ TODOList:
>      security/index
>      PCI/index
>      peci/index
> +   usb/index
>
>   TODOList:
>
> @@ -104,6 +105,5 @@ TODOList:
>   * accel/index
>   * crypto/index
>   * bpf/index
> -* usb/index
>   * misc-devices/index
>   * wmi/index
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> new file mode 100644
> index 000000000000..a75062cae766
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -0,0 +1,54 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/index.rst
> +:翻译:
> +
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
> +===========
> +USB 支持
> +===========
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +
> +Todolist:
> +
> +*   acm
> +*   authorization
> +*   chipidea
> +*   dwc3
> +*   ehci
> +*   usbmon
> +*   functionfs
> +*   functionfs-desc
> +*   gadget_configfs
> +*   gadget_hid
> +*   gadget_multi
> +*   gadget_printer
> +*   gadget_serial
> +*   gadget_uvc
> +*   gadget-testing
> +*   iuu_phoenix
> +*   mass-storage
> +*   misc_usbsevseg
> +*   mtouchusb
> +*   ohci
> +*   raw-gadget
> +*   usbip_protocol
> +*   usb-serial
> +*   usb-help
> +*   text_files
> +
> +.. only::  subproject and html
> +
> +   索引
> +   =======
> +
> +   * :ref:`genindex`
> --
> 2.52.0
>

