Return-Path: <linux-usb+bounces-31018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006CC90772
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEF334E1968
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 01:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7BC1D5ABF;
	Fri, 28 Nov 2025 01:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eg2aLcdU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557F13C8E8
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764291729; cv=none; b=jmCXFseCFy5ZVfOHDH9mwnzB3ChHL6Bm6WqKRoE3apG1PDRsCkqwoiPUSFgFpq/9F02KhCDYp3ylFP1kCeT1S+KkDZM4e9VCBM45FwsZJpWO9wYBSoRS/j8O0eJWDsX8WeMVo+H6S05DUgI9HQLzdRyrIWdLEpFGytM/N/34wYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764291729; c=relaxed/simple;
	bh=/w/13f6Mufr+Fhz0+Wi3GN6jsV0sX3TIONqS65ncsA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkbYJKzT+yUbl71+7POcy+Um9OXllweIBkN2nFg4Wn4I53TvLxCiWhpum1ZCFYg4FiMt6BvQoIl+kkje/ClOaKrqEfcMoRRpSzQj9q6d52r3YbbcMk4qavkAZO2bat8Lau3AoR+xrbVnBELZA77KnKHc5lt1zJGGQEZW/k5SGVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eg2aLcdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DA3C4CEF8;
	Fri, 28 Nov 2025 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764291728;
	bh=/w/13f6Mufr+Fhz0+Wi3GN6jsV0sX3TIONqS65ncsA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eg2aLcdUh7pYZCBlBKEaqc8UVCXxWVQtYlq3BIyGK3zyoD9LXc0EXb+ZiJpylTz2t
	 1Ot9ZrwSYZ61yBORFbaS8f7WTEJKrNVU1fzROHmMO7JP98+6aED2rcUarDAq/jAERm
	 a7tCk32yJYL42gYdFvcfrwXkjDDUUBg1zX4GCtAliXcy8usEbwW5c1Ct81E46SCB/N
	 tihSs1jNTi9IQKG4VvrxFRNc9HkV5p2mkds6jZhEjIQZap9+qMVg5kOHAx/5xFRKBY
	 EPCjnTpxj47ANLAtAihxqajwPf71Ves27XCpd6vvqY/lPa0Ud3bOi8Tk6/ZrfzlnJO
	 NKev6E74CKBuw==
Date: Fri, 28 Nov 2025 09:02:04 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
Cc: "Uri.Trichter@nuvoton.com" <Uri.Trichter@nuvoton.com>,
	"Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	xu.yang_2@nxp.com
Subject: Re: Maintainer of ChipID
Message-ID: <20251128010204.GA2702998@nchen-desktop>
References: <KL1PR03MB7053BF80E52FB7C409F5AD3C85DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <aSe7brbIyYtsO5Ir@nchen-desktop>
 <JH0PR03MB7634B9AA3CA0F0525E37EE7E84DFA@JH0PR03MB7634.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JH0PR03MB7634B9AA3CA0F0525E37EE7E84DFA@JH0PR03MB7634.apcprd03.prod.outlook.com>

On 25-11-27 17:13:40, tomer.maimon@nuvoton.com wrote:
> Hi Peter,
> 
> Thanks for your prompt reply and appreciate your assistance.
> 
> We are using UDC Chipidea driver version 25 (ci_hdrc_npcm) in NPCM BMC SoC and we are facing UDC DMA synchronization issue
> In the UDC Chipidea driver there is WA for version 22 and 24 that running reprime_dtd, not sure why
> https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/usb/chipidea/udc.c#L840
> 
> Do you know if there are any errata list for in UDC Chipidea version25?
> Does the UDC Chipidea driver covering version 25 as well?

Add Yang Xu who may use chipidea IP currently, and describes your
problems in detail please, we may has some ideas.

I think current chipidea driver has covered version 25, and Synopsys acquired
Chipidea IP more than 10 years ago, you may get errata list from
Synopsys.

Peter
> 
> -----Original Message-----
> From: Peter Chen (CIX) <peter.chen@kernel.org>
> Sent: Thursday, 27 November 2025 4:46
> To: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>
> Cc: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; IS20 Avi Fishman <Avi.Fishman@nuvoton.com>; linux-usb@vger.kernel.org
> Subject: Re: Maintainer of ChipID
> 
> CAUTION - External Email: Do not click links or open attachments unless you acknowledge the sender and content.
> 
> 
> On 25-11-26 08:15:50, Uri.Trichter@nuvoton.com wrote:
> > Hi Peter
> >
> > Are you the maintainer for ChipID USB device driver ?
> > If so, we would like a quick help from you
> 
> Hi Uri,
> 
> You could send your question, and see if we could help you.
> 
> --
> 
> Best regards,
> Peter
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.

-- 

Best regards,
Peter

