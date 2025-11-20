Return-Path: <linux-usb+bounces-30775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39FC73146
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 10:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 85301343A72
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 09:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8771A2D0298;
	Thu, 20 Nov 2025 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxzByf2d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE07372AB5
	for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630288; cv=none; b=taxmBlvt+Up69cp6GQnlXXrBs6lsNZ2/vw5ExSD1mudEjSd7q6T4HvTssYggHs4tDx9AOJ8AdyXqOkwGh9W3HExM38zCaosnxqtfX51nxH4FsacJUIXGVEnmwX3SSKRypBv2V0PIjpAuo0XBfcu6klq/ci4vk5O1/fvoThesGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630288; c=relaxed/simple;
	bh=cOCZIxwjKMi3bYiXetHKPNouQTg+nLQHAL2FKWDV1+w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnBrMsL8cRJap9HFA/5bOX4yF3MU3o5rHRLkKslLziWhKUbfLfH0pf0hkhTsPdsKcVDaQ0LFLZ+RZpunLIqJkH1s5gRvmdoL0RBDaRcu1dvZcDGa4773jawEdnbIMkqtZblJa9cia0EPfLN64694E2o9UK9CuFtPn+DI4s42vWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxzByf2d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477aa218f20so3953925e9.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 01:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763630284; x=1764235084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/8wHSFGo4XpBnjotrRiitIWkuRDZTnNB1ymCbgQE6s=;
        b=FxzByf2drzUM0Z8/WLsg9656XRcRESaveQeUN0OT6kY/6IIIwb2riLRED2CzfYWAof
         DSLxAdHFCsf45Iurp3zKsuHW4lG3AdTmfpApOiofJroZBfjvvg+/jbzF/ONetEG6h1tN
         i5jcqoSHf9XqWOF9YQ8EORy0DBk9+f/2niJjw1gliTuXWb64TBXpTg2+UC3kq3SK+Fr5
         M38yYss5FDx1L64aJRrNKJbiCVgOpf4FkQF4Zzq4oa0mcW09badmEIxwoM9aGtDDEXy5
         oTkx+Ad9UPp/mpgsihbsvtBRPuigIsZ2p2DIe7o3lziV7bhN0D5InbM0DCb0vdywpnGs
         v0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630284; x=1764235084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/8wHSFGo4XpBnjotrRiitIWkuRDZTnNB1ymCbgQE6s=;
        b=T25+VT4MUm2sQb7A97lQ0s3kZkVo4qP0MoFUU18fBHEK/3iZQJ3dgXCAPUfo7fcgKV
         mpl9n/1onB3ccClWdttmNczI9/7I3fKOALZcrd+iWnVeI9TGr8MUOgw0T4OQJKmJIIQp
         F00af7X0IZ7jSgpKD+BC6fKxSqrvfeM/fnfHzBbl09hbU0bst1zzw+3VSrGhPwRK0Xzx
         LH1T0ohxt4inlD7WMJxBpWcJpqNjpJRD9HvNuLClGogujaLdgsEcg2kxdO/Hu7BmPfeW
         nW6g2l8Cy6yprznsS0mrFDRVCAtk+OiqR5foBQHvzQ+TIPAL1tNHd10ORl16q5l90d5p
         Z5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWOkFB5zrcz9HcNYDbid/LA1+pHN2lak42cPNze4IglfcsHY0bv6IHShNTuX3e2zqP+PhaSWzmSV/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCaAgpBNtLhWiP+B8A+UQ8Ir9+TD0jCs+WGqDX3Q1sbYXMH7M
	yHAwpouogcaodTIaZBkLN1eDDe1Rbps/OAJ3PyYHC5SQxXQna6VBt0tbzQ323g==
X-Gm-Gg: ASbGnctMAVmX1q/vb7qeeMrW04aR1txpNsFIEb2ObdyICBc6ajsEeRd/h9fnjMsc9mm
	kafYcEMomJcHZlQlMZNpgx+K2ze4zDyj5Wl9NLO1y87X3fBfNB4/v0P6vEAV9JR0hnCVcIVUR1O
	qj1INeoHcp9+Z4M43OpJk830YwYee1KWabSTy9ihJhdJBUh4Eybe4GiUEinEKpJIj/yc+CGXBYR
	Va0YY8nEScL1LsZVnKK08WbxArhcvp8SsY3r45mpnTsIVvQNDNYj2qAeSSOn2RFKFtRuAVrNt+K
	F4e/K4bf+du81qDD8BY23rK2bQw/R7LG9LQ0+pBxQyh/PE7jnOVTaxF4Ja5oKwTiEQCvPA9pOYw
	ifXBKZkFSx0H5gjfmjpHlWXqoAoshhrXN5O2/3Skm5MKq58kkskgcNrRdYmRYsBLkC9ip0XziZX
	H8AMQ4vwVBu4hnIl7T2oeO47hm7LI2ZhCxKZu2xUD3JcePhLAxBaGm
X-Google-Smtp-Source: AGHT+IFB4woOW3FzxtKhlFfktUD86/qnlFtEe68TjnX8yUVs4orgmTuNUXZKUmsoHXgKwc2KIfzPnA==
X-Received: by 2002:a05:600c:450a:b0:471:672:3486 with SMTP id 5b1f17b1804b1-477b9dfa9d9mr17462695e9.15.1763630284235;
        Thu, 20 Nov 2025 01:18:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a973390csm59748875e9.4.2025.11.20.01.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:18:03 -0800 (PST)
Date: Thu, 20 Nov 2025 09:18:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 28/44] drivers/usb/storage: use min() instead of min_t()
Message-ID: <20251120091802.0b238c96@pumpkin>
In-Reply-To: <4208129f-a768-44e2-843f-309c50ea362f@rowland.harvard.edu>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-29-david.laight.linux@gmail.com>
	<4208129f-a768-44e2-843f-309c50ea362f@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Nov 2025 21:59:42 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, Nov 19, 2025 at 10:41:24PM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
> > Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
> > and so cannot discard significant bits.
> > 
> > In this case the 'unsigned long' value is small enough that the result
> > is ok.
> > 
> > Detected by an extra check added to min_t().  
> 
> In fact, min_t(T, a, b) cannot go wrong as long as all the types are 
> unsigned and at least one of a, b has type T or smaller.

That is backwards, both a and b have to have types at least as large
as T (or rather values that will fit in T).
- which is exactly what people keep getting wrong.
Consider:
	u32 a = 4;
	u64 b = 0x100000001ull;
then:
	min_t(u32, a, b)
has value 1 not 4.

	David

>  Of course, in 
> this situation there's no reason not to simply use min().  (And if both 
> a and b have types larger than T, why would someone use min_t() like 
> this in the first place?)
> 
> Regardless, the patch is fine with me.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Alan Stern
> 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  drivers/usb/storage/protocol.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/storage/protocol.c b/drivers/usb/storage/protocol.c
> > index 9033e505db7f..0cff54ad90fa 100644
> > --- a/drivers/usb/storage/protocol.c
> > +++ b/drivers/usb/storage/protocol.c
> > @@ -139,8 +139,7 @@ unsigned int usb_stor_access_xfer_buf(unsigned char *buffer,
> >  		return cnt;
> >  
> >  	while (sg_miter_next(&miter) && cnt < buflen) {
> > -		unsigned int len = min_t(unsigned int, miter.length,
> > -				buflen - cnt);
> > +		unsigned int len = min(miter.length, buflen - cnt);
> >  
> >  		if (dir == FROM_XFER_BUF)
> >  			memcpy(buffer + cnt, miter.addr, len);
> > -- 
> > 2.39.5
> >   


