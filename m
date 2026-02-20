Return-Path: <linux-usb+bounces-33532-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M/aCbeamGkTKAMAu9opvQ
	(envelope-from <linux-usb+bounces-33532-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 18:32:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C276A169BA1
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 18:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D76730101F5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 17:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC975365A1D;
	Fri, 20 Feb 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LHzRNMze"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2412A23507B
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608752; cv=none; b=QUre+XNWxvnQZa0NSecZRAqfy8NRiNOe5L2NU4pLozPoyQ8wqBlf0+XPUUU0Subqx/BrvdWvcYyF3LTE298WC8Kl8QkveatYn9nrH/gkNHeyKLJIBrfvTgHwSoOKmFgEcnay67Hof63b+tDfyOOg48xnVnE3Ha3reNr8cim04/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608752; c=relaxed/simple;
	bh=nbjMirrCHZOnHuA0WjICsqQ0SanmQXmOvCRsV0ddtRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWLZKpK8lLsrzopIo/bt5EZssH7tW2yeYOM8hwe38f2jh0DG2q4Op7qSyjqaVs5w98lYUlkVN94DCp4U4RTH7mXOjfONewZNMVwMVJ1TJSmfvJE+haCbubUIhpzqfrJXrbylQSfZjdWU6JEMGIkaui2d5n4sxUXdhLHTOqVKagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LHzRNMze; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb49f63238so138755485a.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771608749; x=1772213549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0trHNOrgefpSNI9Sqms7GIwOoQ1xOeXiRaiveU2TCY8=;
        b=LHzRNMze8RyrGsWmZ9i6qgmU8+k5AaCd2RJh9auBMZiNRNN/DzBCIvchALjl07EnzV
         g7FAWHaxp3KOfUczxT+l7Ujp5/TRS/unWyGzgtMwFdfp9DXzkLmpERowyTpuO59qIjWw
         VOEVMuXeY9vEc5mPRyKSIlUwIyWiG+BWiGjxFMrVIZkaVCscuIpwYmGu8s+ZKtakVuZw
         EPEUEVBgP/59XYpQgZCI7MOmaB1UjxSGN52OtSJH5M0kj+7V3mmAxW1F7msMp/d6Nl6Y
         r29iwE1a5ktzB68OrBKltQAET3HdzXldficwd2dIYdmo5vrBn3EdIUy6+/s/tOXn8Vcp
         kDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608749; x=1772213549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0trHNOrgefpSNI9Sqms7GIwOoQ1xOeXiRaiveU2TCY8=;
        b=LP6NPj1y6tdYoQeBEp4j9McYRLnZ+C4x+qhGmj58f2nXp3IcTg8CwTPRbNgpX+/Ulm
         wfsvab4FlGNqgDGwYfiQjY37hk1GRRVhutphkgbx5Cv6I8KwW90hIfClkQS+eePrczYW
         Manz+87cTnqB+huoYOc7EBbT9JO9COLkXT723eV+/S2QbCjoclTDzrTBVA0iDabXRVat
         ZhMEN5HFrC2tNrHM2a3tjWk+TYTtRXhRtcCv5+IIl//h797I3TQ9RORwKLNMKT7xTNP7
         qoj2ba2eEB431PkXbHBbUJotULqcN1FDADpZ2j9BNs7TttOr8JT8W8B1STvsR5VTVBAI
         QdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4a529LnMFbcxa/xnKTdwNlXNfkSuyH4RUQGElVYqgX01JxdMvlh2LlhiadJko259z/L0tVmuFs+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8j5DdmhwbYHnZWCkqT1eMrUBf13VCcstZDlnFb55ImdapaJX
	5ftXYmyD3QgwYr+1UaTo2n+va8+uhIeyRCQvG4fY07JioHbujfIQK12oaTsbn0z1aAunuRzwwNp
	aA04=
X-Gm-Gg: AZuq6aJMOGOB5LeGcZeZebn9dIdJTiRFwQ9nD0AP7kXgWnI4nRftPL4shvcibgxiUsX
	ynC3rlAXZIMM0CxTfcThUZY4x6OvhX54JoJF5H9yYZacLHUyC69pyuHuYWO5mxThvFU8gsorUJS
	TGY1LzjC0HTLF2Mp8Rm9Cb54zGWastD0ucDJeHpWGS4UbazHjnw5/HLP3/uFds0YkWCepnPlvdd
	R3hiTzTZlFV13lPFYfbU1rPGH8MesUn8RWXV0KAg+Ul5uY5OQNWvzCm1xB5FTBrVzKPqMXQ1ndK
	BfgQfwM8skd7683qV1XZN/1Ai68GHTcPiMHEOJR2hm1OEmsg+eSj1qs5WGxaJuFZ8yVBR65Zucg
	wetrdznBs63ZCre7gemXjmWd809NQrmr5ALeYelrMwAtvF/7XGIxck+5W7U/UqtMEzcF80IK3w1
	3lZZo0YXkK5HxXDSzINGsqg14q
X-Received: by 2002:a05:620a:1a85:b0:8c6:c08d:275b with SMTP id af79cd13be357-8cb8ca800cbmr38474085a.58.1771608748986;
        Fri, 20 Feb 2026 09:32:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::4383])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d064007sm2642085a.19.2026.02.20.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 09:32:28 -0800 (PST)
Date: Fri, 20 Feb 2026 12:32:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
Message-ID: <d28ec80d-3083-4217-9923-93872bbbd07e@rowland.harvard.edu>
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33532-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,harvard.edu:email,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: C276A169BA1
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 02:27:02PM +0100, Gabor Juhos wrote:
> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
> 
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
> 
> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-orion.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -12,7 +12,6 @@
>  #include <linux/clk.h>
>  #include <linux/platform_data/usb-ehci-orion.h>
>  #include <linux/of.h>
> -#include <linux/phy/phy.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/io.h>
> @@ -60,7 +59,6 @@
>  
>  struct orion_ehci_hcd {
>  	struct clk *clk;
> -	struct phy *phy;
>  };
>  
>  static struct hc_driver __read_mostly ehci_orion_hc_driver;
> @@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  			goto err_put_hcd;
>  	}
>  
> -	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
> -	if (IS_ERR(priv->phy)) {
> -		err = PTR_ERR(priv->phy);
> -		if (err != -ENOSYS)
> -			goto err_dis_clk;
> -	}
> -
>  	/*
>  	 * (Re-)program MBUS remapping windows if we are asked to.
>  	 */
> 
> ---
> base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
> change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
> 
> Best regards,
> -- 
> Gabor Juhos <j4g8y7@gmail.com>
> 

