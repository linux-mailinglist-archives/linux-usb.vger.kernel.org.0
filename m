Return-Path: <linux-usb+bounces-32429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5DFD305E9
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 12:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9453139D93
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 11:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B39378D68;
	Fri, 16 Jan 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QmQygYmH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15632860B;
	Fri, 16 Jan 2026 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562566; cv=none; b=O7vgXJDNSeMpofFtHlap4w/nwOy2Oo47WhB66UpBlqmQRb0UwSvN9EiqFYvNkaJDeDeA+7CZl07DkTYpyUE+FQHyMW8xReVUEFipOH+WTJR1LpZiNMeYo9yOb1ijEWd5RA5kYTLa1NbX+OuXpuZbvJV/5NJEVDSUzgB/a/j/CiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562566; c=relaxed/simple;
	bh=6Ujq4Addrw0XCnNAiiK6Ccj72MAnyreFhw5bWByKon4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hys/ZkgS1qXvtBAU4y6ewJTg8HCwl3v+Zky1O2uWbkGa5Xdy7e/FvZkmazzMqTth783h2Dcw4xbLRg1KiSLU88pB5IWtNQmP99d3eAAZLSwnBUr2WJT7iqYxAhWHGKJYkDrb8rsZbQEbsytI1Tn2jN1whhkvfMXJfqsR+jFXS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QmQygYmH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E96C116C6;
	Fri, 16 Jan 2026 11:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768562565;
	bh=6Ujq4Addrw0XCnNAiiK6Ccj72MAnyreFhw5bWByKon4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmQygYmHPzBMBjPms9Rc5MUKXFdo1ES0BrLEMouqky+uTK53tMcTdcmVeyeb16+6u
	 0/98HODgbDGGDvEj3qaqU7p62jdDDZ4ItDONe+lG6MX5zOiZ6oc8yH1V6xu4d19TdF
	 TXzz2yDS6YVz97Y13h1SY6/QZgoiLLnvyS/Mw6qk=
Date: Fri, 16 Jan 2026 12:22:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xiaopeitux@foxmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: [RFC] usb: typec: ucsi: Fix array index out-of-bounds in altmode
 registration
Message-ID: <2026011617-phantom-diploma-cd79@gregkh>
References: <176840984804.2144647.10736984532804520381@eldamar.lan>
 <tencent_A6F79CBEAB47840EB720951FA48D97CD4906@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A6F79CBEAB47840EB720951FA48D97CD4906@qq.com>

On Thu, Jan 15, 2026 at 11:32:01AM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> Add boundary check to prevent array index out-of-bounds when PPM returns
> more alternate modes than expected.
> 
> log:
> UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:609:18
> index 2 is out of range for type 'ucsi_altmode [2]'
> CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
> Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
> Workqueue: events_long ucsi_init_work [typec_ucsi]
> Call Trace:
> <TASK>
> dump_stack_lvl+0x5d/0x80
> ubsan_epilogue+0x5/0x2b
> __ubsan_handle_out_of_bounds.cold+0x54/0x59
> ucsi_register_altmodes+0x233/0x250 [typec_ucsi]
> ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
> ucsi_init_work+0x919/0x9b0 [typec_ucsi]
> process_one_work+0x192/0x350
> worker_thread+0x25a/0x3a0
> 
> Reported-by: Salvatore Bonaccorso <carnil@debian.org>
> Closes: https://lore.kernel.org/lkml/176840984804.2144647.10736984532804520381@eldamar.lan
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index a7b388dc7fa0..00575a8720cc 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -599,6 +599,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  		 * incremented.
>  		 */
>  		num = len / sizeof(alt[0]);
> +		if (num > ARRAY_SIZE(alt))
> +			num = ARRAY_SIZE(alt);

As Heikki said, this is a broken hardware device, please fix that
instead as it will not work with any other operating system either :)

thanks,

greg k-h

