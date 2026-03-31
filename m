Return-Path: <linux-usb+bounces-35718-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI3hAZCLy2kuIwYAu9opvQ
	(envelope-from <linux-usb+bounces-35718-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 10:53:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C13667C7
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 10:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44D6C306F4CC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 08:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DFB3E9293;
	Tue, 31 Mar 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hc0P82ui"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140BD37997E;
	Tue, 31 Mar 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946641; cv=none; b=X0dMGARp9JajaEr522/9vAIaVL+KNdKtS42MUiAJ8Q2Wvm/HdG49OCMBCZnWtUuQc+ZNtHSTDCFoYZsP94RzoISn8T4e0+GOVZtNFAfLU99WDWPGZLxZnXLP0otYnMlN/HfXmIMhHbDQG6qN/zYAeZFLUBObx8T+dhFejYSOYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946641; c=relaxed/simple;
	bh=iai/CORVV26S9lAvHgswniAbqaXve9nbtDysFebyyPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl5uMhUgizZ43iz9b9ZXzqp5kBegbwi5sPUWkRnBhVLQay+M4+lNJxFDbfjS8FHrkEGOhfnAxjtwv2w8qQnb3iOnKfKVBvq/Ztopep7j9oyAzpDfYTWwZV0JBiI0Cc8pt2R/deptIj4fUiQkZQU/u0X2e0CJTEWD36lO5n578sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hc0P82ui; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774946569;
	bh=/uvGm2tgjmbaLFdSZktoAKCcvUL0XxD/eA5skeTmt24=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hc0P82uiLXmBwiJ10SpbwQHDWalcrCXctz7gaKpoOfm4zjjAj6BzgzNICUHo//51J
	 RpWJjErLtwfwY8W2MoegH2FS+GeeiEOTwpD8GPKylzrJQdOg96o1lyxHVfbUfdY7vn
	 peY682b1ySOeOmuw5F1A1Ak2HVRgW9AXOFZjsqkc=
X-QQ-mid: zesmtpsz9t1774946567t1dceea17
X-QQ-Originating-IP: Nru55Ic+l8JgLfAeWFW3/2SH3CgH47atZ3QRPmdUeJA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:42:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15209079779085793497
EX-QQ-RecipientCnt: 10
Date: Tue, 31 Mar 2026 16:42:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Chukun Pan <amadeus@jmu.edu.cn>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Message-ID: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
 <20260326100010.3588454-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NZcrde3zhHkVLuLpntG7TPHMdl/gXoK3X6JuO7HIKdI4knYe0zrsChIs
	7SspeR4jWF7D2roKU73d4J4YJUR4bTy7RHBHqUyvUDJP3NeaNey6CJH+lGE90IiJna92yLi
	KjPVHN2vN3zHRMO8JKm7HN1VjUqRJ1T3OYDH/PpBp7n2bwpa2Z0rw35yWOrF1AkBhkfNVpU
	SgZKkMk2Os0i50Lj/JQUipZ1/HwYfXt/OmbSLBos0tR0ijdUid8HLF9wjIZ6dyO+Kg1XLsK
	IWJiLt6hWqJTo/bSH2KxIRr+74AFTQq/VkigDlELyxT1mKBrkS7p1NMyhNYQR5XLsAKt1j+
	BzrPkj3wnzVMXDgUyRWg2MwLBXl6KZuTmCHqTKy89ksWMpxQW3Bd91mVnqh/O5NhKcmhi2p
	Kk4yUpAyPWyMF8QbJEoxUI7ZOT+MbYebexTsTU0al32aCMvkSRSyLWbKWgAfRr8z9eULLmH
	ClLgdO8qhSWtQLvGvqgb2wl18JxFrKyI/kirOeUwWoV/UjbIu9JzB+IkK3ty538DzJDVP8D
	d9j+a/TSUdght6FWAAAggP7rgZex3cWD4JRfrEzOia3SijIuJ9fX5jLJ+KdIhMFqgp45kDY
	gyZW8ywo57bZLjlVsd9H19hvBUqJu/f20o8xBLxwk72ACaj4fn+EjeYhyUtYLiBH8Ro7yMR
	ZXt02fq8RSdb7UxR1rJZM/jvFKC7FI1YH7Amhns7kFiJ6yTH5V6wPhkfAuQpQcstBnMT76l
	uzsYUBHUzIc8k67IlnVvW/rPfI2FvNlR8v0mPoMO/C8TfcgEPfawq+wKdQzhp7GavVOM5w9
	ajjynfQdOXh0KaTDkwSP1EqA4TqrvRv/5toQXhokr/9lqtFUGNmrqxpW4yoBlOzN4tLofp6
	cgJqnJSELzFuE0zIqseff8WfUKYf3X2uXcwjBLdyDOkvTdHTTeDnQkiVXXo48KCkoDCuEqb
	auD8pBYf4QDAtqeB6Q19tzPCbctSjJNaOg238B0Le/hCWScmk4IBOEpGenjp/N1sY+Mt2wu
	pVx+yINUpeDU6glKtmzfXFjpKM+YZKdz0XfbcNsocz1jd6aZ9b
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[spacemit.com];
	TAGGED_FROM(0.00)[bounces-35718-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spacemit.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,jmu.edu.cn:email,linux.spacemit.com:dkim]
X-Rspamd-Queue-Id: 004C13667C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 18:00:10 CST, Chukun Pan wrote:
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..64f5e9f20663 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,8 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/otg.h>
>  #include "glue.h"
>  
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -69,6 +71,20 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>  	return 0;
>  }
>  
> +static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +
> +	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
The logic looks good, but the structure can be further improved to better align with
standard kernel coding style:

if (usb_get_dr_mode(dev) != USB_DR_MODE_HOST)
  return 0;
> +		int ret = devm_regulator_get_enable_optional(dev, "vbus");
Could you please move the declaration of ret to the top of the function?

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

