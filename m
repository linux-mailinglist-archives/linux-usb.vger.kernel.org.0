Return-Path: <linux-usb+bounces-3093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2599C7F2E33
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2F66281B25
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076704A9BE;
	Tue, 21 Nov 2023 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mb6XfF2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3604A9A7
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 13:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E16C433C8;
	Tue, 21 Nov 2023 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700573115;
	bh=5h1dRKlWyHsnS2iAX+ZBjDivjot+UuM0uKEgmm27lSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mb6XfF2Au4nWSAJGBsxKS/vMcj+cqXxZ/8Xau5tFbJUk54vS5AHF5pdMlnBHdjJK0
	 FOhcdSvbpwK3y7lfPGWA4fyp+/SHtW5M4eV3eAwpDQyGBYzfZS7zF5t78cRw7HKGMs
	 MwKk794GUPEOTmemKRUE3bd6p3wVxAto/VFBFW31qPZN2Zgdr8lhXsD1fCtH7486of
	 EtJGrTL3onmt/tZ4jW6Uty6talm+6Wj5EcOMT0jbCB+NTWQ2VWQpWr4EtJLJlJuj0p
	 00YVYBlaol8ec2holPUtIDPLpPCI5kmTuvyLQl4+k6D8p/0y60fLZ5RdH4nNysYsXS
	 WJdbJToZ/i7KQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5Qkn-0000u4-1j;
	Tue, 21 Nov 2023 14:25:26 +0100
Date: Tue, 21 Nov 2023 14:25:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Puliang Lu <puliang.lu@fibocom.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: modify Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZVyvxbrCxSos0B6W@hovoldconsulting.com>
References: <20231026123506.26453-1-puliang.lu@fibocom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026123506.26453-1-puliang.lu@fibocom.com>

On Thu, Oct 26, 2023 at 08:35:06PM +0800, Puliang Lu wrote:
> Modify the definition of Fibocom USB serial option driver
> FM101R-GL different variants
> 
> - VID:PID 413C:8213, FM101R-GL ESIM are laptop M.2 cards (with
>   MBIM interfaces for Linux)
> 
> - VID:PID 413C:8215, FM101R-GL are laptop M.2 cards (with
>   MBIM interface for Linux)
> 
> 0x8213: mbim, tty
> 0x8215: mbim, tty
> 
> Signed-off-by: Puliang Lu <puliang.lu@fibocom.com>
 
> -#define DELL_PRODUCT_FM101R			0x8213
> -#define DELL_PRODUCT_FM101R_ESIM		0x8215
> +#define DELL_PRODUCT_FM101R_ESIM		0x8213
> +#define DELL_PRODUCT_FM101R				0x8215

You have an extra tab here so that the values are no longer aligned.

>  
>  #define KYOCERA_VENDOR_ID			0x0c88
>  #define KYOCERA_PRODUCT_KPC650			0x17da

Now applied with a slightly updated commit message:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=a1092619dd28ac0fcf23016160a2fdccd98ef935

Johan

