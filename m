Return-Path: <linux-usb+bounces-33979-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO5EJzdEqGkfsAAAu9opvQ
	(envelope-from <linux-usb+bounces-33979-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:39:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 068DB201B81
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 571C732D2F70
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 14:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99AE3A257F;
	Wed,  4 Mar 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8xR+BCn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65F3BE15E
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633348; cv=none; b=Hx9XbbenAQ3yzZ3I6OicE1S4znLEg3rJ1xmWu06h9Ba7dzbLb2rR19Ga13Mgv9iPDk1opk8p2GPmQjbhrU+McSHfof38E0eblVBuVL6r+aD6KjETFCMczEkCXHn/CHZ+HmSMspEcfmTtgmyxI/8yLXG7Ao+6uPX2V97QOuZquzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633348; c=relaxed/simple;
	bh=vhHeJAx7W8kHc4oy1VY3wntPPakACgR2tD6XyQ7k04Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPTBc9VMtKf7SotXdBuh9oKpXvQZyKSHiOiK2QlKOfmWevgX38KXG5bIsMzj7YrzEyQZHfT7+zNdQiZyYycDjZHDC6QIZLQrqF4vUWXWHK6drMzdexbFYdhgNghzks+2xKp+wWxnQMD2i9qaNKW1XfeJwkY6S0jZyU1AvzhrvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8xR+BCn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so3617994f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772633345; x=1773238145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ok3awQoCogW8S1ShAt8XB88e4Wbk0ya1rAC1/rcGv44=;
        b=O8xR+BCnTzkscLIf+0KyTFR047K2UG6PFLpNY+KkAa36y2EoQTSmnJrbTCs9Iiq0tj
         xi2fe1trBbJWIQIAtuPtZhsvAvVvyEFa20vayj8MItd6VRrWKfBTdFCCObJp+72Eb8/J
         fZ9I50XW9n1xC3t8HoPMuB5hdVC9jDUfY4OSNLlscbM5/sugd2qPF5x/uBSykbtfKZmY
         MuKT3K1DNJmJoyztBDNjlgM9QDEWTzTv2Elwtyx/StxISVvQAHLMTRUagW1IbCiBmN9d
         iuoXIO9wiTCltFMOOpfmoIaSbW//LAcMd2P6PN6wt5h64f+Ac2eNA/fRwyaz1zOK6KEo
         U2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633345; x=1773238145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok3awQoCogW8S1ShAt8XB88e4Wbk0ya1rAC1/rcGv44=;
        b=j9icilYW/qpbpgp3y7j30aMGRD97SOag50c0t74z/TINycF8SGidcaWFZwtlf8eEBP
         Ug56hWMGlJ3RsnsqUvVjTOyvh/IqbaLDfNF0dOnMkoYx0rhNrvmJK63S6W8wbAD/RcKQ
         07SXhuaX5zHqvGkKAcJNHXt2m7tTJnLgZogV4SLLR3WzNyX5lP9s3DkeCmfpPS+spsrf
         ed0LqKzWO+MGXRME59UmHGEgzOSe4ycKPBkUeqpB1dX9OouCnCVAD1+IYlXIU5+KP7Kk
         NVLO31IJkQytKBPX0qBMzcDXweO1tY4f9qzP6MoO3Aqb+TTJz6mhcNetdHgs8JiU2Ng5
         EKDw==
X-Forwarded-Encrypted: i=1; AJvYcCUobOmmoepPiZMOwN897Fo6nB/0KfpgN6emzkI4/24tfzfI0z5yZpNDYtog+xJPkCrdwlgcrS6tYps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPT+XBLeP9/c5bO9gyVFDnVGvdBbglBxgWLgL0JZVa6vc4vnS
	dQSfsyExlTtY1Z5gHkWchXg2fxFuBOsMXJfU69wECJrUqfevXF/D+4yFz7PykzpMjEiJrmobtQU
	4O3O2
X-Gm-Gg: ATEYQzwzJxKMWv6jMpBvkhkBoayuzv/pUjwGqK9fSEI/JuEdgC6SRKjiRTUf3aI42W+
	TRgwTBobDlw/ck96BcdLP41IWoI5At0p9OKLiqscgBkxm7HF0iBA31tiw4lBGn98mi/2qSTtp3I
	z51QoOu9pxqslZMmoxQkZF2FDtkGiEULwQTg+br/6zYl+XY7LDWobjAf2WMVAMFcC2NCDYEYeF7
	Mr18BqDLs97Y2EEcBfClXBnkNAh2zfdY6JJ/Ts7jbdbg4qg/T0OVLh/06o6/PlTOOGwuYspLdbt
	flRSOqyZza0ubDYlwdb2aWjqM9vGGmdTJ4svZf5Ii7wtsWJsuYlU3KXV5pIFKTOptz/MHXGdn/g
	HcfSc/e8wP5GsldAfPn+hCOpbykQucjoCkFhqtP0TjxmAl8J/8fwHSFWyK1VW2tQeKYR6GLHrly
	edWDF3pQL+UAEwJf3/ASCO6/Ug8pTv
X-Received: by 2002:a05:6000:2507:b0:439:b736:bd0e with SMTP id ffacd0b85a97d-439c80144a0mr4302991f8f.44.1772633342475;
        Wed, 04 Mar 2026 06:09:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ab6ebe56sm32626121f8f.15.2026.03.04.06.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:09:01 -0800 (PST)
Date: Wed, 4 Mar 2026 17:08:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: smatch@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: Smatch: False positive in __dwc3_gadget_kick_transfer()
Message-ID: <aag8-unh5oLLajDh@stanley.mountain>
References: <20260304090408.36774-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304090408.36774-1-zeeshanahmad022019@gmail.com>
X-Rspamd-Queue-Id: 068DB201B81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33979-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:04:08PM +0500, Zeeshan Ahmad wrote:
> Hi Dan,
> 
> I am performing a logic audit of the DWC3 driver and encountered a 
> consistent Smatch warning in drivers/usb/dwc3/gadget.c that appears 
> to be a false positive.
> 
> The warning:
> drivers/usb/dwc3/gadget.c:1691 __dwc3_gadget_kick_transfer() warn: missing error code? 'ret'
> 
> The code:
> 1680:         ret = dwc3_prepare_trbs(dep);
> 1681:         if (ret < 0)
> 1682:                 return ret;
> ...
> 1690:         if (!ret && !starting)
> 1691:                 return ret;

Just do "return 0;"  It's more readable, since it removes a level of
indirection and we don't have to think about what ret is.

I always recall a discuss between my managers:
Q: But if we do that then how will they know where the zero comes from?
A: We'll make our zeroes will *extra* round.  :P

regards,
dan carpenter


