Return-Path: <linux-usb+bounces-28964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA7BC0F16
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 11:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3A2188503F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EF97483;
	Tue,  7 Oct 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnGSit6C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFBE2264DB
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831147; cv=none; b=nQ6h21G7xhGIYr9nyjcXYqaq9aHQKOjyXWe5RPWkfhE+FEUdfrpRQ/ze0/7sRWQlUpZVF/ru1HrmDyezdCzfxQ+1kOdYIBOiYVQuHC1FIEBavcn+PlWIBRYoZpBwePy1zVSr6XT60maOUNm36bXqa3jGfpFLPhsfSUc82LZhmVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831147; c=relaxed/simple;
	bh=r/yrWm/SltBa1RYOkshuOz1CxbiBqZRBwDhl9rwPpzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZDBBh8tAgSu+3FAS0vCLRogbTVItcHnkZj+97hb+20k3k75Y5nLLwJeJC6mjp/f9Qkvh890Ynp0ojJpbbcjz48gXoO0QOPPGLaPVEnAbxiAkrHNnkvmXEhjGZUurtt41Wrqgi8Q7dnuZvVqrch24jF7dZjzFy5gHgsZ39cIY6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnGSit6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4960BC4CEF1;
	Tue,  7 Oct 2025 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759831147;
	bh=r/yrWm/SltBa1RYOkshuOz1CxbiBqZRBwDhl9rwPpzQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PnGSit6Cx1DzsCOQvM3+zqi+yJT6YGgNKa8viTbo+HDG7kp/hfQgZmI1toYtipRIP
	 aAB2/FTrL7rAc9zTHW7okZkq8NNwhLVCFM/6v2j209FbqnctXuMtVfw0wo/qWOCfGI
	 TN9g6MIM1+c0r839rfuHbdb+PHFPSMNZeTcyOUNcs4BDO7TaFH4TRMjXMYfpmhCXMc
	 IL/62SoL8N3a1JHjN12lFm+LkscOyRNNGfu/YDRRaC7+bDWNAcCpsm2jhEJj67OiCH
	 gk19YYXlTQ3TVCzpwHZ6mjLjTrC54mbjoNfJO0fh93D0a8h5OEB1q68+NBcs3xFQ1W
	 cV+2uvUSxMJwQ==
Message-ID: <041e461f-8fec-41ca-a971-2c8a46cbfbbc@kernel.org>
Date: Tue, 7 Oct 2025 11:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: Add x86 dependency for Intel USBIO driver
To: Peter Robinson <pbrobinson@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, linux-usb@vger.kernel.org
References: <20251006213957.15668-1-pbrobinson@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251006213957.15668-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6-Oct-25 11:39 PM, Peter Robinson wrote:
> The Intel USBIO driver is x86 only, other architectures have ACPI
> so add an appropriate depenecy plus compile test.
> 
> Fixes: 121a0f839dbb3 ("usb: misc: Add Intel USBIO bridge driver")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Technically the chip could also be used on other platforms,
but yes in practice it is only used on x86 platforms so
no objections from me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/usb/misc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 09ac6f1c985fd..0b56b773dbdf7 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -182,6 +182,7 @@ config USB_LJCA
>  config USB_USBIO
>  	tristate "Intel USBIO Bridge support"
>  	depends on USB && ACPI
> +	depends on X86 || COMPILE_TEST
>  	select AUXILIARY_BUS
>  	help
>  	  This adds support for Intel USBIO drivers.


