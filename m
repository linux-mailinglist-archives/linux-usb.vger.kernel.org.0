Return-Path: <linux-usb+bounces-16778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0959B2E9B
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 12:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9401A1F21212
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606081D7E45;
	Mon, 28 Oct 2024 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Guiazq5g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527C41CCB33
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113989; cv=none; b=RzoCqtvJUOuKrRyuNX58Pfw8Bsq3vMv2xVv+mrTPpW/hJK2TM7zjr93qdlFht+2vayqpBOUIM9iNU0KwaBxHsWI2w8mTzqnpwa/YuekY4jh6t3HWz8DQyRNsZR0eb4bOxC4FjvU8X4vW5EJCBHcvd14CMnCoWk44zP0dk7ek6q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113989; c=relaxed/simple;
	bh=RI/WZDjWSeV3lmik23U/6s9UcEi16I8yGMf6yfau7Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AArl1aZQUJ5Fp6r1KpjjY3kBduk5BamrUVrZ501xvb+48JBzHksBj9E3DTGkVh479tVyJSEudiXSoSbU35eooPEqWuuaEa4SPUPq6cE3JwaT308aiPTmpwN2CUnbJ8nX+S/+w9N88ACLA4xi0kljv1POneQwSZw5v3QPgW9VawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Guiazq5g; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7E37B40CE7
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730113978;
	bh=JzxNXM7FBdHzBU4ed+N76o0lIm8Phe9odSLRKppJDMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Guiazq5gQbMOOGEdIV1hSAN9bk+6fMIE6vtFsef0oafUe/TBKsRSJ2zC2+ZCy+/nD
	 qJLzqUkjrfMgVC9lOZSHEFTKrlOatDKgbPfhuNDzn8UcSo3AlVmoMKteJrT06zYqXo
	 Vn983K+MAI8rzyMnU0l6wrKOZGUqsgGZinF9rNBgSPQ0mAb0aVjahspZ+ZE9WGtuUS
	 rZNmsHeHPOiaKs9AVP+HTUb30aEYlrK19T3vyzaAfLFqfMKKSU3fS4+whVGzF3D0gZ
	 dRepctRZIQN3gcThsHPdQGL+uAyhB21BBbzV9lUE/Rg+sNG45MnZNIaCZt06AXx5xz
	 3HikohdeGEAaQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a194d672bso300693866b.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 04:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113975; x=1730718775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzxNXM7FBdHzBU4ed+N76o0lIm8Phe9odSLRKppJDMU=;
        b=H/lRBOpx2VJ5tMkyHtiU8Kdsq/3sMjpg2MdyikgA1miNUdtkHVW2gYzVJYdf3jiatB
         ukMjr5sev2RyDVJWA5bAo0Z1evPhyYvL5FolRwla7veVgMSwozL1Vs/pNnG2HE4FSOIs
         FEGEv5mSfd6FcNcfZDQMc+nTm/EXiz4KuYwluXaIx9v2EbV18kPNzfJ8cxsHPmQNwMgu
         mwdRPar5a6SsoX9/9B/AzBwzqEzNvOYxlhSs6EkhYAfDb31lzk9pAAfRiBw9I4lyolo8
         X96CeJUKEZL501xJSz+AGmI/4llvnUxbjHpiWnMLY+mM5tdwsI6yF5s1hWEJPZHQf1Ve
         x5zQ==
X-Gm-Message-State: AOJu0YyXgdRYzw1tp/e5pciaOzUIb/6rFWPzfI1TPl1d7SkiKpwjnjSj
	fR+lGBTefHzLKI24UGjmGGFOeUj65tK5/Il2rxTHpmmLcKzk3t6CuaogJRUXw2KLc2RP/Ks7TDF
	cMlX/k57f2jGHXiIXQZdVIKll95fFttlUxLBfZnNcUfIqml3RKkAB5bTB+lpX0YUODf9hHk4MDA
	==
X-Received: by 2002:a17:907:a4a:b0:a9a:19c8:740c with SMTP id a640c23a62f3a-a9de615aa25mr685050366b.47.1730113974874;
        Mon, 28 Oct 2024 04:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVz0WFeamsknFdpMEcdnKvo32vfT3FJ89ZxnOYx4Fer5C+hbC7q9XLghKcZ/k6slkjOOMJGQ==
X-Received: by 2002:a17:907:a4a:b0:a9a:19c8:740c with SMTP id a640c23a62f3a-a9de615aa25mr685048266b.47.1730113974444;
        Mon, 28 Oct 2024 04:12:54 -0700 (PDT)
Received: from acelan-precision5470 (43-114-103-145.static.glaslokaal.nl. [145.103.114.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f02954esm368219066b.68.2024.10.28.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:12:53 -0700 (PDT)
Date: Mon, 28 Oct 2024 19:12:51 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Add only on-board retimers when
 !CONFIG_USB4_DEBUGFS_MARGINING
Message-ID: <5iy6z4wdx52zca4whxeq7u2ub3rv3lbppvimlvy36hojj5f7rz@mm5mni4qzo76>
References: <20241028105121.894978-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028105121.894978-1-mika.westerberg@linux.intel.com>

On Mon, Oct 28, 2024 at 12:51:21PM +0200, Mika Westerberg wrote:
> Normally there is no need to enumerate retimers on the other side of the
> cable. This is only needed in special cases where user wants to run
> receiver lane margining against the downstream facing port of a retimer.
> Furthermore this might confuse the userspace tools such as fwupd because
> it cannot read the information it expects from these retimers.
> 
> Fix this by changing the retimer enumeration code to add only on-board
> retimers when CONFIG_USB4_DEBUGFS_MARGINING is not enabled.
> 
> Reported-by: AceLan Kao <acelan.kao@canonical.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219420
> Cc: stable@vger.kernel.org
> Fixes: ff6ab055e070 ("thunderbolt: Add receiver lane margining support for retimers")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Hi AceLan,
> 
> I changed the patch slightly. I wonder if you could try it again?
Yes, this revision also fixes the issue.
Thanks.

Tested-by: AceLan Kao <acelan.kao@canonical.com>

> 
> Thanks!
> 
>  drivers/thunderbolt/retimer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
> index 7db9869a9f3f..89d2919d0193 100644
> --- a/drivers/thunderbolt/retimer.c
> +++ b/drivers/thunderbolt/retimer.c
> @@ -532,6 +532,8 @@ int tb_retimer_scan(struct tb_port *port, bool add)
>  	}
>  
>  	ret = 0;
> +	if (!IS_ENABLED(CONFIG_USB4_DEBUGFS_MARGINING))
> +		max = min(last_idx, max);
>  
>  	/* Add retimers if they do not exist already */
>  	for (i = 1; i <= max; i++) {
> -- 
> 2.45.2
> 

