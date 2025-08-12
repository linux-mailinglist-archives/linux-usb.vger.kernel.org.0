Return-Path: <linux-usb+bounces-26749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40884B226A4
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 14:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC322177F14
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 12:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BDE1898F8;
	Tue, 12 Aug 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcEjQ9xl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C68619D06B
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001152; cv=none; b=Sd2NkqsEhRR/YNq1zL9unEaqE4NUSvDxBHOIAqaajuL7wJqB8t7Cchz2HTDGQBKuShjbafnxDeJYC8BXYnkudTFtyV+HdPxPNLZb4yVGl6Ko81jLQBCdwiX3BwiZwCj6yteSfbdBmZZmXdFfzryRRufSdeFJ0sa9tSKY2pdbMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001152; c=relaxed/simple;
	bh=3W+lKOSPaZh8LTiIkoBlcTk+Nfkxsgvl/sa7RCV88+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNFTKuX2DOCZf6Bwy7TGIE9CglJ8ZNTzVscHnSuF0AagK0sZWPkjtA6t1Ga9yFjUeyDYeeLHtdreCQ8qL+qKa2yyvokkPZv/ETCaSjmTT7P8lEsy2K74rx+YyyLXZboMWE0OV8YuxVDB5c1XY/pUzl9NALrxWSzmwqQnnqKNYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcEjQ9xl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F11AC4CEF0;
	Tue, 12 Aug 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755001152;
	bh=3W+lKOSPaZh8LTiIkoBlcTk+Nfkxsgvl/sa7RCV88+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CcEjQ9xlQyxdy0ybqqHobQWTRCGGXn0wvueUtA51pIXPrsEtYpGwPaUUWvwbPUnU6
	 PahZ2Ny29UExvlSfLeNlyzJ2Sn5e92IpRqANq13ZcKPSqh/06luH2J0RCyZiSVuBcB
	 Zp/aRJFV1/Iqs0eoldGBjjfaFGHzMgbXzanSAArMVw3skUcQTKUFbWaM1oTyWSkn6m
	 6yulPtt0zPtVaGNBkqzYdQy5y09a8wghhhl+zOXz3ofVKKAHqsiQmc6W49JMKsavhk
	 YzfeeI4/buxUQYvzay6KyUfDLYR0Bl5TVfKZWiLWBn2GUZMGNV5rZ9oYyA2stW7Frc
	 iPqhQlwH1PDqQ==
Message-ID: <6bb0aa82-31ff-4514-b76c-d2e45d759974@kernel.org>
Date: Tue, 12 Aug 2025 07:19:10 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Use Linux Foundation IDs for XDomain
 discovery
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>,
 Raju Rangoju <Raju.Rangoju@amd.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/25 12:47 AM, Mika Westerberg wrote:
> There are other vendors now that have their own USB4 host router
> hardware so using the Intel donated IDs may confuse users. For this
> reason switch to use USB IDs provided by the Linux Foundation for
> XDomain discovery.
> 
> Link: https://lore.kernel.org/linux-usb/20250722175026.1994846-1-Raju.Rangoju@amd.com/
> Cc: Raju Rangoju <Raju.Rangoju@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/thunderbolt/xdomain.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index b0630e6d9472..fffa28cc491d 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -2562,10 +2562,9 @@ int tb_xdomain_init(void)
>   	 * Rest of the properties are filled dynamically based on these
>   	 * when the P2P connection is made.
>   	 */
> -	tb_property_add_immediate(xdomain_property_dir, "vendorid",
> -				  PCI_VENDOR_ID_INTEL);
> -	tb_property_add_text(xdomain_property_dir, "vendorid", "Intel Corp.");
> -	tb_property_add_immediate(xdomain_property_dir, "deviceid", 0x1);
> +	tb_property_add_immediate(xdomain_property_dir, "vendorid", 0x1d6b);
> +	tb_property_add_text(xdomain_property_dir, "vendorid", "Linux");
> +	tb_property_add_immediate(xdomain_property_dir, "deviceid", 0x0004);
>   	tb_property_add_immediate(xdomain_property_dir, "devicerv", 0x80000100);
>   
>   	xdomain_property_block_gen = get_random_u32();


